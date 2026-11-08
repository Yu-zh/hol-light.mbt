// Load-fidelity test for Tutorial/Custom_tactics.ml: replays tools/ocaml_ref/Tutorial_Custom_tactics_ref.ml
// (keep in sync; refresh with tools/ocaml_ref/refresh_ref.py).

///|
using @testkit {stm, sthm}

///|
test "Tutorial/Custom_tactics matches Tutorial/Custom_tactics.ml" {
  @Custom_tactics.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot", "impconv", "pair", "compute", "nums", "recursion",
      "arith", "wf", "calc_num", "normalizer", "grobner", "ind_types", "lists", "realax",
      "calc_int", "realarith", "real", "calc_rat", "int", "sets", "iterate", "cart",
      "define", "Library/wo", "Library/card", "Library/floor", "Multivariate/misc",
      "Library/matroids", "Multivariate/vectors", "Examples/sos", "Library/analysis",
      "Library/poly", "Rqe/rqe_lib", "Rqe/rqe_tactics_ext", "Rqe/util", "Rqe/rewrites",
      "Rqe/basic", "Rqe/rqe_num", "Rqe/rqe_real", "Rqe/list_rewrites", "Rqe/rqe_list",
      "Rqe/timers", "Rqe/num_calc_simp", "Rqe/asym", "Rqe/rol", "Rqe/poly_ext", "Rqe/simplify",
      "Rqe/lift_qelim", "Rqe/defs", "Rqe/testform_thms", "Rqe/condense_thms", "Rqe/inferisign_thms",
      "Rqe/matinsert_thms", "Rqe/signs_thms", "Rqe/inferpsign_thms", "Rqe/dedmatrix_thms",
      "Rqe/pdivides_thms", "Rqe/main_thms", "Rqe/work_thms", "Rqe/testform", "Rqe/condense",
      "Rqe/inferisign", "Rqe/matinsert", "Rqe/signs", "Rqe/inferpsign", "Rqe/dedmatrix",
      "Rqe/pdivides", "Rqe/rqe_main", "Rqe/make", "Examples/solovay", "Tutorial/Vectors",
      "Tutorial/Custom_tactics",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Tutorial/Custom_tactics")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("SQRT_2_POW", () => sthm(@Custom_tactics.sqrt_2_pow()))
  log.attempt("KOCHEN_SPECKER_LEMMA", () => {
    sthm(@Custom_tactics.kochen_specker_lemma())
  })
  log.attempt("NONTRIVIAL_CROSS", () => sthm(@Custom_tactics.nontrivial_cross()))
  log.attempt("KOCHEN_SPECKER_PARADOX", () => {
    sthm(@Custom_tactics.kochen_specker_paradox())
  })
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
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..10..19..32..53..94..167..solved at 227
      #|Warning: inventing type variables
      #|0..0..2..4..10..20..38..solved at 57
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..4..8..15..25..52..110..178..solved at 278
      #|0..0..1..2..8..16..33..67..120..solved at 137
      #|0..0..1..6..13..29..51..78..143..solved at 166
      #|Warning: inventing type variables
      #|0..0..0..2..4..8..22..43..73..142..237..376..632..979..1471..solved at 1751
      #|0..0..1..2..5..9..15..22..29..36..solved at 45
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..15..23..solved at 37
      #|0..0..0..1..2..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..0..1..2..3..solved at 8
      #|0..0..1..2..5..solved at 13
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..15..29..44..68..108..150..213..348..523..solved at 570
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..1..2..3..solved at 8
      #|0..0..1..2..5..9..15..30..47..76..solved at 121
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..15..23..32..42..65..88..120..160..solved at 204
      #|0..0..1..2..4..9..15..solved at 21
      #|0..0..1..2..6..11..18..solved at 24
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..1..2..3..solved at 10
      #|0..0..solved at 2
      #|0..0..0..0..0..1..3..5..7..9..11..15..19..23..solved at 34
      #|0..0..1..2..5..9..15..28..solved at 48
      #|0..0..1..3..solved at 8
      #|0..0..0..1..2..3..9..17..28..54..solved at 85
      #|0..0..1..2..5..9..15..25..36..50..73..96..127..solved at 164
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..1..3..5..9..solved at 17
      #|0..0..1..2..5..9..15..solved at 28
      #|0..0..0..0..0..1..2..3..7..solved at 15
      #|0..0..1..2..5..9..15..solved at 28
      #|0..0..1..3..solved at 7
      #|0..0..1..2..5..12..22..38..58..82..120..solved at 165
      #|0..0..0..solved at 3
      #|0..0..1..7..18..solved at 25
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..1..2..3..5..7..9..33..60..92..132..187..243..339..444..557..692..880..1076..1383..1735..solved at 1974
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..13..25..42..68..100..151..228..327..481..731..1042..1522..2111..solved at 2813
      #|0..0..1..2..4..9..15..solved at 21
      #|0..0..1..2..5..9..15..23..32..42..63..88..129..181..239..320..422..565..752..992..1271..1654..2104..2683..3373..4228..solved at 5161
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..0..0..3..8..15..29..43..60..85..110..139..solved at 150
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..0..1..2..3..8..15..22..32..44..60..94..128..169..233..297..365..474..589..712..893..1078..1290..1624..1975..2547..3364..4258..5273..6994..8906..11053..14171..17709..21656..27502..33878..solved at 38215
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..5..12..solved at 28
      #|0..0..4..8..20..solved at 42
      #|0..0..3..6..15..38..84..150..239..359..534..802..solved at 889
      #|0..0..3..6..15..38..84..150..240..360..533..800..solved at 887
      #|0..0..solved at 2
      #|0..0..0..0..0..0..1..3..5..8..11..14..20..26..32..235..593..1371..2952..6816..16079..39492..solved at 39691
      #|0..0..3..6..solved at 10
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..13..25..42..68..100..178..287..461..solved at 618
      #|0..0..1..2..5..13..25..42..68..100..181..292..478..solved at 640
      #|0..0..0..2..4..6..11..16..21..58..99..144..232..355..510..743..1032..1352..1775..2318..3004..solved at 3519
      #|0..0..0..2..4..6..11..16..21..58..99..144..232..355..510..743..1032..1352..1772..2309..2980..3910..5103..solved at 6030
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..solved at 2
      #|0..0..3..10..solved at 22
      #|0..0..3..10..solved at 21
      #|0..0..3..10..solved at 14
      #|0..0..solved at 2
      #|0..0..3..10..solved at 24
      #|0..0..3..10..solved at 23
      #|0..0..3..10..solved at 14
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..2..8..14..solved at 27
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 7
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..2..5..solved at 13
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..7..13..19..32..solved at 47
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 7
      #|0..0..1..2..solved at 6
      #|0..0..1..6..12..21..solved at 27
      #|0..0..1..2..solved at 7
      #|0..0..1..2..solved at 6
      #|0..0..1..4..9..21..60..121..287..579..1152..2198..4380..8116..15563..solved at 15679
      #|0..0..1..2..6..11..19..34..49..68..96..124..161..solved at 184
      #|0..0..1..solved at 4
      #|0..0..1..2..5..12..22..38..59..87..133..204..solved at 260
      #|0..0..1..2..6..11..19..34..49..68..93..118..149..208..267..350..solved at 374
      #|0..0..1..2..4..9..15..21..27..33..39..51..63..87..121..155..solved at 168
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..9..15..28..42..solved at 61
      #|0..0..1..2..solved at 8
      #|0..0..1..2..5..10..19..solved at 38
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..2..5..solved at 13
      #|0..0..0..0..1..2..3..6..9..12..17..26..35..46..solved at 59
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..solved at 28
      #|0..0..1..2..5..9..15..solved at 28
      #|0..0..0..0..1..solved at 6
      #|0..0..0..1..3..7..solved at 14
      #|0..0..1..3..7..solved at 19
      #|0..0..1..3..7..solved at 19
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..0..0..1..2..3..4..5..6..10..14..18..31..44..57..solved at 109
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..solved at 11
      #|0..0..2..4..solved at 9
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..1..3..9..16..27..50..98..173..311..solved at 325
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..2..6..11..19..28..37..46..65..84..113..170..227..312..421..530..663..872..1081..1366..1826..2286..2918..solved at 4922
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..3..solved at 8
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..2..solved at 7
      #|0..0..0..2..solved at 6
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..5..solved at 13
      #|0..0..0..0..0..1..4..7..solved at 14
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..5..solved at 13
      #|0..0..1..3..7..15..27..60..110..188..solved at 301
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..1..2..6..11..19..solved at 33
      #|0..0..0..solved at 5
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..0..0..0..solved at 5
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..0..0..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..6..15..solved at 20
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..0..2..solved at 10
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..1..3..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..1..2..5..solved at 13
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..1..2..5..solved at 13
      #|0..0..2..7..14..solved at 22
      #|0..0..1..solved at 5
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 10
      #|0..0..1..3..solved at 8
      #|0..0..1..3..solved at 7
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..15..22..40..85..157..solved at 396
      #|0..0..1..2..5..9..15..22..36..60..96..164..293..480..799..1402..2301..6261..solved at 13795
      #|0..0..1..2..5..9..15..22..36..60..98..168..301..492..815..1422..2325..6289..solved at 12822
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..3..6..13..38..85..196..solved at 540
      #|0..0..1..2..solved at 8
      #|0..0..0..0..3..7..13..solved at 40
      #|0..0..1..2..solved at 7
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 10
      #|0..0..1..2..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..0..3..6..9..23..43..101..180..281..464..837..1354..2275..solved at 2537
      #|0..0..0..2..4..solved at 11
      #|0..0..0..2..4..solved at 9
      #|0..0..1..2..5..19..37..66..104..148..238..375..601..solved at 816
      #|0..0..1..2..5..19..37..66..104..148..241..392..673..solved at 906
      #|0..0..1..2..5..19..37..66..104..148..241..392..673..solved at 897
      #|0..0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..2..solved at 8
      #|0..0..2..9..16..solved at 29
      #|0..0..2..solved at 7
      #|0..0..2..9..16..solved at 44
      #|0..0..2..solved at 9
      #|0..0..2..solved at 5
      #|0..0..0..9..22..43..156..385..724..solved at 2097
      #|0..0..1..3..15..28..155..515..solved at 553
      #|0..0..1..4..solved at 13
      #|0..0..1..3..solved at 10
      #|0..0..1..4..18..33..170..solved at 264
      #|0..0..1..4..solved at 13
      #|0..0..1..5..solved at 14
      #|0..0..1..4..solved at 13
      #|0..0..1..5..solved at 18
      #|0..0..1..3..solved at 12
      #|0..0..1..4..solved at 13
      #|0..0..1..3..solved at 10
      #|0..0..1..4..solved at 15
      #|0..0..1..4..18..33..170..solved at 264
      #|0..0..1..5..solved at 14
      #|0..0..1..4..solved at 15
      #|0..0..1..5..21..38..185..solved at 265
      #|0..0..0..10..25..48..143..304..539..solved at 1405
      #|0..0..1..4..solved at 12
      #|0..0..1..5..solved at 14
      #|0..0..1..4..solved at 12
      #|0..0..1..5..solved at 17
      #|0..0..1..5..solved at 14
      #|0..0..1..6..solved at 15
      #|0..0..1..5..solved at 14
      #|0..0..1..6..solved at 19
      #|0..0..1..4..solved at 12
      #|0..0..1..5..solved at 14
      #|0..0..1..4..solved at 15
      #|0..0..1..5..solved at 20
      #|0..0..1..5..solved at 17
      #|0..0..1..6..solved at 15
      #|0..0..1..5..solved at 20
      #|0..0..1..6..24..43..176..426..solved at 471
      #|0..0..0..10..25..48..143..304..539..solved at 1413
      #|0..0..1..4..solved at 11
      #|0..0..1..5..solved at 14
      #|0..0..1..4..solved at 11
      #|0..0..1..5..solved at 16
      #|0..0..1..5..solved at 14
      #|0..0..1..6..solved at 15
      #|0..0..1..5..solved at 14
      #|0..0..1..6..solved at 19
      #|0..0..1..4..solved at 11
      #|0..0..1..5..solved at 14
      #|0..0..1..4..solved at 15
      #|0..0..1..5..solved at 20
      #|0..0..1..5..solved at 16
      #|0..0..1..6..solved at 15
      #|0..0..1..5..solved at 20
      #|0..0..1..6..24..43..172..422..solved at 475
      #|0..0..0..11..28..53..130..219..334..solved at 688
      #|0..0..1..5..solved at 13
      #|0..0..1..6..solved at 15
      #|0..0..1..5..solved at 13
      #|0..0..1..6..solved at 18
      #|0..0..1..6..solved at 15
      #|0..0..1..7..solved at 16
      #|0..0..1..6..solved at 15
      #|0..0..1..7..solved at 20
      #|0..0..1..5..solved at 13
      #|0..0..1..6..solved at 15
      #|0..0..1..5..solved at 20
      #|0..0..1..6..solved at 25
      #|0..0..1..6..solved at 18
      #|0..0..1..7..solved at 16
      #|0..0..1..6..solved at 25
      #|0..0..1..7..27..48..163..303..solved at 342
      #|0..0..0..1..18..39..95..277..solved at 463
      #|0..0..1..3..17..32..186..631..1360..solved at 1552
      #|0..0..1..3..17..32..186..631..1360..solved at 1512
      #|0..0..1..3..solved at 18
      #|0..0..1..3..solved at 18
      #|0..0..1..4..solved at 12
      #|0..0..1..4..solved at 12
      #|0..0..1..4..solved at 21
      #|0..0..1..4..solved at 21
      #|0..0..1..4..solved at 11
      #|0..0..1..4..solved at 11
      #|0..0..1..4..solved at 21
      #|0..0..1..4..solved at 21
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 24
      #|0..0..1..5..solved at 24
      #|0..0..1..3..solved at 18
      #|0..0..1..3..solved at 18
      #|0..0..1..3..solved at 18
      #|0..0..1..3..solved at 18
      #|0..0..1..4..solved at 12
      #|0..0..1..4..solved at 12
      #|0..0..1..4..solved at 21
      #|0..0..1..4..solved at 21
      #|0..0..1..4..solved at 11
      #|0..0..1..4..solved at 11
      #|0..0..1..4..solved at 21
      #|0..0..1..4..solved at 21
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 24
      #|0..0..1..5..solved at 24
      #|0..0..1..4..solved at 12
      #|0..0..1..4..solved at 12
      #|0..0..1..4..solved at 12
      #|0..0..1..4..solved at 12
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 17
      #|0..0..1..5..solved at 17
      #|0..0..1..5..solved at 12
      #|0..0..1..5..solved at 12
      #|0..0..1..5..solved at 17
      #|0..0..1..5..solved at 17
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 22
      #|0..0..1..6..solved at 22
      #|0..0..1..4..solved at 21
      #|0..0..1..4..solved at 21
      #|0..0..1..4..solved at 21
      #|0..0..1..4..solved at 21
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 24
      #|0..0..1..5..solved at 24
      #|0..0..1..5..solved at 12
      #|0..0..1..5..solved at 12
      #|0..0..1..5..solved at 24
      #|0..0..1..5..solved at 24
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 27
      #|0..0..1..6..solved at 27
      #|0..0..1..4..solved at 11
      #|0..0..1..4..solved at 11
      #|0..0..1..4..solved at 11
      #|0..0..1..4..solved at 11
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 16
      #|0..0..1..5..solved at 16
      #|0..0..1..5..solved at 12
      #|0..0..1..5..solved at 12
      #|0..0..1..5..solved at 16
      #|0..0..1..5..solved at 16
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 21
      #|0..0..1..6..solved at 21
      #|0..0..1..4..solved at 21
      #|0..0..1..4..solved at 21
      #|0..0..1..4..solved at 21
      #|0..0..1..4..solved at 21
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 24
      #|0..0..1..5..solved at 24
      #|0..0..1..5..solved at 12
      #|0..0..1..5..solved at 12
      #|0..0..1..5..solved at 24
      #|0..0..1..5..solved at 24
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 27
      #|0..0..1..6..solved at 27
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 13
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 18
      #|0..0..1..6..solved at 18
      #|0..0..1..6..solved at 13
      #|0..0..1..6..solved at 13
      #|0..0..1..6..solved at 18
      #|0..0..1..6..solved at 18
      #|0..0..1..7..solved at 15
      #|0..0..1..7..solved at 15
      #|0..0..1..7..solved at 23
      #|0..0..1..7..solved at 23
      #|0..0..1..5..solved at 24
      #|0..0..1..5..solved at 24
      #|0..0..1..5..solved at 24
      #|0..0..1..5..solved at 24
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 27
      #|0..0..1..6..solved at 27
      #|0..0..1..6..solved at 13
      #|0..0..1..6..solved at 13
      #|0..0..1..6..solved at 27
      #|0..0..1..6..solved at 27
      #|0..0..1..7..solved at 15
      #|0..0..1..7..solved at 15
      #|0..0..1..7..solved at 30
      #|0..0..1..7..solved at 30
      #|0..0..1..4..solved at 13
      #|0..0..1..4..solved at 13
      #|0..0..1..4..solved at 13
      #|0..0..1..4..solved at 13
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 18
      #|0..0..1..5..solved at 18
      #|0..0..1..5..solved at 12
      #|0..0..1..5..solved at 12
      #|0..0..1..5..solved at 18
      #|0..0..1..5..solved at 18
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 23
      #|0..0..1..6..solved at 23
      #|0..0..1..4..solved at 13
      #|0..0..1..4..solved at 13
      #|0..0..1..4..20..37..217..solved at 270
      #|0..0..1..4..20..37..217..solved at 270
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 13
      #|0..0..1..5..23..42..212..solved at 367
      #|0..0..1..5..23..42..212..solved at 367
      #|0..0..1..5..solved at 12
      #|0..0..1..5..solved at 12
      #|0..0..1..5..23..42..210..solved at 365
      #|0..0..1..5..23..42..210..solved at 365
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..1..6..26..47..205..solved at 322
      #|0..0..1..6..26..47..205..solved at 322
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 13
      #|0..0..1..5..solved at 13
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 18
      #|0..0..1..6..solved at 18
      #|0..0..1..6..solved at 13
      #|0..0..1..6..solved at 13
      #|0..0..1..6..solved at 18
      #|0..0..1..6..solved at 18
      #|0..0..1..7..solved at 15
      #|0..0..1..7..solved at 15
      #|0..0..1..7..solved at 23
      #|0..0..1..7..solved at 23
      #|0..0..1..5..solved at 18
      #|0..0..1..5..solved at 18
      #|0..0..1..5..23..42..212..solved at 298
      #|0..0..1..5..23..42..212..solved at 298
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..1..6..26..47..207..550..1387..solved at 1552
      #|0..0..1..6..26..47..207..550..1370..solved at 1601
      #|0..0..1..6..solved at 13
      #|0..0..1..6..solved at 13
      #|0..0..1..6..26..47..205..548..1385..solved at 1495
      #|0..0..1..6..26..47..205..548..1368..solved at 1547
      #|0..0..1..7..solved at 15
      #|0..0..1..7..solved at 15
      #|0..0..1..7..29..52..200..457..1005..solved at 1237
      #|0..0..1..7..29..52..200..457..982..solved at 1344
      #|0..0..1..5..solved at 12
      #|0..0..1..5..solved at 12
      #|0..0..1..5..solved at 12
      #|0..0..1..5..solved at 12
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 17
      #|0..0..1..6..solved at 17
      #|0..0..1..6..solved at 13
      #|0..0..1..6..solved at 13
      #|0..0..1..6..solved at 17
      #|0..0..1..6..solved at 17
      #|0..0..1..7..solved at 15
      #|0..0..1..7..solved at 15
      #|0..0..1..7..solved at 22
      #|0..0..1..7..solved at 22
      #|0..0..1..5..solved at 18
      #|0..0..1..5..solved at 18
      #|0..0..1..5..23..42..210..solved at 296
      #|0..0..1..5..23..42..210..solved at 296
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..1..6..26..47..205..548..1368..solved at 1490
      #|0..0..1..6..26..47..205..548..1385..solved at 1670
      #|0..0..1..6..solved at 13
      #|0..0..1..6..solved at 13
      #|0..0..1..6..26..47..203..546..1366..solved at 1467
      #|0..0..1..6..26..47..203..546..1383..solved at 1635
      #|0..0..1..7..solved at 15
      #|0..0..1..7..solved at 15
      #|0..0..1..7..29..52..198..455..980..solved at 1148
      #|0..0..1..7..29..52..198..455..1003..solved at 1456
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..1..7..solved at 15
      #|0..0..1..7..solved at 15
      #|0..0..1..7..solved at 19
      #|0..0..1..7..solved at 19
      #|0..0..1..7..solved at 14
      #|0..0..1..7..solved at 14
      #|0..0..1..7..solved at 19
      #|0..0..1..7..solved at 19
      #|0..0..1..8..solved at 16
      #|0..0..1..8..solved at 16
      #|0..0..1..8..solved at 24
      #|0..0..1..8..solved at 24
      #|0..0..1..6..solved at 23
      #|0..0..1..6..solved at 23
      #|0..0..1..6..26..47..205..solved at 322
      #|0..0..1..6..26..47..205..solved at 322
      #|0..0..1..7..solved at 15
      #|0..0..1..7..solved at 15
      #|0..0..1..7..29..52..200..457..1005..solved at 1176
      #|0..0..1..7..29..52..200..457..1005..solved at 1319
      #|0..0..1..7..solved at 14
      #|0..0..1..7..solved at 14
      #|0..0..1..7..29..52..198..455..1003..solved at 1106
      #|0..0..1..7..29..52..198..455..1003..solved at 1268
      #|0..0..1..8..solved at 16
      #|0..0..1..8..solved at 16
      #|0..0..1..8..32..57..193..360..601..solved at 848
      #|0..0..1..8..32..57..193..360..601..solved at 1107
      #|0..0..0..0..solved at 25
      #|0..0..0..0..solved at 16
      #|0..0..0..0..solved at 23
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..3..5..9..solved at 18
      #|0..0..1..2..3..5..9..solved at 17
      #|0..0..2..4..9..15..solved at 25
      #|0..0..2..4..9..14..solved at 22
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..4..solved at 9
      #|0..0..2..10..24..solved at 29
      #|0..0..2..10..22..solved at 27
      #|0..0..4..15..31..solved at 38
      #|0..0..solved at 3
      #|0..0..4..18..43..71..solved at 80
      #|Warning: inventing type variables
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
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..0..1..2..3..4..5..6..10..14..18..34..50..73..103..140..solved at 184
      #|Warning: inventing type variables
      #|0..0..0..2..4..solved at 9
      #|0..0..1..2..5..9..18..28..41..56..75..96..147..solved at 200
      #|0..0..1..2..5..9..22..37..63..96..149..212..307..415..606..821..1211..1654..2338..3131..4216..solved at 5211
      #|0..0..0..solved at 3
      #|0..0..0..0..2..4..6..10..14..18..28..40..54..92..145..220..340..498..710..1038..1477..2067..3174..4809..7105..solved at 7940
      #|0..0..1..3..7..15..26..56..96..158..312..555..939..1625..2723..4404..7487..12300..19950..solved at 22248
      #|0..0..1..2..5..9..15..22..29..55..91..146..239..336..457..617..781..978..1399..1822..2477..3473..4521..6002..7920..10215..13177..20774..29957..44857..70387..105288..162273..251151..386153..solved at 497526
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..11..19..28..37..46..69..92..129..201..277..375..solved at 495
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 8
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..2..8..solved at 19
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..3..solved at 6
      #|0..0..3..10..solved at 24
      #|0..0..2..solved at 9
      #|0..0..2..solved at 5
      #|0..0..3..solved at 6
      #|0..0..3..solved at 6
      #|0..0..3..solved at 7
      #|0..0..3..solved at 7
      #|0..0..4..solved at 7
      #|0..0..4..solved at 7
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..2..8..solved at 21
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..3..solved at 6
      #|0..0..3..10..solved at 26
      #|0..0..2..solved at 7
      #|0..0..2..solved at 5
      #|0..0..3..solved at 6
      #|0..0..3..solved at 6
      #|0..0..3..solved at 7
      #|0..0..3..solved at 7
      #|0..0..4..solved at 7
      #|0..0..4..solved at 7
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..3..10..22..solved at 28
      #|0..0..1..3..9..solved at 18
      #|0..0..1..3..10..22..solved at 28
      #|0..0..1..3..9..solved at 18
      #|0..0..0..solved at 3
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..3..solved at 7
      #|0..0..1..2..solved at 6
      #|0..0..1..3..solved at 7
      #|0..0..2..solved at 5
      #|0..0..1..2..6..11..18..solved at 26
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..1..2..6..11..18..solved at 26
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..2..4..solved at 11
      #|0..0..1..2..solved at 6
      #|0..0..2..5..solved at 12
      #|0..0..1..3..solved at 7
      #|0..0..2..4..solved at 11
      #|0..0..1..2..solved at 6
      #|0..0..2..5..solved at 12
      #|0..0..1..3..solved at 7
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..2..4..solved at 11
      #|0..0..2..solved at 7
      #|0..0..2..solved at 6
      #|0..0..3..solved at 6
      #|0..0..3..7..solved at 14
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..3..7..solved at 12
      #|0..0..3..6..solved at 10
      #|0..0..3..solved at 8
      #|0..0..3..solved at 7
      #|0..0..4..10..solved at 15
      #|0..0..4..9..solved at 13
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..2..4..solved at 11
      #|0..0..2..solved at 7
      #|0..0..2..solved at 6
      #|0..0..3..solved at 6
      #|0..0..3..7..solved at 14
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..3..7..solved at 12
      #|0..0..3..6..solved at 10
      #|0..0..3..solved at 8
      #|0..0..3..solved at 7
      #|0..0..4..10..solved at 15
      #|0..0..4..9..solved at 13
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..2..6..11..17..24..solved at 32
      #|0..0..2..8..16..28..48..solved at 55
      #|Warning: inventing type variables
      #|0..0..1..2..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..1..2..3..solved at 8
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..0..1..2..3..4..5..6..solved at 13
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 7
      #|0..0..1..2..solved at 7
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..0..1..3..7..solved at 14
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..0..2..solved at 6
      #|0..0..1..3..7..12..23..solved at 38
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..1..2..5..10..19..30..49..72..113..174..solved at 213
      #|Warning: inventing type variables
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..5..solved at 11
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..1..2..3..9..17..35..62..101..146..216..292..403..539..solved at 690
      #|0..0..1..8..15..27..61..112..212..374..631..1016..1672..2572..solved at 2632
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..1..2..6..11..19..33..48..65..98..131..178..268..360..516..solved at 698
      #|Warning: inventing type variables
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..4..7..19..solved at 33
      #|0..0..1..2..3..10..solved at 17
      #|0..0..2..4..7..19..solved at 33
      #|0..0..1..2..3..10..solved at 16
      #|0..0..3..6..17..36..64..solved at 95
      #|0..0..2..4..13..27..47..solved at 60
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..11..27..56..102..183..274..437..655..987..1746..2662..solved at 2980
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
      #|0..0..1..2..11..27..57..106..187..276..416..594..882..1624..2521..solved at 2830
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..0..solved at 4
      #|0..0..0..0..1..2..3..solved at 10
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..0..0..1..4..9..18..28..39..58..77..solved at 90
      #|0..0..1..3..7..solved at 17
      #|0..0..1..3..7..13..20..solved at 35
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|0..0..0..0..0..solved at 8
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..1..2..5..solved at 11
      #|0..0..1..2..3..7..14..24..solved at 41
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..0..2..5..8..solved at 14
      #|0..0..0..0..2..5..8..12..16..20..solved at 28
      #|Warning: inventing type variables
      #|Warning: inventing type variables
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
      #|0..0..1..2..solved at 6
      #|0..0..0..2..5..8..solved at 14
      #|0..0..0..0..2..5..8..12..16..20..solved at 28
      #|0..0..2..4..8..18..solved at 29
      #|0..0..2..4..6..12..20..44..102..184..301..484..680..893..1157..1421..solved at 1657
      #|0..0..2..4..6..12..20..44..102..184..301..483..673..876..1118..1360..solved at 1604
      #|0..0..2..4..6..12..20..44..102..184..301..483..673..876..1118..1360..solved at 1606
      #|0..0..2..4..6..12..20..44..102..184..301..484..680..893..1157..1421..solved at 1659
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..3..7..14..solved at 26
      #|0..0..1..2..3..7..14..solved at 23
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..4..8..15..31..62..114..188..297..solved at 359
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..3..7..14..solved at 26
      #|0..0..1..2..3..7..14..solved at 23
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..5..8..17..33..65..120..187..309..solved at 374
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..6..19..47..solved at 70
      #|0..0..2..solved at 5
      #|0..0..1..4..8..solved at 18
      #|0..0..0..0..3..11..23..solved at 40
      #|0..0..2..solved at 5
      #|0..0..2..8..16..32..60..102..170..251..364..539..777..1073..1572..2193..3540..5446..8771..solved at 14020
      #|0..0..2..4..10..18..30..54..80..118..196..310..498..779..1165..1692..2966..4706..7892..solved at 13080
      #|0..0..2..4..10..21..37..66..99..142..227..343..528..786..1121..1561..2846..4551..7699..solved at 13131
      #|0..0..1..2..5..9..15..25..36..50..83..141..247..393..614..906..1838..3167..5801..solved at 10237
      #|0..0..2..solved at 5
      #|0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..2..8..16..35..67..118..197..293..421..592..799..1054..1439..1905..2681..3641..4909..solved at 5707
      #|0..0..2..solved at 5
      #|0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..2..4..10..21..37..70..107..160..257..371..532..776..1052..1428..2135..2933..4086..solved at 4882
      #|0..0..2..solved at 5
      #|0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..2..4..10..24..44..82..126..184..288..404..562..783..1008..1297..2015..2778..3893..solved at 4689
      #|0..0..1..solved at 4
      #|0..0..1..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..5..12..22..41..63..92..144..202..281..393..507..657..1033..1434..2053..solved at 2878
      #|Warning: inventing type variables
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..2..7..12..solved at 18
      #|0..0..2..7..12..20..34..solved at 46
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..7..solved at 13
      #|0..0..2..5..11..solved at 17
      #|0..0..1..3..6..solved at 11
      #|0..0..1..3..solved at 7
      #|0..0..1..2..5..12..solved at 23
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..3..6..solved at 12
      #|0..0..1..solved at 5
      #|0..0..1..3..6..solved at 12
      #|0..0..1..solved at 5
      #|0..0..1..solved at 8
      #|0..0..1..solved at 6
      #|0..0..1..solved at 7
      #|0..0..1..3..7..solved at 12
      #|0..0..solved at 3
      #|0..0..1..solved at 5
      #|0..0..2..6..14..solved at 20
      #|0..0..1..3..7..solved at 12
      #|0..0..solved at 3
      #|0..0..1..solved at 5
      #|0..0..2..6..14..solved at 20
      #|0..0..7..21..55..125..246..589..solved at 980
      #|0..0..8..22..solved at 59
      #|0..0..5..14..40..83..solved at 149
      #|0..0..solved at 3
      #|0..0..8..24..62..136..266..637..solved at 1080
      #|0..0..9..25..solved at 66
      #|0..0..5..13..solved at 25
      #|0..0..5..14..37..78..solved at 139
      #|0..0..2..5..10..solved at 17
      #|0..0..2..5..10..solved at 17
      #|0..0..1..3..10..20..47..92..168..295..564..996..solved at 1100
      #|0..0..2..5..12..solved at 18
      #|0..0..1..2..3..7..12..17..46..95..165..341..solved at 530
      #|0..0..1..2..3..7..12..17..46..95..165..349..solved at 576
      #|0..0..solved at 2
      #|0..0..2..7..17..solved at 37
      #|0..0..0..0..1..2..3..solved at 9
      #|0..0..1..solved at 5
      #|0..0..2..10..22..solved at 47
      #|0..0..1..solved at 7
      #|0..0..2..10..22..solved at 47
      #|0..0..solved at 2
      #|0..0..2..5..12..solved at 18
      #|0..0..1..3..solved at 7
      #|0..0..1..2..5..10..17..30..44..62..85..110..139..186..240..310..400..502..618..778..953..1160..1410..1683..1984..2354..2793..3280..3898..4564..5290..6122..7111..8154..9412..10881..12438..14253..16302..18445..20920..solved at 23327
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..26..37..52..solved at 84
      #|0..0..2..solved at 6
      #|0..0..2..6..12..30..56..97..solved at 181
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..1..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..0..1..2..3..9..15..21..solved at 31
      #|0..0..1..4..solved at 8
      #|0..0..0..1..4..solved at 9
      #|0..0..1..4..12..36..75..185..357..692..solved at 1001
      #|0..0..1..2..3..7..13..21..32..45..59..86..117..154..208..274..346..439..546..solved at 603
      #|0..0..1..2..3..7..13..21..32..45..59..86..117..154..208..274..346..439..546..solved at 599
      #|0..0..1..3..solved at 7
      #|0..0..1..2..5..10..17..26..solved at 40
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..2..8..16..33..61..99..solved at 117
      #|0..0..2..8..16..36..67..107..191..285..391..517..669..837..1115..1441..1803..2313..2907..3545..solved at 4006
      #|0..0..2..4..10..19..32..48..solved at 66
      #|0..0..2..4..10..22..38..56..98..140..224..317..452..613..944..1313..1980..2812..4002..5379..solved at 5798
      #|0..0..1..2..5..10..17..26..solved at 44
      #|0..0..1..2..5..13..23..34..69..104..146..192..245..308..421..544..678..892..1117..1363..solved at 1821
      #|0..0..1..3..solved at 7
      #|0..0..1..2..3..7..13..21..31..43..56..84..116..154..210..278..354..453..568..solved at 669
      #|0..0..1..2..3..7..13..21..31..43..56..84..116..154..210..278..354..453..568..solved at 665
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..2..5..14..solved at 19
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..1..3..8..solved at 19
      #|0..0..3..7..20..46..91..215..418..840..solved at 1224
      #|0..0..2..10..29..72..solved at 90
      #|0..0..2..4..11..21..39..83..149..283..solved at 616
      #|0..0..solved at 3
      #|0..0..4..9..solved at 18
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..7..solved at 16
      #|0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..2..5..10..solved at 16
      #|0..0..1..solved at 4
      #|0..0..2..5..10..solved at 16
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..2..5..solved at 10
      #|0..0..1..2..7..14..27..43..solved at 68
      #|0..0..2..solved at 5
      #|0..0..2..solved at 8
      #|0..0..3..solved at 6
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..0..2..4..6..13..20..27..74..148..314..795..1665..3413..7549..15713..solved at 21919
      #|0..0..1..4..solved at 8
      #|0..0..0..3..8..solved at 18
      #|0..0..2..5..10..28..solved at 34
      #|0..0..3..solved at 7
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..0..2..4..6..13..20..27..74..148..314..795..1665..3413..7549..15713..solved at 21919
      #|0..0..1..4..solved at 8
      #|0..0..0..3..8..solved at 18
      #|0..0..2..5..10..28..solved at 34
      #|0..0..3..solved at 7
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..3..6..solved at 10
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..7..21..36..solved at 43
      #|0..0..3..solved at 6
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..12..31..56..solved at 80
      #|0..0..1..2..5..11..27..48..solved at 66
      #|0..0..1..2..7..solved at 12
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..4..12..23..47..81..133..237..458..solved at 479
      #|0..0..2..4..12..23..47..81..133..237..458..solved at 479
      #|0..0..2..4..6..solved at 11
      #|0..0..1..5..10..19..solved at 26
      #|0..0..1..solved at 5
      #|0..0..1..2..6..solved at 11
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..13..solved at 19
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..13..34..106..solved at 120
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..13..34..106..252..solved at 271
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..13..solved at 19
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..9..15..26..42..68..119..208..373..solved at 554
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 6 critical pairs
      #|6 basis elements and 7 critical pairs
      #|6 basis elements and 6 critical pairs
      #|7 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 5 critical pairs
      #|5 basis elements and 4 critical pairs
      #|6 basis elements and 6 critical pairs
      #|6 basis elements and 5 critical pairs
      #|7 basis elements and 7 critical pairs
      #|7 basis elements and 6 critical pairs
      #|7 basis elements and 5 critical pairs
      #|7 basis elements and 4 critical pairs
      #|8 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|0..0..2..solved at 5
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|5 basis elements and 2 critical pairs
      #|6 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|5 basis elements and 2 critical pairs
      #|5 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|7 basis elements and 8 critical pairs
      #|8 basis elements and 10 critical pairs
      #|9 basis elements and 12 critical pairs
      #|10 basis elements and 16 critical pairs
      #|10 basis elements and 15 critical pairs
      #|11 basis elements and 17 critical pairs
      #|11 basis elements and 16 critical pairs
      #|12 basis elements and 18 critical pairs
      #|12 basis elements and 17 critical pairs
      #|13 basis elements and 20 critical pairs
      #|13 basis elements and 19 critical pairs
      #|13 basis elements and 18 critical pairs
      #|13 basis elements and 17 critical pairs
      #|14 basis elements and 20 critical pairs
      #|14 basis elements and 19 critical pairs
      #|14 basis elements and 18 critical pairs
      #|14 basis elements and 17 critical pairs
      #|15 basis elements and 18 critical pairs
      #|15 basis elements and 17 critical pairs
      #|15 basis elements and 16 critical pairs
      #|15 basis elements and 15 critical pairs
      #|15 basis elements and 14 critical pairs
      #|15 basis elements and 13 critical pairs
      #|15 basis elements and 12 critical pairs
      #|15 basis elements and 11 critical pairs
      #|16 basis elements and 17 critical pairs
      #|16 basis elements and 16 critical pairs
      #|16 basis elements and 15 critical pairs
      #|16 basis elements and 14 critical pairs
      #|16 basis elements and 13 critical pairs
      #|17 basis elements and 16 critical pairs
      #|17 basis elements and 15 critical pairs
      #|17 basis elements and 14 critical pairs
      #|17 basis elements and 13 critical pairs
      #|18 basis elements and 14 critical pairs
      #|18 basis elements and 13 critical pairs
      #|18 basis elements and 12 critical pairs
      #|18 basis elements and 11 critical pairs
      #|18 basis elements and 10 critical pairs
      #|19 basis elements and 14 critical pairs
      #|19 basis elements and 13 critical pairs
      #|19 basis elements and 12 critical pairs
      #|19 basis elements and 11 critical pairs
      #|20 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|5 basis elements and 2 critical pairs
      #|5 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|7 basis elements and 2 critical pairs
      #|7 basis elements and 1 critical pairs
      #|7 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|5 basis elements and 2 critical pairs
      #|5 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|7 basis elements and 8 critical pairs
      #|8 basis elements and 10 critical pairs
      #|9 basis elements and 12 critical pairs
      #|10 basis elements and 16 critical pairs
      #|10 basis elements and 15 critical pairs
      #|11 basis elements and 17 critical pairs
      #|11 basis elements and 16 critical pairs
      #|12 basis elements and 18 critical pairs
      #|12 basis elements and 17 critical pairs
      #|13 basis elements and 20 critical pairs
      #|13 basis elements and 19 critical pairs
      #|13 basis elements and 18 critical pairs
      #|13 basis elements and 17 critical pairs
      #|14 basis elements and 20 critical pairs
      #|14 basis elements and 19 critical pairs
      #|14 basis elements and 18 critical pairs
      #|14 basis elements and 17 critical pairs
      #|15 basis elements and 18 critical pairs
      #|15 basis elements and 17 critical pairs
      #|15 basis elements and 16 critical pairs
      #|15 basis elements and 15 critical pairs
      #|15 basis elements and 14 critical pairs
      #|15 basis elements and 13 critical pairs
      #|15 basis elements and 12 critical pairs
      #|15 basis elements and 11 critical pairs
      #|16 basis elements and 17 critical pairs
      #|16 basis elements and 16 critical pairs
      #|16 basis elements and 15 critical pairs
      #|16 basis elements and 14 critical pairs
      #|16 basis elements and 13 critical pairs
      #|17 basis elements and 16 critical pairs
      #|17 basis elements and 15 critical pairs
      #|17 basis elements and 14 critical pairs
      #|17 basis elements and 13 critical pairs
      #|18 basis elements and 14 critical pairs
      #|18 basis elements and 13 critical pairs
      #|18 basis elements and 12 critical pairs
      #|18 basis elements and 11 critical pairs
      #|18 basis elements and 10 critical pairs
      #|19 basis elements and 14 critical pairs
      #|19 basis elements and 13 critical pairs
      #|19 basis elements and 12 critical pairs
      #|19 basis elements and 11 critical pairs
      #|20 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|0..0..1..2..6..solved at 11
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..1..2..6..solved at 11
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..3..8..17..32..63..114..198..359..solved at 473
      #|0..0..1..3..7..15..solved at 26
      #|0..0..1..3..7..15..31..solved at 47
      #|0..0..0..0..0..4..12..solved at 26
      #|0..0..0..0..0..3..6..9..23..solved at 32
      #|0..0..2..4..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..0..3..solved at 7
      #|0..0..2..7..17..solved at 22
      #|0..0..1..3..7..solved at 12
      #|0..0..1..2..5..solved at 11
      #|0..0..1..2..solved at 6
      #|0..0..2..4..7..11..solved at 17
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 1 critical pairs
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..1..2..5..solved at 11
      #|0..0..1..3..8..solved at 13
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..2..6..14..28..59..110..solved at 150
      #|0..0..1..2..solved at 6
      #|0..0..0..0..1..3..5..10..solved at 17
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..5..11..29..60..103..209..392..639..1109..solved at 1593
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 6 critical pairs
      #|6 basis elements and 7 critical pairs
      #|6 basis elements and 6 critical pairs
      #|7 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 5 critical pairs
      #|5 basis elements and 4 critical pairs
      #|6 basis elements and 6 critical pairs
      #|6 basis elements and 5 critical pairs
      #|7 basis elements and 7 critical pairs
      #|7 basis elements and 6 critical pairs
      #|7 basis elements and 5 critical pairs
      #|7 basis elements and 4 critical pairs
      #|8 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 6 critical pairs
      #|6 basis elements and 7 critical pairs
      #|6 basis elements and 6 critical pairs
      #|7 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 5 critical pairs
      #|5 basis elements and 4 critical pairs
      #|6 basis elements and 6 critical pairs
      #|6 basis elements and 5 critical pairs
      #|7 basis elements and 7 critical pairs
      #|7 basis elements and 6 critical pairs
      #|7 basis elements and 5 critical pairs
      #|7 basis elements and 4 critical pairs
      #|8 basis elements and 0 critical pairs
      #|Generating HOL version of proof
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
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..11..solved at 22
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..3..8..25..74..225..solved at 234
      #|0..0..1..2..4..6..8..solved at 14
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 3 critical pairs
      #|4 basis elements and 5 critical pairs
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 4 critical pairs
      #|5 basis elements and 3 critical pairs
      #|6 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..4..solved at 8
      #|0..0..1..4..solved at 8
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..0..2..5..10..24..54..114..solved at 194
      #|0..0..0..2..5..11..solved at 17
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..3..7..13..39..85..133..207..solved at 223
      #|0..0..solved at 3
      #|0..0..2..4..6..15..30..53..94..solved at 132
      #|0..0..3..7..13..39..85..133..207..solved at 223
      #|0..0..solved at 3
      #|0..0..2..4..6..15..30..53..95..solved at 134
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..1..solved at 5
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..15..22..29..36..47..58..73..solved at 88
      #|0..0..0..1..2..3..7..11..15..26..37..48..solved at 132
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 5 critical pairs
      #|5 basis elements and 4 critical pairs
      #|6 basis elements and 6 critical pairs
      #|6 basis elements and 5 critical pairs
      #|7 basis elements and 7 critical pairs
      #|7 basis elements and 6 critical pairs
      #|7 basis elements and 5 critical pairs
      #|7 basis elements and 4 critical pairs
      #|8 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 6 critical pairs
      #|6 basis elements and 7 critical pairs
      #|6 basis elements and 6 critical pairs
      #|7 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|5 basis elements and 5 critical pairs
      #|6 basis elements and 6 critical pairs
      #|6 basis elements and 5 critical pairs
      #|7 basis elements and 8 critical pairs
      #|8 basis elements and 11 critical pairs
      #|9 basis elements and 17 critical pairs
      #|9 basis elements and 16 critical pairs
      #|10 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|5 basis elements and 5 critical pairs
      #|6 basis elements and 6 critical pairs
      #|6 basis elements and 5 critical pairs
      #|7 basis elements and 8 critical pairs
      #|8 basis elements and 11 critical pairs
      #|9 basis elements and 17 critical pairs
      #|9 basis elements and 16 critical pairs
      #|9 basis elements and 15 critical pairs
      #|10 basis elements and 21 critical pairs
      #|10 basis elements and 20 critical pairs
      #|11 basis elements and 25 critical pairs
      #|11 basis elements and 24 critical pairs
      #|12 basis elements and 28 critical pairs
      #|13 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|5 basis elements and 2 critical pairs
      #|5 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|7 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|7 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 3 critical pairs
      #|5 basis elements and 4 critical pairs
      #|6 basis elements and 6 critical pairs
      #|7 basis elements and 9 critical pairs
      #|7 basis elements and 8 critical pairs
      #|7 basis elements and 7 critical pairs
      #|8 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 3 critical pairs
      #|5 basis elements and 4 critical pairs
      #|6 basis elements and 6 critical pairs
      #|7 basis elements and 9 critical pairs
      #|7 basis elements and 8 critical pairs
      #|7 basis elements and 7 critical pairs
      #|7 basis elements and 6 critical pairs
      #|8 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|6 basis elements and 2 critical pairs
      #|6 basis elements and 1 critical pairs
      #|6 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|6 basis elements and 4 critical pairs
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|6 basis elements and 1 critical pairs
      #|6 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|6 basis elements and 1 critical pairs
      #|6 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|6 basis elements and 5 critical pairs
      #|6 basis elements and 4 critical pairs
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|6 basis elements and 1 critical pairs
      #|6 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|6 basis elements and 4 critical pairs
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|6 basis elements and 1 critical pairs
      #|6 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|6 basis elements and 6 critical pairs
      #|6 basis elements and 5 critical pairs
      #|6 basis elements and 4 critical pairs
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|6 basis elements and 1 critical pairs
      #|6 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|6 basis elements and 1 critical pairs
      #|6 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|6 basis elements and 5 critical pairs
      #|6 basis elements and 4 critical pairs
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|6 basis elements and 1 critical pairs
      #|6 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|0..0..2..4..6..8..solved at 20
      #|0..0..2..4..6..8..26..60..100..232..382..solved at 454
      #|0..0..2..4..6..8..26..60..100..232..382..solved at 462
      #|0..0..2..4..6..8..solved at 16
      #|0..0..1..2..3..4..solved at 12
      #|0..0..1..2..3..4..solved at 12
      #|0..0..1..2..3..4..solved at 13
      #|0..0..solved at 2
      #|0..0..1..2..3..7..13..21..33..50..solved at 68
      #|0..0..0..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..2..3..7..14..32..54..80..solved at 129
      #|0..0..1..2..3..4..12..20..28..solved at 46
      #|0..0..1..3..7..12..22..solved at 35
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..2..6..11..solved at 22
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..6..11..solved at 22
      #|0..0..solved at 2
      #|0..0..1..2..6..11..solved at 22
      #|0..0..0..2..4..solved at 9
      #|0..0..1..2..6..12..27..solved at 44
      #|0..0..solved at 2
      #|0..0..1..2..6..12..27..solved at 44
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..6..12..solved at 18
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..4..11..20..34..61..95..solved at 107
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..3..7..13..25..40..61..96..133..180..238..solved at 266
      #|0..0..1..4..12..27..45..76..120..solved at 160
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..3..10..21..36..53..solved at 69
      #|Warning: inventing type variables
      #|0..0..1..5..13..23..33..51..76..101..132..169..206..solved at 244
      #|Warning: inventing type variables
      #|0..0..1..3..9..19..29..solved at 39
      #|Warning: inventing type variables
      #|0..0..1..4..9..solved at 15
      #|0..0..1..3..9..19..29..solved at 39
      #|Warning: inventing type variables
      #|0..0..1..2..9..16..32..50..solved at 58
      #|0..0..1..3..6..13..27..55..98..solved at 161
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..solved at 10
      #|0..0..1..2..solved at 10
      #|0..0..solved at 2
      #|0..0..1..2..solved at 8
      #|0..0..1..2..solved at 8
      #|0..0..solved at 2
      #|0..0..1..2..solved at 10
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 10
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 8
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..4..9..24..45..76..126..solved at 150
      #|0..0..1..4..11..28..50..solved at 70
      #|0..0..1..3..7..18..34..55..85..117..155..212..284..374..543..739..1018..1357..solved at 1481
      #|0..0..1..3..9..19..29..solved at 39
      #|0..0..1..3..5..18..57..112..176..245..314..387..480..581..814..1182..1573..2248..3205..4203..5398..6757..8130..9625..11424..13370..15633..18436..21380..solved at 23834
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..7..12..25..44..82..161..338..722..solved at 1281
      #|0..0..0..1..2..3..4..5..6..solved at 13
      #|0..0..0..0..1..8..solved at 27
      #|0..0..1..2..7..13..solved at 31
      #|Warning: inventing type variables
      #|0..0..1..2..5..solved at 11
      #|0..0..1..3..9..23..45..solved at 52
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 7
      #|0..0..1..3..9..20..35..solved at 42
      #|0..0..1..3..7..15..28..47..solved at 55
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..3..11..24..37..solved at 50
      #|0..0..1..3..11..24..37..solved at 48
      #|0..0..1..4..12..22..46..solved at 57
      #|0..0..2..10..35..83..solved at 94
      #|0..0..1..6..25..61..191..solved at 202
      #|0..0..solved at 2
      #|0..0..3..10..solved at 14
      #|0..0..1..2..5..9..15..30..47..76..solved at 122
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..10..solved at 18
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..10..solved at 21
      #|0..0..solved at 2
      #|0..0..2..5..11..26..solved at 51
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..4..9..21..solved at 34
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..7..17..32..solved at 41
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..3..8..17..solved at 38
      #|0..0..2..6..13..29..solved at 61
      #|0..0..1..3..8..19..solved at 34
      #|0..0..solved at 2
      #|0..0..1..3..8..19..solved at 34
      #|0..0..3..8..27..74..252..solved at 382
      #|0..0..3..9..31..solved at 57
      #|0..0..4..11..36..98..306..888..solved at 1648
      #|0..0..3..solved at 9
      #|0..0..solved at 2
      #|0..0..3..11..38..solved at 68
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..3..10..32..89..solved at 125
      #|0..0..solved at 2
      #|0..0..1..3..6..17..solved at 34
      #|0..0..2..6..10..22..42..67..solved at 74
      #|0..0..1..solved at 5
      #|0..0..1..2..3..4..7..18..29..50..71..solved at 85
      #|0..0..solved at 3
      #|0..0..1..2..3..7..13..21..42..69..105..solved at 159
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..4..11..26..59..123..solved at 143
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..4..11..26..solved at 32
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..1..10..19..39..solved at 52
      #|0..0..0..1..10..19..39..solved at 59
      #|0..0..0..1..10..19..39..solved at 59
      #|0..0..0..1..10..19..39..solved at 52
      #|0..0..1..4..9..19..41..75..solved at 84
      #|0..0..1..3..solved at 7
      #|0..0..1..4..solved at 9
      #|0..0..1..solved at 4
      #|0..0..0..1..2..3..solved at 8
      #|0..0..0..2..4..9..21..41..67..106..solved at 121
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 9
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..7..16..31..90..167..273..solved at 297
      #|0..0..2..7..solved at 12
      #|0..0..0..2..4..7..16..25..solved at 32
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..5..11..29..60..103..209..392..639..1109..solved at 1593
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..7..solved at 12
      #|0..0..solved at 2
      #|0..0..1..11..31..53..125..227..355..647..972..1329..2036..2771..3600..solved at 3688
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..0..0..0..2..4..6..8..10..12..19..26..33..43..53..63..75..87..99..113..127..141..solved at 160
      #|0..0..0..0..0..2..4..6..9..12..15..20..25..30..54..78..102..solved at 121
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..0..1..solved at 6
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..5..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..4..solved at 9
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..1..solved at 5
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
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
      #|0..0..0..1..solved at 5
      #|0..0..1..2..5..11..18..solved at 25
      #|0..0..1..2..4..7..10..solved at 16
      #|0..0..0..1..2..3..7..12..17..solved at 25
      #|0..0..0..1..solved at 5
      #|0..0..1..2..5..11..18..solved at 25
      #|0..0..1..2..4..7..10..solved at 16
      #|0..0..0..1..2..3..7..12..17..solved at 25
      #|0..0..0..1..solved at 5
      #|0..0..1..2..5..11..18..solved at 25
      #|0..0..1..2..4..7..10..solved at 16
      #|0..0..0..1..2..3..7..12..17..solved at 25
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..1..4..9..18..33..50..73..solved at 82
      #|0..0..solved at 2
      #|0..0..1..2..6..12..solved at 18
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..1..4..9..18..33..50..73..solved at 82
      #|0..0..solved at 2
      #|0..0..1..2..6..12..solved at 18
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..1..4..9..18..33..50..73..solved at 82
      #|0..0..solved at 2
      #|0..0..1..2..6..12..solved at 18
      #|0..0..1..2..7..15..27..solved at 42
      #|0..0..1..solved at 4
      #|0..0..0..1..2..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..0..1..2..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..1..2..5..solved at 11
      #|0..0..1..2..3..7..14..25..solved at 44
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..5..14..solved at 26
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..0..1..3..5..10..16..22..39..56..77..120..168..solved at 222
      #|0..0..0..0..1..4..7..solved at 13
      #|Warning: inventing type variables
      #|0..0..4..8..12..solved at 19
      #|0..0..4..8..12..solved at 18
      #|0..0..4..8..12..solved at 23
      #|0..0..4..8..12..solved at 20
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..1..2..6..12..22..38..60..94..165..284..solved at 406
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..0..0..solved at 12
      #|Warning: inventing type variables
      #|0..0..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..6..solved at 13
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..1..3..solved at 7
      #|0..0..0..1..2..3..6..9..12..19..26..33..51..69..87..121..155..189..263..337..411..710..1059..1458..2107..2971..4050..solved at 5051
      #|0..0..0..1..2..3..6..9..12..19..26..33..51..69..87..121..155..189..263..337..411..710..1059..1458..2104..2962..4032..solved at 4992
      #|0..0..1..3..solved at 7
      #|0..0..1..2..6..12..26..solved at 49
      #|0..0..1..3..5..solved at 10
      #|0..0..0..1..2..3..9..17..31..68..116..solved at 155
      #|0..0..1..2..5..10..20..40..66..143..242..427..solved at 641
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 8
      #|0..0..1..2..5..12..20..solved at 27
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..6..solved at 10
      #|0..0..3..6..solved at 10
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..2..6..12..26..solved at 49
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..1..2..5..10..20..40..64..124..189..283..488..758..1235..2037..3006..4677..7536..11913..18411..solved at 24712
      #|0..0..1..2..4..13..23..41..solved at 52
      #|0..0..2..4..8..21..40..67..114..192..275..469..746..1144..1876..2916..4428..6893..10808..16554..solved at 16618
      #|0..0..1..4..8..solved at 15
      #|0..0..solved at 2
      #|0..0..2..4..10..20..40..80..128..257..396..602..1031..1590..2588..solved at 3240
      #|0..0..2..4..8..21..41..71..124..215..315..532..837..1286..2212..3650..solved at 4959
      #|0..0..solved at 2
      #|0..0..2..4..10..20..40..80..128..256..394..600..1030..1590..2588..solved at 3154
      #|0..0..2..4..8..21..40..67..115..199..288..498..793..1213..solved at 1250
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..5..12..31..72..136..270..496..921..1706..3164..5657..10613..18945..solved at 33208
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..5..12..31..71..132..261..480..895..1673..3118..5575..solved at 5590
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..4..solved at 7
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..4..10..22..49..99..201..365..656..1120..1852..3096..5120..8630..14677..solved at 15315
      #|0..0..solved at 5
      #|0..0..solved at 3
      #|0..0..4..solved at 7
      #|0..0..solved at 5
      #|0..0..solved at 3
      #|0..0..4..11..25..54..112..226..412..731..1262..2100..3503..5855..9821..16518..28428..47421..79051..solved at 79973
      #|0..0..0..1..2..3..12..solved at 22
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..2..4..10..20..40..80..128..264..412..634..1080..1656..2688..solved at 3271
      #|0..0..2..4..8..21..41..71..126..223..332..565..885..1356..solved at 1393
      #|0..0..solved at 2
      #|0..0..2..4..10..20..40..80..128..264..412..634..1080..1656..2688..solved at 3362
      #|0..0..2..4..8..21..42..75..134..236..346..582..909..1402..solved at 1435
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..5..12..31..72..136..272..503..936..1740..3227..5923..solved at 5942
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..5..12..31..73..140..280..516..952..1760..3252..5965..solved at 5976
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 5
      #|0..0..4..solved at 7
      #|0..0..solved at 3
      #|0..0..solved at 5
      #|0..0..4..10..22..49..99..201..365..656..1120..1852..3096..5120..8630..14677..solved at 15315
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..4..solved at 7
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..4..11..25..54..112..226..412..731..1262..2100..3503..5855..9821..16518..28428..47421..79051..solved at 79973
      #|0..0..2..4..7..16..29..50..83..123..176..249..332..445..solved at 480
      #|0..0..1..3..6..13..24..39..58..solved at 92
      #|0..0..1..2..5..10..21..37..solved at 49
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|6 basis elements and 6 critical pairs
      #|7 basis elements and 9 critical pairs
      #|8 basis elements and 11 critical pairs
      #|8 basis elements and 10 critical pairs
      #|9 basis elements and 14 critical pairs
      #|10 basis elements and 15 critical pairs
      #|11 basis elements and 16 critical pairs
      #|11 basis elements and 15 critical pairs
      #|11 basis elements and 14 critical pairs
      #|11 basis elements and 13 critical pairs
      #|12 basis elements and 16 critical pairs
      #|12 basis elements and 15 critical pairs
      #|12 basis elements and 14 critical pairs
      #|12 basis elements and 13 critical pairs
      #|12 basis elements and 12 critical pairs
      #|12 basis elements and 11 critical pairs
      #|12 basis elements and 10 critical pairs
      #|12 basis elements and 9 critical pairs
      #|12 basis elements and 8 critical pairs
      #|12 basis elements and 7 critical pairs
      #|13 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|6 basis elements and 6 critical pairs
      #|7 basis elements and 7 critical pairs
      #|7 basis elements and 6 critical pairs
      #|8 basis elements and 9 critical pairs
      #|9 basis elements and 10 critical pairs
      #|9 basis elements and 9 critical pairs
      #|10 basis elements and 10 critical pairs
      #|11 basis elements and 13 critical pairs
      #|11 basis elements and 12 critical pairs
      #|11 basis elements and 11 critical pairs
      #|11 basis elements and 10 critical pairs
      #|12 basis elements and 13 critical pairs
      #|12 basis elements and 12 critical pairs
      #|12 basis elements and 11 critical pairs
      #|13 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..12..21..solved at 30
      #|0..0..1..2..6..12..21..solved at 30
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..2..8..18..solved at 25
      #|0..0..0..2..8..18..solved at 25
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..0..2..8..solved at 13
      #|0..0..1..2..7..13..27..43..69..100..155..218..313..426..569..741..973..1239..1595..solved at 1919
      #|0..0..1..3..7..solved at 12
      #|0..0..1..solved at 4
      #|0..0..1..2..3..solved at 8
      #|Warning: inventing type variables
      #|0..0..0..1..2..3..8..solved at 16
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..2..5..solved at 11
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..2..solved at 6
      #|0..0..0..2..4..8..solved at 15
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
      #|0..0..solved at 2
      #|0..0..solved at 2
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
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..9..18..solved at 52
      #|0..0..10..20..solved at 57
      #|0..0..10..20..solved at 57
      #|0..0..11..22..solved at 62
      #|0..0..1..2..solved at 12
      #|0..0..2..4..solved at 14
      #|0..0..2..4..solved at 14
      #|0..0..2..4..solved at 18
      #|0..0..2..4..58..133..solved at 443
      #|0..0..3..6..127..287..solved at 796
      #|0..0..3..6..79..179..solved at 569
      #|0..0..3..6..87..201..solved at 692
      #|0..0..2..4..58..133..solved at 443
      #|0..0..3..6..127..287..solved at 796
      #|0..0..3..6..79..179..solved at 569
      #|0..0..3..6..87..201..solved at 692
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..6..129..291..solved at 1630
      #|0..0..solved at 2
      #|0..0..4..8..214..477..solved at 2423
      #|0..0..solved at 2
      #|0..0..4..8..158..353..solved at 1944
      #|0..0..solved at 2
      #|0..0..4..8..166..375..solved at 2069
      #|0..0..solved at 2
      #|0..0..3..6..129..291..solved at 1630
      #|0..0..solved at 2
      #|0..0..4..8..214..477..solved at 2424
      #|0..0..solved at 2
      #|0..0..4..8..158..353..solved at 1944
      #|0..0..solved at 2
      #|0..0..4..8..166..375..solved at 2070
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..1..2..solved at 24
      #|0..0..2..4..solved at 28
      #|0..0..2..4..solved at 27
      #|0..0..2..4..solved at 32
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..2..4..solved at 44
      #|0..0..3..6..solved at 49
      #|0..0..3..6..solved at 48
      #|0..0..3..6..solved at 54
      #|0..0..3..6..127..solved at 198
      #|0..0..4..8..212..solved at 376
      #|0..0..4..8..156..solved at 231
      #|0..0..4..8..164..374..solved at 1318
      #|0..0..4..8..212..solved at 291
      #|0..0..5..10..313..solved at 493
      #|0..0..5..10..249..solved at 332
      #|0..0..5..10..257..576..solved at 1876
      #|0..0..4..8..156..solved at 231
      #|0..0..5..10..249..solved at 421
      #|0..0..5..10..185..solved at 264
      #|0..0..5..10..193..436..solved at 1524
      #|0..0..4..8..164..375..solved at 1223
      #|0..0..5..10..257..577..solved at 2988
      #|0..0..5..10..193..437..solved at 1425
      #|0..0..5..10..201..456..3475..solved at 5109
      #|0..0..3..6..127..solved at 207
      #|0..0..4..8..212..solved at 385
      #|0..0..4..8..156..solved at 240
      #|0..0..4..8..164..374..solved at 1348
      #|0..0..4..8..212..solved at 300
      #|0..0..5..10..313..solved at 502
      #|0..0..5..10..249..solved at 341
      #|0..0..5..10..257..576..solved at 1912
      #|0..0..4..8..156..solved at 240
      #|0..0..5..10..249..solved at 430
      #|0..0..5..10..185..solved at 273
      #|0..0..5..10..193..436..solved at 1554
      #|0..0..4..8..164..375..solved at 1247
      #|0..0..5..10..257..577..solved at 3016
      #|0..0..5..10..193..437..solved at 1449
      #|0..0..5..10..201..456..3479..solved at 5148
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 6
      #|0..0..solved at 6
      #|0..0..solved at 6
      #|0..0..solved at 5
      #|0..0..solved at 6
      #|0..0..solved at 6
      #|0..0..solved at 6
      #|0..0..solved at 5
      #|0..0..solved at 6
      #|0..0..solved at 6
      #|0..0..solved at 6
      #|0..0..1..4..11..34..74..144..299..897..2236..5564..solved at 5583
      #|0..0..1..4..11..solved at 17
      #|0..0..solved at 2
      #|0..0..2..6..solved at 11
      #|0..0..1..3..solved at 8
      #|0..0..2..6..solved at 11
      #|0..0..1..3..solved at 8
      #|0..0..2..6..13..32..solved at 62
      #|0..0..1..4..9..29..65..123..solved at 133
      #|0..0..0..2..6..25..58..111..236..solved at 744
      #|0..0..1..4..9..32..72..135..279..814..2008..solved at 2025
      #|0..0..2..6..20..62..157..337..802..2420..6499..17735..solved at 28824
      #|0..0..0..solved at 6
      #|0..0..0..solved at 5
      #|0..0..0..solved at 6
      #|0..0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..0..2..5..10..solved at 16
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..0..2..4..8..solved at 15
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..0..2..solved at 6
      #|0..0..0..2..4..8..solved at 15
      #|Warning: inventing type variables
      #|0..0..0..2..4..8..solved at 16
      #|0..0..2..solved at 5
      #|0..0..3..solved at 6
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..1..2..4..solved at 11
      #|0..0..1..2..5..solved at 11
      #|0..0..1..2..5..13..27..56..122..solved at 187
      #|0..0..1..2..4..9..18..30..solved at 45
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..3..solved at 14
      #|0..0..1..2..5..10..21..37..66..103..169..255..407..solved at 531
      #|0..0..1..2..5..14..28..solved at 47
      #|0..0..1..2..6..12..24..39..60..86..126..167..solved at 231
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..2..solved at 7
      #|0..0..2..solved at 5
      #|0..0..1..2..6..12..24..42..68..101..156..220..316..439..600..818..1180..1650..2319..3403..4721..6695..9162..solved at 11234
      #|0..0..1..2..6..12..25..43..71..104..161..226..324..448..610..828..1190..1661..2330..3418..4738..6717..9187..solved at 11263
      #|0..0..solved at 3
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..3..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 7
      #|0..0..solved at 2
      #|0..0..3..6..solved at 11
      #|0..0..3..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..3..5..11..26..solved at 33
      #|0..0..1..2..6..13..26..42..solved at 66
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..2..solved at 6
      #|0..0..1..2..7..13..26..41..solved at 55
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..7..13..19..solved at 27
      #|0..0..1..2..4..14..27..52..96..151..235..solved at 346
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..5..solved at 10
      #|0..0..2..5..solved at 9
      #|0..0..solved at 3
      #|0..0..2..5..solved at 10
      #|0..0..2..5..solved at 9
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..3..4..5..14..23..32..57..82..107..136..165..194..259..324..389..458..527..596..721..846..971..1414..1857..2300..3007..3714..4421..5362..6303..7244..solved at 8623
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..4..solved at 8
      #|0..0..3..solved at 6
      #|0..0..3..solved at 7
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 6
      #|0..0..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..1..2..3..12..21..30..47..64..81..104..127..150..181..212..243..solved at 305
      #|0..0..2..solved at 6
      #|0..0..1..2..7..15..25..solved at 32
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..2..4..solved at 9
      #|0..0..0..2..4..solved at 9
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..4..solved at 8
      #|0..0..6..solved at 10
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 8
      #|0..0..3..solved at 6
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..5..solved at 10
      #|0..0..4..solved at 8
      #|0..0..3..7..15..29..46..solved at 55
      #|0..0..2..solved at 5
      #|0..0..3..solved at 6
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..3..solved at 8
      #|0..0..3..solved at 6
      #|0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..3..solved at 10
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..4..solved at 7
      #|0..0..3..solved at 8
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..4..solved at 11
      #|0..0..3..solved at 6
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..3..solved at 8
      #|0..0..3..solved at 6
      #|0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..3..8..solved at 15
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..4..solved at 7
      #|0..0..3..solved at 8
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..4..solved at 11
      #|0..0..solved at 2
      #|0..0..3..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..4..solved at 9
      #|0..0..solved at 2
      #|0..0..2..5..solved at 9
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..5..11..18..25..35..45..59..solved at 78
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..3..9..solved at 25
      #|0..0..3..11..solved at 22
      #|0..0..3..9..solved at 18
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..0..0..2..solved at 7
      #|0..0..1..solved at 4
      #|0..0..0..0..3..solved at 8
      #|0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..2..solved at 6
      #|0..0..1..3..7..12..22..42..66..105..solved at 153
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..4..9..17..solved at 22
      #|0..0..2..5..11..solved at 17
      #|0..0..0..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..0..4..10..16..solved at 22
      #|0..0..solved at 2
      #|0..0..2..8..15..22..42..solved at 51
      #|0..0..0..3..7..11..24..37..58..103..148..199..290..381..472..647..822..1013..solved at 1152
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..2..5..solved at 10
      #|0..0..2..4..7..solved at 13
      #|0..0..1..solved at 5
      #|0..0..2..4..solved at 9
      #|0..0..2..4..solved at 9
      #|0..0..2..4..solved at 9
      #|0..0..1..2..solved at 6
      #|0..0..4..solved at 7
      #|0..0..solved at 2
      #|0..0..4..9..solved at 13
      #|0..0..3..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..11..19..29..solved at 38
      #|0..0..0..0..3..6..12..20..28..45..72..solved at 95
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 7
      #|0..0..2..4..10..28..solved at 44
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..2..6..solved at 10
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..4..9..solved at 14
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..3..solved at 7
      #|0..0..2..5..11..17..23..48..77..solved at 97
      #|0..0..2..6..17..52..solved at 63
      #|0..0..3..solved at 6
      #|0..0..5..12..25..67..137..solved at 184
      #|0..0..solved at 2
      #|0..0..3..solved at 7
      #|0..0..5..solved at 10
      #|0..0..3..7..16..48..105..solved at 144
      #|0..0..3..7..16..41..82..163..316..solved at 379
      #|0..0..5..solved at 10
      #|0..0..3..7..16..48..105..solved at 144
      #|0..0..3..7..16..41..82..163..316..solved at 379
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 10
      #|0..0..3..7..16..48..105..solved at 144
      #|0..0..3..7..16..41..82..163..316..solved at 379
      #|0..0..solved at 4
      #|0..0..6..13..solved at 21
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..5..10..solved at 17
      #|0..0..5..solved at 10
      #|0..0..3..7..16..48..105..solved at 144
      #|0..0..3..7..16..41..82..163..316..solved at 379
      #|0..0..4..9..21..51..101..189..338..545..827..1258..1831..2609..solved at 2812
      #|0..0..3..solved at 6
      #|0..0..solved at 3
      #|0..0..2..solved at 7
      #|0..0..2..4..solved at 11
      #|0..0..1..2..solved at 6
      #|0..0..2..5..solved at 12
      #|0..0..1..3..solved at 7
      #|0..0..1..3..12..25..60..113..solved at 185
      #|0..0..0..2..5..11..31..68..solved at 106
      #|0..0..1..2..8..15..26..39..54..74..112..153..206..290..387..solved at 438
      #|0..0..1..2..8..15..26..39..54..74..113..157..216..313..434..solved at 485
      #|0..0..1..2..8..15..26..39..54..74..112..153..206..290..387..solved at 438
      #|0..0..1..3..11..23..39..66..95..130..182..240..304..421..542..689..880..1079..1297..1611..1935..2309..2818..3335..3922..4671..5428..6250..7232..8284..9426..11096..12776..14697..16861..19111..21449..24849..28303..32377..37259..42237..47624..55400..63714..solved at 66560
      #|0..0..1..2..8..15..26..39..54..74..113..157..216..313..434..solved at 485
      #|0..0..1..3..11..23..39..66..95..130..182..240..304..421..542..689..880..1079..1297..1611..1935..2309..2818..3335..3922..4671..5428..6250..7233..8286..9430..11104..12788..14715..16888..19147..21497..24918..28393..32497..37424..42447..47894..55722..64089..solved at 66936
      #|0..0..1..2..5..9..26..48..78..122..184..252..348..452..solved at 506
      #|0..0..1..2..5..9..26..48..78..122..184..252..348..452..solved at 509
      #|0..0..1..2..3..7..24..47..79..126..184..254..344..446..solved at 504
      #|0..0..1..2..3..7..24..47..79..126..184..254..344..446..solved at 507
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..1..solved at 6
      #|0..0..1..2..6..18..33..63..solved at 89
      #|0..0..1..solved at 4
      #|0..0..1..3..9..18..solved at 25
      #|0..0..0..solved at 3
      #|0..0..1..5..10..solved at 16
      #|0..0..1..2..3..5..8..11..14..17..20..23..26..29..32..35..38..solved at 51
      #|0..0..0..0..0..4..9..solved at 16
      #|0..0..0..0..5..11..17..27..38..49..solved at 68
      #|0..0..1..2..6..14..24..34..47..64..90..solved at 101
      #|0..0..1..2..6..14..24..34..47..63..86..115..150..203..279..solved at 293
      #|0..0..1..2..3..10..19..31..45..64..86..126..168..solved at 181
      #|0..0..1..2..6..10..solved at 17
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..1..4..7..15..26..41..solved at 49
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..2..solved at 5
      #|0..0..3..solved at 6
      #|0..0..3..solved at 8
      #|0..0..3..solved at 8
      #|0..0..solved at 3
      #|0..0..3..solved at 6
      #|0..0..2..solved at 5
      #|0..0..3..solved at 6
      #|0..0..3..7..solved at 11
      #|0..0..3..7..12..18..solved at 24
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
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
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..6..solved at 11
      #|0..0..4..solved at 7
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..0..1..3..5..9..13..17..23..29..35..52..69..86..129..172..215..268..321..374..438..502..566..679..792..905..1034..1163..1292..1443..1594..1745..1954..2163..2372..2604..2836..3068..3370..3672..3974..4391..4808..5225..solved at 5636
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..3..8..solved at 15
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..7..13..24..40..56..76..107..140..197..289..393..597..844..1145..1595..2282..solved at 2295
      #|0..0..1..2..solved at 7
      #|0..0..0..3..7..solved at 12
      #|0..0..0..3..6..solved at 12
      #|0..0..1..2..3..7..13..21..39..62..89..131..185..250..343..solved at 362
      #|0..0..1..2..3..7..13..21..39..solved at 49
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..1..3..solved at 7
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..2..5..solved at 9
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..26..37..52..solved at 63
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..7..solved at 12
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
      #|0..0..0..0..solved at 4
      #|0..0..1..2..5..9..solved at 20
      #|0..0..1..2..3..7..solved at 17
      #|0..0..1..3..solved at 7
      #|0..0..2..4..solved at 8
      #|0..0..1..3..7..13..19..47..91..solved at 128
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..3..7..14..23..44..72..106..159..224..306..436..solved at 508
      #|0..0..solved at 2
      #|0..0..1..2..3..4..solved at 10
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..4..12..21..solved at 33
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..16..solved at 26
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 11
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..0..0..3..7..solved at 13
      #|0..0..0..0..3..7..solved at 13
      #|0..0..0..2..4..8..16..solved at 26
      #|0..0..0..2..solved at 6
      #|0..0..0..0..2..7..12..solved at 23
      #|0..0..1..2..3..13..26..39..solved at 59
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..0..0..2..4..6..10..14..18..26..34..42..73..104..143..194..245..300..solved at 324
      #|0..0..0..0..0..2..4..6..8..10..12..16..20..24..38..52..66..85..104..123..solved at 145
      #|0..0..0..0..2..5..8..17..26..35..47..59..71..119..167..215..308..401..494..649..808..973..1304..1643..1986..solved at 2148
      #|0..0..1..3..7..11..15..30..47..solved at 60
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..2..5..solved at 9
      #|0..0..solved at 2
      #|0..0..0..0..2..4..6..12..18..24..32..40..48..66..84..102..solved at 116
      #|0..0..0..0..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 8
      #|0..0..0..0..2..4..6..10..14..18..23..28..33..44..55..66..83..100..117..138..159..180..206..232..258..solved at 276
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..4..15..46..136..430..solved at 1180
      #|0..0..1..4..15..46..136..430..solved at 1180
      #|Warning: inventing type variables
      #|0..0..0..2..solved at 6
      #|0..0..1..2..3..solved at 10
      #|0..0..0..0..0..4..13..24..47..89..156..249..389..577..848..1198..1694..solved at 1755
      #|0..0..0..0..0..1..7..15..solved at 25
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..14..28..solved at 43
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..12..24..39..60..86..126..167..242..solved at 320
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..30..48..87..149..245..386..solved at 485
      #|0..0..1..2..7..14..solved at 20
      #|0..0..solved at 2
      #|0..0..1..2..3..8..solved at 14
      #|0..0..1..2..5..solved at 10
      #|0..0..solved at 2
      #|0..0..1..2..6..12..25..41..62..87..126..167..229..300..384..532..718..990..1347..1799..2382..3136..4116..solved at 4934
      #|0..0..1..2..6..12..23..47..79..134..solved at 206
      #|0..0..1..2..6..14..28..47..solved at 75
      #|0..0..0..0..2..6..12..23..41..67..solved at 89
      #|0..0..0..solved at 3
      #|0..0..0..0..0..1..5..9..20..33..solved at 45
      #|0..0..0..0..0..1..5..9..solved at 18
      #|0..0..0..0..0..0..2..9..18..35..57..85..117..157..204..260..343..438..543..708..907..solved at 1046
      #|0..0..0..0..0..solved at 5
      #|0..0..1..2..5..10..19..36..solved at 59
      #|0..0..1..2..5..9..19..34..solved at 50
      #|0..0..1..2..4..10..solved at 16
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..3..4..solved at 10
      #|0..0..1..2..5..solved at 10
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..3..4..solved at 10
      #|0..0..1..2..3..7..solved at 20
      #|0..0..1..2..3..7..solved at 13
      #|0..0..1..2..5..8..12..21..31..43..62..81..102..132..162..209..269..329..420..solved at 530
      #|0..0..1..2..3..7..12..17..26..35..44..58..72..86..120..154..188..234..280..326..395..464..533..629..725..821..1016..1234..solved at 1352
      #|0..0..1..2..5..8..solved at 14
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..4..7..10..14..24..35..solved at 50
      #|0..0..1..2..5..8..12..solved at 20
      #|0..0..1..2..4..solved at 10
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..7..12..solved at 19
      #|0..0..1..2..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..12..solved at 18
      #|0..0..1..5..17..solved at 24
      #|0..0..1..8..19..42..99..185..339..solved at 380
      #|0..0..1..8..19..41..96..174..solved at 228
      #|0..0..0..3..12..26..69..134..231..solved at 386
      #|0..0..1..2..6..13..26..44..69..96..140..solved at 195
      #|0..0..solved at 3
      #|0..0..3..solved at 6
      #|0..0..2..4..10..27..52..solved at 73
      #|0..0..2..4..8..31..61..solved at 102
      #|0..0..2..6..11..32..65..solved at 96
      #|0..0..solved at 2
      #|0..0..3..8..solved at 12
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..8..solved at 12
      #|0..0..2..5..solved at 9
      #|0..0..2..5..10..24..45..72..131..214..solved at 229
      #|0..0..1..2..3..8..16..28..48..80..127..221..353..solved at 410
      #|0..0..1..2..4..10..17..27..41..57..76..121..solved at 150
      #|0..0..1..2..4..10..17..27..solved at 46
      #|0..0..2..4..10..17..30..44..solved at 55
      #|0..0..3..6..13..solved at 23
      #|0..0..2..4..6..14..solved at 21
      #|0..0..2..4..8..solved at 14
      #|0..0..1..4..14..29..64..118..solved at 131
      #|0..0..2..5..13..35..72..123..205..334..solved at 350
      #|0..0..1..5..9..16..23..31..52..solved at 63
      #|0..0..solved at 2
      #|0..0..1..4..9..solved at 20
      #|0..0..solved at 2
      #|0..0..1..2..6..14..23..38..55..74..121..185..solved at 231
      #|0..0..0..0..3..7..11..21..33..47..89..143..solved at 179
      #|0..0..2..4..6..14..24..solved at 35
      #|0..0..1..2..3..7..13..22..36..55..78..123..170..243..374..545..solved at 613
      #|0..0..2..5..solved at 10
      #|0..0..1..3..solved at 7
      #|0..0..2..4..8..15..24..35..51..69..94..132..175..253..358..508..716..984..solved at 1262
      #|0..0..1..2..3..7..13..21..35..51..70..104..143..216..317..463..667..935..solved at 1206
      #|0..0..1..2..8..solved at 13
      #|0..0..1..2..3..7..13..23..41..solved at 54
      #|0..0..2..5..12..solved at 22
      #|0..0..1..3..7..solved at 14
      #|0..0..2..6..13..27..50..82..144..228..333..613..1006..1537..solved at 1949
      #|0..0..1..4..8..19..39..68..127..208..306..579..965..1487..solved at 1890
      #|0..0..1..2..6..10..14..solved at 20
      #|0..0..1..2..5..9..solved at 16
      #|0..0..1..2..6..10..14..solved at 20
      #|0..0..1..2..6..10..14..solved at 22
      #|0..0..1..2..5..10..19..30..45..72..115..188..391..solved at 648
      #|0..0..1..2..6..10..14..solved at 20
      #|0..0..1..2..6..10..14..solved at 23
      #|0..0..1..2..6..10..14..solved at 24
      #|0..0..1..2..5..11..23..38..59..89..132..181..248..365..500..663..918..1201..1529..2216..2948..3762..solved at 31951
      #|0..0..1..2..6..10..14..solved at 20
      #|0..0..1..2..6..10..14..solved at 23
      #|0..0..1..2..6..10..14..solved at 26
      #|0..0..1..2..6..10..14..solved at 26
      #|0..0..1..2..5..12..27..46..73..112..155..218..305..410..567..762..975..1278..1631..2027..2729..3555..4423..6243..8547..11013..15783..solved at 45008
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
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..0..0..0..0..5..14..solved at 22
      #|0..0..0..0..0..0..solved at 6
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
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..5..solved at 11
      #|0..0..1..3..7..solved at 12
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..2..6..10..17..32..53..91..165..solved at 227
      #|0..0..0..1..2..3..4..5..6..solved at 13
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..7..12..20..solved at 26
      #|0..0..1..2..5..9..18..29..46..solved at 59
      #|0..0..1..2..7..13..26..44..75..solved at 104
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..3..8..solved at 18
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..2..5..12..solved at 22
      #|0..0..2..6..15..32..81..solved at 90
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..3..7..solved at 12
      #|0..0..1..4..solved at 9
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..5..15..32..63..179..491..1400..solved at 2096
      #|0..0..1..3..9..24..solved at 38
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..2..6..17..41..87..248..731..2074..solved at 5183
      #|0..0..solved at 2
      #|0..0..1..3..10..25..solved at 38
      #|Warning: inventing type variables
      #|0..0..2..4..solved at 10
      #|Warning: inventing type variables
      #|0..0..2..4..solved at 8
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..3..7..solved at 15
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..3..7..13..solved at 23
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 3 critical pairs
      #|4 basis elements and 5 critical pairs
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 4 critical pairs
      #|6 basis elements and 0 critical pairs
      #|Generating HOL version of proof
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
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 6 critical pairs
      #|6 basis elements and 7 critical pairs
      #|6 basis elements and 6 critical pairs
      #|7 basis elements and 9 critical pairs
      #|7 basis elements and 8 critical pairs
      #|8 basis elements and 10 critical pairs
      #|8 basis elements and 9 critical pairs
      #|8 basis elements and 8 critical pairs
      #|8 basis elements and 7 critical pairs
      #|9 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 5 critical pairs
      #|5 basis elements and 4 critical pairs
      #|6 basis elements and 5 critical pairs
      #|6 basis elements and 4 critical pairs
      #|7 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 2 critical pairs
      #|4 basis elements and 3 critical pairs
      #|4 basis elements and 2 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|0..0..2..6..16..38..84..solved at 173
      #|0..0..2..4..14..34..84..solved at 168
      #|0..0..1..3..7..15..27..52..92..solved at 114
      #|0..0..2..6..solved at 10
      #|0..0..1..3..9..23..57..142..418..solved at 621
      #|0..0..solved at 2
      #|0..0..1..6..15..35..85..200..solved at 231
      #|0..0..1..solved at 8
      #|0..0..solved at 2
      #|0..0..1..3..8..18..38..solved at 87
      #|0..0..2..7..21..57..141..solved at 195
      #|0..0..0..3..12..25..74..171..344..solved at 460
      #|0..0..0..3..12..25..74..171..344..solved at 374
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
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|0..0..1..2..3..9..16..23..37..52..67..159..solved at 187
      #|0..0..1..2..3..9..16..23..37..52..67..159..solved at 187
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
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..6..11..19..34..49..70..117..164..237..386..553..836..1213..1683..2281..solved at 2740
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..4..solved at 9
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
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..4..8..18..34..solved at 48
      #|0..0..2..4..solved at 8
      #|0..0..4..8..18..34..solved at 48
      #|0..0..2..4..8..16..35..58..104..165..299..465..829..1296..2124..3187..solved at 3583
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..4..10..18..30..solved at 46
      #|0..0..2..4..8..16..28..59..103..173..solved at 214
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..0..1..2..3..solved at 8
      #|0..0..1..2..5..9..15..solved at 28
      #|0..0..1..solved at 4
      #|0..0..1..2..6..solved at 16
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..6..solved at 16
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
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
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
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
      #|0..0..1..2..5..9..15..solved at 28
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..solved at 28
      #|Warning: inventing type variables
      #|0..0..1..3..8..solved at 21
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..6..12..23..37..55..75..solved at 127
      #|Warning: inventing type variables
      #|0..0..1..2..6..12..23..37..55..75..solved at 119
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..2..4..8..19..45..76..142..solved at 169
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..6..solved at 11
      #|0..0..1..solved at 4
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
      #|0..0..1..2..5..10..20..32..48..solved at 61
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..6..13..29..59..118..222..solved at 246
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
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
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..6..solved at 14
      #|0..0..1..2..6..12..27..solved at 36
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..5..8..solved at 14
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..2..4..solved at 9
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
      #|0..0..1..2..5..9..solved at 20
      #|0..0..1..2..5..9..solved at 20
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..6..12..27..solved at 44
      #|0..0..solved at 2
      #|0..0..0..0..3..7..solved at 13
      #|0..0..0..0..3..7..13..20..solved at 29
      #|0..0..1..2..6..solved at 11
      #|0..0..1..2..6..12..solved at 29
      #|0..0..1..2..6..12..solved at 29
      #|Warning: inventing type variables
      #|0..0..1..3..7..15..28..50..solved at 84
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..1..2..3..4..5..6..13..20..27..40..53..66..109..152..195..264..333..402..569..736..903..1220..1537..1854..solved at 13276
      #|0..0..0..1..2..3..4..5..6..13..20..27..40..53..66..109..152..195..264..333..402..569..736..903..1222..1541..1860..2883..3906..4929..solved at 19266
      #|0..0..0..0..0..4..10..16..26..36..46..64..82..100..131..162..193..solved at 219
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..5..10..solved at 21
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..3..11..22..36..76..134..solved at 173
      #|0..0..1..2..3..12..34..82..165..323..532..solved at 547
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 1 critical pairs
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|0..0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..2..10..22..54..135..268..533..1208..2507..5352..11462..solved at 14641
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..5..11..18..25..32..39..91..190..293..413..654..973..1300..1725..2329..3283..4784..6556..8686..11783..15661..20025..solved at 21445
      #|0..0..1..2..5..8..13..19..25..solved at 33
      #|Warning: inventing type variables
      #|0..0..1..2..4..10..solved at 17
      #|Warning: inventing type variables
      #|0..0..1..2..4..10..solved at 16
      #|0..0..solved at 2
      #|0..0..0..2..4..solved at 9
      #|0..0..0..0..solved at 5
      #|0..0..0..0..solved at 5
      #|0..0..1..2..3..7..12..17..25..33..41..66..91..119..194..269..397..solved at 544
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..1..2..3..8..16..solved at 25
      #|0..0..0..1..3..solved at 8
      #|0..0..1..2..3..9..17..solved at 28
      #|0..0..0..1..3..solved at 8
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..11..solved at 22
      #|0..0..solved at 2
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
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..12..27..solved at 44
      #|0..0..solved at 2
      #|0..0..1..2..6..12..27..solved at 44
      #|0..0..solved at 2
      #|0..0..1..2..3..8..16..27..45..75..solved at 99
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..2..6..11..solved at 23
      #|0..0..1..2..8..15..solved at 35
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..11..solved at 23
      #|0..0..1..2..8..15..solved at 35
      #|0..0..solved at 2
      #|0..0..1..2..3..9..17..28..48..79..solved at 105
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..6..solved at 13
      #|0..0..1..2..6..13..29..62..122..251..541..1145..2396..solved at 3124
      #|0..0..1..2..6..13..29..62..122..251..541..1145..2396..solved at 3124
      #|0..0..1..2..6..13..29..62..122..251..541..1145..2396..solved at 3193
      #|0..0..1..2..6..13..29..68..137..296..solved at 389
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..5..13..27..solved at 33
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..6..solved at 13
      #|0..0..1..2..6..13..33..solved at 52
      #|0..0..solved at 2
      #|0..0..1..2..6..13..33..solved at 52
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
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
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
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..3..9..17..solved at 24
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..1..3..7..solved at 14
      #|0..0..0..1..5..15..38..70..126..solved at 254
      #|0..0..0..1..4..11..27..solved at 47
      #|Warning: inventing type variables
      #|0..0..1..2..3..7..13..22..39..63..solved at 78
      #|0..0..1..2..3..7..15..32..71..133..221..491..solved at 739
      #|0..0..1..2..3..7..14..27..55..98..158..solved at 221
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..2..6..12..27..52..102..176..340..568..1155..1991..solved at 2898
      #|0..0..1..2..7..15..34..solved at 41
      #|Warning: inventing type variables
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..2..4..6..solved at 11
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..4..6..22..45..84..solved at 103
      #|0..0..2..4..6..22..45..84..solved at 135
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 9
      #|0..0..2..solved at 8
      #|0..0..2..solved at 8
      #|0..0..2..solved at 10
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..4..12..22..43..83..solved at 116
      #|0..0..1..solved at 4
      #|0..0..1..2..4..solved at 10
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..3..6..11..20..36..66..107..solved at 147
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..0..2..6..15..42..99..212..518..1099..2435..5070..10398..21394..43929..92709..solved at 198573
      #|Warning: inventing type variables
      #|0..0..1..2..6..12..22..36..53..78..134..205..308..solved at 361
      #|0..0..1..2..3..13..25..39..77..135..209..329..531..792..1227..1826..2694..3991..6192..8815..solved at 8883
      #|0..0..1..4..7..22..51..121..278..693..solved at 1089
      #|0..0..solved at 2
      #|0..0..1..4..7..25..59..solved at 140
      #|0..0..1..4..7..28..70..191..solved at 355
      #|0..0..1..solved at 4
      #|0..0..1..4..solved at 10
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..2..3..solved at 8
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..2..3..9..solved at 15
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..2..3..solved at 8
      #|Warning: inventing type variables
      #|0..0..1..2..3..10..21..32..47..solved at 56
      #|Warning: inventing type variables
      #|0..0..1..2..3..9..18..solved at 25
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..7..13..21..solved at 29
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..0..3..7..solved at 13
      #|0..0..0..0..13..29..72..204..420..708..solved at 1668
      #|0..0..0..0..7..16..37..solved at 93
      #|0..0..1..2..4..solved at 11
      #|0..0..1..2..4..solved at 11
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..2..solved at 6
      #|0..0..1..3..6..solved at 12
      #|0..0..1..2..6..12..solved at 24
      #|0..0..1..solved at 6
      #|0..0..1..3..7..solved at 12
      #|0..0..1..2..3..7..14..23..solved at 35
      #|0..0..0..solved at 3
      #|0..0..1..2..6..12..solved at 24
      #|0..0..1..solved at 5
      #|0..0..1..2..5..12..22..solved at 33
      #|Warning: inventing type variables
      #|0..0..1..9..69..193..552..solved at 604
      #|0..0..2..11..76..210..596..1537..3548..19009..solved at 19987
      #|0..0..1..9..69..193..554..solved at 605
      #|0..0..1..9..69..195..562..1524..3677..20872..61513..solved at 62018
      #|0..0..1..9..69..194..558..1478..solved at 1592
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..3..9..24..60..194..solved at 443
      #|0..0..1..4..12..solved at 18
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..4..10..solved at 21
      #|0..0..3..17..59..solved at 72
      #|0..0..3..16..55..153..439..1271..4147..solved at 5818
      #|Warning: inventing type variables
      #|0..0..2..7..23..64..150..381..949..2240..5259..12614..30384..74607..solved at 112766
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..4..13..25..51..solved at 75
      #|0..0..1..2..4..13..25..51..solved at 61
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..4..9..solved at 16
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 6
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..3..solved at 6
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..7..solved at 12
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..2..5..9..15..solved at 28
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..1..2..5..9..15..solved at 28
      #|0..0..solved at 2
      #|0..0..2..4..9..22..46..solved at 73
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..3..7..15..solved at 24
      #|0..0..1..2..solved at 9
      #|0..0..1..2..5..9..15..solved at 28
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 7
      #|0..0..2..4..solved at 9
      #|0..0..1..2..solved at 6
      #|0..0..3..6..18..31..solved at 40
      #|0..0..1..2..3..10..22..44..solved at 67
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..3..7..15..solved at 27
      #|Warning: inventing type variables
      #|0..0..1..3..9..solved at 20
      #|0..0..1..2..4..10..17..27..50..solved at 75
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 7
      #|0..0..solved at 2
      #|0..0..0..0..0..6..14..24..42..68..solved at 97
      #|Warning: inventing type variables
      #|0..0..0..0..0..4..9..15..solved at 23
      #|Warning: inventing type variables
      #|0..0..0..0..0..0..1..solved at 8
      #|0..0..1..solved at 4
      #|0..0..1..2..3..7..13..21..solved at 29
      #|0..0..1..3..7..12..solved at 24
      #|0..0..1..2..3..7..12..17..31..49..69..93..solved at 107
      #|0..0..1..2..3..7..12..17..32..57..84..solved at 104
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..11..19..34..49..68..solved at 83
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..5..9..15..34..solved at 56
      #|Warning: inventing type variables
      #|0..0..1..2..3..7..12..17..33..60..93..132..192..279..404..564..789..1109..1695..solved at 2047
      #|0..0..2..solved at 5
      #|0..0..2..4..solved at 8
      #|0..0..1..2..3..7..15..solved at 24
      #|0..0..solved at 2
      #|0..0..1..2..5..13..26..52..solved at 70
      #|Warning: inventing type variables
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..3..5..14..solved at 29
      #|Warning: inventing type variables
      #|0..0..1..3..8..20..42..solved at 77
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..2..3..solved at 8
      #|0..0..1..3..9..22..48..102..194..368..675..solved at 1006
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..6..solved at 10
      #|0..0..1..6..solved at 10
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 6
      #|0..0..solved at 5
      #|0..0..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
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
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..7..14..solved at 20
      #|0..0..solved at 2
      #|0..0..7..14..solved at 18
      #|0..0..solved at 2
      #|0..0..7..14..41..solved at 50
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..2..4..12..25..61..114..solved at 174
      #|0..0..4..solved at 9
      #|0..0..4..solved at 8
      #|0..0..4..solved at 7
      #|0..0..4..8..24..49..115..210..430..730..1537..2607..solved at 3598
      #|0..0..1..2..6..11..21..solved at 28
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..4..10..25..54..112..solved at 125
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..0..0..solved at 4
      #|0..0..0..0..0..solved at 5
      #|0..0..2..solved at 6
      #|0..0..2..4..10..19..32..52..75..102..140..180..230..303..solved at 339
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..6..13..solved at 21
      #|0..0..1..solved at 4
      #|0..0..1..3..5..16..solved at 32
      #|0..0..1..2..5..12..24..44..80..132..221..solved at 308
      #|0..0..1..2..5..14..33..81..solved at 142
      #|0..0..1..2..5..solved at 12
      #|0..0..1..3..7..26..solved at 58
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..10..24..43..102..201..377..707..1390..solved at 1550
      #|0..0..2..4..11..23..42..102..solved at 129
      #|0..0..2..4..6..14..25..38..61..86..112..solved at 140
      #|0..0..2..4..10..25..52..solved at 59
      #|0..0..solved at 2
      #|0..0..3..6..17..34..solved at 48
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 9
      #|0..0..3..6..16..32..56..116..205..solved at 252
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..3..solved at 6
      #|0..0..3..8..solved at 13
      #|0..0..3..8..solved at 12
      #|0..0..3..solved at 6
      #|0..0..3..solved at 6
      #|0..0..0..0..3..8..17..32..59..solved at 68
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..3..7..17..35..57..91..141..209..373..616..solved at 860
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..0..2..5..solved at 10
      #|0..0..1..2..solved at 6
      #|0..0..1..2..9..17..33..51..79..110..solved at 118
      #|0..0..1..2..8..15..30..47..74..104..159..218..310..solved at 331
      #|0..0..1..2..9..17..33..54..86..121..184..251..352..solved at 389
      #|0..0..1..2..7..13..solved at 32
      #|0..0..1..2..6..14..41..86..196..412..1083..solved at 1767
      #|0..0..1..2..7..16..46..solved at 85
      #|0..0..1..2..6..14..41..86..196..412..1083..solved at 1767
      #|0..0..1..2..7..16..46..solved at 85
      #|0..0..1..2..6..11..solved at 22
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..7..14..33..64..solved at 109
      #|0..0..1..2..6..solved at 16
      #|0..0..0..1..2..3..4..5..6..17..28..39..58..77..96..142..188..234..solved at 257
      #|0..0..1..2..6..12..27..48..solved at 81
      #|0..0..1..2..6..12..28..53..109..192..381..solved at 581
      #|0..0..0..1..2..3..4..5..6..solved at 13
      #|0..0..solved at 2
      #|0..0..1..3..9..23..50..solved at 98
      #|0..0..1..2..8..17..50..105..302..solved at 556
      #|0..0..0..0..solved at 4
      #|0..0..1..2..5..10..17..solved at 26
      #|0..0..1..2..5..9..15..solved at 23
      #|0..0..1..3..9..solved at 17
      #|0..0..solved at 2
      #|0..0..1..2..3..13..29..62..121..solved at 139
      #|0..0..1..2..3..7..14..29..48..80..119..237..386..670..solved at 705
      #|0..0..1..3..8..19..38..solved at 68
      #|0..0..1..2..6..20..45..109..217..429..768..1427..2568..solved at 4330
      #|0..0..0..1..2..3..5..7..9..solved at 16
      #|0..0..1..2..3..8..solved at 14
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..solved at 13
      #|0..0..2..solved at 7
      #|0..0..1..2..6..solved at 16
      #|0..0..1..3..12..30..69..solved at 101
      #|0..0..1..2..7..15..45..90..260..515..1629..3298..solved at 7059
      #|Warning: inventing type variables
      #|0..0..0..0..4..10..24..44..86..134..solved at 206
      #|0..0..1..solved at 4
      #|0..0..0..0..4..10..24..44..86..134..solved at 206
      #|0..0..1..2..6..solved at 15
      #|0..0..1..2..6..solved at 15
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..8..18..67..144..solved at 385
      #|0..0..solved at 2
      #|0..0..1..2..6..12..27..solved at 44
      #|0..0..1..2..8..solved at 19
      #|0..0..0..0..2..4..6..9..12..15..30..45..solved at 62
      #|0..0..1..2..8..18..solved at 36
      #|0..0..1..2..6..13..29..62..122..251..541..1145..2396..solved at 3124
      #|0..0..1..2..6..13..29..62..122..251..509..1047..2110..solved at 2770
      #|0..0..1..2..6..12..27..48..solved at 81
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..3..12..28..63..solved at 91
      #|0..0..1..solved at 4
      #|0..0..1..2..6..solved at 16
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..6..solved at 11
      #|0..0..1..solved at 4
      #|0..0..1..2..7..solved at 12
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..solved at 8
      #|0..0..solved at 2
      #|0..0..0..1..2..3..4..5..6..17..28..39..58..77..96..142..188..234..solved at 257
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..7..15..43..86..solved at 206
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..3..solved at 7
      #|0..0..1..3..7..16..28..solved at 37
      #|Warning: inventing type variables
      #|0..0..1..4..12..34..74..148..258..422..712..1102..1713..2982..4799..solved at 6441
      #|0..0..1..4..14..44..103..228..441..798..1463..2360..3704..6422..10384..solved at 13559
      #|Warning: inventing type variables
      #|0..0..1..3..7..solved at 12
      #|0..0..1..2..5..solved at 13
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..0..1..2..3..solved at 8
      #|0..0..0..1..2..3..8..15..solved at 24
      #|Warning: inventing type variables
      #|0..0..1..3..5..10..19..29..43..60..77..105..146..187..299..485..677..969..1469..2055..solved at 2131
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..6..solved at 16
      #|0..0..1..3..12..30..69..solved at 101
      #|0..0..1..5..18..74..237..681..1835..solved at 4582
      #|0..0..3..7..18..72..165..357..688..solved at 723
      #|0..0..1..5..18..74..237..681..1835..solved at 4608
      #|0..0..3..7..18..72..165..357..688..solved at 842
      #|0..0..1..4..solved at 10
      #|0..0..1..solved at 4
      #|0..0..3..solved at 8
      #|0..0..3..6..solved at 16
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..4..11..solved at 16
      #|0..0..solved at 2
      #|0..0..1..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..solved at 28
      #|0..0..0..solved at 3
      #|0..0..1..4..8..15..31..52..solved at 71
      #|Warning: inventing type variables
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..6..14..solved at 25
      #|0..0..3..solved at 7
      #|0..0..3..6..14..solved at 22
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..solved at 8
      #|0..0..1..solved at 8
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..1..solved at 9
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..4..10..23..48..94..176..325..597..1112..2357..6043..17931..solved at 23124
      #|0..0..3..8..20..56..150..solved at 187
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 2 critical pairs
      #|4 basis elements and 3 critical pairs
      #|4 basis elements and 2 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|0..0..1..2..3..solved at 8
      #|0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..2..5..12..solved at 17
      #|0..0..3..8..18..37..74..141..267..510..977..2084..5322..15407..solved at 19764
      #|0..0..2..5..12..36..91..solved at 123
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..4..9..solved at 13
      #|0..0..solved at 2
      #|0..0..5..10..solved at 14
      #|0..0..5..11..24..50..99..172..338..solved at 363
      #|0..0..1..4..11..22..solved at 28
      #|0..0..1..2..3..19..41..solved at 61
      #|0..0..1..3..solved at 7
      #|0..0..1..3..7..11..15..22..29..36..88..169..solved at 195
      #|0..0..1..3..7..solved at 12
      #|0..0..1..2..3..9..17..solved at 24
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..solved at 13
      #|0..0..1..4..10..22..34..54..90..126..170..234..298..382..502..622..746..870..994..1134..1306..1478..1682..1950..2218..2486..2754..3022..3298..solved at 3338
      #|0..0..1..4..9..solved at 14
      #|0..0..1..2..solved at 6
      #|0..0..1..2..4..solved at 9
      #|0..0..4..8..18..41..73..124..192..285..424..589..814..solved at 847
      #|0..0..1..2..7..13..27..44..71..solved at 101
      #|0..0..1..2..3..7..12..17..27..solved at 40
      #|0..0..0..1..2..3..8..14..22..39..58..solved at 73
      #|0..0..1..2..3..7..12..17..27..solved at 40
      #|0..0..0..1..2..3..8..14..22..39..58..solved at 73
      #|0..0..4..8..18..38..66..116..187..309..526..852..1409..2456..solved at 2837
      #|0..0..4..8..18..38..66..116..187..309..526..852..1409..2456..solved at 2837
      #|0..0..1..3..7..17..40..83..182..358..721..1342..2340..3956..6742..10823..solved at 10909
      #|0..0..1..2..5..9..15..31..49..81..solved at 119
      #|0..0..1..2..5..9..15..24..33..44..76..111..167..240..327..428..solved at 605
      #|0..0..1..2..5..9..15..24..33..44..74..112..171..262..solved at 338
      #|0..0..1..3..7..17..40..83..182..358..721..1342..2340..3956..6742..10823..solved at 10909
      #|0..0..1..2..5..9..15..31..49..81..solved at 120
      #|0..0..1..2..5..9..15..24..33..44..76..111..167..240..327..428..solved at 605
      #|0..0..1..2..5..9..15..24..33..44..74..112..171..262..solved at 338
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..4..7..19..46..88..solved at 101
      #|0..0..0..solved at 3
      #|0..0..1..3..7..14..24..40..solved at 48
      #|0..0..3..6..15..27..45..solved at 78
      #|0..0..1..2..solved at 9
      #|0..0..3..6..15..27..45..solved at 78
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..4..9..21..solved at 29
      #|0..0..1..solved at 4
      #|0..0..3..8..20..solved at 26
      #|0..0..5..solved at 8
      #|0..0..1..3..7..solved at 12
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..3..6..solved at 12
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..8..15..solved at 21
      #|0..0..1..solved at 4
      #|0..0..3..6..13..solved at 18
      #|0..0..3..6..15..32..55..94..150..solved at 161
      #|0..0..1..2..4..10..19..42..95..175..347..710..1266..2411..solved at 4474
      #|0..0..3..6..17..33..75..137..288..480..1002..1701..solved at 1957
      #|0..0..3..8..21..40..91..167..340..580..1150..1926..solved at 2296
      #|0..0..2..4..12..24..60..114..257..440..936..1609..solved at 1830
      #|0..0..3..solved at 7
      #|0..0..3..solved at 9
      #|0..0..2..solved at 5
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..solved at 10
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..2..8..26..80..218..586..1471..3576..9019..22354..solved at 37752
      #|0..0..3..solved at 6
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..2..solved at 9
      #|0..0..2..4..solved at 10
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..1..3..12..35..solved at 41
      #|0..0..1..solved at 4
      #|0..0..3..7..solved at 11
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..4..solved at 11
      #|0..0..1..3..8..18..36..79..solved at 157
      #|0..0..1..2..7..solved at 14
      #|0..0..1..2..3..7..14..27..46..81..127..249..411..783..1200..2239..3392..8293..15423..41030..solved at 54148
      #|0..0..1..3..7..solved at 12
      #|0..0..1..2..6..solved at 11
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..14..28..60..solved at 74
      #|0..0..1..4..9..solved at 14
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 13
      #|Warning: inventing type variables
      #|0..0..1..2..5..9..16..24..34..solved at 43
      #|0..0..1..solved at 6
      #|0..0..1..2..5..21..43..78..126..208..306..497..715..1094..1578..2347..3288..5247..7480..11146..solved at 13877
      #|0..0..1..2..5..9..15..30..47..76..solved at 128
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..9..15..26..37..52..solved at 64
      #|0..0..1..2..5..10..solved at 17
      #|0..0..0..2..5..solved at 10
      #|0..0..0..solved at 3
      #|0..0..0..0..0..0..solved at 6
      #|0..0..0..0..solved at 4
      #|0..0..1..3..7..15..28..66..118..202..solved at 254
      #|0..0..1..3..7..15..28..66..118..202..solved at 257
      #|0..0..3..6..14..27..45..solved at 51
      #|0..0..3..6..14..27..45..solved at 51
      #|0..0..0..0..solved at 8
      #|0..0..0..0..solved at 6
      #|0..0..2..4..13..25..solved at 43
      #|0..0..2..4..13..25..solved at 43
      #|0..0..0..0..solved at 6
      #|0..0..0..0..solved at 5
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..3..7..13..21..solved at 39
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..12..27..solved at 44
      #|0..0..solved at 2
      #|0..0..1..2..6..12..solved at 22
      #|0..0..1..2..6..13..33..solved at 52
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..7..12..21..30..43..solved at 52
      #|0..0..1..2..7..12..21..solved at 27
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..7..13..25..39..57..77..129..182..solved at 277
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..0..3..8..16..34..63..solved at 99
      #|0..0..0..0..3..8..16..34..63..solved at 83
      #|Warning: inventing type variables
      #|0..0..1..3..8..solved at 18
      #|Warning: inventing type variables
      #|0..0..1..2..3..7..14..23..solved at 44
      #|0..0..1..2..3..7..14..23..51..89..180..solved at 361
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..2..5..12..solved at 22
      #|0..0..2..6..15..32..81..solved at 90
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 3 critical pairs
      #|4 basis elements and 5 critical pairs
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 4 critical pairs
      #|6 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..11..18..solved at 24
      #|0..0..1..3..solved at 7
      #|0..0..1..3..solved at 7
      #|Warning: inventing type variables
      #|0..0..1..2..6..11..18..solved at 24
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..5..18..69..130..245..378..1187..2182..5311..9082..solved at 11833
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..18..solved at 44
      #|0..0..1..2..5..18..solved at 49
      #|0..0..1..2..5..18..solved at 39
      #|0..0..1..2..5..18..solved at 30
      #|0..0..1..2..5..18..77..146..303..496..1447..2602..6493..11278..solved at 15784
      #|0..0..1..2..5..18..solved at 25
      #|0..0..1..2..5..18..solved at 59
      #|0..0..1..2..5..18..solved at 64
      #|0..0..1..2..5..18..solved at 54
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 5
      #|0..0..solved at 2
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 5 critical pairs
      #|6 basis elements and 8 critical pairs
      #|7 basis elements and 13 critical pairs
      #|7 basis elements and 12 critical pairs
      #|7 basis elements and 11 critical pairs
      #|7 basis elements and 10 critical pairs
      #|8 basis elements and 15 critical pairs
      #|9 basis elements and 19 critical pairs
      #|9 basis elements and 18 critical pairs
      #|9 basis elements and 17 critical pairs
      #|10 basis elements and 25 critical pairs
      #|10 basis elements and 24 critical pairs
      #|10 basis elements and 23 critical pairs
      #|10 basis elements and 22 critical pairs
      #|11 basis elements and 28 critical pairs
      #|12 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 1 critical pairs
      #|3 basis elements and 2 critical pairs
      #|4 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 2 critical pairs
      #|4 basis elements and 3 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 2 critical pairs
      #|4 basis elements and 3 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|0..0..1..3..9..solved at 16
      #|0..0..1..3..9..16..34..61..105..191..355..solved at 465
      #|0..0..1..3..9..16..34..solved at 62
      #|0..0..solved at 2
      #|0..0..4..9..28..49..99..solved at 134
      #|0..0..4..9..28..49..99..solved at 127
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..4..solved at 7
      #|Warning: inventing type variables
      #|0..0..1..2..3..8..16..solved at 24
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
      #|Warning: inventing type variables
      #|0..0..2..4..18..39..solved at 64
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..4..15..30..solved at 36
      #|0..0..0..1..4..8..14..20..28..49..70..solved at 84
      #|0..0..0..1..4..8..14..20..28..49..70..solved at 84
      #|0..0..0..2..5..11..solved at 19
      #|0..0..1..5..13..23..solved at 29
      #|0..0..1..5..13..23..solved at 29
      #|0..0..1..4..10..solved at 15
      #|0..0..0..1..4..solved at 10
      #|0..0..1..4..10..solved at 15
      #|0..0..0..2..5..solved at 11
      #|Warning: inventing type variables
      #|0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..3..6..solved at 10
      #|0..0..1..2..3..solved at 8
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..1..4..10..solved at 15
      #|0..0..0..1..2..3..6..9..12..27..46..65..solved at 80
      #|0..0..1..4..10..solved at 15
      #|0..0..0..1..2..3..6..9..12..27..46..65..solved at 80
      #|0..0..1..4..10..solved at 15
      #|0..0..0..1..2..3..6..9..12..27..46..65..solved at 80
      #|0..0..1..4..10..solved at 15
      #|0..0..0..1..2..3..6..9..12..27..46..65..solved at 80
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..0..solved at 5
      #|0..0..0..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..3..5..solved at 10
      #|0..0..1..3..5..solved at 10
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..3..7..12..17..26..38..51..83..solved at 126
      #|0..0..0..1..2..3..4..5..6..solved at 21
      #|0..0..0..1..2..3..4..5..6..19..solved at 34
      #|0..0..solved at 2
      #|0..0..0..2..4..solved at 9
      #|0..0..0..0..1..4..7..solved at 13
      #|0..0..1..2..3..7..12..17..28..42..57..79..109..142..solved at 215
      #|0..0..1..2..3..solved at 8
      #|0..0..0..1..2..3..6..9..12..29..solved at 48
      #|0..0..solved at 2
      #|0..0..0..1..2..3..8..13..18..57..107..201..350..576..900..1885..3399..6258..solved at 9354
      #|0..0..0..2..4..solved at 9
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..solved at 5
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 6
      #|0..0..1..3..7..solved at 12
      #|0..0..1..solved at 6
      #|0..0..1..3..7..solved at 12
      #|0..0..0..0..4..10..20..solved at 28
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 5
      #|0..0..0..solved at 3
      #|0..0..0..solved at 5
      #|0..0..0..solved at 3
      #|0..0..0..2..4..solved at 9
      #|0..0..1..solved at 5
      #|0..0..1..2..5..solved at 11
      #|0..0..1..2..5..10..17..solved at 27
      #|0..0..0..solved at 3
      #|0..0..1..2..5..10..17..solved at 27
      #|0..0..0..solved at 3
      #|0..0..0..0..0..solved at 5
      #|0..0..0..2..5..12..solved at 24
      #|0..0..1..2..5..8..11..16..21..26..49..solved at 67
      #|0..0..0..2..solved at 6
      #|0..0..1..solved at 5
      #|0..0..0..solved at 3
      #|0..0..1..4..11..24..47..82..136..217..340..solved at 394
      #|0..0..0..2..solved at 6
      #|0..0..1..4..9..16..25..36..49..solved at 68
      #|0..0..0..2..solved at 6
      #|0..0..1..solved at 5
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..4..solved at 11
      #|0..0..1..2..5..8..11..16..21..26..49..solved at 67
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..8..11..16..21..26..49..solved at 67
      #|0..0..1..2..5..8..11..16..21..26..49..solved at 67
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..2..solved at 6
      #|0..0..0..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..1..2..11..29..60..solved at 73
      #|0..0..1..2..5..9..19..30..41..54..89..124..225..338..451..635..856..1077..1420..1789..2158..solved at 2328
      #|0..0..1..2..11..29..60..solved at 72
      #|0..0..1..2..9..23..51..solved at 59
      #|0..0..1..2..11..29..60..solved at 73
      #|0..0..1..2..11..29..60..solved at 72
      #|0..0..1..2..11..29..60..solved at 73
      #|0..0..1..2..11..29..60..solved at 72
      #|0..0..1..2..11..29..60..solved at 73
      #|0..0..1..2..11..29..60..solved at 72
      #|0..0..0..1..2..3..5..7..9..20..31..47..73..100..140..240..368..551..793..1137..1876..solved at 2678
      #|0..0..0..2..solved at 6
      #|0..0..1..2..5..10..21..solved at 32
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..solved at 11
      #|0..0..1..2..5..11..22..solved at 38
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..22..29..36..80..131..223..334..525..solved at 565
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..1..2..3..7..14..23..solved at 35
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|3 basis elements and 2 critical pairs
      #|4 basis elements and 4 critical pairs
      #|4 basis elements and 3 critical pairs
      #|5 basis elements and 5 critical pairs
      #|5 basis elements and 4 critical pairs
      #|6 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|Warning: inventing type variables
      #|0..0..1..3..5..9..14..21..solved at 33
      #|0..0..1..3..5..10..16..24..solved at 43
      #|0..0..1..3..5..9..14..21..solved at 34
      #|0..0..1..3..5..10..16..24..solved at 45
      #|0..0..1..2..5..solved at 11
      #|0..0..1..2..6..solved at 13
      #|0..0..1..2..5..solved at 11
      #|0..0..1..2..6..solved at 13
      #|0..0..1..4..11..27..solved at 33
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..5..9..solved at 15
      #|0..0..1..3..5..11..solved at 20
      #|0..0..1..3..5..9..solved at 15
      #|0..0..1..3..5..11..solved at 20
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 8
      #|3 basis elements and 2 critical pairs
      #|4 basis elements and 3 critical pairs
      #|4 basis elements and 2 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|0..0..1..2..6..11..solved at 22
      #|0..0..0..0..1..4..solved at 10
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..11..solved at 22
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..11..solved at 22
      #|0..0..solved at 2
      #|0..0..0..1..2..3..6..16..solved at 33
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
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
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..9..22..45..78..124..solved at 152
      #|0..0..1..3..13..26..56..93..solved at 101
      #|0..0..solved at 3
      #|0..0..2..6..12..22..44..84..153..322..754..2108..solved at 2864
      #|0..0..1..3..5..12..27..65..160..439..solved at 1073
      #|0..0..1..3..5..12..solved at 26
      #|0..0..1..solved at 4
      #|0..0..2..6..solved at 13
      #|0..0..1..solved at 4
      #|0..0..1..2..4..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..11..25..45..solved at 58
      #|0..0..4..9..29..64..115..236..413..744..solved at 989
      #|0..0..4..11..22..44..83..solved at 107
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..5..13..solved at 18
      #|0..0..2..5..solved at 9
      #|0..0..1..3..solved at 8
      #|0..0..3..7..solved at 14
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..2..9..19..40..86..solved at 96
      #|0..0..2..9..21..solved at 26
      #|0..0..2..5..solved at 13
      #|0..0..2..6..solved at 11
      #|0..0..2..8..solved at 17
      #|0..0..1..solved at 4
      #|0..0..2..6..solved at 11
      #|0..0..1..solved at 4
      #|0..0..3..solved at 6
      #|0..0..3..8..19..40..70..solved at 79
      #|0..0..2..solved at 6
      #|0..0..4..10..30..89..213..668..1674..solved at 1766
      #|0..0..4..13..40..104..262..717..solved at 775
      #|0..0..4..13..39..102..262..733..2098..6295..solved at 6569
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 6
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..2..5..14..solved at 19
      #|0..0..1..2..5..solved at 10
      #|0..0..1..2..5..9..solved at 15
      #|0..0..1..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 13
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..6..16..34..solved at 42
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
      #|0..0..3..solved at 9
      #|0..0..3..solved at 9
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 4
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
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 8
      #|0..0..2..5..11..solved at 16
      #|0..0..2..5..11..solved at 16
      #|0..0..2..5..11..solved at 16
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..4..solved at 10
      #|0..0..solved at 2
      #|0..0..3..6..solved at 12
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..3..solved at 7
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 4
      #|0..0..4..8..solved at 14
      #|0..0..solved at 4
      #|0..0..4..8..solved at 14
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..6..13..29..solved at 50
      #|Warning: inventing type variables
      #|0..0..4..8..solved at 22
      #|0..0..6..12..solved at 31
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..5..solved at 13
      #|0..0..2..4..solved at 11
      #|0..0..1..solved at 4
      #|0..0..3..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..1..2..5..11..22..44..71..118..222..solved at 338
      #|0..0..3..6..15..28..50..84..122..170..295..459..718..1142..solved at 1655
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..5..13..solved at 21
      #|0..0..2..5..14..solved at 23
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..10..solved at 24
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..5..13..solved at 21
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..3..6..13..solved at 41
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 9
      #|0..0..1..2..solved at 6
      #|0..0..1..2..7..solved at 12
      #|0..0..0..solved at 3
      #|0..0..2..5..12..27..47..solved at 59
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..2..5..12..27..solved at 33
      #|0..0..1..2..6..solved at 11
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..3..solved at 7
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..4..8..18..36..solved at 62
      #|0..0..3..6..15..29..solved at 49
      #|0..0..3..6..15..29..solved at 49
      #|0..0..1..solved at 4
      #|0..0..1..2..3..8..15..22..33..45..57..solved at 84
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
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
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..19..101..906..solved at 1074
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..5..14..42..146..solved at 398
      #|0..0..1..2..3..solved at 8
      #|0..0..2..23..solved at 62
      #|0..0..1..solved at 4
      #|0..0..1..5..15..45..153..505..2211..solved at 4949
      #|0..0..1..solved at 4
      #|0..0..1..6..solved at 10
      #|0..0..1..2..3..17..35..59..198..solved at 382
      #|0..0..1..solved at 4
      #|0..0..1..5..solved at 9
      #|0..0..1..4..7..16..34..56..97..149..211..302..486..713..solved at 919
      #|0..0..1..4..7..16..34..56..99..156..223..336..541..806..1365..2359..3968..solved at 4097
      #|0..0..1..4..7..16..34..56..99..156..223..339..556..833..solved at 930
      #|0..0..1..4..7..16..34..56..98..153..219..316..512..760..1281..solved at 1454
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..3..7..13..21..40..solved at 61
      #|0..0..1..2..6..12..solved at 20
      #|0..0..3..6..solved at 11
      #|0..0..solved at 2
      #|0..0..1..solved at 23
      #|0..0..solved at 2
      #|0..0..2..25..solved at 138
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..5..solved at 11
      #|0..0..5..solved at 11
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..1..7..18..solved at 23
      #|Warning: inventing type variables
      #|0..0..3..6..13..solved at 42
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..3..10..solved at 14
      #|0..0..3..10..solved at 14
      #|0..0..3..10..solved at 14
      #|0..0..3..7..15..36..69..solved at 90
      #|0..0..2..5..12..29..55..solved at 67
      #|0..0..2..5..12..29..55..solved at 67
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..2..5..solved at 9
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..6..12..solved at 27
      #|0..0..2..solved at 5
      #|0..0..1..4..solved at 11
      #|0..0..1..5..11..20..43..76..solved at 103
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..6..12..solved at 28
      #|0..0..2..solved at 5
      #|0..0..1..4..solved at 11
      #|0..0..1..5..11..20..43..76..solved at 103
      #|0..0..1..2..3..7..solved at 14
      #|0..0..2..solved at 5
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..3..9..25..68..solved at 169
      #|0..0..3..solved at 7
      #|0..0..1..20..solved at 69
      #|0..0..1..4..solved at 13
      #|0..0..1..solved at 4
      #|0..0..1..2..6..12..solved at 22
      #|0..0..2..4..8..solved at 26
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..2..6..19..68..solved at 84
      #|0..0..solved at 3
      #|0..0..2..solved at 7
      #|0..0..3..8..21..47..solved at 53
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..solved at 7
      #|0..0..3..8..solved at 29
      #|0..0..4..9..solved at 14
      #|0..0..4..solved at 7
      #|0..0..3..solved at 8
      #|0..0..3..solved at 8
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 5
      #|0..0..5..11..solved at 16
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..4..8..23..50..solved at 71
      #|0..0..4..solved at 7
      #|0..0..2..18..106..solved at 171
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..2..4..solved at 9
      #|0..0..2..4..solved at 9
      #|0..0..1..4..10..solved at 20
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..7..14..21..solved at 28
      #|0..0..solved at 2
      #|0..0..2..19..101..913..solved at 1070
      #|0..0..2..19..101..912..solved at 1067
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..8..19..solved at 33
      #|0..0..1..32..366..solved at 1792
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..7..14..21..solved at 28
      #|0..0..solved at 2
      #|0..0..2..19..101..917..solved at 1074
      #|0..0..2..19..101..916..solved at 1071
      #|0..0..2..24..solved at 64
      #|0..0..1..solved at 4
      #|0..0..2..33..349..2433..solved at 7599
      #|0..0..1..2..solved at 6
      #|0..0..1..32..366..2498..solved at 20166
      #|Warning: inventing type variables
      #|0..0..2..8..28..66..solved at 83
      #|0..0..2..8..28..64..169..373..766..solved at 1012
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..4..14..44..101..273..solved at 317
      #|0..0..4..14..44..99..267..solved at 307
      #|0..0..2..8..34..solved at 74
      #|0..0..2..8..34..solved at 80
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..2..8..28..64..169..374..solved at 727
      #|0..0..2..8..solved at 19
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..4..14..44..99..267..solved at 307
      #|0..0..4..14..44..101..273..solved at 317
      #|0..0..2..8..34..solved at 80
      #|0..0..2..8..34..solved at 74
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..1..10..29..71..solved at 77
      #|0..0..3..23..solved at 54
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..12..39..179..solved at 316
      #|0..0..1..solved at 4
      #|0..0..1..solved at 10
      #|0..0..3..6..13..27..47..75..solved at 83
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..3..9..19..solved at 31
      #|0..0..1..2..3..solved at 8
      #|0..0..2..21..solved at 66
      #|0..0..solved at 3
      #|0..0..2..21..solved at 66
      #|0..0..2..21..solved at 66
      #|0..0..2..4..solved at 12
      #|0..0..2..4..solved at 9
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 13
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..6..14..solved at 26
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..11..solved at 17
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..11..24..solved at 44
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..solved at 11
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..solved at 12
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..solved at 11
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..2..7..24..solved at 39
      #|0..0..3..solved at 6
      #|0..0..2..8..27..solved at 49
      #|0..0..2..9..30..solved at 55
      #|0..0..1..5..19..solved at 30
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..4..8..20..36..58..92..131..184..280..solved at 353
      #|0..0..3..6..15..26..41..62..85..113..174..solved at 206
      #|0..0..3..6..15..28..47..76..110..158..241..solved at 301
      #|0..0..2..4..10..18..30..46..64..87..135..solved at 154
      #|0..0..2..6..solved at 14
      #|0..0..1..4..solved at 9
      #|0..0..4..12..35..89..solved at 107
      #|0..0..3..10..30..79..solved at 90
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..8..20..36..58..92..131..184..280..solved at 353
      #|0..0..3..6..15..28..47..76..110..158..241..solved at 301
      #|0..0..3..6..15..26..41..62..85..113..174..solved at 206
      #|0..0..2..4..10..18..30..46..64..87..135..solved at 154
      #|0..0..2..6..solved at 14
      #|0..0..1..4..solved at 9
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..4..8..solved at 22
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..2..4..14..29..65..123..245..solved at 328
      #|0..0..2..4..15..31..65..solved at 74
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..4..9..solved at 21
      #|0..0..solved at 2
      #|0..0..3..7..solved at 16
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..5..20..90..706..5786..solved at 5959
      #|0..0..4..18..solved at 35
      #|0..0..4..solved at 11
      #|0..0..2..4..solved at 8
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..4..8..17..32..solved at 42
      #|0..0..1..solved at 6
      #|0..0..1..5..16..36..solved at 87
      #|0..0..3..6..solved at 14
      #|0..0..2..6..14..30..solved at 42
      #|0..0..3..solved at 8
      #|0..0..3..9..21..45..solved at 52
      #|0..0..2..6..14..29..50..97..solved at 140
      #|Warning: inventing type variables
      #|0..0..1..3..9..22..51..107..solved at 167
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..3..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..1..2..5..11..27..47..solved at 59
      #|0..0..solved at 4
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..4..8..21..39..65..solved at 82
      #|0..0..1..3..7..15..solved at 27
      #|0..0..1..3..7..15..27..solved at 36
      #|0..0..1..4..11..solved at 16
      #|0..0..1..4..8..21..39..64..113..184..solved at 209
      #|0..0..1..4..11..solved at 16
      #|Warning: inventing type variables
      #|0..0..1..3..9..22..51..107..solved at 167
      #|Warning: inventing type variables
      #|0..0..2..5..18..46..solved at 61
      #|0..0..4..9..28..solved at 39
      #|0..0..solved at 2
      #|0..0..2..4..13..25..solved at 34
      #|0..0..3..solved at 6
      #|0..0..3..6..solved at 12
      #|0..0..4..8..solved at 12
      #|0..0..3..8..27..76..212..557..1782..solved at 3540
      #|0..0..5..12..41..103..263..658..1988..solved at 3953
      #|0..0..2..9..solved at 32
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..4..12..solved at 20
      #|0..0..3..11..solved at 17
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 8
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 7
      #|0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 7
      #|0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 7
      #|0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 7
      #|0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..8..solved at 15
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..7..14..solved at 30
      #|0..0..5..10..solved at 20
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..10..solved at 20
      #|0..0..3..6..solved at 10
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..16..solved at 25
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..8..22..solved at 38
      #|0..0..6..18..solved at 28
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..6..18..solved at 28
      #|0..0..4..14..solved at 18
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..10..27..66..133..solved at 163
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..6..16..42..89..162..solved at 201
      #|0..0..4..12..32..73..140..solved at 169
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..12..32..73..140..solved at 169
      #|0..0..2..8..22..57..118..solved at 137
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..8..solved at 15
      #|0..0..6..solved at 11
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..6..solved at 11
      #|0..0..4..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..8..solved at 15
      #|0..0..6..solved at 11
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..6..solved at 11
      #|0..0..4..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 6
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..15..45..solved at 58
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..8..21..60..solved at 81
      #|0..0..6..17..50..solved at 65
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..6..17..50..solved at 65
      #|0..0..4..13..40..solved at 49
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..10..solved at 14
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..8..18..solved at 34
      #|0..0..6..14..solved at 24
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..6..14..solved at 24
      #|0..0..4..10..solved at 14
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
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
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
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
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 7
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 6
      #|0..0..3..10..26..63..122..239..solved at 333
      #|0..0..2..8..21..54..108..223..solved at 303
      #|0..0..4..12..31..74..142..283..solved at 395
      #|0..0..4..12..31..74..142..283..solved at 395
      #|0..0..6..16..41..86..152..287..solved at 387
      #|0..0..5..12..solved at 22
      #|0..0..4..10..solved at 17
      #|0..0..6..14..solved at 27
      #|0..0..6..14..solved at 27
      #|0..0..8..18..solved at 37
      #|0..0..7..28..solved at 35
      #|0..0..6..solved at 22
      #|0..0..8..38..solved at 64
      #|0..0..8..38..solved at 64
      #|0..0..10..solved at 13
      #|0..0..7..28..solved at 36
      #|0..0..6..solved at 23
      #|0..0..8..38..solved at 65
      #|0..0..8..38..solved at 65
      #|0..0..10..solved at 13
      #|0..0..7..28..solved at 35
      #|0..0..6..solved at 22
      #|0..0..8..38..solved at 64
      #|0..0..8..38..solved at 64
      #|0..0..10..solved at 13
      #|0..0..7..28..solved at 36
      #|0..0..6..solved at 23
      #|0..0..8..38..solved at 65
      #|0..0..8..38..solved at 65
      #|0..0..10..solved at 13
      #|0..0..4..11..solved at 15
      #|0..0..4..11..solved at 15
      #|0..0..6..15..solved at 25
      #|0..0..6..15..solved at 25
      #|0..0..8..19..solved at 35
      #|0..0..4..16..solved at 20
      #|0..0..6..20..solved at 30
      #|0..0..6..20..solved at 30
      #|0..0..8..24..solved at 40
      #|0..0..4..16..45..120..solved at 147
      #|0..0..6..20..55..140..solved at 181
      #|0..0..6..20..55..140..solved at 181
      #|0..0..8..24..65..152..solved at 191
      #|0..0..5..11..solved at 16
      #|0..0..7..15..solved at 26
      #|0..0..7..15..solved at 26
      #|0..0..9..19..solved at 36
      #|0..0..5..11..solved at 25
      #|0..0..7..15..solved at 35
      #|0..0..7..15..solved at 35
      #|0..0..9..19..solved at 45
      #|0..0..solved at 2
      #|0..0..5..11..30..130..421..solved at 440
      #|0..0..solved at 2
      #|0..0..5..11..30..130..421..solved at 440
      #|0..0..7..15..40..151..459..solved at 478
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..7..15..40..149..451..solved at 470
      #|0..0..solved at 2
      #|0..0..7..15..40..149..451..solved at 470
      #|0..0..7..15..40..151..459..solved at 478
      #|0..0..solved at 3
      #|0..0..9..19..50..163..469..solved at 488
      #|0..0..solved at 3
      #|0..0..9..19..50..163..469..solved at 488
      #|0..0..solved at 5
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 7
      #|0..0..solved at 2
      #|0..0..1..2..3..solved at 11
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..6..solved at 10
      #|0..0..0..5..17..47..solved at 64
      #|0..0..1..7..solved at 14
      #|0..0..1..5..13..solved at 21
      #|0..0..0..3..7..17..solved at 35
      #|0..0..1..2..solved at 8
      #|0..0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..2..4..solved at 10
      #|0..0..1..3..solved at 10
      #|0..0..1..6..15..34..solved at 65
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..6..solved at 10
      #|0..0..0..5..17..47..solved at 64
      #|0..0..1..7..solved at 14
      #|0..0..1..5..13..solved at 21
      #|0..0..0..3..solved at 10
      #|0..0..1..2..solved at 8
      #|0..0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..2..4..solved at 10
      #|0..0..1..5..solved at 12
      #|0..0..1..6..solved at 18
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..3..7..solved at 20
      #|0..0..2..5..solved at 12
      #|0..0..3..solved at 13
      #|0..0..2..solved at 11
      #|0..0..1..solved at 5
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..2..5..16..36..83..solved at 183
      #|Warning: inventing type variables
      #|0..0..1..2..6..11..19..28..37..46..solved at 59
      #|0..0..1..2..3..solved at 8
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..3..solved at 11
      #|0..0..solved at 2
      #|0..0..1..2..3..solved at 11
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..3..solved at 9
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..4..solved at 16
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..2..4..9..solved at 23
      #|0..0..solved at 2
      #|0..0..2..4..9..solved at 23
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..8..20..60..solved at 79
      #|0..0..1..solved at 4
      #|0..0..1..3..11..25..52..solved at 91
      #|0..0..solved at 4
      #|0..0..2..4..solved at 8
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..3..8..21..43..90..190..368..712..1390..2581..4906..9360..17814..solved at 22526
      #|0..0..2..6..13..36..solved at 45
      #|Warning: inventing type variables
      #|0..0..3..7..15..35..solved at 50
      #|0..0..2..5..10..25..solved at 33
      #|0..0..3..7..13..32..solved at 48
      #|0..0..2..5..10..25..solved at 33
      #|0..0..3..solved at 6
      #|0..0..solved at 3
      #|0..0..4..solved at 8
      #|0..0..3..solved at 6
      #|0..0..4..10..22..52..solved at 66
      #|0..0..solved at 3
      #|0..0..3..8..17..43..solved at 51
      #|0..0..3..8..17..43..solved at 51
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..2..6..12..30..62..solved at 114
      #|0..0..1..3..6..15..30..solved at 53
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..5..22..51..135..307..766..solved at 1050
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..11..35..72..124..190..270..solved at 290
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|Warning: inventing type variables
      #|0..0..0..solved at 6
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..1..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..2..solved at 5
      #|Warning: inventing type variables
      #|0..0..1..solved at 9
      #|0..0..1..solved at 6
      #|Warning: inventing type variables
      #|0..0..0..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..3..7..14..solved at 21
      #|Warning: inventing type variables
      #|0..0..0..1..solved at 5
      #|Warning: inventing type variables
      #|0..0..0..1..6..13..40..97..solved at 127
      #|Warning: inventing type variables
      #|0..0..0..1..4..8..32..solved at 41
      #|Warning: inventing type variables
      #|0..0..0..1..4..9..37..77..solved at 111
      #|Warning: inventing type variables
      #|0..0..1..4..solved at 9
      #|Warning: inventing type variables
      #|0..0..1..6..19..41..115..solved at 138
      #|Warning: inventing type variables
      #|0..0..0..3..11..solved at 23
      #|Warning: inventing type variables
      #|0..0..0..1..4..9..33..68..128..260..462..753..1327..solved at 1518
      #|Warning: inventing type variables
      #|0..0..1..5..14..34..solved at 45
      #|Warning: inventing type variables
      #|0..0..1..5..14..34..solved at 42
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..7..27..60..156..398..968..solved at 1013
      #|0..0..1..4..10..22..45..95..solved at 103
      #|0..0..1..4..11..23..45..93..solved at 101
      #|0..0..1..5..11..24..48..88..solved at 95
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
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
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
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
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..0..2..5..8..28..60..solved at 94
      #|0..0..0..2..6..10..32..82..147..solved at 159
      #|0..0..1..4..14..solved at 21
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..3..5..solved at 15
      #|0..0..1..3..15..solved at 21
      #|0..0..1..3..16..solved at 23
      #|0..0..1..3..5..17..33..65..solved at 124
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..7..26..112..509..1778..solved at 2556
      #|0..0..1..6..23..101..481..1682..solved at 2448
      #|0..0..2..solved at 5
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..3..5..solved at 10
      #|0..0..1..3..5..solved at 10
      #|0..0..1..3..5..solved at 10
      #|0..0..1..4..15..solved at 22
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..3..6..solved at 11
      #|0..0..1..12..37..91..solved at 112
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..3..solved at 8
      #|0..0..1..12..41..solved at 50
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
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..4..solved at 8
      #|0..0..2..12..solved at 17
      #|0..0..2..16..56..solved at 65
      #|0..0..2..7..19..46..solved at 57
      #|0..0..2..12..solved at 17
      #|0..0..2..16..52..144..solved at 165
      #|Warning: inventing type variables
      #|0..0..1..3..5..14..solved at 22
      #|0..0..1..3..12..28..solved at 36
      #|0..0..1..8..solved at 12
      #|Warning: inventing type variables
      #|0..0..1..7..27..92..419..solved at 430
      #|0..0..1..7..15..74..352..1202..solved at 1308
      #|0..0..1..8..solved at 12
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 8
      #|0..0..1..3..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..1..3..solved at 7
      #|0..0..1..3..solved at 7
      #|0..0..1..3..solved at 7
      #|0..0..1..4..9..16..29..44..solved at 53
      #|0..0..1..solved at 5
      #|0..0..0..2..6..12..24..38..solved at 46
      #|0..0..0..2..6..solved at 11
      #|0..0..0..2..6..solved at 11
      #|0..0..0..2..6..solved at 11
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..4..solved at 9
      #|0..0..1..solved at 4
      #|0..0..1..4..solved at 9
      #|0..0..solved at 2
      #|0..0..2..5..16..52..190..755..3337..solved at 3351
      #|0..0..2..5..16..52..190..755..3337..solved at 3351
      #|0..0..2..6..13..solved at 18
      #|0..0..2..solved at 5
      #|0..0..2..6..13..solved at 18
      #|0..0..solved at 2
      #|0..0..2..5..solved at 10
      #|0..0..2..solved at 5
      #|0..0..2..5..solved at 10
      #|0..0..solved at 2
      #|0..0..2..solved at 8
      #|0..0..2..solved at 8
      #|0..0..1..solved at 6
      #|0..0..2..solved at 7
      #|0..0..2..solved at 7
      #|0..0..1..solved at 5
      #|0..0..2..4..solved at 9
      #|0..0..2..4..solved at 9
      #|0..0..1..2..solved at 6
      #|0..0..2..solved at 8
      #|0..0..2..solved at 8
      #|0..0..1..solved at 6
      #|0..0..2..solved at 7
      #|0..0..2..solved at 7
      #|0..0..1..solved at 5
      #|0..0..2..4..solved at 9
      #|0..0..2..4..solved at 9
      #|0..0..1..2..solved at 6
      #|0..0..2..solved at 7
      #|0..0..2..solved at 7
      #|0..0..1..solved at 5
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..2..4..solved at 9
      #|0..0..2..4..solved at 9
      #|0..0..1..2..solved at 6
      #|0..0..2..solved at 8
      #|0..0..2..solved at 8
      #|0..0..1..solved at 6
      #|0..0..2..solved at 7
      #|0..0..2..solved at 7
      #|0..0..1..solved at 5
      #|0..0..2..4..solved at 9
      #|0..0..2..4..solved at 9
      #|0..0..1..2..solved at 6
      #|0..0..2..4..solved at 9
      #|0..0..2..4..solved at 9
      #|0..0..1..2..solved at 6
      #|0..0..3..6..20..39..solved at 46
      #|0..0..4..solved at 11
      #|Warning: inventing type variables
      #|0..0..2..5..solved at 10
      #|0..0..1..3..solved at 7
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..5..solved at 11
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..5..solved at 11
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 12
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..4..solved at 11
      #|0..0..2..4..solved at 9
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..3..4..solved at 10
      #|0..0..2..4..solved at 11
      #|0..0..2..4..solved at 9
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 7
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 9
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..4..solved at 8
      #|0..0..4..solved at 7
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..2..solved at 7
      #|0..0..3..9..19..53..solved at 59
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..3..solved at 8
      #|0..0..2..solved at 5
      #|0..0..2..solved at 7
      #|0..0..3..9..21..82..222..484..1271..solved at 1289
      #|0..0..2..solved at 5
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..2..7..19..57..166..396..1018..solved at 2135
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..4..11..27..62..148..319..624..1202..2208..4052..7823..solved at 10939
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..5..solved at 9
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..5..solved at 9
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..3..7..18..61..158..solved at 173
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..solved at 6
      #|0..0..1..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..3..solved at 9
      #|0..0..2..solved at 7
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..6..solved at 12
      #|0..0..1..solved at 4
      #|0..0..2..5..8..25..solved at 54
      #|0..0..1..4..8..19..solved at 45
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..3..9..19..32..48..solved at 71
      #|0..0..2..6..14..25..39..solved at 60
      #|0..0..2..6..13..24..39..solved at 56
      #|0..0..1..3..8..17..31..solved at 46
      #|0..0..solved at 2
      #|0..0..3..10..27..83..258..solved at 328
      #|0..0..2..7..26..72..247..721..solved at 1107
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..6..solved at 12
      #|0..0..3..7..solved at 14
      #|0..0..2..4..solved at 8
      #|0..0..2..5..solved at 10
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..4..8..solved at 14
      #|0..0..3..7..solved at 11
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..10..solved at 14
      #|0..0..5..11..solved at 15
      #|0..0..4..8..solved at 12
      #|0..0..4..9..solved at 14
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..8..solved at 12
      #|0..0..solved at 2
      #|0..0..4..8..solved at 12
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..2..solved at 7
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..3..6..solved at 12
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..3..solved at 9
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..4..solved at 8
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..4..8..solved at 13
      #|0..0..solved at 2
      #|0..0..3..6..solved at 10
      #|0..0..4..solved at 10
      #|0..0..solved at 2
      #|0..0..3..solved at 7
      #|0..0..6..14..solved at 18
      #|0..0..solved at 2
      #|0..0..5..solved at 10
      #|Warning: inventing type variables
      #|0..0..2..5..12..37..103..210..521..solved at 583
      #|0..0..2..4..solved at 9
      #|0..0..2..4..solved at 9
      #|0..0..1..2..solved at 6
      #|0..0..2..4..solved at 9
      #|0..0..2..4..solved at 9
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 8
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 8
      #|0..0..2..solved at 5
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
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..1..2..solved at 7
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 8
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..4..solved at 8
      #|0..0..0..3..solved at 9
      #|0..0..3..solved at 6
      #|0..0..2..4..7..19..solved at 32
      #|0..0..2..6..18..solved at 29
      #|0..0..4..8..21..solved at 42
      #|0..0..2..4..solved at 8
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..solved at 6
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..3..9..19..solved at 30
      #|0..0..solved at 3
      #|0..0..4..9..14..47..97..solved at 121
      #|0..0..solved at 3
      #|0..0..4..solved at 9
      #|0..0..1..solved at 4
      #|0..0..3..solved at 8
      #|0..0..2..4..solved at 8
      #|0..0..4..8..solved at 15
      #|0..0..solved at 2
      #|0..0..4..8..14..42..79..solved at 103
      #|0..0..2..4..8..solved at 14
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 8
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..2..solved at 6
      #|0..0..2..4..solved at 9
      #|0..0..1..2..solved at 6
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 8
      #|0..0..3..6..11..31..59..95..solved at 183
      #|0..0..2..4..8..20..37..59..solved at 103
      #|Warning: inventing type variables
      #|0..0..3..6..solved at 18
      #|0..0..5..10..37..83..247..551..1513..solved at 1887
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..solved at 6
      #|0..0..3..12..44..solved at 52
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..4..solved at 7
      #|0..0..2..8..solved at 15
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..9..solved at 14
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 15
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 8
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..3..7..14..30..66..121..199..321..516..776..solved at 851
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..1..solved at 8
      #|0..0..1..7..solved at 16
      #|0..0..0..1..5..solved at 10
      #|0..0..solved at 3
      #|0..0..2..solved at 9
      #|0..0..solved at 3
      #|0..0..2..8..solved at 15
      #|0..0..solved at 2
      #|0..0..1..3..10..solved at 19
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..3..solved at 10
      #|0..0..3..solved at 11
      #|0..0..2..7..34..67..171..421..solved at 682
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 10
      #|0..0..4..solved at 11
      #|0..0..3..9..36..70..177..411..solved at 642
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..1..solved at 8
      #|0..0..1..7..solved at 16
      #|0..0..0..4..26..solved at 47
      #|0..0..solved at 3
      #|0..0..2..solved at 9
      #|0..0..solved at 3
      #|0..0..2..8..solved at 15
      #|0..0..solved at 2
      #|0..0..1..7..31..solved at 59
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..3..solved at 10
      #|0..0..3..solved at 11
      #|0..0..2..7..34..solved at 59
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 10
      #|0..0..4..solved at 11
      #|0..0..3..9..36..solved at 64
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..1..solved at 8
      #|0..0..1..solved at 9
      #|0..0..0..1..5..solved at 10
      #|0..0..solved at 3
      #|0..0..2..solved at 9
      #|0..0..solved at 3
      #|0..0..2..solved at 9
      #|0..0..solved at 2
      #|0..0..1..3..10..solved at 19
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..3..solved at 10
      #|0..0..3..solved at 11
      #|0..0..2..7..34..67..171..421..solved at 682
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 10
      #|0..0..4..solved at 11
      #|0..0..3..9..36..70..177..411..solved at 642
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..1..solved at 8
      #|0..0..1..solved at 9
      #|0..0..0..1..8..27..101..234..560..solved at 881
      #|0..0..solved at 3
      #|0..0..2..solved at 10
      #|0..0..solved at 3
      #|0..0..2..solved at 9
      #|0..0..solved at 2
      #|0..0..1..3..13..33..117..266..589..solved at 899
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..3..solved at 10
      #|0..0..3..solved at 11
      #|0..0..2..7..37..solved at 63
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 10
      #|0..0..4..solved at 11
      #|0..0..3..9..39..solved at 68
      #|0..0..2..4..solved at 9
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..2..4..solved at 9
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..2..3..solved at 8
      #|0..0..3..solved at 10
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..3..solved at 8
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
      #|0..0..2..solved at 5
      #|0..0..26..88..178..380..816..1544..2919..solved at 3225
      #|0..0..26..88..179..384..828..1617..3054..solved at 5518
      #|0..0..25..81..165..356..760..1453..2730..solved at 4875
      #|0..0..25..81..166..364..775..1483..2795..solved at 4984
      #|0..0..26..88..179..384..828..1617..3054..solved at 3360
      #|0..0..26..88..180..388..840..1690..3189..5823..solved at 5950
      #|0..0..25..81..166..365..797..1595..3028..5503..solved at 7902
      #|0..0..25..81..168..374..813..1630..3103..5643..solved at 8042
      #|0..0..25..89..223..477..1008..2065..3973..solved at 4446
      #|0..0..25..89..224..486..1049..2219..4305..9167..solved at 9376
      #|0..0..24..86..234..506..1053..2259..4405..9736..21559..solved at 34683
      #|0..0..24..86..234..509..1070..2290..4473..9921..21938..solved at 36442
      #|0..0..2..solved at 9
      #|0..0..2..solved at 9
      #|0..0..1..7..solved at 17
      #|0..0..1..7..solved at 19
      #|0..0..2..solved at 9
      #|0..0..2..solved at 9
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 9
      #|0..0..2..solved at 9
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..2..solved at 9
      #|0..0..2..solved at 9
      #|0..0..1..6..solved at 14
      #|0..0..1..6..solved at 14
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 9
      #|0..0..2..solved at 9
      #|0..0..1..7..solved at 18
      #|0..0..1..7..solved at 19
      #|0..0..2..solved at 9
      #|0..0..2..solved at 9
      #|0..0..1..6..13..35..solved at 68
      #|0..0..1..6..13..35..solved at 68
      #|0..0..2..solved at 9
      #|0..0..2..solved at 9
      #|0..0..1..6..solved at 15
      #|0..0..1..6..solved at 15
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 28
      #|0..0..solved at 28
      #|0..0..solved at 27
      #|0..0..solved at 27
      #|0..0..27..solved at 34
      #|0..0..27..solved at 34
      #|0..0..26..solved at 83
      #|0..0..26..solved at 83
      #|0..0..solved at 28
      #|0..0..solved at 28
      #|0..0..solved at 27
      #|0..0..solved at 27
      #|0..0..27..solved at 34
      #|0..0..27..solved at 34
      #|0..0..26..solved at 83
      #|0..0..26..solved at 83
      #|0..0..solved at 27
      #|0..0..solved at 27
      #|0..0..solved at 26
      #|0..0..solved at 26
      #|0..0..26..solved at 33
      #|0..0..26..solved at 33
      #|0..0..25..90..237..solved at 501
      #|0..0..25..90..239..solved at 515
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 9
      #|0..0..3..solved at 9
      #|0..0..2..8..solved at 17
      #|0..0..2..8..solved at 19
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 9
      #|0..0..3..solved at 9
      #|0..0..2..7..17..41..solved at 68
      #|0..0..2..7..17..41..solved at 68
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 9
      #|0..0..3..solved at 9
      #|0..0..2..7..solved at 14
      #|0..0..2..7..solved at 14
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 9
      #|0..0..3..solved at 9
      #|0..0..2..7..solved at 15
      #|0..0..2..7..solved at 15
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 9
      #|0..0..3..solved at 9
      #|0..0..2..8..solved at 18
      #|0..0..2..8..solved at 19
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 9
      #|0..0..3..solved at 9
      #|0..0..2..7..16..40..solved at 69
      #|0..0..2..7..16..40..solved at 69
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 9
      #|0..0..3..solved at 9
      #|0..0..2..7..solved at 16
      #|0..0..2..7..solved at 16
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..solved at 2
      #|0..0..3..11..solved at 19
      #|0..0..4..solved at 12
      #|0..0..3..11..solved at 19
      #|0..0..3..11..solved at 19
      #|0..0..solved at 2
      #|0..0..4..solved at 18
      #|0..0..3..solved at 11
      #|0..0..3..solved at 11
      #|0..0..3..solved at 11
      #|0..0..solved at 2
      #|0..0..3..19..solved at 27
      #|0..0..3..solved at 11
      #|0..0..2..16..94..194..solved at 394
      #|0..0..2..16..95..201..solved at 437
      #|0..0..solved at 2
      #|0..0..4..solved at 11
      #|0..0..4..solved at 11
      #|0..0..3..6..15..solved at 26
      #|0..0..3..6..15..solved at 26
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..4..solved at 12
      #|0..0..3..solved at 7
      #|0..0..3..solved at 7
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..4..solved at 12
      #|0..0..3..8..23..solved at 35
      #|0..0..3..8..23..solved at 37
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..4..solved at 12
      #|0..0..3..7..21..54..solved at 88
      #|0..0..3..7..21..54..solved at 88
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 18
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 18
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..11..solved at 20
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..11..solved at 20
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..4..solved at 12
      #|0..0..3..7..solved at 16
      #|0..0..3..7..solved at 16
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..4..solved at 12
      #|0..0..3..12..solved at 24
      #|0..0..3..12..solved at 25
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..4..solved at 12
      #|0..0..3..7..20..52..solved at 87
      #|0..0..3..7..20..52..solved at 87
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 18
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 18
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..11..solved at 21
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..11..solved at 21
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..3..solved at 11
      #|0..0..3..solved at 11
      #|0..0..3..solved at 11
      #|0..0..solved at 2
      #|0..0..4..12..solved at 19
      #|0..0..5..solved at 12
      #|0..0..4..12..solved at 19
      #|0..0..4..12..solved at 19
      #|0..0..solved at 2
      #|0..0..5..solved at 17
      #|0..0..4..solved at 11
      #|0..0..4..solved at 11
      #|0..0..4..solved at 11
      #|0..0..solved at 2
      #|0..0..4..22..solved at 29
      #|0..0..4..solved at 11
      #|0..0..3..20..97..201..solved at 414
      #|0..0..3..20..98..208..solved at 454
      #|0..0..solved at 2
      #|0..0..5..solved at 11
      #|0..0..5..solved at 11
      #|0..0..4..8..20..solved at 31
      #|0..0..4..8..20..solved at 31
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..5..solved at 12
      #|0..0..4..solved at 8
      #|0..0..4..solved at 8
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..5..solved at 12
      #|0..0..4..10..27..solved at 38
      #|0..0..4..10..27..solved at 40
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..5..solved at 12
      #|0..0..4..9..25..60..solved at 91
      #|0..0..4..9..25..60..solved at 91
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 17
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 17
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..12..solved at 20
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..12..solved at 20
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..5..solved at 12
      #|0..0..4..9..solved at 17
      #|0..0..4..9..solved at 17
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..5..solved at 12
      #|0..0..4..13..solved at 24
      #|0..0..4..13..solved at 25
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..5..solved at 12
      #|0..0..4..9..24..58..solved at 90
      #|0..0..4..9..24..58..solved at 90
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 17
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 17
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..12..solved at 21
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..12..solved at 21
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..4..solved at 11
      #|0..0..4..solved at 11
      #|0..0..4..solved at 11
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
      #|0..0..2..solved at 5
      #|0..0..26..88..178..380..816..1544..2919..solved at 3225
      #|0..0..26..88..179..384..828..1617..3055..solved at 5525
      #|0..0..25..81..165..356..760..1453..2730..solved at 4875
      #|0..0..25..81..166..364..775..1483..2795..solved at 4984
      #|0..0..26..88..179..384..828..1617..3055..solved at 3361
      #|0..0..26..88..180..388..840..1690..3191..5837..solved at 5964
      #|0..0..25..81..166..365..797..1595..3030..5516..solved at 7915
      #|0..0..25..81..168..374..813..1630..3105..5656..solved at 8055
      #|0..0..25..89..223..477..1008..2065..3973..solved at 4446
      #|0..0..25..89..224..486..1049..2219..4307..9182..solved at 9391
      #|0..0..24..86..234..506..1053..2259..4405..9738..21579..40512..solved at 47276
      #|0..0..24..86..234..509..1070..2290..4473..9924..21958..41379..solved at 52251
      #|0..0..2..solved at 9
      #|0..0..2..solved at 9
      #|0..0..1..8..solved at 19
      #|0..0..1..8..solved at 21
      #|0..0..2..solved at 10
      #|0..0..2..solved at 10
      #|0..0..1..7..solved at 16
      #|0..0..1..7..solved at 16
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 10
      #|0..0..2..solved at 10
      #|0..0..1..7..solved at 16
      #|0..0..1..7..solved at 16
      #|0..0..2..solved at 9
      #|0..0..2..solved at 9
      #|0..0..1..7..solved at 16
      #|0..0..1..7..solved at 16
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 9
      #|0..0..2..solved at 9
      #|0..0..1..8..solved at 20
      #|0..0..1..8..solved at 21
      #|0..0..2..solved at 9
      #|0..0..2..solved at 9
      #|0..0..1..7..15..38..solved at 83
      #|0..0..1..7..15..38..solved at 83
      #|0..0..2..solved at 9
      #|0..0..2..solved at 9
      #|0..0..1..7..solved at 17
      #|0..0..1..7..solved at 17
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 28
      #|0..0..solved at 28
      #|0..0..solved at 27
      #|0..0..solved at 27
      #|0..0..27..solved at 34
      #|0..0..27..solved at 34
      #|0..0..26..solved at 83
      #|0..0..26..solved at 83
      #|0..0..solved at 28
      #|0..0..solved at 28
      #|0..0..solved at 27
      #|0..0..solved at 27
      #|0..0..27..solved at 34
      #|0..0..27..solved at 34
      #|0..0..26..solved at 83
      #|0..0..26..solved at 83
      #|0..0..solved at 27
      #|0..0..solved at 27
      #|0..0..solved at 26
      #|0..0..solved at 26
      #|0..0..26..solved at 33
      #|0..0..26..solved at 33
      #|0..0..25..90..237..solved at 455
      #|0..0..25..90..239..solved at 466
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 10
      #|0..0..3..solved at 10
      #|0..0..2..9..solved at 19
      #|0..0..2..9..solved at 21
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 10
      #|0..0..3..solved at 10
      #|0..0..2..8..19..44..solved at 82
      #|0..0..2..8..19..44..solved at 82
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 10
      #|0..0..3..solved at 10
      #|0..0..2..8..solved at 16
      #|0..0..2..8..solved at 16
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 10
      #|0..0..3..solved at 10
      #|0..0..2..8..solved at 17
      #|0..0..2..8..solved at 17
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 10
      #|0..0..3..solved at 10
      #|0..0..2..9..solved at 20
      #|0..0..2..9..solved at 21
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 10
      #|0..0..3..solved at 10
      #|0..0..2..8..18..43..solved at 83
      #|0..0..2..8..18..43..solved at 83
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 10
      #|0..0..3..solved at 10
      #|0..0..2..8..solved at 18
      #|0..0..2..8..solved at 18
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..solved at 2
      #|0..0..3..11..solved at 19
      #|0..0..4..solved at 12
      #|0..0..3..11..solved at 19
      #|0..0..3..11..solved at 19
      #|0..0..solved at 2
      #|0..0..4..solved at 18
      #|0..0..3..solved at 11
      #|0..0..3..solved at 11
      #|0..0..3..solved at 11
      #|0..0..solved at 2
      #|0..0..3..19..solved at 27
      #|0..0..3..solved at 11
      #|0..0..2..16..94..solved at 132
      #|0..0..2..16..95..solved at 142
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..4..solved at 12
      #|0..0..3..6..15..solved at 26
      #|0..0..3..6..15..solved at 26
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..4..solved at 12
      #|0..0..3..solved at 7
      #|0..0..3..solved at 7
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..4..solved at 12
      #|0..0..3..8..23..solved at 35
      #|0..0..3..8..23..solved at 37
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..4..solved at 12
      #|0..0..3..11..26..57..solved at 102
      #|0..0..3..11..26..57..solved at 102
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 18
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 18
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..11..solved at 20
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..11..solved at 20
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..4..solved at 12
      #|0..0..3..11..solved at 21
      #|0..0..3..11..solved at 21
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..4..solved at 12
      #|0..0..3..12..solved at 24
      #|0..0..3..12..solved at 25
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..4..solved at 12
      #|0..0..3..11..25..56..solved at 102
      #|0..0..3..11..25..56..solved at 102
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 18
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 18
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..11..solved at 21
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..11..solved at 21
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..3..solved at 11
      #|0..0..3..solved at 11
      #|0..0..3..solved at 11
      #|0..0..solved at 2
      #|0..0..4..12..solved at 19
      #|0..0..5..solved at 12
      #|0..0..4..12..solved at 19
      #|0..0..4..12..solved at 19
      #|0..0..solved at 2
      #|0..0..5..solved at 17
      #|0..0..4..solved at 11
      #|0..0..4..solved at 11
      #|0..0..4..solved at 11
      #|0..0..solved at 2
      #|0..0..4..22..solved at 29
      #|0..0..4..solved at 11
      #|0..0..3..20..97..solved at 142
      #|0..0..3..20..98..solved at 151
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..5..solved at 12
      #|0..0..4..8..20..solved at 31
      #|0..0..4..8..20..solved at 31
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..5..solved at 12
      #|0..0..4..solved at 8
      #|0..0..4..solved at 8
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..5..solved at 12
      #|0..0..4..10..27..solved at 38
      #|0..0..4..10..27..solved at 40
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..5..solved at 12
      #|0..0..4..12..29..62..solved at 100
      #|0..0..4..12..29..62..solved at 100
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 17
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 17
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..12..solved at 20
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..12..solved at 20
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..5..solved at 12
      #|0..0..4..12..solved at 21
      #|0..0..4..12..solved at 21
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..5..solved at 12
      #|0..0..4..13..solved at 24
      #|0..0..4..13..solved at 25
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..5..solved at 12
      #|0..0..4..12..28..61..solved at 100
      #|0..0..4..12..28..61..solved at 100
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 17
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 17
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..12..solved at 21
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..12..solved at 21
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..4..solved at 11
      #|0..0..4..solved at 11
      #|0..0..4..solved at 11
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
      #|0..0..2..solved at 5
      #|0..0..26..88..180..380..804..1622..3057..5589..solved at 5716
      #|0..0..26..88..179..380..814..1597..3022..solved at 3360
      #|0..0..25..81..166..357..761..1527..2892..5238..solved at 7637
      #|0..0..25..81..167..365..776..1557..2962..5361..solved at 7760
      #|0..0..26..88..179..380..814..1597..3022..solved at 5467
      #|0..0..26..88..178..380..824..1572..2987..solved at 3325
      #|0..0..25..81..165..356..768..1481..2798..solved at 5011
      #|0..0..25..81..167..365..784..1512..2864..solved at 5137
      #|0..0..25..89..224..478..1009..2139..4145..8862..solved at 9071
      #|0..0..25..89..223..477..1016..2097..4053..solved at 4606
      #|0..0..24..86..234..506..1053..2259..4405..9738..21579..40512..solved at 47152
      #|0..0..24..86..234..509..1070..2290..4471..9922..21954..41389..solved at 52157
      #|0..0..2..solved at 9
      #|0..0..2..solved at 9
      #|0..0..1..8..solved at 19
      #|0..0..1..8..solved at 21
      #|0..0..2..solved at 10
      #|0..0..2..solved at 10
      #|0..0..1..7..solved at 16
      #|0..0..1..7..solved at 16
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 10
      #|0..0..2..solved at 10
      #|0..0..1..7..solved at 16
      #|0..0..1..7..solved at 16
      #|0..0..2..solved at 9
      #|0..0..2..solved at 9
      #|0..0..1..7..solved at 16
      #|0..0..1..7..solved at 16
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 9
      #|0..0..2..solved at 9
      #|0..0..1..8..solved at 20
      #|0..0..1..8..solved at 21
      #|0..0..2..solved at 9
      #|0..0..2..solved at 9
      #|0..0..1..7..15..38..solved at 83
      #|0..0..1..7..15..38..solved at 83
      #|0..0..2..solved at 9
      #|0..0..2..solved at 9
      #|0..0..1..7..solved at 17
      #|0..0..1..7..solved at 17
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 28
      #|0..0..solved at 28
      #|0..0..solved at 27
      #|0..0..solved at 27
      #|0..0..27..solved at 34
      #|0..0..27..solved at 34
      #|0..0..26..solved at 83
      #|0..0..26..solved at 83
      #|0..0..solved at 28
      #|0..0..solved at 28
      #|0..0..solved at 27
      #|0..0..solved at 27
      #|0..0..27..solved at 34
      #|0..0..27..solved at 34
      #|0..0..26..solved at 83
      #|0..0..26..solved at 83
      #|0..0..solved at 27
      #|0..0..solved at 27
      #|0..0..solved at 26
      #|0..0..solved at 26
      #|0..0..26..solved at 33
      #|0..0..26..solved at 33
      #|0..0..25..90..237..solved at 455
      #|0..0..25..90..239..solved at 467
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 10
      #|0..0..3..solved at 10
      #|0..0..2..9..solved at 19
      #|0..0..2..9..solved at 21
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 10
      #|0..0..3..solved at 10
      #|0..0..2..8..19..44..solved at 82
      #|0..0..2..8..19..44..solved at 82
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 10
      #|0..0..3..solved at 10
      #|0..0..2..8..solved at 16
      #|0..0..2..8..solved at 16
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 10
      #|0..0..3..solved at 10
      #|0..0..2..8..solved at 17
      #|0..0..2..8..solved at 17
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 10
      #|0..0..3..solved at 10
      #|0..0..2..9..solved at 20
      #|0..0..2..9..solved at 21
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 10
      #|0..0..3..solved at 10
      #|0..0..2..8..18..43..solved at 83
      #|0..0..2..8..18..43..solved at 83
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 10
      #|0..0..3..solved at 10
      #|0..0..2..8..solved at 18
      #|0..0..2..8..solved at 18
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..solved at 2
      #|0..0..3..solved at 11
      #|0..0..4..solved at 18
      #|0..0..3..solved at 11
      #|0..0..3..solved at 11
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..3..11..solved at 19
      #|0..0..3..11..solved at 19
      #|0..0..3..11..solved at 19
      #|0..0..solved at 2
      #|0..0..3..solved at 11
      #|0..0..3..19..solved at 27
      #|0..0..2..16..94..solved at 132
      #|0..0..2..16..95..solved at 143
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..4..solved at 12
      #|0..0..3..6..15..solved at 26
      #|0..0..3..6..15..solved at 26
      #|0..0..solved at 2
      #|0..0..3..solved at 11
      #|0..0..4..solved at 12
      #|0..0..3..solved at 11
      #|0..0..3..solved at 11
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..4..solved at 12
      #|0..0..3..12..solved at 24
      #|0..0..3..12..solved at 26
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..4..solved at 12
      #|0..0..3..11..26..57..solved at 102
      #|0..0..3..11..26..57..solved at 102
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 18
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 18
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..11..solved at 20
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..11..solved at 20
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..4..solved at 12
      #|0..0..3..11..solved at 21
      #|0..0..3..11..solved at 21
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..4..solved at 12
      #|0..0..3..8..23..solved at 35
      #|0..0..3..8..23..solved at 36
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..4..solved at 12
      #|0..0..3..11..25..56..solved at 102
      #|0..0..3..11..25..56..solved at 102
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 18
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 18
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..11..solved at 21
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..11..solved at 21
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..4..solved at 12
      #|0..0..3..solved at 7
      #|0..0..3..solved at 7
      #|0..0..solved at 2
      #|0..0..4..solved at 11
      #|0..0..5..solved at 17
      #|0..0..4..solved at 11
      #|0..0..4..solved at 11
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..4..12..solved at 19
      #|0..0..4..12..solved at 19
      #|0..0..4..12..solved at 19
      #|0..0..solved at 2
      #|0..0..4..solved at 11
      #|0..0..4..22..solved at 29
      #|0..0..3..20..97..solved at 142
      #|0..0..3..20..98..solved at 152
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..5..solved at 12
      #|0..0..4..8..20..solved at 31
      #|0..0..4..8..20..solved at 31
      #|0..0..solved at 2
      #|0..0..4..solved at 11
      #|0..0..5..solved at 12
      #|0..0..4..solved at 11
      #|0..0..4..solved at 11
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..5..solved at 12
      #|0..0..4..13..solved at 24
      #|0..0..4..13..solved at 26
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..5..solved at 12
      #|0..0..4..12..29..62..solved at 100
      #|0..0..4..12..29..62..solved at 100
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 17
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 17
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..12..solved at 20
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..12..solved at 20
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..5..solved at 12
      #|0..0..4..12..solved at 21
      #|0..0..4..12..solved at 21
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..5..solved at 12
      #|0..0..4..10..27..solved at 38
      #|0..0..4..10..27..solved at 39
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..5..solved at 12
      #|0..0..4..12..28..61..solved at 100
      #|0..0..4..12..28..61..solved at 100
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 17
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 17
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..12..solved at 21
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..12..solved at 21
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..5..solved at 12
      #|0..0..4..solved at 8
      #|0..0..4..solved at 8
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
      #|0..0..2..solved at 5
      #|0..0..26..88..180..380..804..1622..3057..5583..solved at 5710
      #|0..0..26..88..179..380..814..1597..3022..solved at 3361
      #|0..0..25..81..166..357..761..1527..2892..5233..solved at 7632
      #|0..0..25..81..167..365..776..1557..2962..5356..solved at 7755
      #|0..0..26..88..179..380..814..1597..3022..solved at 5465
      #|0..0..26..88..178..380..824..1572..2987..solved at 3326
      #|0..0..25..81..165..356..768..1481..2798..solved at 5013
      #|0..0..25..81..167..365..784..1512..2864..solved at 5139
      #|0..0..25..89..224..478..1009..2139..4145..8855..solved at 9064
      #|0..0..25..89..223..477..1016..2097..4053..solved at 4608
      #|0..0..24..86..234..506..1053..2259..4405..9736..21559..solved at 34683
      #|0..0..24..86..234..509..1070..2290..4471..9919..21934..solved at 36452
      #|0..0..2..solved at 9
      #|0..0..2..solved at 9
      #|0..0..1..8..solved at 19
      #|0..0..1..8..solved at 21
      #|0..0..2..solved at 10
      #|0..0..2..solved at 10
      #|0..0..1..7..solved at 16
      #|0..0..1..7..solved at 16
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 10
      #|0..0..2..solved at 10
      #|0..0..1..7..solved at 16
      #|0..0..1..7..solved at 16
      #|0..0..2..solved at 9
      #|0..0..2..solved at 9
      #|0..0..1..7..solved at 16
      #|0..0..1..7..solved at 16
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 9
      #|0..0..2..solved at 9
      #|0..0..1..8..solved at 20
      #|0..0..1..8..solved at 21
      #|0..0..2..solved at 9
      #|0..0..2..solved at 9
      #|0..0..1..7..15..39..solved at 83
      #|0..0..1..7..15..39..solved at 83
      #|0..0..2..solved at 9
      #|0..0..2..solved at 9
      #|0..0..1..7..solved at 17
      #|0..0..1..7..solved at 17
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 28
      #|0..0..solved at 28
      #|0..0..solved at 27
      #|0..0..solved at 27
      #|0..0..27..solved at 34
      #|0..0..27..solved at 34
      #|0..0..26..solved at 83
      #|0..0..26..solved at 83
      #|0..0..solved at 28
      #|0..0..solved at 28
      #|0..0..solved at 27
      #|0..0..solved at 27
      #|0..0..27..solved at 34
      #|0..0..27..solved at 34
      #|0..0..26..solved at 83
      #|0..0..26..solved at 83
      #|0..0..solved at 27
      #|0..0..solved at 27
      #|0..0..solved at 26
      #|0..0..solved at 26
      #|0..0..26..solved at 33
      #|0..0..26..solved at 33
      #|0..0..25..90..237..solved at 501
      #|0..0..25..90..239..solved at 515
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 10
      #|0..0..3..solved at 10
      #|0..0..2..9..solved at 19
      #|0..0..2..9..solved at 21
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 10
      #|0..0..3..solved at 10
      #|0..0..2..8..19..45..solved at 83
      #|0..0..2..8..19..45..solved at 83
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 10
      #|0..0..3..solved at 10
      #|0..0..2..8..solved at 16
      #|0..0..2..8..solved at 16
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 10
      #|0..0..3..solved at 10
      #|0..0..2..8..solved at 17
      #|0..0..2..8..solved at 17
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 10
      #|0..0..3..solved at 10
      #|0..0..2..9..solved at 20
      #|0..0..2..9..solved at 21
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 10
      #|0..0..3..solved at 10
      #|0..0..2..8..18..44..solved at 84
      #|0..0..2..8..18..44..solved at 84
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 10
      #|0..0..3..solved at 10
      #|0..0..2..8..solved at 18
      #|0..0..2..8..solved at 18
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..solved at 2
      #|0..0..3..solved at 11
      #|0..0..4..solved at 18
      #|0..0..3..solved at 11
      #|0..0..3..solved at 11
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..3..11..solved at 19
      #|0..0..3..11..solved at 19
      #|0..0..3..11..solved at 19
      #|0..0..solved at 2
      #|0..0..3..solved at 11
      #|0..0..3..19..solved at 27
      #|0..0..2..16..94..194..solved at 394
      #|0..0..2..16..95..201..solved at 437
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..4..solved at 12
      #|0..0..3..6..15..solved at 26
      #|0..0..3..6..15..solved at 26
      #|0..0..solved at 2
      #|0..0..3..solved at 11
      #|0..0..4..solved at 12
      #|0..0..3..solved at 11
      #|0..0..3..solved at 11
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..4..solved at 12
      #|0..0..3..12..solved at 24
      #|0..0..3..12..solved at 26
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..4..solved at 12
      #|0..0..3..7..21..54..solved at 88
      #|0..0..3..7..21..54..solved at 88
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 18
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 18
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..11..solved at 20
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..11..solved at 20
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..4..solved at 12
      #|0..0..3..7..solved at 16
      #|0..0..3..7..solved at 16
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..4..solved at 12
      #|0..0..3..8..23..solved at 35
      #|0..0..3..8..23..solved at 36
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..4..solved at 12
      #|0..0..3..7..20..52..solved at 87
      #|0..0..3..7..20..52..solved at 87
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 18
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 18
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..11..solved at 21
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..11..solved at 21
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 12
      #|0..0..4..solved at 12
      #|0..0..3..solved at 7
      #|0..0..3..solved at 7
      #|0..0..solved at 2
      #|0..0..4..solved at 11
      #|0..0..5..solved at 17
      #|0..0..4..solved at 11
      #|0..0..4..solved at 11
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..4..12..solved at 19
      #|0..0..4..12..solved at 19
      #|0..0..4..12..solved at 19
      #|0..0..solved at 2
      #|0..0..4..solved at 11
      #|0..0..4..22..solved at 29
      #|0..0..3..20..97..201..solved at 414
      #|0..0..3..20..98..208..solved at 454
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..5..solved at 12
      #|0..0..4..8..20..solved at 31
      #|0..0..4..8..20..solved at 31
      #|0..0..solved at 2
      #|0..0..4..solved at 11
      #|0..0..5..solved at 12
      #|0..0..4..solved at 11
      #|0..0..4..solved at 11
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..5..solved at 12
      #|0..0..4..13..solved at 24
      #|0..0..4..13..solved at 26
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..5..solved at 12
      #|0..0..4..9..25..60..solved at 91
      #|0..0..4..9..25..60..solved at 91
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 17
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 17
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..12..solved at 20
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..12..solved at 20
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..5..solved at 12
      #|0..0..4..9..solved at 17
      #|0..0..4..9..solved at 17
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..5..solved at 12
      #|0..0..4..10..27..solved at 38
      #|0..0..4..10..27..solved at 39
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..5..solved at 12
      #|0..0..4..9..24..58..solved at 90
      #|0..0..4..9..24..58..solved at 90
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 17
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 17
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..12..solved at 21
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..12..solved at 21
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 12
      #|0..0..5..solved at 12
      #|0..0..4..solved at 8
      #|0..0..4..solved at 8
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..7..solved at 15
      #|0..0..0..1..8..solved at 18
      #|0..0..solved at 3
      #|0..0..2..solved at 6
      #|0..0..solved at 3
      #|0..0..2..8..solved at 15
      #|0..0..solved at 2
      #|0..0..1..3..13..solved at 26
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..3..solved at 7
      #|0..0..3..solved at 10
      #|0..0..2..7..37..73..186..481..solved at 772
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 8
      #|0..0..4..solved at 10
      #|0..0..3..9..39..76..192..471..solved at 732
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..7..solved at 15
      #|0..0..0..1..8..27..118..284..672..solved at 1030
      #|0..0..solved at 3
      #|0..0..2..solved at 6
      #|0..0..solved at 3
      #|0..0..2..8..solved at 15
      #|0..0..solved at 2
      #|0..0..1..3..13..33..133..314..698..solved at 1043
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..3..solved at 7
      #|0..0..3..solved at 10
      #|0..0..2..7..37..solved at 63
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 8
      #|0..0..4..solved at 10
      #|0..0..3..9..39..solved at 68
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..1..solved at 8
      #|0..0..1..solved at 5
      #|0..0..0..1..8..solved at 18
      #|0..0..solved at 3
      #|0..0..2..solved at 9
      #|0..0..solved at 3
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..3..13..solved at 26
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..3..solved at 10
      #|0..0..3..solved at 7
      #|0..0..2..7..37..73..186..481..solved at 772
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 10
      #|0..0..4..solved at 8
      #|0..0..3..9..39..76..192..471..solved at 732
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..1..solved at 8
      #|0..0..1..solved at 5
      #|0..0..0..1..8..27..118..284..672..solved at 1030
      #|0..0..solved at 3
      #|0..0..2..solved at 9
      #|0..0..solved at 3
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..3..13..33..133..314..698..solved at 1043
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..3..solved at 10
      #|0..0..3..solved at 7
      #|0..0..2..7..37..solved at 63
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 10
      #|0..0..4..solved at 8
      #|0..0..3..9..39..solved at 68
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 8
      #|0..0..0..1..8..solved at 18
      #|0..0..solved at 3
      #|0..0..2..solved at 6
      #|0..0..solved at 3
      #|0..0..2..solved at 9
      #|0..0..solved at 2
      #|0..0..1..3..13..solved at 26
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..3..solved at 7
      #|0..0..3..solved at 10
      #|0..0..2..7..37..73..190..492..solved at 787
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 8
      #|0..0..4..solved at 10
      #|0..0..3..9..39..76..196..482..solved at 747
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 8
      #|0..0..0..1..8..27..108..255..607..solved at 920
      #|0..0..solved at 3
      #|0..0..2..solved at 6
      #|0..0..solved at 3
      #|0..0..2..solved at 9
      #|0..0..solved at 2
      #|0..0..1..3..13..33..123..285..633..solved at 933
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..3..solved at 7
      #|0..0..3..solved at 10
      #|0..0..2..7..37..solved at 63
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 8
      #|0..0..4..solved at 10
      #|0..0..3..9..39..solved at 68
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..1..solved at 8
      #|0..0..1..solved at 5
      #|0..0..0..1..8..27..108..255..607..solved at 920
      #|0..0..solved at 3
      #|0..0..2..solved at 9
      #|0..0..solved at 3
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..3..13..33..123..285..633..solved at 933
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..3..solved at 10
      #|0..0..3..solved at 7
      #|0..0..2..7..37..solved at 63
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 10
      #|0..0..4..solved at 8
      #|0..0..3..9..39..solved at 68
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..1..solved at 8
      #|0..0..1..solved at 5
      #|0..0..0..1..8..solved at 18
      #|0..0..solved at 3
      #|0..0..2..solved at 9
      #|0..0..solved at 3
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..3..13..solved at 26
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..3..solved at 10
      #|0..0..3..solved at 7
      #|0..0..2..7..37..73..190..492..solved at 787
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 10
      #|0..0..4..solved at 8
      #|0..0..3..9..39..76..196..482..solved at 747
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
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 6
      #|0..0..0..1..8..27..solved at 50
      #|0..0..solved at 3
      #|0..0..2..solved at 7
      #|0..0..solved at 3
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..3..13..33..solved at 65
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..3..solved at 7
      #|0..0..3..solved at 8
      #|0..0..2..5..18..46..solved at 77
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..4..solved at 8
      #|0..0..4..solved at 9
      #|0..0..3..7..23..52..solved at 88
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
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 6
      #|0..0..0..1..8..27..115..276..654..solved at 955
      #|0..0..solved at 3
      #|0..0..2..solved at 7
      #|0..0..solved at 3
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..3..13..33..129..304..677..solved at 963
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..3..solved at 7
      #|0..0..3..solved at 8
      #|0..0..2..5..18..46..151..332..728..solved at 1030
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..4..solved at 8
      #|0..0..4..solved at 9
      #|0..0..3..7..23..52..160..348..723..solved at 993
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..2..4..solved at 10
      #|Warning: inventing type variables
      #|0..0..2..5..14..solved at 20
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..4..solved at 17
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..4..solved at 8
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..4..solved at 8
      #|0..0..solved at 2
      #|0..0..1..4..solved at 8
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..1..solved at 4
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..1..5..12..solved at 21
      #|0..0..solved at 2
      #|0..0..1..4..9..21..45..85..164..303..solved at 335
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..1..5..solved at 12
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..1..solved at 6
      #|0..0..solved at 2
      #|0..0..1..4..9..21..43..87..167..332..594..1258..2343..solved at 2662
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..1..solved at 6
      #|0..0..solved at 2
      #|0..0..1..4..9..22..55..118..solved at 126
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..2..solved at 5
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..2..7..17..solved at 26
      #|0..0..solved at 2
      #|0..0..2..6..14..30..59..105..188..326..solved at 359
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..2..7..solved at 14
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..2..6..14..30..58..113..203..398..694..1468..2674..solved at 2970
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..2..6..14..31..68..135..solved at 145
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..2..4..8..13..24..solved at 34
      #|0..0..2..4..solved at 8
      #|0..0..1..solved at 6
      #|0..0..solved at 2
      #|0..0..1..4..9..22..54..111..solved at 121
      #|0..0..1..solved at 4
      #|0..0..1..solved at 6
      #|0..0..solved at 2
      #|0..0..1..4..9..21..42..82..148..284..484..989..1766..solved at 1886
      #|0..0..1..solved at 4
      #|0..0..1..6..16..solved at 25
      #|0..0..solved at 2
      #|0..0..1..4..9..21..44..82..154..279..solved at 305
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 7
      #|0..0..solved at 2
      #|0..0..3..8..19..40..79..135..solved at 145
      #|0..0..3..solved at 6
      #|0..0..3..solved at 6
      #|0..0..solved at 2
      #|0..0..3..8..19..39..71..125..205..362..604..1221..2112..solved at 2188
      #|0..0..3..solved at 7
      #|0..0..3..7..solved at 12
      #|0..0..solved at 2
      #|0..0..3..8..19..39..73..123..205..326..solved at 352
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..4..solved at 8
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..4..solved at 8
      #|0..0..solved at 2
      #|0..0..1..4..solved at 8
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..1..solved at 4
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..1..5..12..solved at 21
      #|0..0..solved at 2
      #|0..0..1..4..9..21..45..85..164..303..solved at 335
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..1..5..solved at 12
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..1..solved at 6
      #|0..0..solved at 2
      #|0..0..1..4..9..21..43..87..167..332..594..1258..2343..solved at 2662
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..1..solved at 6
      #|0..0..solved at 2
      #|0..0..1..4..9..22..55..118..solved at 126
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..2..solved at 5
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..2..7..17..solved at 26
      #|0..0..solved at 2
      #|0..0..2..6..14..30..59..105..188..326..solved at 359
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..2..7..solved at 14
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..2..6..14..30..58..113..203..398..694..1468..2674..solved at 2970
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..2..6..14..31..68..135..solved at 145
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..2..4..8..13..24..solved at 34
      #|0..0..2..4..solved at 8
      #|0..0..1..solved at 6
      #|0..0..solved at 2
      #|0..0..1..4..9..22..54..111..solved at 121
      #|0..0..1..5..solved at 11
      #|0..0..1..solved at 6
      #|0..0..solved at 2
      #|0..0..1..4..9..21..42..82..148..284..484..989..1766..solved at 1886
      #|0..0..1..solved at 4
      #|0..0..1..6..16..solved at 25
      #|0..0..solved at 2
      #|0..0..1..4..9..21..44..82..154..279..solved at 305
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 7
      #|0..0..solved at 2
      #|0..0..3..8..19..40..79..135..solved at 145
      #|0..0..3..solved at 6
      #|0..0..3..solved at 6
      #|0..0..solved at 2
      #|0..0..3..8..19..39..71..125..205..362..604..1221..2112..solved at 2188
      #|0..0..3..solved at 7
      #|0..0..3..7..solved at 12
      #|0..0..solved at 2
      #|0..0..3..8..19..39..73..123..205..326..solved at 352
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
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..1..4..solved at 8
      #|0..0..1..3..solved at 8
      #|0..0..solved at 2
      #|0..0..1..4..solved at 8
      #|0..0..solved at 2
      #|0..0..1..4..solved at 8
      #|0..0..1..3..solved at 8
      #|0..0..solved at 2
      #|0..0..1..4..solved at 8
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..1..4..solved at 8
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..1..4..solved at 8
      #|0..0..1..3..solved at 8
      #|0..0..solved at 2
      #|0..0..1..4..solved at 8
      #|0..0..solved at 2
      #|0..0..1..4..solved at 8
      #|0..0..1..3..solved at 8
      #|0..0..solved at 2
      #|0..0..1..4..solved at 8
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..1..4..solved at 8
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
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
      #|0..0..1..2..3..solved at 8
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..11..33..66..143..291..536..946..1540..2328..3463..5125..7486..solved at 7760
      #|0..0..1..2..3..9..16..23..37..52..67..133..203..solved at 262
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..13..30..47..77..solved at 86
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..6..13..32..66..134..253..solved at 323
      #|0..0..solved at 3
      #|0..0..1..2..3..solved at 8
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..6..13..32..66..134..253..solved at 323
      #|0..0..solved at 3
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..3..8..17..solved at 27
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..7..19..68..198..solved at 207
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..6..14..solved at 26
      #|0..0..2..5..12..23..39..solved at 78
      #|0..0..3..8..19..38..65..130..solved at 142
      #|0..0..1..3..7..solved at 14
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..1..2..6..13..32..66..134..253..solved at 323
      #|0..0..solved at 3
      #|0..0..1..2..3..solved at 8
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..5..9..15..solved at 43
      #|0..0..1..2..5..9..15..45..80..solved at 138
      #|0..0..1..2..5..solved at 13
      #|Warning: inventing type variables
      #|0..0..1..2..5..solved at 13
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..5..10..18..solved at 29
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..6..13..23..solved at 34
      #|0..0..2..5..10..solved at 15
      #|0..0..2..4..11..solved at 21
      #|0..0..2..4..10..solved at 18
      #|0..0..4..solved at 11
      #|0..0..3..solved at 9
      #|0..0..3..solved at 9
      #|0..0..2..solved at 7
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
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..3..9..solved at 20
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..5..10..solved at 17
      #|0..0..1..2..5..10..solved at 17
      #|0..0..1..2..3..7..13..solved at 21
      #|0..0..1..3..5..solved at 10
      #|0..0..1..3..5..solved at 10
      #|0..0..solved at 3
      #|0..0..2..4..solved at 9
      #|0..0..1..2..5..10..solved at 17
      #|0..0..1..2..3..7..13..solved at 21
      #|0..0..1..solved at 4
      #|0..0..1..2..5..10..solved at 17
      #|0..0..1..2..3..7..13..solved at 21
      #|0..0..1..2..3..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..3..solved at 7
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..solved at 8
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
      #|0..0..1..solved at 5
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..3..solved at 7
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 5
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..3..solved at 7
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
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 8
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..2..solved at 10
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..2..solved at 10
      #|0..0..3..solved at 7
      #|0..0..3..solved at 6
      #|0..0..3..solved at 12
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..3..solved at 6
      #|0..0..2..solved at 5
      #|0..0..3..solved at 6
      #|0..0..2..11..solved at 20
      #|0..0..3..solved at 6
      #|0..0..2..solved at 10
      #|0..0..4..16..solved at 21
      #|0..0..3..12..solved at 17
      #|0..0..5..solved at 8
      #|0..0..4..15..51..solved at 62
      #|0..0..4..17..solved at 22
      #|0..0..3..solved at 13
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..5..solved at 11
      #|0..0..solved at 3
      #|0..0..1..2..3..4..solved at 10
      #|0..0..2..4..8..18..31..solved at 50
      #|0..0..1..2..5..9..15..solved at 27
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
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 5
      #|0..0..1..solved at 6
      #|0..0..1..7..29..solved at 43
      #|0..0..2..solved at 6
      #|0..0..2..solved at 7
      #|0..0..2..9..34..solved at 46
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..2..solved at 7
      #|0..0..2..9..34..solved at 46
      #|0..0..3..solved at 7
      #|0..0..3..solved at 8
      #|0..0..3..11..39..solved at 49
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..5..solved at 11
      #|0..0..solved at 3
      #|0..0..1..2..3..4..solved at 10
      #|0..0..2..4..8..18..31..solved at 50
      #|0..0..1..2..5..9..15..solved at 27
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
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..7..30..96..366..solved at 510
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..2..9..36..106..389..solved at 521
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..2..9..36..106..393..solved at 527
      #|0..0..3..solved at 7
      #|0..0..3..solved at 7
      #|0..0..3..11..42..116..416..solved at 538
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..5..solved at 11
      #|0..0..solved at 3
      #|0..0..1..2..3..4..solved at 10
      #|0..0..2..4..8..18..31..solved at 50
      #|0..0..1..2..5..9..15..solved at 27
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
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..3..6..solved at 11
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 8
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..2..solved at 10
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..2..14..61..190..618..1882..6195..21776..solved at 26729
      #|0..0..3..solved at 7
      #|0..0..3..solved at 6
      #|0..0..3..solved at 12
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..5..solved at 11
      #|0..0..solved at 3
      #|0..0..1..2..3..4..solved at 10
      #|0..0..2..4..8..17..27..solved at 42
      #|0..0..1..2..5..8..11..solved at 19
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
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..3..6..solved at 11
      #|0..0..1..solved at 5
      #|0..0..1..solved at 7
      #|0..0..1..12..52..solved at 67
      #|0..0..2..solved at 6
      #|0..0..2..solved at 7
      #|0..0..2..14..58..solved at 71
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..2..solved at 7
      #|0..0..2..14..61..193..621..1903..6386..22710..solved at 23988
      #|0..0..3..solved at 7
      #|0..0..3..solved at 8
      #|0..0..3..16..64..solved at 75
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..5..solved at 11
      #|0..0..solved at 3
      #|0..0..1..2..3..4..solved at 10
      #|0..0..2..4..8..17..27..solved at 42
      #|0..0..1..2..5..8..11..solved at 19
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
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..3..6..solved at 11
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..9..40..125..439..solved at 583
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..2..11..46..135..462..solved at 594
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..2..14..62..215..799..2494..9339..solved at 12051
      #|0..0..3..solved at 7
      #|0..0..3..solved at 7
      #|0..0..3..16..66..solved at 76
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..5..solved at 11
      #|0..0..solved at 3
      #|0..0..1..2..3..4..solved at 10
      #|0..0..2..4..8..17..27..solved at 42
      #|0..0..1..2..5..8..11..solved at 19
      #|Warning: inventing type variables
      #|0..0..1..2..5..9..solved at 16
      #|0..0..1..2..6..10..14..25..42..64..119..201..304..491..808..1280..solved at 1971
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..15..32..50..80..169..solved at 305
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..2..4..12..27..62..solved at 71
      #|0..0..2..solved at 5
      #|0..0..2..4..13..28..59..168..379..930..solved at 943
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|5 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|Searching with depth limit 0
      #|Searching with depth limit 1
      #|Searching with depth limit 2
      #|Searching with depth limit 3
      #|Searching with depth limit 4
      #|Searching with depth limit 5
      #|Searching with depth limit 6
      #|Translating proof certificate to HOL
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|CPU time (user): <t>
      #|Searching with depth limit 0
      #|Searching with depth limit 1
      #|Searching with depth limit 2
      #|Searching with depth limit 3
      #|Translating proof certificate to HOL
      #|CPU time (user): <t>
      #|CPU time (user): <t>
      #|Searching with depth limit 0
      #|Searching with depth limit 1
      #|Searching with depth limit 2
      #|Searching with depth limit 3
      #|Searching with depth limit 4
      #|Searching with depth limit 5
      #|Translating proof certificate to HOL
      #|CPU time (user): <t>
      #|Warning: inventing type variables
      #|Searching with depth limit 0
      #|Searching with depth limit 1
      #|Searching with depth limit 2
      #|Translating proof certificate to HOL
      #|Warning: inventing type variables
      #|Warning: Free variables in goal: A, B, C
      #|5 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|0..0..1..2..6..10..14..solved at 20
      #|0..0..1..2..6..10..14..solved at 23
      #|0..0..1..2..6..10..14..solved at 24
      #|0..0..1..2..5..11..23..38..59..89..132..181..248..365..500..663..918..1201..1529..2216..2948..3762..solved at 31951
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 2 critical pairs
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|0..0..3..solved at 6
      #|0..0..solved at 5
      #|0..0..4..8..28..65..143..267..508..863..1559..2490..4306..solved at 6698
      #|0..0..5..10..solved at 29
      #|0..0..4..8..24..61..139..263..504..863..1563..2509..4330..solved at 6864
      #|0..0..5..10..solved at 26
      #|0..0..5..10..30..71..153..266..420..622..990..1428..2454..3934..6403..9940..17611..solved at 25572
      #|0..0..6..12..solved at 28
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 6 critical pairs
      #|6 basis elements and 10 critical pairs
      #|6 basis elements and 9 critical pairs
      #|7 basis elements and 12 critical pairs
      #|8 basis elements and 14 critical pairs
      #|9 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|0..0..5..11..27..67..130..222..356..528..1918..4308..7050..solved at 7238
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..9..solved at 18
      #|0..0..4..9..solved at 17
      #|0..0..4..9..solved at 16
      #|Tutorial/Custom_tactics quotations (16):
      #|  real_of_num(0)
      #|  real_of_num(2)
      #|  -real_of_num(2)
      #|  sqrt(real_of_num(2))
      #|  -sqrt(real_of_num(2))
      #|  (vector : (List[Real]) -> Cart[Real, 3])
      #|  pow(sqrt(real_of_num(2)), 2) == real_of_num(2)
      #|  !((x : Cart[Real, 3]) == vec(0))
      #|  (x : Cart[Real, 3])
      #|  (orthogonal : (Cart[Real, 3], Cart[Real, 3]) -> Bool)
      #|  (P : (Cart[Real, 3]) -> Bool)
      #|  \226\136\128 P : (Cart[Real, 3]) -> Bool, (\226\136\128 x : Cart[Real, 3], \226\136\128 y : Cart[Real, 3], !(x == vec(0)) && !(y == vec(0)) && orthogonal(x, y) && !P(x) \226\134\146 P(y)) && (\226\136\128 x : Cart[Real, 3], \226\136\128 y : Cart[Real, 3], \226\136\128 z : Cart[Real, 3], !(x == vec(0)) && !(y == vec(0)) && !(z == vec(0)) && orthogonal(x, y) && orthogonal(x, z) && orthogonal(y, z) && P(x) && P(y) \226\134\146 !P(z)) \226\134\146 false
      #|  \226\136\128 x : Cart[Real, 3], \226\136\128 y : Cart[Real, 3], orthogonal(x, y) && !(x == vec(0)) && !(y == vec(0)) \226\134\146 !(cross(x, y) == vec(0))
      #|  !(1 == 0)
      #|  (x : Cart[Real, 3]) => (spin : (Cart[Real, 3]) -> Num)(x) == 1
      #|  !(\226\136\131 spin : (Cart[Real, 3]) -> Num, \226\136\128 x : Cart[Real, 3], \226\136\128 y : Cart[Real, 3], \226\136\128 z : Cart[Real, 3], !(x == vec(0)) && !(y == vec(0)) && !(z == vec(0)) && orthogonal(x, y) && orthogonal(x, z) && orthogonal(y, z) \226\134\146 spin(x) == 0 && spin(y) == 1 && spin(z) == 1 || spin(x) == 1 && spin(y) == 0 && spin(z) == 1 || spin(x) == 1 && spin(y) == 1 && spin(z) == 0)
      #|SQRT_2_POW =  |- ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) (#sqrt:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))
      #|KOCHEN_SPECKER_LEMMA =  |- (#forall:fun(fun(fun(cart(real,tybit1(1)),bool),bool),bool) (\P:fun(cart(real,tybit1(1)),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(cart(real,tybit1(1)),bool),bool) (\x:cart(real,tybit1(1)). (#forall:fun(fun(cart(real,tybit1(1)),bool),bool) (\y:cart(real,tybit1(1)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(cart(real,tybit1(1)),fun(cart(real,tybit1(1)),bool)) x:cart(real,tybit1(1))) (#vec:fun(num,cart(real,tybit1(1))) (#NUMERAL:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(cart(real,tybit1(1)),fun(cart(real,tybit1(1)),bool)) y:cart(real,tybit1(1))) (#vec:fun(num,cart(real,tybit1(1))) (#NUMERAL:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#orthogonal:fun(cart(real,tybit1(1)),fun(cart(real,tybit1(1)),bool)) x:cart(real,tybit1(1))) y:cart(real,tybit1(1)))) (#~:fun(bool,bool) (P:fun(cart(real,tybit1(1)),bool) x:cart(real,tybit1(1)))))))) (P:fun(cart(real,tybit1(1)),bool) y:cart(real,tybit1(1))))))))) (#forall:fun(fun(cart(real,tybit1(1)),bool),bool) (\x:cart(real,tybit1(1)). (#forall:fun(fun(cart(real,tybit1(1)),bool),bool) (\y:cart(real,tybit1(1)). (#forall:fun(fun(cart(real,tybit1(1)),bool),bool) (\z:cart(real,tybit1(1)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(cart(real,tybit1(1)),fun(cart(real,tybit1(1)),bool)) x:cart(real,tybit1(1))) (#vec:fun(num,cart(real,tybit1(1))) (#NUMERAL:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(cart(real,tybit1(1)),fun(cart(real,tybit1(1)),bool)) y:cart(real,tybit1(1))) (#vec:fun(num,cart(real,tybit1(1))) (#NUMERAL:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(cart(real,tybit1(1)),fun(cart(real,tybit1(1)),bool)) z:cart(real,tybit1(1))) (#vec:fun(num,cart(real,tybit1(1))) (#NUMERAL:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#orthogonal:fun(cart(real,tybit1(1)),fun(cart(real,tybit1(1)),bool)) x:cart(real,tybit1(1))) y:cart(real,tybit1(1)))) ((#/\:fun(bool,fun(bool,bool)) ((#orthogonal:fun(cart(real,tybit1(1)),fun(cart(real,tybit1(1)),bool)) x:cart(real,tybit1(1))) z:cart(real,tybit1(1)))) ((#/\:fun(bool,fun(bool,bool)) ((#orthogonal:fun(cart(real,tybit1(1)),fun(cart(real,tybit1(1)),bool)) y:cart(real,tybit1(1))) z:cart(real,tybit1(1)))) ((#/\:fun(bool,fun(bool,bool)) (P:fun(cart(real,tybit1(1)),bool) x:cart(real,tybit1(1)))) (P:fun(cart(real,tybit1(1)),bool) y:cart(real,tybit1(1))))))))))) (#~:fun(bool,bool) (P:fun(cart(real,tybit1(1)),bool) z:cart(real,tybit1(1))))))))))))) #F:bool)))
      #|NONTRIVIAL_CROSS =  |- (#forall:fun(fun(cart(real,tybit1(1)),bool),bool) (\x:cart(real,tybit1(1)). (#forall:fun(fun(cart(real,tybit1(1)),bool),bool) (\y:cart(real,tybit1(1)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#orthogonal:fun(cart(real,tybit1(1)),fun(cart(real,tybit1(1)),bool)) x:cart(real,tybit1(1))) y:cart(real,tybit1(1)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(cart(real,tybit1(1)),fun(cart(real,tybit1(1)),bool)) x:cart(real,tybit1(1))) (#vec:fun(num,cart(real,tybit1(1))) (#NUMERAL:fun(num,num) #_0:num))))) (#~:fun(bool,bool) ((#=:fun(cart(real,tybit1(1)),fun(cart(real,tybit1(1)),bool)) y:cart(real,tybit1(1))) (#vec:fun(num,cart(real,tybit1(1))) (#NUMERAL:fun(num,num) #_0:num))))))) (#~:fun(bool,bool) ((#=:fun(cart(real,tybit1(1)),fun(cart(real,tybit1(1)),bool)) ((#cross:fun(cart(real,tybit1(1)),fun(cart(real,tybit1(1)),cart(real,tybit1(1)))) x:cart(real,tybit1(1))) y:cart(real,tybit1(1)))) (#vec:fun(num,cart(real,tybit1(1))) (#NUMERAL:fun(num,num) #_0:num)))))))))
      #|KOCHEN_SPECKER_PARADOX =  |- (#~:fun(bool,bool) (#?:fun(fun(fun(cart(real,tybit1(1)),num),bool),bool) (\spin:fun(cart(real,tybit1(1)),num). (#forall:fun(fun(cart(real,tybit1(1)),bool),bool) (\x:cart(real,tybit1(1)). (#forall:fun(fun(cart(real,tybit1(1)),bool),bool) (\y:cart(real,tybit1(1)). (#forall:fun(fun(cart(real,tybit1(1)),bool),bool) (\z:cart(real,tybit1(1)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(cart(real,tybit1(1)),fun(cart(real,tybit1(1)),bool)) x:cart(real,tybit1(1))) (#vec:fun(num,cart(real,tybit1(1))) (#NUMERAL:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(cart(real,tybit1(1)),fun(cart(real,tybit1(1)),bool)) y:cart(real,tybit1(1))) (#vec:fun(num,cart(real,tybit1(1))) (#NUMERAL:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(cart(real,tybit1(1)),fun(cart(real,tybit1(1)),bool)) z:cart(real,tybit1(1))) (#vec:fun(num,cart(real,tybit1(1))) (#NUMERAL:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#orthogonal:fun(cart(real,tybit1(1)),fun(cart(real,tybit1(1)),bool)) x:cart(real,tybit1(1))) y:cart(real,tybit1(1)))) ((#/\:fun(bool,fun(bool,bool)) ((#orthogonal:fun(cart(real,tybit1(1)),fun(cart(real,tybit1(1)),bool)) x:cart(real,tybit1(1))) z:cart(real,tybit1(1)))) ((#orthogonal:fun(cart(real,tybit1(1)),fun(cart(real,tybit1(1)),bool)) y:cart(real,tybit1(1))) z:cart(real,tybit1(1))))))))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (spin:fun(cart(real,tybit1(1)),num) x:cart(real,tybit1(1)))) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (spin:fun(cart(real,tybit1(1)),num) y:cart(real,tybit1(1)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) (spin:fun(cart(real,tybit1(1)),num) z:cart(real,tybit1(1)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (spin:fun(cart(real,tybit1(1)),num) x:cart(real,tybit1(1)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (spin:fun(cart(real,tybit1(1)),num) y:cart(real,tybit1(1)))) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) (spin:fun(cart(real,tybit1(1)),num) z:cart(real,tybit1(1)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (spin:fun(cart(real,tybit1(1)),num) x:cart(real,tybit1(1)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (spin:fun(cart(real,tybit1(1)),num) y:cart(real,tybit1(1)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) (spin:fun(cart(real,tybit1(1)),num) z:cart(real,tybit1(1)))) (#NUMERAL:fun(num,num) #_0:num))))))))))))))))
      #|types = sign/0 metric/1 topology/1 matroid/1 tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = cross component INSERTAT SUBLIST interpmat partition_line interpsigns interpsign Unknown Nonzero Neg Pos Zero _440886 _440885 _440884 _440883 _440882 _dest_sign _mk_sign real_ordered_list pneg pneg_aux mono_unbounded nonconstant normal mono_unbounded_below mono_unbounded_above mono_dec mono_inc CHOP_LIST REMOVE nmax <> degree normalize rsquarefree order poly_divides poly_diff poly_diff_aux poly_exp poly_mul poly_neg poly_cmul poly_add poly differentiable contl diffl tends_real_real suminf summable sums mono subseq lim cauchy convergent tends_num_real tendsto bounded tends dorder mr1 ball mtop mdist metric ismet limpt closed neigh open topology istopology re_compl re_subset re_universe re_null re_intersect re_union re_Union psum closed_interval open_interval midpoint between collinear infnorm matrix_inv rank columnvector rowvector euclidean_matroid dim independent dependent span subspace pushin dropout indicator drop lift onorm matrix invertible normal_matrix symmetric_matrix columns rows column row transp mat vector_matrix_mul matrix_vector_mul matrix_mul matrix_sub matrix_add matrix_neg %% adjoint bilinear linear orthogonal basis vsum distance vector_norm dot vec % vector_neg vector_sub vector_add matroid_dim matroid_finite_dim matroid_dimension matroid_finite_dimensional submatroid matroid_subspace matroid_dependent matroid_basis matroid_independent matroid_spanning matroid_span matroid_set dest_matroid matroid suslin suslin_operation relative_to from hull matrify vectorize closed_real_interval open_real_interval is_realinterval frac floor rational ^_c *_c +_c ordinal linseg inseg properly strictly antichain chain wqoset woset toset poset qoset fld superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 435
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?1
      #|counter_genvar = _890142:bool
      #|
    ),
  )
}
