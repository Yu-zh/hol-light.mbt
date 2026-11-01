// Load-fidelity test for Examples/pell.ml: replays tools/ocaml_ref/Examples_pell_ref.ml
// (keep in sync; refresh with tools/ocaml_ref/refresh_ref.py).

///|
using @testkit {stm, sthm}

///|
test "Examples/pell matches Examples/pell.ml" {
  @pell.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot", "impconv", "pair", "compute", "nums", "recursion",
      "arith", "wf", "calc_num", "normalizer", "grobner", "ind_types", "lists", "realax",
      "calc_int", "realarith", "real", "calc_rat", "int", "sets", "iterate", "cart",
      "define", "Library/analysis", "Library/transc", "Library/prime", "Examples/pell",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Examples/pell")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("PELL_INDUCTION", () => sthm(@pell.pell_induction()))
  log.attempt("ROOT_NONPOWER", () => sthm(@pell.root_nonpower()))
  log.attempt("INTEGER_SUB_LEMMA", () => sthm(@pell.integer_sub_lemma()))
  log.attempt("SQRT_LINEAR_EQ", () => sthm(@pell.sqrt_linear_eq()))
  log.attempt("X_DEF", () => sthm(@pell.x_def()))
  log.attempt("X_CLAUSES", () => sthm(@pell.x_clauses()))
  log.attempt("Y_DEF", () => sthm(@pell.y_def()))
  log.attempt("Y_CLAUSES", () => sthm(@pell.y_clauses()))
  log.attempt("X_INCREASES", () => sthm(@pell.x_increases()))
  log.attempt("Y_INCREASES", () => sthm(@pell.y_increases()))
  log.attempt("XY_POWER_POS", () => sthm(@pell.xy_power_pos()))
  log.attempt("XY_POWER_NEG", () => sthm(@pell.xy_power_neg()))
  log.attempt("XY_ARE_SOLUTIONS", () => sthm(@pell.xy_are_solutions()))
  log.attempt("X_DEGENERATE", () => sthm(@pell.x_degenerate()))
  log.attempt("Y_DEGENERATE", () => sthm(@pell.y_degenerate()))
  log.attempt("REAL_ARCH_POW_MINIMAL", () => sthm(@pell.real_arch_pow_minimal()))
  log.attempt("SOLUTIONS_INDUCTION", () => sthm(@pell.solutions_induction()))
  log.attempt("SOLUTIONS_ARE_XY", () => sthm(@pell.solutions_are_xy()))
  log.attempt("ADDITION_FORMULA_POS", () => sthm(@pell.addition_formula_pos()))
  log.attempt("ADDITION_FORMULA_NEG", () => sthm(@pell.addition_formula_neg()))
  log.attempt("Y_INCREASES_SUC", () => sthm(@pell.y_increases_suc()))
  log.attempt("Y_INCREASES_LT", () => sthm(@pell.y_increases_lt()))
  log.attempt("Y_INCREASES_LE", () => sthm(@pell.y_increases_le()))
  log.attempt("Y_INJ", () => sthm(@pell.y_inj()))
  log.attempt("X_INCREASES_LE", () => sthm(@pell.x_increases_le()))
  log.attempt("X_INCREASES_LT", () => sthm(@pell.x_increases_lt()))
  log.attempt("X_INCREASES_SUC", () => sthm(@pell.x_increases_suc()))
  log.attempt("X_INJ", () => sthm(@pell.x_inj()))
  log.attempt("XY_COPRIME", () => sthm(@pell.xy_coprime()))
  log.attempt("Y_DIVIDES_LEMMA", () => sthm(@pell.y_divides_lemma()))
  log.attempt("Y_DIVIDES", () => sthm(@pell.y_divides()))
  log.attempt("BINOMIAL_TRIVIALITY", () => sthm(@pell.binomial_triviality()))
  log.attempt("Y_LOWERBOUND", () => sthm(@pell.y_lowerbound()))
  log.attempt("Y_UPPERBOUND", () => sthm(@pell.y_upperbound()))
  log.attempt("XY_Y3_CONGRUENCE", () => sthm(@pell.xy_y3_congruence()))
  log.attempt("Y2_DIVIDES", () => sthm(@pell.y2_divides()))
  log.attempt("Y_N_MOD2", () => sthm(@pell.y_n_mod2()))
  log.attempt("Y_N_MODA1", () => sthm(@pell.y_n_moda1()))
  log.attempt("X_CONGRUENT", () => sthm(@pell.x_congruent()))
  log.attempt("Y_CONGRUENT", () => sthm(@pell.y_congruent()))
  log.attempt("X_CONGRUENT_2NJ_POS", () => sthm(@pell.x_congruent_2nj_pos()))
  log.attempt("X_CONGRUENT_4NJ_POS", () => sthm(@pell.x_congruent_4nj_pos()))
  log.attempt("X_CONGRUENT_4MNJ_POS", () => sthm(@pell.x_congruent_4mnj_pos()))
  log.attempt("X_CONGRUENT_2NJ_NEG_LEMMA", () => {
    sthm(@pell.x_congruent_2nj_neg_lemma())
  })
  log.attempt("X_CONGRUENT_2NJ_NEG", () => sthm(@pell.x_congruent_2nj_neg()))
  log.attempt("XY_GCD_LEMMA", () => sthm(@pell.xy_gcd_lemma()))
  log.attempt("XY_GCD", () => sthm(@pell.xy_gcd()))
  log.attempt("STEP_DOWN_LEMMA", () => sthm(@pell.step_down_lemma()))
  log.attempt("STEP_DOWN_LEMMA_4_ASYM", () => {
    sthm(@pell.step_down_lemma_4_asym())
  })
  log.attempt("STEP_DOWN_LEMMA_4", () => sthm(@pell.step_down_lemma_4()))
  log.attempt("STEP_DOWN_LEMMA_STRONG_ASYM", () => {
    sthm(@pell.step_down_lemma_strong_asym())
  })
  log.attempt("STEP_DOWN_LEMMA_STRONG", () => {
    sthm(@pell.step_down_lemma_strong())
  })
  log.attempt("Y_DIOPH", () => sthm(@pell.y_dioph()))
  log.attempt("BINOMIALISH_LEMMA", () => sthm(@pell.binomialish_lemma()))
  log.attempt("XY_EXP_LEMMA", () => sthm(@pell.xy_exp_lemma()))
  log.attempt("ABS_LT_REPRESENTATION", () => sthm(@pell.abs_lt_representation()))
  log.attempt("Y_EQ_0", () => sthm(@pell.y_eq_0()))
  log.attempt("XY_EXP", () => sthm(@pell.xy_exp()))
  log.attempt("REAL_SUM_OF_SQUARES", () => sthm(@pell.real_sum_of_squares()))
  log.attempt("DIOPH_CONJ", () => sthm(@pell.dioph_conj()))
  log.attempt("DIOPH_DISJ", () => sthm(@pell.dioph_disj()))
  log.attempt("DIOPH_LE", () => sthm(@pell.dioph_le()))
  log.attempt("DIOPH_LT", () => sthm(@pell.dioph_lt()))
  log.attempt("DIOPH_NE", () => sthm(@pell.dioph_ne()))
  log.attempt("Y_0", () => sthm(@pell.y_0()))
  log.attempt("Y_0_TRIV", () => sthm(@pell.y_0_triv()))
  log.attempt("DIOPH_Y", () => sthm(@pell.dioph_y()))
  log.attempt("DIOPH_EXP_LEMMA", () => sthm(@pell.dioph_exp_lemma()))
  log.attempt("DIOPH_EXP", () => sthm(@pell.dioph_exp()))
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
      #|0..0..1..2..6..13..23..38..solved at 48
      #|0..0..1..2..6..13..23..38..solved at 48
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..1..3..7..solved at 13
      #|0..0..1..4..7..19..36..65..118..188..solved at 214
      #|0..0..1..5..14..27..solved at 33
      #|0..0..1..5..solved at 10
      #|0..0..1..4..13..26..solved at 32
      #|0..0..1..4..solved at 9
      #|0..0..1..3..solved at 7
      #|0..0..2..4..solved at 13
      #|0..0..2..4..solved at 9
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 8
      #|0..0..1..4..12..29..88..202..405..882..solved at 1334
      #|0..0..1..solved at 5
      #|0..0..1..3..6..15..31..56..solved at 78
      #|0..0..1..3..6..15..solved at 29
      #|0..0..1..3..6..15..31..56..solved at 78
      #|0..0..1..3..6..15..solved at 29
      #|0..0..1..2..solved at 7
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..3..9..16..29..51..76..118..203..313..478..733..1034..1488..solved at 1787
      #|0..0..0..0..0..solved at 5
      #|0..0..0..1..4..7..16..29..49..76..114..157..248..343..466..solved at 507
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..3..6..solved at 12
      #|0..0..1..3..7..solved at 13
      #|0..0..1..3..solved at 7
      #|0..0..1..4..solved at 14
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 11
      #|0..0..1..2..5..solved at 10
      #|Warning: inventing type variables
      #|0..0..1..5..11..20..63..solved at 114
      #|0..0..1..10..19..32..solved at 71
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..2..4..solved at 8
      #|0..0..1..2..3..7..12..17..24..31..38..solved at 67
      #|0..0..1..2..3..4..17..33..54..81..120..159..208..269..330..391..460..529..622..715..solved at 765
      #|0..0..1..2..3..4..17..33..54..81..120..159..208..269..330..391..460..529..622..715..solved at 741
      #|0..0..2..7..solved at 11
      #|0..0..1..5..12..25..55..solved at 99
      #|0..0..1..5..11..24..58..solved at 95
      #|0..0..1..3..6..13..28..57..102..180..290..473..750..1141..1743..2638..solved at 3072
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..solved at 10
      #|0..0..0..2..4..6..11..18..29..45..67..solved at 85
      #|0..0..solved at 2
      #|0..0..2..6..11..26..53..solved at 60
      #|0..0..2..6..12..27..72..161..326..686..solved at 784
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..3..7..solved at 12
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..3..6..solved at 10
      #|0..0..3..6..17..36..solved at 43
      #|0..0..3..7..solved at 11
      #|0..0..3..7..solved at 14
      #|0..0..2..4..solved at 8
      #|0..0..2..4..9..21..solved at 28
      #|0..0..1..2..3..4..10..19..31..54..93..151..328..solved at 441
      #|0..0..2..4..9..19..43..85..155..277..499..864..1698..solved at 1810
      #|0..0..3..11..48..120..262..615..1117..2593..4807..solved at 5684
      #|0..0..4..solved at 7
      #|0..0..solved at 6
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..6..17..51..solved at 56
      #|0..0..5..14..solved at 22
      #|0..0..5..12..solved at 18
      #|0..0..5..12..32..62..solved at 82
      #|0..0..solved at 3
      #|0..0..6..13..solved at 17
      #|0..0..4..solved at 7
      #|0..0..1..3..solved at 7
      #|0..0..5..solved at 8
      #|0..0..4..10..32..61..115..185..291..410..solved at 547
      #|0..0..4..10..30..55..105..170..256..353..solved at 389
      #|0..0..4..solved at 7
      #|0..0..4..9..25..46..90..157..255..413..668..1013..1557..solved at 1574
      #|0..0..5..solved at 8
      #|0..0..1..3..7..15..27..60..107..183..352..618..1081..1877..3199..5523..9477..16174..27871..solved at 46833
      #|0..0..2..6..15..30..74..141..267..463..solved at 505
      #|0..0..2..7..solved at 11
      #|0..0..2..5..10..21..40..70..117..188..solved at 199
      #|0..0..2..5..10..19..35..58..solved at 67
      #|0..0..2..7..solved at 11
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..7..solved at 11
      #|0..0..1..2..9..20..39..70..111..161..250..366..solved at 376
      #|0..0..solved at 2
      #|0..0..4..8..16..32..solved at 43
      #|0..0..0..1..2..3..6..12..19..29..43..57..89..145..solved at 175
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..solved at 8
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..3..7..11..15..solved at 25
      #|0..0..1..3..7..11..15..solved at 24
      #|0..0..solved at 2
      #|0..0..2..6..solved at 10
      #|0..0..1..3..solved at 10
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..7..14..solved at 19
      #|0..0..solved at 2
      #|0..0..1..2..3..4..solved at 10
      #|0..0..1..2..8..21..42..81..139..213..340..520..762..1126..1617..solved at 1830
      #|0..0..1..3..solved at 7
      #|0..0..1..2..3..4..5..8..12..16..21..26..31..solved at 42
      #|0..0..1..2..3..4..5..7..9..11..16..21..26..solved at 37
      #|0..0..1..4..solved at 10
      #|0..0..2..8..15..solved at 22
      #|0..0..2..4..11..solved at 19
      #|0..0..solved at 2
      #|0..0..1..2..3..7..13..21..34..49..69..94..123..158..212..272..347..439..546..669..833..1013..1230..1496..1799..2134..solved at 2276
      #|0..0..1..2..5..8..solved at 14
      #|0..0..1..2..4..7..solved at 13
      #|0..0..1..2..4..7..solved at 13
      #|0..0..1..2..5..8..solved at 14
      #|0..0..1..2..3..10..19..28..42..59..solved at 70
      #|0..0..1..solved at 6
      #|0..0..2..8..24..58..169..462..solved at 794
      #|0..0..2..8..24..58..169..460..solved at 794
      #|0..0..1..2..3..7..14..25..46..71..108..155..212..283..solved at 310
      #|0..0..solved at 3
      #|0..0..1..5..22..114..solved at 609
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
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
      #|0..0..2..5..12..solved at 17
      #|0..0..2..5..12..26..49..91..167..273..447..741..solved at 771
      #|0..0..3..6..solved at 10
      #|0..0..solved at 3
      #|0..0..2..5..16..40..108..260..673..1516..3706..8319..solved at 22772
      #|0..0..2..5..12..solved at 17
      #|0..0..2..5..16..40..108..260..673..1516..3706..8319..solved at 22772
      #|0..0..7..18..44..solved at 50
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..9..20..solved at 42
      #|0..0..1..2..8..15..solved at 21
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..4..8..30..71..230..solved at 264
      #|0..0..1..4..11..solved at 29
      #|0..0..1..2..9..solved at 14
      #|0..0..1..2..solved at 6
      #|0..0..4..8..30..71..230..solved at 264
      #|0..0..solved at 2
      #|0..0..4..8..solved at 13
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 3 critical pairs
      #|5 basis elements and 2 critical pairs
      #|5 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|4 basis elements and 3 critical pairs
      #|5 basis elements and 2 critical pairs
      #|5 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Translating certificate to HOL inferences
      #|0..0..4..9..27..58..solved at 65
      #|0..0..6..12..solved at 16
      #|0..0..1..2..7..15..solved at 21
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..0..0..0..solved at 5
      #|Examples/pell quotations (1059):
      #|  SUC((n : Num) + 1) == n + 2
      #|  \226\136\128 n : Num, (P : (Num) -> Bool)(n) && P(n + 1)
      #|  (P : (Num) -> Bool)(0) && P(1) && (\226\136\128 n : Num, P(n) && P(n + 1) \226\134\146 P(n + 2)) \226\134\146 (\226\136\128 n : Num, P(n))
      #|  EXP((a : Num) * (q : Num), (n : Num)) == (d : Num) * EXP(q, n)
      #|  (a : Num)
      #|  (a : Num)
      #|  (d : Num)
      #|  (p : Num)
      #|  (q : Num)
      #|  (n : Num)
      #|  (n : Num) == 0
      #|  \226\136\128 p : Num, \226\136\128 q : Num, \226\136\128 d : Num, \226\136\128 n : Num, !(q == 0) && EXP(p, n) == d * EXP(q, n) \226\134\146 (\226\136\131 a : Num, d == EXP(a, n))
      #|  (x : Num) - (y : Num)
      #|  (y : Num) - (x : Num)
      #|  real_of_num((y : Num))
      #|  real_of_num((x : Num))
      #|  \226\136\128 x : Num, \226\136\128 y : Num, \226\136\131 n : Num, pow(real_of_num(x) - real_of_num(y), 2) == pow(real_of_num(n), 2)
      #|  pow(real_of_num((y : Num)) - real_of_num((v : Num)), 2) == pow(real_of_num(0), 2)
      #|  pow(real_of_num((u : Num)) - real_of_num((x : Num)), 2) == pow(real_of_num(0), 2)
      #|  EXP((p : Num), 2) == EXP(0, 2) * (EXP((a : Num), 2) - 1)
      #|  2 <= (a : Num)
      #|  (b : Num)
      #|  (a : Num)
      #|  (c : Num)
      #|  real_pow
      #|  2
      #|  (a : Real) * a == (b : Real) * b + real_of_num(1) \226\134\146 (a + b) * (a - b) == real_of_num(1)
      #|  (a : Num) - (b : Num) == 1 \226\134\146 a == b + 1
      #|  (a : Num)
      #|  (a : Num) - 1 == (b : Num) \226\134\146 1 < a \226\134\146 a - b == 1
      #|  (b : Num)
      #|  !(b : Bool) && ((a : Bool) \226\134\146 (c : Bool)) \226\134\146 (!a \226\134\146 b) \226\134\146 c
      #|  2
      #|  EXP((a : Num), 2) - 1
      #|  (q : Num)
      #|  (p : Num)
      #|  2 <= (a : Num) \226\134\146 1 <= a
      #|  pow(real_of_num((a : Num)), 2) - real_of_num(1) == real_of_num(EXP(a, 2) - 1)
      #|  (v : Num)
      #|  (y : Num)
      #|  (q : Num)
      #|  (x : Num)
      #|  (u : Num)
      #|  (p : Num)
      #|  2 <= (a : Num) \226\134\146 1 <= a
      #|  real_pow
      #|  2
      #|  ((a : Real) + (b : Real) == (c : Real) + (d : Real)) == (a - c == d - b)
      #|  \226\136\128 a : Num, \226\136\128 u : Num, \226\136\128 v : Num, \226\136\128 x : Num, \226\136\128 y : Num, 2 <= a \226\134\146 (real_of_num(u) + real_of_num(v) * sqrt(pow(real_of_num(a), 2) - real_of_num(1)) == real_of_num(x) + real_of_num(y) * sqrt(pow(real_of_num(a), 2) - real_of_num(1))) == (u == x && v == y)
      #|  ((n : Num) - (m : Num) < n) == (!(m == 0) && !(n == 0))
      #|  \226\136\128 a : Num, \226\136\131 X : (Num) -> Num, \226\136\128 n : Num, X(n) == (if n == 0 { 1 } else { if n == 1 { a } else { 2 * (a * X(n - 1)) - X(n - 2) } })
      #|  (n : Num) + 2 - 2 == n && n + 2 - 1 == n + 1
      #|  !((n : Num) + 2 == 1)
      #|  (\226\136\128 a : Num, X(a, 0) == 1) && (\226\136\128 a : Num, X(a, 1) == a) && (\226\136\128 a : Num, \226\136\128 n : Num, X(a, n + 2) == 2 * (a * X(a, n + 1)) - X(a, n))
      #|  ((n : Num) - (m : Num) < n) == (!(m == 0) && !(n == 0))
      #|  \226\136\128 a : Num, \226\136\131 Y : (Num) -> Num, \226\136\128 n : Num, Y(n) == (if n == 0 { 0 } else { if n == 1 { 1 } else { 2 * (a * Y(n - 1)) - Y(n - 2) } })
      #|  (n : Num) + 2 - 2 == n && n + 2 - 1 == n + 1
      #|  !((n : Num) + 2 == 1)
      #|  (\226\136\128 a : Num, Y(a, 0) == 0) && (\226\136\128 a : Num, Y(a, 1) == 1) && (\226\136\128 a : Num, \226\136\128 n : Num, Y(a, n + 2) == 2 * (a * Y(a, n + 1)) - Y(a, n))
      #|  !((n : Num) == 0)
      #|  (n : Num) + 1 + 1 - 2 == n
      #|  !((n : Num) == 0)
      #|  (n : Num) == n - 1 + 1
      #|  (b : Num) <= (a : Num) \226\134\146 a + b <= 2 * a
      #|  (a : Num) <= (b : Num) + a
      #|  (a : Num)
      #|  (a : Num)
      #|  !((a : Num) == 0)
      #|  2 * X((a : Num), (n : Num))
      #|  (a : Num) + (b : Num) <= (c : Num) \226\134\146 a <= c - b
      #|  ((n : Num) + 1 == 1) == (n == 0)
      #|  (1 <= (a : Num)) == !(a == 0)
      #|  (n : Num) == 0
      #|  \226\136\128 a : Num, \226\136\128 n : Num, !(a == 0) \226\134\146 X(a, n) <= X(a, n + 1)
      #|  !((n : Num) == 0)
      #|  (n : Num) + 1 + 1 - 2 == n
      #|  !((n : Num) == 0)
      #|  (n : Num) == n - 1 + 1
      #|  (b : Num) <= (a : Num) \226\134\146 a + b <= 2 * a
      #|  (a : Num) <= (b : Num) + a
      #|  (a : Num)
      #|  (a : Num)
      #|  !((a : Num) == 0)
      #|  2 * Y((a : Num), (n : Num))
      #|  (a : Num) + (b : Num) <= (c : Num) \226\134\146 a <= c - b
      #|  ((n : Num) + 1 == 1) == (n == 0)
      #|  (n : Num) == 0
      #|  \226\136\128 a : Num, \226\136\128 n : Num, !(a == 0) \226\134\146 Y(a, n) <= Y(a, n + 1)
      #|  (1 <= (a : Num)) == !(a == 0)
      #|  !((n : Num) == 1)
      #|  !((n : Num) == 0)
      #|  (n : Num) == 2 + (n - 2)
      #|  (a : Real) * (b : Real) - b == (a - real_of_num(1)) * b
      #|  !((n : Num) == 0) && !(n == 1) \226\134\146 n - 1 == 1 + (n - 2)
      #|  !((n : Num) == 0) && !(n == 1) \226\134\146 n - 2 < n && n - 1 < n
      #|  (x1 : Real) - (x2 : Real) + ((y1 : Real) - (y2 : Real)) * (a : Real) == x1 + y1 * a - (x2 + y2 * a)
      #|  !((a : Num) == 0)
      #|  (n : Num) == 1 * n
      #|  !((n : Num) == 0) && !(n == 1) \226\134\146 n - 1 == n - 2 + 1
      #|  (x : Num) <= (y : Num) && y <= 2 * ((a : Num) * y) \226\134\146 x <= 2 * (a * y)
      #|  real_of_num(2 * ((a : Num) * X(a, (n : Num) - 1)) - X(a, n - 2)) == real_of_num(2 * (a * X(a, n - 1))) - real_of_num(X(a, n - 2)) && real_of_num(2 * (a * Y(a, n - 1)) - Y(a, n - 2)) == real_of_num(2 * (a * Y(a, n - 1))) - real_of_num(Y(a, n - 2))
      #|  \226\136\128 a : Num, \226\136\128 n : Num, !(a == 0) \226\134\146 real_of_num(X(a, n)) + real_of_num(Y(a, n)) * sqrt(pow(real_of_num(a), 2) - real_of_num(1)) == pow(real_of_num(a) + sqrt(pow(real_of_num(a), 2) - real_of_num(1)), n)
      #|  (1 <= (a : Num)) == !(a == 0)
      #|  !((n : Num) == 1)
      #|  !((n : Num) == 0)
      #|  (n : Num) == 2 + (n - 2)
      #|  (a : Real) * (b : Real) - b == (a - real_of_num(1)) * b
      #|  !((n : Num) == 0) && !(n == 1) \226\134\146 n - 1 == 1 + (n - 2)
      #|  !((n : Num) == 0) && !(n == 1) \226\134\146 n - 2 < n && n - 1 < n
      #|  (x1 : Real) - (x2 : Real) - ((y1 : Real) - (y2 : Real)) * (a : Real) == x1 - y1 * a - (x2 - y2 * a)
      #|  !((a : Num) == 0)
      #|  (n : Num) == 1 * n
      #|  !((n : Num) == 0) && !(n == 1) \226\134\146 n - 1 == n - 2 + 1
      #|  (x : Num) <= (y : Num) && y <= 2 * ((a : Num) * y) \226\134\146 x <= 2 * (a * y)
      #|  real_of_num(2 * ((a : Num) * X(a, (n : Num) - 1)) - X(a, n - 2)) == real_of_num(2 * (a * X(a, n - 1))) - real_of_num(X(a, n - 2)) && real_of_num(2 * (a * Y(a, n - 1)) - Y(a, n - 2)) == real_of_num(2 * (a * Y(a, n - 1))) - real_of_num(Y(a, n - 2))
      #|  \226\136\128 a : Num, \226\136\128 n : Num, !(a == 0) \226\134\146 real_of_num(X(a, n)) - real_of_num(Y(a, n)) * sqrt(pow(real_of_num(a), 2) - real_of_num(1)) == pow(real_of_num(a) - sqrt(pow(real_of_num(a), 2) - real_of_num(1)), n)
      #|  (1 <= (a : Num)) == !(a == 0)
      #|  pow(real_of_num((a : Num)), 2) - real_of_num(1) == real_of_num(EXP(a, 2) - 1)
      #|  (a : Real) - (a - real_of_num(1)) == real_of_num(1)
      #|  (1 <= (a : Num)) == !(a == 0)
      #|  (a : Real) * (b : Real) * ((c : Real) * (d : Real)) == a * c * (b * d)
      #|  ((x : Real) + (y : Real)) * (x - y) == x * x - y * y
      #|  (n : Num)
      #|  (n : Num)
      #|  \226\136\128 a : Num, \226\136\128 n : Num, !(a == 0) \226\134\146 EXP(X(a, n), 2) == (EXP(a, 2) - 1) * EXP(Y(a, n), 2) + 1
      #|  real_mul
      #|  \226\136\128 n : Num, X(1, n) == 1
      #|  \226\136\128 n : Num, Y(1, n) == n
      #|  real_of_num(1) < (x : Real) \226\134\146 real_of_num(0) < x
      #|  ln((y : Real))
      #|  ln((x : Real))
      #|  \226\136\128 x : Real, \226\136\128 y : Real, real_of_num(1) < x && real_of_num(1) < y \226\134\146 (\226\136\131 n : Num, pow(x, n) <= y && y < pow(x, SUC(n)))
      #|  !((a : Num) == 0) && !(a == 1) \226\134\146 1 < a
      #|  !((a : Num) == 0) \226\134\146 1 <= a
      #|  real_of_num(1) < (x : Real) && real_of_num(0) <= (y : Real) \226\134\146 real_of_num(1) < x + y
      #|  !((a : Num) == 0) \226\134\146 1 <= a
      #|  EXP(0, 2) == (EXP((a : Num), 2) - 1) * EXP((v : Num), 2) + 1
      #|  !((a : Num) == 0) \226\134\146 1 <= a
      #|  (real_of_num((u : Num)) + real_of_num((v : Num)) * sqrt(pow(real_of_num((a : Num)), 2) - real_of_num(1))) * real_of_num(1)
      #|  (a : Real) < (b : Real) \226\134\146 !(a == b)
      #|  real_of_num((x : Num)) + real_of_num((y : Num)) * sqrt(pow(real_of_num((a : Num)), 2) - real_of_num(1)) == (real_of_num((u : Num)) + real_of_num((v : Num)) * sqrt(pow(real_of_num(a), 2) - real_of_num(1))) * (real_of_num(a) + sqrt(pow(real_of_num(a), 2) - real_of_num(1)))
      #|  !((a : Num) == 0) && !(a == 1) \226\134\146 2 <= a
      #|  (a : Num)
      #|  (a : Bool) \226\134\146 (a && (b : Bool)) == b
      #|  2
      #|  SUC(1)
      #|  (y : Num)
      #|  (x : Num)
      #|  (a : Bool) == (b : Bool) && (!a && !b \226\134\146 false) \226\134\146 a && b
      #|  (v : Num) == (a : Num) * (y : Num) - (x : Num)
      #|  (u : Num) == (a : Num) * (x : Num) - (EXP(a, 2) - 1) * (y : Num)
      #|  !((a : Num) == 0) \226\134\146 1 <= a
      #|  pow(real_of_num((a : Num)), 2) - real_of_num(1) == real_of_num(EXP(a, 2) - 1)
      #|  (a : Real) * (b : Real) + real_of_num(1) - b * a == (x : Real) - (y : Real) \226\134\146 x == y + real_of_num(1)
      #|  !((a : Num) == 0) \226\134\146 1 <= a
      #|  pow(real_of_num((a : Num)), 2) - real_of_num(1) == real_of_num(EXP(a, 2) - 1)
      #|  (a : Real) - (a - (b : Real)) == b
      #|  !((a : Num) == 0) \226\134\146 1 <= a
      #|  (a : Real) * (b : Real) * ((c : Real) * b) == c * a * (b * b)
      #|  ((a : Real) - (b : Real)) * (a + b) == a * a - b * b
      #|  ((a : Real) + (b : Real)) * (a - b) == a * a - b * b
      #|  (a : Real) * (b : Real) * ((c : Real) * (d : Real)) == c * a * (d * b)
      #|  !((a : Num) == 0) \226\134\146 1 <= a
      #|  !((a : Num) == 0) \226\134\146 1 <= a
      #|  ((x : Real) - (y : Real) * (s : Real)) * ((a : Real) + s) == a * x - s * s * y - (a * y - x) * s
      #|  (a : Real) - (a - (b : Real)) == b
      #|  !((a : Num) == 0) \226\134\146 1 <= a
      #|  ((a : Real) - (b : Real)) * (a + b) == a * a - b * b
      #|  !((a : Num) == 0) \226\134\146 1 <= a
      #|  real_pow
      #|  2
      #|  !((a : Real) == -(b : Real)) \226\134\146 !(a + b == real_of_num(0))
      #|  real_of_num((a : Num)) + sqrt(pow(real_of_num(a), 2) - real_of_num(1))
      #|  real_of_num((x : Num)) - real_of_num((y : Num)) * sqrt(pow(real_of_num((a : Num)), 2) - real_of_num(1)) == (real_of_num(a * x - (EXP(a, 2) - 1) * y) - real_of_num(a * y - x) * sqrt(pow(real_of_num(a), 2) - real_of_num(1))) * (real_of_num(a) - sqrt(pow(real_of_num(a), 2) - real_of_num(1)))
      #|  !((a : Num) == 0) \226\134\146 1 <= a
      #|  !((a : Num) == 0) \226\134\146 1 <= a
      #|  ((x : Real) + (y : Real) * (s : Real)) * ((a : Real) - s) == a * x - s * s * y + (a * y - x) * s
      #|  (a : Real) - (a - (b : Real)) == b
      #|  !((a : Num) == 0) \226\134\146 1 <= a
      #|  ((a : Real) + (b : Real)) * (a - b) == a * a - b * b
      #|  !((a : Num) == 0) \226\134\146 1 <= a
      #|  real_pow
      #|  2
      #|  real_of_num((a : Num)) - sqrt(pow(real_of_num(a), 2) - real_of_num(1))
      #|  (d : Bool) && (d \226\134\146 (a : Bool) && (b : Bool) && (c : Bool)) \226\134\146 a && b && c && d
      #|  (EXP((a : Num), 2) - 1) * EXP((y : Num), 2) < a * ((x : Num) * y)
      #|  (EXP((a : Num), 2) - 1) * (y : Num) <= a * (x : Num)
      #|  ((a : Num) - 1 < a) == !(a == 0)
      #|  SUC(1)
      #|  (y : Num)
      #|  (x : Num)
      #|  (x : Num) <= (a : Num) * (y : Num)
      #|  (a : Num) * (y : Num) - (x : Num)
      #|  (a : Num) * (x : Num) - (EXP(a, 2) - 1) * (y : Num)
      #|  \226\136\128 a : Num, \226\136\128 x : Num, \226\136\128 y : Num, !(a == 0) && !(a == 1) && !(y == 0) && EXP(x, 2) == (EXP(a, 2) - 1) * EXP(y, 2) + 1 \226\134\146 (\226\136\131 x' : Num, \226\136\131 y' : Num, x' < x && y' < y && EXP(x', 2) == (EXP(a, 2) - 1) * EXP(y', 2) + 1 && real_of_num(x) + real_of_num(y) * sqrt(pow(real_of_num(a), 2) - real_of_num(1)) == (real_of_num(x') + real_of_num(y') * sqrt(pow(real_of_num(a), 2) - real_of_num(1))) * (real_of_num(a) + sqrt(pow(real_of_num(a), 2) - real_of_num(1))))
      #|  real_mul
      #|  !((a : Num) == 0) && !(a == 1) \226\134\146 2 <= a
      #|  (n : Num)
      #|  SUC((n : Num))
      #|  (n : Num)
      #|  (x1 : Num)
      #|  (y1 : Num)
      #|  (y1 : Num)
      #|  (x1 : Num)
      #|  (y0 : Num)
      #|  (x0 : Num)
      #|  (a : Num)
      #|  0
      #|  (y0 : Num) == 0
      #|  (x0 : Num)
      #|  (y0 : Num)
      #|  (y : Num)
      #|  (y : Num)
      #|  (x : Num)
      #|  (x : Num)
      #|  EXP((x : Num), 2) == (EXP((a : Num), 2) - 1) * EXP((y : Num), 2) + 1
      #|  \226\136\131 n : Num, real_of_num((x : Num)) + real_of_num((y : Num)) * sqrt(pow(real_of_num((a : Num)), 2) - real_of_num(1)) == pow(real_of_num(a) + sqrt(pow(real_of_num(a), 2) - real_of_num(1)), n)
      #|  (a : Num) == 1
      #|  \226\136\128 a : Num, \226\136\128 x : Num, \226\136\128 y : Num, !(a == 0) && EXP(x, 2) == (EXP(a, 2) - 1) * EXP(y, 2) + 1 \226\134\146 (\226\136\131 n : Num, x == X(a, n) && y == Y(a, n))
      #|  !((a : Num) == 0) && !(a == 1) \226\134\146 2 <= a
      #|  !((a : Num) == 0) \226\134\146 1 <= a
      #|  pow(real_of_num((a : Num)), 2) - real_of_num(1) == real_of_num(EXP(a, 2) - 1)
      #|  !((a : Num) == 0) \226\134\146 1 <= a
      #|  pow(real_of_num((a : Num)), 2) - real_of_num(1) == real_of_num(EXP(a, 2) - 1)
      #|  !((a : Num) == 0) \226\134\146 1 <= a
      #|  ((a : Real) + (b : Real) * (s : Real)) * ((c : Real) + (d : Real) * s) == a * c + s * s * (b * d) + (a * d + b * c) * s
      #|  (n : Num)
      #|  (a : Num)
      #|  (m : Num)
      #|  (a : Num)
      #|  (m : Num) + (n : Num)
      #|  (a : Num)
      #|  (a : Num) == 1
      #|  \226\136\128 a : Num, \226\136\128 m : Num, \226\136\128 n : Num, !(a == 0) \226\134\146 X(a, m + n) == X(a, m) * X(a, n) + (EXP(a, 2) - 1) * (Y(a, m) * Y(a, n)) && Y(a, m + n) == X(a, m) * Y(a, n) + X(a, n) * Y(a, m)
      #|  !((a : Num) == 0) && !(a == 1) \226\134\146 2 <= a
      #|  !((a : Num) == 0) \226\134\146 1 <= a
      #|  pow(real_of_num((a : Num)), 2) - real_of_num(1) == real_of_num(EXP(a, 2) - 1)
      #|  !((a : Num) == 0) \226\134\146 1 <= a
      #|  pow(real_of_num((a : Num)), 2) - real_of_num(1) == real_of_num(EXP(a, 2) - 1)
      #|  ((a : Real) + (b : Real) * (s : Real) == (x1 : Real) - (x2 : Real) + ((y1 : Real) - (y2 : Real)) * s) == (a + x2 + (b + y2) * s == x1 + y1 * s)
      #|  !((a : Num) == 0) \226\134\146 1 <= a
      #|  ((a : Real) - (b : Real) * (s : Real)) * ((c : Real) + (d : Real) * s) == a * c - s * s * (b * d) + (a * d - b * c) * s
      #|  (n : Num)
      #|  (a : Num)
      #|  (m : Num)
      #|  (a : Num)
      #|  (m : Num) <= (n : Num) \226\134\146 m + (n - m) == n
      #|  (x : Real) - (x - real_of_num(1)) == real_of_num(1)
      #|  !((a : Num) == 0) \226\134\146 1 <= a
      #|  ((x : Real) - (y : Real)) * (x + y) == x * x - y * y
      #|  op_star(pow((real_of_num((a : Num)) - sqrt(pow(real_of_num(a), 2) - real_of_num(1))) * (real_of_num(a) + sqrt(pow(real_of_num(a), 2) - real_of_num(1))), (m : Num)))
      #|  (n : Num) - (m : Num)
      #|  (a : Num)
      #|  (a : Num) == 1
      #|  \226\136\128 a : Num, \226\136\128 m : Num, \226\136\128 n : Num, !(a == 0) && m <= n \226\134\146 X(a, n - m) == X(a, m) * X(a, n) - (EXP(a, 2) - 1) * (Y(a, m) * Y(a, n)) && Y(a, n - m) == X(a, m) * Y(a, n) - X(a, n) * Y(a, m)
      #|  (n : Num)
      #|  (n : Num)
      #|  X((a : Num), 0)
      #|  \226\136\128 n : Num, n == 1 && n <= (m : Num) \226\134\146 !(m == 0)
      #|  (1 <= (a : Num)) == !(a == 0)
      #|  1 * (y : Num) <= (ay : Num) && !((x : Num) == 0) \226\134\146 y < x * 1 + ay
      #|  \226\136\128 a : Num, \226\136\128 n : Num, !(a == 0) \226\134\146 Y(a, n) < Y(a, SUC(n))
      #|  (d : Num)
      #|  (d : Num)
      #|  (m : Num) + SUC((d : Num)) == SUC(m) + d
      #|  Y((a : Num), SUC((m : Num)))
      #|  (d : Num)
      #|  \226\136\128 a : Num, \226\136\128 m : Num, \226\136\128 n : Num, !(a == 0) && m < n \226\134\146 Y(a, m) < Y(a, n)
      #|  \226\136\128 a : Num, \226\136\128 m : Num, \226\136\128 n : Num, !(a == 0) && m <= n \226\134\146 Y(a, m) <= Y(a, n)
      #|  (a : Num)
      #|  \226\136\128 a : Num, \226\136\128 m : Num, \226\136\128 n : Num, !(a == 0) \226\134\146 (Y(a, m) == Y(a, n)) == (m == n)
      #|  (d : Num)
      #|  (d : Num)
      #|  (d : Num)
      #|  \226\136\128 a : Num, \226\136\128 m : Num, \226\136\128 n : Num, !(a == 0) && m <= n \226\134\146 X(a, m) <= X(a, n)
      #|  !((a : Num) == 1)
      #|  !((a : Num) == 0)
      #|  (a : Num) == 1 * a
      #|  X((a : Num), SUC((p : Num)))
      #|  (a : Num) <= (b : Num) && (c : Num) < b \226\134\146 a < 2 * b - c
      #|  SUC(SUC((p : Num))) == p + 2
      #|  !((a : Num) == 0) && !(a == 1) \226\134\146 1 < a
      #|  (p : Num)
      #|  (m : Num)
      #|  X((a : Num), SUC((m : Num)))
      #|  \226\136\128 a : Num, \226\136\128 m : Num, \226\136\128 n : Num, !(a == 0) && !(a == 1) && m < n \226\134\146 X(a, m) < X(a, n)
      #|  \226\136\128 a : Num, \226\136\128 n : Num, !(a == 0) && !(a == 1) \226\134\146 X(a, n) < X(a, SUC(n))
      #|  (a : Num)
      #|  \226\136\128 a : Num, \226\136\128 m : Num, \226\136\128 n : Num, !(a == 0) && !(a == 1) \226\134\146 (X(a, m) == X(a, n)) == (m == n)
      #|  (a : Num) == (b : Num) + 1 \226\134\146 a - b == 1
      #|  (a : Num) * ((d : Num) * ((x : Num) * (d * x))) == d * (d * (a * (x * x)))
      #|  (d : Num)
      #|  ((a : Bool) \226\134\146 (b : Bool)) == (!b \226\134\146 !a)
      #|  (n : Num)
      #|  \226\136\128 a : Num, \226\136\128 n : Num, !(a == 0) \226\134\146 coprime((X(a, n), Y(a, n)))
      #|  X((a : Num), (n : Num)) * (d : Num) + X(a, n * (k : Num))
      #|  (d : Num)
      #|  divides(Y((a : Num), (n : Num)), Y(a, n * (k : Num)))
      #|  \226\136\128 a : Num, \226\136\128 k : Num, \226\136\128 n : Num, !(a == 0) \226\134\146 divides(Y(a, n), Y(a, n * k))
      #|  (d : Num)
      #|  ((a : Bool) \226\134\146 (b : Bool)) == (!b \226\134\146 !a)
      #|  (q : Num) * (m : Num)
      #|  (a : Num)
      #|  X((a : Num), (r : Num)) * Y(a, (q : Num) * (m : Num))
      #|  (!(a : Bool) \226\134\146 !(b : Bool)) == (b \226\134\146 a)
      #|  !divides(Y((a : Num), (m : Num)), X(a, (q : Num) * m) * Y(a, (r : Num)))
      #|  (r : Num) == 0
      #|  (r : Num) == MOD((n : Num), (m : Num))
      #|  (q : Num) == DIV((n : Num), (m : Num))
      #|  (m : Num)
      #|  (n : Num)
      #|  (1 <= (n : Num)) == !(n == 0)
      #|  Y((a : Num), 1)
      #|  \226\136\128 n : Num, n == 1 && n <= (m : Num) \226\134\146 !(m == 0)
      #|  (m : Num) == 0
      #|  (n : Num) == 0
      #|  ((a : Bool) \226\134\146 (b : Bool)) == (!b \226\134\146 !a)
      #|  \226\136\128 a : Num, \226\136\128 m : Num, \226\136\128 n : Num, !(a == 0) \226\134\146 divides(Y(a, m), Y(a, n)) == divides(m, n)
      #|  DIV(((n : Num) + 1) * (n + 2), 2) * ((d : Num) * EXP((x : Num), n)) + ((p : Num) * (y : Num) + (q : Num) * x)
      #|  (p : Num) * (x : Num) + (q : Num) * ((y : Num) * (d : Num))
      #|  (y : Real) * ((s : Real) * ((nn : Real) * ((xn : Real) * ((y2 : Real) * (d : Real))))) == nn * (d * (xn * (y * y2 * s)))
      #|  (q : Real) * ((y3 : Real) * ((s : Real) * ((y : Real) * s))) == q * (y * (y3 * (s * s)))
      #|  EVEN(((n : Num) + 1) * (n + 2))
      #|  (n : Num) * n + (3 * n + 2) == (n + 1) * (n + 2)
      #|  ((x : Num) + (5 * (n : Num) + 6) == ((y : Num) + (n + 2)) * 2) == (x + (3 * n + 2) == 2 * y)
      #|  ((n : Num) + 2) * (n + 3) == n * n + (5 * n + 6)
      #|  0
      #|  real_of_num(DIV(((n : Num) + 1) * (n + 2), 2)) + real_of_num(n + 2) == real_of_num(DIV((n + 2) * (n + 3), 2))
      #|  (x : Real) * ((n12 : Real) * ((xn : Real) * ((y2 : Real) * (d : Real)))) + ((y : Real) * ((s : Real) * ((n2 : Real) * ((xn1 : Real) * (y * s)))) + (a : Real)) == n12 * (x * xn * (y2 * d)) + n2 * (xn1 * (y * y * (s * s))) + a
      #|  (n : Num) + 2 + 1 == n + 3
      #|  real_of_num((n : Num)) * (x : Real) + x == (real_of_num(n) + real_of_num(1)) * x
      #|  SUC((n : Num)) + (m : Num) == n + SUC(m)
      #|  SUC((n : Num) + (m : Num)) == n + SUC(m)
      #|  (x : Real) * ((n2 : Real) * ((xn1 : Real) * ((y : Real) * (d : Real)))) + y * d * (xn2 : Real) == (n2 * (x * xn1) + xn2) * (y * d)
      #|  ((x : Real) + (y : Real)) * ((xn : Real) + ((xn1 : Real) + ((xn2 : Real) + ((p : Real) + (q : Real))))) == x * xn + (x * xn1 + y * xn + (x * xn2 + y * xn1 + (y * xn2 + (p * x + q * y) + (p * y + q * x))))
      #|  (q : Num)
      #|  (p : Num)
      #|  (a : Real) * (b : Real) * (a * b) == a * a * (b * b)
      #|  ((x : Real) + (y : Real)) * (x + y) == x * x + (real_of_num(2) * (x * y) + y * y)
      #|  0
      #|  \226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 d : Num, \226\136\128 n : Num, \226\136\131 p : Num, \226\136\131 q : Num, pow(real_of_num(x) + real_of_num(y) * sqrt(real_of_num(d)), n + 2) == pow(real_of_num(x), n + 2) + (real_of_num(n + 2) * (pow(real_of_num(x), n + 1) * (real_of_num(y) * sqrt(real_of_num(d)))) + (real_of_num(DIV((n + 1) * (n + 2), 2)) * (pow(real_of_num(x), n) * (pow(real_of_num(y), 2) * real_of_num(d))) + (real_of_num(p) * pow(real_of_num(y), 3) + real_of_num(q) * (pow(real_of_num(y), 3) * sqrt(real_of_num(d))))))
      #|  (a : Num) <= (b : Num) \226\134\146 (c : Num) - b <= c - a
      #|  (2 * (a : Num) - 1) * Y(a, (n : Num) + 1)
      #|  SUC((n : Num)) + 1 == n + 2
      #|  (a : Num) == 0
      #|  \226\136\128 a : Num, \226\136\128 n : Num, EXP(2 * a - 1, n) <= Y(a, n + 1)
      #|  (a : Num) <= (b : Num) \226\134\146 a - (c : Num) <= b
      #|  SUC((n : Num) + 1) == n + 2
      #|  \226\136\128 a : Num, \226\136\128 n : Num, Y(a, n + 1) <= EXP(2 * a, n)
      #|  (q : Num)
      #|  (d : Num) + 2 - 1 == d + 1
      #|  !((p : Num) == 0) && !(p == 1) \226\134\146 2 <= p
      #|  !((a : Num) == 0) \226\134\146 1 <= a
      #|  pow(real_of_num((a : Num)), 2) - real_of_num(1) == real_of_num(EXP(a, 2) - 1)
      #|  !((a : Num) == 0) \226\134\146 1 <= a
      #|  pow(real_of_num((a : Num)), 2) - real_of_num(1) == real_of_num(EXP(a, 2) - 1)
      #|  (x1 : Real) + ((y1 : Real) + ((x2 : Real) + ((x3 : Real) + (y2 : Real)))) == x1 + (x2 + x3) + (y1 + y2)
      #|  (q : Num)
      #|  (p : Num)
      #|  !((a : Num) == 0) \226\134\146 1 <= a
      #|  pow(real_of_num((a : Num)), 2) - real_of_num(1) == real_of_num(EXP(a, 2) - 1)
      #|  (d : Num)
      #|  EXP((a : Num), 2) - 1
      #|  Y((a : Num), (n : Num))
      #|  X((a : Num), (n : Num))
      #|  (d : Num)
      #|  !((k : Num) == 1)
      #|  !((k : Num) == 0)
      #|  2 <= (k : Num)
      #|  (n : Num)
      #|  (a : Num)
      #|  (n : Num) * (k : Num)
      #|  (a : Num)
      #|  0
      #|  (k : Num) == 1
      #|  0
      #|  (a : Num) == 1
      #|  0
      #|  (k : Num) == 0
      #|  \226\136\128 a : Num, \226\136\128 n : Num, \226\136\128 k : Num, !(a == 0) \226\134\146 (\226\136\131 q : Num, Y(a, n * k) == k * (EXP(X(a, n), k - 1) * Y(a, n)) + q * EXP(Y(a, n), 3))
      #|  EXP(X((a : Num), (m : Num)), (k : Num) - 1)
      #|  3
      #|  divides(EXP(Y((a : Num), (m : Num)), 2), (k : Num) * (EXP(X(a, m), k - 1) * Y(a, m)))
      #|  (q : Num)
      #|  (k : Num)
      #|  (m : Num)
      #|  (a : Num)
      #|  (k : Num)
      #|  divides(EXP(Y((a : Num), (m : Num)), 2), Y(a, (n : Num)))
      #|  divides(Y((a : Num), (m : Num)), Y(a, (n : Num)))
      #|  divides((m : Num), (n : Num))
      #|  \226\136\128 c : Bool, ((a : Bool) \226\134\146 c) && ((b : Bool) \226\134\146 c) && (c \226\134\146 a == b) \226\134\146 a == b
      #|  !(Y((a : Num), (m : Num)) == 0)
      #|  (m : Num) == 0
      #|  \226\136\128 a : Num, \226\136\128 m : Num, \226\136\128 n : Num, !(a == 0) \226\134\146 divides(EXP(Y(a, m), 2), Y(a, n)) == divides(m * Y(a, m), n)
      #|  SUC((a : Num)) - 1 == a
      #|  (a : Num)
      #|  (a : Num)
      #|  !((a : Num) == 0)
      #|  !((a : Num) == 0)
      #|  (n : Num) == 1 * n
      #|  !((a : Num) == 0)
      #|  (n : Num) == 1 * n
      #|  (x : Num) <= (u : Num) && (y : Num) <= (v : Num) \226\134\146 2 * x + y <= 2 * u + (v + (w : Num))
      #|  (v : Num) <= (u : Num) && (y : Num) <= (x : Num) && 2 * (x + (z : Num)) + ((w : Num) + v) == 2 * y + u \226\134\146 u - v == 2 * (x - y + z) + w
      #|  2 * ((a : Num) * (q2 : Num)) - (q1 : Num) + (a - 1) * ((n : Num) + 1)
      #|  (2 * (q1 : Num) + (n : Num) <= 2 * (q2 : Num) + (n + 1)) == (q1 <= q2)
      #|  (n : Num)
      #|  (q2 : Num)
      #|  (q1 : Num)
      #|  (n : Num)
      #|  0
      #|  0
      #|  \226\136\128 a : Num, \226\136\128 n : Num, !(a == 0) \226\134\146 (\226\136\131 q : Num, Y(a, n) == 2 * q + n)
      #|  (a : Num) == 1 * a
      #|  ((a : Num) + 1 <= (b : Num)) == (a < b)
      #|  (q2 : Num) * (b : Num) + 1
      #|  ((q1 : Num) + (n : Num) <= (q2 : Num) + (n + 1)) == (q1 <= q2 + 1)
      #|  (a : Num) == 1 * a
      #|  (v : Num) <= (u : Num) && (y : Num) <= (x : Num) && u + y == (z : Num) + (x + ((w : Num) + v)) \226\134\146 u - v == z + (x - y) + w
      #|  SUC((n : Num)) - 1 == n
      #|  (SUC((n : Num)) == 1) == (n == 0)
      #|  (b : Num)
      #|  (a : Num)
      #|  !((a : Num) == 0)
      #|  !((a : Num) == 1)
      #|  2 * (n : Num) + 1
      #|  4 * ((n : Num) + 1) - (1 + n) == 3 * (n + 1)
      #|  (a : Num) + (c : Num) == (b : Num) \226\134\146 b - a == c
      #|  SUC((n : Num)) - 1 == n
      #|  (b : Num)
      #|  (a : Num)
      #|  !((a : Num) == 0)
      #|  2 * ((n : Num) + 1)
      #|  ((a : Num) - 1 == 1) == (a == 2)
      #|  ((a : Num) - 1 == 0) == (a == 0 || a == 1)
      #|  ((a : Num) <= 1) == (a == 0 || a == 1)
      #|  (q2 : Num) == 0
      #|  ((q1 : Num) + (n : Num) <= (q2 : Num) + (n + 1)) == (q1 <= q2 + 1)
      #|  (n : Num)
      #|  (q2 : Num)
      #|  (q1 : Num)
      #|  (n : Num)
      #|  0
      #|  0
      #|  (a : Num) == 1
      #|  \226\136\128 a : Num, \226\136\128 n : Num, !(a == 0) \226\134\146 (\226\136\131 q : Num, Y(a, n) == q * (a - 1) + n)
      #|  2 * ((n : Num) + 1) + (2 * ((a : Num) * (q2 : Num)) - (q1 : Num))
      #|  (1 <= (x : Num)) == !(x == 0)
      #|  (a : Num) == 1 * a
      #|  (a : Num) * ((b : Num) * ((c : Num) * (d : Num))) == a * b * (c * d)
      #|  (a : Num) <= (y : Num) \226\134\146 a <= 2 * ((x : Num) + y)
      #|  (1 <= (x : Num)) == !(x == 0)
      #|  (a : Num) == a * 1
      #|  X((a : Num) + (b : Num) * (c : Num), (n : Num) + 1)
      #|  X((a : Num) + (b : Num) * (c : Num), (n : Num))
      #|  !((a : Num) == 0)
      #|  1 * X((a : Num), (n : Num) + 1)
      #|  (a : Num) <= (x : Num) && (b : Num) <= (y : Num) + (z : Num) && x - a + (y + z - b) == (u : Num) \226\134\146 x + (y + z) - (a + b) == u
      #|  2 * (X((a : Num), (n : Num) + 1) * (b : Num)) + 2 * ((a + b * (c : Num)) * (q2 : Num)) - (q1 : Num)
      #|  2 * (((x : Num) + (y : Num)) * ((u : Num) + (v : Num))) == 2 * (x * u) + (2 * (u * y) + 2 * ((x + y) * v))
      #|  (q2 : Num)
      #|  (q1 : Num)
      #|  (n : Num)
      #|  (b : Num)
      #|  0
      #|  !((b : Num) * (c : Num) == 0)
      #|  0
      #|  (b : Num) * (c : Num) == 0
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, \226\136\128 n : Num, !(a == 0) \226\134\146 (\226\136\131 q : Num, X(a + b * c, n) == X(a, n) + q * c)
      #|  (1 <= (x : Num)) == !(x == 0)
      #|  (a : Num) == 1 * a
      #|  (a : Num) * ((b : Num) * ((c : Num) * (d : Num))) == a * b * (c * d)
      #|  (a : Num) <= (y : Num) \226\134\146 a <= 2 * ((x : Num) + y)
      #|  (1 <= (x : Num)) == !(x == 0)
      #|  (a : Num) == a * 1
      #|  Y((a : Num) + (b : Num) * (c : Num), (n : Num) + 1)
      #|  Y((a : Num) + (b : Num) * (c : Num), (n : Num))
      #|  !((a : Num) == 0)
      #|  1 * Y((a : Num), (n : Num) + 1)
      #|  (a : Num) <= (x : Num) && (b : Num) <= (y : Num) + (z : Num) && x - a + (y + z - b) == (u : Num) \226\134\146 x + (y + z) - (a + b) == u
      #|  2 * (Y((a : Num), (n : Num) + 1) * (b : Num)) + 2 * ((a + b * (c : Num)) * (q2 : Num)) - (q1 : Num)
      #|  2 * (((x : Num) + (y : Num)) * ((u : Num) + (v : Num))) == 2 * (x * u) + (2 * (u * y) + 2 * ((x + y) * v))
      #|  (q2 : Num)
      #|  (q1 : Num)
      #|  (n : Num)
      #|  0
      #|  0
      #|  !((b : Num) * (c : Num) == 0)
      #|  0
      #|  (b : Num) * (c : Num) == 0
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, \226\136\128 n : Num, !(a == 0) \226\134\146 (\226\136\131 q : Num, Y(a + b * c, n) == Y(a, n) + q * c)
      #|  (xn : Num) * (a : Num) + (xj : Num) * (xn * xn) == (a + xj * xn) * xn
      #|  (xn : Num) * (a : Num) + (d : Num) * ((yn : Num) * (xn * (yj : Num) + (xj : Num) * yn)) + xj == xn * (a + d * (yn * yj)) + xj * (d * (yn * yn) + 1)
      #|  (j : Num)
      #|  (n : Num)
      #|  (a : Num)
      #|  (n : Num) + (n + (j : Num)) == 2 * n + j
      #|  (n : Num) + (j : Num)
      #|  (n : Num)
      #|  (a : Num)
      #|  \226\136\128 a : Num, \226\136\128 n : Num, \226\136\128 j : Num, !(a == 0) \226\134\146 (\226\136\131 q : Num, X(a, 2 * n + j) + X(a, j) == q * X(a, n))
      #|  (j : Num) <= 4 * (n : Num) + j
      #|  (y : Num) + (q2 : Num) == (q1 : Num) + (x : Num) \226\134\146 x <= y \226\134\146 y == q1 - q2 + x
      #|  (q2 : Num)
      #|  (j : Num)
      #|  (n : Num)
      #|  (a : Num)
      #|  (op_plus : (Num, Num) -> Num)
      #|  X((a : Num), (j : Num))
      #|  (q1 : Num)
      #|  2 * (n : Num) + (2 * n + (j : Num)) == 4 * n + j
      #|  2 * (n : Num) + (j : Num)
      #|  (n : Num)
      #|  (a : Num)
      #|  \226\136\128 a : Num, \226\136\128 n : Num, \226\136\128 j : Num, !(a == 0) \226\134\146 (\226\136\131 q : Num, X(a, 4 * n + j) == q * X(a, n) + X(a, j))
      #|  (q2 : Num) + (q1 : Num)
      #|  (q2 : Num)
      #|  4 * ((m : Num) * (n : Num) + n) + (j : Num) == 4 * n + (4 * (m * n) + j)
      #|  4 * ((m : Num) * (n : Num)) + (j : Num)
      #|  (n : Num)
      #|  (a : Num)
      #|  (q1 : Num)
      #|  \226\136\128 n : Num, \226\136\128 j : Num, \226\136\131 q : Num, X((a : Num), 4 * ((m : Num) * n) + j) == q * X(a, n) + X(a, j)
      #|  0
      #|  \226\136\128 a : Num, \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 j : Num, !(a == 0) \226\134\146 (\226\136\131 q : Num, X(a, 4 * (m * n) + j) == q * X(a, n) + X(a, j))
      #|  (xn : Num) * ((a : Num) * ((yj : Num) * (yn : Num))) + (a * (yn * ((xj : Num) * yn)) + xj) == xj * (a * (yn * yn) + 1) + a * (yn * (xn * yj))
      #|  (a : Num)
      #|  (c : Num) == (a : Num) - (b : Num) \226\134\146 1 <= c \226\134\146 b <= a
      #|  (j : Num) <= (n : Num) \226\134\146 (1 <= n - j) == !(j == n)
      #|  (a : Num)
      #|  (c : Num) == (a : Num) - (b : Num) \226\134\146 1 <= c \226\134\146 b <= a
      #|  (b : Num) <= (a : Num) && (e : Num) <= (d : Num) && e + (a + (c : Num)) == d + b \226\134\146 a - b + c == d - e
      #|  ((xn : Num) * (a : Num) + (b : Num) + (c : Num) == (a + (d : Num)) * xn) == (b + c == xn * d)
      #|  X((a : Num), (j : Num)) * X(a, (n : Num)) - (EXP(a, 2) - 1) * (Y(a, j) * Y(a, n)) + (X(a, j) * X(a, n) - (EXP(a, 2) - 1) * (Y(a, j) * Y(a, n)))
      #|  (n : Num)
      #|  (j : Num)
      #|  (a : Num)
      #|  (j : Num) <= (n : Num) \226\134\146 n + (n - j) == 2 * n - j
      #|  (n : Num) - (j : Num)
      #|  (n : Num)
      #|  (a : Num)
      #|  2
      #|  (j : Num) == (n : Num)
      #|  \226\136\128 a : Num, \226\136\128 n : Num, \226\136\128 j : Num, !(a == 0) && j <= n \226\134\146 (\226\136\131 q : Num, X(a, 2 * n - j) + X(a, j) == q * X(a, n))
      #|  (y : Num) <= (x : Num) \226\134\146 x - (x - y) == y
      #|  !((j : Num) <= (n : Num)) \226\134\146 2 * n - j <= n
      #|  2 * (n : Num) - (j : Num)
      #|  (n : Num)
      #|  (a : Num)
      #|  (j : Num) <= (n : Num)
      #|  \226\136\128 a : Num, \226\136\128 n : Num, \226\136\128 j : Num, !(a == 0) && j <= 2 * n \226\134\146 (\226\136\131 q : Num, X(a, 2 * n - j) + X(a, j) == q * X(a, n))
      #|  (e : Num)
      #|  coprime((X((a : Num), (q : Num) * (m : Num)), Y(a, q * m)))
      #|  (e : Num)
      #|  (q : Num) * (m : Num)
      #|  (a : Num)
      #|  divides((d : Num), Y((a : Num), (q : Num) * (m : Num)))
      #|  coprime(((d : Num), X((a : Num), (q : Num) * (m : Num))))
      #|  divides((d : Num), Y((a : Num), (q : Num) * (m : Num)))
      #|  divides((d : Num), X((a : Num), (q : Num) * (m : Num)) * Y(a, (r : Num)))
      #|  ((a : Bool) \226\134\146 (b : Bool) == (c : Bool)) \226\134\146 (a && b) == (a && c)
      #|  (d : Num)
      #|  (m : Num)
      #|  (r : Num)
      #|  (r : Num) == MOD((n : Num), (m : Num))
      #|  (q : Num) == DIV((n : Num), (m : Num))
      #|  (m : Num) == 0
      #|  (m : Num)
      #|  (n : Num)
      #|  (n : Num)
      #|  (m : Num)
      #|  (a : Num) == 1
      #|  (a : Num) == 0
      #|  \226\136\128 a : Num, \226\136\128 m : Num, \226\136\128 n : Num, !(a == 0) && m < n \226\134\146 gcd((Y(a, m), Y(a, n))) == Y(a, gcd((m, n)))
      #|  (n : Num)
      #|  (m : Num)
      #|  \226\136\128 a : Num, \226\136\128 m : Num, \226\136\128 n : Num, !(a == 0) \226\134\146 gcd((Y(a, m), Y(a, n))) == Y(a, gcd((m, n)))
      #|  !((i : Num) <= (n : Num))
      #|  (1 <= (a : Num)) == !(a == 0)
      #|  1 * (xi : Num) <= (qxn : Num) && 1 <= (xj : Num) \226\134\146 !(xi == xj + qxn)
      #|  !(a : Bool) \226\134\146 a \226\134\146 (b : Bool)
      #|  (i : Num) <= (j : Num)
      #|  (j : Num) <= 2 * (n : Num)
      #|  ((a : Bool) \226\134\146 (b : Bool)) \226\134\146 a \226\134\146 b || (c : Bool)
      #|  (q2 : Num) + (q : Num) - (q1 : Num) == 0
      #|  (i : Num) <= (j : Num)
      #|  (x : Num) + (q1 : Num) == (y : Num) + (q2 : Num) \226\134\146 y <= x \226\134\146 x == y + (q2 - q1)
      #|  ((x : Num) + (i : Num) + (q1 : Num) == (q2 : Num) + ((y : Num) + ((q3 : Num) + i))) == (x + q1 == y + (q2 + q3))
      #|  (a : Num) == (b : Num) && (c : Num) == (d : Num) \226\134\146 a + d == b + c
      #|  (q2 : Num)
      #|  (i : Num)
      #|  (n : Num)
      #|  (a : Num)
      #|  (q1 : Num)
      #|  (j : Num)
      #|  (n : Num)
      #|  (a : Num)
      #|  !((a : Num) == 0)
      #|  !((a : Num) == 1)
      #|  (n : Num) < n + 1
      #|  (z : Num) < (x : Num) && 3 * x <= (y : Num) \226\134\146 2 * x < y - z
      #|  !((n : Num) == 1)
      #|  !((n : Num) == 0)
      #|  (n : Num) == n - 2 + 2
      #|  !((n : Num) == 1)
      #|  !((n : Num) == 0)
      #|  (n : Num) - 1 == n - 2 + 1
      #|  (i : Num) <= (n : Num)
      #|  !((i : Num) == (n : Num))
      #|  !((j : Num) <= (n : Num))
      #|  !((n : Num) == 0)
      #|  (a : Num) <= (c : Num) && (b : Num) <= c \226\134\146 a + b <= 2 * c
      #|  2 * X((a : Num), (n : Num) - 1)
      #|  !((q : Num) == 0) \226\134\146 1 <= q
      #|  (a : Num) == 1 * a
      #|  (s : Num) < (x : Num) && x <= (q : Num) * x \226\134\146 !(s == q * x)
      #|  !(b : Bool) \226\134\146 b \226\134\146 (a : Bool)
      #|  X((a : Num), 2 * (n : Num) - (j : Num)) + X(a, (i : Num)) == ((q1 : Num) - (q : Num)) * X(a, n)
      #|  !((q : Num) == 0) \226\134\146 1 <= q
      #|  (a : Num) == 1 * a
      #|  ((q1 : Num) - (q : Num)) * (a : Num) == 2
      #|  !((a : Num) == 0) && !(a == 1) && a <= 2 \226\134\146 a == 2
      #|  X((a : Num), 2 * 1 - 2) + X(a, 0) == ((q1 : Num) - (q : Num)) * X(a, 1)
      #|  !((i : Num) == 1)
      #|  (i : Num) <= 1
      #|  (i : Num) == 0
      #|  (n : Num) == 1
      #|  !((j : Num) <= 1) && j <= 2 \226\134\146 j == 2
      #|  !((j : Num) <= (n : Num))
      #|  (j : Num) <= 2 * (n : Num)
      #|  (n : Num) == 1
      #|  (!(b : Bool) \226\134\146 (a : Bool) \226\134\146 (c : Bool)) \226\134\146 a \226\134\146 b || c
      #|  !((n : Num) == 0) == (1 <= n)
      #|  !(c : Bool) \226\134\146 (a : Bool) && c \226\134\146 (b : Bool)
      #|  (q1 : Num) - (q : Num) == 0
      #|  !((n : Num) == 0)
      #|  !((j : Num) <= (n : Num))
      #|  !((x : Num) == 0) \226\134\146 1 <= x
      #|  (j : Num) < (n : Num) && 1 * n <= (a : Num) * n \226\134\146 !(j == a * n)
      #|  !((n : Num) == 0) == (1 <= n)
      #|  (q1 : Num) - (q : Num) - 1 == 0
      #|  !(a : Bool) \226\134\146 a \226\134\146 (b : Bool)
      #|  (x : Num) + (n : Num) == (q : Num) * n \226\134\146 x == q * n - 1 * n
      #|  (i : Num) == (n : Num)
      #|  (a : Num) + ((b : Num) + (c : Num)) == (d : Num) \226\134\146 a + c == d - b
      #|  (q : Num) == 0
      #|  X((a : Num), (j : Num)) == (q : Num) * X(a, (n : Num)) + X(a, (i : Num))
      #|  (q1 : Num)
      #|  (j : Num)
      #|  (n : Num)
      #|  (a : Num)
      #|  (i : Num) <= (n : Num)
      #|  (j : Num) <= 2 * (n : Num)
      #|  (i : Num) <= (j : Num)
      #|  (n : Num) == 0
      #|  !((x : Num) == 0) \226\134\146 1 <= x
      #|  1 <= (b : Num) && 1 * (x : Num) <= (qx : Num) \226\134\146 !(qx + b <= x)
      #|  !(a : Bool) \226\134\146 a \226\134\146 (b : Bool)
      #|  (n : Num)
      #|  (j : Num)
      #|  (a : Num)
      #|  (q : Num) == 0
      #|  X((a : Num), (j : Num)) == (q : Num) * X(a, (n : Num)) + X(a, (i : Num))
      #|  (i : Num) < (n : Num)
      #|  (i : Num) == (j : Num)
      #|  (j : Num) <= (n : Num)
      #|  \226\136\128 a : Num, \226\136\128 i : Num, \226\136\128 j : Num, \226\136\128 n : Num, \226\136\128 q : Num, !(a == 0) && !(a == 1) && i <= j && j <= 2 * n && X(a, j) == q * X(a, n) + X(a, i) \226\134\146 i == j || a == 2 && n == 1 && i == 0 && j == 2
      #|  (j : Num) < 4 * (n : Num)
      #|  (i : Num) <= (n : Num)
      #|  (q2 : Num) - ((q1 : Num) + (q : Num))
      #|  (n : Num)
      #|  (i : Num)
      #|  4 * (n : Num) - (j : Num)
      #|  (a : Num)
      #|  (j : Num) < 4 * (n : Num)
      #|  0 < (i : Num) \226\134\146 !(i == 0)
      #|  !((j : Num) <= 2 * (n : Num))
      #|  (q1 : Num) + (q : Num) - (q2 : Num)
      #|  (n : Num)
      #|  4 * (n : Num) - (j : Num)
      #|  (i : Num)
      #|  (a : Num)
      #|  (x : Num) + (q1 : Num) == (q2 : Num) + ((y : Num) + (q3 : Num)) \226\134\146 x <= y \226\134\146 y == q1 - (q2 + q3) + x
      #|  (x : Num) + (q1 : Num) == (q2 : Num) + ((y : Num) + (q3 : Num)) \226\134\146 y <= x \226\134\146 x == q2 + q3 - q1 + y
      #|  (a : Num) + (b : Num) == (c : Num) && (d : Num) + a == (e : Num) \226\134\146 b + e == c + d
      #|  X((a : Num), 2 * (n : Num) - (4 * n - (j : Num))) + X(a, 4 * n - j) == (q1 : Num) * X(a, n)
      #|  X((a : Num), (i : Num)) + (q : Num) * X(a, (n : Num)) == X(a, (j : Num))
      #|  (q2 : Num)
      #|  (q1 : Num)
      #|  (j : Num) < 4 * (n : Num) && !(j <= 2 * n) \226\134\146 2 * n + (2 * n - (4 * n - j)) == j
      #|  !((j : Num) <= 2 * (n : Num)) \226\134\146 4 * n - j <= 2 * n
      #|  4 * (n : Num) - (j : Num)
      #|  (n : Num)
      #|  (a : Num)
      #|  2 * (n : Num) - (4 * n - (j : Num))
      #|  (n : Num)
      #|  (a : Num)
      #|  4 * (n : Num) - (j : Num)
      #|  (i : Num)
      #|  0 < (i : Num) \226\134\146 !(i == 0)
      #|  ((a : Bool) \226\134\146 (b : Bool)) == (!b \226\134\146 !a)
      #|  X((a : Num), (i : Num)) <= X(a, (j : Num))
      #|  X((a : Num), (i : Num)) + (q : Num) * X(a, (n : Num)) == X(a, (j : Num))
      #|  (q : Num)
      #|  (n : Num)
      #|  (j : Num)
      #|  (i : Num)
      #|  (a : Num)
      #|  (j : Num) <= 2 * (n : Num)
      #|  \226\136\128 a : Num, \226\136\128 i : Num, \226\136\128 j : Num, \226\136\128 n : Num, \226\136\128 q : Num, !(a == 0) && !(a == 1) && 0 < i && i <= n && j < 4 * n && X(a, i) + q * X(a, n) == X(a, j) \226\134\146 j == i || j == 4 * n - i
      #|  (i : Num) + (q1 : Num) == (j : Num) + (q2 : Num) && !(j < i) \226\134\146 i + (q1 - q2) == j
      #|  (q1 : Num) - (q2 : Num)
      #|  (n : Num)
      #|  (j : Num)
      #|  (i : Num)
      #|  (a : Num)
      #|  !((q2 : Num) - (q1 : Num) == 0) \226\134\146 1 <= q2 - q1
      #|  (i : Num) == (j : Num) + (q : Num) * (n : Num) \226\134\146 1 <= j && 1 * n <= q * n \226\134\146 !(i <= n)
      #|  !(a : Bool) \226\134\146 a \226\134\146 (b : Bool)
      #|  (q2 : Num) - (q1 : Num) == 0
      #|  (x : Num) + (q1 : Num) == (y : Num) + (q2 : Num) \226\134\146 y < x \226\134\146 x == y + (q2 - q1)
      #|  X((a : Num), (i : Num)) + (q1 : Num) * X(a, (n : Num)) == X(a, (j : Num)) + (q2 : Num) * X(a, n)
      #|  (j : Num) < (i : Num)
      #|  \226\136\128 a : Num, \226\136\128 i : Num, \226\136\128 j : Num, \226\136\128 n : Num, \226\136\128 q1 : Num, \226\136\128 q2 : Num, !(a == 0) && !(a == 1) && 0 < i && i <= n && j < 4 * n && X(a, i) + q1 * X(a, n) == X(a, j) + q2 * X(a, n) \226\134\146 j == i || j == 4 * n - i
      #|  (i : Num) <= (n : Num)
      #|  (a' : Num) == (a : Num) && (i : Num) <= (b : Num) \226\134\146 a + (b - i + i) == a' + b
      #|  (q : Num) * (4 * (n : Num)) + (k : Num) == (j : Num)
      #|  (q : Num) + 1
      #|  (q : Num) * (4 * (n : Num)) + (k : Num) == (j : Num)
      #|  (q : Num)
      #|  (a : Num) + (q1 : Num) == (q2 : Num) + (b : Num) \226\134\146 !(b < a) \226\134\146 a + (q1 - q2) == b
      #|  X((a : Num), (i : Num)) + (c : Num) * X(a, (n : Num)) == (q1 : Num) * X(a, n) + X(a, (k : Num))
      #|  (c : Num) - (q1 : Num)
      #|  (n : Num)
      #|  (k : Num)
      #|  (i : Num)
      #|  (a : Num)
      #|  (a : Num)
      #|  (1 <= (n : Num)) == !(n == 0)
      #|  (n : Num) == 1 * n
      #|  (a : Num) <= (b : Num) && 1 <= (c : Num) \226\134\146 !(a == b + c)
      #|  !(a : Bool) \226\134\146 a \226\134\146 (b : Bool)
      #|  (q : Num)
      #|  (q1 : Num) - (c : Num) == 0
      #|  (a : Num) + (q1 : Num) == (q2 : Num) + (b : Num) \226\134\146 b < a \226\134\146 a == q2 - q1 + b
      #|  X((a : Num), (i : Num)) + (c : Num) * X(a, (n : Num)) == (q1 : Num) * X(a, n) + X(a, (k : Num))
      #|  (k : Num) < (i : Num)
      #|  4 * ((q : Num) * (n : Num)) + (k : Num) == q * (4 * n) + k
      #|  (q1 : Num)
      #|  (k : Num)
      #|  (n : Num)
      #|  (q : Num)
      #|  (a : Num)
      #|  (i : Num) <= (n : Num)
      #|  0 < (i : Num)
      #|  (k : Num) == MOD((j : Num), 4 * (n : Num))
      #|  (q : Num) == DIV((j : Num), 4 * (n : Num))
      #|  4 * (n : Num)
      #|  (j : Num)
      #|  \226\136\128 a : Num, \226\136\128 i : Num, \226\136\128 j : Num, \226\136\128 n : Num, \226\136\128 c : Num, !(a == 0) && !(a == 1) && 0 < i && i <= n && X(a, i) + c * X(a, n) == X(a, j) \226\134\146 (\226\136\131 q : Num, j == i + 4 * (n * q)) || (\226\136\131 q : Num, j + i == 4 * (n * q))
      #|  (i : Num) + (q1 : Num) == (j : Num) + (q2 : Num) && !(j < i) \226\134\146 i + (q1 - q2) == j
      #|  (c1 : Num) - (c2 : Num)
      #|  (n : Num)
      #|  (j : Num)
      #|  (i : Num)
      #|  (a : Num)
      #|  !((q2 : Num) - (q1 : Num) == 0) \226\134\146 1 <= q2 - q1
      #|  (i : Num) == (j : Num) + (q : Num) * (n : Num) \226\134\146 1 <= j && 1 * n <= q * n \226\134\146 !(i <= n)
      #|  !(a : Bool) \226\134\146 a \226\134\146 (b : Bool)
      #|  0
      #|  (c2 : Num) - (c1 : Num) == 0
      #|  (x : Num) + (q1 : Num) == (y : Num) + (q2 : Num) \226\134\146 y < x \226\134\146 x == y + (q2 - q1)
      #|  X((a : Num), (i : Num)) + (c1 : Num) * X(a, (n : Num)) == X(a, (j : Num)) + (c2 : Num) * X(a, n)
      #|  (j : Num) < (i : Num)
      #|  \226\136\128 a : Num, \226\136\128 i : Num, \226\136\128 j : Num, \226\136\128 n : Num, \226\136\128 c1 : Num, \226\136\128 c2 : Num, !(a == 0) && !(a == 1) && 0 < i && i <= n && X(a, i) + c1 * X(a, n) == X(a, j) + c2 * X(a, n) \226\134\146 (\226\136\131 q : Num, j == i + 4 * (n * q)) || (\226\136\131 q : Num, j + i == 4 * (n * q))
      #|  (k : Num)
      #|  (a : Num)
      #|  (q8 : Num) * (p : Num)
      #|  (q8 : Num)
      #|  1 + (p : Num) * (4 * (y : Num)) == (b : Num)
      #|  (k : Num)
      #|  (b : Num)
      #|  (c : Num)
      #|  (c : Num)
      #|  (k : Num)
      #|  (u : Num)
      #|  (q : Num)
      #|  (a : Num)
      #|  !((b : Num) == 0)
      #|  !(b : Bool) \226\134\146 (a : Bool) \226\134\146 b \226\134\146 !a
      #|  1 + (p : Num) * (4 * (y : Num)) == (b : Num)
      #|  !((b : Num) == 0)
      #|  Y((b : Num), (k : Num)) == (t : Num)
      #|  X((b : Num), (k : Num)) == (s : Num)
      #|  (r : Num) * EXP((y : Num), 2) == EXP(y, 2) * r
      #|  (t : Num)
      #|  (s : Num)
      #|  (t : Num) == Y((b : Num), (k : Num))
      #|  (s : Num) == X((b : Num), (k : Num))
      #|  1 + 4 * ((p : Num) * (y : Num)) == 1 + p * (4 * y)
      #|  (q : Num)
      #|  (p : Num)
      #|  (b : Num)
      #|  (q : Num)
      #|  (p : Num)
      #|  (b : Num)
      #|  EXP((y : Num), 2) * (r : Num) == (v : Num)
      #|  (m : Num)
      #|  (a : Num)
      #|  ((a : Bool) \226\134\146 (b : Bool)) == (!b \226\134\146 !a)
      #|  ODD((u : Num))
      #|  !(b : Bool) && ((a : Bool) \226\134\146 (d : Bool)) && ((c : Bool) \226\134\146 d) \226\134\146 a || b || c \226\134\146 d
      #|  2
      #|  (u : Num)
      #|  2 * 2
      #|  (u : Num) == 0
      #|  ODD((u : Num))
      #|  \226\136\131 b0 : Num, \226\136\131 q6 : Num, \226\136\131 q7 : Num, b0 == 1 + q6 * (4 * (y : Num)) && b0 == (a : Num) + q7 * (u : Num)
      #|  2 * ((k : Num) * Y((a : Num), k)) == (m : Num)
      #|  !((a : Num) == 0)
      #|  (m : Num)
      #|  (a : Num)
      #|  Y((a : Num), (m : Num)) == (v : Num)
      #|  EVEN((v : Num))
      #|  EVEN
      #|  (EXP((a : Num), 2) - 1) * EXP((v : Num), 2) + 1 == EXP((u : Num), 2)
      #|  ODD((u : Num))
      #|  !((r : Num) == 0) \226\134\146 0 < r
      #|  Y((a : Num), (k : Num)) == (y : Num)
      #|  !((a : Num) == 0)
      #|  (m : Num) == 0
      #|  2 * ((k : Num) * Y((a : Num), k)) == (m : Num)
      #|  (k : Num) == 0
      #|  !((a : Num) == 0)
      #|  Y((a : Num), (m : Num)) == 0
      #|  (m : Num) == 0
      #|  Y((a : Num), (m : Num)) == (v : Num)
      #|  EXP((y : Num), 2) * (r : Num) == (v : Num)
      #|  (r : Num) == 0
      #|  (r : Num)
      #|  (r : Num)
      #|  2
      #|  2 * ((k : Num) * Y((a : Num), k)) == (m : Num)
      #|  !((a : Num) == 0)
      #|  Y((a : Num), (k : Num)) == (y : Num)
      #|  Y((a : Num), (m : Num)) == (v : Num)
      #|  divides(EXP((y : Num), 2), (v : Num))
      #|  (v : Num)
      #|  (u : Num)
      #|  !((a : Num) == 0)
      #|  EXP((u : Num), 2) == (EXP((a : Num), 2) - 1) * EXP((v : Num), 2) + 1
      #|  (v : Num) == Y((a : Num), (m : Num))
      #|  (u : Num) == X((a : Num), (m : Num))
      #|  (m : Num) == 2 * ((k : Num) * Y((a : Num), k))
      #|  (x : Num)
      #|  !((a : Num) == 0)
      #|  EXP((x : Num), 2) == (EXP((a : Num), 2) - 1) * EXP((y : Num), 2) + 1
      #|  (x : Num) == X((a : Num), (k : Num))
      #|  !((q6 : Num) == 0)
      #|  2 * (y : Num) < (ay : Num) \226\134\146 (i : Num) <= y \226\134\146 (k : Num) <= y \226\134\146 i + k == ay \226\134\146 i == k
      #|  Y((a : Num), (i : Num)) == (y : Num)
      #|  (i : Num) <= Y((a : Num), i)
      #|  (k : Num) <= Y((a : Num), (i : Num))
      #|  (q6 : Num) == 0
      #|  (q6 : Num)
      #|  (q5 : Num) < (q4 : Num)
      #|  1 * (y : Num) < (k : Num) * y \226\134\146 !((i : Num) + k * y <= y)
      #|  ((a : Bool) \226\134\146 !(b : Bool)) \226\134\146 b \226\134\146 a \226\134\146 (c : Bool)
      #|  (i : Num) <= Y((a : Num), i)
      #|  (k : Num) + (q4 : Num) == (i : Num) + (q5 : Num) \226\134\146 q5 < q4 \226\134\146 i == k + (q4 - q5)
      #|  (q4 : Num) < (q5 : Num)
      #|  1 * (y : Num) < (k : Num) * y \226\134\146 !((i : Num) + k * y <= y)
      #|  ((a : Bool) \226\134\146 !(b : Bool)) \226\134\146 b \226\134\146 a \226\134\146 (c : Bool)
      #|  (k : Num) <= (y : Num)
      #|  (k : Num) + (q4 : Num) == (i : Num) + (q5 : Num) \226\134\146 q4 < q5 \226\134\146 k == i + (q5 - q4)
      #|  (q5 : Num)
      #|  (q4 : Num)
      #|  (q5 : Num)
      #|  (q4 : Num)
      #|  (i : Num)
      #|  (a : Num)
      #|  (i : Num) <= Y((a : Num), i)
      #|  (k : Num) <= Y((a : Num), (i : Num))
      #|  (d3 : Num) * (p : Num) + (d4 : Num) - (d : Num)
      #|  (d3 : Num) * (4 * (p : Num)) + (d4 : Num) * 4 - 4 * (x : Num) == (d3 * p + d4 - x) * 4
      #|  Y((a : Num), (i : Num)) == (y : Num)
      #|  (k : Num) + ((q1 : Num) + (i : Num)) == (q2 : Num) \226\134\146 i + k == q2 - q1
      #|  (d4 : Num)
      #|  (op_plus : (Num, Num) -> Num)
      #|  (i : Num)
      #|  Y((a : Num), (i : Num)) == (y : Num)
      #|  (d4 : Num)
      #|  (k : Num) + 4 * ((d : Num) * (y : Num)) == (d3 : Num) * (4 * ((p : Num) * y)) + (j : Num)
      #|  ((a1 : Bool) \226\134\146 (b1 : Bool)) && ((a2 : Bool) \226\134\146 (b2 : Bool)) \226\134\146 a1 || a2 \226\134\146 b1 || b2
      #|  (\226\136\131 q : Num, (j : Num) == (i : Num) + q * (4 * Y((a : Num), i))) || (\226\136\131 q : Num, j + i == q * (4 * Y(a, i)))
      #|  (\226\136\131 q1 : Num, \226\136\131 q2 : Num, (k : Num) + q1 * (4 * Y((a : Num), (i : Num))) == i + q2 * (4 * Y(a, i))) || (\226\136\131 q : Num, i + k == q * (4 * Y(a, i)))
      #|  Y((a : Num), (i : Num)) == (y : Num)
      #|  (k : Num) + 4 * ((d : Num) * (y : Num)) == (t : Num)
      #|  1 + 4 * ((p : Num) * (y : Num)) == (b : Num)
      #|  (d3 : Num)
      #|  (j : Num)
      #|  (b : Num)
      #|  Y((a : Num), (i : Num)) == (y : Num)
      #|  (d2 : Num)
      #|  (\226\136\131 q : Num, (j : Num) == (i : Num) + q * (4 * Y((a : Num), i))) || (\226\136\131 q : Num, j + i == q * (4 * Y(a, i)))
      #|  (i : Num) * (y : Num) * (d1 : Num) == (n : Num)
      #|  (\226\136\131 q : Num, (j : Num) == (i : Num) + 4 * ((n : Num) * q)) || (\226\136\131 q : Num, j + i == 4 * (n * q))
      #|  (d1 : Num)
      #|  (r : Num) * EXP((y : Num), 2) == (v : Num)
      #|  (r : Num)
      #|  (n : Num)
      #|  (i : Num)
      #|  (a : Num)
      #|  !((i : Num) == 0) \226\134\146 0 < i
      #|  (q1 : Num)
      #|  (c : Num)
      #|  (a : Num)
      #|  (\226\136\131 q : Num, (j : Num) == (i : Num) + 4 * ((n : Num) * q)) || (\226\136\131 q : Num, j + i == 4 * (n * q))
      #|  !((a : Num) == 0)
      #|  (!(a : Bool) \226\134\146 !(b : Bool)) == (b \226\134\146 a)
      #|  !((y : Num) == 0)
      #|  !((i : Num) == 0)
      #|  X((a : Num), (n : Num)) == (u : Num)
      #|  X((a : Num), (i : Num)) == (x : Num)
      #|  (x : Num) + (c : Num) * (u : Num) == (s : Num)
      #|  X((b : Num), (j : Num)) == (s : Num)
      #|  (q1 : Num)
      #|  (a : Num) + (q : Num) * (u : Num) == (b : Num)
      #|  !((a : Num) == 0)
      #|  (j : Num)
      #|  (u : Num)
      #|  (q : Num)
      #|  (a : Num)
      #|  ((a : Bool) \226\134\146 (b : Bool)) == (!b \226\134\146 !a)
      #|  Y((a : Num), (n : Num)) == (v : Num)
      #|  Y((a : Num), (i : Num)) == (y : Num)
      #|  (y : Num) <= (v : Num)
      #|  (i : Num) <= (n : Num)
      #|  0 < (r : Num) \226\134\146 !(r == 0)
      #|  (1 <= (a : Num)) == !(a == 0)
      #|  (y : Num) == 1 * y
      #|  (r : Num) * EXP((y : Num), 2) == (v : Num)
      #|  (y : Num) <= (v : Num)
      #|  (j : Num)
      #|  (t : Num)
      #|  (s : Num)
      #|  (b : Num)
      #|  1 + 4 * ((p : Num) * (y : Num)) == (b : Num)
      #|  !((b : Num) == 0)
      #|  (n : Num)
      #|  (v : Num)
      #|  (u : Num)
      #|  (a : Num)
      #|  (i : Num)
      #|  (y : Num)
      #|  (x : Num)
      #|  (a : Num)
      #|  !((a : Num) == 0) && !(a == 1) && !((y : Num) == 0) \226\134\146 (y == Y(a, (k : Num))) == (\226\136\131 x : Num, \226\136\131 u : Num, \226\136\131 v : Num, \226\136\131 r : Num, \226\136\131 b : Num, \226\136\131 p : Num, \226\136\131 q : Num, \226\136\131 s : Num, \226\136\131 t : Num, \226\136\131 c : Num, \226\136\131 d : Num, 0 < r && EXP(x, 2) == (EXP(a, 2) - 1) * EXP(y, 2) + 1 && EXP(u, 2) == (EXP(a, 2) - 1) * EXP(v, 2) + 1 && EXP(s, 2) == (EXP(b, 2) - 1) * EXP(t, 2) + 1 && v == r * EXP(y, 2) && b == 1 + 4 * (p * y) && b == a + q * u && s == x + c * u && t == k + 4 * (d * y) && k <= y)
      #|  (i : Num) * ((d1 : Num) * (d2 : Num))
      #|  (d3 : Num) * (p : Num) + (d4 : Num)
      #|  (d : Num)
      #|  (m : Num) * ((m - 1) * (n : Num)) == (m - 1) * (m * n)
      #|  (c : Num) <= (b : Num) \226\134\146 (a : Num) - b <= a - c
      #|  (a : Num) - ((b : Num) + (c : Num)) == a - c - b
      #|  (a : Num) * ((b : Num) * (c : Num)) == b * (a * c)
      #|  ((m : Num) - 1) * (EXP(m, (n : Num)) * (m - n))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, EXP(m, n) * (m - n) <= m * EXP(m - 1, n)
      #|  (1 <= (n : Num)) == !(n == 0)
      #|  (n : Num) * 1 <= (x : Num) \226\134\146 2 * x < (k : Num) \226\134\146 2 * x + n < 2 * k
      #|  2 * ((n : Num) * EXP((a : Num), n)) < (k : Num)
      #|  2 * ((a : Num) * (n : Num)) == 2 * (n * a)
      #|  (4 * ((k : Num) * (an : Num)) + (x : Num) < 2 * (an * (2 * k)) + (y : Num)) == (x < y)
      #|  (a : Num) + (b : Num) < (c : Num) \226\134\146 a < c - b
      #|  (2 * k) * (2 * an) * two_kn < a2na * two_kn * kmn <=>\n    two_kn * 4 * k * an < two_kn * a2na * kmn
      #|  (2 * EXP((a : Num), (n : Num)) + 1) * (EXP(2 * (k : Num), n) * (2 * k - n))
      #|  2 * (k : Num) * ((l : Num) * (m : Num)) == l * (2 * k * m)
      #|  2 * (k : Num) * (2 * EXP((a : Num), (n : Num)) * EXP(2 * k, n)) < 2 * k * ((2 * EXP(a, n) + 1) * EXP(2 * k - 1, n))
      #|  2 * ((k : Num) * (a : Num)) == a * (2 * k)
      #|  2 * ((e : Num) * (a : Num)) + e == (2 * a + 1) * e
      #|  (a : Num) == 1 * a
      #|  2 * ((a : Num) * (k : Num)) == 2 * (k * a)
      #|  !((a : Num) == 0)
      #|  (m : Num)
      #|  (n : Num)
      #|  (b' : Num) <= (b : Num) && (a : Num) < b' + (c : Num) \226\134\146 a < b + c && a < b' + c
      #|  2 * ((k : Num) * (a : Num)) == 2 * (a * k)
      #|  EXP(2 * (k : Num) - 1, (n : Num))
      #|  \226\136\128 x : Num, x <= (c : Num) && (a : Num) < (b : Num) + x && (d : Num) < (e : Num) + x \226\134\146 a < b + c && d < e + c
      #|  !((a : Num) == 0) \226\134\146 0 < a
      #|  real_of_num(EXP(2 * (k : Num), (n : Num))) * pow(real_of_num((a : Num)), n)
      #|  real_of_num(EXP(2 * ((a : Num) * (k : Num)), (n : Num)))
      #|  real_of_num(EXP(2 * (k : Num) - 1, (n : Num))) * pow(real_of_num((a : Num)), n)
      #|  real_of_num(EXP(2 * ((a : Num) * (k : Num)) - 1, (n : Num)))
      #|  \226\136\128 lx : Real, \226\136\128 ly : Real, \226\136\128 ux : Real, \226\136\128 uy : Real, lx <= (x : Real) && x <= ux && ly <= (y : Real) && y <= uy && real_of_num(2) * uy < real_of_num(2) * lx + (d : Real) && real_of_num(2) * ux < real_of_num(2) * ly + d \226\134\146 abs(x - y) * real_of_num(2) < d
      #|  abs(real_of_num(Y((k : Num), (n : Num) + 1)))
      #|  0 < (n : Num) + 1
      #|  (k : Num)
      #|  0 < Y((k : Num), (n : Num) + 1)
      #|  (a : Num) < (k : Num) \226\134\146 !(k == 0)
      #|  !((k : Num) == 0)
      #|  \226\136\128 a : Num, \226\136\128 k : Num, \226\136\128 n : Num, !(a == 0) && 2 * (n * EXP(a, n)) < k \226\134\146 abs(real_of_num(Y(a * k, n + 1)) / real_of_num(Y(k, n + 1)) - pow(real_of_num(a), n)) < real_of_num(1) / real_of_num(2)
      #|  real_of_num(4) * pow(real_of_num((x : Num)) - real_of_num((y : Num)) * real_of_num((z : Num)), 2) < pow(real_of_num(y), 2)
      #|  pow(real_of_num(1), 2)
      #|  ((a : Bool) \226\134\146 (b : Bool)) == (!b \226\134\146 !a)
      #|  pow(real_of_num(1), 2)
      #|  real_of_num(2) * real_of_num(2)
      #|  real_of_num(4) * pow(real_of_num((x : Num)) / real_of_num((y : Num)) - real_of_num((z : Num)), 2) < real_of_num(1)
      #|  \226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 z : Num, !(y == 0) \226\134\146 (abs(real_of_num(x) / real_of_num(y) - real_of_num(z)) < real_of_num(1) / real_of_num(2)) == (4 * EXP(x, 2) + 4 * EXP(y * z, 2) < 8 * (x * (y * z)) + EXP(y, 2))
      #|  (a : Num)
      #|  \226\136\128 a : Num, \226\136\128 n : Num, !(a == 0) \226\134\146 (Y(a, n) == 0) == (n == 0)
      #|  (\226\136\131 x : _, \226\136\131 y : _, \226\136\131 z : _, (a : _) == x && (b : _) == y && (c : _) == z && (P : (_, _, _) -> Bool)(x, y, z)) == P(a, b, c)
      #|  abs((a : Real) - (b : Real)) < real_of_num(1) \226\134\146 a + real_of_num(1) <= b || a == b || b + real_of_num(1) <= a \226\134\146 a == b
      #|  abs((x : Real) - (a : Real)) < (e1 : Real) && abs(x - (b : Real)) < (e2 : Real) \226\134\146 abs(a - b) < e1 + e2
      #|  !((a : Num) == 0)
      #|  (n : Num)
      #|  (n : Num)
      #|  EXP(2 * (a : Num) - 1, (n : Num))
      #|  2 * (a : Num) < (k : Num) \226\134\146 (b : Num) <= a \226\134\146 2 * b < k
      #|  (n : Num)
      #|  (k : Num)
      #|  (a : Num)
      #|  (k : Num)
      #|  !((a : Num) == 0)
      #|  (n : Num)
      #|  (n : Num)
      #|  EXP(2 * (a : Num) - 1, (n : Num))
      #|  (a : Num) <= (b : Num) \226\134\146 2 * a < 2 * b + 1
      #|  (c : Num) < c + 1
      #|  2 * ((n : Num) * Y((a : Num), n + 1)) + 1
      #|  ((n : Num) < (k : Num) && !(k == 0)) == (n < k)
      #|  ((a : Bool) && (b : Bool)) == !(a \226\134\146 !b)
      #|  ((n : Num) < (k : Num)) == (n < k && !(k == 0))
      #|  !((a : Num) == 0) \226\134\146 (EXP(a, (n : Num)) == (p : Num)) == (\226\136\131 k : Num, \226\136\131 x : Num, \226\136\131 y : Num, \226\136\131 z : Num, Y(a * k, n + 1) == x && Y(k, n + 1) == y && Y(a, n + 1) == z && 2 * (n * z) < k && 4 * EXP(x, 2) + 4 * EXP(y * p, 2) < 8 * (x * (y * p)) + EXP(y, 2))
      #|  (a : Real) + (b : Real) == real_of_num(0) \226\134\146 real_of_num(0) <= a && real_of_num(0) <= b \226\134\146 a == real_of_num(0) && b == real_of_num(0)
      #|  (pow((x : Real), 2) + pow((y : Real), 2) == real_of_num(0)) == (x == real_of_num(0) && y == real_of_num(0))
      #|  ((x1 : Num) == (x2 : Num) && (y1 : Num) == (y2 : Num)) == (x1 * x1 + (x2 * x2 + (y1 * y1 + y2 * y2)) == 2 * (x1 * x2) + 2 * (y1 * y2))
      #|  ((x1 : Real) == (x2 : Real) || (y1 : Real) == (y2 : Real)) == (x1 * y1 + x2 * y2 == x1 * y2 + x2 * y1)
      #|  ((x : Num) <= (y : Num)) == (\226\136\131 d : Num, x + d == y)
      #|  ((x : Num) < (y : Num)) == (\226\136\131 d : Num, x + (d + 1) == y)
      #|  !((x : Num) == (y : Num)) == (x < y || y < x)
      #|  !((k : Num) + 2 == 1)
      #|  SUC(SUC((n : Num))) == n + 2
      #|  (k : Num)
      #|  (k : Num)
      #|  \226\136\128 k : Num, Y(0, k) == (if k == 1 { 1 } else { 0 })
      #|  \226\136\128 k : Num, (Y(0, k) == 0) == !(k == 1)
      #|  (y : Num) == 0
      #|  (a : Num) == 1
      #|  (k : Num) == 0
      #|  (k : Num) == 0
      #|  (y : Num) == 0
      #|  (a : Num) == 0
      #|  (Y((a : Num), (k : Num)) == (y : Num)) == (a == 0 && k == 1 && y == 1 || a == 0 && !(k == 1) && y == 0 || k == 0 && y == 0 || a == 1 && y == k || !(a == 0) && !(k == 0) && !(a == 1) && !(y == 0) && (\226\136\131 x : Num, \226\136\131 u : Num, \226\136\131 v : Num, \226\136\131 r : Num, \226\136\131 b : Num, \226\136\131 p : Num, \226\136\131 q : Num, \226\136\131 s : Num, \226\136\131 t : Num, \226\136\131 c : Num, \226\136\131 d : Num, 0 < r && EXP(x, 2) == (EXP(a, 2) - 1) * EXP(y, 2) + 1 && EXP(u, 2) == (EXP(a, 2) - 1) * EXP(v, 2) + 1 && EXP(s, 2) == (EXP(b, 2) - 1) * EXP(t, 2) + 1 && v == r * EXP(y, 2) && b == 1 + 4 * (p * y) && b == a + q * u && s == x + c * u && t == k + 4 * (d * y) && k <= y))
      #|  (n : Num)
      #|  (n : Num)
      #|  (m : Num) == 0
      #|  (EXP((m : Num), (n : Num)) == (p : Num)) == (m == 0 && n == 0 && p == 1 || m == 0 && !(n == 0) && p == 0 || !(m == 0) && (\226\136\131 k : Num, \226\136\131 x : Num, \226\136\131 y : Num, \226\136\131 z : Num, Y(m * k, n + 1) == x && Y(k, n + 1) == y && Y(m, n + 1) == z && 2 * (n * z) < k && 4 * EXP(x, 2) + 4 * EXP(y * p, 2) < 8 * (x * (y * p)) + EXP(y, 2)))
      #|  ((n : Num) + 1 == 1) == (n == 0)
      #|PELL_INDUCTION =  |- ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(num,bool) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) (P:fun(num,bool) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(num,bool) n:num)) (P:fun(num,bool) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (P:fun(num,bool) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))) (#forall:fun(fun(num,bool),bool) (\n:num. (P:fun(num,bool) n:num))))
      #|ROOT_NONPOWER =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\q:num. (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) q:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) n:num)) ((#*:fun(num,fun(num,num)) d:num) ((#EXP:fun(num,fun(num,num)) q:num) n:num))))) (#?:fun(fun(num,bool),bool) (\a:num. ((#=:fun(num,fun(num,bool)) d:num) ((#EXP:fun(num,fun(num,num)) a:num) n:num)))))))))))))
      #|INTEGER_SUB_LEMMA =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. (#?:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) x:num)) (#real_of_num:fun(num,real) y:num))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) n:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))
      #|SQRT_LINEAR_EQ =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\u:num. (#forall:fun(fun(num,bool),bool) (\v:num. (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) a:num)) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) u:num)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) v:num)) (#sqrt:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) a:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) x:num)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) y:num)) (#sqrt:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) a:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) u:num) x:num)) ((#=:fun(num,fun(num,bool)) v:num) y:num))))))))))))))
      #|X_DEF =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#X:fun(num,fun(num,num)) a:num) n:num)) (((#COND:fun(bool,fun(num,fun(num,num))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (((#COND:fun(bool,fun(num,fun(num,num))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) a:num) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#*:fun(num,fun(num,num)) a:num) ((#X:fun(num,fun(num,num)) a:num) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#X:fun(num,fun(num,num)) a:num) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))
      #|X_CLAUSES =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. ((#=:fun(num,fun(num,bool)) ((#X:fun(num,fun(num,num)) a:num) (#NUMERAL:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. ((#=:fun(num,fun(num,bool)) ((#X:fun(num,fun(num,num)) a:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) a:num)))) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#X:fun(num,fun(num,num)) a:num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#*:fun(num,fun(num,num)) a:num) ((#X:fun(num,fun(num,num)) a:num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#X:fun(num,fun(num,num)) a:num) n:num)))))))))
      #|Y_DEF =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#Y:fun(num,fun(num,num)) a:num) n:num)) (((#COND:fun(bool,fun(num,fun(num,num))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) #_0:num)) (((#COND:fun(bool,fun(num,fun(num,num))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#*:fun(num,fun(num,num)) a:num) ((#Y:fun(num,fun(num,num)) a:num) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#Y:fun(num,fun(num,num)) a:num) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))
      #|Y_CLAUSES =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. ((#=:fun(num,fun(num,bool)) ((#Y:fun(num,fun(num,num)) a:num) (#NUMERAL:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. ((#=:fun(num,fun(num,bool)) ((#Y:fun(num,fun(num,num)) a:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#Y:fun(num,fun(num,num)) a:num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#*:fun(num,fun(num,num)) a:num) ((#Y:fun(num,fun(num,num)) a:num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#Y:fun(num,fun(num,num)) a:num) n:num)))))))))
      #|X_INCREASES =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#<=:fun(num,fun(num,bool)) ((#X:fun(num,fun(num,num)) a:num) n:num)) ((#X:fun(num,fun(num,num)) a:num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|Y_INCREASES =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#<=:fun(num,fun(num,bool)) ((#Y:fun(num,fun(num,num)) a:num) n:num)) ((#Y:fun(num,fun(num,num)) a:num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|XY_POWER_POS =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#X:fun(num,fun(num,num)) a:num) n:num))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#Y:fun(num,fun(num,num)) a:num) n:num))) (#sqrt:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) a:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_pow:fun(real,fun(num,real)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) a:num)) (#sqrt:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) a:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) n:num)))))))
      #|XY_POWER_NEG =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#X:fun(num,fun(num,num)) a:num) n:num))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#Y:fun(num,fun(num,num)) a:num) n:num))) (#sqrt:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) a:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_pow:fun(real,fun(num,real)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) a:num)) (#sqrt:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) a:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) n:num)))))))
      #|XY_ARE_SOLUTIONS =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) ((#X:fun(num,fun(num,num)) a:num) n:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) a:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#EXP:fun(num,fun(num,num)) ((#Y:fun(num,fun(num,num)) a:num) n:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))
      #|X_DEGENERATE =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#X:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))
      #|Y_DEGENERATE =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#Y:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num)) n:num)))
      #|REAL_ARCH_POW_MINIMAL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) y:real))) (#?:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) y:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) ((#real_pow:fun(real,fun(num,real)) x:real) (#SUC:fun(num,num) n:num)))))))))))
      #|SOLUTIONS_INDUCTION =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) y:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) x:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) a:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#EXP:fun(num,fun(num,num)) y:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (#?:fun(fun(num,bool),bool) (\x':num. (#?:fun(fun(num,bool),bool) (\y':num. ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) x':num) x:num)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) y':num) y:num)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) x':num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) a:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#EXP:fun(num,fun(num,num)) y':num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) x:num)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) y:num)) (#sqrt:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) a:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_mul:fun(real,fun(real,real)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) x':num)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) y':num)) (#sqrt:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) a:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) a:num)) (#sqrt:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) a:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))))))))))))
      #|SOLUTIONS_ARE_XY =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) x:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) a:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#EXP:fun(num,fun(num,num)) y:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#?:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) x:num) ((#X:fun(num,fun(num,num)) a:num) n:num))) ((#=:fun(num,fun(num,bool)) y:num) ((#Y:fun(num,fun(num,num)) a:num) n:num))))))))))))
      #|ADDITION_FORMULA_POS =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#X:fun(num,fun(num,num)) a:num) ((#+:fun(num,fun(num,num)) m:num) n:num))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#X:fun(num,fun(num,num)) a:num) m:num)) ((#X:fun(num,fun(num,num)) a:num) n:num))) ((#*:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) a:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#*:fun(num,fun(num,num)) ((#Y:fun(num,fun(num,num)) a:num) m:num)) ((#Y:fun(num,fun(num,num)) a:num) n:num)))))) ((#=:fun(num,fun(num,bool)) ((#Y:fun(num,fun(num,num)) a:num) ((#+:fun(num,fun(num,num)) m:num) n:num))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#X:fun(num,fun(num,num)) a:num) m:num)) ((#Y:fun(num,fun(num,num)) a:num) n:num))) ((#*:fun(num,fun(num,num)) ((#X:fun(num,fun(num,num)) a:num) n:num)) ((#Y:fun(num,fun(num,num)) a:num) m:num))))))))))))
      #|ADDITION_FORMULA_NEG =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#<=:fun(num,fun(num,bool)) m:num) n:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#X:fun(num,fun(num,num)) a:num) ((#-:fun(num,fun(num,num)) n:num) m:num))) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#X:fun(num,fun(num,num)) a:num) m:num)) ((#X:fun(num,fun(num,num)) a:num) n:num))) ((#*:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) a:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#*:fun(num,fun(num,num)) ((#Y:fun(num,fun(num,num)) a:num) m:num)) ((#Y:fun(num,fun(num,num)) a:num) n:num)))))) ((#=:fun(num,fun(num,bool)) ((#Y:fun(num,fun(num,num)) a:num) ((#-:fun(num,fun(num,num)) n:num) m:num))) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#X:fun(num,fun(num,num)) a:num) m:num)) ((#Y:fun(num,fun(num,num)) a:num) n:num))) ((#*:fun(num,fun(num,num)) ((#X:fun(num,fun(num,num)) a:num) n:num)) ((#Y:fun(num,fun(num,num)) a:num) m:num))))))))))))
      #|Y_INCREASES_SUC =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#<:fun(num,fun(num,bool)) ((#Y:fun(num,fun(num,num)) a:num) n:num)) ((#Y:fun(num,fun(num,num)) a:num) (#SUC:fun(num,num) n:num))))))))
      #|Y_INCREASES_LT =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#<:fun(num,fun(num,bool)) m:num) n:num))) ((#<:fun(num,fun(num,bool)) ((#Y:fun(num,fun(num,num)) a:num) m:num)) ((#Y:fun(num,fun(num,num)) a:num) n:num)))))))))
      #|Y_INCREASES_LE =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#<=:fun(num,fun(num,bool)) m:num) n:num))) ((#<=:fun(num,fun(num,bool)) ((#Y:fun(num,fun(num,num)) a:num) m:num)) ((#Y:fun(num,fun(num,num)) a:num) n:num)))))))))
      #|Y_INJ =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#Y:fun(num,fun(num,num)) a:num) m:num)) ((#Y:fun(num,fun(num,num)) a:num) n:num))) ((#=:fun(num,fun(num,bool)) m:num) n:num)))))))))
      #|X_INCREASES_LE =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#<=:fun(num,fun(num,bool)) m:num) n:num))) ((#<=:fun(num,fun(num,bool)) ((#X:fun(num,fun(num,num)) a:num) m:num)) ((#X:fun(num,fun(num,num)) a:num) n:num)))))))))
      #|X_INCREASES_LT =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#<:fun(num,fun(num,bool)) m:num) n:num)))) ((#<:fun(num,fun(num,bool)) ((#X:fun(num,fun(num,num)) a:num) m:num)) ((#X:fun(num,fun(num,num)) a:num) n:num)))))))))
      #|X_INCREASES_SUC =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#<:fun(num,fun(num,bool)) ((#X:fun(num,fun(num,num)) a:num) n:num)) ((#X:fun(num,fun(num,num)) a:num) (#SUC:fun(num,num) n:num))))))))
      #|X_INJ =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#X:fun(num,fun(num,num)) a:num) m:num)) ((#X:fun(num,fun(num,num)) a:num) n:num))) ((#=:fun(num,fun(num,bool)) m:num) n:num)))))))))
      #|XY_COPRIME =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) ((#X:fun(num,fun(num,num)) a:num) n:num)) ((#Y:fun(num,fun(num,num)) a:num) n:num))))))))
      #|Y_DIVIDES_LEMMA =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\k:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#num_divides:fun(num,fun(num,bool)) ((#Y:fun(num,fun(num,num)) a:num) n:num)) ((#Y:fun(num,fun(num,num)) a:num) ((#*:fun(num,fun(num,num)) n:num) k:num))))))))))
      #|Y_DIVIDES =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) ((#Y:fun(num,fun(num,num)) a:num) m:num)) ((#Y:fun(num,fun(num,num)) a:num) n:num))) ((#num_divides:fun(num,fun(num,bool)) m:num) n:num)))))))))
      #|BINOMIAL_TRIVIALITY =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#?:fun(fun(num,bool),bool) (\p:num. (#?:fun(fun(num,bool),bool) (\q:num. ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) x:num)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) y:num)) (#sqrt:fun(real,real) (#real_of_num:fun(num,real) d:num))))) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_add:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) x:num)) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) x:num)) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) y:num)) (#sqrt:fun(real,real) (#real_of_num:fun(num,real) d:num)))))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#DIV:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) x:num)) n:num)) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) y:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) d:num))))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) p:num)) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) y:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) q:num)) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) y:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#sqrt:fun(real,real) (#real_of_num:fun(num,real) d:num)))))))))))))))))))))
      #|Y_LOWERBOUND =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) a:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)) ((#Y:fun(num,fun(num,num)) a:num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))
      #|Y_UPPERBOUND =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) ((#Y:fun(num,fun(num,num)) a:num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#EXP:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) a:num)) n:num))))))
      #|XY_Y3_CONGRUENCE =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) (#?:fun(fun(num,bool),bool) (\q:num. ((#=:fun(num,fun(num,bool)) ((#Y:fun(num,fun(num,num)) a:num) ((#*:fun(num,fun(num,num)) n:num) k:num))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) k:num) ((#*:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) ((#X:fun(num,fun(num,num)) a:num) n:num)) ((#-:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#Y:fun(num,fun(num,num)) a:num) n:num)))) ((#*:fun(num,fun(num,num)) q:num) ((#EXP:fun(num,fun(num,num)) ((#Y:fun(num,fun(num,num)) a:num) n:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))))))
      #|Y2_DIVIDES =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) ((#Y:fun(num,fun(num,num)) a:num) m:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#Y:fun(num,fun(num,num)) a:num) n:num))) ((#num_divides:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) ((#Y:fun(num,fun(num,num)) a:num) m:num))) n:num)))))))))
      #|Y_N_MOD2 =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) (#?:fun(fun(num,bool),bool) (\q:num. ((#=:fun(num,fun(num,bool)) ((#Y:fun(num,fun(num,num)) a:num) n:num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) q:num)) n:num)))))))))
      #|Y_N_MODA1 =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) (#?:fun(fun(num,bool),bool) (\q:num. ((#=:fun(num,fun(num,bool)) ((#Y:fun(num,fun(num,num)) a:num) n:num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) q:num) ((#-:fun(num,fun(num,num)) a:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) n:num)))))))))
      #|X_CONGRUENT =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) (#?:fun(fun(num,bool),bool) (\q:num. ((#=:fun(num,fun(num,bool)) ((#X:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) a:num) ((#*:fun(num,fun(num,num)) b:num) c:num))) n:num)) ((#+:fun(num,fun(num,num)) ((#X:fun(num,fun(num,num)) a:num) n:num)) ((#*:fun(num,fun(num,num)) q:num) c:num))))))))))))))
      #|Y_CONGRUENT =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) (#?:fun(fun(num,bool),bool) (\q:num. ((#=:fun(num,fun(num,bool)) ((#Y:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) a:num) ((#*:fun(num,fun(num,num)) b:num) c:num))) n:num)) ((#+:fun(num,fun(num,num)) ((#Y:fun(num,fun(num,num)) a:num) n:num)) ((#*:fun(num,fun(num,num)) q:num) c:num))))))))))))))
      #|X_CONGRUENT_2NJ_POS =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\j:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) (#?:fun(fun(num,bool),bool) (\q:num. ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) ((#X:fun(num,fun(num,num)) a:num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)) j:num))) ((#X:fun(num,fun(num,num)) a:num) j:num))) ((#*:fun(num,fun(num,num)) q:num) ((#X:fun(num,fun(num,num)) a:num) n:num))))))))))))
      #|X_CONGRUENT_4NJ_POS =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\j:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) (#?:fun(fun(num,bool),bool) (\q:num. ((#=:fun(num,fun(num,bool)) ((#X:fun(num,fun(num,num)) a:num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) n:num)) j:num))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) q:num) ((#X:fun(num,fun(num,num)) a:num) n:num))) ((#X:fun(num,fun(num,num)) a:num) j:num))))))))))))
      #|X_CONGRUENT_4MNJ_POS =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\j:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) (#?:fun(fun(num,bool),bool) (\q:num. ((#=:fun(num,fun(num,bool)) ((#X:fun(num,fun(num,num)) a:num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#*:fun(num,fun(num,num)) m:num) n:num))) j:num))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) q:num) ((#X:fun(num,fun(num,num)) a:num) n:num))) ((#X:fun(num,fun(num,num)) a:num) j:num))))))))))))))
      #|X_CONGRUENT_2NJ_NEG_LEMMA =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\j:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#<=:fun(num,fun(num,bool)) j:num) n:num))) (#?:fun(fun(num,bool),bool) (\q:num. ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) ((#X:fun(num,fun(num,num)) a:num) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)) j:num))) ((#X:fun(num,fun(num,num)) a:num) j:num))) ((#*:fun(num,fun(num,num)) q:num) ((#X:fun(num,fun(num,num)) a:num) n:num))))))))))))
      #|X_CONGRUENT_2NJ_NEG =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\j:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#<=:fun(num,fun(num,bool)) j:num) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)))) (#?:fun(fun(num,bool),bool) (\q:num. ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) ((#X:fun(num,fun(num,num)) a:num) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)) j:num))) ((#X:fun(num,fun(num,num)) a:num) j:num))) ((#*:fun(num,fun(num,num)) q:num) ((#X:fun(num,fun(num,num)) a:num) n:num))))))))))))
      #|XY_GCD_LEMMA =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#<:fun(num,fun(num,bool)) m:num) n:num))) ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#Y:fun(num,fun(num,num)) a:num) m:num)) ((#Y:fun(num,fun(num,num)) a:num) n:num)))) ((#Y:fun(num,fun(num,num)) a:num) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)))))))))))
      #|XY_GCD =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#Y:fun(num,fun(num,num)) a:num) m:num)) ((#Y:fun(num,fun(num,num)) a:num) n:num)))) ((#Y:fun(num,fun(num,num)) a:num) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)))))))))))
      #|STEP_DOWN_LEMMA =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(num,bool),bool) (\j:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\q:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) i:num) j:num)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) j:num) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num))) ((#=:fun(num,fun(num,bool)) ((#X:fun(num,fun(num,num)) a:num) j:num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) q:num) ((#X:fun(num,fun(num,num)) a:num) n:num))) ((#X:fun(num,fun(num,num)) a:num) i:num)))))))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) i:num) j:num)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) i:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) j:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))))))))
      #|STEP_DOWN_LEMMA_4_ASYM =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(num,bool),bool) (\j:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\q:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) i:num)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) i:num) n:num)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) j:num) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) n:num))) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) ((#X:fun(num,fun(num,num)) a:num) i:num)) ((#*:fun(num,fun(num,num)) q:num) ((#X:fun(num,fun(num,num)) a:num) n:num)))) ((#X:fun(num,fun(num,num)) a:num) j:num)))))))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) j:num) i:num)) ((#=:fun(num,fun(num,bool)) j:num) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) n:num)) i:num))))))))))))))
      #|STEP_DOWN_LEMMA_4 =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(num,bool),bool) (\j:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\q1:num. (#forall:fun(fun(num,bool),bool) (\q2:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) i:num)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) i:num) n:num)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) j:num) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) n:num))) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) ((#X:fun(num,fun(num,num)) a:num) i:num)) ((#*:fun(num,fun(num,num)) q1:num) ((#X:fun(num,fun(num,num)) a:num) n:num)))) ((#+:fun(num,fun(num,num)) ((#X:fun(num,fun(num,num)) a:num) j:num)) ((#*:fun(num,fun(num,num)) q2:num) ((#X:fun(num,fun(num,num)) a:num) n:num)))))))))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) j:num) i:num)) ((#=:fun(num,fun(num,bool)) j:num) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) n:num)) i:num))))))))))))))))
      #|STEP_DOWN_LEMMA_STRONG_ASYM =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(num,bool),bool) (\j:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\c:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) i:num)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) i:num) n:num)) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) ((#X:fun(num,fun(num,num)) a:num) i:num)) ((#*:fun(num,fun(num,num)) c:num) ((#X:fun(num,fun(num,num)) a:num) n:num)))) ((#X:fun(num,fun(num,num)) a:num) j:num))))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\q:num. ((#=:fun(num,fun(num,bool)) j:num) ((#+:fun(num,fun(num,num)) i:num) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#*:fun(num,fun(num,num)) n:num) q:num))))))) (#?:fun(fun(num,bool),bool) (\q:num. ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) j:num) i:num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#*:fun(num,fun(num,num)) n:num) q:num)))))))))))))))))
      #|STEP_DOWN_LEMMA_STRONG =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(num,bool),bool) (\j:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\c1:num. (#forall:fun(fun(num,bool),bool) (\c2:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) i:num)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) i:num) n:num)) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) ((#X:fun(num,fun(num,num)) a:num) i:num)) ((#*:fun(num,fun(num,num)) c1:num) ((#X:fun(num,fun(num,num)) a:num) n:num)))) ((#+:fun(num,fun(num,num)) ((#X:fun(num,fun(num,num)) a:num) j:num)) ((#*:fun(num,fun(num,num)) c2:num) ((#X:fun(num,fun(num,num)) a:num) n:num))))))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\q:num. ((#=:fun(num,fun(num,bool)) j:num) ((#+:fun(num,fun(num,num)) i:num) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#*:fun(num,fun(num,num)) n:num) q:num))))))) (#?:fun(fun(num,bool),bool) (\q:num. ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) j:num) i:num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#*:fun(num,fun(num,num)) n:num) q:num)))))))))))))))))))
      #|Y_DIOPH =  |- ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) y:num) (#NUMERAL:fun(num,num) #_0:num)))))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) y:num) ((#Y:fun(num,fun(num,num)) a:num) k:num))) (#?:fun(fun(num,bool),bool) (\x:num. (#?:fun(fun(num,bool),bool) (\u:num. (#?:fun(fun(num,bool),bool) (\v:num. (#?:fun(fun(num,bool),bool) (\r:num. (#?:fun(fun(num,bool),bool) (\b:num. (#?:fun(fun(num,bool),bool) (\p:num. (#?:fun(fun(num,bool),bool) (\q:num. (#?:fun(fun(num,bool),bool) (\s:num. (#?:fun(fun(num,bool),bool) (\t:num. (#?:fun(fun(num,bool),bool) (\c:num. (#?:fun(fun(num,bool),bool) (\d:num. ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) r:num)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) x:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) a:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#EXP:fun(num,fun(num,num)) y:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) u:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) a:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#EXP:fun(num,fun(num,num)) v:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) s:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) b:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#EXP:fun(num,fun(num,num)) t:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) v:num) ((#*:fun(num,fun(num,num)) r:num) ((#EXP:fun(num,fun(num,num)) y:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) b:num) ((#+:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#*:fun(num,fun(num,num)) p:num) y:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) b:num) ((#+:fun(num,fun(num,num)) a:num) ((#*:fun(num,fun(num,num)) q:num) u:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) s:num) ((#+:fun(num,fun(num,num)) x:num) ((#*:fun(num,fun(num,num)) c:num) u:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) t:num) ((#+:fun(num,fun(num,num)) k:num) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#*:fun(num,fun(num,num)) d:num) y:num))))) ((#<=:fun(num,fun(num,bool)) k:num) y:num))))))))))))))))))))))))))))))))))
      #|BINOMIALISH_LEMMA =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) m:num) n:num)) ((#-:fun(num,fun(num,num)) m:num) n:num))) ((#*:fun(num,fun(num,num)) m:num) ((#EXP:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) m:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)))))))
      #|XY_EXP_LEMMA =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\k:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#<:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#*:fun(num,fun(num,num)) n:num) ((#EXP:fun(num,fun(num,num)) a:num) n:num)))) k:num))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#Y:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) a:num) k:num)) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) ((#Y:fun(num,fun(num,num)) k:num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) a:num)) n:num)))) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))
      #|ABS_LT_REPRESENTATION =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. (#forall:fun(fun(num,bool),bool) (\z:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) y:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) x:num)) (#real_of_num:fun(num,real) y:num))) (#real_of_num:fun(num,real) z:num)))) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#<:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#EXP:fun(num,fun(num,num)) x:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#EXP:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) y:num) z:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#*:fun(num,fun(num,num)) x:num) ((#*:fun(num,fun(num,num)) y:num) z:num)))) ((#EXP:fun(num,fun(num,num)) y:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))))
      #|Y_EQ_0 =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#Y:fun(num,fun(num,num)) a:num) n:num)) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|XY_EXP =  |- ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) a:num) n:num)) p:num)) (#?:fun(fun(num,bool),bool) (\k:num. (#?:fun(fun(num,bool),bool) (\x:num. (#?:fun(fun(num,bool),bool) (\y:num. (#?:fun(fun(num,bool),bool) (\z:num. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#Y:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) a:num) k:num)) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:num)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#Y:fun(num,fun(num,num)) k:num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) y:num)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#Y:fun(num,fun(num,num)) a:num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) z:num)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#*:fun(num,fun(num,num)) n:num) z:num))) k:num)) ((#<:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#EXP:fun(num,fun(num,num)) x:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#EXP:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) y:num) p:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#*:fun(num,fun(num,num)) x:num) ((#*:fun(num,fun(num,num)) y:num) p:num)))) ((#EXP:fun(num,fun(num,num)) y:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))))))))))
      #|REAL_SUM_OF_SQUARES =  |- ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_pow:fun(real,fun(num,real)) y:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) y:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))
      #|DIOPH_CONJ =  |- ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) x1:num) x2:num)) ((#=:fun(num,fun(num,bool)) y1:num) y2:num))) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) x1:num) x1:num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) x2:num) x2:num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) y1:num) y1:num)) ((#*:fun(num,fun(num,num)) y2:num) y2:num))))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#*:fun(num,fun(num,num)) x1:num) x2:num))) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#*:fun(num,fun(num,num)) y1:num) y2:num)))))
      #|DIOPH_DISJ =  |- ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) x1:real) x2:real)) ((#=:fun(real,fun(real,bool)) y1:real) y2:real))) ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) x1:real) y1:real)) ((#real_mul:fun(real,fun(real,real)) x2:real) y2:real))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) x1:real) y2:real)) ((#real_mul:fun(real,fun(real,real)) x2:real) y1:real))))
      #|DIOPH_LE =  |- ((#=:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) x:num) y:num)) (#?:fun(fun(num,bool),bool) (\d:num. ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) x:num) d:num)) y:num))))
      #|DIOPH_LT =  |- ((#=:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) x:num) y:num)) (#?:fun(fun(num,bool),bool) (\d:num. ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) x:num) ((#+:fun(num,fun(num,num)) d:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) y:num))))
      #|DIOPH_NE =  |- ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) x:num) y:num))) ((#\/:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) x:num) y:num)) ((#<:fun(num,fun(num,bool)) y:num) x:num)))
      #|Y_0 =  |- (#forall:fun(fun(num,bool),bool) (\k:num. ((#=:fun(num,fun(num,bool)) ((#Y:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) #_0:num)) k:num)) (((#COND:fun(bool,fun(num,fun(num,num))) ((#=:fun(num,fun(num,bool)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) #_0:num)))))
      #|Y_0_TRIV =  |- (#forall:fun(fun(num,bool),bool) (\k:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#Y:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) #_0:num)) k:num)) (#NUMERAL:fun(num,num) #_0:num))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|DIOPH_Y =  |- ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#Y:fun(num,fun(num,num)) a:num) k:num)) y:num)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) y:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#=:fun(num,fun(num,bool)) y:num) (#NUMERAL:fun(num,num) #_0:num))))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) k:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) y:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) y:num) k:num))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) k:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) y:num) (#NUMERAL:fun(num,num) #_0:num)))) (#?:fun(fun(num,bool),bool) (\x:num. (#?:fun(fun(num,bool),bool) (\u:num. (#?:fun(fun(num,bool),bool) (\v:num. (#?:fun(fun(num,bool),bool) (\r:num. (#?:fun(fun(num,bool),bool) (\b:num. (#?:fun(fun(num,bool),bool) (\p:num. (#?:fun(fun(num,bool),bool) (\q:num. (#?:fun(fun(num,bool),bool) (\s:num. (#?:fun(fun(num,bool),bool) (\t:num. (#?:fun(fun(num,bool),bool) (\c:num. (#?:fun(fun(num,bool),bool) (\d:num. ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) r:num)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) x:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) a:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#EXP:fun(num,fun(num,num)) y:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) u:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) a:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#EXP:fun(num,fun(num,num)) v:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) s:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) b:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#EXP:fun(num,fun(num,num)) t:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) v:num) ((#*:fun(num,fun(num,num)) r:num) ((#EXP:fun(num,fun(num,num)) y:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) b:num) ((#+:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#*:fun(num,fun(num,num)) p:num) y:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) b:num) ((#+:fun(num,fun(num,num)) a:num) ((#*:fun(num,fun(num,num)) q:num) u:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) s:num) ((#+:fun(num,fun(num,num)) x:num) ((#*:fun(num,fun(num,num)) c:num) u:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) t:num) ((#+:fun(num,fun(num,num)) k:num) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#*:fun(num,fun(num,num)) d:num) y:num))))) ((#<=:fun(num,fun(num,bool)) k:num) y:num)))))))))))))))))))))))))))))))))))))))))
      #|DIOPH_EXP_LEMMA =  |- ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) m:num) n:num)) p:num)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) p:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) p:num) (#NUMERAL:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num)))) (#?:fun(fun(num,bool),bool) (\k:num. (#?:fun(fun(num,bool),bool) (\x:num. (#?:fun(fun(num,bool),bool) (\y:num. (#?:fun(fun(num,bool),bool) (\z:num. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#Y:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) k:num)) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:num)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#Y:fun(num,fun(num,num)) k:num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) y:num)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#Y:fun(num,fun(num,num)) m:num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) z:num)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#*:fun(num,fun(num,num)) n:num) z:num))) k:num)) ((#<:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#EXP:fun(num,fun(num,num)) x:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#EXP:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) y:num) p:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#*:fun(num,fun(num,num)) x:num) ((#*:fun(num,fun(num,num)) y:num) p:num)))) ((#EXP:fun(num,fun(num,num)) y:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))))))))))))
      #|DIOPH_EXP =  |- ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) m:num) n:num)) p:num)) (#?:fun(fun(num,bool),bool) (\d:num. (#?:fun(fun(num,bool),bool) (\k:num. (#?:fun(fun(num,bool),bool) (\x:num. (#?:fun(fun(num,bool),bool) (\y:num. (#?:fun(fun(num,bool),bool) (\z:num. (#?:fun(fun(num,bool),bool) (\d':num. (#?:fun(fun(num,bool),bool) (\d'':num. (#?:fun(fun(num,bool),bool) (\d''':num. (#?:fun(fun(num,bool),bool) (\d'''':num. (#?:fun(fun(num,bool),bool) (\x':num. (#?:fun(fun(num,bool),bool) (\u:num. (#?:fun(fun(num,bool),bool) (\v:num. (#?:fun(fun(num,bool),bool) (\r:num. (#?:fun(fun(num,bool),bool) (\b:num. (#?:fun(fun(num,bool),bool) (\p':num. (#?:fun(fun(num,bool),bool) (\q:num. (#?:fun(fun(num,bool),bool) (\s:num. (#?:fun(fun(num,bool),bool) (\t:num. (#?:fun(fun(num,bool),bool) (\c:num. (#?:fun(fun(num,bool),bool) (\d''''':num. (#?:fun(fun(num,bool),bool) (\d'''''':num. (#?:fun(fun(num,bool),bool) (\d''''''':num. (#?:fun(fun(num,bool),bool) (\d'''''''':num. (#?:fun(fun(num,bool),bool) (\d''''''''':num. (#?:fun(fun(num,bool),bool) (\d'''''''''':num. (#?:fun(fun(num,bool),bool) (\d''''''''''':num. (#?:fun(fun(num,bool),bool) (\x'':num. (#?:fun(fun(num,bool),bool) (\u':num. (#?:fun(fun(num,bool),bool) (\v':num. (#?:fun(fun(num,bool),bool) (\r':num. (#?:fun(fun(num,bool),bool) (\b':num. (#?:fun(fun(num,bool),bool) (\p'':num. (#?:fun(fun(num,bool),bool) (\q':num. (#?:fun(fun(num,bool),bool) (\s':num. (#?:fun(fun(num,bool),bool) (\t':num. (#?:fun(fun(num,bool),bool) (\c':num. (#?:fun(fun(num,bool),bool) (\d'''''''''''':num. (#?:fun(fun(num,bool),bool) (\d''''''''''''':num. (#?:fun(fun(num,bool),bool) (\d'''''''''''''':num. (#?:fun(fun(num,bool),bool) (\d''''''''''''''':num. (#?:fun(fun(num,bool),bool) (\d'''''''''''''''':num. (#?:fun(fun(num,bool),bool) (\d''''''''''''''''':num. (#?:fun(fun(num,bool),bool) (\d'''''''''''''''''':num. (#?:fun(fun(num,bool),bool) (\x''':num. (#?:fun(fun(num,bool),bool) (\u'':num. (#?:fun(fun(num,bool),bool) (\v'':num. (#?:fun(fun(num,bool),bool) (\r'':num. (#?:fun(fun(num,bool),bool) (\b'':num. (#?:fun(fun(num,bool),bool) (\p''':num. (#?:fun(fun(num,bool),bool) (\q'':num. (#?:fun(fun(num,bool),bool) (\s'':num. (#?:fun(fun(num,bool),bool) (\t'':num. (#?:fun(fun(num,bool),bool) (\c'':num. (#?:fun(fun(num,bool),bool) (\d''''''''''''''''''':num. (#?:fun(fun(num,bool),bool) (\d'''''''''''''''''''':num. (#?:fun(fun(num,bool),bool) (\d''''''''''''''''''''':num. (#?:fun(fun(num,bool),bool) (\d'''''''''''''''''''''':num. (#?:fun(fun(num,bool),bool) (\d''''''''''''''''''''''':num. ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) p:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) d:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)) ((#=:fun(num,fun(num,bool)) p:num) (#NUMERAL:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) d:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) m:num)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) k:num)) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) x:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) k:num)) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) d':num)) n:num)) ((#=:fun(num,fun(num,bool)) x:num) (#NUMERAL:fun(num,num) #_0:num))))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) k:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) x:num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) d':num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#*:fun(num,fun(num,num)) m:num) k:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) d'':num) n:num)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) k:num)) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) d''':num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) ((#+:fun(num,fun(num,num)) d''':num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#*:fun(num,fun(num,num)) m:num) k:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) d'''':num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:num)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) d'''''':num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) r:num)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) x':num) x':num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) k:num)) ((#*:fun(num,fun(num,num)) m:num) k:num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#*:fun(num,fun(num,num)) x:num) x:num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) u:num) u:num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) k:num)) ((#*:fun(num,fun(num,num)) m:num) k:num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#*:fun(num,fun(num,num)) v:num) v:num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) s:num) s:num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) b:num) b:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#*:fun(num,fun(num,num)) t:num) t:num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) v:num) ((#*:fun(num,fun(num,num)) r:num) ((#*:fun(num,fun(num,num)) x:num) x:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) b:num) ((#+:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#*:fun(num,fun(num,num)) p':num) x:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) b:num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) k:num)) ((#*:fun(num,fun(num,num)) q:num) u:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) s:num) ((#+:fun(num,fun(num,num)) x':num) ((#*:fun(num,fun(num,num)) c:num) u:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) t:num) ((#+:fun(num,fun(num,num)) n:num) ((#+:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#*:fun(num,fun(num,num)) d''''':num) x:num)))))) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) n:num) ((#+:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) d''''''':num))) x:num)))))))))))))))))) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) k:num) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) y:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) k:num) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) d'''''''':num)) n:num)) ((#=:fun(num,fun(num,bool)) y:num) (#NUMERAL:fun(num,num) #_0:num))))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) y:num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) d'''''''':num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) k:num)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) d''''''''':num) n:num)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) k:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) d'''''''''':num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) ((#+:fun(num,fun(num,num)) d'''''''''':num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) d''''''''''':num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) y:num)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) d''''''''''''':num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) r':num)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) x'':num) x'':num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) k:num) k:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#*:fun(num,fun(num,num)) y:num) y:num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) u':num) u':num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) k:num) k:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#*:fun(num,fun(num,num)) v':num) v':num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) s':num) s':num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) b':num) b':num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#*:fun(num,fun(num,num)) t':num) t':num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) v':num) ((#*:fun(num,fun(num,num)) r':num) ((#*:fun(num,fun(num,num)) y:num) y:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) b':num) ((#+:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#*:fun(num,fun(num,num)) p'':num) y:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) b':num) ((#+:fun(num,fun(num,num)) k:num) ((#*:fun(num,fun(num,num)) q':num) u':num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) s':num) ((#+:fun(num,fun(num,num)) x'':num) ((#*:fun(num,fun(num,num)) c':num) u':num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) t':num) ((#+:fun(num,fun(num,num)) n:num) ((#+:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#*:fun(num,fun(num,num)) d'''''''''''':num) y:num)))))) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) n:num) ((#+:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) d'''''''''''''':num))) y:num)))))))))))))))))) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) z:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) d''''''''''''''':num)) n:num)) ((#=:fun(num,fun(num,bool)) z:num) (#NUMERAL:fun(num,num) #_0:num))))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) z:num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) d''''''''''''''':num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) m:num)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) d'''''''''''''''':num) n:num)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) d''''''''''''''''':num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) ((#+:fun(num,fun(num,num)) d''''''''''''''''':num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) m:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) d'''''''''''''''''':num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) z:num)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) d'''''''''''''''''''':num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) r'':num)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) x''':num) x''':num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) m:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#*:fun(num,fun(num,num)) z:num) z:num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) u'':num) u'':num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) m:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#*:fun(num,fun(num,num)) v'':num) v'':num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) s'':num) s'':num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) b'':num) b'':num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#*:fun(num,fun(num,num)) t'':num) t'':num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) v'':num) ((#*:fun(num,fun(num,num)) r'':num) ((#*:fun(num,fun(num,num)) z:num) z:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) b'':num) ((#+:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#*:fun(num,fun(num,num)) p''':num) z:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) b'':num) ((#+:fun(num,fun(num,num)) m:num) ((#*:fun(num,fun(num,num)) q'':num) u'':num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) s'':num) ((#+:fun(num,fun(num,num)) x''':num) ((#*:fun(num,fun(num,num)) c'':num) u'':num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) t'':num) ((#+:fun(num,fun(num,num)) n:num) ((#+:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#*:fun(num,fun(num,num)) d''''''''''''''''''':num) z:num)))))) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) n:num) ((#+:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) d''''''''''''''''''''':num))) z:num)))))))))))))))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#*:fun(num,fun(num,num)) n:num) z:num))) ((#+:fun(num,fun(num,num)) d'''''''''''''''''''''':num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#*:fun(num,fun(num,num)) x:num) x:num))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#*:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) y:num) p:num)) ((#*:fun(num,fun(num,num)) y:num) p:num)))) ((#+:fun(num,fun(num,num)) d''''''''''''''''''''''':num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#*:fun(num,fun(num,num)) x:num) ((#*:fun(num,fun(num,num)) y:num) p:num)))) ((#*:fun(num,fun(num,num)) y:num) y:num)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
      #|types = metric/1 topology/1 tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = Y X index integral integrable defint rsum fine gauge tdiv dsize division atn acs asn tan pi root ln cos sin exp diffs differentiable contl diffl tends_real_real suminf summable sums mono subseq lim cauchy convergent tends_num_real tendsto bounded tends dorder mr1 ball mtop mdist metric ismet limpt closed neigh open topology istopology re_compl re_subset re_universe re_null re_intersect re_union re_Union psum superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 319
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?1
      #|counter_genvar = _146851:bool
      #|
    ),
  )
}
