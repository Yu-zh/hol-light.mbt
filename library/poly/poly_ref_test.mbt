// Load-fidelity test for Library/poly.ml: replays tools/ocaml_ref/Library_poly_ref.ml
// (keep in sync; refresh with tools/ocaml_ref/refresh_ref.py).

///|
using @testkit {stm, sthm}

///|
test "Library/poly matches Library/poly.ml" {
  @poly.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot", "impconv", "pair", "compute", "nums", "recursion",
      "arith", "wf", "calc_num", "normalizer", "grobner", "ind_types", "lists", "realax",
      "calc_int", "realarith", "real", "calc_rat", "int", "sets", "iterate", "cart",
      "define", "Library/analysis", "Library/poly",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Library/poly")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("poly", () => sthm(@poly.poly()))
  log.attempt("POLY_CONST", () => sthm(@poly.poly_const()))
  log.attempt("POLY_X", () => sthm(@poly.poly_x()))
  log.attempt("poly_add", () => sthm(@poly.poly_add()))
  log.attempt("poly_cmul", () => sthm(@poly.poly_cmul()))
  log.attempt("poly_neg", () => sthm(@poly.poly_neg()))
  log.attempt("poly_mul", () => sthm(@poly.poly_mul()))
  log.attempt("poly_exp", () => sthm(@poly.poly_exp()))
  log.attempt("poly_diff_aux", () => sthm(@poly.poly_diff_aux()))
  log.attempt("poly_diff", () => sthm(@poly.poly_diff()))
  log.attempt("LENGTH_POLY_DIFF_AUX", () => sthm(@poly.length_poly_diff_aux()))
  log.attempt("LENGTH_POLY_DIFF", () => sthm(@poly.length_poly_diff()))
  log.attempt("POLY_ADD_CLAUSES", () => sthm(@poly.poly_add_clauses()))
  log.attempt("POLY_CMUL_CLAUSES", () => sthm(@poly.poly_cmul_clauses()))
  log.attempt("POLY_NEG_CLAUSES", () => sthm(@poly.poly_neg_clauses()))
  log.attempt("POLY_MUL_CLAUSES", () => sthm(@poly.poly_mul_clauses()))
  log.attempt("POLY_DIFF_CLAUSES", () => sthm(@poly.poly_diff_clauses()))
  log.attempt("POLY_ADD", () => sthm(@poly.poly_add_v1()))
  log.attempt("POLY_CMUL", () => sthm(@poly.poly_cmul_v1()))
  log.attempt("POLY_NEG", () => sthm(@poly.poly_neg_v1()))
  log.attempt("POLY_MUL", () => sthm(@poly.poly_mul_v1()))
  log.attempt("POLY_EXP", () => sthm(@poly.poly_exp_v1()))
  log.attempt("POLY_DIFF_LEMMA", () => sthm(@poly.poly_diff_lemma()))
  log.attempt("POLY_DIFF", () => sthm(@poly.poly_diff_v1()))
  log.attempt("POLY_DIFFERENTIABLE", () => sthm(@poly.poly_differentiable()))
  log.attempt("POLY_CONT", () => sthm(@poly.poly_cont()))
  log.attempt("POLY_IVT_POS", () => sthm(@poly.poly_ivt_pos()))
  log.attempt("POLY_IVT_NEG", () => sthm(@poly.poly_ivt_neg()))
  log.attempt("POLY_MVT", () => sthm(@poly.poly_mvt()))
  log.attempt("POLY_MVT_ADD", () => sthm(@poly.poly_mvt_add()))
  log.attempt("POLY_ADD_RZERO", () => sthm(@poly.poly_add_rzero()))
  log.attempt("POLY_MUL_ASSOC", () => sthm(@poly.poly_mul_assoc()))
  log.attempt("POLY_EXP_ADD", () => sthm(@poly.poly_exp_add()))
  log.attempt("POLY_DIFF_AUX_ADD", () => sthm(@poly.poly_diff_aux_add()))
  log.attempt("POLY_DIFF_AUX_CMUL", () => sthm(@poly.poly_diff_aux_cmul()))
  log.attempt("POLY_DIFF_AUX_NEG", () => sthm(@poly.poly_diff_aux_neg()))
  log.attempt("POLY_DIFF_AUX_MUL_LEMMA", () => {
    sthm(@poly.poly_diff_aux_mul_lemma())
  })
  log.attempt("POLY_DIFF_ADD", () => sthm(@poly.poly_diff_add()))
  log.attempt("POLY_DIFF_CMUL", () => sthm(@poly.poly_diff_cmul()))
  log.attempt("POLY_DIFF_NEG", () => sthm(@poly.poly_diff_neg()))
  log.attempt("POLY_DIFF_MUL_LEMMA", () => sthm(@poly.poly_diff_mul_lemma()))
  log.attempt("POLY_DIFF_MUL", () => sthm(@poly.poly_diff_mul()))
  log.attempt("POLY_DIFF_EXP", () => sthm(@poly.poly_diff_exp()))
  log.attempt("POLY_DIFF_EXP_PRIME", () => sthm(@poly.poly_diff_exp_prime()))
  log.attempt("POLY_LINEAR_REM", () => sthm(@poly.poly_linear_rem()))
  log.attempt("POLY_LINEAR_DIVIDES", () => sthm(@poly.poly_linear_divides()))
  log.attempt("POLY_LENGTH_MUL", () => sthm(@poly.poly_length_mul()))
  log.attempt("POLY_ROOTS_INDEX_LEMMA", () => {
    sthm(@poly.poly_roots_index_lemma())
  })
  log.attempt("POLY_ROOTS_INDEX_LENGTH", () => {
    sthm(@poly.poly_roots_index_length())
  })
  log.attempt("POLY_ROOTS_FINITE_LEMMA", () => {
    sthm(@poly.poly_roots_finite_lemma())
  })
  log.attempt("FINITE_LEMMA", () => sthm(@poly.finite_lemma()))
  log.attempt("POLY_ROOTS_FINITE", () => sthm(@poly.poly_roots_finite()))
  log.attempt("POLY_ENTIRE_LEMMA", () => sthm(@poly.poly_entire_lemma()))
  log.attempt("POLY_ENTIRE", () => sthm(@poly.poly_entire()))
  log.attempt("POLY_MUL_LCANCEL", () => sthm(@poly.poly_mul_lcancel()))
  log.attempt("POLY_EXP_EQ_0", () => sthm(@poly.poly_exp_eq_0()))
  log.attempt("POLY_PRIME_EQ_0", () => sthm(@poly.poly_prime_eq_0()))
  log.attempt("POLY_EXP_PRIME_EQ_0", () => sthm(@poly.poly_exp_prime_eq_0()))
  log.attempt("POLY_ZERO_LEMMA", () => sthm(@poly.poly_zero_lemma()))
  log.attempt("POLY_ZERO", () => sthm(@poly.poly_zero()))
  log.attempt("POLY_DIFF_AUX_ISZERO", () => sthm(@poly.poly_diff_aux_iszero()))
  log.attempt("POLY_DIFF_ISZERO", () => sthm(@poly.poly_diff_iszero()))
  log.attempt("POLY_DIFF_ZERO", () => sthm(@poly.poly_diff_zero()))
  log.attempt("POLY_DIFF_WELLDEF", () => sthm(@poly.poly_diff_welldef()))
  log.attempt("divides", () => sthm(@poly.divides()))
  log.attempt("POLY_PRIMES", () => sthm(@poly.poly_primes()))
  log.attempt("POLY_DIVIDES_REFL", () => sthm(@poly.poly_divides_refl()))
  log.attempt("POLY_DIVIDES_TRANS", () => sthm(@poly.poly_divides_trans()))
  log.attempt("POLY_DIVIDES_EXP", () => sthm(@poly.poly_divides_exp()))
  log.attempt("POLY_EXP_DIVIDES", () => sthm(@poly.poly_exp_divides()))
  log.attempt("POLY_DIVIDES_ADD", () => sthm(@poly.poly_divides_add()))
  log.attempt("POLY_DIVIDES_SUB", () => sthm(@poly.poly_divides_sub()))
  log.attempt("POLY_DIVIDES_SUB2", () => sthm(@poly.poly_divides_sub2()))
  log.attempt("POLY_DIVIDES_ZERO", () => sthm(@poly.poly_divides_zero()))
  log.attempt("POLY_ORDER_EXISTS", () => sthm(@poly.poly_order_exists()))
  log.attempt("POLY_ORDER", () => sthm(@poly.poly_order()))
  log.attempt("order", () => sthm(@poly.order()))
  log.attempt("ORDER", () => sthm(@poly.order_v1()))
  log.attempt("ORDER_THM", () => sthm(@poly.order_thm()))
  log.attempt("ORDER_UNIQUE", () => sthm(@poly.order_unique()))
  log.attempt("ORDER_POLY", () => sthm(@poly.order_poly()))
  log.attempt("ORDER_ROOT", () => sthm(@poly.order_root()))
  log.attempt("ORDER_DIVIDES", () => sthm(@poly.order_divides()))
  log.attempt("ORDER_DECOMP", () => sthm(@poly.order_decomp()))
  log.attempt("ORDER_MUL", () => sthm(@poly.order_mul()))
  log.attempt("ORDER_DIFF", () => sthm(@poly.order_diff()))
  log.attempt("POLY_SQUAREFREE_DECOMP_ORDER", () => {
    sthm(@poly.poly_squarefree_decomp_order())
  })
  log.attempt("rsquarefree", () => sthm(@poly.rsquarefree()))
  log.attempt("RSQUAREFREE_ROOTS", () => sthm(@poly.rsquarefree_roots()))
  log.attempt("RSQUAREFREE_DECOMP", () => sthm(@poly.rsquarefree_decomp()))
  log.attempt("POLY_SQUAREFREE_DECOMP", () => {
    sthm(@poly.poly_squarefree_decomp())
  })
  log.attempt("normalize", () => sthm(@poly.normalize()))
  log.attempt("POLY_NORMALIZE", () => sthm(@poly.poly_normalize()))
  log.attempt("degree", () => sthm(@poly.degree()))
  log.attempt("DEGREE_ZERO", () => sthm(@poly.degree_zero()))
  log.attempt("POLY_ROOTS_FINITE_SET", () => sthm(@poly.poly_roots_finite_set()))
  log.attempt("POLY_MONO", () => sthm(@poly.poly_mono()))
  log.attempt("NOT_POLY_CMUL_NIL", () => sthm(@poly.not_poly_cmul_nil()))
  log.attempt("NOT_POLY_MUL_NIL", () => sthm(@poly.not_poly_mul_nil()))
  log.attempt("NOT_POLY_EXP_NIL", () => sthm(@poly.not_poly_exp_nil()))
  log.attempt("NOT_POLY_EXP_X_NIL", () => sthm(@poly.not_poly_exp_x_nil()))
  log.attempt("POLY_CMUL_LID", () => sthm(@poly.poly_cmul_lid()))
  log.attempt("POLY_MUL_LID", () => sthm(@poly.poly_mul_lid()))
  log.attempt("POLY_MUL_RID", () => sthm(@poly.poly_mul_rid()))
  log.attempt("POLY_ADD_SYM", () => sthm(@poly.poly_add_sym()))
  log.attempt("POLY_ADD_ASSOC", () => sthm(@poly.poly_add_assoc()))
  log.attempt("TL_POLY_MUL_X", () => sthm(@poly.tl_poly_mul_x()))
  log.attempt("HD_POLY_MUL_X", () => sthm(@poly.hd_poly_mul_x()))
  log.attempt("TL_POLY_EXP_X_SUC", () => sthm(@poly.tl_poly_exp_x_suc()))
  log.attempt("HD_POLY_EXP_X_SUC", () => sthm(@poly.hd_poly_exp_x_suc()))
  log.attempt("HD_POLY_ADD", () => sthm(@poly.hd_poly_add()))
  log.attempt("HD_POLY_CMUL", () => sthm(@poly.hd_poly_cmul()))
  log.attempt("TL_POLY_CMUL", () => sthm(@poly.tl_poly_cmul()))
  log.attempt("HD_POLY_MUL", () => sthm(@poly.hd_poly_mul()))
  log.attempt("HD_POLY_EXP", () => sthm(@poly.hd_poly_exp()))
  log.attempt("POLY_ADD_IDENT", () => sthm(@poly.poly_add_ident()))
  log.attempt("POLY_ADD_NEUTRAL", () => sthm(@poly.poly_add_neutral()))
  log.attempt("MONOIDAL_POLY_ADD", () => sthm(@poly.monoidal_poly_add()))
  log.attempt("POLY_DIFF_AUX_ADD_LEMMA", () => {
    sthm(@poly.poly_diff_aux_add_lemma())
  })
  log.attempt("POLYDIFF_ADD", () => sthm(@poly.polydiff_add()))
  log.attempt("POLY_DIFF_AUX_POLY_CMUL", () => {
    sthm(@poly.poly_diff_aux_poly_cmul())
  })
  log.attempt("POLY_CMUL_POLY_DIFF", () => sthm(@poly.poly_cmul_poly_diff()))
  log.attempt("POLY_CMUL_LENGTH", () => sthm(@poly.poly_cmul_length()))
  log.attempt("POLY_ADD_LENGTH", () => sthm(@poly.poly_add_length()))
  log.attempt("POLY_MUL_LENGTH", () => sthm(@poly.poly_mul_length()))
  log.attempt("POLY_EXP_X_REC", () => sthm(@poly.poly_exp_x_rec()))
  log.attempt("POLY_MUL_LENGTH2", () => sthm(@poly.poly_mul_length2()))
  log.attempt("POLY_EXP_X_LENGTH", () => sthm(@poly.poly_exp_x_length()))
  log.attempt("POLY_SUM_EQUIV", () => sthm(@poly.poly_sum_equiv()))
  log.attempt("ITERATE_RADD_POLYADD", () => sthm(@poly.iterate_radd_polyadd()))
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
  log.attempt("counter_tyvar", () => stm(tm("(zz_counter : _)")))
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
      #|Library/poly quotations (513):
      #|  (poly_diff : (List[Real]) -> List[Real])
      #|  (poly_exp : (List[Real], Num) -> List[Real])
      #|  (poly_neg : (List[Real]) -> List[Real])
      #|  (poly_cmul : (Real, List[Real]) -> List[Real])
      #|  (poly_mul : (List[Real], List[Real]) -> List[Real])
      #|  (poly_add : (List[Real], List[Real]) -> List[Real])
      #|  (poly_divides : (List[Real], List[Real]) -> Bool)
      #|  (poly : (List[Real], Real) -> Real)(NIL, (x : Real)) == real_of_num(0) && poly(CONS((h : Real), (t : List[Real])), x) == h + x * poly(t, x)
      #|  \226\136\128 c : Real, \226\136\128 x : Real, poly([c], x) == c
      #|  \226\136\128 c : _, \226\136\128 x : Real, poly([real_of_num(0), real_of_num(1)], x) == x
      #|  (poly_add : (List[Real], List[Real]) -> List[Real])(NIL, (l2 : List[Real])) == l2 && poly_add(CONS((h : Real), (t : List[Real])), l2) == (if l2 == NIL { CONS(h, t) } else { CONS(h + HD(l2), poly_add(t, TL(l2))) })
      #|  (poly_cmul : (Real, List[Real]) -> List[Real])((c : Real), NIL) == NIL && poly_cmul(c, CONS((h : Real), (t : List[Real]))) == CONS(c * h, poly_cmul(c, t))
      #|  (poly_neg : (List[Real]) -> List[Real]) == poly_cmul(-real_of_num(1))
      #|  (poly_mul : (List[Real], List[Real]) -> List[Real])(NIL, (l2 : List[Real])) == NIL && poly_mul(CONS((h : Real), (t : List[Real])), l2) == (if t == NIL { poly_cmul(h, l2) } else { poly_add(poly_cmul(h, l2), CONS(real_of_num(0), poly_mul(t, l2))) })
      #|  (poly_exp : (List[Real], Num) -> List[Real])((p : List[Real]), 0) == [real_of_num(1)] && poly_exp(p, SUC((n : Num))) == poly_mul(p, poly_exp(p, n))
      #|  (poly_diff_aux : (Num, List[Real]) -> List[Real])((n : Num), NIL) == NIL && poly_diff_aux(n, CONS((h : Real), (t : List[Real]))) == CONS(real_of_num(n) * h, poly_diff_aux(SUC(n), t))
      #|  (poly_diff : (List[Real]) -> List[Real])((l : List[Real])) == (if l == NIL { NIL } else { poly_diff_aux(1, TL(l)) })
      #|  \226\136\128 l : List[Real], \226\136\128 n : Num, LENGTH(poly_diff_aux(n, l)) == LENGTH(l)
      #|  \226\136\128 l : List[Real], LENGTH(poly_diff(l)) == PRE(LENGTH(l))
      #|  (p1 : List[Real])
      #|  (p1 : List[Real])
      #|  poly_add(NIL, (p2 : List[Real])) == p2 && poly_add((p1 : List[Real]), NIL) == p1 && poly_add(CONS((h1 : Real), (t1 : List[Real])), CONS((h2 : Real), (t2 : List[Real]))) == CONS(h1 + h2, poly_add(t1, t2))
      #|  poly_cmul((c : Real), NIL) == NIL && poly_cmul(c, CONS((h : Real), (t : List[Real]))) == CONS(c * h, poly_cmul(c, t))
      #|  poly_neg(NIL) == NIL && poly_neg(CONS((h : Real), (t : List[Real]))) == CONS(-h, poly_neg(t))
      #|  poly_mul(NIL, (p2 : List[Real])) == NIL && poly_mul([(h1 : Real)], p2) == poly_cmul(h1, p2) && poly_mul(CONS(h1, CONS((k1 : Real), (t1 : List[Real]))), p2) == poly_add(poly_cmul(h1, p2), CONS(real_of_num(0), poly_mul(CONS(k1, t1), p2)))
      #|  poly_diff(NIL) == NIL && poly_diff([(c : Real)]) == NIL && poly_diff(CONS((h : Real), (t : List[Real]))) == poly_diff_aux(1, t)
      #|  \226\136\128 p1 : List[Real], \226\136\128 p2 : List[Real], \226\136\128 x : Real, poly(poly_add(p1, p2), x) == poly(p1, x) + poly(p2, x)
      #|  \226\136\128 p : List[Real], \226\136\128 c : Real, \226\136\128 x : Real, poly(poly_cmul(c, p), x) == c * poly(p, x)
      #|  \226\136\128 p : List[Real], \226\136\128 x : Real, poly(poly_neg(p), x) == -poly(p, x)
      #|  (t : List[Real])
      #|  (t : List[Real])
      #|  (h : Real)
      #|  (h : Real)
      #|  \226\136\128 x : Real, \226\136\128 p1 : List[Real], \226\136\128 p2 : List[Real], poly(poly_mul(p1, p2), x) == poly(p1, x) * poly(p2, x)
      #|  \226\136\128 p : List[Real], \226\136\128 n : Num, \226\136\128 x : Real, poly(poly_exp(p, n), x) == pow(poly(p, x), n)
      #|  SUC((n : Num))
      #|  (x : Real) => pow(x, SUC((n : Num)))
      #|  diffl((x : Real) => pow(x, SUC((n : Num))) * (h : Real), pow((x : Real), n) * (real_of_num(SUC(n)) * h), x)
      #|  (x : Real)
      #|  SUC((n : Num))
      #|  (x : Real)
      #|  (n : Num)
      #|  \226\136\128 l : List[Real], \226\136\128 n : Num, \226\136\128 x : Real, diffl((x : Real) => pow(x, SUC(n)) * poly(l, x), pow(x, n) * poly(poly_diff_aux(SUC(n), l), x), x)
      #|  (x : Real)
      #|  (h : Real)
      #|  1
      #|  (x : Real)
      #|  0
      #|  (t : List[Real])
      #|  (x : Real)
      #|  (x : Real) => poly((l : List[Real]), x)
      #|  \226\136\128 l : List[Real], \226\136\128 x : Real, diffl((x : Real) => poly(l, x), poly(poly_diff(l), x), x)
      #|  poly(poly_diff((l : List[Real])), (x : Real))
      #|  \226\136\128 l : List[Real], \226\136\128 x : Real, differentiable((x : Real) => poly(l, x), x)
      #|  poly(poly_diff((l : List[Real])), (x : Real))
      #|  \226\136\128 l : List[Real], \226\136\128 x : Real, contl((x : Real) => poly(l, x), x)
      #|  (x : Real)
      #|  (x : Real)
      #|  real_of_num(0)
      #|  (b : Real)
      #|  (a : Real)
      #|  (x : Real) => poly((p : List[Real]), x)
      #|  \226\136\128 p : List[Real], \226\136\128 a : Real, \226\136\128 b : Real, a < b && poly(p, a) < real_of_num(0) && poly(p, b) > real_of_num(0) \226\134\146 (\226\136\131 x : Real, a < x && x < b && poly(p, x) == real_of_num(0))
      #|  (-(x : Real) == real_of_num(0)) == (x == real_of_num(0))
      #|  (b : Real)
      #|  (a : Real)
      #|  (-(x : Real) < real_of_num(0)) == (x > real_of_num(0)) && (-x > real_of_num(0)) == (x < real_of_num(0))
      #|  poly_neg((p : List[Real]))
      #|  \226\136\128 p : List[Real], \226\136\128 a : Real, \226\136\128 b : Real, a < b && poly(p, a) > real_of_num(0) && poly(p, b) < real_of_num(0) \226\134\146 (\226\136\131 x : Real, a < x && x < b && poly(p, x) == real_of_num(0))
      #|  (x : Real)
      #|  poly((p : List[Real]))
      #|  (x : Real)
      #|  (x : Real)
      #|  (l : Real)
      #|  (b : Real)
      #|  (a : Real)
      #|  poly((p : List[Real]))
      #|  \226\136\128 p : List[Real], \226\136\128 a : Real, \226\136\128 b : Real, a < b \226\134\146 (\226\136\131 x : Real, a < x && x < b && poly(p, b) - poly(p, a) == (b - a) * poly(poly_diff(p), x))
      #|  (z : Real) < (a : Real)
      #|  (a : Real) + (x : Real) < (z : Real)
      #|  real_of_num(0) < -(x : Real)
      #|  (x : Real) + ((y : Real) - x) == y
      #|  (z : Real) - (a : Real)
      #|  ((x : Real) - (y : Real) == ((a : Real) - (a + (b : Real))) * (z : Real)) == (x == y + b * -z)
      #|  (z : Real)
      #|  ((a : Real) + (x : Real) < a) == (real_of_num(0) < -x)
      #|  (a : Real)
      #|  (a : Real) + (x : Real)
      #|  (p : List[Real])
      #|  (z : Real) < (a : Real) + (x : Real)
      #|  (a : Real) < (z : Real)
      #|  real_of_num(0) < (x : Real)
      #|  (x : Real) + ((y : Real) - x) == y
      #|  (z : Real) - (a : Real)
      #|  ((x : Real) - (y : Real) == ((a : Real) + (b : Real) - a) * (z : Real)) == (x == y + b * z)
      #|  (z : Real)
      #|  (a : Real) + (x : Real)
      #|  (a : Real)
      #|  (p : List[Real])
      #|  real_of_num(0)
      #|  (x : Real)
      #|  \226\136\128 p : List[Real], \226\136\128 a : Real, \226\136\128 x : Real, \226\136\131 y : Real, abs(y) <= abs(x) && poly(p, a + x) == poly(p, a) + x * poly(poly_diff(p), a + y)
      #|  \226\136\128 p : List[Real], poly(poly_add(p, NIL)) == poly(p)
      #|  \226\136\128 p : List[Real], \226\136\128 q : List[Real], \226\136\128 r : List[Real], poly(poly_mul(p, poly_mul(q, r))) == poly(poly_mul(poly_mul(p, q), r))
      #|  \226\136\128 d : Num, \226\136\128 n : Num, \226\136\128 p : List[Real], poly(poly_exp(p, n + d)) == poly(poly_mul(poly_exp(p, n), poly_exp(p, d)))
      #|  \226\136\128 p1 : List[Real], \226\136\128 p2 : List[Real], \226\136\128 n : Num, poly(poly_diff_aux(n, poly_add(p1, p2))) == poly(poly_add(poly_diff_aux(n, p1), poly_diff_aux(n, p2)))
      #|  \226\136\128 p : List[Real], \226\136\128 c : Real, \226\136\128 n : Num, poly(poly_diff_aux(n, poly_cmul(c, p))) == poly(poly_cmul(c, poly_diff_aux(n, p)))
      #|  \226\136\128 p : List[Real], \226\136\128 n : Num, poly(poly_diff_aux(n, poly_neg(p))) == poly(poly_neg(poly_diff_aux(n, p)))
      #|  \226\136\128 p : List[Real], \226\136\128 n : Num, poly(poly_diff_aux(SUC(n), p)) == poly(poly_add(poly_diff_aux(n, p), p))
      #|  \226\136\128 p1 : List[Real], \226\136\128 p2 : List[Real], poly(poly_diff(poly_add(p1, p2))) == poly(poly_add(poly_diff(p1), poly_diff(p2)))
      #|  \226\136\128 p : List[Real], \226\136\128 c : Real, poly(poly_diff(poly_cmul(c, p))) == poly(poly_cmul(c, poly_diff(p)))
      #|  \226\136\128 p : List[Real], poly(poly_diff(poly_neg(p))) == poly(poly_neg(poly_diff(p)))
      #|  \226\136\128 t : List[Real], \226\136\128 h : Real, poly(poly_diff(CONS(h, t))) == poly(poly_add(CONS(real_of_num(0), poly_diff(t)), t))
      #|  \226\136\128 p1 : List[Real], \226\136\128 p2 : List[Real], poly(poly_diff(poly_mul(p1, p2))) == poly(poly_add(poly_mul(p1, poly_diff(p2)), poly_mul(poly_diff(p1), p2)))
      #|  \226\136\128 p : List[Real], \226\136\128 n : Num, poly(poly_diff(poly_exp(p, SUC(n)))) == poly(poly_mul(poly_cmul(real_of_num(SUC(n)), poly_exp(p, n)), poly_diff(p)))
      #|  \226\136\128 n : Num, \226\136\128 a : Real, poly(poly_diff(poly_exp([-a, real_of_num(1)], SUC(n)))) == poly(poly_cmul(real_of_num(SUC(n)), poly_exp([-a, real_of_num(1)], n)))
      #|  (q : List[Real])
      #|  (q : List[Real])
      #|  (r : Real) * (a : Real) + (k : Real)
      #|  CONS((r : Real), (q : List[Real]))
      #|  (h : Real)
      #|  (k : Real)
      #|  (h : Real)
      #|  (NIL : List[Real])
      #|  \226\136\128 t : List[Real], \226\136\128 h : Real, \226\136\131 q : List[Real], \226\136\131 r : Real, CONS(h, t) == poly_add([r], poly_mul([-(a : Real), real_of_num(1)], q))
      #|  -(a : Real) + a == real_of_num(0)
      #|  (q : List[Real])
      #|  (q : List[Real])
      #|  -(a : Real) + a == real_of_num(0)
      #|  poly(CONS((h : Real), (t : List[Real])), (a : Real)) == real_of_num(0)
      #|  (r : Real) == real_of_num(0)
      #|  (q : List[Real])
      #|  \226\136\128 a : Real, \226\136\128 p : List[Real], (poly(p, a) == real_of_num(0)) == (p == NIL || (\226\136\131 q : List[Real], p == poly_mul([-a, real_of_num(1)], q)))
      #|  \226\136\128 p : List[Real], \226\136\128 h : Real, \226\136\128 k : Real, \226\136\128 a : Real, LENGTH(poly_add(poly_cmul(k, p), CONS(h, poly_cmul(a, p)))) == SUC(LENGTH(p))
      #|  \226\136\128 q : List[Real], LENGTH(poly_mul([-(a : Real), real_of_num(1)], q)) == SUC(LENGTH(q))
      #|  !(\226\136\131 a : Real, poly((p : List[Real]), a) == real_of_num(0))
      #|  (m : Num) <= (n : Num)
      #|  (m : Num)
      #|  (m : Num)
      #|  (x : Real)
      #|  (m : Num) => if m == SUC((n : Num)) { (a : Real) } else { (i : (Num) -> Real)(m) }
      #|  (i : (Num) -> Real)
      #|  (q : List[Real])
      #|  poly((q : List[Real])) == poly(NIL)
      #|  !(poly(poly_mul([-(a : Real), real_of_num(1)], (q : List[Real]))) == poly(NIL))
      #|  (q : List[Real])
      #|  \226\136\131 a : Real, poly((p : List[Real]), a) == real_of_num(0)
      #|  \226\136\131 a : Real, poly((p : List[Real]), a) == real_of_num(0)
      #|  \226\136\128 n : Num, \226\136\128 p : List[Real], !(poly(p) == poly(NIL)) && LENGTH(p) == n \226\134\146 (\226\136\131 i : (Num) -> Real, \226\136\128 x : Real, poly(p, x) == real_of_num(0) \226\134\146 (\226\136\131 m : Num, m <= n && x == i(m)))
      #|  SUC((n : Num))
      #|  \226\136\128 p : List[Real], !(poly(p) == poly(NIL)) \226\134\146 (\226\136\131 i : (Num) -> Real, \226\136\128 x : Real, poly(p, x) == real_of_num(0) \226\134\146 (\226\136\131 n : Num, n <= LENGTH(p) && x == i(n)))
      #|  \226\136\128 p : List[Real], !(poly(p) == poly(NIL)) \226\134\146 (\226\136\131 N : Num, \226\136\131 i : (Num) -> Real, \226\136\128 x : Real, poly(p, x) == real_of_num(0) \226\134\146 (\226\136\131 n : Num, n < N && x == i(n)))
      #|  \226\136\128 u : Real, \226\136\128 v : Real, \226\136\128 x : Real, x < v \226\134\146 x < abs(v) + (abs(u) + real_of_num(1))
      #|  \226\136\128 x : Real, \226\136\128 v : Real, x < abs(v) + (abs(x) + real_of_num(1))
      #|  abs((a : Real)) + (abs((i : (Num) -> Real)((N : Num))) + real_of_num(1))
      #|  (a : Real)
      #|  (z : Real) => (P : (Real) -> Bool)(z) && !(z == (i : (Num) -> Real)((N : Num)))
      #|  (P : (Real) -> Bool)
      #|  \226\136\128 i : (Num) -> Real, \226\136\128 N : Num, \226\136\128 P : (Real) -> Bool, (\226\136\128 x : Real, P(x) \226\134\146 (\226\136\131 n : Num, n < N && x == i(n))) \226\134\146 (\226\136\131 a : Real, \226\136\128 x : Real, P(x) \226\134\146 x < a)
      #|  (x : Real) => poly((p : List[Real]), x) == real_of_num(0)
      #|  (N : Num)
      #|  (i : (Num) -> Real)
      #|  (N : Num)
      #|  (i : (Num) -> Real)
      #|  \226\136\128 p : List[Real], !(poly(p) == poly(NIL)) == (\226\136\131 N : Num, \226\136\131 i : (Num) -> Real, \226\136\128 x : Real, poly(p, x) == real_of_num(0) \226\134\146 (\226\136\131 n : Num, n < N && x == i(n)))
      #|  !((m : Num) + (n : Num) < m)
      #|  (N1 : Num) + (n : Num)
      #|  (n : Num)
      #|  (n : Num)
      #|  (x : Real)
      #|  (n : Num) => if n < (N1 : Num) { (i1 : (Num) -> Real)(n) } else { (i2 : (Num) -> Real)(n - N1) }
      #|  (N1 : Num) + (N2 : Num)
      #|  (i1 : (Num) -> Real)
      #|  (N1 : Num)
      #|  (i2 : (Num) -> Real)
      #|  (N2 : Num)
      #|  \226\136\128 p : List[Real], \226\136\128 q : List[Real], !(poly(p) == poly(NIL)) && !(poly(q) == poly(NIL)) \226\134\146 !(poly(poly_mul(p, q)) == poly(NIL))
      #|  \226\136\128 p : List[Real], \226\136\128 q : List[Real], (poly(poly_mul(p, q)) == poly(NIL)) == (poly(p) == poly(NIL) || poly(q) == poly(NIL))
      #|  ((p : Real) + -(q : Real) == real_of_num(0)) == (p == q)
      #|  \226\136\128 p : List[Real], \226\136\128 q : List[Real], (poly(poly_add(p, poly_neg(q))) == poly(NIL)) == (poly(p) == poly(q))
      #|  \226\136\128 p : List[Real], \226\136\128 q : List[Real], \226\136\128 r : List[Real], poly(poly_add(poly_mul(p, q), poly_neg(poly_mul(p, r)))) == poly(poly_mul(p, poly_add(q, poly_neg(r))))
      #|  \226\136\128 p : List[Real], \226\136\128 q : List[Real], \226\136\128 r : List[Real], (poly(poly_mul(p, q)) == poly(poly_mul(p, r))) == (poly(p) == poly(NIL) || poly(q) == poly(r))
      #|  (n : Num)
      #|  (n : Num)
      #|  \226\136\128 p : List[Real], \226\136\128 n : Num, (poly(poly_exp(p, n)) == poly(NIL)) == (poly(p) == poly(NIL) && !(n == 0))
      #|  real_of_num(1) - (a : Real)
      #|  \226\136\128 a : Real, !(poly([a, real_of_num(1)]) == poly(NIL))
      #|  \226\136\128 a : Real, \226\136\128 n : Num, !(poly(poly_exp([a, real_of_num(1)], n)) == poly(NIL))
      #|  \226\136\128 x : Real, poly((t : List[Real]), x) == real_of_num(0) \226\134\146 x < (a : Real)
      #|  abs((a : Real)) + real_of_num(1)
      #|  (a : Real)
      #|  (x : Real) => poly((t : List[Real]), x) == real_of_num(0)
      #|  (N : Num)
      #|  (i : (Num) -> Real)
      #|  (i : (Num) -> Real)
      #|  (N : Num)
      #|  real_of_num(0)
      #|  (h : Real) == real_of_num(0)
      #|  \226\136\128 h : Real, \226\136\128 t : List[Real], poly(CONS(h, t)) == poly(NIL) \226\134\146 h == real_of_num(0) && poly(t) == poly(NIL)
      #|  \226\136\128 p : List[Real], (poly(p) == poly(NIL)) == ALL((c : Real) => c == real_of_num(0), p)
      #|  \226\136\128 p : List[Real], \226\136\128 n : Num, ALL((c : Real) => c == real_of_num(0), poly_diff_aux(SUC(n), p)) == ALL((c : Real) => c == real_of_num(0), p)
      #|  (h : Real)
      #|  1
      #|  real_of_num(0)
      #|  \226\136\128 p : List[Real], poly(poly_diff(p)) == poly(NIL) \226\134\146 (\226\136\131 h : Real, poly(p) == poly([h]))
      #|  (t : List[Real])
      #|  (t : List[Real])
      #|  (n : Num)
      #|  1
      #|  \226\136\128 p : List[Real], poly(p) == poly(NIL) \226\134\146 poly(poly_diff(p)) == poly(NIL)
      #|  ((a : Real) + -(b : Real) == real_of_num(0)) == (a == b)
      #|  (a : Real) + -a == real_of_num(0)
      #|  poly_add((p : List[Real]), poly_neg((q : List[Real])))
      #|  \226\136\128 p : List[Real], \226\136\128 q : List[Real], poly(p) == poly(q) \226\134\146 poly(poly_diff(p)) == poly(poly_diff(q))
      #|  (poly_divides : (List[Real], List[Real]) -> Bool)((p1 : List[Real]), (p2 : List[Real])) == (\226\136\131 q : List[Real], poly(p2) == poly(poly_mul(p1, q)))
      #|  poly_mul((p : List[Real]), (s : List[Real]))
      #|  poly_mul((s : List[Real]), (q : List[Real]))
      #|  (s : List[Real])
      #|  (s : List[Real])
      #|  (NIL : List[Real])
      #|  (s : List[Real])
      #|  -(a : Real)
      #|  (r : List[Real])
      #|  \226\136\128 a : Real, \226\136\128 p : List[Real], \226\136\128 q : List[Real], poly_divides([a, real_of_num(1)], poly_mul(p, q)) == (poly_divides([a, real_of_num(1)], p) || poly_divides([a, real_of_num(1)], q))
      #|  [real_of_num(1)]
      #|  \226\136\128 p : List[Real], poly_divides(p, p)
      #|  poly_mul((t : List[Real]), (s : List[Real]))
      #|  (t : List[Real])
      #|  (s : List[Real])
      #|  \226\136\128 p : List[Real], \226\136\128 q : List[Real], \226\136\128 r : List[Real], poly_divides(p, q) && poly_divides(q, r) \226\134\146 poly_divides(p, r)
      #|  (p : List[Real])
      #|  poly_exp((p : List[Real]), (m : Num) + (d : Num))
      #|  (d : Num)
      #|  (d : Num)
      #|  (d : Num)
      #|  \226\136\128 p : List[Real], \226\136\128 m : Num, \226\136\128 n : Num, m <= n \226\134\146 poly_divides(poly_exp(p, m), poly_exp(p, n))
      #|  \226\136\128 p : List[Real], \226\136\128 q : List[Real], \226\136\128 m : Num, \226\136\128 n : Num, poly_divides(poly_exp(p, n), q) && m <= n \226\134\146 poly_divides(poly_exp(p, m), q)
      #|  poly_add((t : List[Real]), (s : List[Real]))
      #|  (t : List[Real])
      #|  (s : List[Real])
      #|  \226\136\128 p : List[Real], \226\136\128 q : List[Real], \226\136\128 r : List[Real], poly_divides(p, q) && poly_divides(p, r) \226\134\146 poly_divides(p, poly_add(q, r))
      #|  poly_add((s : List[Real]), poly_neg((t : List[Real])))
      #|  (t : List[Real])
      #|  (s : List[Real])
      #|  \226\136\128 p : List[Real], \226\136\128 q : List[Real], \226\136\128 r : List[Real], poly_divides(p, q) && poly_divides(p, poly_add(q, r)) \226\134\146 poly_divides(p, r)
      #|  (x : Real)
      #|  (x : Real)
      #|  (s : List[Real])
      #|  (s : List[Real])
      #|  poly_divides((p : List[Real]), poly_add((q : List[Real]), (r : List[Real])))
      #|  (r : List[Real])
      #|  \226\136\128 p : List[Real], \226\136\128 q : List[Real], \226\136\128 r : List[Real], poly_divides(p, r) && poly_divides(p, poly_add(q, r)) \226\134\146 poly_divides(p, q)
      #|  (NIL : List[Real])
      #|  \226\136\128 p : List[Real], \226\136\128 q : List[Real], poly(p) == poly(NIL) \226\134\146 poly_divides(q, p)
      #|  (a : Real) + real_of_num(1)
      #|  !(poly((s : List[Real]), (a : Real)) == real_of_num(0))
      #|  (n : Num)
      #|  (n : Num)
      #|  (r : List[Real])
      #|  (n : Num)
      #|  (n : Num)
      #|  (s : List[Real])
      #|  (n : Num)
      #|  (s : List[Real])
      #|  (n : Num)
      #|  (p : List[Real])
      #|  0
      #|  (s : List[Real])
      #|  SUC((n : Num))
      #|  (s : List[Real])
      #|  (n : Num)
      #|  (q : List[Real])
      #|  \226\136\128 p : List[Real], LENGTH(p) == (d : Num) && !(poly(p) == poly(NIL)) \226\134\146 (\226\136\131 n : Num, \226\136\131 q : List[Real], p == (mulexp : (Num, List[Real], List[Real]) -> List[Real])(n, [-(a : Real), real_of_num(1)], q) && !(poly(q, a) == real_of_num(0)))
      #|  (q : List[Real])
      #|  poly((p : List[Real]), (a : Real)) == real_of_num(0)
      #|  poly((p : List[Real]), (a : Real)) == real_of_num(0)
      #|  (p : List[Real])
      #|  \226\136\128 d : Num, \226\136\128 p : List[Real], LENGTH(p) == d && !(poly(p) == poly(NIL)) \226\134\146 (\226\136\131 n : Num, \226\136\131 q : List[Real], p == (mulexp : (Num, List[Real], List[Real]) -> List[Real])(n, [-(a : Real), real_of_num(1)], q) && !(poly(q, a) == real_of_num(0)))
      #|  (\226\136\128 p : List[Real], \226\136\128 q : List[Real], (mulexp : (Num, List[Real], List[Real]) -> List[Real])(0, p, q) == q) && (\226\136\128 p : List[Real], \226\136\128 q : List[Real], \226\136\128 n : Num, mulexp(SUC(n), p, q) == poly_mul(p, mulexp(n, p, q)))
      #|  \226\136\128 a : Real, \226\136\128 d : Num, \226\136\128 p : List[Real], LENGTH(p) == d && !(poly(p) == poly(NIL)) \226\134\146 (\226\136\131 n : Num, poly_divides(poly_exp([-a, real_of_num(1)], n), p) && !poly_divides(poly_exp([-a, real_of_num(1)], SUC(n)), p))
      #|  \226\136\128 p : List[Real], \226\136\128 a : Real, !(poly(p) == poly(NIL)) \226\134\146 existsunique((n : Num) => poly_divides(poly_exp([-a, real_of_num(1)], n), p) && !poly_divides(poly_exp([-a, real_of_num(1)], SUC(n)), p))
      #|  (order : (Real, List[Real]) -> Num)((a : Real), (p : List[Real])) == select((n : Num) => poly_divides(poly_exp([-a, real_of_num(1)], n), p) && !poly_divides(poly_exp([-a, real_of_num(1)], SUC(n)), p))
      #|  (NIL : List[Real])
      #|  !(poly((p : List[Real])) == poly(NIL))
      #|  \226\136\128 p : List[Real], \226\136\128 a : Real, \226\136\128 n : Num, (poly_divides(poly_exp([-a, real_of_num(1)], n), p) && !poly_divides(poly_exp([-a, real_of_num(1)], SUC(n)), p)) == (n == order(a, p) && !(poly(p) == poly(NIL)))
      #|  \226\136\128 p : List[Real], \226\136\128 a : Real, !(poly(p) == poly(NIL)) \226\134\146 poly_divides(poly_exp([-a, real_of_num(1)], order(a, p)), p) && !poly_divides(poly_exp([-a, real_of_num(1)], SUC(order(a, p))), p)
      #|  \226\136\128 p : List[Real], \226\136\128 a : Real, \226\136\128 n : Num, !(poly(p) == poly(NIL)) && poly_divides(poly_exp([-a, real_of_num(1)], n), p) && !poly_divides(poly_exp([-a, real_of_num(1)], SUC(n)), p) \226\134\146 n == order(a, p)
      #|  \226\136\128 p : List[Real], \226\136\128 q : List[Real], \226\136\128 a : Real, poly(p) == poly(q) \226\134\146 order(a, p) == order(a, q)
      #|  (s : List[Real])
      #|  (n : Num)
      #|  order((a : Real), (p : List[Real]))
      #|  !(order((a : Real), (p : List[Real])) == 0)
      #|  (a : Real)
      #|  (q : List[Real])
      #|  (a : Real)
      #|  (q : List[Real])
      #|  (p : List[Real]) == NIL
      #|  poly((p : List[Real])) == poly(NIL)
      #|  \226\136\128 p : List[Real], \226\136\128 a : Real, (poly(p, a) == real_of_num(0)) == (poly(p) == poly(NIL) || !(order(a, p) == 0))
      #|  (NIL : List[Real])
      #|  poly((p : List[Real])) == poly(NIL)
      #|  \226\136\128 p : List[Real], \226\136\128 a : Real, \226\136\128 n : Num, poly_divides(poly_exp([-a, real_of_num(1)], n), p) == (poly(p) == poly(NIL) || n <= order(a, p))
      #|  (r : List[Real])
      #|  !poly_divides(poly_exp([-(a : Real), real_of_num(1)], SUC(order(a, (p : List[Real])))), p)
      #|  (r : List[Real])
      #|  (q : List[Real])
      #|  (q : List[Real])
      #|  (a : Real)
      #|  \226\136\128 p : List[Real], \226\136\128 a : Real, !(poly(p) == poly(NIL)) \226\134\146 (\226\136\131 q : List[Real], poly(p) == poly(poly_mul(poly_exp([-a, real_of_num(1)], order(a, p)), q)) && !poly_divides([-a, real_of_num(1)], q))
      #|  poly(poly_mul(poly_exp([-(a : Real), real_of_num(1)], order(a, (q : List[Real]))), poly_mul(poly_exp([-a, real_of_num(1)], order(a, (p : List[Real]))), poly_mul((r : List[Real]), (s : List[Real]))))) == poly(poly_mul(poly_exp([-a, real_of_num(1)], order(a, q)), poly_mul(poly_exp([-a, real_of_num(1)], order(a, p)), poly_mul([-a, real_of_num(1)], (t : List[Real])))))
      #|  poly(poly_mul(poly_exp([-(a : Real), real_of_num(1)], order(a, (p : List[Real]))), poly_mul((r : List[Real]), (s : List[Real])))) == poly(poly_mul(poly_exp([-a, real_of_num(1)], order(a, p)), poly_mul([-a, real_of_num(1)], (t : List[Real]))))
      #|  (t : List[Real])
      #|  poly_divides([-(a : Real), real_of_num(1)], poly_mul((r : List[Real]), (s : List[Real])))
      #|  (t : List[Real])
      #|  !(poly((q : List[Real])) == poly(NIL))
      #|  (a : Real)
      #|  (s : List[Real])
      #|  !(poly((p : List[Real])) == poly(NIL))
      #|  (a : Real)
      #|  (r : List[Real])
      #|  poly_mul((s : List[Real]), (r : List[Real]))
      #|  (s : List[Real])
      #|  !(poly((q : List[Real])) == poly(NIL))
      #|  (a : Real)
      #|  (r : List[Real])
      #|  !(poly((p : List[Real])) == poly(NIL))
      #|  (a : Real)
      #|  order((a : Real), (p : List[Real])) + order(a, (q : List[Real])) == order(a, poly_mul(p, q)) && !(poly(poly_mul(p, q)) == poly(NIL))
      #|  \226\136\128 a : Real, \226\136\128 p : List[Real], \226\136\128 q : List[Real], !(poly(poly_mul(p, q)) == poly(NIL)) \226\134\146 order(a, poly_mul(p, q)) == order(a, p) + order(a, q)
      #|  (x : Real)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, real_of_num(SUC((n : Num))) * (a * (b * (inv(real_of_num(SUC(n))) * c))) == a * (b * c)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, real_of_num(SUC((n : Num))) * a == real_of_num(SUC(n)) * b \226\134\146 a == b
      #|  (x : Real)
      #|  poly(poly_mul(poly_exp([-(a : Real), real_of_num(1)], (n : Num)), (q : List[Real]))) == poly(poly_mul(poly_exp([-a, real_of_num(1)], n), poly_mul([-a, real_of_num(1)], poly_cmul(inv(real_of_num(SUC(n))), poly_add((r : List[Real]), poly_neg(poly_diff(q)))))))
      #|  poly_cmul(inv(real_of_num(SUC((n : Num)))), poly_add((r : List[Real]), poly_neg(poly_diff((q : List[Real])))))
      #|  !poly_divides([-(a : Real), real_of_num(1)], (q : List[Real]))
      #|  (r : List[Real])
      #|  poly_add(poly_mul([-(a : Real), real_of_num(1)], poly_diff((q : List[Real]))), poly_cmul(real_of_num(SUC((n : Num))), q))
      #|  \226\136\128 r : List[Real], poly_divides(r, poly_diff((p : List[Real]))) == poly_divides(r, poly_diff(poly_mul(poly_exp([-(a : Real), real_of_num(1)], SUC((n : Num))), (q : List[Real]))))
      #|  (n : Num)
      #|  order((a : Real), (p : List[Real]))
      #|  (a : Real)
      #|  (q : List[Real])
      #|  !(poly((p : List[Real])) == poly(NIL))
      #|  \226\136\128 p : List[Real], \226\136\128 a : Real, !(poly(poly_diff(p)) == poly(NIL)) && !(order(a, p) == 0) \226\134\146 order(a, p) == SUC(order(a, poly_diff(p)))
      #|  poly_add(poly_mul((r : List[Real]), (g : List[Real])), poly_mul((s : List[Real]), (f : List[Real])))
      #|  (g : List[Real])
      #|  (f : List[Real])
      #|  poly((d : List[Real])) == poly(poly_add(poly_mul((r : List[Real]), (p : List[Real])), poly_mul((s : List[Real]), poly_diff(p))))
      #|  order((a : Real), poly_diff((p : List[Real]))) == PRE(order(a, p))
      #|  poly_divides(poly_exp([-(a : Real), real_of_num(1)], order(a, poly_diff((p : List[Real])))), p) && poly_divides(poly_exp([-a, real_of_num(1)], order(a, poly_diff(p))), poly_diff(p))
      #|  poly_divides(poly_exp([-(a : Real), real_of_num(1)], order(a, poly_diff((p : List[Real])))), (d : List[Real]))
      #|  order((a : Real), poly_diff((p : List[Real]))) <= order(a, (d : List[Real]))
      #|  (a : Real)
      #|  (p : List[Real])
      #|  !(poly((p : List[Real])) == poly(NIL))
      #|  order((a : Real), poly_mul((e : List[Real]), (d : List[Real])))
      #|  order((a : Real), poly_diff((p : List[Real]))) == order(a, (e : List[Real])) + order(a, (d : List[Real]))
      #|  order((a : Real), (p : List[Real])) == 0
      #|  order((a : Real), poly_mul((q : List[Real]), (d : List[Real])))
      #|  order((a : Real), (p : List[Real])) == order(a, (q : List[Real])) + order(a, (d : List[Real]))
      #|  \226\136\128 p : List[Real], \226\136\128 q : List[Real], \226\136\128 d : List[Real], \226\136\128 e : List[Real], \226\136\128 r : List[Real], \226\136\128 s : List[Real], !(poly(poly_diff(p)) == poly(NIL)) && poly(p) == poly(poly_mul(q, d)) && poly(poly_diff(p)) == poly(poly_mul(e, d)) && poly(d) == poly(poly_add(poly_mul(r, p), poly_mul(s, poly_diff(p)))) \226\134\146 (\226\136\128 a : Real, order(a, q) == (if order(a, p) == 0 { 0 } else { 1 }))
      #|  PRE
      #|  (rsquarefree : (List[Real]) -> Bool)((p : List[Real])) == (!(poly(p) == poly(NIL)) && (\226\136\128 a : Real, order(a, p) == 0 || order(a, p) == 1))
      #|  1
      #|  (a : Real)
      #|  [(h : Real)]
      #|  (a : Real)
      #|  !(poly((p : List[Real])) == poly(NIL))
      #|  (h : Real)
      #|  poly(poly_diff((p : List[Real]))) == poly(NIL)
      #|  poly((p : List[Real])) == poly(NIL)
      #|  \226\136\128 p : List[Real], rsquarefree(p) == (\226\136\128 a : Real, !(poly(p, a) == real_of_num(0) && poly(poly_diff(p), a) == real_of_num(0)))
      #|  (NIL : List[Real])
      #|  (q : List[Real]) == NIL
      #|  poly((q : List[Real]), (a : Real)) == real_of_num(0)
      #|  !poly_divides([-(a : Real), real_of_num(1)], (q : List[Real]))
      #|  1
      #|  (q : List[Real])
      #|  (a : Real)
      #|  (a : Real)
      #|  (q : List[Real])
      #|  \226\136\128 p : List[Real], \226\136\128 a : Real, rsquarefree(p) && poly(p, a) == real_of_num(0) \226\134\146 (\226\136\131 q : List[Real], poly(p) == poly(poly_mul([-a, real_of_num(1)], q)) && !(poly(q, a) == real_of_num(0)))
      #|  poly((p : List[Real])) == poly(poly_mul((q : List[Real]), (d : List[Real])))
      #|  !(poly((p : List[Real])) == poly(NIL))
      #|  !(poly((p : List[Real])) == poly(NIL))
      #|  \226\136\128 p : List[Real], \226\136\128 q : List[Real], \226\136\128 d : List[Real], \226\136\128 e : List[Real], \226\136\128 r : List[Real], \226\136\128 s : List[Real], !(poly(poly_diff(p)) == poly(NIL)) && poly(p) == poly(poly_mul(q, d)) && poly(poly_diff(p)) == poly(poly_mul(e, d)) && poly(d) == poly(poly_add(poly_mul(r, p), poly_mul(s, poly_diff(p)))) \226\134\146 rsquarefree(q) && (\226\136\128 a : Real, (poly(q, a) == real_of_num(0)) == (poly(p, a) == real_of_num(0)))
      #|  (normalize : (List[Real]) -> List[Real])(NIL) == NIL && normalize(CONS((h : Real), (t : List[Real]))) == (if normalize(t) == NIL { if h == real_of_num(0) { NIL } else { [h] } } else { CONS(h, normalize(t)) })
      #|  poly(normalize((t : List[Real]))) == poly(t)
      #|  (h : Real) == real_of_num(0)
      #|  \226\136\128 p : List[Real], poly(normalize(p)) == poly(p)
      #|  (degree : (List[Real]) -> Num)((p : List[Real])) == PRE(LENGTH(normalize(p)))
      #|  normalize((t : List[Real])) == NIL
      #|  (p : List[Real])
      #|  (p : List[Real])
      #|  normalize((p : List[Real])) == NIL
      #|  \226\136\128 p : List[Real], poly(p) == poly(NIL) \226\134\146 degree(p) == 0
      #|  {(x : Real) | \226\136\131 n : Num, n < SUC((N : Num)) && x == (i : (Num) -> Real)(n)} == INSERT(i(N), {(x : Real) | \226\136\131 n : Num, n < N && x == i(n)})
      #|  {(x : Real) | \226\136\131 n : Num, n < 0 && x == (i : (Num) -> Real)(n)} == {}
      #|  (N : Num)
      #|  (N : Num)
      #|  {(x : Real) | \226\136\131 n : Num, n < (N : Num) && x == (i : (Num) -> Real)(n)}
      #|  (i : (Num) -> Real)
      #|  (N : Num)
      #|  \226\136\128 p : List[Real], !(poly(p) == poly(NIL)) \226\134\146 FINITE({(x : Real) | poly(p, x) == real_of_num(0)})
      #|  abs((h : Real)) + abs((x : Real) * poly((t : List[Real]), x))
      #|  \226\136\128 x : Real, \226\136\128 k : Real, \226\136\128 p : List[Real], abs(x) <= k \226\134\146 abs(poly(p, x)) <= poly(MAP(abs, p), k)
      #|  normalize(CONS((h : Real), (t : List[Real]))) == ((n : List[Real]) => if n == NIL { if h == real_of_num(0) { NIL } else { [h] } } else { CONS(h, n) })(normalize(t))
      #|  \226\136\128 h : Real, \226\136\128 p : List[Real], !(p == NIL) \226\134\146 !(poly_cmul(h, p) == NIL)
      #|  (t : List[Real])
      #|  (t : List[Real])
      #|  \226\136\128 p1 : List[Real], \226\136\128 p2 : List[Real], !(p1 == NIL) && !(p2 == NIL) \226\134\146 !(poly_mul(p1, p2) == NIL)
      #|  \226\136\128 p : List[Real], !(p == NIL) \226\134\146 !(poly_exp(p, (n : Num)) == NIL)
      #|  CONS((h : Real), (t : List[Real]))
      #|  \226\136\128 n : Num, \226\136\128 p : List[Real], !(p == NIL) \226\134\146 !(poly_exp(p, n) == NIL)
      #|  !([real_of_num(0), real_of_num(1)] == NIL)
      #|  \226\136\128 n : Num, !(poly_exp([real_of_num(0), real_of_num(1)], n) == NIL)
      #|  real_of_num(1) * (h : Real) == h
      #|  \226\136\128 p : List[Real], poly_cmul(real_of_num(1), p) == p
      #|  \226\136\128 p : List[Real], poly_mul([real_of_num(1)], p) == p
      #|  (h : Real) * real_of_num(1) == h
      #|  (h : Real) + real_of_num(0) == h
      #|  (t : List[Real]) == NIL
      #|  \226\136\128 p : List[Real], poly_mul(p, [real_of_num(1)]) == p
      #|  \226\136\128 y : List[Real], poly_add((t : List[Real]), y) == poly_add(y, t)
      #|  (t' : List[Real])
      #|  (h' : Real)
      #|  (h : Real)
      #|  \226\136\128 x : List[Real], \226\136\128 y : List[Real], poly_add(x, y) == poly_add(y, x)
      #|  \226\136\128 y : List[Real], \226\136\128 z : List[Real], poly_add((t : List[Real]), poly_add(y, z)) == poly_add(poly_add(t, y), z)
      #|  (t'' : List[Real])
      #|  (t' : List[Real])
      #|  \226\136\128 x : List[Real], \226\136\128 y : List[Real], \226\136\128 z : List[Real], poly_add(x, poly_add(y, z)) == poly_add(poly_add(x, y), z)
      #|  real_of_num(0) * (h : Real) + (h' : Real) == h'
      #|  (t : List[Real])
      #|  (t : List[Real])
      #|  (h : Real)
      #|  (h : Real)
      #|  \226\136\128 p : List[Real], TL(poly_mul([real_of_num(0), real_of_num(1)], p)) == p
      #|  real_of_num(0) * (h : Real) + real_of_num(0) == real_of_num(0)
      #|  \226\136\128 p : List[Real], HD(poly_mul([real_of_num(0), real_of_num(1)], p)) == real_of_num(0)
      #|  \226\136\128 n : Num, TL(poly_exp([real_of_num(0), real_of_num(1)], SUC(n))) == poly_exp([real_of_num(0), real_of_num(1)], n)
      #|  real_of_num(0) * real_of_num(1) + real_of_num(0) == real_of_num(0)
      #|  \226\136\128 n : Num, HD(poly_exp([real_of_num(0), real_of_num(1)], SUC(n))) == real_of_num(0)
      #|  (t' : List[Real])
      #|  (h' : Real)
      #|  \226\136\128 p1 : List[Real], \226\136\128 p2 : List[Real], !(p1 == NIL) && !(p2 == NIL) \226\134\146 HD(poly_add(p1, p2)) == HD(p1) + HD(p2)
      #|  \226\136\128 x : Real, \226\136\128 p : List[Real], !(p == NIL) \226\134\146 HD(poly_cmul(x, p)) == x * HD(p)
      #|  \226\136\128 x : Real, \226\136\128 p : List[Real], !(p == NIL) \226\134\146 TL(poly_cmul(x, p)) == poly_cmul(x, TL(p))
      #|  (t : List[Real]) == NIL
      #|  \226\136\128 p1 : List[Real], \226\136\128 p2 : List[Real], !(p1 == NIL) && !(p2 == NIL) \226\134\146 HD(poly_mul(p1, p2)) == HD(p1) * HD(p2)
      #|  (t : List[Real]) == NIL
      #|  \226\136\128 n : Num, \226\136\128 p : List[Real], !(p == NIL) \226\134\146 HD(poly_exp(p, n)) == pow(HD(p), n)
      #|  \226\136\128 x : List[Real], (\226\136\128 y : List[Real], poly_add(x, y) == y && poly_add(y, x) == y) \226\134\146 (\226\136\128 y : List[Real], poly_add(CONS((h : Real), (t : List[Real])), y) == y && poly_add(y, CONS(h, t)) == y)
      #|  (NIL : List[Real])
      #|  (NIL : List[Real])
      #|  neutral(poly_add) == NIL
      #|  \226\136\128 x : List[Real], poly_add(neutral(poly_add), x) == x
      #|  monoidal(poly_add)
      #|  \226\136\128 n : Num, \226\136\128 h : Real, \226\136\128 h' : Real, real_of_num(n) * h + real_of_num(n) * h' == real_of_num(n) * (h + h')
      #|  \226\136\128 t1 : List[Real], \226\136\128 t2 : List[Real], \226\136\128 n : Num, poly_diff_aux(n, poly_add(t1, t2)) == poly_add(poly_diff_aux(n, t1), poly_diff_aux(n, t2))
      #|  \226\136\128 h0 : Real, \226\136\128 t0 : List[Real], \226\136\128 h1 : Real, \226\136\128 t1 : List[Real], !(poly_add(CONS(h0, t0), CONS(h1, t1)) == NIL)
      #|  \226\136\128 h0 : Real, \226\136\128 t0 : List[Real], \226\136\128 h1 : Real, \226\136\128 t1 : List[Real], TL(poly_add(CONS(h0, t0), CONS(h1, t1))) == poly_add(TL(CONS(h0, t0)), TL(CONS(h1, t1)))
      #|  \226\136\128 p1 : List[Real], \226\136\128 p2 : List[Real], poly_diff(poly_add(p1, p2)) == poly_add(poly_diff(p1), poly_diff(p2))
      #|  \226\136\128 c : Real, \226\136\128 n : Num, poly_diff_aux(n, poly_cmul(c, (t : List[Real]))) == poly_cmul(c, poly_diff_aux(n, t))
      #|  SUC((n : Num))
      #|  (c : Real)
      #|  (a : Real) * ((b : Real) * (c : Real)) == b * (a * c)
      #|  \226\136\128 p : List[Real], \226\136\128 c : Real, \226\136\128 n : Num, poly_diff_aux(n, poly_cmul(c, p)) == poly_cmul(c, poly_diff_aux(n, p))
      #|  \226\136\128 p : List[Real], \226\136\128 c : Real, poly_diff(poly_cmul(c, p)) == poly_cmul(c, poly_diff(p))
      #|  \226\136\128 c : Real, \226\136\128 p : List[Real], LENGTH(poly_cmul(c, p)) == LENGTH(p)
      #|  !((x : Num) > (y : Num)) \226\134\146 !(SUC(x) > SUC(y))
      #|  (x : Num) > (y : Num) \226\134\146 SUC(x) > SUC(y)
      #|  LENGTH((t : List[Real])) > LENGTH((t' : List[Real]))
      #|  MAX((x : Num), (y : Num)) == (if x > y { x } else { y })
      #|  \226\136\128 p : List[Real], \226\136\128 q : List[Real], LENGTH(poly_add(p, q)) == MAX(LENGTH(p), LENGTH(q))
      #|  \226\136\128 h : Real, \226\136\128 t' : List[Real], LENGTH(poly_mul((t : List[Real]), CONS(h, t'))) >= LENGTH(t)
      #|  (t' : List[Real])
      #|  (h' : Real)
      #|  ((x : Num) >= (y : Num)) == (SUC(x) >= SUC(y))
      #|  (y : Num) >= (z : Num) \226\134\146 (x : Num) + (y - x) >= z
      #|  SUC(LENGTH((t : List[Real])))
      #|  LENGTH(poly_cmul((h : Real), CONS((h' : Real), (t' : List[Real]))))
      #|  SUC(LENGTH(poly_mul((t : List[Real]), CONS((h' : Real), (t' : List[Real])))))
      #|  \226\136\128 x : Num, \226\136\128 y : Num, MAX(x, y) == x + (y - x)
      #|  (t : List[Real]) == NIL
      #|  \226\136\128 p : List[Real], \226\136\128 h : Real, \226\136\128 t : List[Real], LENGTH(poly_mul(p, CONS(h, t))) >= LENGTH(p)
      #|  SUC((n : Num))
      #|  \226\136\128 n : Num, poly_exp([real_of_num(0), real_of_num(1)], SUC(n)) == CONS(real_of_num(0), poly_exp([real_of_num(0), real_of_num(1)], n))
      #|  \226\136\128 q : List[Real], \226\136\128 p : List[Real], !(q == NIL) \226\134\146 LENGTH(poly_mul(p, q)) >= LENGTH(p)
      #|  (SUC((x : Num)) == SUC((y : Num))) == (x == y)
      #|  \226\136\128 n : Num, LENGTH(poly_exp([real_of_num(0), real_of_num(1)], n)) == SUC(n)
      #|  0 <= 0 + 1 && 0 <= LENGTH((t : List[Real]))
      #|  LENGTH((t : List[Real]))
      #|  0
      #|  0
      #|  (f : (Num) -> Real)
      #|  LENGTH((t : List[Real]))
      #|  1
      #|  (f : (Num) -> Real)
      #|  !((t : List[Real]) == NIL)
      #|  !((x : Num) == 0) == (1 <= x)
      #|  1 <= LENGTH((t : List[Real])) \226\134\146 LENGTH(t) - 1 == PRE(LENGTH(t))
      #|  (A : Real) * ((B : Real) * (C : Real)) == B * (A * C)
      #|  op_dot_dot(0, 0)
      #|  0 + 1 == 1
      #|  op_dot_dot(0, 0)
      #|  (t : List[Real]) == NIL
      #|  \226\136\128 p : List[Real], \226\136\128 x : Real, !(p == NIL) \226\134\146 poly(p, x) == sum(op_dot_dot(0, PRE(LENGTH(p))), (i : Num) => EL(i, p) * pow(x, i))
      #|  \226\136\128 n : Num, \226\136\128 x : Real, \226\136\128 f : (Num) -> List[Real], iterate(op_plus, op_dot_dot(0, n), (i : Num) => poly(f(i), x)) == poly(iterate(poly_add, op_dot_dot(0, n), f), x)
      #|  poly_diff
      #|  poly_exp
      #|  poly_divides
      #|poly =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#poly:fun(list(real),fun(real,real)) #NIL:list(real)) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) ((#poly:fun(list(real),fun(real,real)) ((#CONS:fun(real,fun(list(real),list(real))) h:real) t:list(real))) x:real)) ((#real_add:fun(real,fun(real,real)) h:real) ((#real_mul:fun(real,fun(real,real)) x:real) ((#poly:fun(list(real),fun(real,real)) t:list(real)) x:real)))))
      #|POLY_CONST =  |- (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#poly:fun(list(real),fun(real,real)) ((#CONS:fun(real,fun(list(real),list(real))) c:real) #NIL:list(real))) x:real)) c:real)))))
      #|POLY_X =  |- (#forall:fun(fun('?1,bool),bool) (\c:'?1. (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#poly:fun(list(real),fun(real,real)) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) x:real)) x:real)))))
      #|poly_add =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(list(real),fun(list(real),bool)) ((#poly_add:fun(list(real),fun(list(real),list(real))) #NIL:list(real)) l2:list(real))) l2:list(real))) ((#=:fun(list(real),fun(list(real),bool)) ((#poly_add:fun(list(real),fun(list(real),list(real))) ((#CONS:fun(real,fun(list(real),list(real))) h:real) t:list(real))) l2:list(real))) (((#COND:fun(bool,fun(list(real),fun(list(real),list(real)))) ((#=:fun(list(real),fun(list(real),bool)) l2:list(real)) #NIL:list(real))) ((#CONS:fun(real,fun(list(real),list(real))) h:real) t:list(real))) ((#CONS:fun(real,fun(list(real),list(real))) ((#real_add:fun(real,fun(real,real)) h:real) (#HD:fun(list(real),real) l2:list(real)))) ((#poly_add:fun(list(real),fun(list(real),list(real))) t:list(real)) (#TL:fun(list(real),list(real)) l2:list(real)))))))
      #|poly_cmul =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(list(real),fun(list(real),bool)) ((#poly_cmul:fun(real,fun(list(real),list(real))) c:real) #NIL:list(real))) #NIL:list(real))) ((#=:fun(list(real),fun(list(real),bool)) ((#poly_cmul:fun(real,fun(list(real),list(real))) c:real) ((#CONS:fun(real,fun(list(real),list(real))) h:real) t:list(real)))) ((#CONS:fun(real,fun(list(real),list(real))) ((#real_mul:fun(real,fun(real,real)) c:real) h:real)) ((#poly_cmul:fun(real,fun(list(real),list(real))) c:real) t:list(real)))))
      #|poly_neg =  |- ((#=:fun(fun(list(real),list(real)),fun(fun(list(real),list(real)),bool)) #poly_neg:fun(list(real),list(real))) (#poly_cmul:fun(real,fun(list(real),list(real))) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|poly_mul =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(list(real),fun(list(real),bool)) ((#poly_mul:fun(list(real),fun(list(real),list(real))) #NIL:list(real)) l2:list(real))) #NIL:list(real))) ((#=:fun(list(real),fun(list(real),bool)) ((#poly_mul:fun(list(real),fun(list(real),list(real))) ((#CONS:fun(real,fun(list(real),list(real))) h:real) t:list(real))) l2:list(real))) (((#COND:fun(bool,fun(list(real),fun(list(real),list(real)))) ((#=:fun(list(real),fun(list(real),bool)) t:list(real)) #NIL:list(real))) ((#poly_cmul:fun(real,fun(list(real),list(real))) h:real) l2:list(real))) ((#poly_add:fun(list(real),fun(list(real),list(real))) ((#poly_cmul:fun(real,fun(list(real),list(real))) h:real) l2:list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#poly_mul:fun(list(real),fun(list(real),list(real))) t:list(real)) l2:list(real)))))))
      #|poly_exp =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(list(real),fun(list(real),bool)) ((#poly_exp:fun(list(real),fun(num,list(real))) p:list(real)) (#NUMERAL:fun(num,num) #_0:num))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) ((#=:fun(list(real),fun(list(real),bool)) ((#poly_exp:fun(list(real),fun(num,list(real))) p:list(real)) (#SUC:fun(num,num) n:num))) ((#poly_mul:fun(list(real),fun(list(real),list(real))) p:list(real)) ((#poly_exp:fun(list(real),fun(num,list(real))) p:list(real)) n:num))))
      #|poly_diff_aux =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(list(real),fun(list(real),bool)) ((#poly_diff_aux:fun(num,fun(list(real),list(real))) n:num) #NIL:list(real))) #NIL:list(real))) ((#=:fun(list(real),fun(list(real),bool)) ((#poly_diff_aux:fun(num,fun(list(real),list(real))) n:num) ((#CONS:fun(real,fun(list(real),list(real))) h:real) t:list(real)))) ((#CONS:fun(real,fun(list(real),list(real))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) h:real)) ((#poly_diff_aux:fun(num,fun(list(real),list(real))) (#SUC:fun(num,num) n:num)) t:list(real)))))
      #|poly_diff =  |- (#forall:fun(fun(list(real),bool),bool) (\l:list(real). ((#=:fun(list(real),fun(list(real),bool)) (#poly_diff:fun(list(real),list(real)) l:list(real))) (((#COND:fun(bool,fun(list(real),fun(list(real),list(real)))) ((#=:fun(list(real),fun(list(real),bool)) l:list(real)) #NIL:list(real))) #NIL:list(real)) ((#poly_diff_aux:fun(num,fun(list(real),list(real))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#TL:fun(list(real),list(real)) l:list(real)))))))
      #|LENGTH_POLY_DIFF_AUX =  |- (#forall:fun(fun(list(real),bool),bool) (\l:list(real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(real),num) ((#poly_diff_aux:fun(num,fun(list(real),list(real))) n:num) l:list(real)))) (#LENGTH:fun(list(real),num) l:list(real)))))))
      #|LENGTH_POLY_DIFF =  |- (#forall:fun(fun(list(real),bool),bool) (\l:list(real). ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(real),num) (#poly_diff:fun(list(real),list(real)) l:list(real)))) (#PRE:fun(num,num) (#LENGTH:fun(list(real),num) l:list(real))))))
      #|POLY_ADD_CLAUSES =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(list(real),fun(list(real),bool)) ((#poly_add:fun(list(real),fun(list(real),list(real))) #NIL:list(real)) p2:list(real))) p2:list(real))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(list(real),fun(list(real),bool)) ((#poly_add:fun(list(real),fun(list(real),list(real))) p1:list(real)) #NIL:list(real))) p1:list(real))) ((#=:fun(list(real),fun(list(real),bool)) ((#poly_add:fun(list(real),fun(list(real),list(real))) ((#CONS:fun(real,fun(list(real),list(real))) h1:real) t1:list(real))) ((#CONS:fun(real,fun(list(real),list(real))) h2:real) t2:list(real)))) ((#CONS:fun(real,fun(list(real),list(real))) ((#real_add:fun(real,fun(real,real)) h1:real) h2:real)) ((#poly_add:fun(list(real),fun(list(real),list(real))) t1:list(real)) t2:list(real))))))
      #|POLY_CMUL_CLAUSES =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(list(real),fun(list(real),bool)) ((#poly_cmul:fun(real,fun(list(real),list(real))) c:real) #NIL:list(real))) #NIL:list(real))) ((#=:fun(list(real),fun(list(real),bool)) ((#poly_cmul:fun(real,fun(list(real),list(real))) c:real) ((#CONS:fun(real,fun(list(real),list(real))) h:real) t:list(real)))) ((#CONS:fun(real,fun(list(real),list(real))) ((#real_mul:fun(real,fun(real,real)) c:real) h:real)) ((#poly_cmul:fun(real,fun(list(real),list(real))) c:real) t:list(real)))))
      #|POLY_NEG_CLAUSES =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(list(real),fun(list(real),bool)) (#poly_neg:fun(list(real),list(real)) #NIL:list(real))) #NIL:list(real))) ((#=:fun(list(real),fun(list(real),bool)) (#poly_neg:fun(list(real),list(real)) ((#CONS:fun(real,fun(list(real),list(real))) h:real) t:list(real)))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_neg:fun(real,real) h:real)) (#poly_neg:fun(list(real),list(real)) t:list(real)))))
      #|POLY_MUL_CLAUSES =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(list(real),fun(list(real),bool)) ((#poly_mul:fun(list(real),fun(list(real),list(real))) #NIL:list(real)) p2:list(real))) #NIL:list(real))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(list(real),fun(list(real),bool)) ((#poly_mul:fun(list(real),fun(list(real),list(real))) ((#CONS:fun(real,fun(list(real),list(real))) h1:real) #NIL:list(real))) p2:list(real))) ((#poly_cmul:fun(real,fun(list(real),list(real))) h1:real) p2:list(real)))) ((#=:fun(list(real),fun(list(real),bool)) ((#poly_mul:fun(list(real),fun(list(real),list(real))) ((#CONS:fun(real,fun(list(real),list(real))) h1:real) ((#CONS:fun(real,fun(list(real),list(real))) k1:real) t1:list(real)))) p2:list(real))) ((#poly_add:fun(list(real),fun(list(real),list(real))) ((#poly_cmul:fun(real,fun(list(real),list(real))) h1:real) p2:list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#poly_mul:fun(list(real),fun(list(real),list(real))) ((#CONS:fun(real,fun(list(real),list(real))) k1:real) t1:list(real))) p2:list(real)))))))
      #|POLY_DIFF_CLAUSES =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(list(real),fun(list(real),bool)) (#poly_diff:fun(list(real),list(real)) #NIL:list(real))) #NIL:list(real))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(list(real),fun(list(real),bool)) (#poly_diff:fun(list(real),list(real)) ((#CONS:fun(real,fun(list(real),list(real))) c:real) #NIL:list(real)))) #NIL:list(real))) ((#=:fun(list(real),fun(list(real),bool)) (#poly_diff:fun(list(real),list(real)) ((#CONS:fun(real,fun(list(real),list(real))) h:real) t:list(real)))) ((#poly_diff_aux:fun(num,fun(list(real),list(real))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) t:list(real)))))
      #|POLY_ADD =  |- (#forall:fun(fun(list(real),bool),bool) (\p1:list(real). (#forall:fun(fun(list(real),bool),bool) (\p2:list(real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#poly:fun(list(real),fun(real,real)) ((#poly_add:fun(list(real),fun(list(real),list(real))) p1:list(real)) p2:list(real))) x:real)) ((#real_add:fun(real,fun(real,real)) ((#poly:fun(list(real),fun(real,real)) p1:list(real)) x:real)) ((#poly:fun(list(real),fun(real,real)) p2:list(real)) x:real)))))))))
      #|POLY_CMUL =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#poly:fun(list(real),fun(real,real)) ((#poly_cmul:fun(real,fun(list(real),list(real))) c:real) p:list(real))) x:real)) ((#real_mul:fun(real,fun(real,real)) c:real) ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real)))))))))
      #|POLY_NEG =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#poly:fun(list(real),fun(real,real)) (#poly_neg:fun(list(real),list(real)) p:list(real))) x:real)) (#real_neg:fun(real,real) ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real)))))))
      #|POLY_MUL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(list(real),bool),bool) (\p1:list(real). (#forall:fun(fun(list(real),bool),bool) (\p2:list(real). ((#=:fun(real,fun(real,bool)) ((#poly:fun(list(real),fun(real,real)) ((#poly_mul:fun(list(real),fun(list(real),list(real))) p1:list(real)) p2:list(real))) x:real)) ((#real_mul:fun(real,fun(real,real)) ((#poly:fun(list(real),fun(real,real)) p1:list(real)) x:real)) ((#poly:fun(list(real),fun(real,real)) p2:list(real)) x:real)))))))))
      #|POLY_EXP =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#poly:fun(list(real),fun(real,real)) ((#poly_exp:fun(list(real),fun(num,list(real))) p:list(real)) n:num)) x:real)) ((#real_pow:fun(real,fun(num,real)) ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real)) n:num))))))))
      #|POLY_DIFF_LEMMA =  |- (#forall:fun(fun(list(real),bool),bool) (\l:list(real). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) (#SUC:fun(num,num) n:num))) ((#poly:fun(list(real),fun(real,real)) l:list(real)) x:real)))) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)) ((#poly:fun(list(real),fun(real,real)) ((#poly_diff_aux:fun(num,fun(list(real),list(real))) (#SUC:fun(num,num) n:num)) l:list(real))) x:real))) x:real)))))))
      #|POLY_DIFF =  |- (#forall:fun(fun(list(real),bool),bool) (\l:list(real). (#forall:fun(fun(real,bool),bool) (\x:real. (((#diffl:fun(fun(real,real),fun(real,fun(real,bool))) (\x:real. ((#poly:fun(list(real),fun(real,real)) l:list(real)) x:real))) ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) l:list(real))) x:real)) x:real)))))
      #|POLY_DIFFERENTIABLE =  |- (#forall:fun(fun(list(real),bool),bool) (\l:list(real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#differentiable:fun(fun(real,real),fun(real,bool)) (\x:real. ((#poly:fun(list(real),fun(real,real)) l:list(real)) x:real))) x:real)))))
      #|POLY_CONT =  |- (#forall:fun(fun(list(real),bool),bool) (\l:list(real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#contl:fun(fun(real,real),fun(real,bool)) (\x:real. ((#poly:fun(list(real),fun(real,real)) l:list(real)) x:real))) x:real)))))
      #|POLY_IVT_POS =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) ((#poly:fun(list(real),fun(real,real)) p:list(real)) a:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_gt:fun(real,fun(real,bool)) ((#poly:fun(list(real),fun(real,real)) p:list(real)) b:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) b:real)) ((#=:fun(real,fun(real,bool)) ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))))))
      #|POLY_IVT_NEG =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_gt:fun(real,fun(real,bool)) ((#poly:fun(list(real),fun(real,real)) p:list(real)) a:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_lt:fun(real,fun(real,bool)) ((#poly:fun(list(real),fun(real,real)) p:list(real)) b:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) b:real)) ((#=:fun(real,fun(real,bool)) ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))))))
      #|POLY_MVT =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) b:real)) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) b:real)) ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) ((#poly:fun(list(real),fun(real,real)) p:list(real)) b:real)) ((#poly:fun(list(real),fun(real,real)) p:list(real)) a:real))) ((#real_mul:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) b:real) a:real)) ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))))))))))))))
      #|POLY_MVT_ADD =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#?:fun(fun(real,bool),bool) (\y:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) y:real)) (#real_abs:fun(real,real) x:real))) ((#=:fun(real,fun(real,bool)) ((#poly:fun(list(real),fun(real,real)) p:list(real)) ((#real_add:fun(real,fun(real,real)) a:real) x:real))) ((#real_add:fun(real,fun(real,real)) ((#poly:fun(list(real),fun(real,real)) p:list(real)) a:real)) ((#real_mul:fun(real,fun(real,real)) x:real) ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) ((#real_add:fun(real,fun(real,real)) a:real) y:real))))))))))))))
      #|POLY_ADD_RZERO =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) ((#poly_add:fun(list(real),fun(list(real),list(real))) p:list(real)) #NIL:list(real)))) (#poly:fun(list(real),fun(real,real)) p:list(real)))))
      #|POLY_MUL_ASSOC =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\q:list(real). (#forall:fun(fun(list(real),bool),bool) (\r:list(real). ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) ((#poly_mul:fun(list(real),fun(list(real),list(real))) p:list(real)) ((#poly_mul:fun(list(real),fun(list(real),list(real))) q:list(real)) r:list(real))))) (#poly:fun(list(real),fun(real,real)) ((#poly_mul:fun(list(real),fun(list(real),list(real))) ((#poly_mul:fun(list(real),fun(list(real),list(real))) p:list(real)) q:list(real))) r:list(real))))))))))
      #|POLY_EXP_ADD =  |- (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) ((#poly_exp:fun(list(real),fun(num,list(real))) p:list(real)) ((#+:fun(num,fun(num,num)) n:num) d:num)))) (#poly:fun(list(real),fun(real,real)) ((#poly_mul:fun(list(real),fun(list(real),list(real))) ((#poly_exp:fun(list(real),fun(num,list(real))) p:list(real)) n:num)) ((#poly_exp:fun(list(real),fun(num,list(real))) p:list(real)) d:num))))))))))
      #|POLY_DIFF_AUX_ADD =  |- (#forall:fun(fun(list(real),bool),bool) (\p1:list(real). (#forall:fun(fun(list(real),bool),bool) (\p2:list(real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) ((#poly_diff_aux:fun(num,fun(list(real),list(real))) n:num) ((#poly_add:fun(list(real),fun(list(real),list(real))) p1:list(real)) p2:list(real))))) (#poly:fun(list(real),fun(real,real)) ((#poly_add:fun(list(real),fun(list(real),list(real))) ((#poly_diff_aux:fun(num,fun(list(real),list(real))) n:num) p1:list(real))) ((#poly_diff_aux:fun(num,fun(list(real),list(real))) n:num) p2:list(real)))))))))))
      #|POLY_DIFF_AUX_CMUL =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) ((#poly_diff_aux:fun(num,fun(list(real),list(real))) n:num) ((#poly_cmul:fun(real,fun(list(real),list(real))) c:real) p:list(real))))) (#poly:fun(list(real),fun(real,real)) ((#poly_cmul:fun(real,fun(list(real),list(real))) c:real) ((#poly_diff_aux:fun(num,fun(list(real),list(real))) n:num) p:list(real)))))))))))
      #|POLY_DIFF_AUX_NEG =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) ((#poly_diff_aux:fun(num,fun(list(real),list(real))) n:num) (#poly_neg:fun(list(real),list(real)) p:list(real))))) (#poly:fun(list(real),fun(real,real)) (#poly_neg:fun(list(real),list(real)) ((#poly_diff_aux:fun(num,fun(list(real),list(real))) n:num) p:list(real)))))))))
      #|POLY_DIFF_AUX_MUL_LEMMA =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) ((#poly_diff_aux:fun(num,fun(list(real),list(real))) (#SUC:fun(num,num) n:num)) p:list(real)))) (#poly:fun(list(real),fun(real,real)) ((#poly_add:fun(list(real),fun(list(real),list(real))) ((#poly_diff_aux:fun(num,fun(list(real),list(real))) n:num) p:list(real))) p:list(real))))))))
      #|POLY_DIFF_ADD =  |- (#forall:fun(fun(list(real),bool),bool) (\p1:list(real). (#forall:fun(fun(list(real),bool),bool) (\p2:list(real). ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) ((#poly_add:fun(list(real),fun(list(real),list(real))) p1:list(real)) p2:list(real))))) (#poly:fun(list(real),fun(real,real)) ((#poly_add:fun(list(real),fun(list(real),list(real))) (#poly_diff:fun(list(real),list(real)) p1:list(real))) (#poly_diff:fun(list(real),list(real)) p2:list(real)))))))))
      #|POLY_DIFF_CMUL =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(real,bool),bool) (\c:real. ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) ((#poly_cmul:fun(real,fun(list(real),list(real))) c:real) p:list(real))))) (#poly:fun(list(real),fun(real,real)) ((#poly_cmul:fun(real,fun(list(real),list(real))) c:real) (#poly_diff:fun(list(real),list(real)) p:list(real)))))))))
      #|POLY_DIFF_NEG =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) (#poly_neg:fun(list(real),list(real)) p:list(real))))) (#poly:fun(list(real),fun(real,real)) (#poly_neg:fun(list(real),list(real)) (#poly_diff:fun(list(real),list(real)) p:list(real)))))))
      #|POLY_DIFF_MUL_LEMMA =  |- (#forall:fun(fun(list(real),bool),bool) (\t:list(real). (#forall:fun(fun(real,bool),bool) (\h:real. ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) ((#CONS:fun(real,fun(list(real),list(real))) h:real) t:list(real))))) (#poly:fun(list(real),fun(real,real)) ((#poly_add:fun(list(real),fun(list(real),list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#poly_diff:fun(list(real),list(real)) t:list(real)))) t:list(real))))))))
      #|POLY_DIFF_MUL =  |- (#forall:fun(fun(list(real),bool),bool) (\p1:list(real). (#forall:fun(fun(list(real),bool),bool) (\p2:list(real). ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) ((#poly_mul:fun(list(real),fun(list(real),list(real))) p1:list(real)) p2:list(real))))) (#poly:fun(list(real),fun(real,real)) ((#poly_add:fun(list(real),fun(list(real),list(real))) ((#poly_mul:fun(list(real),fun(list(real),list(real))) p1:list(real)) (#poly_diff:fun(list(real),list(real)) p2:list(real)))) ((#poly_mul:fun(list(real),fun(list(real),list(real))) (#poly_diff:fun(list(real),list(real)) p1:list(real))) p2:list(real)))))))))
      #|POLY_DIFF_EXP =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) ((#poly_exp:fun(list(real),fun(num,list(real))) p:list(real)) (#SUC:fun(num,num) n:num))))) (#poly:fun(list(real),fun(real,real)) ((#poly_mul:fun(list(real),fun(list(real),list(real))) ((#poly_cmul:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#SUC:fun(num,num) n:num))) ((#poly_exp:fun(list(real),fun(num,list(real))) p:list(real)) n:num))) (#poly_diff:fun(list(real),list(real)) p:list(real)))))))))
      #|POLY_DIFF_EXP_PRIME =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\a:real. ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) ((#poly_exp:fun(list(real),fun(num,list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_neg:fun(real,real) a:real)) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) (#SUC:fun(num,num) n:num))))) (#poly:fun(list(real),fun(real,real)) ((#poly_cmul:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#SUC:fun(num,num) n:num))) ((#poly_exp:fun(list(real),fun(num,list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_neg:fun(real,real) a:real)) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) n:num))))))))
      #|POLY_LINEAR_REM =  |- (#forall:fun(fun(list(real),bool),bool) (\t:list(real). (#forall:fun(fun(real,bool),bool) (\h:real. (#?:fun(fun(list(real),bool),bool) (\q:list(real). (#?:fun(fun(real,bool),bool) (\r:real. ((#=:fun(list(real),fun(list(real),bool)) ((#CONS:fun(real,fun(list(real),list(real))) h:real) t:list(real))) ((#poly_add:fun(list(real),fun(list(real),list(real))) ((#CONS:fun(real,fun(list(real),list(real))) r:real) #NIL:list(real))) ((#poly_mul:fun(list(real),fun(list(real),list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_neg:fun(real,real) a:real)) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) q:list(real))))))))))))
      #|POLY_LINEAR_DIVIDES =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#poly:fun(list(real),fun(real,real)) p:list(real)) a:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(list(real),fun(list(real),bool)) p:list(real)) #NIL:list(real))) (#?:fun(fun(list(real),bool),bool) (\q:list(real). ((#=:fun(list(real),fun(list(real),bool)) p:list(real)) ((#poly_mul:fun(list(real),fun(list(real),list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_neg:fun(real,real) a:real)) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) q:list(real)))))))))))
      #|POLY_LENGTH_MUL =  |- (#forall:fun(fun(list(real),bool),bool) (\q:list(real). ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(real),num) ((#poly_mul:fun(list(real),fun(list(real),list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_neg:fun(real,real) a:real)) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) q:list(real)))) (#SUC:fun(num,num) (#LENGTH:fun(list(real),num) q:list(real))))))
      #|POLY_ROOTS_INDEX_LEMMA =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) p:list(real))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real))))) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(real),num) p:list(real))) n:num))) (#?:fun(fun(fun(num,real),bool),bool) (\i:fun(num,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#?:fun(fun(num,bool),bool) (\m:num. ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#=:fun(real,fun(real,bool)) x:real) (i:fun(num,real) m:num)))))))))))))))
      #|POLY_ROOTS_INDEX_LENGTH =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) p:list(real))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real))))) (#?:fun(fun(fun(num,real),bool),bool) (\i:fun(num,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#?:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) n:num) (#LENGTH:fun(list(real),num) p:list(real)))) ((#=:fun(real,fun(real,bool)) x:real) (i:fun(num,real) n:num)))))))))))))
      #|POLY_ROOTS_FINITE_LEMMA =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) p:list(real))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real))))) (#?:fun(fun(num,bool),bool) (\N:num. (#?:fun(fun(fun(num,real),bool),bool) (\i:fun(num,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#?:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) N:num)) ((#=:fun(real,fun(real,bool)) x:real) (i:fun(num,real) n:num)))))))))))))))
      #|FINITE_LEMMA =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\i:fun(num,real). (#forall:fun(fun(num,bool),bool) (\N:num. (#forall:fun(fun(fun(real,bool),bool),bool) (\P:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) (#?:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) N:num)) ((#=:fun(real,fun(real,bool)) x:real) (i:fun(num,real) n:num))))))))) (#?:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) a:real)))))))))))))
      #|POLY_ROOTS_FINITE =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) p:list(real))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real))))) (#?:fun(fun(num,bool),bool) (\N:num. (#?:fun(fun(fun(num,real),bool),bool) (\i:fun(num,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#?:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) N:num)) ((#=:fun(real,fun(real,bool)) x:real) (i:fun(num,real) n:num)))))))))))))))
      #|POLY_ENTIRE_LEMMA =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\q:list(real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) p:list(real))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real))))) (#~:fun(bool,bool) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) q:list(real))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real)))))) (#~:fun(bool,bool) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) ((#poly_mul:fun(list(real),fun(list(real),list(real))) p:list(real)) q:list(real)))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real)))))))))
      #|POLY_ENTIRE =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\q:list(real). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) ((#poly_mul:fun(list(real),fun(list(real),list(real))) p:list(real)) q:list(real)))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real)))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) p:list(real))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real)))) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) q:list(real))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real)))))))))
      #|POLY_MUL_LCANCEL =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\q:list(real). (#forall:fun(fun(list(real),bool),bool) (\r:list(real). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) ((#poly_mul:fun(list(real),fun(list(real),list(real))) p:list(real)) q:list(real)))) (#poly:fun(list(real),fun(real,real)) ((#poly_mul:fun(list(real),fun(list(real),list(real))) p:list(real)) r:list(real))))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) p:list(real))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real)))) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) q:list(real))) (#poly:fun(list(real),fun(real,real)) r:list(real)))))))))))
      #|POLY_EXP_EQ_0 =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) ((#poly_exp:fun(list(real),fun(num,list(real))) p:list(real)) n:num))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) p:list(real))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real)))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))))))))
      #|POLY_PRIME_EQ_0 =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#~:fun(bool,bool) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) ((#CONS:fun(real,fun(list(real),list(real))) a:real) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real))))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real))))))
      #|POLY_EXP_PRIME_EQ_0 =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(num,bool),bool) (\n:num. (#~:fun(bool,bool) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) ((#poly_exp:fun(list(real),fun(num,list(real))) ((#CONS:fun(real,fun(list(real),list(real))) a:real) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) n:num))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real))))))))
      #|POLY_ZERO_LEMMA =  |- (#forall:fun(fun(real,bool),bool) (\h:real. (#forall:fun(fun(list(real),bool),bool) (\t:list(real). ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) ((#CONS:fun(real,fun(list(real),list(real))) h:real) t:list(real)))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) h:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) t:list(real))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real)))))))))
      #|POLY_ZERO =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) p:list(real))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real)))) ((#ALL:fun(fun(real,bool),fun(list(real),bool)) (\c:real. ((#=:fun(real,fun(real,bool)) c:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) p:list(real)))))
      #|POLY_DIFF_AUX_ISZERO =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#ALL:fun(fun(real,bool),fun(list(real),bool)) (\c:real. ((#=:fun(real,fun(real,bool)) c:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#poly_diff_aux:fun(num,fun(list(real),list(real))) (#SUC:fun(num,num) n:num)) p:list(real)))) ((#ALL:fun(fun(real,bool),fun(list(real),bool)) (\c:real. ((#=:fun(real,fun(real,bool)) c:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) p:list(real)))))))
      #|POLY_DIFF_ISZERO =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real)))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real)))) (#?:fun(fun(real,bool),bool) (\h:real. ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) p:list(real))) (#poly:fun(list(real),fun(real,real)) ((#CONS:fun(real,fun(list(real),list(real))) h:real) #NIL:list(real)))))))))
      #|POLY_DIFF_ZERO =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) p:list(real))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real)))) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real)))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real))))))
      #|POLY_DIFF_WELLDEF =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\q:list(real). ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) p:list(real))) (#poly:fun(list(real),fun(real,real)) q:list(real)))) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real)))) (#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) q:list(real)))))))))
      #|divides =  |- (#forall:fun(fun(list(real),bool),bool) (\p2:list(real). (#forall:fun(fun(list(real),bool),bool) (\p1:list(real). ((#=:fun(bool,fun(bool,bool)) ((#poly_divides:fun(list(real),fun(list(real),bool)) p1:list(real)) p2:list(real))) (#?:fun(fun(list(real),bool),bool) (\q:list(real). ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) p2:list(real))) (#poly:fun(list(real),fun(real,real)) ((#poly_mul:fun(list(real),fun(list(real),list(real))) p1:list(real)) q:list(real)))))))))))
      #|POLY_PRIMES =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\q:list(real). ((#=:fun(bool,fun(bool,bool)) ((#poly_divides:fun(list(real),fun(list(real),bool)) ((#CONS:fun(real,fun(list(real),list(real))) a:real) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) ((#poly_mul:fun(list(real),fun(list(real),list(real))) p:list(real)) q:list(real)))) ((#\/:fun(bool,fun(bool,bool)) ((#poly_divides:fun(list(real),fun(list(real),bool)) ((#CONS:fun(real,fun(list(real),list(real))) a:real) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) p:list(real))) ((#poly_divides:fun(list(real),fun(list(real),bool)) ((#CONS:fun(real,fun(list(real),list(real))) a:real) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) q:list(real))))))))))
      #|POLY_DIVIDES_REFL =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#poly_divides:fun(list(real),fun(list(real),bool)) p:list(real)) p:list(real))))
      #|POLY_DIVIDES_TRANS =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\q:list(real). (#forall:fun(fun(list(real),bool),bool) (\r:list(real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#poly_divides:fun(list(real),fun(list(real),bool)) p:list(real)) q:list(real))) ((#poly_divides:fun(list(real),fun(list(real),bool)) q:list(real)) r:list(real)))) ((#poly_divides:fun(list(real),fun(list(real),bool)) p:list(real)) r:list(real)))))))))
      #|POLY_DIVIDES_EXP =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#poly_divides:fun(list(real),fun(list(real),bool)) ((#poly_exp:fun(list(real),fun(num,list(real))) p:list(real)) m:num)) ((#poly_exp:fun(list(real),fun(num,list(real))) p:list(real)) n:num)))))))))
      #|POLY_EXP_DIVIDES =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\q:list(real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#poly_divides:fun(list(real),fun(list(real),bool)) ((#poly_exp:fun(list(real),fun(num,list(real))) p:list(real)) n:num)) q:list(real))) ((#<=:fun(num,fun(num,bool)) m:num) n:num))) ((#poly_divides:fun(list(real),fun(list(real),bool)) ((#poly_exp:fun(list(real),fun(num,list(real))) p:list(real)) m:num)) q:list(real)))))))))))
      #|POLY_DIVIDES_ADD =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\q:list(real). (#forall:fun(fun(list(real),bool),bool) (\r:list(real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#poly_divides:fun(list(real),fun(list(real),bool)) p:list(real)) q:list(real))) ((#poly_divides:fun(list(real),fun(list(real),bool)) p:list(real)) r:list(real)))) ((#poly_divides:fun(list(real),fun(list(real),bool)) p:list(real)) ((#poly_add:fun(list(real),fun(list(real),list(real))) q:list(real)) r:list(real))))))))))
      #|POLY_DIVIDES_SUB =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\q:list(real). (#forall:fun(fun(list(real),bool),bool) (\r:list(real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#poly_divides:fun(list(real),fun(list(real),bool)) p:list(real)) q:list(real))) ((#poly_divides:fun(list(real),fun(list(real),bool)) p:list(real)) ((#poly_add:fun(list(real),fun(list(real),list(real))) q:list(real)) r:list(real))))) ((#poly_divides:fun(list(real),fun(list(real),bool)) p:list(real)) r:list(real)))))))))
      #|POLY_DIVIDES_SUB2 =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\q:list(real). (#forall:fun(fun(list(real),bool),bool) (\r:list(real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#poly_divides:fun(list(real),fun(list(real),bool)) p:list(real)) r:list(real))) ((#poly_divides:fun(list(real),fun(list(real),bool)) p:list(real)) ((#poly_add:fun(list(real),fun(list(real),list(real))) q:list(real)) r:list(real))))) ((#poly_divides:fun(list(real),fun(list(real),bool)) p:list(real)) q:list(real)))))))))
      #|POLY_DIVIDES_ZERO =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\q:list(real). ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) p:list(real))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real)))) ((#poly_divides:fun(list(real),fun(list(real),bool)) q:list(real)) p:list(real)))))))
      #|POLY_ORDER_EXISTS =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(real),num) p:list(real))) d:num)) (#~:fun(bool,bool) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) p:list(real))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real)))))) (#?:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#poly_divides:fun(list(real),fun(list(real),bool)) ((#poly_exp:fun(list(real),fun(num,list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_neg:fun(real,real) a:real)) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) n:num)) p:list(real))) (#~:fun(bool,bool) ((#poly_divides:fun(list(real),fun(list(real),bool)) ((#poly_exp:fun(list(real),fun(num,list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_neg:fun(real,real) a:real)) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) (#SUC:fun(num,num) n:num))) p:list(real)))))))))))))
      #|POLY_ORDER =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(real,bool),bool) (\a:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) p:list(real))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real))))) (#?!:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#poly_divides:fun(list(real),fun(list(real),bool)) ((#poly_exp:fun(list(real),fun(num,list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_neg:fun(real,real) a:real)) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) n:num)) p:list(real))) (#~:fun(bool,bool) ((#poly_divides:fun(list(real),fun(list(real),bool)) ((#poly_exp:fun(list(real),fun(num,list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_neg:fun(real,real) a:real)) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) (#SUC:fun(num,num) n:num))) p:list(real)))))))))))
      #|order =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#=:fun(num,fun(num,bool)) ((#order:fun(real,fun(list(real),num)) a:real) p:list(real))) (#@:fun(fun(num,bool),num) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#poly_divides:fun(list(real),fun(list(real),bool)) ((#poly_exp:fun(list(real),fun(num,list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_neg:fun(real,real) a:real)) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) n:num)) p:list(real))) (#~:fun(bool,bool) ((#poly_divides:fun(list(real),fun(list(real),bool)) ((#poly_exp:fun(list(real),fun(num,list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_neg:fun(real,real) a:real)) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) (#SUC:fun(num,num) n:num))) p:list(real)))))))))))
      #|ORDER =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#poly_divides:fun(list(real),fun(list(real),bool)) ((#poly_exp:fun(list(real),fun(num,list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_neg:fun(real,real) a:real)) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) n:num)) p:list(real))) (#~:fun(bool,bool) ((#poly_divides:fun(list(real),fun(list(real),bool)) ((#poly_exp:fun(list(real),fun(num,list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_neg:fun(real,real) a:real)) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) (#SUC:fun(num,num) n:num))) p:list(real))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) n:num) ((#order:fun(real,fun(list(real),num)) a:real) p:list(real)))) (#~:fun(bool,bool) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) p:list(real))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real))))))))))))
      #|ORDER_THM =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(real,bool),bool) (\a:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) p:list(real))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real))))) ((#/\:fun(bool,fun(bool,bool)) ((#poly_divides:fun(list(real),fun(list(real),bool)) ((#poly_exp:fun(list(real),fun(num,list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_neg:fun(real,real) a:real)) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) ((#order:fun(real,fun(list(real),num)) a:real) p:list(real)))) p:list(real))) (#~:fun(bool,bool) ((#poly_divides:fun(list(real),fun(list(real),bool)) ((#poly_exp:fun(list(real),fun(num,list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_neg:fun(real,real) a:real)) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) (#SUC:fun(num,num) ((#order:fun(real,fun(list(real),num)) a:real) p:list(real))))) p:list(real)))))))))
      #|ORDER_UNIQUE =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) p:list(real))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real))))) ((#/\:fun(bool,fun(bool,bool)) ((#poly_divides:fun(list(real),fun(list(real),bool)) ((#poly_exp:fun(list(real),fun(num,list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_neg:fun(real,real) a:real)) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) n:num)) p:list(real))) (#~:fun(bool,bool) ((#poly_divides:fun(list(real),fun(list(real),bool)) ((#poly_exp:fun(list(real),fun(num,list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_neg:fun(real,real) a:real)) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) (#SUC:fun(num,num) n:num))) p:list(real)))))) ((#=:fun(num,fun(num,bool)) n:num) ((#order:fun(real,fun(list(real),num)) a:real) p:list(real))))))))))
      #|ORDER_POLY =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\q:list(real). (#forall:fun(fun(real,bool),bool) (\a:real. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) p:list(real))) (#poly:fun(list(real),fun(real,real)) q:list(real)))) ((#=:fun(num,fun(num,bool)) ((#order:fun(real,fun(list(real),num)) a:real) p:list(real))) ((#order:fun(real,fun(list(real),num)) a:real) q:list(real))))))))))
      #|ORDER_ROOT =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(real,bool),bool) (\a:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#poly:fun(list(real),fun(real,real)) p:list(real)) a:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) p:list(real))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real)))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) ((#order:fun(real,fun(list(real),num)) a:real) p:list(real))) (#NUMERAL:fun(num,num) #_0:num)))))))))
      #|ORDER_DIVIDES =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#poly_divides:fun(list(real),fun(list(real),bool)) ((#poly_exp:fun(list(real),fun(num,list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_neg:fun(real,real) a:real)) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) n:num)) p:list(real))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) p:list(real))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real)))) ((#<=:fun(num,fun(num,bool)) n:num) ((#order:fun(real,fun(list(real),num)) a:real) p:list(real)))))))))))
      #|ORDER_DECOMP =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(real,bool),bool) (\a:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) p:list(real))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real))))) (#?:fun(fun(list(real),bool),bool) (\q:list(real). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) p:list(real))) (#poly:fun(list(real),fun(real,real)) ((#poly_mul:fun(list(real),fun(list(real),list(real))) ((#poly_exp:fun(list(real),fun(num,list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_neg:fun(real,real) a:real)) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) ((#order:fun(real,fun(list(real),num)) a:real) p:list(real)))) q:list(real))))) (#~:fun(bool,bool) ((#poly_divides:fun(list(real),fun(list(real),bool)) ((#CONS:fun(real,fun(list(real),list(real))) (#real_neg:fun(real,real) a:real)) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) q:list(real)))))))))))
      #|ORDER_MUL =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\q:list(real). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) ((#poly_mul:fun(list(real),fun(list(real),list(real))) p:list(real)) q:list(real)))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real))))) ((#=:fun(num,fun(num,bool)) ((#order:fun(real,fun(list(real),num)) a:real) ((#poly_mul:fun(list(real),fun(list(real),list(real))) p:list(real)) q:list(real)))) ((#+:fun(num,fun(num,num)) ((#order:fun(real,fun(list(real),num)) a:real) p:list(real))) ((#order:fun(real,fun(list(real),num)) a:real) q:list(real)))))))))))
      #|ORDER_DIFF =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(real,bool),bool) (\a:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real)))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real))))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) ((#order:fun(real,fun(list(real),num)) a:real) p:list(real))) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(num,fun(num,bool)) ((#order:fun(real,fun(list(real),num)) a:real) p:list(real))) (#SUC:fun(num,num) ((#order:fun(real,fun(list(real),num)) a:real) (#poly_diff:fun(list(real),list(real)) p:list(real))))))))))
      #|POLY_SQUAREFREE_DECOMP_ORDER =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\q:list(real). (#forall:fun(fun(list(real),bool),bool) (\d:list(real). (#forall:fun(fun(list(real),bool),bool) (\e:list(real). (#forall:fun(fun(list(real),bool),bool) (\r:list(real). (#forall:fun(fun(list(real),bool),bool) (\s:list(real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real)))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) p:list(real))) (#poly:fun(list(real),fun(real,real)) ((#poly_mul:fun(list(real),fun(list(real),list(real))) q:list(real)) d:list(real))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real)))) (#poly:fun(list(real),fun(real,real)) ((#poly_mul:fun(list(real),fun(list(real),list(real))) e:list(real)) d:list(real))))) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) d:list(real))) (#poly:fun(list(real),fun(real,real)) ((#poly_add:fun(list(real),fun(list(real),list(real))) ((#poly_mul:fun(list(real),fun(list(real),list(real))) r:list(real)) p:list(real))) ((#poly_mul:fun(list(real),fun(list(real),list(real))) s:list(real)) (#poly_diff:fun(list(real),list(real)) p:list(real)))))))))) (#forall:fun(fun(real,bool),bool) (\a:real. ((#=:fun(num,fun(num,bool)) ((#order:fun(real,fun(list(real),num)) a:real) q:list(real))) (((#COND:fun(bool,fun(num,fun(num,num))) ((#=:fun(num,fun(num,bool)) ((#order:fun(real,fun(list(real),num)) a:real) p:list(real))) (#NUMERAL:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) #_0:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))))))))
      #|rsquarefree =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#=:fun(bool,fun(bool,bool)) (#rsquarefree:fun(list(real),bool) p:list(real))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) p:list(real))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real))))) (#forall:fun(fun(real,bool),bool) (\a:real. ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#order:fun(real,fun(list(real),num)) a:real) p:list(real))) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) ((#order:fun(real,fun(list(real),num)) a:real) p:list(real))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|RSQUAREFREE_ROOTS =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#=:fun(bool,fun(bool,bool)) (#rsquarefree:fun(list(real),bool) p:list(real))) (#forall:fun(fun(real,bool),bool) (\a:real. (#~:fun(bool,bool) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#poly:fun(list(real),fun(real,real)) p:list(real)) a:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) a:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|RSQUAREFREE_DECOMP =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(real,bool),bool) (\a:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#rsquarefree:fun(list(real),bool) p:list(real))) ((#=:fun(real,fun(real,bool)) ((#poly:fun(list(real),fun(real,real)) p:list(real)) a:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (#?:fun(fun(list(real),bool),bool) (\q:list(real). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) p:list(real))) (#poly:fun(list(real),fun(real,real)) ((#poly_mul:fun(list(real),fun(list(real),list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_neg:fun(real,real) a:real)) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) q:list(real))))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) ((#poly:fun(list(real),fun(real,real)) q:list(real)) a:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))))
      #|POLY_SQUAREFREE_DECOMP =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\q:list(real). (#forall:fun(fun(list(real),bool),bool) (\d:list(real). (#forall:fun(fun(list(real),bool),bool) (\e:list(real). (#forall:fun(fun(list(real),bool),bool) (\r:list(real). (#forall:fun(fun(list(real),bool),bool) (\s:list(real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real)))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) p:list(real))) (#poly:fun(list(real),fun(real,real)) ((#poly_mul:fun(list(real),fun(list(real),list(real))) q:list(real)) d:list(real))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real)))) (#poly:fun(list(real),fun(real,real)) ((#poly_mul:fun(list(real),fun(list(real),list(real))) e:list(real)) d:list(real))))) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) d:list(real))) (#poly:fun(list(real),fun(real,real)) ((#poly_add:fun(list(real),fun(list(real),list(real))) ((#poly_mul:fun(list(real),fun(list(real),list(real))) r:list(real)) p:list(real))) ((#poly_mul:fun(list(real),fun(list(real),list(real))) s:list(real)) (#poly_diff:fun(list(real),list(real)) p:list(real)))))))))) ((#/\:fun(bool,fun(bool,bool)) (#rsquarefree:fun(list(real),bool) q:list(real))) (#forall:fun(fun(real,bool),bool) (\a:real. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#poly:fun(list(real),fun(real,real)) q:list(real)) a:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) ((#poly:fun(list(real),fun(real,real)) p:list(real)) a:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))))))))))))
      #|normalize =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(list(real),fun(list(real),bool)) (#normalize:fun(list(real),list(real)) #NIL:list(real))) #NIL:list(real))) ((#=:fun(list(real),fun(list(real),bool)) (#normalize:fun(list(real),list(real)) ((#CONS:fun(real,fun(list(real),list(real))) h:real) t:list(real)))) (((#COND:fun(bool,fun(list(real),fun(list(real),list(real)))) ((#=:fun(list(real),fun(list(real),bool)) (#normalize:fun(list(real),list(real)) t:list(real))) #NIL:list(real))) (((#COND:fun(bool,fun(list(real),fun(list(real),list(real)))) ((#=:fun(real,fun(real,bool)) h:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) #NIL:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) h:real) #NIL:list(real)))) ((#CONS:fun(real,fun(list(real),list(real))) h:real) (#normalize:fun(list(real),list(real)) t:list(real))))))
      #|POLY_NORMALIZE =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) (#normalize:fun(list(real),list(real)) p:list(real)))) (#poly:fun(list(real),fun(real,real)) p:list(real)))))
      #|degree =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#=:fun(num,fun(num,bool)) (#degree:fun(list(real),num) p:list(real))) (#PRE:fun(num,num) (#LENGTH:fun(list(real),num) (#normalize:fun(list(real),list(real)) p:list(real)))))))
      #|DEGREE_ZERO =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) p:list(real))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real)))) ((#=:fun(num,fun(num,bool)) (#degree:fun(list(real),num) p:list(real))) (#NUMERAL:fun(num,num) #_0:num)))))
      #|POLY_ROOTS_FINITE_SET =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#poly:fun(list(real),fun(real,real)) p:list(real))) (#poly:fun(list(real),fun(real,real)) #NIL:list(real))))) (#FINITE:fun(fun(real,bool),bool) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%1:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%1:real) ((#=:fun(real,fun(real,bool)) ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) x:real)))))))))
      #|POLY_MONO =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\k:real. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) k:real)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#poly:fun(list(real),fun(real,real)) ((#MAP:fun(fun(real,real),fun(list(real),list(real))) #real_abs:fun(real,real)) p:list(real))) k:real)))))))))
      #|NOT_POLY_CMUL_NIL =  |- (#forall:fun(fun(real,bool),bool) (\h:real. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(list(real),fun(list(real),bool)) p:list(real)) #NIL:list(real)))) (#~:fun(bool,bool) ((#=:fun(list(real),fun(list(real),bool)) ((#poly_cmul:fun(real,fun(list(real),list(real))) h:real) p:list(real))) #NIL:list(real))))))))
      #|NOT_POLY_MUL_NIL =  |- (#forall:fun(fun(list(real),bool),bool) (\p1:list(real). (#forall:fun(fun(list(real),bool),bool) (\p2:list(real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(list(real),fun(list(real),bool)) p1:list(real)) #NIL:list(real)))) (#~:fun(bool,bool) ((#=:fun(list(real),fun(list(real),bool)) p2:list(real)) #NIL:list(real))))) (#~:fun(bool,bool) ((#=:fun(list(real),fun(list(real),bool)) ((#poly_mul:fun(list(real),fun(list(real),list(real))) p1:list(real)) p2:list(real))) #NIL:list(real))))))))
      #|NOT_POLY_EXP_NIL =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(list(real),fun(list(real),bool)) p:list(real)) #NIL:list(real)))) (#~:fun(bool,bool) ((#=:fun(list(real),fun(list(real),bool)) ((#poly_exp:fun(list(real),fun(num,list(real))) p:list(real)) n:num)) #NIL:list(real))))))))
      #|NOT_POLY_EXP_X_NIL =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#~:fun(bool,bool) ((#=:fun(list(real),fun(list(real),bool)) ((#poly_exp:fun(list(real),fun(num,list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) n:num)) #NIL:list(real)))))
      #|POLY_CMUL_LID =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#=:fun(list(real),fun(list(real),bool)) ((#poly_cmul:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) p:list(real))) p:list(real))))
      #|POLY_MUL_LID =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#=:fun(list(real),fun(list(real),bool)) ((#poly_mul:fun(list(real),fun(list(real),list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real))) p:list(real))) p:list(real))))
      #|POLY_MUL_RID =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#=:fun(list(real),fun(list(real),bool)) ((#poly_mul:fun(list(real),fun(list(real),list(real))) p:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) p:list(real))))
      #|POLY_ADD_SYM =  |- (#forall:fun(fun(list(real),bool),bool) (\x:list(real). (#forall:fun(fun(list(real),bool),bool) (\y:list(real). ((#=:fun(list(real),fun(list(real),bool)) ((#poly_add:fun(list(real),fun(list(real),list(real))) x:list(real)) y:list(real))) ((#poly_add:fun(list(real),fun(list(real),list(real))) y:list(real)) x:list(real)))))))
      #|POLY_ADD_ASSOC =  |- (#forall:fun(fun(list(real),bool),bool) (\x:list(real). (#forall:fun(fun(list(real),bool),bool) (\y:list(real). (#forall:fun(fun(list(real),bool),bool) (\z:list(real). ((#=:fun(list(real),fun(list(real),bool)) ((#poly_add:fun(list(real),fun(list(real),list(real))) x:list(real)) ((#poly_add:fun(list(real),fun(list(real),list(real))) y:list(real)) z:list(real)))) ((#poly_add:fun(list(real),fun(list(real),list(real))) ((#poly_add:fun(list(real),fun(list(real),list(real))) x:list(real)) y:list(real))) z:list(real)))))))))
      #|TL_POLY_MUL_X =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#=:fun(list(real),fun(list(real),bool)) (#TL:fun(list(real),list(real)) ((#poly_mul:fun(list(real),fun(list(real),list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) p:list(real)))) p:list(real))))
      #|HD_POLY_MUL_X =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#=:fun(real,fun(real,bool)) (#HD:fun(list(real),real) ((#poly_mul:fun(list(real),fun(list(real),list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) p:list(real)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))
      #|TL_POLY_EXP_X_SUC =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(list(real),fun(list(real),bool)) (#TL:fun(list(real),list(real)) ((#poly_exp:fun(list(real),fun(num,list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) (#SUC:fun(num,num) n:num)))) ((#poly_exp:fun(list(real),fun(num,list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) n:num))))
      #|HD_POLY_EXP_X_SUC =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) (#HD:fun(list(real),real) ((#poly_exp:fun(list(real),fun(num,list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) (#SUC:fun(num,num) n:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))
      #|HD_POLY_ADD =  |- (#forall:fun(fun(list(real),bool),bool) (\p1:list(real). (#forall:fun(fun(list(real),bool),bool) (\p2:list(real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(list(real),fun(list(real),bool)) p1:list(real)) #NIL:list(real)))) (#~:fun(bool,bool) ((#=:fun(list(real),fun(list(real),bool)) p2:list(real)) #NIL:list(real))))) ((#=:fun(real,fun(real,bool)) (#HD:fun(list(real),real) ((#poly_add:fun(list(real),fun(list(real),list(real))) p1:list(real)) p2:list(real)))) ((#real_add:fun(real,fun(real,real)) (#HD:fun(list(real),real) p1:list(real))) (#HD:fun(list(real),real) p2:list(real)))))))))
      #|HD_POLY_CMUL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(list(real),fun(list(real),bool)) p:list(real)) #NIL:list(real)))) ((#=:fun(real,fun(real,bool)) (#HD:fun(list(real),real) ((#poly_cmul:fun(real,fun(list(real),list(real))) x:real) p:list(real)))) ((#real_mul:fun(real,fun(real,real)) x:real) (#HD:fun(list(real),real) p:list(real)))))))))
      #|TL_POLY_CMUL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(list(real),fun(list(real),bool)) p:list(real)) #NIL:list(real)))) ((#=:fun(list(real),fun(list(real),bool)) (#TL:fun(list(real),list(real)) ((#poly_cmul:fun(real,fun(list(real),list(real))) x:real) p:list(real)))) ((#poly_cmul:fun(real,fun(list(real),list(real))) x:real) (#TL:fun(list(real),list(real)) p:list(real)))))))))
      #|HD_POLY_MUL =  |- (#forall:fun(fun(list(real),bool),bool) (\p1:list(real). (#forall:fun(fun(list(real),bool),bool) (\p2:list(real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(list(real),fun(list(real),bool)) p1:list(real)) #NIL:list(real)))) (#~:fun(bool,bool) ((#=:fun(list(real),fun(list(real),bool)) p2:list(real)) #NIL:list(real))))) ((#=:fun(real,fun(real,bool)) (#HD:fun(list(real),real) ((#poly_mul:fun(list(real),fun(list(real),list(real))) p1:list(real)) p2:list(real)))) ((#real_mul:fun(real,fun(real,real)) (#HD:fun(list(real),real) p1:list(real))) (#HD:fun(list(real),real) p2:list(real)))))))))
      #|HD_POLY_EXP =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(list(real),fun(list(real),bool)) p:list(real)) #NIL:list(real)))) ((#=:fun(real,fun(real,bool)) (#HD:fun(list(real),real) ((#poly_exp:fun(list(real),fun(num,list(real))) p:list(real)) n:num))) ((#real_pow:fun(real,fun(num,real)) (#HD:fun(list(real),real) p:list(real))) n:num)))))))
      #|POLY_ADD_IDENT =  |- ((#=:fun(list(real),fun(list(real),bool)) (#neutral:fun(fun(list(real),fun(list(real),list(real))),list(real)) #poly_add:fun(list(real),fun(list(real),list(real))))) #NIL:list(real))
      #|POLY_ADD_NEUTRAL =  |- (#forall:fun(fun(list(real),bool),bool) (\x:list(real). ((#=:fun(list(real),fun(list(real),bool)) ((#poly_add:fun(list(real),fun(list(real),list(real))) (#neutral:fun(fun(list(real),fun(list(real),list(real))),list(real)) #poly_add:fun(list(real),fun(list(real),list(real))))) x:list(real))) x:list(real))))
      #|MONOIDAL_POLY_ADD =  |- (#monoidal:fun(fun(list(real),fun(list(real),list(real))),bool) #poly_add:fun(list(real),fun(list(real),list(real))))
      #|POLY_DIFF_AUX_ADD_LEMMA =  |- (#forall:fun(fun(list(real),bool),bool) (\t1:list(real). (#forall:fun(fun(list(real),bool),bool) (\t2:list(real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(list(real),fun(list(real),bool)) ((#poly_diff_aux:fun(num,fun(list(real),list(real))) n:num) ((#poly_add:fun(list(real),fun(list(real),list(real))) t1:list(real)) t2:list(real)))) ((#poly_add:fun(list(real),fun(list(real),list(real))) ((#poly_diff_aux:fun(num,fun(list(real),list(real))) n:num) t1:list(real))) ((#poly_diff_aux:fun(num,fun(list(real),list(real))) n:num) t2:list(real))))))))))
      #|POLYDIFF_ADD =  |- (#forall:fun(fun(list(real),bool),bool) (\p1:list(real). (#forall:fun(fun(list(real),bool),bool) (\p2:list(real). ((#=:fun(list(real),fun(list(real),bool)) (#poly_diff:fun(list(real),list(real)) ((#poly_add:fun(list(real),fun(list(real),list(real))) p1:list(real)) p2:list(real)))) ((#poly_add:fun(list(real),fun(list(real),list(real))) (#poly_diff:fun(list(real),list(real)) p1:list(real))) (#poly_diff:fun(list(real),list(real)) p2:list(real))))))))
      #|POLY_DIFF_AUX_POLY_CMUL =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(list(real),fun(list(real),bool)) ((#poly_diff_aux:fun(num,fun(list(real),list(real))) n:num) ((#poly_cmul:fun(real,fun(list(real),list(real))) c:real) p:list(real)))) ((#poly_cmul:fun(real,fun(list(real),list(real))) c:real) ((#poly_diff_aux:fun(num,fun(list(real),list(real))) n:num) p:list(real))))))))))
      #|POLY_CMUL_POLY_DIFF =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(real,bool),bool) (\c:real. ((#=:fun(list(real),fun(list(real),bool)) (#poly_diff:fun(list(real),list(real)) ((#poly_cmul:fun(real,fun(list(real),list(real))) c:real) p:list(real)))) ((#poly_cmul:fun(real,fun(list(real),list(real))) c:real) (#poly_diff:fun(list(real),list(real)) p:list(real))))))))
      #|POLY_CMUL_LENGTH =  |- (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(real),num) ((#poly_cmul:fun(real,fun(list(real),list(real))) c:real) p:list(real)))) (#LENGTH:fun(list(real),num) p:list(real)))))))
      #|POLY_ADD_LENGTH =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\q:list(real). ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(real),num) ((#poly_add:fun(list(real),fun(list(real),list(real))) p:list(real)) q:list(real)))) ((#MAX:fun(num,fun(num,num)) (#LENGTH:fun(list(real),num) p:list(real))) (#LENGTH:fun(list(real),num) q:list(real))))))))
      #|POLY_MUL_LENGTH =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(real,bool),bool) (\h:real. (#forall:fun(fun(list(real),bool),bool) (\t:list(real). ((#>=:fun(num,fun(num,bool)) (#LENGTH:fun(list(real),num) ((#poly_mul:fun(list(real),fun(list(real),list(real))) p:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) h:real) t:list(real))))) (#LENGTH:fun(list(real),num) p:list(real)))))))))
      #|POLY_EXP_X_REC =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(list(real),fun(list(real),bool)) ((#poly_exp:fun(list(real),fun(num,list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) (#SUC:fun(num,num) n:num))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#poly_exp:fun(list(real),fun(num,list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) n:num)))))
      #|POLY_MUL_LENGTH2 =  |- (#forall:fun(fun(list(real),bool),bool) (\q:list(real). (#forall:fun(fun(list(real),bool),bool) (\p:list(real). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(list(real),fun(list(real),bool)) q:list(real)) #NIL:list(real)))) ((#>=:fun(num,fun(num,bool)) (#LENGTH:fun(list(real),num) ((#poly_mul:fun(list(real),fun(list(real),list(real))) p:list(real)) q:list(real)))) (#LENGTH:fun(list(real),num) p:list(real))))))))
      #|POLY_EXP_X_LENGTH =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(real),num) ((#poly_exp:fun(list(real),fun(num,list(real))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#CONS:fun(real,fun(list(real),list(real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #NIL:list(real)))) n:num))) (#SUC:fun(num,num) n:num))))
      #|POLY_SUM_EQUIV =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(list(real),fun(list(real),bool)) p:list(real)) #NIL:list(real)))) ((#=:fun(real,fun(real,bool)) ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) (#PRE:fun(num,num) (#LENGTH:fun(list(real),num) p:list(real))))) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#EL:fun(num,fun(list(real),real)) i:num) p:list(real))) ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))))))))
      #|ITERATE_RADD_POLYADD =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(fun(num,list(real)),bool),bool) (\f:fun(num,list(real)). ((#=:fun(real,fun(real,bool)) (((#iterate:fun(fun(real,fun(real,real)),fun(fun(num,bool),fun(fun(num,real),real))) #real_add:fun(real,fun(real,real))) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\i:num. ((#poly:fun(list(real),fun(real,real)) (f:fun(num,list(real)) i:num)) x:real)))) ((#poly:fun(list(real),fun(real,real)) (((#iterate:fun(fun(list(real),fun(list(real),list(real))),fun(fun(num,bool),fun(fun(num,list(real)),list(real)))) #poly_add:fun(list(real),fun(list(real),list(real)))) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) f:fun(num,list(real)))) x:real))))))))
      #|types = metric/1 topology/1 tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = degree normalize rsquarefree order poly_divides poly_diff poly_diff_aux poly_exp poly_mul poly_neg poly_cmul poly_add poly differentiable contl diffl tends_real_real suminf summable sums mono subseq lim cauchy convergent tends_num_real tendsto bounded tends dorder mr1 ball mtop mdist metric ismet limpt closed neigh open topology istopology re_compl re_subset re_universe re_null re_intersect re_union re_Union psum superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 309
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?2
      #|counter_genvar = _119634:bool
      #|
    ),
  )
}
