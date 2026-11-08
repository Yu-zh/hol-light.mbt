// Load-fidelity test for normalizer.ml: replays tools/ocaml_ref/normalizer_ref.ml
// (keep in sync; refresh with tools/ocaml_ref/refresh_ref.py).

///|
using @testkit {stm, sthm}

///|
test "normalizer matches normalizer.ml" {
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot", "impconv", "pair", "compute", "nums", "recursion",
      "arith", "wf", "calc_num", "normalizer",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("normalizer")
  log.capture_stdout()
  // BEGIN generated theorem list
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
  log.attempt("norm_sq", () => {
    sthm(@normalizer.num_normalize_conv(tm("((x : Num) + 1) * (x + 2)")))
  })
  log.attempt("norm_cube", () => {
    sthm(@normalizer.num_normalize_conv(tm("EXP((a : Num) + (b : Num), 3)")))
  })
  log.attempt("norm_cancel", () => {
    sthm(@normalizer.num_normalize_conv(tm("(x : Num) * (y : Num) + (y * x + 0 * (z : Num))")))
  })
  log.attempt("norm_const", () => {
    sthm(@normalizer.num_normalize_conv(tm("2 * 3 + 4")))
  })
  log.attempt("norm_poly", () => {
    sthm(@normalizer.num_normalize_conv(tm("((x : Num) + (y : Num)) * (x + y) - x * x")))
  })
  // END EXTRA
  log.attempt("counter_tyvar", () => stm(tm("(zz_counter : _)")))
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
      #|normalizer quotations (16):
      #|  \226\136\128 x : A, \226\136\128 m : Num, \226\136\128 n : Num, (pwr : (A, Num) -> A)(pwr(x, m), n) == pwr(x, m * n)
      #|  \226\136\128 x : A, \226\136\128 y : A, \226\136\128 n : Num, (pwr : (A, Num) -> A)((mul : (A, A) -> A)(x, y), n) == mul(pwr(x, n), pwr(y, n))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 x : A, (pwr : (A, Num) -> A)(x, m + n) == (mul : (A, A) -> A)(pwr(x, m), pwr(x, n))
      #|  1
      #|  2
      #|  \226\136\128 x : A, \226\136\128 y : A, (mul : (A, A) -> A)(x, y) == mul(y, x)
      #|  \226\136\128 x : A, \226\136\128 y : A, \226\136\128 z : A, (mul : (A, A) -> A)(x, mul(y, z)) == mul(mul(x, y), z)
      #|  \226\136\128 x : A, \226\136\128 y : A, (add : (A, A) -> A)(x, y) == add(y, x)
      #|  \226\136\128 x : A, \226\136\128 y : A, \226\136\128 z : A, (add : (A, A) -> A)(x, add(y, z)) == add(add(x, y), z)
      #|  (\226\136\128 m : A, \226\136\128 n : A, (add : (A, A) -> A)(m, n) == add(n, m)) && (\226\136\128 m : A, \226\136\128 n : A, \226\136\128 p : A, add(add(m, n), p) == add(m, add(n, p))) && (\226\136\128 m : A, \226\136\128 n : A, \226\136\128 p : A, add(m, add(n, p)) == add(n, add(m, p))) && (\226\136\128 x : A, add(x, (r0 : A)) == x) && (\226\136\128 m : A, \226\136\128 n : A, (mul : (A, A) -> A)(m, n) == mul(n, m)) && (\226\136\128 m : A, \226\136\128 n : A, \226\136\128 p : A, mul(mul(m, n), p) == mul(m, mul(n, p))) && (\226\136\128 m : A, \226\136\128 n : A, \226\136\128 p : A, mul(m, mul(n, p)) == mul(n, mul(m, p))) && (\226\136\128 m : A, \226\136\128 n : A, \226\136\128 p : A, mul(add(m, n), p) == add(mul(m, p), mul(n, p))) && (\226\136\128 x : A, mul(x, (r1 : A)) == x) && (\226\136\128 x : A, mul(x, r0) == r0)
      #|  (\226\136\128 x : A, \226\136\128 y : A, \226\136\128 z : A, (add : (A, A) -> A)(x, add(y, z)) == add(add(x, y), z)) && (\226\136\128 x : A, \226\136\128 y : A, add(x, y) == add(y, x)) && (\226\136\128 x : A, add((r0 : A), x) == x) && (\226\136\128 x : A, \226\136\128 y : A, \226\136\128 z : A, (mul : (A, A) -> A)(x, mul(y, z)) == mul(mul(x, y), z)) && (\226\136\128 x : A, \226\136\128 y : A, mul(x, y) == mul(y, x)) && (\226\136\128 x : A, mul((r1 : A), x) == x) && (\226\136\128 x : A, mul(r0, x) == r0) && (\226\136\128 x : A, \226\136\128 y : A, \226\136\128 z : A, mul(x, add(y, z)) == add(mul(x, y), mul(x, z))) && (\226\136\128 x : A, (pwr : (A, Num) -> A)(x, 0) == r1) && (\226\136\128 x : A, \226\136\128 n : Num, pwr(x, SUC(n)) == mul(x, pwr(x, n))) \226\134\146 mul(r1, (x : A)) == x && add(mul((a : A), (m : A)), mul((b : A), m)) == mul(add(a, b), m) && add(mul(a, m), m) == mul(add(a, r1), m) && add(m, mul(a, m)) == mul(add(a, r1), m) && add(m, m) == mul(add(r1, r1), m) && mul(r0, m) == r0 && add(r0, a) == a && add(a, r0) == a && mul(a, b) == mul(b, a) && mul(add(a, b), (c : A)) == add(mul(a, c), mul(b, c)) && mul(r0, a) == r0 && mul(a, r0) == r0 && mul(r1, a) == a && mul(a, r1) == a && mul(mul((lx : A), (ly : A)), mul((rx : A), (ry : A))) == mul(mul(lx, rx), mul(ly, ry)) && mul(mul(lx, ly), mul(rx, ry)) == mul(lx, mul(ly, mul(rx, ry))) && mul(mul(lx, ly), mul(rx, ry)) == mul(rx, mul(mul(lx, ly), ry)) && mul(mul(lx, ly), rx) == mul(mul(lx, rx), ly) && mul(mul(lx, ly), rx) == mul(lx, mul(ly, rx)) && mul(lx, rx) == mul(rx, lx) && mul(lx, mul(rx, ry)) == mul(mul(lx, rx), ry) && mul(lx, mul(rx, ry)) == mul(rx, mul(lx, ry)) && add(add(a, b), add(c, (d : A))) == add(add(a, c), add(b, d)) && add(add(a, b), c) == add(a, add(b, c)) && add(a, add(c, d)) == add(c, add(a, d)) && add(add(a, b), c) == add(add(a, c), b) && add(a, c) == add(c, a) && add(a, add(c, d)) == add(add(a, c), d) && mul(pwr(x, (p : Num)), pwr(x, (q : Num))) == pwr(x, p + q) && mul(x, pwr(x, q)) == pwr(x, SUC(q)) && mul(pwr(x, q), x) == pwr(x, SUC(q)) && mul(x, x) == pwr(x, 2) && pwr(mul(x, (y : A)), q) == mul(pwr(x, q), pwr(y, q)) && pwr(pwr(x, p), q) == pwr(x, p * q) && pwr(x, 0) == r1 && pwr(x, 1) == x && mul(x, add(y, (z : A))) == add(mul(x, y), mul(x, z)) && pwr(x, SUC(q)) == mul(x, pwr(x, q))
      #|  (\226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 z : Num, x + (y + z) == x + y + z) && (\226\136\128 x : Num, \226\136\128 y : Num, x + y == y + x) && (\226\136\128 x : Num, 0 + x == x) && (\226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 z : Num, x * (y * z) == x * y * z) && (\226\136\128 x : Num, \226\136\128 y : Num, x * y == y * x) && (\226\136\128 x : Num, 1 * x == x) && (\226\136\128 x : Num, 0 * x == 0) && (\226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 z : Num, x * (y + z) == x * y + x * z) && (\226\136\128 x : Num, EXP(x, 0) == 1) && (\226\136\128 x : Num, \226\136\128 n : Num, EXP(x, SUC(n)) == x * EXP(x, n))
      #|  (p : Num)
      #|  (q : Num)
      #|  0
      #|  1
      #|types = num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 60
      #|norm_sq =  |- ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) x:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#+:fun(num,fun(num,num)) x:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#+:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) x:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|norm_cube =  |- ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) a:num) b:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#+:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) a:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#*:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) a:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) b:num))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#*:fun(num,fun(num,num)) a:num) ((#EXP:fun(num,fun(num,num)) b:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#EXP:fun(num,fun(num,num)) b:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))
      #|norm_cancel =  |- ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) x:num) y:num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) y:num) x:num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) #_0:num)) z:num)))) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#*:fun(num,fun(num,num)) x:num) y:num)))
      #|norm_const =  |- ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|norm_poly =  |- ((#=:fun(num,fun(num,bool)) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) x:num) y:num)) ((#+:fun(num,fun(num,num)) x:num) y:num))) ((#*:fun(num,fun(num,num)) x:num) x:num))) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) x:num) y:num)) ((#+:fun(num,fun(num,num)) x:num) y:num))) ((#*:fun(num,fun(num,num)) x:num) x:num)))
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?1
      #|counter_genvar = _17247:bool
      #|
    ),
  )
}
