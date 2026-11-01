// Load-fidelity test for Library/symmetric_group.ml: replays tools/ocaml_ref/Library_symmetric_group_ref.ml
// (keep in sync; refresh with tools/ocaml_ref/refresh_ref.py).

///|
using @testkit {stm, sthm}

///|
test "Library/symmetric_group matches Library/symmetric_group.ml" {
  @symmetric_group.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot", "impconv", "pair", "compute", "nums", "recursion",
      "arith", "wf", "calc_num", "normalizer", "grobner", "ind_types", "lists", "realax",
      "calc_int", "realarith", "real", "calc_rat", "int", "sets", "iterate", "cart",
      "define", "Library/permutations", "Library/frag", "Library/wo", "Library/card",
      "Library/prime", "Library/grouptheory", "Library/symmetric_group",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Library/symmetric_group")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("symmetric_group", () => sthm(@symmetric_group.symmetric_group()))
  log.attempt("SYMMETRIC_GROUP", () => {
    sthm(@symmetric_group.symmetric_group_v1())
  })
  log.attempt("FINITE_SYMMETRIC_GROUP", () => {
    sthm(@symmetric_group.finite_symmetric_group())
  })
  log.attempt("CARD_SYMMETRIC_GROUP", () => {
    sthm(@symmetric_group.card_symmetric_group())
  })
  log.attempt("SYMMETRIC_GROUP_MUL", () => {
    sthm(@symmetric_group.symmetric_group_mul())
  })
  log.attempt("SYMMETRIC_GROUP_INV", () => {
    sthm(@symmetric_group.symmetric_group_inv())
  })
  log.attempt("SYMMETRIC_GROUP_ID", () => {
    sthm(@symmetric_group.symmetric_group_id())
  })
  log.attempt("SWAP_IN_SYMMETRIC_GROUP", () => {
    sthm(@symmetric_group.swap_in_symmetric_group())
  })
  log.attempt("THREE_CYCLE_IN_SYMMETRIC", () => {
    sthm(@symmetric_group.three_cycle_in_symmetric())
  })
  log.attempt("CAYLEY_THEOREM_EXPLICIT", () => {
    sthm(@symmetric_group.cayley_theorem_explicit())
  })
  log.attempt("CAYLEY_THEOREM", () => sthm(@symmetric_group.cayley_theorem()))
  log.attempt("SYMMETRIC_GROUP_ACTION", () => {
    sthm(@symmetric_group.symmetric_group_action())
  })
  log.attempt("CHAIN_STEP_THREE_CYCLES_GEN", () => {
    sthm(@symmetric_group.chain_step_three_cycles_gen())
  })
  log.attempt("NOT_SOLVABLE_SYMMETRIC_GROUP", () => {
    sthm(@symmetric_group.not_solvable_symmetric_group())
  })
  log.attempt("POINT_TRANSPOSITIONS_GENERATE_ALL", () => {
    sthm(@symmetric_group.point_transpositions_generate_all())
  })
  log.attempt("RESTRICT_SYMMETRIC_GROUP_HOMOMORPHISM", () => {
    sthm(@symmetric_group.restrict_symmetric_group_homomorphism())
  })
  log.attempt("SUBGROUP_RESTRICT_PERMUTES", () => {
    sthm(@symmetric_group.subgroup_restrict_permutes())
  })
  log.attempt("ALL_TRANSPOSITIONS_GENERATE_SYMMETRIC", () => {
    sthm(@symmetric_group.all_transpositions_generate_symmetric())
  })
  log.attempt("SYMMETRIC_GROUP_POW", () => {
    sthm(@symmetric_group.symmetric_group_pow())
  })
  log.attempt("SYMMETRIC_GROUP_POW_IN", () => {
    sthm(@symmetric_group.symmetric_group_pow_in())
  })
  log.attempt("PRIME_ORDER_PERM_NO_FIXPOINT", () => {
    sthm(@symmetric_group.prime_order_perm_no_fixpoint())
  })
  log.attempt("PRIME_ORDER_POW_PERM", () => {
    sthm(@symmetric_group.prime_order_pow_perm())
  })
  log.attempt("PRIME_ORDER_PERM_ORBIT", () => {
    sthm(@symmetric_group.prime_order_perm_orbit())
  })
  log.attempt("SWAP_CONJUGATE_IN_SUBGROUP", () => {
    sthm(@symmetric_group.swap_conjugate_in_subgroup())
  })
  log.attempt("TRANSPOSITION_PCYCLE_GENERATES", () => {
    sthm(@symmetric_group.transposition_pcycle_generates())
  })
  log.attempt("TRANSITIVE_TRANSPOSITION_GENERATES_SYMMETRIC", () => {
    sthm(@symmetric_group.transitive_transposition_generates_symmetric())
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
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..3..8..18..34..69..128..225..460..877..solved at 1636
      #|0..0..1..2..6..12..29..54..solved at 102
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..10..20..52..solved at 72
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|Warning: inventing type variables
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
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|Warning: inventing type variables
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
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..3..8..21..45..92..171..307..628..solved at 690
      #|0..0..3..8..21..46..93..171..323..647..solved at 707
      #|0..0..4..10..26..solved at 34
      #|Warning: inventing type variables
      #|0..0..1..3..7..28..solved at 76
      #|0..0..1..3..7..30..91..274..solved at 737
      #|Warning: inventing type variables
      #|0..0..1..3..7..30..91..274..solved at 737
      #|0..0..0..1..3..10..25..67..168..493..1373..solved at 1795
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..6..solved at 10
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..12..solved at 18
      #|Warning: inventing type variables
      #|0..0..1..3..12..35..109..323..939..2807..solved at 5066
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..12..solved at 18
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..8..solved at 13
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..0..0..2..5..8..11..14..17..34..51..68..91..114..137..188..239..290..351..412..473..568..663..758..867..976..1085..1298..1511..1724..1962..2200..2438..2884..3330..3776..4296..4816..5336..solved at 5512
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
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 6
      #|Warning: inventing type variables
      #|0..0..2..5..15..solved at 20
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..1..2..7..15..43..solved at 53
      #|0..0..2..4..solved at 8
      #|0..0..1..2..5..11..28..56..111..205..400..743..solved at 1363
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..5..10..18..37..67..solved at 111
      #|0..0..2..solved at 5
      #|0..0..2..6..15..39..solved at 48
      #|Warning: inventing type variables
      #|0..0..1..4..solved at 8
      #|0..0..1..3..7..30..91..274..solved at 737
      #|0..0..0..2..7..19..58..164..440..solved at 1116
      #|0..0..1..2..solved at 6
      #|0..0..1..5..solved at 9
      #|0..0..1..4..10..21..49..105..232..599..1492..3629..solved at 3675
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..28..43..64..106..148..209..312..415..560..858..1156..1607..2452..3297..4542..6767..8992..12211..solved at 41581
      #|0..0..1..solved at 5
      #|0..0..1..2..solved at 7
      #|0..0..2..solved at 5
      #|0..0..0..0..3..8..18..43..107..285..743..1921..4889..12303..solved at 30497
      #|0..0..1..2..5..9..15..solved at 42
      #|0..0..1..solved at 5
      #|0..0..2..solved at 5
      #|0..0..0..0..1..3..5..8..11..14..94..290..756..2023..solved at 5056
      #|0..0..1..2..5..9..15..solved at 42
      #|0..0..2..4..solved at 10
      #|0..0..2..5..solved at 11
      #|0..0..solved at 4
      #|0..0..0..0..0..1..4..7..16..25..34..61..88..115..202..289..376..649..1002..1355..solved at 26009
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..2..5..15..solved at 27
      #|0..0..2..5..15..51..151..433..solved at 783
      #|0..0..2..5..15..51..151..433..solved at 783
      #|0..0..2..5..15..solved at 27
      #|0..0..2..6..17..solved at 32
      #|0..0..2..6..17..53..155..440..solved at 790
      #|0..0..2..6..17..53..155..440..solved at 790
      #|0..0..2..6..17..solved at 32
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..2..4..9..21..44..82..156..326..655..1505..3543..8960..22649..solved at 35827
      #|0..0..1..2..6..12..27..solved at 50
      #|0..0..1..2..6..12..27..50..98..200..412..970..2239..5777..14683..41614..113583..solved at 136827
      #|0..0..2..4..9..22..46..95..191..460..1082..2888..solved at 4940
      #|0..0..1..2..6..13..29..69..146..372..solved at 599
      #|0..0..1..2..6..12..27..50..98..200..406..951..2107..5399..solved at 6302
      #|0..0..0..1..5..18..solved at 30
      #|0..0..0..0..3..9..23..85..242..674..2059..6103..17816..solved at 51719
      #|0..0..1..3..7..15..26..50..96..162..317..605..1040..1846..3220..5224..8819..14822..24013..40491..solved at 50986
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..6..solved at 10
      #|0..0..1..solved at 4
      #|0..0..1..2..8..21..60..solved at 134
      #|Warning: inventing type variables
      #|0..0..1..2..9..17..33..solved at 42
      #|0..0..1..2..5..11..20..35..60..106..solved at 130
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..1..4..12..solved at 30
      #|0..0..1..2..5..13..26..solved at 33
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 8
      #|Warning: inventing type variables
      #|0..0..1..3..8..13..solved at 19
      #|Warning: inventing type variables
      #|0..0..1..3..8..14..solved at 20
      #|0..0..1..3..7..30..91..274..solved at 737
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..5..10..17..30..44..62..97..134..185..269..365..490..737..solved at 1208
      #|0..0..2..solved at 6
      #|0..0..2..6..15..41..105..252..630..1563..3784..9119..22332..solved at 22472
      #|0..0..1..3..7..30..91..274..solved at 737
      #|0..0..0..2..7..19..58..164..440..solved at 1116
      #|0..0..1..solved at 4
      #|0..0..1..2..5..10..17..30..44..62..97..134..185..269..365..490..737..solved at 1208
      #|0..0..2..solved at 6
      #|0..0..2..6..15..41..105..252..630..1563..3784..9119..22332..solved at 22472
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..0..1..3..7..solved at 12
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..5..11..28..56..111..205..380..677..solved at 1197
      #|0..0..0..2..4..10..24..45..100..193..351..675..1230..2204..solved at 3755
      #|0..0..1..2..5..solved at 13
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..6..15..49..94..165..241..323..424..589..774..1113..1562..2112..2823..3610..4502..5619..6940..8453..10183..12107..14192..16519..19073..22189..solved at 23996
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
      #|0..0..solved at 3
      #|0..0..solved at 7
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 6
      #|0..0..solved at 8
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 8
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 6
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 7
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 6
      #|0..0..solved at 5
      #|0..0..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 7
      #|0..0..solved at 3
      #|0..0..solved at 5
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
      #|0..0..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 7
      #|0..0..solved at 3
      #|0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 9
      #|0..0..solved at 10
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 5
      #|0..0..solved at 7
      #|0..0..3..6..15..51..97..solved at 124
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..3..11..22..solved at 37
      #|0..0..2..4..11..26..50..solved at 57
      #|Warning: inventing type variables
      #|0..0..1..4..solved at 8
      #|Warning: inventing type variables
      #|0..0..2..4..12..solved at 21
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..2..4..10..24..46..solved at 53
      #|0..0..3..8..22..solved at 33
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..2..3..7..13..21..38..59..86..129..177..solved at 217
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 6
      #|0..0..5..11..25..43..solved at 57
      #|0..0..6..13..30..52..solved at 62
      #|0..0..solved at 3
      #|0..0..5..11..25..43..303..solved at 317
      #|0..0..solved at 6
      #|0..0..6..13..30..52..464..solved at 474
      #|0..0..solved at 5
      #|0..0..6..13..30..52..411..876..1965..solved at 1977
      #|0..0..6..13..30..52..solved at 59
      #|0..0..7..15..35..61..573..1208..solved at 1253
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..4..8..solved at 18
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..4..8..solved at 18
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 7
      #|0..0..solved at 6
      #|0..0..7..14..36..65..solved at 101
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..7..14..solved at 18
      #|0..0..8..16..solved at 21
      #|0..0..7..14..solved at 18
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..3..9..solved at 15
      #|0..0..1..2..3..12..solved at 20
      #|Warning: inventing type variables
      #|0..0..0..solved at 4
      #|0..0..1..2..7..15..25..46..70..103..162..227..303..solved at 432
      #|Warning: inventing type variables
      #|0..0..1..2..5..8..17..30..53..84..147..234..solved at 468
      #|0..0..1..2..5..8..17..30..53..84..147..234..solved at 617
      #|0..0..1..2..5..8..19..34..59..92..162..256..solved at 307
      #|0..0..3..6..15..24..53..88..153..254..456..708..solved at 740
      #|Warning: inventing type variables
      #|0..0..0..0..1..2..3..6..9..12..15..25..35..45..55..65..75..92..109..126..solved at 143
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..7..15..43..88..solved at 111
      #|Warning: inventing type variables
      #|0..0..solved at 4
      #|0..0..4..8..solved at 12
      #|0..0..4..8..solved at 16
      #|0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..2..4..14..solved at 28
      #|0..0..2..4..solved at 8
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..4..8..solved at 12
      #|0..0..solved at 2
      #|0..0..3..6..25..65..186..490..1271..3303..solved at 4780
      #|0..0..3..7..solved at 11
      #|0..0..solved at 4
      #|0..0..5..13..solved at 20
      #|0..0..4..10..solved at 22
      #|0..0..5..10..solved at 28
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..7..16..solved at 50
      #|0..0..3..6..solved at 10
      #|0..0..4..8..27..76..210..542..1426..solved at 1966
      #|0..0..4..9..solved at 28
      #|0..0..5..10..solved at 14
      #|0..0..5..12..38..112..solved at 168
      #|0..0..6..13..46..solved at 56
      #|Warning: inventing type variables
      #|0..0..1..4..11..37..78..solved at 102
      #|0..0..1..3..solved at 7
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..1..2..5..15..28..49..88..136..191..287..387..521..752..1029..1341..solved at 1927
      #|0..0..2..4..8..17..solved at 34
      #|0..0..solved at 3
      #|0..0..3..6..17..39..78..solved at 118
      #|0..0..2..5..solved at 9
      #|0..0..2..4..12..solved at 17
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..5..9..15..31..47..72..118..164..231..solved at 311
      #|0..0..1..5..18..solved at 23
      #|0..0..1..2..5..9..15..30..45..68..110..152..213..solved at 345
      #|0..0..1..5..17..solved at 22
      #|0..0..1..3..solved at 7
      #|0..0..1..solved at 5
      #|0..0..3..solved at 9
      #|0..0..solved at 2
      #|0..0..2..4..10..18..30..60..94..152..solved at 197
      #|0..0..solved at 2
      #|0..0..2..4..10..18..30..60..94..152..solved at 197
      #|0..0..2..5..12..25..solved at 34
      #|0..0..2..solved at 8
      #|0..0..2..solved at 8
      #|0..0..2..solved at 8
      #|0..0..3..7..solved at 12
      #|0..0..4..9..22..42..71..181..336..584..solved at 1243
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..5..12..29..57..97..227..426..730..solved at 1231
      #|0..0..solved at 4
      #|0..0..2..4..solved at 15
      #|0..0..1..2..7..solved at 18
      #|0..0..2..solved at 8
      #|0..0..2..5..solved at 10
      #|0..0..1..2..3..7..14..29..56..103..solved at 124
      #|0..0..1..solved at 4
      #|0..0..1..2..3..7..12..17..28..48..solved at 67
      #|0..0..1..2..5..solved at 11
      #|0..0..1..solved at 4
      #|0..0..0..2..4..8..17..solved at 31
      #|0..0..1..2..solved at 6
      #|0..0..1..2..7..15..45..91..252..solved at 358
      #|0..0..1..2..solved at 6
      #|0..0..1..2..7..15..46..92..257..solved at 312
      #|0..0..1..3..9..48..206..884..solved at 3701
      #|0..0..1..3..9..48..206..884..solved at 3704
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..2..5..9..15..30..47..76..solved at 122
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..1..2..6..12..27..solved at 44
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..9..17..33..51..77..solved at 86
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..7..13..23..47..75..120..solved at 170
      #|0..0..2..4..solved at 8
      #|0..0..1..3..6..21..52..115..solved at 177
      #|0..0..2..solved at 5
      #|0..0..1..3..6..21..52..115..solved at 177
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|0..0..2..solved at 5
      #|0..0..2..6..13..solved at 21
      #|0..0..solved at 2
      #|0..0..2..5..13..27..58..106..191..solved at 200
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..4..9..solved at 21
      #|0..0..5..11..solved at 34
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..5..12..solved at 30
      #|0..0..6..14..43..92..225..439..solved at 619
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..5..11..solved at 23
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..6..14..solved at 32
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..solved at 2
      #|0..0..1..3..solved at 8
      #|0..0..solved at 2
      #|0..0..1..2..8..18..54..112..292..564..solved at 675
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..2..8..18..54..112..292..564..solved at 675
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..4..solved at 7
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..1..4..solved at 14
      #|0..0..0..0..0..solved at 7
      #|0..0..0..0..0..solved at 5
      #|Warning: inventing type variables
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..2..4..solved at 9
      #|0..0..4..8..solved at 16
      #|0..0..3..6..solved at 15
      #|0..0..4..8..solved at 17
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..5..10..solved at 18
      #|0..0..4..8..solved at 16
      #|0..0..5..10..solved at 17
      #|0..0..5..10..solved at 17
      #|0..0..6..12..solved at 19
      #|0..0..solved at 2
      #|0..0..1..2..6..12..27..48..solved at 81
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..12..27..48..95..solved at 141
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..6..12..27..48..solved at 81
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..8..18..39..78..solved at 116
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|Warning: inventing type variables
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|Warning: inventing type variables
      #|0..0..1..4..10..24..48..85..142..232..354..solved at 401
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..6..12..27..48..solved at 81
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..3..solved at 6
      #|0..0..2..solved at 5
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
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
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..1..2..6..12..27..solved at 44
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..1..2..3..9..15..21..solved at 28
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..22..29..36..47..58..73..solved at 88
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..1..2..3..8..13..18..57..118..228..519..solved at 739
      #|Warning: inventing type variables
      #|0..0..1..2..5..9..solved at 26
      #|0..0..1..2..5..9..solved at 20
      #|0..0..1..2..5..9..21..47..87..151..258..405..710..1166..solved at 1521
      #|0..0..1..2..5..9..25..53..99..175..299..474..853..1349..solved at 1831
      #|0..0..1..2..5..solved at 13
      #|0..0..1..solved at 4
      #|0..0..1..2..5..solved at 15
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..18..29..45..71..108..169..257..381..538..solved at 742
      #|0..0..1..2..5..9..16..26..38..61..102..159..252..394..580..solved at 726
      #|0..0..1..solved at 4
      #|0..0..1..2..5..solved at 13
      #|0..0..1..solved at 4
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..5..16..34..61..solved at 90
      #|0..0..1..2..5..16..34..61..solved at 90
      #|0..0..1..2..5..11..25..49..84..solved at 131
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..30..47..76..solved at 126
      #|0..0..solved at 2
      #|0..0..1..2..5..10..17..28..40..54..75..100..131..178..227..288..463..658..989..1460..1981..2672..solved at 3038
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..5..10..17..26..36..46..65..88..119..179..241..337..466..616..813..1102..1471..1948..2621..3397..4465..5888..7673..10132..13214..17136..solved at 18055
      #|0..0..1..2..5..8..11..solved at 19
      #|0..0..1..3..solved at 7
      #|0..0..0..2..solved at 7
      #|0..0..0..2..4..8..17..29..45..solved at 67
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..5..10..17..26..36..46..65..88..119..168..219..284..394..512..681..919..1170..1494..1982..2526..3321..4350..5574..7191..9311..11911..15330..19654..solved at 23364
      #|0..0..1..2..5..10..17..solved at 28
      #|Warning: inventing type variables
      #|0..0..1..2..7..solved at 13
      #|0..0..1..2..6..solved at 11
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..12..22..35..solved at 52
      #|0..0..1..2..5..12..22..35..solved at 52
      #|0..0..1..2..5..9..15..22..29..36..58..83..123..179..242..318..433..563..725..1022..1361..1827..2451..3230..4181..5624..7450..9727..solved at 11847
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..10..17..solved at 28
      #|0..0..1..2..5..10..17..26..36..46..63..84..111..156..204..266..349..438..545..808..1159..1670..2393..3227..4201..5598..solved at 5698
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 8
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..3..solved at 7
      #|0..0..3..solved at 7
      #|0..0..4..solved at 8
      #|0..0..3..solved at 7
      #|0..0..1..solved at 4
      #|0..0..2..solved at 6
      #|0..0..1..2..5..solved at 14
      #|0..0..1..2..5..solved at 14
      #|0..0..1..2..6..12..23..39..59..83..130..183..268..390..555..757..1058..1412..1853..2469..3252..4213..solved at 4354
      #|0..0..1..2..6..11..18..34..51..72..solved at 117
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..7..16..41..86..196..solved at 220
      #|0..0..1..2..7..15..solved at 21
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
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
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..1..2..5..10..17..solved at 32
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
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
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..6..solved at 10
      #|0..0..solved at 2
      #|0..0..2..4..solved at 14
      #|0..0..solved at 2
      #|0..0..3..solved at 9
      #|0..0..2..11..solved at 18
      #|0..0..2..8..24..solved at 31
      #|0..0..1..6..17..37..65..114..solved at 158
      #|0..0..2..8..24..solved at 31
      #|0..0..2..8..solved at 23
      #|0..0..2..7..solved at 12
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..1..3..8..solved at 20
      #|Warning: inventing type variables
      #|0..0..1..3..8..solved at 20
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..1..3..8..solved at 20
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
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
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
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
      #|0..0..4..10..solved at 18
      #|0..0..3..6..solved at 10
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
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..4..10..solved at 18
      #|0..0..3..6..solved at 10
      #|0..0..4..8..19..36..64..106..159..solved at 176
      #|0..0..solved at 2
      #|0..0..2..4..11..solved at 24
      #|0..0..solved at 2
      #|0..0..2..4..11..solved at 24
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..3..6..solved at 12
      #|0..0..1..3..6..solved at 12
      #|0..0..1..2..solved at 7
      #|0..0..2..4..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..13..26..60..116..231..376..705..1212..2448..4520..9271..17452..solved at 18810
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..solved at 10
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..3..solved at 6
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..4..8..20..solved at 28
      #|0..0..2..solved at 5
      #|0..0..2..4..11..22..38..58..solved at 82
      #|0..0..2..4..11..20..34..51..68..85..125..solved at 147
      #|0..0..2..4..11..22..38..58..solved at 82
      #|0..0..2..4..11..20..34..51..68..85..139..solved at 173
      #|0..0..2..4..11..22..38..58..solved at 82
      #|0..0..2..4..11..21..36..54..74..95..140..186..266..366..482..622..839..solved at 1015
      #|0..0..2..4..11..22..38..58..solved at 82
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..3..6..15..solved at 31
      #|0..0..solved at 2
      #|0..0..3..6..15..solved at 31
      #|0..0..2..4..8..solved at 19
      #|0..0..solved at 2
      #|0..0..2..4..9..18..33..53..83..118..solved at 161
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..5..9..15..27..solved at 41
      #|0..0..0..1..3..7..solved at 14
      #|Warning: inventing type variables
      #|0..0..1..2..5..9..15..solved at 26
      #|0..0..0..1..3..7..solved at 14
      #|0..0..1..3..7..solved at 12
      #|0..0..1..2..7..13..25..39..57..77..132..solved at 179
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..1..2..3..4..5..6..solved at 17
      #|0..0..1..2..5..8..11..20..30..42..68..100..138..solved at 177
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..1..2..3..4..5..6..solved at 17
      #|0..0..1..2..5..8..11..20..30..42..68..100..138..solved at 177
      #|0..0..solved at 2
      #|0..0..1..2..7..13..solved at 20
      #|0..0..1..2..7..13..solved at 19
      #|0..0..1..2..5..9..solved at 20
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..8..11..26..42..60..111..166..241..397..557..779..solved at 1107
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..1..2..3..4..5..6..12..18..24..32..40..48..95..149..solved at 176
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..3..solved at 8
      #|0..0..2..4..solved at 11
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..0..1..3..7..20..solved at 34
      #|0..0..1..2..4..solved at 10
      #|0..0..1..2..4..11..22..solved at 32
      #|0..0..1..2..6..11..18..26..34..42..60..78..104..solved at 118
      #|0..0..1..2..6..11..18..26..34..42..60..78..104..solved at 118
      #|0..0..1..3..7..solved at 13
      #|0..0..1..solved at 4
      #|0..0..1..2..5..solved at 10
      #|0..0..1..2..3..6..9..12..solved at 19
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..0..2..solved at 6
      #|0..0..0..3..6..solved at 11
      #|0..0..0..4..8..12..23..36..91..162..233..394..578..778..1150..solved at 1184
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..solved at 35
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..5..8..solved at 14
      #|0..0..1..2..3..6..9..12..15..18..21..solved at 30
      #|0..0..1..2..5..solved at 13
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..3..solved at 8
      #|Warning: inventing type variables
      #|0..0..1..2..3..7..13..21..solved at 40
      #|Warning: inventing type variables
      #|0..0..1..2..3..7..14..25..44..67..92..solved at 171
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..10..19..30..44..58..74..98..122..solved at 139
      #|0..0..1..3..11..24..37..solved at 48
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..7..13..solved at 22
      #|0..0..solved at 2
      #|0..0..1..2..7..15..31..solved at 52
      #|0..0..1..2..6..15..solved at 40
      #|0..0..1..2..7..17..40..72..123..206..326..497..785..1172..1741..2476..solved at 2611
      #|0..0..1..2..5..9..15..26..40..67..solved at 90
      #|0..0..1..2..solved at 6
      #|0..0..10..24..63..141..297..491..783..1282..solved at 1412
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..4..14..45..solved at 129
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..4..6..8..solved at 14
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..3..5..12..solved at 26
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..4..13..40..solved at 100
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..4..12..20..28..47..70..93..124..155..192..252..312..372..460..552..644..solved at 728
      #|0..0..1..2..10..18..31..48..65..82..110..138..solved at 155
      #|0..0..1..2..4..solved at 9
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 10
      #|0..0..1..2..7..14..34..68..141..263..572..solved at 996
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..4..solved at 10
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..solved at 10
      #|0..0..3..6..solved at 14
      #|0..0..1..3..7..22..51..90..162..solved at 204
      #|0..0..1..2..5..10..solved at 22
      #|0..0..1..2..5..10..solved at 22
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..4..solved at 10
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..4..solved at 10
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..6..solved at 15
      #|0..0..1..2..6..solved at 15
      #|0..0..1..2..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..5..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 10
      #|0..0..1..2..5..12..22..38..57..80..124..solved at 170
      #|0..0..1..2..4..solved at 9
      #|0..0..0..1..2..3..8..14..22..36..50..66..106..148..206..solved at 234
      #|0..0..1..2..3..15..36..65..119..solved at 138
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..11..18..30..42..58..solved at 73
      #|0..0..1..2..6..11..18..30..42..58..85..112..150..242..344..solved at 508
      #|0..0..1..2..6..11..18..30..42..58..87..116..158..222..286..366..543..724..1029..solved at 1427
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..1..2..6..12..23..42..solved at 73
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..9..15..solved at 23
      #|0..0..1..2..5..9..15..26..37..52..77..102..137..232..339..537..842..1213..1854..solved at 2020
      #|0..0..1..2..5..9..15..26..37..52..73..94..121..162..203..258..368..478..651..1025..1463..2122..3212..4673..6652..9750..14227..20202..29598..41979..solved at 46055
      #|0..0..1..2..5..9..15..22..29..36..52..68..93..128..163..208..solved at 287
      #|0..0..1..2..solved at 6
      #|0..0..2..4..8..16..27..39..51..63..85..114..153..200..259..326..solved at 411
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..12..22..solved at 40
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..0..1..2..3..7..14..22..solved at 30
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..0..1..2..3..4..5..6..solved at 17
      #|0..0..1..2..4..9..15..21..29..37..solved at 45
      #|0..0..1..4..7..14..37..80..129..187..269..386..537..710..949..1253..1634..2165..2813..3588..4639..5802..7058..8770..10676..12847..solved at 14183
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..4..9..27..50..78..123..174..242..325..418..529..699..904..1175..1533..1925..solved at 2155
      #|0..0..1..2..4..9..27..50..78..123..190..282..392..520..670..904..1176..1523..1984..2506..solved at 2868
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..13..25..49..80..116..191..326..485..754..1133..1686..2466..4169..6042..11062..solved at 13762
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..3..solved at 10
      #|0..0..1..2..3..7..13..21..solved at 40
      #|0..0..1..2..3..7..13..21..solved at 41
      #|0..0..1..2..3..7..14..25..44..67..92..solved at 157
      #|0..0..1..2..3..7..14..25..44..67..96..solved at 167
      #|0..0..1..2..5..11..19..33..51..76..105..solved at 154
      #|0..0..1..2..5..10..17..26..solved at 40
      #|0..0..1..2..5..10..17..26..solved at 40
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..3..7..14..26..solved at 54
      #|0..0..1..2..3..7..15..30..72..126..200..solved at 386
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..1..2..3..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..0..1..2..3..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..0..1..2..3..4..5..6..solved at 17
      #|0..0..1..2..5..9..15..solved at 25
      #|0..0..1..2..5..9..15..30..45..68..solved at 83
      #|0..0..1..2..5..9..15..30..45..68..97..126..161..solved at 178
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..5..solved at 10
      #|0..0..0..1..3..solved at 8
      #|0..0..0..1..4..11..27..50..solved at 79
      #|0..0..0..1..5..15..38..70..117..255..435..653..solved at 953
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..3..7..13..solved at 22
      #|0..0..1..solved at 4
      #|0..0..1..2..3..7..15..28..62..solved at 98
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..7..17..34..81..141..236..solved at 391
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..3..7..13..solved at 22
      #|0..0..1..solved at 4
      #|0..0..1..2..3..7..15..28..62..solved at 98
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..7..17..34..81..141..236..solved at 393
      #|0..0..solved at 2
      #|0..0..0..0..1..3..5..8..11..14..22..30..47..solved at 62
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..4..11..27..59..121..232..417..732..1169..1828..2743..4001..5690..8016..10994..14946..20247..26827..35221..solved at 42299
      #|0..0..1..4..solved at 9
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..2..8..solved at 12
      #|0..0..1..6..15..solved at 23
      #|0..0..1..2..5..solved at 13
      #|0..0..2..9..20..43..78..solved at 130
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..solved at 13
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..2..6..solved at 11
      #|0..0..1..solved at 4
      #|0..0..1..6..11..31..65..137..263..525..solved at 653
      #|0..0..1..3..7..solved at 12
      #|0..0..1..3..7..solved at 12
      #|0..0..1..3..7..solved at 12
      #|0..0..1..3..7..solved at 12
      #|0..0..1..3..7..solved at 13
      #|0..0..1..3..7..solved at 12
      #|0..0..1..2..5..8..11..21..32..45..75..112..156..249..374..536..solved at 646
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..3..solved at 10
      #|0..0..1..2..4..10..17..29..solved at 38
      #|0..0..0..1..4..solved at 9
      #|0..0..1..2..5..11..19..36..solved at 44
      #|0..0..0..2..5..solved at 10
      #|0..0..1..2..3..7..12..17..30..44..60..98..136..190..solved at 251
      #|0..0..1..2..5..9..15..30..49..79..135..204..303..518..solved at 711
      #|0..0..1..solved at 4
      #|0..0..1..2..5..10..20..solved at 29
      #|0..0..1..2..5..9..15..28..41..60..94..128..177..337..533..936..1622..2517..4291..solved at 4854
      #|0..0..1..2..5..9..15..28..41..60..89..118..157..211..265..334..544..754..1141..2130..3305..5155..7994..12615..18532..30282..49622..77974..126195..191725..solved at 214061
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..22..29..36..47..58..73..solved at 87
      #|0..0..1..3..solved at 8
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..12..22..40..61..88..127..173..232..solved at 331
      #|0..0..solved at 2
      #|0..0..1..3..solved at 8
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..9..15..22..29..36..47..58..73..solved at 87
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..5..15..solved at 21
      #|0..0..1..2..5..10..20..34..52..76..109..147..solved at 165
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..0..1..3..7..15..25..38..55..74..solved at 105
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..3..solved at 8
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..3..solved at 8
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..0..1..3..7..12..19..29..41..55..solved at 85
      #|0..0..1..3..solved at 8
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..9..solved at 20
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..9..solved at 20
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..22..solved at 36
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..22..solved at 36
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..9..solved at 20
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..9..solved at 20
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..8..18..36..solved at 80
      #|0..0..1..2..5..9..15..22..29..36..47..58..73..solved at 88
      #|0..0..1..3..8..18..36..solved at 80
      #|0..0..1..2..5..9..15..22..29..36..47..58..73..solved at 88
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..2..solved at 7
      #|0..0..2..solved at 5
      #|0..0..2..solved at 7
      #|0..0..2..solved at 6
      #|0..0..2..solved at 7
      #|0..0..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..solved at 13
      #|Warning: inventing type variables
      #|0..0..1..2..5..9..15..24..33..44..solved at 70
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..5..10..17..26..38..50..71..96..127..176..234..306..461..622..878..solved at 922
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..3..solved at 7
      #|0..0..1..3..solved at 7
      #|0..0..1..4..solved at 9
      #|0..0..1..3..solved at 7
      #|0..0..1..4..solved at 9
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 7
      #|0..0..solved at 2
      #|0..0..0..1..2..3..7..11..15..28..41..54..97..140..183..3094..solved at 8050
      #|0..0..0..1..2..3..7..11..15..28..41..54..97..140..183..3094..solved at 8050
      #|0..0..1..2..solved at 6
      #|0..0..1..3..7..13..24..41..solved at 56
      #|0..0..1..3..7..13..24..39..58..99..153..245..391..589..939..solved at 1214
      #|0..0..1..3..7..13..24..39..58..98..149..236..368..548..862..1338..2065..3311..5389..8409..13562..21506..33052..52774..82846..solved at 105253
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 10
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..7..13..24..45..71..122..188..solved at 258
      #|0..0..solved at 2
      #|0..0..2..5..solved at 9
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..1..3..7..13..24..45..71..122..188..solved at 258
      #|0..0..solved at 2
      #|0..0..2..5..solved at 9
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..4..solved at 9
      #|0..0..1..2..5..9..15..24..33..44..66..88..121..178..238..345..506..719..1018..1432..1920..solved at 2398
      #|0..0..1..2..5..9..15..29..45..73..119..176..257..400..587..solved at 788
      #|0..0..1..2..3..7..12..17..25..33..41..solved at 65
      #|0..0..1..2..3..7..12..17..25..33..41..solved at 65
      #|0..0..3..7..21..36..solved at 43
      #|0..0..3..solved at 6
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..1..solved at 5
      #|Warning: inventing type variables
      #|0..0..3..7..21..36..solved at 43
      #|0..0..3..solved at 6
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..1..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 8
      #|0..0..1..3..7..17..32..66..108..solved at 124
      #|0..0..1..3..7..17..32..solved at 45
      #|0..0..1..3..solved at 7
      #|0..0..1..3..6..solved at 11
      #|0..0..1..2..5..9..15..solved at 23
      #|0..0..0..2..5..solved at 10
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..3..7..15..26..46..70..100..141..186..239..312..393..490..679..887..1196..solved at 1312
      #|0..0..1..2..7..13..25..39..57..77..111..146..200..263..340..432..554..688..856..1118..1429..1861..2585..3444..4714..solved at 5996
      #|0..0..1..2..5..12..22..38..56..78..106..140..179..238..299..380..485..598..741..923..1115..1351..1711..2108..2696..3633..4705..6274..9191..12763..17925..solved at 23734
      #|0..0..1..2..8..15..24..34..44..54..75..96..solved at 134
      #|0..0..1..8..25..62..176..419..974..2530..6328..solved at 6344
      #|0..0..1..11..solved at 21
      #|0..0..1..12..36..solved at 62
      #|0..0..0..solved at 4
      #|0..0..1..3..7..solved at 16
      #|0..0..1..2..7..14..solved at 21
      #|0..0..1..2..7..13..27..solved at 40
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..9..solved at 27
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..3..7..13..21..35..51..70..113..168..241..349..490..650..solved at 845
      #|0..0..1..2..3..7..15..29..52..81..118..278..476..767..1135..1854..2656..8931..16066..solved at 19155
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..1..solved at 5
      #|0..0..0..0..1..2..3..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..10..17..solved at 27
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..10..17..solved at 27
      #|0..0..1..2..4..6..8..solved at 14
      #|0..0..1..2..4..6..8..solved at 14
      #|0..0..0..0..1..3..5..8..11..14..23..32..41..54..67..80..122..172..226..310..solved at 397
      #|0..0..0..0..2..4..6..9..12..15..26..37..48..63..78..93..133..177..225..303..383..475..613..755..915..1132..1351..1601..solved at 1683
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..2..5..9..15..solved at 24
      #|0..0..0..0..3..7..13..solved at 21
      #|0..0..1..2..5..9..15..27..43..67..113..164..239..338..449..597..856..1136..1570..solved at 1773
      #|Warning: inventing type variables
      #|0..0..0..2..solved at 6
      #|0..0..0..2..4..8..solved at 15
      #|Warning: inventing type variables
      #|0..0..0..0..0..solved at 5
      #|0..0..0..0..0..0..solved at 6
      #|Warning: inventing type variables
      #|0..0..0..0..0..solved at 5
      #|0..0..0..0..0..0..solved at 6
      #|0..0..1..solved at 6
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..0..0..3..7..14..24..37..solved at 46
      #|0..0..0..0..3..7..14..24..37..solved at 46
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..0..2..4..8..17..solved at 31
      #|0..0..1..4..8..21..solved at 39
      #|0..0..0..2..5..13..solved at 23
      #|0..0..solved at 2
      #|0..0..2..4..10..solved at 18
      #|0..0..0..0..0..0..solved at 6
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..0..0..13..29..72..solved at 199
      #|0..0..0..0..7..16..33..solved at 88
      #|0..0..0..0..solved at 9
      #|0..0..0..0..3..7..13..30..solved at 39
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..1..2..3..7..14..25..solved at 44
      #|0..0..1..2..3..7..14..25..44..67..95..137..184..250..407..solved at 554
      #|0..0..1..2..3..7..14..25..45..71..107..162..225..312..449..solved at 513
      #|0..0..1..2..3..10..27..50..83..122..170..solved at 193
      #|Warning: inventing type variables
      #|0..0..1..2..3..7..14..25..44..67..92..solved at 171
      #|0..0..0..0..2..4..6..16..33..53..96..solved at 113
      #|0..0..0..0..1..3..5..13..28..46..77..solved at 94
      #|0..0..1..2..5..9..15..26..37..52..82..119..171..solved at 185
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..6..11..19..solved at 32
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..6..11..19..solved at 32
      #|0..0..1..2..5..9..15..28..42..65..99..136..185..257..331..442..solved at 513
      #|0..0..1..2..5..9..15..28..42..65..99..136..185..259..335..450..solved at 519
      #|0..0..0..2..4..8..13..20..30..42..56..96..210..360..571..876..1265..1889..2730..3938..5924..solved at 8663
      #|0..0..1..2..5..9..15..24..33..44..79..120..185..296..458..solved at 702
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..5..9..15..22..29..44..95..156..solved at 270
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..3..solved at 7
      #|0..0..1..2..6..14..solved at 27
      #|0..0..1..2..6..solved at 11
      #|0..0..1..solved at 4
      #|0..0..1..2..6..12..21..33..solved at 50
      #|0..0..1..2..5..12..22..54..98..174..331..524..845..solved at 1332
      #|0..0..1..2..4..solved at 9
      #|0..0..1..2..4..solved at 9
      #|0..0..1..2..5..9..15..33..53..89..144..204..289..413..545..740..solved at 837
      #|0..0..1..2..5..9..15..33..53..89..144..204..289..411..541..732..1146..1629..2659..4228..6447..9983..17043..28419..solved at 30317
      #|CPU time (user): <t>
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..7..13..21..34..49..solved at 64
      #|0..0..0..1..3..7..13..21..solved at 31
      #|0..0..0..0..1..4..10..23..40..solved at 59
      #|0..0..0..1..3..8..14..23..38..58..solved at 80
      #|0..0..1..3..9..solved at 15
      #|0..0..1..2..5..9..15..26..43..64..108..154..214..solved at 260
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..10..21..41..71..119..204..315..516..840..1330..2100..3413..5332..8513..13414..solved at 13939
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..0..1..2..3..4..5..6..solved at 17
      #|0..0..1..4..solved at 8
      #|0..0..1..2..6..10..14..24..34..44..76..114..solved at 132
      #|0..0..1..2..3..7..12..22..37..solved at 52
      #|0..0..1..2..7..13..26..47..79..solved at 99
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..2..solved at 6
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..0..2..7..solved at 19
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..2..4..8..17..29..50..88..143..219..337..490..739..1118..1679..2524..solved at 3229
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..2..4..8..17..29..50..88..143..219..337..490..739..1118..1679..2524..solved at 3229
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..3..6..16..28..49..89..solved at 168
      #|0..0..1..3..9..solved at 14
      #|0..0..solved at 2
      #|0..0..1..2..7..solved at 16
      #|0..0..1..2..7..14..22..solved at 37
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..0..3..6..16..28..49..81..solved at 150
      #|0..0..1..2..5..9..17..26..39..solved at 50
      #|0..0..1..2..7..13..23..solved at 31
      #|0..0..1..2..8..15..31..57..93..141..244..solved at 283
      #|0..0..0..solved at 3
      #|0..0..0..2..4..8..solved at 15
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..0..0..3..8..15..solved at 22
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 7
      #|0..0..0..1..3..7..12..19..40..solved at 76
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..9..21..36..55..86..146..217..solved at 256
      #|0..0..1..2..5..9..21..36..55..86..148..219..solved at 264
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..0..4..solved at 8
      #|0..0..1..solved at 6
      #|0..0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..2..solved at 6
      #|0..0..1..2..5..solved at 13
      #|Warning: inventing type variables
      #|0..0..0..2..4..solved at 9
      #|0..0..1..2..7..15..24..solved at 41
      #|Warning: inventing type variables
      #|0..0..1..2..3..4..8..solved at 18
      #|0..0..0..2..solved at 6
      #|0..0..1..2..6..13..solved at 23
      #|0..0..2..6..10..16..40..85..145..249..360..solved at 387
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..9..solved at 26
      #|1 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|0..0..0..0..0..3..7..11..solved at 19
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..5..11..20..33..solved at 51
      #|0..0..1..2..5..11..21..33..solved at 51
      #|Warning: inventing type variables
      #|0..0..1..2..3..4..solved at 10
      #|0..0..0..0..2..4..6..9..12..15..19..23..27..38..49..60..72..84..96..111..126..141..158..175..192..209..226..243..270..297..324..360..396..432..468..504..540..solved at 578
      #|Warning: inventing type variables
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..3..7..12..solved at 19
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..5..10..18..32..49..74..solved at 99
      #|0..0..1..2..4..solved at 11
      #|0..0..1..2..4..solved at 11
      #|0..0..1..2..4..solved at 11
      #|0..0..1..2..4..solved at 11
      #|0..0..1..2..4..solved at 11
      #|0..0..1..2..4..solved at 11
      #|0..0..1..2..4..solved at 11
      #|0..0..1..2..4..solved at 11
      #|0..0..1..2..4..solved at 11
      #|0..0..1..2..4..solved at 11
      #|0..0..1..2..4..solved at 11
      #|0..0..1..2..4..solved at 11
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..4..solved at 11
      #|0..0..1..2..4..solved at 11
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..4..solved at 11
      #|0..0..1..2..4..solved at 11
      #|0..0..1..2..solved at 6
      #|1 basis elements and 0 critical pairs
      #|0..0..2..6..18..solved at 23
      #|0..0..2..6..15..38..90..173..339..solved at 348
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..1..2..7..solved at 13
      #|0..0..0..1..2..3..4..5..6..13..20..27..solved at 44
      #|0..0..1..2..7..solved at 13
      #|0..0..0..1..2..3..4..5..6..13..20..27..solved at 47
      #|Warning: inventing type variables
      #|0..0..1..2..5..9..15..solved at 26
      #|0..0..0..2..4..8..solved at 15
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..1..2..5..9..15..27..40..60..103..155..236..384..583..909..1515..solved at 1564
      #|0..0..0..0..3..7..13..solved at 21
      #|0..0..0..0..3..7..13..solved at 21
      #|0..0..0..2..4..solved at 9
      #|0..0..0..2..4..solved at 9
      #|Warning: inventing type variables
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..2..solved at 7
      #|0..0..0..2..solved at 7
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..4..10..18..solved at 37
      #|0..0..1..2..4..10..18..solved at 37
      #|0..0..1..2..5..solved at 11
      #|0..0..1..2..3..7..13..21..33..47..64..91..118..solved at 148
      #|0..0..0..0..3..7..13..20..29..43..solved at 59
      #|0..0..1..2..4..12..25..51..solved at 89
      #|0..0..1..solved at 4
      #|0..0..1..2..5..12..22..33..53..solved at 68
      #|0..0..1..2..3..7..19..solved at 28
      #|0..0..1..2..3..7..13..21..33..47..64..91..118..solved at 148
      #|0..0..0..0..3..7..13..20..29..43..solved at 59
      #|0..0..1..2..4..12..25..51..solved at 89
      #|0..0..1..solved at 4
      #|0..0..1..2..5..12..22..33..53..solved at 68
      #|0..0..1..2..3..7..19..solved at 28
      #|0..0..1..2..3..7..12..17..24..31..38..solved at 49
      #|0..0..1..2..3..7..12..17..24..31..38..solved at 49
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..2..7..13..27..46..75..112..173..240..347..solved at 469
      #|0..0..1..2..7..13..26..47..79..121..194..274..394..solved at 528
      #|0..0..1..2..5..13..24..solved at 38
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..1..3..7..solved at 14
      #|0..0..1..4..solved at 8
      #|0..0..1..2..5..9..15..27..solved at 41
      #|Warning: inventing type variables
      #|0..0..1..2..5..9..15..solved at 26
      #|0..0..0..1..3..7..solved at 14
      #|0..0..1..3..7..13..solved at 19
      #|0..0..1..2..5..solved at 10
      #|1 basis elements and 0 critical pairs
      #|0..0..1..3..5..12..21..solved at 29
      #|0..0..1..3..5..12..21..solved at 29
      #|0..0..0..2..5..11..22..47..solved at 55
      #|0..0..0..2..5..11..22..47..solved at 55
      #|Warning: inventing type variables
      #|0..0..0..0..solved at 4
      #|0..0..0..0..0..0..solved at 6
      #|0..0..0..0..0..0..solved at 6
      #|0..0..0..0..0..0..solved at 6
      #|Warning: inventing type variables
      #|0..0..0..2..solved at 6
      #|0..0..0..2..4..8..solved at 15
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..0..solved at 4
      #|0..0..0..0..0..0..solved at 6
      #|Warning: inventing type variables
      #|0..0..0..2..solved at 6
      #|0..0..0..2..4..8..solved at 15
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 6
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..0..0..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 10
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 10
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..2..4..9..19..33..solved at 42
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 10
      #|0..0..2..4..8..16..31..67..solved at 98
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 11
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 11
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 8
      #|0..0..1..2..5..12..solved at 23
      #|Warning: inventing type variables
      #|0..0..1..2..6..11..18..solved at 26
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..1..3..7..12..19..35..solved at 65
      #|Warning: inventing type variables
      #|0..0..1..2..5..9..15..28..44..70..124..201..311..solved at 438
      #|Warning: inventing type variables
      #|0..0..1..2..3..7..16..solved at 27
      #|0..0..1..2..solved at 6
      #|0..0..0..2..solved at 6
      #|0..0..0..3..6..solved at 11
      #|0..0..0..4..8..12..32..65..144..267..412..663..1031..1539..2281..solved at 2372
      #|0..0..0..3..6..9..18..solved at 30
      #|0..0..2..4..solved at 8
      #|0..0..1..2..5..solved at 13
      #|Warning: inventing type variables
      #|0..0..1..2..3..7..13..21..39..60..88..123..162..205..280..359..454..618..809..1117..1611..2343..3213..solved at 3472
      #|0..0..1..2..3..7..13..27..51..78..116..161..210..279..380..485..644..863..1133..1576..2231..3142..4273..5635..solved at 7004
      #|Warning: inventing type variables
      #|0..0..0..2..solved at 6
      #|0..0..0..2..4..8..solved at 15
      #|Warning: inventing type variables
      #|0..0..1..4..9..solved at 14
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..3..6..10..18..solved at 29
      #|0..0..1..2..3..6..10..18..solved at 27
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..2..5..10..17..26..36..46..61..80..103..145..190..250..328..412..511..solved at 559
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|Warning: inventing type variables
      #|0..0..0..0..3..7..14..23..35..48..74..100..140..solved at 214
      #|0..0..0..0..3..7..14..23..35..48..74..100..140..solved at 185
      #|0..0..1..solved at 5
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..0..3..7..14..23..35..48..74..100..140..solved at 214
      #|0..0..0..0..3..7..14..23..35..48..74..100..140..solved at 185
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..1..2..5..10..17..26..36..46..61..80..103..145..189..248..340..440..575..783..1000..1294..1732..2208..2895..3776..4782..6103..7810..9789..12468..15643..19571..24408..30549..37934..solved at 44791
      #|0..0..1..2..5..9..15..26..37..52..73..94..121..solved at 165
      #|0..0..1..2..5..9..15..26..37..52..73..94..121..solved at 166
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..2..4..8..13..solved at 26
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..2..4..8..13..solved at 25
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..3..6..16..28..49..73..solved at 132
      #|0..0..1..2..5..9..17..26..37..49..67..85..solved at 118
      #|0..0..0..2..4..8..13..20..solved at 32
      #|0..0..1..3..5..solved at 10
      #|0..0..solved at 2
      #|0..0..1..2..6..solved at 11
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..9..solved at 20
      #|0..0..solved at 2
      #|0..0..1..2..5..10..solved at 22
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..5..9..17..26..37..49..67..85..solved at 115
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 13
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..10..solved at 17
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..13..24..solved at 38
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..1..2..5..12..solved at 23
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..5..10..18..solved at 26
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
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
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 2
      #|0..0..1..2..5..12..22..solved at 35
      #|0..0..solved at 2
      #|0..0..1..2..5..13..24..solved at 41
      #|Warning: inventing type variables
      #|0..0..1..2..5..11..22..solved at 32
      #|0..0..solved at 2
      #|0..0..1..2..4..10..20..36..62..103..159..solved at 186
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..10..solved at 17
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..2..5..11..20..33..solved at 46
      #|0..0..1..solved at 6
      #|0..0..1..2..5..11..20..33..solved at 47
      #|0..0..1..solved at 5
      #|0..0..1..2..5..11..20..33..solved at 46
      #|0..0..solved at 2
      #|0..0..1..2..7..solved at 12
      #|0..0..1..2..3..solved at 8
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 2
      #|0..0..1..2..5..12..22..solved at 35
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..1..solved at 5
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..solved at 7
      #|0..0..1..2..solved at 6
      #|0..0..0..0..0..2..4..6..9..12..15..24..33..42..61..80..99..129..159..189..256..323..390..504..618..732..954..1202..1450..1791..solved at 2078
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..0..2..4..6..9..12..15..24..33..42..64..86..108..143..178..213..288..363..438..571..704..837..1092..1377..1662..2059..solved at 2472
      #|Warning: inventing type variables
      #|0..0..0..2..4..8..solved at 15
      #|0..0..0..2..solved at 7
      #|0..0..0..3..7..solved at 18
      #|0..0..0..0..2..4..6..16..26..36..61..86..111..190..269..348..534..762..990..1403..2792..solved at 4142
      #|0..0..1..2..solved at 6
      #|0..0..2..4..8..16..27..39..53..67..90..119..157..solved at 197
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..0..1..2..3..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..0..1..2..3..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..0..1..2..3..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..0..1..2..3..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..2..4..10..solved at 21
      #|0..0..2..4..10..solved at 21
      #|0..0..0..1..solved at 5
      #|0..0..1..3..11..20..48..98..158..solved at 189
      #|0..0..1..4..13..23..58..131..233..497..1054..solved at 1102
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..15..solved at 26
      #|0..0..0..solved at 3
      #|0..0..1..2..4..14..solved at 22
      #|0..0..1..2..5..10..17..25..38..59..solved at 83
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..1..2..5..solved at 14
      #|0..0..solved at 2
      #|0..0..1..2..9..19..50..99..199..312..583..910..solved at 920
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
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
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..2..5..11..27..52..78..107..137..176..270..374..586..867..1300..1842..2683..3612..4653..5748..7194..8803..11314..solved at 15830
      #|0..0..0..solved at 3
      #|0..0..0..1..3..7..solved at 12
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..1..3..7..solved at 12
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..0..1..3..solved at 8
      #|0..0..0..1..4..11..27..solved at 47
      #|0..0..0..1..5..15..38..70..117..solved at 209
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..0..1..2..3..4..5..6..solved at 17
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..9..solved at 26
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|1 basis elements and 0 critical pairs
      #|0..0..1..2..5..10..18..solved at 27
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..4..solved at 9
      #|0..0..0..0..1..2..3..9..16..25..37..49..61..91..121..158..solved at 184
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..11..22..43..solved at 55
      #|0..0..1..2..5..11..22..43..solved at 55
      #|0..0..0..1..2..3..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..7..solved at 12
      #|0..0..0..1..3..solved at 8
      #|0..0..0..1..solved at 5
      #|0..0..0..1..solved at 5
      #|0..0..0..0..1..4..9..solved at 17
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..0..1..2..3..5..7..9..16..23..solved at 36
      #|Warning: inventing type variables
      #|0..0..1..2..5..12..24..solved at 38
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..2..3..7..12..17..27..39..solved at 53
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..9..17..27..43..61..81..solved at 90
      #|0..0..1..2..3..9..17..27..43..61..81..solved at 90
      #|0..0..1..2..solved at 6
      #|0..0..1..2..4..solved at 9
      #|0..0..1..2..solved at 6
      #|0..0..0..1..2..3..5..7..9..21..34..49..69..solved at 83
      #|0..0..1..solved at 4
      #|0..0..0..0..0..1..3..5..7..9..11..15..19..23..28..33..38..45..52..59..67..75..83..104..125..146..167..188..209..243..277..311..solved at 451
      #|0..0..1..2..3..7..16..30..45..65..86..118..solved at 152
      #|0..0..0..0..1..2..3..5..7..9..13..17..21..29..37..45..60..75..90..109..128..147..174..201..228..256..284..312..347..382..417..468..519..570..630..690..750..822..894..966..solved at 2180
      #|0..0..1..2..3..7..16..solved at 31
      #|0..0..1..2..3..9..18..solved at 32
      #|0..0..1..2..4..solved at 9
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..2..3..7..13..21..35..54..81..115..162..226..solved at 283
      #|0..0..0..1..solved at 5
      #|0..0..1..2..3..7..13..21..35..54..81..115..162..226..solved at 283
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..5..9..16..26..36..54..solved at 78
      #|0..0..1..2..6..11..solved at 19
      #|0..0..1..2..7..13..22..33..solved at 49
      #|0..0..1..3..solved at 7
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..7..13..19..25..32..39..53..69..85..145..solved at 188
      #|0..0..1..2..5..9..15..22..29..36..50..64..85..145..210..346..solved at 470
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
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 7
      #|0..0..2..5..10..solved at 15
      #|0..0..solved at 2
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
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 7
      #|0..0..2..6..10..solved at 15
      #|0..0..solved at 2
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
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..8..17..34..60..103..160..237..371..538..741..1171..1710..2643..solved at 4149
      #|0..0..2..4..8..17..34..60..104..162..239..solved at 282
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
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
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 7
      #|0..0..2..5..12..solved at 17
      #|0..0..solved at 2
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
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 7
      #|0..0..2..6..14..solved at 19
      #|0..0..solved at 2
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
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..10..20..40..73..118..179..303..444..622..1018..1534..2370..solved at 4036
      #|0..0..2..4..10..20..40..74..120..182..solved at 221
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
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
      #|0..0..0..solved at 3
      #|0..0..0..1..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..6..11..18..solved at 24
      #|0..0..1..2..5..11..solved at 17
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..3..solved at 9
      #|0..0..1..2..5..9..15..22..29..36..47..58..73..solved at 87
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|1 basis elements and 0 critical pairs
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|3 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..3..7..13..solved at 19
      #|0..0..1..solved at 4
      #|1 basis elements and 0 critical pairs
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..6..11..19..solved at 27
      #|1 basis elements and 0 critical pairs
      #|0..0..1..2..5..solved at 11
      #|0..0..solved at 2
      #|1 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..6..solved at 10
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
      #|3 basis elements and 1 critical pairs
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
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
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|6 basis elements and 5 critical pairs
      #|7 basis elements and 7 critical pairs
      #|8 basis elements and 10 critical pairs
      #|9 basis elements and 14 critical pairs
      #|9 basis elements and 13 critical pairs
      #|9 basis elements and 12 critical pairs
      #|10 basis elements and 15 critical pairs
      #|10 basis elements and 14 critical pairs
      #|10 basis elements and 13 critical pairs
      #|10 basis elements and 12 critical pairs
      #|10 basis elements and 11 critical pairs
      #|10 basis elements and 10 critical pairs
      #|10 basis elements and 9 critical pairs
      #|10 basis elements and 8 critical pairs
      #|11 basis elements and 10 critical pairs
      #|12 basis elements and 13 critical pairs
      #|12 basis elements and 12 critical pairs
      #|12 basis elements and 11 critical pairs
      #|12 basis elements and 10 critical pairs
      #|13 basis elements and 16 critical pairs
      #|14 basis elements and 23 critical pairs
      #|15 basis elements and 30 critical pairs
      #|15 basis elements and 29 critical pairs
      #|15 basis elements and 28 critical pairs
      #|15 basis elements and 27 critical pairs
      #|15 basis elements and 26 critical pairs
      #|15 basis elements and 25 critical pairs
      #|15 basis elements and 24 critical pairs
      #|15 basis elements and 23 critical pairs
      #|16 basis elements and 33 critical pairs
      #|16 basis elements and 32 critical pairs
      #|16 basis elements and 31 critical pairs
      #|16 basis elements and 30 critical pairs
      #|16 basis elements and 29 critical pairs
      #|16 basis elements and 28 critical pairs
      #|16 basis elements and 27 critical pairs
      #|16 basis elements and 26 critical pairs
      #|16 basis elements and 25 critical pairs
      #|16 basis elements and 24 critical pairs
      #|16 basis elements and 23 critical pairs
      #|16 basis elements and 22 critical pairs
      #|17 basis elements and 30 critical pairs
      #|17 basis elements and 29 critical pairs
      #|17 basis elements and 28 critical pairs
      #|17 basis elements and 27 critical pairs
      #|17 basis elements and 26 critical pairs
      #|17 basis elements and 25 critical pairs
      #|17 basis elements and 24 critical pairs
      #|17 basis elements and 23 critical pairs
      #|17 basis elements and 22 critical pairs
      #|18 basis elements and 30 critical pairs
      #|18 basis elements and 29 critical pairs
      #|18 basis elements and 28 critical pairs
      #|18 basis elements and 27 critical pairs
      #|18 basis elements and 26 critical pairs
      #|18 basis elements and 25 critical pairs
      #|18 basis elements and 24 critical pairs
      #|18 basis elements and 23 critical pairs
      #|18 basis elements and 22 critical pairs
      #|18 basis elements and 21 critical pairs
      #|18 basis elements and 20 critical pairs
      #|18 basis elements and 19 critical pairs
      #|18 basis elements and 18 critical pairs
      #|18 basis elements and 17 critical pairs
      #|18 basis elements and 16 critical pairs
      #|18 basis elements and 15 critical pairs
      #|18 basis elements and 14 critical pairs
      #|18 basis elements and 13 critical pairs
      #|18 basis elements and 12 critical pairs
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
      #|6 basis elements and 6 critical pairs
      #|7 basis elements and 8 critical pairs
      #|8 basis elements and 11 critical pairs
      #|8 basis elements and 10 critical pairs
      #|8 basis elements and 9 critical pairs
      #|9 basis elements and 11 critical pairs
      #|9 basis elements and 10 critical pairs
      #|9 basis elements and 9 critical pairs
      #|9 basis elements and 8 critical pairs
      #|9 basis elements and 7 critical pairs
      #|9 basis elements and 6 critical pairs
      #|10 basis elements and 9 critical pairs
      #|11 basis elements and 13 critical pairs
      #|12 basis elements and 17 critical pairs
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
      #|Translating certificate to HOL inferences
      #|6 basis elements and 5 critical pairs
      #|7 basis elements and 7 critical pairs
      #|8 basis elements and 10 critical pairs
      #|9 basis elements and 14 critical pairs
      #|9 basis elements and 13 critical pairs
      #|9 basis elements and 12 critical pairs
      #|10 basis elements and 14 critical pairs
      #|10 basis elements and 13 critical pairs
      #|10 basis elements and 12 critical pairs
      #|10 basis elements and 11 critical pairs
      #|10 basis elements and 10 critical pairs
      #|10 basis elements and 9 critical pairs
      #|11 basis elements and 12 critical pairs
      #|12 basis elements and 14 critical pairs
      #|13 basis elements and 20 critical pairs
      #|13 basis elements and 19 critical pairs
      #|13 basis elements and 18 critical pairs
      #|13 basis elements and 17 critical pairs
      #|14 basis elements and 23 critical pairs
      #|14 basis elements and 22 critical pairs
      #|15 basis elements and 29 critical pairs
      #|15 basis elements and 28 critical pairs
      #|15 basis elements and 27 critical pairs
      #|15 basis elements and 26 critical pairs
      #|15 basis elements and 25 critical pairs
      #|16 basis elements and 31 critical pairs
      #|16 basis elements and 30 critical pairs
      #|16 basis elements and 29 critical pairs
      #|16 basis elements and 28 critical pairs
      #|16 basis elements and 27 critical pairs
      #|16 basis elements and 26 critical pairs
      #|16 basis elements and 25 critical pairs
      #|16 basis elements and 24 critical pairs
      #|16 basis elements and 23 critical pairs
      #|16 basis elements and 22 critical pairs
      #|16 basis elements and 21 critical pairs
      #|16 basis elements and 20 critical pairs
      #|16 basis elements and 19 critical pairs
      #|16 basis elements and 18 critical pairs
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
      #|16 basis elements and 7 critical pairs
      #|16 basis elements and 6 critical pairs
      #|16 basis elements and 5 critical pairs
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
      #|6 basis elements and 7 critical pairs
      #|7 basis elements and 9 critical pairs
      #|8 basis elements and 12 critical pairs
      #|9 basis elements and 16 critical pairs
      #|9 basis elements and 15 critical pairs
      #|9 basis elements and 14 critical pairs
      #|10 basis elements and 16 critical pairs
      #|10 basis elements and 15 critical pairs
      #|10 basis elements and 14 critical pairs
      #|10 basis elements and 13 critical pairs
      #|10 basis elements and 12 critical pairs
      #|10 basis elements and 11 critical pairs
      #|10 basis elements and 10 critical pairs
      #|11 basis elements and 13 critical pairs
      #|11 basis elements and 12 critical pairs
      #|12 basis elements and 16 critical pairs
      #|12 basis elements and 15 critical pairs
      #|12 basis elements and 14 critical pairs
      #|12 basis elements and 13 critical pairs
      #|12 basis elements and 12 critical pairs
      #|12 basis elements and 11 critical pairs
      #|12 basis elements and 10 critical pairs
      #|12 basis elements and 9 critical pairs
      #|13 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..2..3..7..14..30..56..solved at 95
      #|4 basis elements and 3 critical pairs
      #|5 basis elements and 4 critical pairs
      #|6 basis elements and 5 critical pairs
      #|6 basis elements and 4 critical pairs
      #|7 basis elements and 7 critical pairs
      #|7 basis elements and 6 critical pairs
      #|7 basis elements and 5 critical pairs
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|8 basis elements and 5 critical pairs
      #|8 basis elements and 4 critical pairs
      #|8 basis elements and 3 critical pairs
      #|8 basis elements and 2 critical pairs
      #|8 basis elements and 1 critical pairs
      #|8 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 4 critical pairs
      #|6 basis elements and 6 critical pairs
      #|6 basis elements and 5 critical pairs
      #|7 basis elements and 7 critical pairs
      #|8 basis elements and 11 critical pairs
      #|8 basis elements and 10 critical pairs
      #|8 basis elements and 9 critical pairs
      #|8 basis elements and 8 critical pairs
      #|9 basis elements and 10 critical pairs
      #|9 basis elements and 9 critical pairs
      #|9 basis elements and 8 critical pairs
      #|9 basis elements and 7 critical pairs
      #|9 basis elements and 6 critical pairs
      #|9 basis elements and 5 critical pairs
      #|9 basis elements and 4 critical pairs
      #|9 basis elements and 3 critical pairs
      #|9 basis elements and 2 critical pairs
      #|9 basis elements and 1 critical pairs
      #|9 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..2..3..10..19..solved at 26
      #|0..0..1..solved at 4
      #|0..0..1..2..3..7..12..17..26..36..solved at 48
      #|0..0..1..2..3..7..12..17..solved at 26
      #|0..0..1..3..6..solved at 11
      #|0..0..1..2..3..10..19..30..solved at 41
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..5..15..solved at 26
      #|0..0..1..3..5..12..solved at 22
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..15..solved at 26
      #|0..0..1..3..5..12..solved at 22
      #|0..0..solved at 2
      #|1 basis elements and 0 critical pairs
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..3..12..36..92..301..898..solved at 1586
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|1 basis elements and 0 critical pairs
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 5 critical pairs
      #|6 basis elements and 8 critical pairs
      #|7 basis elements and 10 critical pairs
      #|8 basis elements and 14 critical pairs
      #|8 basis elements and 13 critical pairs
      #|8 basis elements and 12 critical pairs
      #|9 basis elements and 17 critical pairs
      #|9 basis elements and 16 critical pairs
      #|9 basis elements and 15 critical pairs
      #|10 basis elements and 20 critical pairs
      #|10 basis elements and 19 critical pairs
      #|10 basis elements and 18 critical pairs
      #|10 basis elements and 17 critical pairs
      #|10 basis elements and 16 critical pairs
      #|11 basis elements and 19 critical pairs
      #|11 basis elements and 18 critical pairs
      #|11 basis elements and 17 critical pairs
      #|11 basis elements and 16 critical pairs
      #|11 basis elements and 15 critical pairs
      #|11 basis elements and 14 critical pairs
      #|11 basis elements and 13 critical pairs
      #|11 basis elements and 12 critical pairs
      #|12 basis elements and 18 critical pairs
      #|12 basis elements and 17 critical pairs
      #|12 basis elements and 16 critical pairs
      #|12 basis elements and 15 critical pairs
      #|12 basis elements and 14 critical pairs
      #|12 basis elements and 13 critical pairs
      #|12 basis elements and 12 critical pairs
      #|12 basis elements and 11 critical pairs
      #|12 basis elements and 10 critical pairs
      #|13 basis elements and 18 critical pairs
      #|13 basis elements and 17 critical pairs
      #|13 basis elements and 16 critical pairs
      #|13 basis elements and 15 critical pairs
      #|13 basis elements and 14 critical pairs
      #|13 basis elements and 13 critical pairs
      #|13 basis elements and 12 critical pairs
      #|13 basis elements and 11 critical pairs
      #|14 basis elements and 17 critical pairs
      #|14 basis elements and 16 critical pairs
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
      #|15 basis elements and 7 critical pairs
      #|15 basis elements and 6 critical pairs
      #|15 basis elements and 5 critical pairs
      #|15 basis elements and 4 critical pairs
      #|15 basis elements and 3 critical pairs
      #|15 basis elements and 2 critical pairs
      #|15 basis elements and 1 critical pairs
      #|15 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..solved at 2
      #|0..0..2..4..10..solved at 15
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 2
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
      #|0..0..0..3..6..13..22..35..54..75..100..166..259..404..solved at 509
      #|0..0..1..5..11..25..53..92..153..231..343..511..840..1284..solved at 1811
      #|0..0..3..6..21..49..solved at 143
      #|0..0..3..6..21..49..solved at 102
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 13
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..3..7..12..17..31..47..67..100..133..170..solved at 209
      #|0..0..1..2..9..24..66..167..449..1340..4002..11612..solved at 26372
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 1 critical pairs
      #|5 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 6 critical pairs
      #|6 basis elements and 8 critical pairs
      #|7 basis elements and 10 critical pairs
      #|8 basis elements and 14 critical pairs
      #|9 basis elements and 18 critical pairs
      #|10 basis elements and 24 critical pairs
      #|10 basis elements and 23 critical pairs
      #|11 basis elements and 29 critical pairs
      #|12 basis elements and 37 critical pairs
      #|13 basis elements and 42 critical pairs
      #|13 basis elements and 41 critical pairs
      #|13 basis elements and 40 critical pairs
      #|13 basis elements and 39 critical pairs
      #|13 basis elements and 38 critical pairs
      #|13 basis elements and 37 critical pairs
      #|13 basis elements and 36 critical pairs
      #|14 basis elements and 42 critical pairs
      #|14 basis elements and 41 critical pairs
      #|14 basis elements and 40 critical pairs
      #|14 basis elements and 39 critical pairs
      #|14 basis elements and 38 critical pairs
      #|14 basis elements and 37 critical pairs
      #|14 basis elements and 36 critical pairs
      #|14 basis elements and 35 critical pairs
      #|14 basis elements and 34 critical pairs
      #|15 basis elements and 41 critical pairs
      #|15 basis elements and 40 critical pairs
      #|15 basis elements and 39 critical pairs
      #|15 basis elements and 38 critical pairs
      #|16 basis elements and 44 critical pairs
      #|16 basis elements and 43 critical pairs
      #|16 basis elements and 42 critical pairs
      #|16 basis elements and 41 critical pairs
      #|16 basis elements and 40 critical pairs
      #|16 basis elements and 39 critical pairs
      #|16 basis elements and 38 critical pairs
      #|16 basis elements and 37 critical pairs
      #|16 basis elements and 36 critical pairs
      #|16 basis elements and 35 critical pairs
      #|16 basis elements and 34 critical pairs
      #|16 basis elements and 33 critical pairs
      #|16 basis elements and 32 critical pairs
      #|16 basis elements and 31 critical pairs
      #|16 basis elements and 30 critical pairs
      #|16 basis elements and 29 critical pairs
      #|16 basis elements and 28 critical pairs
      #|16 basis elements and 27 critical pairs
      #|16 basis elements and 26 critical pairs
      #|16 basis elements and 25 critical pairs
      #|16 basis elements and 24 critical pairs
      #|16 basis elements and 23 critical pairs
      #|16 basis elements and 22 critical pairs
      #|16 basis elements and 21 critical pairs
      #|16 basis elements and 20 critical pairs
      #|16 basis elements and 19 critical pairs
      #|16 basis elements and 18 critical pairs
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
      #|16 basis elements and 7 critical pairs
      #|16 basis elements and 6 critical pairs
      #|16 basis elements and 5 critical pairs
      #|16 basis elements and 4 critical pairs
      #|16 basis elements and 3 critical pairs
      #|16 basis elements and 2 critical pairs
      #|16 basis elements and 1 critical pairs
      #|16 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 3 critical pairs
      #|5 basis elements and 3 critical pairs
      #|5 basis elements and 2 critical pairs
      #|6 basis elements and 2 critical pairs
      #|6 basis elements and 1 critical pairs
      #|6 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 6 critical pairs
      #|5 basis elements and 7 critical pairs
      #|6 basis elements and 9 critical pairs
      #|7 basis elements and 11 critical pairs
      #|8 basis elements and 15 critical pairs
      #|9 basis elements and 19 critical pairs
      #|10 basis elements and 24 critical pairs
      #|10 basis elements and 23 critical pairs
      #|11 basis elements and 27 critical pairs
      #|12 basis elements and 34 critical pairs
      #|13 basis elements and 42 critical pairs
      #|14 basis elements and 45 critical pairs
      #|14 basis elements and 44 critical pairs
      #|14 basis elements and 43 critical pairs
      #|14 basis elements and 42 critical pairs
      #|14 basis elements and 41 critical pairs
      #|14 basis elements and 40 critical pairs
      #|14 basis elements and 39 critical pairs
      #|15 basis elements and 46 critical pairs
      #|15 basis elements and 45 critical pairs
      #|15 basis elements and 44 critical pairs
      #|15 basis elements and 43 critical pairs
      #|15 basis elements and 42 critical pairs
      #|15 basis elements and 41 critical pairs
      #|15 basis elements and 40 critical pairs
      #|15 basis elements and 39 critical pairs
      #|15 basis elements and 38 critical pairs
      #|15 basis elements and 37 critical pairs
      #|16 basis elements and 41 critical pairs
      #|16 basis elements and 40 critical pairs
      #|16 basis elements and 39 critical pairs
      #|16 basis elements and 38 critical pairs
      #|16 basis elements and 37 critical pairs
      #|16 basis elements and 36 critical pairs
      #|16 basis elements and 35 critical pairs
      #|16 basis elements and 34 critical pairs
      #|16 basis elements and 33 critical pairs
      #|16 basis elements and 32 critical pairs
      #|16 basis elements and 31 critical pairs
      #|16 basis elements and 30 critical pairs
      #|16 basis elements and 29 critical pairs
      #|16 basis elements and 28 critical pairs
      #|16 basis elements and 27 critical pairs
      #|16 basis elements and 26 critical pairs
      #|16 basis elements and 25 critical pairs
      #|16 basis elements and 24 critical pairs
      #|16 basis elements and 23 critical pairs
      #|16 basis elements and 22 critical pairs
      #|16 basis elements and 21 critical pairs
      #|16 basis elements and 20 critical pairs
      #|16 basis elements and 19 critical pairs
      #|16 basis elements and 18 critical pairs
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
      #|16 basis elements and 7 critical pairs
      #|16 basis elements and 6 critical pairs
      #|16 basis elements and 5 critical pairs
      #|16 basis elements and 4 critical pairs
      #|16 basis elements and 3 critical pairs
      #|16 basis elements and 2 critical pairs
      #|16 basis elements and 1 critical pairs
      #|16 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..5..11..solved at 30
      #|0..0..1..2..5..11..solved at 30
      #|0..0..1..2..5..10..20..37..60..104..164..255..388..solved at 410
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..5..12..21..34..52..72..109..159..223..316..435..578..783..1033..1323..1813..2366..3160..solved at 4431
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..1..2..5..10..17..27..39..51..79..116..166..239..319..414..559..722..922..1222..1540..1942..solved at 2269
      #|9 basis elements and 8 critical pairs
      #|10 basis elements and 12 critical pairs
      #|10 basis elements and 11 critical pairs
      #|11 basis elements and 16 critical pairs
      #|11 basis elements and 15 critical pairs
      #|12 basis elements and 20 critical pairs
      #|12 basis elements and 19 critical pairs
      #|12 basis elements and 18 critical pairs
      #|13 basis elements and 21 critical pairs
      #|13 basis elements and 20 critical pairs
      #|13 basis elements and 19 critical pairs
      #|14 basis elements and 22 critical pairs
      #|14 basis elements and 21 critical pairs
      #|15 basis elements and 26 critical pairs
      #|15 basis elements and 25 critical pairs
      #|16 basis elements and 31 critical pairs
      #|16 basis elements and 30 critical pairs
      #|17 basis elements and 38 critical pairs
      #|17 basis elements and 37 critical pairs
      #|17 basis elements and 36 critical pairs
      #|18 basis elements and 42 critical pairs
      #|18 basis elements and 41 critical pairs
      #|19 basis elements and 49 critical pairs
      #|19 basis elements and 48 critical pairs
      #|20 basis elements and 55 critical pairs
      #|20 basis elements and 54 critical pairs
      #|20 basis elements and 53 critical pairs
      #|20 basis elements and 52 critical pairs
      #|20 basis elements and 51 critical pairs
      #|20 basis elements and 50 critical pairs
      #|20 basis elements and 49 critical pairs
      #|20 basis elements and 48 critical pairs
      #|20 basis elements and 47 critical pairs
      #|20 basis elements and 46 critical pairs
      #|20 basis elements and 45 critical pairs
      #|20 basis elements and 44 critical pairs
      #|20 basis elements and 43 critical pairs
      #|20 basis elements and 42 critical pairs
      #|20 basis elements and 41 critical pairs
      #|20 basis elements and 40 critical pairs
      #|21 basis elements and 45 critical pairs
      #|21 basis elements and 44 critical pairs
      #|21 basis elements and 43 critical pairs
      #|21 basis elements and 42 critical pairs
      #|21 basis elements and 41 critical pairs
      #|21 basis elements and 40 critical pairs
      #|21 basis elements and 39 critical pairs
      #|22 basis elements and 44 critical pairs
      #|23 basis elements and 49 critical pairs
      #|23 basis elements and 48 critical pairs
      #|23 basis elements and 47 critical pairs
      #|24 basis elements and 53 critical pairs
      #|24 basis elements and 52 critical pairs
      #|24 basis elements and 51 critical pairs
      #|24 basis elements and 50 critical pairs
      #|24 basis elements and 49 critical pairs
      #|24 basis elements and 48 critical pairs
      #|24 basis elements and 47 critical pairs
      #|24 basis elements and 46 critical pairs
      #|24 basis elements and 45 critical pairs
      #|25 basis elements and 52 critical pairs
      #|25 basis elements and 51 critical pairs
      #|25 basis elements and 50 critical pairs
      #|25 basis elements and 49 critical pairs
      #|25 basis elements and 48 critical pairs
      #|25 basis elements and 47 critical pairs
      #|26 basis elements and 55 critical pairs
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
      #|28 basis elements and 57 critical pairs
      #|28 basis elements and 56 critical pairs
      #|29 basis elements and 67 critical pairs
      #|29 basis elements and 66 critical pairs
      #|29 basis elements and 65 critical pairs
      #|29 basis elements and 64 critical pairs
      #|29 basis elements and 63 critical pairs
      #|29 basis elements and 62 critical pairs
      #|29 basis elements and 61 critical pairs
      #|29 basis elements and 60 critical pairs
      #|29 basis elements and 59 critical pairs
      #|29 basis elements and 58 critical pairs
      #|29 basis elements and 57 critical pairs
      #|29 basis elements and 56 critical pairs
      #|29 basis elements and 55 critical pairs
      #|29 basis elements and 54 critical pairs
      #|29 basis elements and 53 critical pairs
      #|29 basis elements and 52 critical pairs
      #|29 basis elements and 51 critical pairs
      #|29 basis elements and 50 critical pairs
      #|29 basis elements and 49 critical pairs
      #|29 basis elements and 48 critical pairs
      #|29 basis elements and 47 critical pairs
      #|29 basis elements and 46 critical pairs
      #|29 basis elements and 45 critical pairs
      #|29 basis elements and 44 critical pairs
      #|30 basis elements and 53 critical pairs
      #|30 basis elements and 52 critical pairs
      #|30 basis elements and 51 critical pairs
      #|30 basis elements and 50 critical pairs
      #|30 basis elements and 49 critical pairs
      #|30 basis elements and 48 critical pairs
      #|30 basis elements and 47 critical pairs
      #|30 basis elements and 46 critical pairs
      #|30 basis elements and 45 critical pairs
      #|30 basis elements and 44 critical pairs
      #|30 basis elements and 43 critical pairs
      #|30 basis elements and 42 critical pairs
      #|30 basis elements and 41 critical pairs
      #|31 basis elements and 46 critical pairs
      #|31 basis elements and 45 critical pairs
      #|31 basis elements and 44 critical pairs
      #|31 basis elements and 43 critical pairs
      #|31 basis elements and 42 critical pairs
      #|31 basis elements and 41 critical pairs
      #|31 basis elements and 40 critical pairs
      #|31 basis elements and 39 critical pairs
      #|31 basis elements and 38 critical pairs
      #|31 basis elements and 37 critical pairs
      #|31 basis elements and 36 critical pairs
      #|31 basis elements and 35 critical pairs
      #|31 basis elements and 34 critical pairs
      #|31 basis elements and 33 critical pairs
      #|31 basis elements and 32 critical pairs
      #|31 basis elements and 31 critical pairs
      #|31 basis elements and 30 critical pairs
      #|31 basis elements and 29 critical pairs
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
      #|32 basis elements and 24 critical pairs
      #|32 basis elements and 23 critical pairs
      #|32 basis elements and 22 critical pairs
      #|32 basis elements and 21 critical pairs
      #|32 basis elements and 20 critical pairs
      #|32 basis elements and 19 critical pairs
      #|32 basis elements and 18 critical pairs
      #|32 basis elements and 17 critical pairs
      #|33 basis elements and 30 critical pairs
      #|33 basis elements and 29 critical pairs
      #|33 basis elements and 28 critical pairs
      #|33 basis elements and 27 critical pairs
      #|33 basis elements and 26 critical pairs
      #|33 basis elements and 25 critical pairs
      #|33 basis elements and 24 critical pairs
      #|33 basis elements and 23 critical pairs
      #|33 basis elements and 22 critical pairs
      #|33 basis elements and 21 critical pairs
      #|33 basis elements and 20 critical pairs
      #|34 basis elements and 29 critical pairs
      #|34 basis elements and 28 critical pairs
      #|34 basis elements and 27 critical pairs
      #|34 basis elements and 26 critical pairs
      #|35 basis elements and 36 critical pairs
      #|35 basis elements and 35 critical pairs
      #|35 basis elements and 34 critical pairs
      #|35 basis elements and 33 critical pairs
      #|35 basis elements and 32 critical pairs
      #|35 basis elements and 31 critical pairs
      #|35 basis elements and 30 critical pairs
      #|35 basis elements and 29 critical pairs
      #|35 basis elements and 28 critical pairs
      #|35 basis elements and 27 critical pairs
      #|36 basis elements and 34 critical pairs
      #|36 basis elements and 33 critical pairs
      #|36 basis elements and 32 critical pairs
      #|36 basis elements and 31 critical pairs
      #|37 basis elements and 42 critical pairs
      #|37 basis elements and 41 critical pairs
      #|37 basis elements and 40 critical pairs
      #|37 basis elements and 39 critical pairs
      #|37 basis elements and 38 critical pairs
      #|37 basis elements and 37 critical pairs
      #|37 basis elements and 36 critical pairs
      #|37 basis elements and 35 critical pairs
      #|38 basis elements and 49 critical pairs
      #|38 basis elements and 48 critical pairs
      #|38 basis elements and 47 critical pairs
      #|38 basis elements and 46 critical pairs
      #|38 basis elements and 45 critical pairs
      #|38 basis elements and 44 critical pairs
      #|38 basis elements and 43 critical pairs
      #|38 basis elements and 42 critical pairs
      #|38 basis elements and 41 critical pairs
      #|38 basis elements and 40 critical pairs
      #|38 basis elements and 39 critical pairs
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
      #|39 basis elements and 27 critical pairs
      #|39 basis elements and 26 critical pairs
      #|39 basis elements and 25 critical pairs
      #|39 basis elements and 24 critical pairs
      #|39 basis elements and 23 critical pairs
      #|39 basis elements and 22 critical pairs
      #|39 basis elements and 21 critical pairs
      #|39 basis elements and 20 critical pairs
      #|39 basis elements and 19 critical pairs
      #|39 basis elements and 18 critical pairs
      #|39 basis elements and 17 critical pairs
      #|39 basis elements and 16 critical pairs
      #|39 basis elements and 15 critical pairs
      #|39 basis elements and 14 critical pairs
      #|39 basis elements and 13 critical pairs
      #|39 basis elements and 12 critical pairs
      #|39 basis elements and 11 critical pairs
      #|39 basis elements and 10 critical pairs
      #|39 basis elements and 9 critical pairs
      #|39 basis elements and 8 critical pairs
      #|39 basis elements and 7 critical pairs
      #|39 basis elements and 6 critical pairs
      #|39 basis elements and 5 critical pairs
      #|39 basis elements and 4 critical pairs
      #|39 basis elements and 3 critical pairs
      #|39 basis elements and 2 critical pairs
      #|39 basis elements and 1 critical pairs
      #|39 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|9 basis elements and 6 critical pairs
      #|10 basis elements and 8 critical pairs
      #|10 basis elements and 7 critical pairs
      #|11 basis elements and 10 critical pairs
      #|11 basis elements and 9 critical pairs
      #|11 basis elements and 8 critical pairs
      #|11 basis elements and 7 critical pairs
      #|12 basis elements and 9 critical pairs
      #|13 basis elements and 14 critical pairs
      #|13 basis elements and 13 critical pairs
      #|13 basis elements and 12 critical pairs
      #|13 basis elements and 11 critical pairs
      #|13 basis elements and 10 critical pairs
      #|14 basis elements and 14 critical pairs
      #|14 basis elements and 13 critical pairs
      #|14 basis elements and 12 critical pairs
      #|15 basis elements and 18 critical pairs
      #|15 basis elements and 17 critical pairs
      #|15 basis elements and 16 critical pairs
      #|15 basis elements and 15 critical pairs
      #|15 basis elements and 14 critical pairs
      #|15 basis elements and 13 critical pairs
      #|15 basis elements and 12 critical pairs
      #|15 basis elements and 11 critical pairs
      #|16 basis elements and 19 critical pairs
      #|16 basis elements and 18 critical pairs
      #|16 basis elements and 17 critical pairs
      #|16 basis elements and 16 critical pairs
      #|17 basis elements and 23 critical pairs
      #|17 basis elements and 22 critical pairs
      #|18 basis elements and 29 critical pairs
      #|18 basis elements and 28 critical pairs
      #|18 basis elements and 27 critical pairs
      #|18 basis elements and 26 critical pairs
      #|18 basis elements and 25 critical pairs
      #|18 basis elements and 24 critical pairs
      #|18 basis elements and 23 critical pairs
      #|18 basis elements and 22 critical pairs
      #|18 basis elements and 21 critical pairs
      #|18 basis elements and 20 critical pairs
      #|18 basis elements and 19 critical pairs
      #|19 basis elements and 26 critical pairs
      #|19 basis elements and 25 critical pairs
      #|19 basis elements and 24 critical pairs
      #|19 basis elements and 23 critical pairs
      #|19 basis elements and 22 critical pairs
      #|19 basis elements and 21 critical pairs
      #|19 basis elements and 20 critical pairs
      #|19 basis elements and 19 critical pairs
      #|19 basis elements and 18 critical pairs
      #|20 basis elements and 22 critical pairs
      #|20 basis elements and 21 critical pairs
      #|20 basis elements and 20 critical pairs
      #|20 basis elements and 19 critical pairs
      #|20 basis elements and 18 critical pairs
      #|20 basis elements and 17 critical pairs
      #|20 basis elements and 16 critical pairs
      #|20 basis elements and 15 critical pairs
      #|20 basis elements and 14 critical pairs
      #|20 basis elements and 13 critical pairs
      #|20 basis elements and 12 critical pairs
      #|20 basis elements and 11 critical pairs
      #|20 basis elements and 10 critical pairs
      #|20 basis elements and 9 critical pairs
      #|20 basis elements and 8 critical pairs
      #|21 basis elements and 12 critical pairs
      #|21 basis elements and 11 critical pairs
      #|21 basis elements and 10 critical pairs
      #|21 basis elements and 9 critical pairs
      #|21 basis elements and 8 critical pairs
      #|21 basis elements and 7 critical pairs
      #|21 basis elements and 6 critical pairs
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
      #|23 basis elements and 14 critical pairs
      #|23 basis elements and 13 critical pairs
      #|23 basis elements and 12 critical pairs
      #|23 basis elements and 11 critical pairs
      #|24 basis elements and 19 critical pairs
      #|24 basis elements and 18 critical pairs
      #|24 basis elements and 17 critical pairs
      #|24 basis elements and 16 critical pairs
      #|24 basis elements and 15 critical pairs
      #|24 basis elements and 14 critical pairs
      #|24 basis elements and 13 critical pairs
      #|24 basis elements and 12 critical pairs
      #|24 basis elements and 11 critical pairs
      #|25 basis elements and 17 critical pairs
      #|25 basis elements and 16 critical pairs
      #|25 basis elements and 15 critical pairs
      #|25 basis elements and 14 critical pairs
      #|26 basis elements and 22 critical pairs
      #|26 basis elements and 21 critical pairs
      #|26 basis elements and 20 critical pairs
      #|26 basis elements and 19 critical pairs
      #|26 basis elements and 18 critical pairs
      #|26 basis elements and 17 critical pairs
      #|26 basis elements and 16 critical pairs
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
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|8 basis elements and 4 critical pairs
      #|8 basis elements and 3 critical pairs
      #|9 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..solved at 2
      #|0..0..4..8..solved at 15
      #|0..0..2..4..13..26..46..89..140..solved at 153
      #|0..0..1..2..solved at 6
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..solved at 2
      #|0..0..2..4..10..solved at 19
      #|0..0..2..4..14..26..44..82..142..237..418..693..1119..solved at 1176
      #|1 basis elements and 0 critical pairs
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..2..4..10..24..54..solved at 73
      #|1 basis elements and 0 critical pairs
      #|5 basis elements and 2 critical pairs
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|7 basis elements and 0 critical pairs
      #|4 basis elements and 2 critical pairs
      #|5 basis elements and 4 critical pairs
      #|6 basis elements and 7 critical pairs
      #|6 basis elements and 6 critical pairs
      #|6 basis elements and 5 critical pairs
      #|7 basis elements and 7 critical pairs
      #|7 basis elements and 6 critical pairs
      #|8 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 8
      #|0..0..2..4..10..solved at 18
      #|0..0..2..4..10..solved at 19
      #|0..0..2..6..18..solved at 30
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..0..1..3..7..20..solved at 39
      #|0..0..1..2..6..11..solved at 17
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..2..4..8..solved at 15
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..2..4..solved at 9
      #|0..0..0..2..4..solved at 9
      #|0..0..1..3..solved at 8
      #|0..0..1..3..solved at 8
      #|0..0..solved at 2
      #|0..0..1..2..6..12..solved at 26
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..1..3..solved at 7
      #|0..0..1..3..6..solved at 11
      #|Warning: inventing type variables
      #|0..0..1..2..5..8..11..15..19..23..31..39..47..solved at 62
      #|Warning: inventing type variables
      #|0..0..1..2..5..9..15..24..33..44..62..80..105..solved at 121
      #|Warning: inventing type variables
      #|0..0..2..solved at 6
      #|0..0..1..2..4..8..12..18..solved at 27
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|1 basis elements and 0 critical pairs
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..4..9..solved at 14
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..4..9..solved at 14
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..2..4..12..solved at 17
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..0..0..solved at 8
      #|0..0..0..0..solved at 4
      #|0..0..2..4..8..16..solved at 29
      #|0..0..2..4..8..16..solved at 28
      #|1 basis elements and 0 critical pairs
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|0..0..solved at 2
      #|5 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|6 basis elements and 2 critical pairs
      #|7 basis elements and 3 critical pairs
      #|8 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|7 basis elements and 1 critical pairs
      #|8 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|7 basis elements and 1 critical pairs
      #|8 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
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
      #|Warning: inventing type variables
      #|0..0..0..1..2..3..7..11..15..27..39..51..solved at 139
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..3..7..15..solved at 21
      #|0..0..3..8..21..87..283..1578..7671..solved at 7720
      #|0..0..solved at 2
      #|0..0..4..12..34..118..305..1391..4886..solved at 7608
      #|0..0..4..12..34..118..305..1391..4886..solved at 14525
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..1..2..3..4..5..6..solved at 18
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..9..15..22..29..36..47..58..73..92..111..134..161..188..219..264..309..368..434..500..573..solved at 650
      #|Warning: inventing type variables
      #|0..0..1..2..5..9..19..34..61..101..199..305..511..746..1245..2023..3506..solved at 4659
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|Warning: inventing type variables
      #|0..0..1..2..5..9..15..30..47..76..solved at 121
      #|0..0..0..0..2..7..12..solved at 24
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..3..7..13..20..solved at 28
      #|0..0..0..2..solved at 6
      #|0..0..1..3..7..15..26..46..68..96..141..201..277..399..539..710..974..solved at 1086
      #|0..0..1..3..solved at 7
      #|0..0..1..3..6..solved at 11
      #|0..0..1..2..4..solved at 9
      #|0..0..1..3..7..13..20..solved at 34
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..solved at 6
      #|0..0..1..3..7..solved at 12
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..solved at 6
      #|0..0..1..3..7..solved at 12
      #|0..0..1..2..4..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..5..10..20..solved at 31
      #|0..0..solved at 2
      #|0..0..1..2..5..10..20..34..52..solved at 66
      #|0..0..1..2..5..9..15..41..solved at 68
      #|0..0..solved at 2
      #|0..0..2..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 7
      #|0..0..1..4..solved at 8
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..3..6..solved at 11
      #|Warning: inventing type variables
      #|0..0..1..3..6..solved at 11
      #|Warning: inventing type variables
      #|0..0..1..2..5..9..15..solved at 26
      #|0..0..0..1..3..7..solved at 14
      #|Warning: inventing type variables
      #|0..0..1..2..5..9..15..solved at 26
      #|0..0..0..1..3..7..solved at 14
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..3..7..16..28..56..95..160..257..403..593..965..1453..2246..3429..5097..7527..solved at 9741
      #|0..0..2..solved at 5
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..3..6..solved at 10
      #|0..0..3..solved at 6
      #|0..0..3..6..solved at 10
      #|0..0..2..5..solved at 15
      #|0..0..3..solved at 6
      #|0..0..2..4..11..20..33..57..81..107..151..209..281..375..solved at 460
      #|0..0..3..6..13..25..45..76..solved at 95
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..6..solved at 10
      #|0..0..3..6..solved at 10
      #|0..0..solved at 2
      #|0..0..3..solved at 9
      #|0..0..1..solved at 5
      #|0..0..2..4..11..20..33..59..85..115..156..205..262..341..solved at 418
      #|0..0..2..4..solved at 9
      #|0..0..solved at 2
      #|0..0..2..solved at 7
      #|0..0..2..5..13..solved at 21
      #|0..0..2..4..9..solved at 14
      #|0..0..2..4..10..solved at 16
      #|0..0..solved at 2
      #|0..0..2..5..13..solved at 21
      #|0..0..2..4..9..solved at 14
      #|0..0..2..4..10..solved at 16
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..7..solved at 13
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..2..7..solved at 13
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..3..6..solved at 10
      #|0..0..3..6..solved at 10
      #|0..0..0..2..4..9..20..40..79..141..solved at 189
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..2..5..solved at 10
      #|0..0..3..solved at 8
      #|0..0..2..solved at 5
      #|0..0..3..solved at 6
      #|0..0..3..solved at 9
      #|0..0..2..solved at 8
      #|0..0..3..solved at 6
      #|0..0..3..solved at 8
      #|0..0..2..solved at 5
      #|0..0..3..solved at 6
      #|0..0..3..8..solved at 12
      #|0..0..2..6..solved at 10
      #|0..0..3..solved at 6
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..1..3..8..solved at 13
      #|0..0..2..4..solved at 8
      #|0..0..6..solved at 17
      #|0..0..6..solved at 17
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..5..solved at 8
      #|0..0..5..solved at 8
      #|0..0..6..solved at 11
      #|0..0..6..solved at 11
      #|0..0..5..solved at 14
      #|0..0..5..solved at 15
      #|0..0..6..solved at 17
      #|0..0..6..solved at 17
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..5..solved at 8
      #|0..0..5..solved at 8
      #|0..0..6..solved at 11
      #|0..0..6..solved at 11
      #|0..0..5..solved at 15
      #|0..0..5..solved at 16
      #|0..0..6..solved at 17
      #|0..0..6..solved at 17
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..5..solved at 8
      #|0..0..5..solved at 8
      #|0..0..6..solved at 11
      #|0..0..6..solved at 11
      #|0..0..5..solved at 14
      #|0..0..5..solved at 15
      #|0..0..6..solved at 17
      #|0..0..6..solved at 17
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..5..solved at 8
      #|0..0..5..solved at 8
      #|0..0..6..solved at 11
      #|0..0..6..solved at 11
      #|0..0..5..solved at 15
      #|0..0..5..solved at 16
      #|0..0..6..17..solved at 24
      #|0..0..6..17..solved at 24
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..5..solved at 8
      #|0..0..5..solved at 8
      #|0..0..6..solved at 11
      #|0..0..6..solved at 11
      #|0..0..5..solved at 14
      #|0..0..5..solved at 15
      #|0..0..6..17..solved at 24
      #|0..0..6..17..solved at 24
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..5..solved at 8
      #|0..0..5..solved at 8
      #|0..0..6..solved at 11
      #|0..0..6..solved at 11
      #|0..0..5..solved at 15
      #|0..0..5..solved at 16
      #|0..0..6..17..solved at 24
      #|0..0..6..17..solved at 24
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..5..solved at 8
      #|0..0..5..solved at 8
      #|0..0..6..solved at 11
      #|0..0..6..solved at 11
      #|0..0..5..solved at 14
      #|0..0..5..solved at 15
      #|0..0..6..17..solved at 24
      #|0..0..6..17..solved at 24
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..5..solved at 8
      #|0..0..5..solved at 8
      #|0..0..6..solved at 11
      #|0..0..6..solved at 11
      #|0..0..5..solved at 15
      #|0..0..5..solved at 16
      #|0..0..2..7..17..solved at 36
      #|0..0..2..7..15..solved at 30
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..5..13..29..solved at 34
      #|0..0..4..9..solved at 13
      #|0..0..solved at 2
      #|0..0..4..solved at 8
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..3..solved at 8
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..4..solved at 7
      #|0..0..3..8..19..solved at 24
      #|0..0..solved at 2
      #|0..0..4..9..22..solved at 27
      #|0..0..solved at 2
      #|0..0..3..solved at 8
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..4..solved at 7
      #|0..0..3..7..15..33..63..118..223..354..526..748..985..solved at 1278
      #|0..0..solved at 2
      #|0..0..4..9..20..solved at 25
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..2..5..solved at 10
      #|0..0..3..solved at 8
      #|0..0..2..solved at 5
      #|0..0..3..solved at 6
      #|0..0..3..solved at 9
      #|0..0..2..solved at 8
      #|0..0..3..solved at 6
      #|0..0..3..solved at 8
      #|0..0..2..solved at 5
      #|0..0..3..solved at 6
      #|0..0..3..8..solved at 12
      #|0..0..2..6..solved at 10
      #|0..0..3..solved at 6
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..1..3..8..solved at 13
      #|0..0..2..4..solved at 8
      #|0..0..6..solved at 17
      #|0..0..6..solved at 17
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..5..solved at 8
      #|0..0..5..solved at 8
      #|0..0..6..solved at 11
      #|0..0..6..solved at 11
      #|0..0..5..solved at 14
      #|0..0..5..solved at 15
      #|0..0..6..solved at 17
      #|0..0..6..solved at 17
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..5..solved at 8
      #|0..0..5..solved at 8
      #|0..0..6..solved at 11
      #|0..0..6..solved at 11
      #|0..0..5..solved at 15
      #|0..0..5..solved at 16
      #|0..0..6..solved at 17
      #|0..0..6..solved at 17
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..5..solved at 8
      #|0..0..5..solved at 8
      #|0..0..6..solved at 11
      #|0..0..6..solved at 11
      #|0..0..5..solved at 14
      #|0..0..5..solved at 15
      #|0..0..6..solved at 17
      #|0..0..6..solved at 17
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..5..solved at 8
      #|0..0..5..solved at 8
      #|0..0..6..solved at 11
      #|0..0..6..solved at 11
      #|0..0..5..solved at 15
      #|0..0..5..solved at 16
      #|0..0..6..17..solved at 24
      #|0..0..6..17..solved at 24
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..5..solved at 8
      #|0..0..5..solved at 8
      #|0..0..6..solved at 11
      #|0..0..6..solved at 11
      #|0..0..5..solved at 14
      #|0..0..5..solved at 15
      #|0..0..6..17..solved at 24
      #|0..0..6..17..solved at 24
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..5..solved at 8
      #|0..0..5..solved at 8
      #|0..0..6..solved at 11
      #|0..0..6..solved at 11
      #|0..0..5..solved at 15
      #|0..0..5..solved at 16
      #|0..0..6..17..solved at 24
      #|0..0..6..17..solved at 24
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..5..solved at 8
      #|0..0..5..solved at 8
      #|0..0..6..solved at 11
      #|0..0..6..solved at 11
      #|0..0..5..solved at 14
      #|0..0..5..solved at 15
      #|0..0..6..17..solved at 24
      #|0..0..6..17..solved at 24
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..5..solved at 8
      #|0..0..5..solved at 8
      #|0..0..6..solved at 11
      #|0..0..6..solved at 11
      #|0..0..5..solved at 15
      #|0..0..5..solved at 16
      #|0..0..2..7..17..solved at 36
      #|0..0..2..7..15..solved at 30
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..5..13..29..solved at 34
      #|0..0..4..9..solved at 13
      #|0..0..4..solved at 7
      #|0..0..4..solved at 8
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..3..solved at 8
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..4..solved at 7
      #|0..0..3..8..19..solved at 24
      #|0..0..solved at 2
      #|0..0..4..9..22..solved at 27
      #|0..0..solved at 2
      #|0..0..3..solved at 8
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..4..solved at 7
      #|0..0..3..7..15..33..63..118..223..354..526..748..985..solved at 1278
      #|0..0..solved at 2
      #|0..0..4..9..20..solved at 25
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..6..12..solved at 23
      #|0..0..1..2..5..solved at 14
      #|Warning: inventing type variables
      #|0..0..1..2..5..solved at 11
      #|0..0..solved at 2
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..2..3..solved at 8
      #|Warning: inventing type variables
      #|0..0..1..2..5..9..15..22..29..36..47..58..73..solved at 87
      #|0..0..1..2..6..11..19..32..45..60..solved at 73
      #|0..0..1..2..6..11..19..32..45..60..solved at 73
      #|3 basis elements and 1 critical pairs
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 11
      #|0..0..2..6..15..32..81..192..435..solved at 453
      #|1 basis elements and 0 critical pairs
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..3..11..solved at 16
      #|0..0..1..5..11..22..50..95..solved at 112
      #|0..0..1..2..solved at 9
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..3..7..solved at 15
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 5
      #|0..0..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..9..15..24..33..44..solved at 53
      #|4 basis elements and 4 critical pairs
      #|5 basis elements and 6 critical pairs
      #|6 basis elements and 6 critical pairs
      #|6 basis elements and 5 critical pairs
      #|6 basis elements and 4 critical pairs
      #|7 basis elements and 7 critical pairs
      #|8 basis elements and 11 critical pairs
      #|8 basis elements and 10 critical pairs
      #|8 basis elements and 9 critical pairs
      #|8 basis elements and 8 critical pairs
      #|8 basis elements and 7 critical pairs
      #|9 basis elements and 10 critical pairs
      #|9 basis elements and 9 critical pairs
      #|9 basis elements and 8 critical pairs
      #|9 basis elements and 7 critical pairs
      #|9 basis elements and 6 critical pairs
      #|10 basis elements and 10 critical pairs
      #|11 basis elements and 14 critical pairs
      #|11 basis elements and 13 critical pairs
      #|11 basis elements and 12 critical pairs
      #|11 basis elements and 11 critical pairs
      #|11 basis elements and 10 critical pairs
      #|11 basis elements and 9 critical pairs
      #|11 basis elements and 8 critical pairs
      #|11 basis elements and 7 critical pairs
      #|11 basis elements and 6 critical pairs
      #|12 basis elements and 8 critical pairs
      #|12 basis elements and 7 critical pairs
      #|12 basis elements and 6 critical pairs
      #|12 basis elements and 5 critical pairs
      #|12 basis elements and 4 critical pairs
      #|12 basis elements and 3 critical pairs
      #|12 basis elements and 2 critical pairs
      #|12 basis elements and 1 critical pairs
      #|12 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
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
      #|6 basis elements and 4 critical pairs
      #|7 basis elements and 5 critical pairs
      #|7 basis elements and 4 critical pairs
      #|8 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..2..3..4..solved at 10
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
      #|1 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|0..0..solved at 2
      #|0..0..2..4..10..21..43..77..123..solved at 147
      #|0..0..1..2..6..solved at 12
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..solved at 3
      #|1 basis elements and 0 critical pairs
      #|0..0..2..4..12..24..solved at 31
      #|1 basis elements and 0 critical pairs
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..2..3..9..16..23..32..44..58..81..107..solved at 122
      #|0..0..1..2..3..7..12..19..26..solved at 35
      #|0..0..1..2..4..solved at 9
      #|0..0..1..2..solved at 7
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 7
      #|0..0..1..2..3..10..19..28..47..72..105..solved at 120
      #|Warning: inventing type variables
      #|0..0..2..7..17..34..solved at 40
      #|0..0..1..2..5..12..21..43..79..solved at 119
      #|0..0..1..3..5..7..solved at 13
      #|0..0..1..solved at 4
      #|0..0..1..2..3..4..8..12..16..solved at 40
      #|0..0..1..2..11..21..41..70..116..164..236..316..491..solved at 502
      #|0..0..1..2..5..9..19..solved at 35
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..0..0..2..6..10..solved at 18
      #|0..0..0..1..4..solved at 9
      #|0..0..solved at 2
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..1..solved at 4
      #|0..0..1..2..3..7..13..21..35..52..72..108..148..194..267..351..445..570..713..solved at 838
      #|0..0..1..2..3..7..13..21..35..52..72..108..148..194..267..351..445..570..713..solved at 834
      #|0..0..1..2..5..10..17..26..solved at 40
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..4..solved at 9
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..1..2..3..8..15..23..37..52..67..94..126..160..216..275..336..solved at 448
      #|0..0..0..1..2..3..9..17..solved at 26
      #|0..0..1..2..5..8..11..17..23..29..44..62..solved at 79
      #|Warning: inventing type variables
      #|0..0..0..2..4..8..13..20..32..solved at 61
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
      #|1 basis elements and 0 critical pairs
      #|Warning: inventing type variables
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..4..11..solved at 18
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..4..11..23..solved at 32
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|2 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..2..5..solved at 13
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..10..25..59..solved at 73
      #|0..0..1..5..17..39..114..291..solved at 319
      #|0..0..1..2..3..9..16..solved at 23
      #|5 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..2..7..13..26..solved at 37
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..2..4..9..solved at 16
      #|0..0..2..4..12..solved at 17
      #|0..0..1..6..16..39..80..144..solved at 161
      #|0..0..1..2..6..14..solved at 20
      #|0..0..0..1..2..3..4..5..6..10..14..18..solved at 56
      #|0..0..0..0..0..1..2..3..6..9..12..15..18..21..solved at 32
      #|0..0..0..0..2..5..8..12..solved at 20
      #|0..0..1..2..3..9..16..23..30..37..44..57..70..83..155..229..314..447..585..761..solved at 883
      #|0..0..1..2..5..11..20..34..solved at 42
      #|0..0..1..2..11..21..44..74..119..168..245..330..solved at 340
      #|0..0..1..2..5..9..solved at 20
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 2
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..5..9..15..solved at 28
      #|0..0..solved at 2
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..0..2..4..8..13..20..28..40..52..68..solved at 96
      #|0..0..0..2..4..8..13..20..28..40..52..68..solved at 96
      #|0..0..1..2..13..24..41..76..124..194..307..436..643..1057..1588..solved at 1841
      #|0..0..1..2..5..9..15..solved at 28
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..3..solved at 8
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Warning: inventing type variables
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..3..8..solved at 13
      #|0..0..solved at 2
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..0..2..5..solved at 10
      #|0..0..solved at 2
      #|0..0..2..4..7..solved at 14
      #|3 basis elements and 2 critical pairs
      #|4 basis elements and 3 critical pairs
      #|5 basis elements and 4 critical pairs
      #|5 basis elements and 3 critical pairs
      #|5 basis elements and 2 critical pairs
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|6 basis elements and 1 critical pairs
      #|7 basis elements and 3 critical pairs
      #|7 basis elements and 2 critical pairs
      #|7 basis elements and 1 critical pairs
      #|7 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..2..4..10..solved at 15
      #|0..0..2..5..12..28..solved at 34
      #|0..0..solved at 2
      #|0..0..2..4..6..14..24..34..53..72..91..141..191..255..solved at 275
      #|0..0..solved at 2
      #|0..0..1..2..3..4..9..15..21..solved at 37
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..11..23..43..70..113..177..solved at 212
      #|0..0..0..solved at 3
      #|0..0..1..2..4..solved at 9
      #|0..0..1..2..5..9..17..26..37..49..67..85..111..141..172..solved at 214
      #|0..0..1..2..7..solved at 12
      #|0..0..1..2..8..15..27..40..57..75..114..162..solved at 181
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..5..9..15..22..29..solved at 44
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..6..solved at 11
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|2 basis elements and 1 critical pairs
      #|3 basis elements and 1 critical pairs
      #|3 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..0..2..6..solved at 11
      #|0..0..solved at 2
      #|2 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..3..solved at 8
      #|0..0..3..solved at 8
      #|0..0..3..6..13..solved at 22
      #|0..0..3..6..11..solved at 22
      #|0..0..2..4..solved at 8
      #|0..0..1..2..5..9..15..24..33..44..59..74..93..solved at 108
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..2..4..13..27..solved at 38
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..2..4..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..2..4..solved at 8
      #|0..0..1..2..9..19..42..solved at 51
      #|Warning: inventing type variables
      #|0..0..1..solved at 5
      #|0..0..1..3..9..21..46..solved at 53
      #|0..0..2..4..10..20..38..solved at 45
      #|0..0..solved at 2
      #|0..0..2..4..solved at 12
      #|0..0..0..solved at 3
      #|0..0..0..1..3..7..solved at 12
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..7..solved at 12
      #|Warning: inventing type variables
      #|0..0..1..2..5..8..11..19..28..39..65..94..125..solved at 174
      #|0..0..1..3..7..solved at 12
      #|Warning: inventing type variables
      #|0..0..0..1..3..solved at 8
      #|0..0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..2..7..solved at 12
      #|0..0..solved at 2
      #|0..0..1..2..3..7..13..solved at 23
      #|0..0..1..2..4..solved at 9
      #|0..0..1..2..5..9..17..26..37..53..solved at 83
      #|0..0..solved at 2
      #|0..0..2..4..8..18..31..48..69..94..125..172..224..293..solved at 367
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|1 basis elements and 0 critical pairs
      #|0..0..1..2..5..9..solved at 20
      #|0..0..1..2..4..solved at 9
      #|0..0..1..2..4..10..20..solved at 27
      #|0..0..2..4..10..20..40..69..107..161..238..330..456..620..805..solved at 847
      #|0..0..2..4..solved at 8
      #|0..0..1..2..5..11..solved at 19
      #|0..0..1..2..4..13..solved at 19
      #|0..0..1..2..4..solved at 9
      #|0..0..1..2..7..solved at 12
      #|0..0..1..2..4..solved at 9
      #|0..0..1..2..4..9..15..28..solved at 36
      #|0..0..2..solved at 6
      #|0..0..1..2..7..solved at 12
      #|0..0..1..2..4..solved at 9
      #|0..0..2..7..17..36..68..124..solved at 161
      #|0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..1..2..4..9..15..28..solved at 36
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..5..14..30..56..99..170..307..572..988..1565..2820..solved at 3540
      #|0..0..1..2..5..11..24..43..66..97..164..249..405..628..994..1536..2399..3595..5672..solved at 6006
      #|0..0..1..2..5..17..solved at 37
      #|0..0..1..2..5..14..solved at 29
      #|Warning: inventing type variables
      #|0..0..1..2..4..solved at 11
      #|0..0..1..2..4..solved at 11
      #|0..0..1..solved at 6
      #|0..0..1..solved at 6
      #|0..0..1..2..4..solved at 11
      #|0..0..1..2..4..solved at 11
      #|0..0..1..solved at 6
      #|0..0..1..solved at 6
      #|0..0..0..0..5..11..22..38..solved at 48
      #|0..0..0..0..4..10..solved at 16
      #|0..0..0..0..5..11..solved at 17
      #|0..0..0..0..4..10..21..37..solved at 47
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..4..13..solved at 21
      #|0..0..1..2..4..13..solved at 21
      #|0..0..1..2..5..12..27..57..105..191..329..520..850..1285..1956..2858..4098..5735..7922..10831..solved at 11928
      #|0..0..1..2..6..13..23..38..65..101..solved at 155
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..10..19..solved at 33
      #|0..0..1..2..5..10..18..28..40..54..73..96..125..170..217..solved at 287
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..1..2..5..9..15..solved at 35
      #|0..0..1..2..5..9..15..solved at 34
      #|0..0..1..2..5..9..15..solved at 36
      #|0..0..1..2..5..9..15..solved at 31
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..10..21..37..61..92..solved at 113
      #|Warning: inventing type variables
      #|0..0..0..1..2..3..8..solved at 16
      #|Warning: inventing type variables
      #|0..0..0..1..2..3..8..solved at 16
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..1..2..5..9..15..22..29..36..63..92..141..203..solved at 228
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..6..12..solved at 17
      #|0..0..7..solved at 11
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..7..solved at 11
      #|0..0..3..7..solved at 17
      #|0..0..3..6..solved at 16
      #|0..0..3..7..solved at 17
      #|0..0..3..6..solved at 16
      #|0..0..3..7..solved at 17
      #|0..0..3..6..solved at 16
      #|0..0..3..7..solved at 17
      #|0..0..3..6..solved at 16
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..1..2..5..12..solved at 18
      #|0..0..1..2..5..12..solved at 18
      #|0..0..2..4..12..22..38..58..78..98..solved at 106
      #|0..0..2..4..10..19..32..48..65..93..131..184..258..352..456..solved at 501
      #|0..0..2..4..10..19..32..solved at 45
      #|0..0..2..4..10..19..32..solved at 45
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..3..solved at 8
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..2..4..10..19..32..48..65..93..131..184..258..352..456..solved at 501
      #|0..0..2..4..10..19..32..solved at 45
      #|0..0..2..4..10..19..32..solved at 45
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..10..solved at 17
      #|0..0..2..4..10..19..32..48..65..93..131..184..258..372..496..solved at 541
      #|0..0..solved at 2
      #|0..0..2..4..10..19..32..solved at 45
      #|0..0..solved at 2
      #|0..0..2..4..11..20..34..solved at 47
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..3..8..solved at 20
      #|Warning: inventing type variables
      #|0..0..1..3..8..solved at 20
      #|Warning: inventing type variables
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..1..2..solved at 6
      #|0..0..solved at 3
      #|0..0..1..2..3..7..13..22..56..100..solved at 137
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..11..20..34..61..92..135..solved at 156
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..4..11..20..34..61..89..128..201..solved at 227
      #|0..0..2..4..12..solved at 23
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..2..4..10..19..32..48..65..93..131..184..258..352..456..solved at 501
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 2
      #|0..0..2..4..10..19..32..solved at 45
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 2
      #|0..0..2..4..11..21..36..54..73..92..solved at 112
      #|0..0..2..4..11..21..36..54..73..92..solved at 112
      #|0..0..2..5..17..37..73..152..274..548..solved at 825
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..solved at 16
      #|0..0..2..4..10..solved at 22
      #|Warning: inventing type variables
      #|0..0..0..0..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..10..20..37..59..solved at 73
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..14..40..80..solved at 161
      #|0..0..solved at 2
      #|0..0..1..2..5..10..20..37..59..solved at 73
      #|0..0..solved at 2
      #|0..0..1..2..5..10..20..37..59..solved at 73
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..2..4..10..22..37..solved at 52
      #|0..0..solved at 2
      #|0..0..1..2..7..18..38..83..150..258..424..680..solved at 700
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..5..13..solved at 18
      #|0..0..1..4..11..30..solved at 55
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 9
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..2..4..14..30..58..125..213..355..593..solved at 612
      #|0..0..1..2..5..11..22..solved at 39
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|4 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|4 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..1..2..5..10..solved at 17
      #|0..0..1..3..9..35..97..377..solved at 394
      #|Warning: inventing type variables
      #|0..0..1..solved at 5
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 11
      #|Warning: inventing type variables
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..1..3..solved at 8
      #|Warning: inventing type variables
      #|0..0..1..2..3..6..solved at 12
      #|Warning: inventing type variables
      #|0..0..2..6..16..solved at 25
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..5..9..15..22..solved at 34
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..4..solved at 8
      #|Warning: inventing type variables
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..5..8..solved at 14
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..2..4..11..solved at 24
      #|0..0..1..2..5..10..20..37..59..solved at 73
      #|0..0..0..0..0..0..2..6..10..15..20..25..30..35..40..51..62..73..86..99..112..125..138..151..solved at 174
      #|0..0..1..2..solved at 9
      #|0..0..1..2..5..9..22..45..solved at 67
      #|0..0..1..5..solved at 16
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..solved at 7
      #|0..0..2..5..solved at 9
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..2..solved at 7
      #|0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..2..5..solved at 10
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..2..3..7..17..solved at 43
      #|0..0..1..2..solved at 6
      #|0..0..3..solved at 8
      #|0..0..3..6..9..21..44..solved at 66
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..4..solved at 10
      #|0..0..3..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 11
      #|0..0..4..solved at 9
      #|0..0..5..solved at 11
      #|0..0..4..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 11
      #|0..0..4..solved at 9
      #|0..0..4..9..solved at 16
      #|0..0..3..7..solved at 12
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..10..27..80..220..564..solved at 605
      #|0..0..3..9..24..63..174..412..937..2171..4856..solved at 4900
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..4..solved at 10
      #|0..0..3..solved at 8
      #|0..0..4..solved at 10
      #|0..0..3..solved at 8
      #|0..0..4..8..solved at 14
      #|0..0..3..6..solved at 10
      #|0..0..3..6..solved at 12
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..4..9..solved at 15
      #|0..0..3..7..solved at 12
      #|0..0..3..6..solved at 10
      #|0..0..4..solved at 10
      #|0..0..3..solved at 8
      #|0..0..3..10..27..solved at 33
      #|0..0..3..9..24..63..173..403..solved at 412
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..6..9..21..44..solved at 61
      #|0..0..solved at 2
      #|0..0..3..6..9..21..44..solved at 61
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..3..solved at 7
      #|0..0..2..solved at 5
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..3..7..13..23..solved at 35
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..3..9..solved at 18
      #|0..0..0..0..3..7..11..18..solved at 27
      #|0..0..0..0..3..7..11..18..27..38..solved at 50
      #|0..0..2..solved at 8
      #|0..0..1..4..7..14..solved at 20
      #|0..0..1..4..13..40..solved at 100
      #|0..0..3..solved at 6
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..0..solved at 4
      #|0..0..0..0..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..1..solved at 5
      #|Warning: inventing type variables
      #|0..0..0..2..5..solved at 10
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..1..3..5..10..20..32..solved at 40
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..0..2..5..11..18..29..45..67..91..solved at 101
      #|0..0..2..4..8..22..41..solved at 50
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..4..11..23..47..77..137..213..323..470..661..871..1217..solved at 1250
      #|0..0..1..6..17..57..solved at 137
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..5..9..15..22..29..36..47..58..73..solved at 87
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..7..18..35..solved at 42
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..2..5..10..solved at 16
      #|0..0..1..2..solved at 6
      #|0..0..2..5..10..solved at 16
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..4..solved at 11
      #|0..0..1..2..solved at 6
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..2..5..9..solved at 19
      #|0..0..1..3..6..solved at 13
      #|0..0..1..2..7..13..26..solved at 44
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
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
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..3..7..12..17..solved at 25
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..3..solved at 7
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..1..3..solved at 7
      #|0..0..1..2..4..10..20..36..72..126..solved at 151
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..0..1..2..3..6..16..29..solved at 45
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..6..11..solved at 19
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..9..15..22..29..36..solved at 63
      #|0..0..1..3..solved at 8
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..5..9..solved at 16
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..4..solved at 10
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..3..solved at 8
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..3..solved at 8
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..3..9..solved at 15
      #|0..0..solved at 2
      #|0..0..1..3..7..13..20..30..43..56..75..solved at 89
      #|0..0..1..2..6..11..solved at 17
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..24..33..44..80..122..193..292..414..567..810..1086..1471..solved at 1637
      #|0..0..solved at 2
      #|0..0..1..2..6..11..solved at 19
      #|0..0..1..3..7..13..20..30..43..56..75..112..149..208..280..352..440..591..748..solved at 893
      #|0..0..1..2..3..4..5..solved at 18
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
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
      #|0..0..1..2..5..9..15..24..33..44..78..118..solved at 132
      #|0..0..solved at 2
      #|0..0..1..2..6..11..22..36..solved at 44
      #|0..0..solved at 2
      #|0..0..1..2..6..11..22..36..solved at 44
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..24..33..44..78..118..solved at 132
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..6..12..28..51..104..177..362..solved at 453
      #|0..0..0..0..0..0..solved at 6
      #|0..0..1..5..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..3..7..12..17..28..41..57..91..128..170..solved at 212
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..5..solved at 13
      #|0..0..solved at 2
      #|0..0..1..3..9..solved at 20
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..1..3..5..solved at 11
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..solved at 11
      #|0..0..1..2..solved at 6
      #|0..0..1..3..9..solved at 15
      #|0..0..1..2..6..15..32..68..117..202..356..593..954..1553..2456..3811..5967..solved at 9176
      #|0..0..0..2..4..8..17..29..49..solved at 99
      #|0..0..0..2..4..8..17..29..51..99..166..264..435..703..1098..1743..2652..4036..6059..9104..13572..20495..30570..45463..67283..98731..145533..solved at 211914
      #|0..0..1..2..6..14..29..65..117..202..370..607..986..1667..2639..4139..6732..10437..solved at 11203
      #|0..0..0..2..4..8..21..38..67..solved at 115
      #|0..0..1..2..6..15..32..68..117..202..356..593..954..1553..2456..solved at 3796
      #|0..0..0..2..4..8..17..29..49..solved at 92
      #|0..0..1..2..5..12..solved at 18
      #|0..0..0..2..4..8..17..29..49..solved at 89
      #|0..0..0..2..4..8..20..solved at 34
      #|0..0..1..2..5..solved at 12
      #|0..0..1..2..5..9..15..24..33..44..77..123..196..326..489..738..solved at 762
      #|0..0..1..3..7..15..32..solved at 41
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..1..2..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..11..solved at 17
      #|0..0..1..2..7..16..30..50..solved at 58
      #|0..0..1..2..7..16..31..52..solved at 60
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..11..solved at 17
      #|0..0..1..2..7..16..30..50..solved at 59
      #|0..0..1..2..7..16..31..52..solved at 61
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 7
      #|0..0..1..2..7..solved at 14
      #|0..0..1..2..7..21..solved at 39
      #|0..0..1..2..7..21..solved at 38
      #|0..0..1..2..7..solved at 14
      #|0..0..1..2..5..9..15..30..50..81..141..222..351..605..969..1577..solved at 2076
      #|0..0..1..2..5..9..15..30..50..81..141..222..351..605..969..1577..solved at 2076
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..5..10..17..solved at 29
      #|0..0..2..4..solved at 11
      #|0..0..1..2..5..9..15..solved at 26
      #|0..0..1..2..solved at 8
      #|0..0..4..8..20..36..solved at 47
      #|0..0..3..6..15..solved at 23
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..11..22..53..97..162..237..solved at 251
      #|0..0..11..22..53..97..162..237..758..1460..2662..4857..solved at 5179
      #|0..0..solved at 11
      #|0..0..solved at 9
      #|0..0..solved at 8
      #|0..0..solved at 5
      #|0..0..solved at 10
      #|0..0..solved at 7
      #|0..0..solved at 4
      #|0..0..solved at 6
      #|0..0..10..20..50..92..154..solved at 166
      #|0..0..2..4..solved at 8
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..4..10..20..solved at 28
      #|0..0..3..6..17..37..73..solved at 80
      #|0..0..solved at 5
      #|0..0..4..8..24..82..182..396..782..1637..3901..10950..30405..solved at 30638
      #|0..0..4..8..23..75..165..349..688..1408..3188..8508..solved at 10100
      #|0..0..1..solved at 4
      #|0..0..1..2..3..9..solved at 15
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..11..25..50..solved at 73
      #|0..0..solved at 2
      #|0..0..1..2..7..12..solved at 25
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..6..18..solved at 27
      #|0..0..1..2..7..13..solved at 26
      #|0..0..2..4..10..18..36..66..solved at 87
      #|0..0..0..solved at 3
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
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 5
      #|0..0..solved at 5
      #|0..0..solved at 4
      #|0..0..7..14..solved at 19
      #|0..0..7..14..solved at 19
      #|0..0..6..12..solved at 16
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|Library/symmetric_group quotations (292):
      #|  (symmetric_group : ((A) -> Bool) -> Group[(A) -> A])((s : (A) -> Bool)) == group(({(p : (A) -> A) | permutes(p, s)}, I, inverse, o))
      #|  (\226\136\128 s : (A) -> Bool, group_carrier(symmetric_group(s)) == {(p : (A) -> A) | permutes(p, s)}) && (\226\136\128 s : (A) -> Bool, group_id(symmetric_group(s)) == I) && (\226\136\128 s : (A) -> Bool, group_inv(symmetric_group(s)) == inverse) && (\226\136\128 s : (A) -> Bool, group_mul(symmetric_group(s)) == o)
      #|  \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 FINITE(group_carrier(symmetric_group(s)))
      #|  \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 CARD(group_carrier(symmetric_group(s))) == FACT(CARD(s))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 p : (A) -> A, \226\136\128 q : (A) -> A, group_mul(symmetric_group(s), p, q) == o(p, q)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 p : (A) -> A, group_inv(symmetric_group(s), p) == inverse(p)
      #|  \226\136\128 s : (A) -> Bool, group_id(symmetric_group(s)) == I
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 a : A, \226\136\128 b : A, IN(a, s) && IN(b, s) \226\134\146 IN(swap((a, b)), group_carrier(symmetric_group(s)))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 a : A, \226\136\128 b : A, \226\136\128 c : A, IN(a, s) && IN(b, s) && IN(c, s) && !(a == b) && !(b == c) && !(a == c) \226\134\146 IN(three_cycle(a, b, c), group_carrier(symmetric_group(s)))
      #|  group_mul((G : Group[A]), group_inv(G, (a : A)))
      #|  (a : A)
      #|  \226\136\128 G : Group[A], group_monomorphism((G, symmetric_group(group_carrier(G))), (a : A) => (x : A) => if IN(x, group_carrier(G)) { group_mul(G, a, x) } else { x })
      #|  (a : A) => (x : A) => if IN(x, group_carrier((G : Group[A]))) { group_mul(G, a, x) } else { x }
      #|  group_image(((G : Group[A]), symmetric_group(group_carrier(G))), (a : A) => (x : A) => if IN(x, group_carrier(G)) { group_mul(G, a, x) } else { x })
      #|  \226\136\128 G : Group[A], \226\136\131 h : ((A) -> A) -> Bool, subgroup_of(h, symmetric_group(group_carrier(G))) && isomorphic_group(subgroup_generated(symmetric_group(group_carrier(G)), h), G)
      #|  \226\136\128 s : (A) -> Bool, group_action(symmetric_group(s), s, (f : (A) -> A) => (x : A) => f(x))
      #|  three_cycle((a : A), (b : A), (c : A)) == o(inverse(three_cycle((d : A), a, c)), o(inverse(three_cycle(c, (e : A), b)), o(three_cycle(d, a, c), three_cycle(c, e, b))))
      #|  three_cycle((c : A), (e : A), (b : A))
      #|  three_cycle((d : A), (a : A), (c : A))
      #|  (n : ((A) -> A) -> Bool)
      #|  (H : Group[(A) -> A])
      #|  (d : A)
      #|  (c : A)
      #|  (b : A)
      #|  (a : A)
      #|  !SUBSET((s : (A) -> Bool), {(a : A), (b : A), (c : A), (d : A)}) \226\134\146 (\226\136\131 e : A, IN(e, s) && !(e == a) && !(e == b) && !(e == c) && !(e == d))
      #|  \226\136\131 e : A, IN(e, (s : (A) -> Bool)) && !(e == (a : A)) && !(e == (b : A)) && !(e == (c : A)) && !(e == (d : A))
      #|  (c : A)
      #|  (b : A)
      #|  (a : A)
      #|  !SUBSET((s : (A) -> Bool), {(a : A), (b : A), (c : A)}) \226\134\146 (\226\136\131 d : A, IN(d, s) && !(d == a) && !(d == b) && !(d == c))
      #|  \226\136\131 d : A, IN(d, (s : (A) -> Bool)) && !(d == (a : A)) && !(d == (b : A)) && !(d == (c : A))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 H : Group[(A) -> A], \226\136\128 n : ((A) -> A) -> Bool, 5 <= CARD(s) && FINITE(s) && normal_subgroup_of(n, H) && abelian_group(quotient_group(H, n)) && group_mul(H) == o && group_inv(H) == inverse && (\226\136\128 a : A, \226\136\128 b : A, \226\136\128 c : A, IN(a, s) && IN(b, s) && IN(c, s) && !(a == b) && !(b == c) && !(a == c) \226\134\146 IN(three_cycle(a, b, c), group_carrier(H))) \226\134\146 (\226\136\128 a : A, \226\136\128 b : A, \226\136\128 c : A, IN(a, s) && IN(b, s) && IN(c, s) && !(a == b) && !(b == c) && !(a == c) \226\134\146 IN(three_cycle(a, b, c), n))
      #|  (z : A)
      #|  (y : A)
      #|  (x : A)
      #|  (z : A)
      #|  (y : A)
      #|  (x : A)
      #|  (y : A)
      #|  (x : A)
      #|  !SUBSET((s : (A) -> Bool), {(x : A), (y : A)}) \226\134\146 (\226\136\131 z : A, IN(z, s) && !(z == x) && !(z == y))
      #|  \226\136\131 z : A, IN(z, (s : (A) -> Bool)) && !(z == (x : A)) && !(z == (y : A))
      #|  (x : A)
      #|  !SUBSET((s : (A) -> Bool), {(x : A)}) \226\134\146 (\226\136\131 y : A, IN(y, s) && !(y == x))
      #|  \226\136\131 y : A, IN(y, (s : (A) -> Bool)) && !(y == (x : A))
      #|  \226\136\131 x : A, IN(x, (s : (A) -> Bool))
      #|  (k : Num)
      #|  subgroup_generated(symmetric_group((s : (A) -> Bool)), (c : (Num, (A) -> A) -> Bool)((i : Num)))
      #|  (c : (Num, (A) -> A) -> Bool)((i : Num))
      #|  (c : (Num, (A) -> A) -> Bool)(SUC((i : Num)))
      #|  symmetric_group((s : (A) -> Bool))
      #|  subgroup_of((c : (Num, (A) -> A) -> Bool)(SUC((i : Num))), symmetric_group((s : (A) -> Bool))) && SUBSET(c(SUC(i)), c(i))
      #|  subgroup_of((c : (Num, (A) -> A) -> Bool)(SUC((i : Num))), subgroup_generated(symmetric_group((s : (A) -> Bool)), c(i)))
      #|  (i : Num)
      #|  normal_subgroup_of((c : (Num, (A) -> A) -> Bool)(SUC((i : Num))), subgroup_generated(symmetric_group((s : (A) -> Bool)), c(i))) && abelian_group(quotient_group(subgroup_generated(symmetric_group(s), c(i)), c(SUC(i))))
      #|  (i : Num) < (k : Num)
      #|  (i : Num) <= (k : Num)
      #|  \226\136\128 i : Num, i <= (k : Num) \226\134\146 subgroup_of((c : (Num, (A) -> A) -> Bool)(i), symmetric_group((s : (A) -> Bool))) && (\226\136\128 a : A, \226\136\128 b : A, \226\136\128 c' : A, IN(a, s) && IN(b, s) && IN(c', s) && !(a == b) && !(b == c') && !(a == c') \226\134\146 IN(three_cycle(a, b, c'), c(i)))
      #|  (c : (Num, (A) -> A) -> Bool)
      #|  (k : Num)
      #|  \226\136\128 s : (A) -> Bool, FINITE(s) && 5 <= CARD(s) \226\134\146 !solvable_group(symmetric_group(s))
      #|  swap(((x : A), (y : A))) == o(swap(((a : A), x)), o(swap((a, y)), swap((a, x))))
      #|  (x : A) == (y : A)
      #|  (y : A) == (a : A)
      #|  (x : A) == (a : A)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 a : A, \226\136\128 h : ((A) -> A) -> Bool, IN(a, s) && subgroup_of(h, symmetric_group(s)) && (\226\136\128 x : A, IN(x, s) && !(x == a) \226\134\146 IN(swap((a, x)), h)) \226\134\146 (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && !(x == y) \226\134\146 IN(swap((x, y)), h))
      #|  (g : (A) -> A)
      #|  (f : (A) -> A)
      #|  (t : (A) -> Bool)
      #|  (s : (A) -> Bool)
      #|  (g : (A) -> A)
      #|  (f : (A) -> A)
      #|  (f : (A) -> A)
      #|  (t : (A) -> Bool)
      #|  (s : (A) -> Bool)
      #|  (f : (A) -> A)
      #|  (f : (A) -> A)
      #|  (t : (A) -> Bool)
      #|  (s : (A) -> Bool)
      #|  (f : (A) -> A)
      #|  \226\136\128 f : (A) -> A, IN(f, (h : ((A) -> A) -> Bool)) \226\134\146 permutes(f, (s : (A) -> Bool))
      #|  group_carrier(subgroup_generated(symmetric_group((s : (A) -> Bool)), (h : ((A) -> A) -> Bool))) == h
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 h : ((A) -> A) -> Bool, FINITE(t) && SUBSET(t, s) && subgroup_of(h, symmetric_group(s)) && (\226\136\128 f : (A) -> A, IN(f, h) \226\134\146 IMAGE(f, t) == t) \226\134\146 group_homomorphism((subgroup_generated(symmetric_group(s), h), symmetric_group(t)), (f : (A) -> A) => (x : A) => if IN(x, t) { f(x) } else { x })
      #|  o((p : (A) -> A), (q : (A) -> A)) == group_mul(symmetric_group((s : (A) -> Bool)), p, q)
      #|  (t : (A) -> Bool)
      #|  IN((p : (A) -> A), group_carrier(symmetric_group((s : (A) -> Bool)))) && IN((q : (A) -> A), group_carrier(symmetric_group(s)))
      #|  (q : (A) -> A)
      #|  (p : (A) -> A)
      #|  inverse((p : (A) -> A)) == group_inv(symmetric_group((s : (A) -> Bool)), p)
      #|  (t : (A) -> Bool)
      #|  IN((p : (A) -> A), group_carrier(symmetric_group((s : (A) -> Bool))))
      #|  (p : (A) -> A)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 h : ((A) -> A) -> Bool, SUBSET(t, s) && subgroup_of(h, symmetric_group(s)) \226\134\146 subgroup_of(INTER(h, group_carrier(symmetric_group(t))), symmetric_group(t))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 h : ((A) -> A) -> Bool, FINITE(s) && subgroup_of(h, symmetric_group(s)) && (\226\136\128 a : A, \226\136\128 b : A, IN(a, s) && IN(b, s) && !(a == b) \226\134\146 IN(swap((a, b)), h)) \226\134\146 SUBSET(group_carrier(symmetric_group(s)), h)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, \226\136\128 sigma : (A) -> A, \226\136\128 n : Num, group_pow(symmetric_group(s), sigma, n) == group_pow(symmetric_group(t), sigma, n)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 sigma : (A) -> A, \226\136\128 n : Num, \226\136\128 a : A, permutes(sigma, s) && IN(a, s) \226\134\146 IN(group_pow(symmetric_group(s), sigma, n, a), s)
      #|  !((p : Num) == 0) && !(p == 1) \226\134\146 !(p <= p - 1)
      #|  (sigma : (A) -> A)
      #|  symmetric_group(DELETE((s : (A) -> Bool), (a : A)))
      #|  FINITE(group_carrier(symmetric_group(DELETE((s : (A) -> Bool), (a : A)))))
      #|  divides(CARD((s : (A) -> Bool)), FACT(CARD(s) - 1))
      #|  symmetric_group((s : (A) -> Bool))
      #|  (sigma : (A) -> A)
      #|  symmetric_group(DELETE((s : (A) -> Bool), (a : A)))
      #|  group_element_order(symmetric_group(DELETE((s : (A) -> Bool), (a : A))), (sigma : (A) -> A)) == 1 || group_element_order(symmetric_group(DELETE(s, a)), sigma) == CARD(s)
      #|  divides(group_element_order(symmetric_group(DELETE((s : (A) -> Bool), (a : A))), (sigma : (A) -> A)), CARD(s))
      #|  CARD((s : (A) -> Bool))
      #|  (sigma : (A) -> A)
      #|  (s : (A) -> Bool)
      #|  DELETE((s : (A) -> Bool), (a : A))
      #|  group_pow(symmetric_group(DELETE((s : (A) -> Bool), (a : A))), (sigma : (A) -> A), CARD(s)) == group_id(symmetric_group(DELETE(s, a)))
      #|  group_pow(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A), CARD(s)) == group_id(symmetric_group(s))
      #|  IN((sigma : (A) -> A), group_carrier(symmetric_group(DELETE((s : (A) -> Bool), (a : A)))))
      #|  (s : (A) -> Bool)
      #|  permutes((sigma : (A) -> A), DELETE((s : (A) -> Bool), (a : A)))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 sigma : (A) -> A, \226\136\128 a : A, FINITE(s) && prime(CARD(s)) && permutes(sigma, s) && group_element_order(symmetric_group(s), sigma) == CARD(s) && IN(a, s) \226\134\146 !(sigma(a) == a)
      #|  (d : Num)
      #|  CARD((s : (A) -> Bool))
      #|  gcd((CARD((s : (A) -> Bool)), (d : Num))) == 1
      #|  0 < (d : Num) \226\134\146 !(d == 0)
      #|  (d : Num)
      #|  (sigma : (A) -> A)
      #|  symmetric_group((s : (A) -> Bool))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 sigma : (A) -> A, \226\136\128 d : Num, FINITE(s) && prime(CARD(s)) && permutes(sigma, s) && group_element_order(symmetric_group(s), sigma) == CARD(s) && 0 < d && d < CARD(s) \226\134\146 group_element_order(symmetric_group(s), group_pow(symmetric_group(s), sigma, d)) == CARD(s)
      #|  (a : A)
      #|  group_pow(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A), (d : Num))
      #|  (s : (A) -> Bool)
      #|  group_element_order(symmetric_group((s : (A) -> Bool)), group_pow(symmetric_group(s), (sigma : (A) -> A), (d : Num))) == CARD(s)
      #|  (d : Num)
      #|  (sigma : (A) -> A)
      #|  symmetric_group((s : (A) -> Bool))
      #|  permutes(group_pow(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A), (d : Num)), s)
      #|  group_pow(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A), (i : Num)) == o(group_pow(symmetric_group(s), sigma, (j : Num)), group_pow(symmetric_group(s), sigma, i - j))
      #|  (j : Num)
      #|  (sigma : (A) -> A)
      #|  symmetric_group((s : (A) -> Bool))
      #|  (s : (A) -> Bool)
      #|  group_pow(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A), (j : Num))
      #|  !((i : Num) < (j : Num)) && !(i == j) \226\134\146 j + (i - j) == i
      #|  (i : Num) - (j : Num)
      #|  (j : Num)
      #|  (sigma : (A) -> A)
      #|  symmetric_group((s : (A) -> Bool))
      #|  (i : Num) - (j : Num)
      #|  group_pow(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A), (j : Num)) == o(group_pow(symmetric_group(s), sigma, (i : Num)), group_pow(symmetric_group(s), sigma, j - i))
      #|  (i : Num)
      #|  (sigma : (A) -> A)
      #|  symmetric_group((s : (A) -> Bool))
      #|  (s : (A) -> Bool)
      #|  group_pow(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A), (i : Num))
      #|  (i : Num) < (j : Num) \226\134\146 i + (j - i) == j
      #|  (j : Num) - (i : Num)
      #|  (i : Num)
      #|  (sigma : (A) -> A)
      #|  symmetric_group((s : (A) -> Bool))
      #|  (j : Num) - (i : Num)
      #|  (i : Num) < (j : Num)
      #|  \226\136\131 d : Num, 0 < d && d < CARD((s : (A) -> Bool)) && group_pow(symmetric_group(s), (sigma : (A) -> A), d, (a : A)) == a
      #|  (i : Num) == (j : Num)
      #|  (j : Num)
      #|  (i : Num)
      #|  CARD({(k : Num) | k < CARD((s : (A) -> Bool))})
      #|  (x : A)
      #|  IMAGE((k : Num) => group_pow(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A), k, (a : A)), {(k : Num) | k < CARD(s)}) == s
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 sigma : (A) -> A, \226\136\128 a : A, \226\136\128 x : A, FINITE(s) && prime(CARD(s)) && permutes(sigma, s) && group_element_order(symmetric_group(s), sigma) == CARD(s) && IN(a, s) && IN(x, s) \226\134\146 (\226\136\131 k : Num, k < CARD(s) && group_pow(symmetric_group(s), sigma, k, a) == x)
      #|  (a : A)
      #|  group_pow(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A), (j : Num) - (i : Num), (a : A))
      #|  (a : A)
      #|  (a : A)
      #|  group_pow(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A), (i : Num) - (j : Num), (a : A))
      #|  (a : A)
      #|  (b : A)
      #|  (a : A)
      #|  (s : (A) -> Bool)
      #|  group_pow(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A), (k : Num))
      #|  swap((group_pow(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A), (k : Num), (a : A)), group_pow(symmetric_group(s), sigma, k, (b : A)))) == group_conjugation(symmetric_group(s), group_pow(symmetric_group(s), sigma, k), swap((a, b)))
      #|  (k : Num)
      #|  (sigma : (A) -> A)
      #|  symmetric_group((s : (A) -> Bool))
      #|  permutes(group_pow(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A), (k : Num)), s)
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 sigma : (A) -> A, \226\136\128 a : A, \226\136\128 b : A, \226\136\128 h : ((A) -> A) -> Bool, \226\136\128 k : Num, FINITE(s) && subgroup_of(h, symmetric_group(s)) && permutes(sigma, s) && IN(sigma, h) && IN(swap((a, b)), h) && IN(a, s) && IN(b, s) \226\134\146 IN(swap((group_pow(symmetric_group(s), sigma, k, a), group_pow(symmetric_group(s), sigma, k, b))), h)
      #|  swap(((a : A), (tau : (A) -> A)((x0 : A)))) == group_mul(symmetric_group((s : (A) -> Bool)), swap((a, x0)), group_mul(symmetric_group(s), swap((x0, tau(x0))), swap((a, x0))))
      #|  (tau : (A) -> A)
      #|  symmetric_group((s : (A) -> Bool))
      #|  1
      #|  (k : Num)
      #|  (tau : (A) -> A)
      #|  symmetric_group((s : (A) -> Bool))
      #|  (tau : (A) -> A)(group_pow(symmetric_group((s : (A) -> Bool)), tau, (k : Num), (a : A))) == group_pow(symmetric_group(s), tau, SUC(k), a)
      #|  (tau : (A) -> A)(group_pow(symmetric_group((s : (A) -> Bool)), tau, (k : Num), (a : A))) == group_pow(symmetric_group(s), tau, k, tau(a))
      #|  (tau : (A) -> A)(group_pow(symmetric_group((s : (A) -> Bool)), tau, (k : Num), (a : A))) == group_pow(symmetric_group(s), tau, k, (b : A))
      #|  IN(swap(((x0 : A), (tau : (A) -> A)(x0))), (h : ((A) -> A) -> Bool))
      #|  (x0 : A)
      #|  (tau : (A) -> A)
      #|  (s : (A) -> Bool)
      #|  !((tau : (A) -> A)((x0 : A)) == x0)
      #|  SUC((k : Num))
      #|  (tau : (A) -> A)
      #|  (s : (A) -> Bool)
      #|  SUC((k : Num))
      #|  (tau : (A) -> A)
      #|  symmetric_group((s : (A) -> Bool))
      #|  (a : A)
      #|  group_pow(symmetric_group((s : (A) -> Bool)), (tau : (A) -> A), SUC((k : Num)))
      #|  (s : (A) -> Bool)
      #|  (tau : (A) -> A)(group_pow(symmetric_group((s : (A) -> Bool)), tau, (k : Num), (a : A))) == group_pow(symmetric_group(s), tau, SUC(k), a)
      #|  !((tau : (A) -> A)((x0 : A)) == (a : A))
      #|  (k : Num)
      #|  (tau : (A) -> A)
      #|  (s : (A) -> Bool)
      #|  (k : Num)
      #|  (tau : (A) -> A)
      #|  symmetric_group((s : (A) -> Bool))
      #|  (a : A)
      #|  group_pow(symmetric_group((s : (A) -> Bool)), (tau : (A) -> A), (k : Num))
      #|  (s : (A) -> Bool)
      #|  !((x0 : A) == (a : A))
      #|  IN((x0 : A), (s : (A) -> Bool))
      #|  (x0 : A) == group_pow(symmetric_group((s : (A) -> Bool)), (tau : (A) -> A), (k : Num), (a : A))
      #|  group_pow(symmetric_group((s : (A) -> Bool)), (tau : (A) -> A), SUC((k : Num)), (a : A)) == tau(group_pow(symmetric_group(s), tau, k, a))
      #|  IN(swap(((a : A), group_pow(symmetric_group((s : (A) -> Bool)), (tau : (A) -> A), (k : Num), a))), (h : ((A) -> A) -> Bool))
      #|  (k : Num) == 0
      #|  \226\136\128 k : Num, 0 < k && k < CARD((s : (A) -> Bool)) \226\134\146 IN(swap(((a : A), group_pow(symmetric_group(s), (tau : (A) -> A), k, a))), (h : ((A) -> A) -> Bool))
      #|  group_pow(symmetric_group((s : (A) -> Bool)), (tau : (A) -> A), (n : Num), (a : A)) == (c : A)
      #|  group_pow(symmetric_group((s : (A) -> Bool)), (tau : (A) -> A), (n : Num), (a : A)) == (c : A)
      #|  (n : Num) == 0
      #|  0 < (n : Num)
      #|  (n : Num)
      #|  (c : A)
      #|  (a : A)
      #|  (tau : (A) -> A)
      #|  (s : (A) -> Bool)
      #|  IN(swap(((a : A), (b : A))), (h : ((A) -> A) -> Bool))
      #|  IN((tau : (A) -> A), (h : ((A) -> A) -> Bool))
      #|  (tau : (A) -> A)((a : A)) == (b : A)
      #|  (m : Num)
      #|  (sigma : (A) -> A)
      #|  (s : (A) -> Bool)
      #|  group_element_order(symmetric_group((s : (A) -> Bool)), (tau : (A) -> A)) == CARD(s)
      #|  (m : Num)
      #|  (sigma : (A) -> A)
      #|  symmetric_group((s : (A) -> Bool))
      #|  permutes((tau : (A) -> A), (s : (A) -> Bool))
      #|  (tau : (A) -> A) == group_pow(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A), (m : Num))
      #|  group_pow(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A), (m : Num), (a : A)) == (b : A)
      #|  (m : Num) == 0
      #|  0 < (m : Num)
      #|  (m : Num)
      #|  (b : A)
      #|  (a : A)
      #|  (sigma : (A) -> A)
      #|  (s : (A) -> Bool)
      #|  (c : A)
      #|  swap(((x' : A), (y' : A))) == group_mul(symmetric_group((s : (A) -> Bool)), swap(((a : A), x')), group_mul(symmetric_group(s), swap((a, y')), swap((a, x'))))
      #|  (y' : A) == (a : A)
      #|  (x' : A) == (a : A)
      #|  (y' : A)
      #|  (x' : A)
      #|  \226\136\128 x : A, IN(x, (s : (A) -> Bool)) && !(x == (a : A)) \226\134\146 IN(swap((a, x)), (h : ((A) -> A) -> Bool))
      #|  (h : ((A) -> A) -> Bool)
      #|  symmetric_group((s : (A) -> Bool))
      #|  permutes((sigma : (A) -> A), (s : (A) -> Bool))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 sigma : (A) -> A, \226\136\128 a : A, \226\136\128 b : A, \226\136\128 h : ((A) -> A) -> Bool, FINITE(s) && prime(CARD(s)) && subgroup_of(h, symmetric_group(s)) && IN(sigma, h) && group_element_order(symmetric_group(s), sigma) == CARD(s) && IN(swap((a, b)), h) && IN(a, s) && IN(b, s) && !(a == b) \226\134\146 SUBSET(group_carrier(symmetric_group(s)), h)
      #|  (b : A)
      #|  (a : A)
      #|  (sigma : (A) -> A)
      #|  IN((sigma : (A) -> A), (h : ((A) -> A) -> Bool))
      #|  group_element_order((H : Group[(A) -> A]), (sigma : (A) -> A)) == CARD((s : (A) -> Bool))
      #|  group_element_order(symmetric_group((s : (A) -> Bool)), (sigma : (A) -> A)) == CARD(s)
      #|  (sigma : (A) -> A)
      #|  CARD((s : (A) -> Bool))
      #|  (H : Group[(A) -> A])
      #|  CARD(group_stabilizer((H : Group[(A) -> A]), (f : (A) -> A) => (x : A) => f(x), (a : A)))
      #|  (a : A)
      #|  (f : (A) -> A) => (x : A) => f(x)
      #|  (s : (A) -> Bool)
      #|  (H : Group[(A) -> A])
      #|  divides(CARD((s : (A) -> Bool)), CARD((h : ((A) -> A) -> Bool)))
      #|  (sigma : (A) -> A)
      #|  (sigma : (A) -> A)
      #|  (y : A)
      #|  (a : A)
      #|  (y : A)
      #|  group_orbit((H : Group[(A) -> A]), (s : (A) -> Bool), (f : (A) -> A) => (x : A) => f(x), (a : A)) == s
      #|  group_action((H : Group[(A) -> A]), (s : (A) -> Bool), (f : (A) -> A) => (x : A) => f(x))
      #|  FINITE(group_carrier((H : Group[(A) -> A])))
      #|  group_carrier((H : Group[(A) -> A])) == (h : ((A) -> A) -> Bool)
      #|  (H : Group[(A) -> A]) == subgroup_generated(symmetric_group((s : (A) -> Bool)), (h : ((A) -> A) -> Bool))
      #|  group_carrier(symmetric_group((s : (A) -> Bool)))
      #|  FINITE((h : ((A) -> A) -> Bool))
      #|  \226\136\128 s : (A) -> Bool, \226\136\128 a : A, \226\136\128 b : A, \226\136\128 h : ((A) -> A) -> Bool, FINITE(s) && prime(CARD(s)) && subgroup_of(h, symmetric_group(s)) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) \226\134\146 (\226\136\131 sigma : (A) -> A, IN(sigma, h) && sigma(x) == y)) && IN(swap((a, b)), h) && IN(a, s) && IN(b, s) && !(a == b) \226\134\146 SUBSET(group_carrier(symmetric_group(s)), h)
      #|symmetric_group =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(group(fun('A,'A)),fun(group(fun('A,'A)),bool)) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool))) (#group:fun(prod(fun(fun('A,'A),bool),prod(fun('A,'A),prod(fun(fun('A,'A),fun('A,'A)),fun(fun('A,'A),fun(fun('A,'A),fun('A,'A)))))),group(fun('A,'A))) ((#,:fun(fun(fun('A,'A),bool),fun(prod(fun('A,'A),prod(fun(fun('A,'A),fun('A,'A)),fun(fun('A,'A),fun(fun('A,'A),fun('A,'A))))),prod(fun(fun('A,'A),bool),prod(fun('A,'A),prod(fun(fun('A,'A),fun('A,'A)),fun(fun('A,'A),fun(fun('A,'A),fun('A,'A)))))))) (#GSPEC:fun(fun(fun('A,'A),bool),fun(fun('A,'A),bool)) (\GEN%PVAR%1:fun('A,'A). (#?:fun(fun(fun('A,'A),bool),bool) (\p:fun('A,'A). (((#SETSPEC:fun(fun('A,'A),fun(bool,fun(fun('A,'A),bool))) GEN%PVAR%1:fun('A,'A)) ((#permutes:fun(fun('A,'A),fun(fun('A,bool),bool)) p:fun('A,'A)) s:fun('A,bool))) p:fun('A,'A))))))) ((#,:fun(fun('A,'A),fun(prod(fun(fun('A,'A),fun('A,'A)),fun(fun('A,'A),fun(fun('A,'A),fun('A,'A)))),prod(fun('A,'A),prod(fun(fun('A,'A),fun('A,'A)),fun(fun('A,'A),fun(fun('A,'A),fun('A,'A))))))) #I:fun('A,'A)) ((#,:fun(fun(fun('A,'A),fun('A,'A)),fun(fun(fun('A,'A),fun(fun('A,'A),fun('A,'A))),prod(fun(fun('A,'A),fun('A,'A)),fun(fun('A,'A),fun(fun('A,'A),fun('A,'A)))))) #inverse:fun(fun('A,'A),fun('A,'A))) #o:fun(fun('A,'A),fun(fun('A,'A),fun('A,'A))))))))))
      #|SYMMETRIC_GROUP =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun(fun('A,'A),bool),fun(fun(fun('A,'A),bool),bool)) (#group_carrier:fun(group(fun('A,'A)),fun(fun('A,'A),bool)) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool)))) (#GSPEC:fun(fun(fun('A,'A),bool),fun(fun('A,'A),bool)) (\GEN%PVAR%2:fun('A,'A). (#?:fun(fun(fun('A,'A),bool),bool) (\p:fun('A,'A). (((#SETSPEC:fun(fun('A,'A),fun(bool,fun(fun('A,'A),bool))) GEN%PVAR%2:fun('A,'A)) ((#permutes:fun(fun('A,'A),fun(fun('A,bool),bool)) p:fun('A,'A)) s:fun('A,bool))) p:fun('A,'A)))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,'A),fun(fun('A,'A),bool)) (#group_id:fun(group(fun('A,'A)),fun('A,'A)) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool)))) #I:fun('A,'A))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun(fun('A,'A),fun('A,'A)),fun(fun(fun('A,'A),fun('A,'A)),bool)) (#group_inv:fun(group(fun('A,'A)),fun(fun('A,'A),fun('A,'A))) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool)))) #inverse:fun(fun('A,'A),fun('A,'A)))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun(fun('A,'A),fun(fun('A,'A),fun('A,'A))),fun(fun(fun('A,'A),fun(fun('A,'A),fun('A,'A))),bool)) (#group_mul:fun(group(fun('A,'A)),fun(fun('A,'A),fun(fun('A,'A),fun('A,'A)))) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool)))) #o:fun(fun('A,'A),fun(fun('A,'A),fun('A,'A)))))))))
      #|FINITE_SYMMETRIC_GROUP =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) (#FINITE:fun(fun(fun('A,'A),bool),bool) (#group_carrier:fun(group(fun('A,'A)),fun(fun('A,'A),bool)) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool)))))))
      #|CARD_SYMMETRIC_GROUP =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(num,fun(num,bool)) (#CARD:fun(fun(fun('A,'A),bool),num) (#group_carrier:fun(group(fun('A,'A)),fun(fun('A,'A),bool)) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool))))) (#FACT:fun(num,num) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))))))
      #|SYMMETRIC_GROUP_MUL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'A),bool),bool) (\p:fun('A,'A). (#forall:fun(fun(fun('A,'A),bool),bool) (\q:fun('A,'A). ((#=:fun(fun('A,'A),fun(fun('A,'A),bool)) (((#group_mul:fun(group(fun('A,'A)),fun(fun('A,'A),fun(fun('A,'A),fun('A,'A)))) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool))) p:fun('A,'A)) q:fun('A,'A))) ((#o:fun(fun('A,'A),fun(fun('A,'A),fun('A,'A))) p:fun('A,'A)) q:fun('A,'A)))))))))
      #|SYMMETRIC_GROUP_INV =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'A),bool),bool) (\p:fun('A,'A). ((#=:fun(fun('A,'A),fun(fun('A,'A),bool)) ((#group_inv:fun(group(fun('A,'A)),fun(fun('A,'A),fun('A,'A))) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool))) p:fun('A,'A))) (#inverse:fun(fun('A,'A),fun('A,'A)) p:fun('A,'A)))))))
      #|SYMMETRIC_GROUP_ID =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(fun('A,'A),fun(fun('A,'A),bool)) (#group_id:fun(group(fun('A,'A)),fun('A,'A)) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool)))) #I:fun('A,'A))))
      #|SWAP_IN_SYMMETRIC_GROUP =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('A,bool),bool) (\b:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) b:'A) s:fun('A,bool)))) ((#IN:fun(fun('A,'A),fun(fun(fun('A,'A),bool),bool)) (#swap:fun(prod('A,'A),fun('A,'A)) ((#,:fun('A,fun('A,prod('A,'A))) a:'A) b:'A))) (#group_carrier:fun(group(fun('A,'A)),fun(fun('A,'A),bool)) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool)))))))))))
      #|THREE_CYCLE_IN_SYMMETRIC =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('A,bool),bool) (\b:'A. (#forall:fun(fun('A,bool),bool) (\c:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) b:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) c:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) a:'A) b:'A))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) b:'A) c:'A))) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) a:'A) c:'A)))))))) ((#IN:fun(fun('A,'A),fun(fun(fun('A,'A),bool),bool)) (((#three_cycle:fun('A,fun('A,fun('A,fun('A,'A)))) a:'A) b:'A) c:'A)) (#group_carrier:fun(group(fun('A,'A)),fun(fun('A,'A),bool)) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool)))))))))))))
      #|CAYLEY_THEOREM_EXPLICIT =  |- (#forall:fun(fun(group('A),bool),bool) (\G:group('A). ((#group_monomorphism:fun(prod(group('A),group(fun('A,'A))),fun(fun('A,fun('A,'A)),bool)) ((#,:fun(group('A),fun(group(fun('A,'A)),prod(group('A),group(fun('A,'A))))) G:group('A)) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) (#group_carrier:fun(group('A),fun('A,bool)) G:group('A))))) (\a:'A. (\x:'A. (((#COND:fun(bool,fun('A,fun('A,'A))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (#group_carrier:fun(group('A),fun('A,bool)) G:group('A)))) (((#group_mul:fun(group('A),fun('A,fun('A,'A))) G:group('A)) a:'A) x:'A)) x:'A))))))
      #|CAYLEY_THEOREM =  |- (#forall:fun(fun(group('A),bool),bool) (\G:group('A). (#?:fun(fun(fun(fun('A,'A),bool),bool),bool) (\h:fun(fun('A,'A),bool). ((#/\:fun(bool,fun(bool,bool)) ((#subgroup_of:fun(fun(fun('A,'A),bool),fun(group(fun('A,'A)),bool)) h:fun(fun('A,'A),bool)) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) (#group_carrier:fun(group('A),fun('A,bool)) G:group('A))))) ((#isomorphic_group:fun(group(fun('A,'A)),fun(group('A),bool)) ((#subgroup_generated:fun(group(fun('A,'A)),fun(fun(fun('A,'A),bool),group(fun('A,'A)))) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) (#group_carrier:fun(group('A),fun('A,bool)) G:group('A)))) h:fun(fun('A,'A),bool))) G:group('A)))))))
      #|SYMMETRIC_GROUP_ACTION =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (((#group_action:fun(group(fun('A,'A)),fun(fun('A,bool),fun(fun(fun('A,'A),fun('A,'A)),bool))) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool))) s:fun('A,bool)) (\f:fun('A,'A). (\x:'A. (f:fun('A,'A) x:'A))))))
      #|CHAIN_STEP_THREE_CYCLES_GEN =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(group(fun('A,'A)),bool),bool) (\H:group(fun('A,'A)). (#forall:fun(fun(fun(fun('A,'A),bool),bool),bool) (\n:fun(fun('A,'A),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#normal_subgroup_of:fun(fun(fun('A,'A),bool),fun(group(fun('A,'A)),bool)) n:fun(fun('A,'A),bool)) H:group(fun('A,'A)))) ((#/\:fun(bool,fun(bool,bool)) (#abelian_group:fun(group(fun(fun('A,'A),bool)),bool) ((#quotient_group:fun(group(fun('A,'A)),fun(fun(fun('A,'A),bool),group(fun(fun('A,'A),bool)))) H:group(fun('A,'A))) n:fun(fun('A,'A),bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(fun('A,'A),fun(fun('A,'A),fun('A,'A))),fun(fun(fun('A,'A),fun(fun('A,'A),fun('A,'A))),bool)) (#group_mul:fun(group(fun('A,'A)),fun(fun('A,'A),fun(fun('A,'A),fun('A,'A)))) H:group(fun('A,'A)))) #o:fun(fun('A,'A),fun(fun('A,'A),fun('A,'A))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(fun('A,'A),fun('A,'A)),fun(fun(fun('A,'A),fun('A,'A)),bool)) (#group_inv:fun(group(fun('A,'A)),fun(fun('A,'A),fun('A,'A))) H:group(fun('A,'A)))) #inverse:fun(fun('A,'A),fun('A,'A)))) (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('A,bool),bool) (\b:'A. (#forall:fun(fun('A,bool),bool) (\c:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) b:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) c:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) a:'A) b:'A))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) b:'A) c:'A))) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) a:'A) c:'A)))))))) ((#IN:fun(fun('A,'A),fun(fun(fun('A,'A),bool),bool)) (((#three_cycle:fun('A,fun('A,fun('A,fun('A,'A)))) a:'A) b:'A) c:'A)) (#group_carrier:fun(group(fun('A,'A)),fun(fun('A,'A),bool)) H:group(fun('A,'A)))))))))))))))))) (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('A,bool),bool) (\b:'A. (#forall:fun(fun('A,bool),bool) (\c:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) b:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) c:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) a:'A) b:'A))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) b:'A) c:'A))) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) a:'A) c:'A)))))))) ((#IN:fun(fun('A,'A),fun(fun(fun('A,'A),bool),bool)) (((#three_cycle:fun('A,fun('A,fun('A,fun('A,'A)))) a:'A) b:'A) c:'A)) n:fun(fun('A,'A),bool))))))))))))))))
      #|NOT_SOLVABLE_SYMMETRIC_GROUP =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))))) (#~:fun(bool,bool) (#solvable_group:fun(group(fun('A,'A)),bool) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool)))))))
      #|POINT_TRANSPOSITIONS_GENERATE_ALL =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun(fun(fun('A,'A),bool),bool),bool) (\h:fun(fun('A,'A),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#subgroup_of:fun(fun(fun('A,'A),bool),fun(group(fun('A,'A)),bool)) h:fun(fun('A,'A),bool)) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) x:'A) a:'A)))) ((#IN:fun(fun('A,'A),fun(fun(fun('A,'A),bool),bool)) (#swap:fun(prod('A,'A),fun('A,'A)) ((#,:fun('A,fun('A,prod('A,'A))) a:'A) x:'A))) h:fun(fun('A,'A),bool)))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))) ((#IN:fun(fun('A,'A),fun(fun(fun('A,'A),bool),bool)) (#swap:fun(prod('A,'A),fun('A,'A)) ((#,:fun('A,fun('A,prod('A,'A))) x:'A) y:'A))) h:fun(fun('A,'A),bool))))))))))))))
      #|RESTRICT_SYMMETRIC_GROUP_HOMOMORPHISM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun(fun('A,'A),bool),bool),bool) (\h:fun(fun('A,'A),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#subgroup_of:fun(fun(fun('A,'A),bool),fun(group(fun('A,'A)),bool)) h:fun(fun('A,'A),bool)) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool)))) (#forall:fun(fun(fun('A,'A),bool),bool) (\f:fun('A,'A). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,'A),fun(fun(fun('A,'A),bool),bool)) f:fun('A,'A)) h:fun(fun('A,'A),bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#IMAGE:fun(fun('A,'A),fun(fun('A,bool),fun('A,bool))) f:fun('A,'A)) t:fun('A,bool))) t:fun('A,bool))))))))) ((#group_homomorphism:fun(prod(group(fun('A,'A)),group(fun('A,'A))),fun(fun(fun('A,'A),fun('A,'A)),bool)) ((#,:fun(group(fun('A,'A)),fun(group(fun('A,'A)),prod(group(fun('A,'A)),group(fun('A,'A))))) ((#subgroup_generated:fun(group(fun('A,'A)),fun(fun(fun('A,'A),bool),group(fun('A,'A)))) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool))) h:fun(fun('A,'A),bool))) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) t:fun('A,bool)))) (\f:fun('A,'A). (\x:'A. (((#COND:fun(bool,fun('A,fun('A,'A))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))) (f:fun('A,'A) x:'A)) x:'A)))))))))))
      #|SUBGROUP_RESTRICT_PERMUTES =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun(fun('A,'A),bool),bool),bool) (\h:fun(fun('A,'A),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) ((#subgroup_of:fun(fun(fun('A,'A),bool),fun(group(fun('A,'A)),bool)) h:fun(fun('A,'A),bool)) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool))))) ((#subgroup_of:fun(fun(fun('A,'A),bool),fun(group(fun('A,'A)),bool)) ((#INTER:fun(fun(fun('A,'A),bool),fun(fun(fun('A,'A),bool),fun(fun('A,'A),bool))) h:fun(fun('A,'A),bool)) (#group_carrier:fun(group(fun('A,'A)),fun(fun('A,'A),bool)) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) t:fun('A,bool))))) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) t:fun('A,bool))))))))))
      #|ALL_TRANSPOSITIONS_GENERATE_SYMMETRIC =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun(fun('A,'A),bool),bool),bool) (\h:fun(fun('A,'A),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#subgroup_of:fun(fun(fun('A,'A),bool),fun(group(fun('A,'A)),bool)) h:fun(fun('A,'A),bool)) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('A,bool),bool) (\b:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) b:'A) s:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) a:'A) b:'A))))) ((#IN:fun(fun('A,'A),fun(fun(fun('A,'A),bool),bool)) (#swap:fun(prod('A,'A),fun('A,'A)) ((#,:fun('A,fun('A,prod('A,'A))) a:'A) b:'A))) h:fun(fun('A,'A),bool)))))))))) ((#SUBSET:fun(fun(fun('A,'A),bool),fun(fun(fun('A,'A),bool),bool)) (#group_carrier:fun(group(fun('A,'A)),fun(fun('A,'A),bool)) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool)))) h:fun(fun('A,'A),bool)))))))
      #|SYMMETRIC_GROUP_POW =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). (#forall:fun(fun(fun('A,'A),bool),bool) (\sigma:fun('A,'A). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(fun('A,'A),fun(fun('A,'A),bool)) (((#group_pow:fun(group(fun('A,'A)),fun(fun('A,'A),fun(num,fun('A,'A)))) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool))) sigma:fun('A,'A)) n:num)) (((#group_pow:fun(group(fun('A,'A)),fun(fun('A,'A),fun(num,fun('A,'A)))) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) t:fun('A,bool))) sigma:fun('A,'A)) n:num))))))))))
      #|SYMMETRIC_GROUP_POW_IN =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'A),bool),bool) (\sigma:fun('A,'A). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#permutes:fun(fun('A,'A),fun(fun('A,bool),bool)) sigma:fun('A,'A)) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool)))) ((#IN:fun('A,fun(fun('A,bool),bool)) ((((#group_pow:fun(group(fun('A,'A)),fun(fun('A,'A),fun(num,fun('A,'A)))) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool))) sigma:fun('A,'A)) n:num) a:'A)) s:fun('A,bool)))))))))))
      #|PRIME_ORDER_PERM_NO_FIXPOINT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'A),bool),bool) (\sigma:fun('A,'A). (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#permutes:fun(fun('A,'A),fun(fun('A,bool),bool)) sigma:fun('A,'A)) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#group_element_order:fun(group(fun('A,'A)),fun(fun('A,'A),num)) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool))) sigma:fun('A,'A))) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))))))) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) (sigma:fun('A,'A) a:'A)) a:'A)))))))))
      #|PRIME_ORDER_POW_PERM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'A),bool),bool) (\sigma:fun('A,'A). (#forall:fun(fun(num,bool),bool) (\d:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#permutes:fun(fun('A,'A),fun(fun('A,bool),bool)) sigma:fun('A,'A)) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#group_element_order:fun(group(fun('A,'A)),fun(fun('A,'A),num)) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool))) sigma:fun('A,'A))) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) d:num)) ((#<:fun(num,fun(num,bool)) d:num) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))))))))) ((#=:fun(num,fun(num,bool)) ((#group_element_order:fun(group(fun('A,'A)),fun(fun('A,'A),num)) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool))) (((#group_pow:fun(group(fun('A,'A)),fun(fun('A,'A),fun(num,fun('A,'A)))) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool))) sigma:fun('A,'A)) d:num))) (#CARD:fun(fun('A,bool),num) s:fun('A,bool))))))))))
      #|PRIME_ORDER_PERM_ORBIT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'A),bool),bool) (\sigma:fun('A,'A). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#permutes:fun(fun('A,'A),fun(fun('A,bool),bool)) sigma:fun('A,'A)) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#group_element_order:fun(group(fun('A,'A)),fun(fun('A,'A),num)) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool))) sigma:fun('A,'A))) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool)))))))) (#?:fun(fun(num,bool),bool) (\k:num. ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) k:num) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))) ((#=:fun('A,fun('A,bool)) ((((#group_pow:fun(group(fun('A,'A)),fun(fun('A,'A),fun(num,fun('A,'A)))) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool))) sigma:fun('A,'A)) k:num) a:'A)) x:'A)))))))))))))
      #|SWAP_CONJUGATE_IN_SUBGROUP =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'A),bool),bool) (\sigma:fun('A,'A). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('A,bool),bool) (\b:'A. (#forall:fun(fun(fun(fun('A,'A),bool),bool),bool) (\h:fun(fun('A,'A),bool). (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#subgroup_of:fun(fun(fun('A,'A),bool),fun(group(fun('A,'A)),bool)) h:fun(fun('A,'A),bool)) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#permutes:fun(fun('A,'A),fun(fun('A,bool),bool)) sigma:fun('A,'A)) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,'A),fun(fun(fun('A,'A),bool),bool)) sigma:fun('A,'A)) h:fun(fun('A,'A),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,'A),fun(fun(fun('A,'A),bool),bool)) (#swap:fun(prod('A,'A),fun('A,'A)) ((#,:fun('A,fun('A,prod('A,'A))) a:'A) b:'A))) h:fun(fun('A,'A),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) b:'A) s:fun('A,bool))))))))) ((#IN:fun(fun('A,'A),fun(fun(fun('A,'A),bool),bool)) (#swap:fun(prod('A,'A),fun('A,'A)) ((#,:fun('A,fun('A,prod('A,'A))) ((((#group_pow:fun(group(fun('A,'A)),fun(fun('A,'A),fun(num,fun('A,'A)))) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool))) sigma:fun('A,'A)) k:num) a:'A)) ((((#group_pow:fun(group(fun('A,'A)),fun(fun('A,'A),fun(num,fun('A,'A)))) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool))) sigma:fun('A,'A)) k:num) b:'A)))) h:fun(fun('A,'A),bool)))))))))))))))
      #|TRANSPOSITION_PCYCLE_GENERATES =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,'A),bool),bool) (\sigma:fun('A,'A). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('A,bool),bool) (\b:'A. (#forall:fun(fun(fun(fun('A,'A),bool),bool),bool) (\h:fun(fun('A,'A),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#subgroup_of:fun(fun(fun('A,'A),bool),fun(group(fun('A,'A)),bool)) h:fun(fun('A,'A),bool)) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,'A),fun(fun(fun('A,'A),bool),bool)) sigma:fun('A,'A)) h:fun(fun('A,'A),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#group_element_order:fun(group(fun('A,'A)),fun(fun('A,'A),num)) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool))) sigma:fun('A,'A))) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,'A),fun(fun(fun('A,'A),bool),bool)) (#swap:fun(prod('A,'A),fun('A,'A)) ((#,:fun('A,fun('A,prod('A,'A))) a:'A) b:'A))) h:fun(fun('A,'A),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) b:'A) s:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) a:'A) b:'A))))))))))) ((#SUBSET:fun(fun(fun('A,'A),bool),fun(fun(fun('A,'A),bool),bool)) (#group_carrier:fun(group(fun('A,'A)),fun(fun('A,'A),bool)) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool)))) h:fun(fun('A,'A),bool)))))))))))))
      #|TRANSITIVE_TRANSPOSITION_GENERATES_SYMMETRIC =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('A,bool),bool) (\b:'A. (#forall:fun(fun(fun(fun('A,'A),bool),bool),bool) (\h:fun(fun('A,'A),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) (#CARD:fun(fun('A,bool),num) s:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#subgroup_of:fun(fun(fun('A,'A),bool),fun(group(fun('A,'A)),bool)) h:fun(fun('A,'A),bool)) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool)))) (#?:fun(fun(fun('A,'A),bool),bool) (\sigma:fun('A,'A). ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,'A),fun(fun(fun('A,'A),bool),bool)) sigma:fun('A,'A)) h:fun(fun('A,'A),bool))) ((#=:fun('A,fun('A,bool)) (sigma:fun('A,'A) x:'A)) y:'A)))))))))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,'A),fun(fun(fun('A,'A),bool),bool)) (#swap:fun(prod('A,'A),fun('A,'A)) ((#,:fun('A,fun('A,prod('A,'A))) a:'A) b:'A))) h:fun(fun('A,'A),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) b:'A) s:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) a:'A) b:'A)))))))))) ((#SUBSET:fun(fun(fun('A,'A),bool),fun(fun(fun('A,'A),bool),bool)) (#group_carrier:fun(group(fun('A,'A)),fun(fun('A,'A),bool)) (#symmetric_group:fun(fun('A,bool),group(fun('A,'A))) s:fun('A,bool)))) h:fun(fun('A,'A),bool)))))))))))
      #|types = group/1 frag/1 tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = symmetric_group short_exact_sequence group_exactness solvable_group free_abelian_group pgroup integer_mod_group integer_group finitely_generated_group cyclic_group group_element_order trivial_homomorphism group_image group_kernel quotient_group group_normalizer group_centralizer group_conjugate normal_subgroup_of left_coset right_coset group_orbit group_stabilizer group_action group_setmul group_setinv isomorphic_group group_automorphism group_isomorphism group_isomorphisms group_endomorphism group_epimorphism group_monomorphism group_homomorphism sum_group product_group prod_group subgroup_generated subgroup_of group_conjugation group_sum group_product group_nmul group_add group_neg abelian_group group_zpow group_pow group_div opposite_group trivial_group singleton_group group_mul group_inv group_id group_carrier group_operations group index ^_c *_c +_c ordinal linseg inseg properly strictly antichain chain wqoset woset toset poset qoset fld frag_extend frag_sub frag_add frag_cmul frag_neg frag_of frag_0 frag_support dest_frag mk_frag sign evenperm permutation swapseq three_cycle swap inverse permutes superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 352
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?1
      #|counter_genvar = _547829:bool
      #|
    ),
  )
}
