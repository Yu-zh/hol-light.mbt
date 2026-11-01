// Load-fidelity test for Library/prime.ml: replays tools/ocaml_ref/Library_prime_ref.ml
// (keep in sync; refresh with tools/ocaml_ref/refresh_ref.py).

///|
using @testkit {stm, sthm}

///|
test "Library/prime matches Library/prime.ml" {
  @prime.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot", "impconv", "pair", "compute", "nums", "recursion",
      "arith", "wf", "calc_num", "normalizer", "grobner", "ind_types", "lists", "realax",
      "calc_int", "realarith", "real", "calc_rat", "int", "sets", "iterate", "cart",
      "define", "Library/prime",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Library/prime")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("DIVIDES_0", () => sthm(@prime.divides_0()))
  log.attempt("DIVIDES_ZERO", () => sthm(@prime.divides_zero()))
  log.attempt("DIVIDES_1", () => sthm(@prime.divides_1()))
  log.attempt("DIVIDES_REFL", () => sthm(@prime.divides_refl()))
  log.attempt("DIVIDES_TRANS", () => sthm(@prime.divides_trans()))
  log.attempt("DIVIDES_ADD", () => sthm(@prime.divides_add()))
  log.attempt("DIVIDES_SUB_EQ", () => sthm(@prime.divides_sub_eq()))
  log.attempt("DIVIDES_SUB", () => sthm(@prime.divides_sub()))
  log.attempt("DIVIDES_SUB_1", () => sthm(@prime.divides_sub_1()))
  log.attempt("DIVIDES_LMUL", () => sthm(@prime.divides_lmul()))
  log.attempt("DIVIDES_RMUL", () => sthm(@prime.divides_rmul()))
  log.attempt("DIVIDES_ADD_REVR", () => sthm(@prime.divides_add_revr()))
  log.attempt("DIVIDES_ADD_REVL", () => sthm(@prime.divides_add_revl()))
  log.attempt("DIVIDES_MUL_L", () => sthm(@prime.divides_mul_l()))
  log.attempt("DIVIDES_MUL_R", () => sthm(@prime.divides_mul_r()))
  log.attempt("DIVIDES_LMUL2", () => sthm(@prime.divides_lmul2()))
  log.attempt("DIVIDES_RMUL2", () => sthm(@prime.divides_rmul2()))
  log.attempt("DIVIDES_CMUL2", () => sthm(@prime.divides_cmul2()))
  log.attempt("DIVIDES_LMUL2_EQ", () => sthm(@prime.divides_lmul2_eq()))
  log.attempt("DIVIDES_RMUL2_EQ", () => sthm(@prime.divides_rmul2_eq()))
  log.attempt("DIVIDES_EQ_ZERO", () => sthm(@prime.divides_eq_zero()))
  log.attempt("DIVIDES_CASES", () => sthm(@prime.divides_cases()))
  log.attempt("DIVIDES_DIV_NOT", () => sthm(@prime.divides_div_not()))
  log.attempt("DIVIDES_MUL2", () => sthm(@prime.divides_mul2()))
  log.attempt("DIVIDES_EXP", () => sthm(@prime.divides_exp()))
  log.attempt("DIVIDES_EXP2", () => sthm(@prime.divides_exp2()))
  log.attempt("DIVIDES_EXP_LE_IMP", () => sthm(@prime.divides_exp_le_imp()))
  log.attempt("DIVIDES_EXP_LE", () => sthm(@prime.divides_exp_le()))
  log.attempt("DIVIDES_TRIVIAL_UPPERBOUND", () => {
    sthm(@prime.divides_trivial_upperbound())
  })
  log.attempt("DIVIDES_FACT", () => sthm(@prime.divides_fact()))
  log.attempt("DIVIDES_2", () => sthm(@prime.divides_2()))
  log.attempt("DIVIDES_REXP_SUC", () => sthm(@prime.divides_rexp_suc()))
  log.attempt("DIVIDES_REXP", () => sthm(@prime.divides_rexp()))
  log.attempt("FINITE_DIVISORS", () => sthm(@prime.finite_divisors()))
  log.attempt("FINITE_SPECIAL_DIVISORS", () => {
    sthm(@prime.finite_special_divisors())
  })
  log.attempt("DIVISORS_EQ", () => sthm(@prime.divisors_eq()))
  log.attempt("MULTIPLES_EQ", () => sthm(@prime.multiples_eq()))
  log.attempt("DIVIDES_NSUM", () => sthm(@prime.divides_nsum()))
  log.attempt("DIVIDES_GCD", () => sthm(@prime.divides_gcd()))
  log.attempt("GCD_0", () => sthm(@prime.gcd_0()))
  log.attempt("GCD_ZERO", () => sthm(@prime.gcd_zero()))
  log.attempt("GCD_REFL", () => sthm(@prime.gcd_refl()))
  log.attempt("GCD_1", () => sthm(@prime.gcd_1()))
  log.attempt("GCD_MULTIPLE", () => sthm(@prime.gcd_multiple()))
  log.attempt("GCD_ADD", () => sthm(@prime.gcd_add()))
  log.attempt("GCD_SUB", () => sthm(@prime.gcd_sub()))
  log.attempt("DIVIDES_GCD_LEFT", () => sthm(@prime.divides_gcd_left()))
  log.attempt("DIVIDES_GCD_RIGHT", () => sthm(@prime.divides_gcd_right()))
  log.attempt("GCD_COPRIME_LMUL", () => sthm(@prime.gcd_coprime_lmul()))
  log.attempt("GCD_COPRIME_RMUL", () => sthm(@prime.gcd_coprime_rmul()))
  log.attempt("DIVIDES_LMUL_GCD", () => sthm(@prime.divides_lmul_gcd()))
  log.attempt("DIVIDES_RMUL_GCD", () => sthm(@prime.divides_rmul_gcd()))
  log.attempt("GCD_MUL_COPRIME", () => sthm(@prime.gcd_mul_coprime()))
  log.attempt("GCD_SYM", () => sthm(@prime.gcd_sym()))
  log.attempt("GCD_ASSOC", () => sthm(@prime.gcd_assoc()))
  log.attempt("GCD_LMUL", () => sthm(@prime.gcd_lmul()))
  log.attempt("GCD_RMUL", () => sthm(@prime.gcd_rmul()))
  log.attempt("GCD_BEZOUT_SUM", () => sthm(@prime.gcd_bezout_sum()))
  log.attempt("GCD_COPRIME_DIVIDES_LMUL", () => {
    sthm(@prime.gcd_coprime_divides_lmul())
  })
  log.attempt("GCD_COPRIME_DIVIDES_RMUL", () => {
    sthm(@prime.gcd_coprime_divides_rmul())
  })
  log.attempt("GCD_UNIQUE", () => sthm(@prime.gcd_unique()))
  log.attempt("GCD_EQ", () => sthm(@prime.gcd_eq()))
  log.attempt("BEZOUT_GCD_STRONG", () => sthm(@prime.bezout_gcd_strong()))
  log.attempt("BEZOUT_ADD_STRONG", () => sthm(@prime.bezout_add_strong()))
  log.attempt("BEZOUT_GCD", () => sthm(@prime.bezout_gcd()))
  log.attempt("BEZOUT_ADD", () => sthm(@prime.bezout_add()))
  log.attempt("BEZOUT", () => sthm(@prime.bezout()))
  log.attempt("GCD_BEZOUT", () => sthm(@prime.gcd_bezout()))
  log.attempt("GCD_LE", () => sthm(@prime.gcd_le()))
  log.attempt("GCD_LE_MIN_EQ", () => sthm(@prime.gcd_le_min_eq()))
  log.attempt("GCD_LE_MIN", () => sthm(@prime.gcd_le_min()))
  log.attempt("GCD_LE_MAX", () => sthm(@prime.gcd_le_max()))
  log.attempt("COPRIME", () => sthm(@prime.coprime()))
  log.attempt("COPRIME_GCD", () => sthm(@prime.coprime_gcd()))
  log.attempt("GCD_ONE", () => sthm(@prime.gcd_one()))
  log.attempt("COPRIME_SYM", () => sthm(@prime.coprime_sym()))
  log.attempt("COPRIME_BEZOUT", () => sthm(@prime.coprime_bezout()))
  log.attempt("COPRIME_DIVPROD", () => sthm(@prime.coprime_divprod()))
  log.attempt("COPRIME_1", () => sthm(@prime.coprime_1()))
  log.attempt("GCD_COPRIME", () => sthm(@prime.gcd_coprime()))
  log.attempt("GCD_COPRIME_EXISTS", () => sthm(@prime.gcd_coprime_exists()))
  log.attempt("COPRIME_DIVPROD_IFF", () => sthm(@prime.coprime_divprod_iff()))
  log.attempt("CONG_MULT_LCANCEL_IFF", () => {
    sthm(@prime.cong_mult_lcancel_iff())
  })
  log.attempt("CONG_MULT_RCANCEL_IFF", () => {
    sthm(@prime.cong_mult_rcancel_iff())
  })
  log.attempt("COPRIME_0", () => sthm(@prime.coprime_0()))
  log.attempt("COPRIME_MUL", () => sthm(@prime.coprime_mul()))
  log.attempt("COPRIME_LMUL2", () => sthm(@prime.coprime_lmul2()))
  log.attempt("COPRIME_RMUL2", () => sthm(@prime.coprime_rmul2()))
  log.attempt("COPRIME_LMUL", () => sthm(@prime.coprime_lmul()))
  log.attempt("COPRIME_RMUL", () => sthm(@prime.coprime_rmul()))
  log.attempt("COPRIME_EXP", () => sthm(@prime.coprime_exp()))
  log.attempt("COPRIME_EXP_IMP", () => sthm(@prime.coprime_exp_imp()))
  log.attempt("COPRIME_REXP", () => sthm(@prime.coprime_rexp()))
  log.attempt("COPRIME_LEXP", () => sthm(@prime.coprime_lexp()))
  log.attempt("COPRIME_EXP2", () => sthm(@prime.coprime_exp2()))
  log.attempt("COPRIME_EXP2_SUC", () => sthm(@prime.coprime_exp2_suc()))
  log.attempt("COPRIME_NPRODUCT_EQ", () => sthm(@prime.coprime_nproduct_eq()))
  log.attempt("COPRIME_NPRODUCT", () => sthm(@prime.coprime_nproduct()))
  log.attempt("COPRIME_DIVISORS", () => sthm(@prime.coprime_divisors()))
  log.attempt("COPRIME_REFL", () => sthm(@prime.coprime_refl()))
  log.attempt("COPRIME_PLUS1", () => sthm(@prime.coprime_plus1()))
  log.attempt("COPRIME_MINUS1", () => sthm(@prime.coprime_minus1()))
  log.attempt("GCD_EXP", () => sthm(@prime.gcd_exp()))
  log.attempt("DIVIDES_EXP2_REV", () => sthm(@prime.divides_exp2_rev()))
  log.attempt("DIVIDES_EXP2_EQ", () => sthm(@prime.divides_exp2_eq()))
  log.attempt("DIVIDES_MUL", () => sthm(@prime.divides_mul()))
  log.attempt("DIVISION_DECOMP", () => sthm(@prime.division_decomp()))
  log.attempt("PRIME_0", () => sthm(@prime.prime_0()))
  log.attempt("PRIME_1", () => sthm(@prime.prime_1()))
  log.attempt("PRIME_ALT", () => sthm(@prime.prime_alt()))
  log.attempt("PRIME_2", () => sthm(@prime.prime_2()))
  log.attempt("PRIME_COPRIME_STRONG", () => sthm(@prime.prime_coprime_strong()))
  log.attempt("PRIME_COPRIME", () => sthm(@prime.prime_coprime()))
  log.attempt("PRIME_COPRIME_EQ", () => sthm(@prime.prime_coprime_eq()))
  log.attempt("COPRIME_PRIME", () => sthm(@prime.coprime_prime()))
  log.attempt("PRIME_DIVPROD", () => sthm(@prime.prime_divprod()))
  log.attempt("PRIME_DIVPROD_EQ", () => sthm(@prime.prime_divprod_eq()))
  log.attempt("PRIME_INT_DIVPROD_EQ", () => sthm(@prime.prime_int_divprod_eq()))
  log.attempt("PRIME_GE_2", () => sthm(@prime.prime_ge_2()))
  log.attempt("PRIME_FACTOR", () => sthm(@prime.prime_factor()))
  log.attempt("PRIME", () => sthm(@prime.prime()))
  log.attempt("PRIME_PRIME_FACTOR", () => sthm(@prime.prime_prime_factor()))
  log.attempt("PRIME_FACTOR_LT", () => sthm(@prime.prime_factor_lt()))
  log.attempt("COPRIME_PRIME_EQ", () => sthm(@prime.coprime_prime_eq()))
  log.attempt("GCD_PRIME_CASES", () => sthm(@prime.gcd_prime_cases()))
  log.attempt("GCD_2_CASES", () => sthm(@prime.gcd_2_cases()))
  log.attempt("COPRIME_PRIMEPOW", () => sthm(@prime.coprime_primepow()))
  log.attempt("COPRIME_BEZOUT_STRONG", () => {
    sthm(@prime.coprime_bezout_strong())
  })
  log.attempt("COPRIME_BEZOUT_ALT", () => sthm(@prime.coprime_bezout_alt()))
  log.attempt("BEZOUT_PRIME", () => sthm(@prime.bezout_prime()))
  log.attempt("PRIME_DIVEXP", () => sthm(@prime.prime_divexp()))
  log.attempt("PRIME_DIVEXP_N", () => sthm(@prime.prime_divexp_n()))
  log.attempt("PRIME_DIVEXP_EQ", () => sthm(@prime.prime_divexp_eq()))
  log.attempt("COPRIME_SOS", () => sthm(@prime.coprime_sos()))
  log.attempt("PRIME_IMP_NZ", () => sthm(@prime.prime_imp_nz()))
  log.attempt("DISTINCT_PRIME_COPRIME", () => {
    sthm(@prime.distinct_prime_coprime())
  })
  log.attempt("PRIME_COPRIME_LT", () => sthm(@prime.prime_coprime_lt()))
  log.attempt("DIVIDES_PRIME_PRIME", () => sthm(@prime.divides_prime_prime()))
  log.attempt("COPRIME_PRIME_PRIME", () => sthm(@prime.coprime_prime_prime()))
  log.attempt("DIVIDES_PRIME_EXP_LE", () => sthm(@prime.divides_prime_exp_le()))
  log.attempt("EQ_PRIME_EXP", () => sthm(@prime.eq_prime_exp()))
  log.attempt("PRIME_ODD", () => sthm(@prime.prime_odd()))
  log.attempt("ODD_PRIME", () => sthm(@prime.odd_prime()))
  log.attempt("DIVIDES_FACT_PRIME", () => sthm(@prime.divides_fact_prime()))
  log.attempt("EQ_PRIMEPOW", () => sthm(@prime.eq_primepow()))
  log.attempt("COPRIME_2", () => sthm(@prime.coprime_2()))
  log.attempt("DIVIDES_EXP_PLUS1", () => sthm(@prime.divides_exp_plus1()))
  log.attempt("DIVIDES_EXP_MINUS1", () => sthm(@prime.divides_exp_minus1()))
  log.attempt("PRIME_IRREDUCIBLE", () => sthm(@prime.prime_irreducible()))
  log.attempt("COPRIME_EXP_DIVPROD", () => sthm(@prime.coprime_exp_divprod()))
  log.attempt("PRIME_COPRIME_CASES", () => sthm(@prime.prime_coprime_cases()))
  log.attempt("PRIME_DIVPROD_POW_GEN", () => {
    sthm(@prime.prime_divprod_pow_gen())
  })
  log.attempt("PRIME_DIVPROD_POW_GEN_EQ", () => {
    sthm(@prime.prime_divprod_pow_gen_eq())
  })
  log.attempt("PRIME_DIVPROD_POW", () => sthm(@prime.prime_divprod_pow()))
  log.attempt("PRIME_DIVPROD_POW_EQ", () => sthm(@prime.prime_divprod_pow_eq()))
  log.attempt("PRIME_FACTOR_INDUCT", () => sthm(@prime.prime_factor_induct()))
  log.attempt("COMPLETE_FACTOR_INDUCT", () => {
    sthm(@prime.complete_factor_induct())
  })
  log.attempt("PRIME_FACTOR_PARTITION", () => {
    sthm(@prime.prime_factor_partition())
  })
  log.attempt("COPRIME_PAIR_DECOMP", () => sthm(@prime.coprime_pair_decomp()))
  log.attempt("EXP_MULT_EXISTS", () => sthm(@prime.exp_mult_exists()))
  log.attempt("COPRIME_POW", () => sthm(@prime.coprime_pow()))
  log.attempt("PRIME_EXP", () => sthm(@prime.prime_exp()))
  log.attempt("PRIME_POWER_MULT", () => sthm(@prime.prime_power_mult()))
  log.attempt("PRIME_POWER_EXP", () => sthm(@prime.prime_power_exp()))
  log.attempt("DIVIDES_PRIMEPOW", () => sthm(@prime.divides_primepow()))
  log.attempt("PRIMEPOW_DIVIDES_PROD", () => {
    sthm(@prime.primepow_divides_prod())
  })
  log.attempt("EUCLID_BOUND", () => sthm(@prime.euclid_bound()))
  log.attempt("EUCLID", () => sthm(@prime.euclid()))
  log.attempt("PRIMES_INFINITE", () => sthm(@prime.primes_infinite()))
  log.attempt("FACTORIZATION_INDEX", () => sthm(@prime.factorization_index()))
  log.attempt("PRIMEPOW_FACTOR", () => sthm(@prime.primepow_factor()))
  log.attempt("PRIMEPOW_DIVISORS_DIVIDES", () => {
    sthm(@prime.primepow_divisors_divides())
  })
  log.attempt("PRIMEPOW_DIVISORS_EQ", () => sthm(@prime.primepow_divisors_eq()))
  log.attempt("CHINESE_REMAINDER", () => sthm(@prime.chinese_remainder()))
  log.attempt("FINITE_EXP_LE", () => sthm(@prime.finite_exp_le()))
  log.attempt("FINITE_INDICES", () => sthm(@prime.finite_indices()))
  log.attempt("index_def", () => sthm(@prime.index_def()))
  log.attempt("INDEX_0", () => sthm(@prime.index_0()))
  log.attempt("PRIMEPOW_DIVIDES_INDEX", () => {
    sthm(@prime.primepow_divides_index())
  })
  log.attempt("LE_INDEX", () => sthm(@prime.le_index()))
  log.attempt("EXP_INDEX_DIVIDES", () => sthm(@prime.exp_index_divides()))
  log.attempt("INDEX_LT", () => sthm(@prime.index_lt()))
  log.attempt("INDEX_1", () => sthm(@prime.index_1()))
  log.attempt("INDEX_MUL", () => sthm(@prime.index_mul()))
  log.attempt("INDEX_EXP", () => sthm(@prime.index_exp()))
  log.attempt("INDEX_FACT", () => sthm(@prime.index_fact()))
  log.attempt("INDEX_FACT_ALT", () => sthm(@prime.index_fact_alt()))
  log.attempt("INDEX_FACT_UNBOUNDED", () => sthm(@prime.index_fact_unbounded()))
  log.attempt("PRIMEPOW_DIVIDES_FACT", () => {
    sthm(@prime.primepow_divides_fact())
  })
  log.attempt("INDEX_REFL", () => sthm(@prime.index_refl()))
  log.attempt("INDEX_EQ_0", () => sthm(@prime.index_eq_0()))
  log.attempt("INDEX_ZERO", () => sthm(@prime.index_zero()))
  log.attempt("INDEX_POW", () => sthm(@prime.index_pow()))
  log.attempt("INDEX_PRIME", () => sthm(@prime.index_prime()))
  log.attempt("INDEX_TRIVIAL_BOUND", () => sthm(@prime.index_trivial_bound()))
  log.attempt("INDEX_DECOMPOSITION", () => sthm(@prime.index_decomposition()))
  log.attempt("INDEX_DECOMPOSITION_PRIME", () => {
    sthm(@prime.index_decomposition_prime())
  })
  log.attempt("INDEX_DECOMPOSITION_LE", () => {
    sthm(@prime.index_decomposition_le())
  })
  log.attempt("INDEX_DECOMPOSITION_UNIQUE", () => {
    sthm(@prime.index_decomposition_unique())
  })
  log.attempt("INDEX_UNIQUE", () => sthm(@prime.index_unique()))
  log.attempt("INDEX_UNIQUE_EQ", () => sthm(@prime.index_unique_eq()))
  log.attempt("INDEX_UNIQUE_ALT", () => sthm(@prime.index_unique_alt()))
  log.attempt("INDEX_ADD_MIN", () => sthm(@prime.index_add_min()))
  log.attempt("INDEX_SUB_MIN", () => sthm(@prime.index_sub_min()))
  log.attempt("INDEX_ADD", () => sthm(@prime.index_add()))
  log.attempt("INDEX_MULT_BASE", () => sthm(@prime.index_mult_base()))
  log.attempt("INDEX_MULT_EXP", () => sthm(@prime.index_mult_exp()))
  log.attempt("INDEX_MULT_ADD", () => sthm(@prime.index_mult_add()))
  log.attempt("INDEX_NSUM_LE", () => sthm(@prime.index_nsum_le()))
  log.attempt("DIVIDES_INDEX", () => sthm(@prime.divides_index()))
  log.attempt("EQ_INDEX", () => sthm(@prime.eq_index()))
  log.attempt("COPRIME_INDEX", () => sthm(@prime.coprime_index()))
  log.attempt("INDEX_GCD", () => sthm(@prime.index_gcd()))
  log.attempt("FORALL_PRIME_INDEX", () => sthm(@prime.forall_prime_index()))
  log.attempt("INDEX_FACT_PRIME_MULT", () => {
    sthm(@prime.index_fact_prime_mult())
  })
  log.attempt("PRIME_FACTORIZATION_INDEX", () => {
    sthm(@prime.prime_factorization_index())
  })
  log.attempt("PRIME_POWER_EXISTS", () => sthm(@prime.prime_power_exists()))
  log.attempt("PRIME_POWER_EXISTS_ALT", () => {
    sthm(@prime.prime_power_exists_alt())
  })
  log.attempt("PRIME_FACTORIZATION_ALT", () => {
    sthm(@prime.prime_factorization_alt())
  })
  log.attempt("PRIME_FACTORIZATION", () => sthm(@prime.prime_factorization()))
  log.attempt("lcm", () => sthm(@prime.lcm()))
  log.attempt("LCM_DIVIDES", () => sthm(@prime.lcm_divides()))
  log.attempt("LCM", () => sthm(@prime.lcm_v1()))
  log.attempt("LCM_DIVIDES_MUL", () => sthm(@prime.lcm_divides_mul()))
  log.attempt("DIVIDES_LCM", () => sthm(@prime.divides_lcm()))
  log.attempt("LCM_0", () => sthm(@prime.lcm_0()))
  log.attempt("LCM_1", () => sthm(@prime.lcm_1()))
  log.attempt("LCM_SYM", () => sthm(@prime.lcm_sym()))
  log.attempt("DIVIDES_LCM_GCD", () => sthm(@prime.divides_lcm_gcd()))
  log.attempt("PRIMEPOW_DIVIDES_LCM", () => sthm(@prime.primepow_divides_lcm()))
  log.attempt("PRIME_DIVIDES_LCM", () => sthm(@prime.prime_divides_lcm()))
  log.attempt("LCM_ZERO", () => sthm(@prime.lcm_zero()))
  log.attempt("INDEX_LCM", () => sthm(@prime.index_lcm()))
  log.attempt("LCM_ASSOC", () => sthm(@prime.lcm_assoc()))
  log.attempt("LCM_REFL", () => sthm(@prime.lcm_refl()))
  log.attempt("LCM_MULTIPLE", () => sthm(@prime.lcm_multiple()))
  log.attempt("LCM_GCD_DISTRIB", () => sthm(@prime.lcm_gcd_distrib()))
  log.attempt("GCD_LCM_DISTRIB", () => sthm(@prime.gcd_lcm_distrib()))
  log.attempt("LCM_UNIQUE", () => sthm(@prime.lcm_unique()))
  log.attempt("LCM_EQ", () => sthm(@prime.lcm_eq()))
  log.attempt("LCM_EQ_1", () => sthm(@prime.lcm_eq_1()))
  log.attempt("DIVIDES_LCM_LEFT", () => sthm(@prime.divides_lcm_left()))
  log.attempt("DIVIDES_LCM_RIGHT", () => sthm(@prime.divides_lcm_right()))
  log.attempt("MULT_LCM_GCD", () => sthm(@prime.mult_lcm_gcd()))
  log.attempt("MULT_GCD_LCM", () => sthm(@prime.mult_gcd_lcm()))
  log.attempt("LCM_LMUL", () => sthm(@prime.lcm_lmul()))
  log.attempt("LCM_RMUL", () => sthm(@prime.lcm_rmul()))
  log.attempt("LCM_EXP", () => sthm(@prime.lcm_exp()))
  log.attempt("LCM_COPRIME_DECOMP", () => sthm(@prime.lcm_coprime_decomp()))
  log.attempt("LE_LCM", () => sthm(@prime.le_lcm()))
  log.attempt("LCM_LE_MULT", () => sthm(@prime.lcm_le_mult()))
  log.attempt("LCM_EQ_MULT", () => sthm(@prime.lcm_eq_mult()))
  log.attempt("MAX_LE_LCM_EQ", () => sthm(@prime.max_le_lcm_eq()))
  log.attempt("MAX_LE_LCM", () => sthm(@prime.max_le_lcm()))
  log.attempt("NEUTRAL_GCD", () => sthm(@prime.neutral_gcd()))
  log.attempt("MONOIDAL_GCD", () => sthm(@prime.monoidal_gcd()))
  log.attempt("NEUTRAL_LCM", () => sthm(@prime.neutral_lcm()))
  log.attempt("MONOIDAL_LCM", () => sthm(@prime.monoidal_lcm()))
  log.attempt("ITERATE_GCD_DIVIDES", () => sthm(@prime.iterate_gcd_divides()))
  log.attempt("ITERATE_GCD_DIVIDES_EQ", () => {
    sthm(@prime.iterate_gcd_divides_eq())
  })
  log.attempt("DIVIDES_ITERATE_GCD", () => sthm(@prime.divides_iterate_gcd()))
  log.attempt("DIVIDES_ITERATE_GCD_GEN", () => {
    sthm(@prime.divides_iterate_gcd_gen())
  })
  log.attempt("DIVIDES_ITERATE_LCM", () => sthm(@prime.divides_iterate_lcm()))
  log.attempt("DIVIDES_ITERATE_LCM_GEN", () => {
    sthm(@prime.divides_iterate_lcm_gen())
  })
  log.attempt("ITERATE_LCM_DIVIDES", () => sthm(@prime.iterate_lcm_divides()))
  log.attempt("ITERATE_LCM_DIVIDES_GEN", () => {
    sthm(@prime.iterate_lcm_divides_gen())
  })
  log.attempt("PRIMEPOW_DIVIDES_ITERATE_LCM", () => {
    sthm(@prime.primepow_divides_iterate_lcm())
  })
  log.attempt("PRIMEPOW_DIVIDES_ITERATE_LCM_GEN", () => {
    sthm(@prime.primepow_divides_iterate_lcm_gen())
  })
  log.attempt("PRIME_DIVIDES_ITERATE_LCM_GEN", () => {
    sthm(@prime.prime_divides_iterate_lcm_gen())
  })
  log.attempt("PRIME_DIVIDES_ITERATE_LCM", () => {
    sthm(@prime.prime_divides_iterate_lcm())
  })
  log.attempt("ITERATE_LCM_EQ_0_GEN", () => sthm(@prime.iterate_lcm_eq_0_gen()))
  log.attempt("ITERATE_LCM_EQ_0", () => sthm(@prime.iterate_lcm_eq_0()))
  log.attempt("ITERATE_LCM_EQ_1_GEN", () => sthm(@prime.iterate_lcm_eq_1_gen()))
  log.attempt("ITERATE_LCM_EQ_1", () => sthm(@prime.iterate_lcm_eq_1()))
  log.attempt("ITERATE_GCD_EQ_0_GEN", () => sthm(@prime.iterate_gcd_eq_0_gen()))
  log.attempt("ITERATE_GCD_EQ_0", () => sthm(@prime.iterate_gcd_eq_0()))
  log.attempt("INDUCT_COPRIME", () => sthm(@prime.induct_coprime()))
  log.attempt("INDUCT_COPRIME_STRONG", () => {
    sthm(@prime.induct_coprime_strong())
  })
  log.attempt("INDUCT_COPRIME_ALT", () => sthm(@prime.induct_coprime_alt()))
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
      #|Library/prime quotations (783):
      #|  \226\136\128 x : Num, divides(x, 0)
      #|  \226\136\128 x : Num, divides(0, x) == (x == 0)
      #|  \226\136\128 x : Num, divides(1, x)
      #|  \226\136\128 x : Num, divides(x, x)
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, divides(a, b) && divides(b, c) \226\134\146 divides(a, c)
      #|  \226\136\128 d : Num, \226\136\128 a : Num, \226\136\128 b : Num, divides(d, a) && divides(d, b) \226\134\146 divides(d, a + b)
      #|  (a : Num) < (b : Num) && a - b == 0 || !(a < b) && a - b + b == a
      #|  \226\136\128 d : Num, \226\136\128 a : Num, \226\136\128 b : Num, divides(d, a - b) == (a < b || op_eq_eq(a, b, mod(d)))
      #|  \226\136\128 d : Num, \226\136\128 a : Num, \226\136\128 b : Num, divides(d, a) && divides(d, b) \226\134\146 divides(d, a - b)
      #|  ((n : Num) < 1) == (n == 0)
      #|  \226\136\128 d : Num, \226\136\128 n : Num, divides(d, n - 1) == (n == 0 || op_eq_eq(n, 1, mod(d)))
      #|  \226\136\128 d : Num, \226\136\128 a : Num, \226\136\128 x : Num, divides(d, a) \226\134\146 divides(d, x * a)
      #|  \226\136\128 d : Num, \226\136\128 a : Num, \226\136\128 x : Num, divides(d, a) \226\134\146 divides(d, a * x)
      #|  \226\136\128 d : Num, \226\136\128 a : Num, \226\136\128 b : Num, divides(d, a) && divides(d, a + b) \226\134\146 divides(d, b)
      #|  \226\136\128 d : Num, \226\136\128 a : Num, \226\136\128 b : Num, divides(d, b) && divides(d, a + b) \226\134\146 divides(d, a)
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, divides(a, b) \226\134\146 divides(c * a, c * b)
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, divides(a, b) \226\134\146 divides(a * c, b * c)
      #|  \226\136\128 d : Num, \226\136\128 a : Num, \226\136\128 x : Num, divides(x * d, a) \226\134\146 divides(d, a)
      #|  \226\136\128 d : Num, \226\136\128 a : Num, \226\136\128 x : Num, divides(d * x, a) \226\134\146 divides(d, a)
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, divides(c * a, c * b) && !(c == 0) \226\134\146 divides(a, b)
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, !(c == 0) \226\134\146 divides(c * a, c * b) == divides(a, b)
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, !(c == 0) \226\134\146 divides(a * c, b * c) == divides(a, b)
      #|  \226\136\128 p : Num, \226\136\128 n : Num, n < p \226\134\146 divides(p, n) == (n == 0)
      #|  ((m : Num) == (n : Num) || 2 * n <= m) == (m == n * 1 || n * 2 <= m)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, divides(n, m) \226\134\146 m == 0 || m == n || 2 * n <= m
      #|  divides((n : Num), (q : Num) * n + (r : Num)) == divides(n, r)
      #|  \226\136\128 n : Num, \226\136\128 x : Num, \226\136\128 q : Num, \226\136\128 r : Num, x == q * n + r && 0 < r && r < n \226\134\146 !divides(n, x)
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, \226\136\128 d : Num, divides(a, b) && divides(c, d) \226\134\146 divides(a * c, b * d)
      #|  EXP((d : Num), (n : Num))
      #|  (d : Num)
      #|  \226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 n : Num, divides(x, y) \226\134\146 divides(EXP(x, n), EXP(y, n))
      #|  \226\136\128 n : Num, \226\136\128 x : Num, \226\136\128 y : Num, !(n == 0) && divides(EXP(x, n), y) \226\134\146 divides(x, y)
      #|  \226\136\128 p : Num, \226\136\128 m : Num, \226\136\128 n : Num, m <= n \226\134\146 divides(EXP(p, m), EXP(p, n))
      #|  \226\136\128 p : Num, \226\136\128 m : Num, \226\136\128 n : Num, 2 <= p \226\134\146 divides(EXP(p, m), EXP(p, n)) == (m <= n)
      #|  (n : Num)
      #|  (n : Num)
      #|  !((n : Num) == 0)
      #|  EXP(2, (n : Num))
      #|  \226\136\128 p : Num, \226\136\128 n : Num, !(n == 0) && 2 <= p \226\134\146 !divides(EXP(p, n), n)
      #|  \226\136\128 n : Num, \226\136\128 p : Num, 1 <= p && p <= n \226\134\146 divides(p, FACT(n))
      #|  \226\136\128 n : Num, divides(2, n) == EVEN(n)
      #|  \226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 n : Num, divides(x, y) \226\134\146 divides(x, EXP(y, SUC(n)))
      #|  \226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 n : Num, divides(x, y) && !(n == 0) \226\134\146 divides(x, EXP(y, n))
      #|  {(d : Num) | d <= (n : Num)}
      #|  \226\136\128 n : Num, !(n == 0) \226\134\146 FINITE({(d : Num) | divides(d, n)})
      #|  {(d : Num) | divides(d, (n : Num))}
      #|  \226\136\128 n : Num, !(n == 0) \226\134\146 FINITE({(d : Num) | (P : (Num) -> Bool)(d) && divides(d, n)})
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (m == n) == (\226\136\128 d : Num, divides(d, m) == divides(d, n))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (m == n) == (\226\136\128 d : Num, divides(m, d) == divides(n, d))
      #|  \226\136\128 n : Num, \226\136\128 f : (_) -> Num, \226\136\128 s : (_) -> Bool, FINITE(s) && (\226\136\128 i : _, IN(i, s) \226\134\146 divides(n, f(i))) \226\134\146 divides(n, nsum(s, f))
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 d : Num, divides(d, gcd((a, b))) == (divides(d, a) && divides(d, b))
      #|  (\226\136\128 a : Num, gcd((0, a)) == a) && (\226\136\128 a : Num, gcd((a, 0)) == a)
      #|  \226\136\128 a : Num, \226\136\128 b : Num, (gcd((a, b)) == 0) == (a == 0 && b == 0)
      #|  \226\136\128 a : Num, gcd((a, a)) == a
      #|  (\226\136\128 a : Num, gcd((1, a)) == 1) && (\226\136\128 a : Num, gcd((a, 1)) == 1)
      #|  \226\136\128 a : Num, \226\136\128 b : Num, gcd((b, a * b)) == b
      #|  (\226\136\128 a : Num, \226\136\128 b : Num, gcd((a + b, b)) == gcd((a, b))) && (\226\136\128 a : Num, \226\136\128 b : Num, gcd((b + a, b)) == gcd((a, b))) && (\226\136\128 a : Num, \226\136\128 b : Num, gcd((a, a + b)) == gcd((a, b))) && (\226\136\128 a : Num, \226\136\128 b : Num, gcd((a, b + a)) == gcd((a, b)))
      #|  (\226\136\128 a : Num, \226\136\128 b : Num, b <= a \226\134\146 gcd((a - b, b)) == gcd((a, b))) && (\226\136\128 a : Num, \226\136\128 b : Num, a <= b \226\134\146 gcd((a, b - a)) == gcd((a, b)))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, divides(m, n) == (gcd((m, n)) == m)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, divides(n, m) == (gcd((m, n)) == n)
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, coprime((a, b)) \226\134\146 gcd((a * b, c)) == gcd((a, c)) * gcd((b, c))
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, coprime((a, b)) \226\134\146 gcd((c, a * b)) == gcd((c, a)) * gcd((c, b))
      #|  (\226\136\128 d : Num, \226\136\128 a : Num, \226\136\128 b : Num, divides(d, gcd((d, a)) * b) == divides(d, a * b)) && (\226\136\128 d : Num, \226\136\128 a : Num, \226\136\128 b : Num, divides(d, gcd((a, d)) * b) == divides(d, a * b))
      #|  (\226\136\128 d : Num, \226\136\128 a : Num, \226\136\128 b : Num, divides(d, a * gcd((d, b))) == divides(d, a * b)) && (\226\136\128 d : Num, \226\136\128 a : Num, \226\136\128 b : Num, divides(d, a * gcd((b, d))) == divides(d, a * b))
      #|  (\226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, coprime((a, b)) \226\134\146 gcd((a, b * c)) == gcd((a, c))) && (\226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, coprime((a, c)) \226\134\146 gcd((a, b * c)) == gcd((a, b))) && (\226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, coprime((b, c)) \226\134\146 gcd((a, b * c)) == gcd((a, b)) * gcd((a, c))) && (\226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, coprime((a, c)) \226\134\146 gcd((a * b, c)) == gcd((b, c))) && (\226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, coprime((b, c)) \226\134\146 gcd((a * b, c)) == gcd((a, c))) && (\226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, coprime((a, b)) \226\134\146 gcd((a * b, c)) == gcd((a, c)) * gcd((b, c)))
      #|  \226\136\128 a : Num, \226\136\128 b : Num, gcd((a, b)) == gcd((b, a))
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, gcd((a, gcd((b, c)))) == gcd((gcd((a, b)), c))
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, gcd((c * a, c * b)) == c * gcd((a, b))
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, gcd((a * c, b * c)) == c * gcd((a, b))
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 d : Num, \226\136\128 x : Num, \226\136\128 y : Num, a * x + b * y == d \226\134\146 divides(gcd((a, b)), d)
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, coprime((a, b)) && divides(a, c) \226\134\146 gcd((a * b, c)) == a * gcd((b, c))
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, coprime((b, c)) && divides(b, a) \226\134\146 gcd((a, b * c)) == b * gcd((a, c))
      #|  \226\136\128 d : Num, \226\136\128 a : Num, \226\136\128 b : Num, ((divides(d, a) && divides(d, b)) && (\226\136\128 e : Num, divides(e, a) && divides(e, b) \226\134\146 divides(e, d))) == (d == gcd((a, b)))
      #|  (\226\136\128 d : Num, (divides(d, (x : Num)) && divides(d, (y : Num))) == (divides(d, (u : Num)) && divides(d, (v : Num)))) \226\134\146 gcd((x, y)) == gcd((u, v))
      #|  (int_of_num((x : Num)) == -int_of_num((y : Num))) == (int_of_num(x) == int_of_num(0) && int_of_num(y) == int_of_num(0))
      #|  divides(int_of_num((a : Num)), int_of_num((b : Num)) * int_of_num((r : Num)) + gcd((int_of_num(a), int_of_num(b))))
      #|  (r : Num)
      #|  int_of_num((a : Num))
      #|  (y : Int)
      #|  (y : Int)
      #|  (x : Int)
      #|  \226\136\131 x : Int, \226\136\131 y : Int, int_of_num((a : Num)) * x == int_of_num((b : Num)) * y + gcd((int_of_num(a), int_of_num(b)))
      #|  \226\136\128 a : Num, \226\136\128 b : Num, !(a == 0) \226\134\146 (\226\136\131 x : Num, \226\136\131 y : Num, a * x == b * y + gcd((a, b)))
      #|  \226\136\128 a : Num, \226\136\128 b : Num, !(a == 0) \226\134\146 (\226\136\131 d : Num, \226\136\131 x : Num, \226\136\131 y : Num, divides(d, a) && divides(d, b) && a * x == b * y + d)
      #|  (a : Num)
      #|  (b : Num)
      #|  (b : Num)
      #|  (a : Num)
      #|  (a : Num) == 0 && (b : Num) == 0
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\131 x : Num, \226\136\131 y : Num, a * x - b * y == gcd((a, b)) || b * x - a * y == gcd((a, b))
      #|  (a : Num) == 0 && (b : Num) == 0
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\131 d : Num, \226\136\131 x : Num, \226\136\131 y : Num, (divides(d, a) && divides(d, b)) && (a * x == b * y + d || b * x == a * y + d)
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\131 d : Num, \226\136\131 x : Num, \226\136\131 y : Num, (divides(d, a) && divides(d, b)) && (a * x - b * y == d || b * x - a * y == d)
      #|  (y : Num) * (k : Num)
      #|  (x : Num) * (k : Num)
      #|  (b : Num)
      #|  (a : Num)
      #|  (k : Num)
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 d : Num, (\226\136\131 x : Num, \226\136\131 y : Num, a * x - b * y == d || b * x - a * y == d) == divides(gcd((a, b)), d)
      #|  (n : Num) == 0
      #|  (m : Num) == 0
      #|  (\226\136\128 m : Num, \226\136\128 n : Num, (gcd((m, n)) <= m) == (m == 0 \226\134\146 n == 0)) && (\226\136\128 m : Num, \226\136\128 n : Num, (gcd((m, n)) <= n) == (n == 0 \226\134\146 m == 0))
      #|  ((p : Num) <= MIN((m : Num), (n : Num))) == (p <= m && p <= n)
      #|  MIN(0, (n : Num)) == 0
      #|  (m : Num) == 0
      #|  MIN((m : Num), 0) == 0
      #|  (n : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (gcd((m, n)) <= MIN(m, n)) == ((m == 0) == (n == 0))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (m == 0) == (n == 0) \226\134\146 gcd((m, n)) <= MIN(m, n)
      #|  (p : Num) <= MIN((m : Num), (n : Num)) \226\134\146 p <= MAX(m, n)
      #|  MAX(0, (n : Num)) == n
      #|  (m : Num) == 0
      #|  MAX((m : Num), 0) == m
      #|  (n : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, gcd((m, n)) <= MAX(m, n)
      #|  \226\136\128 a : Num, \226\136\128 b : Num, coprime((a, b)) == (\226\136\128 d : Num, (divides(d, a) && divides(d, b)) == (d == 1))
      #|  \226\136\128 a : Num, \226\136\128 b : Num, coprime((a, b)) == (gcd((a, b)) == 1)
      #|  \226\136\128 a : Num, \226\136\128 b : Num, coprime((a, b)) \226\134\146 gcd((a, b)) == 1
      #|  \226\136\128 a : Num, \226\136\128 b : Num, coprime((a, b)) == coprime((b, a))
      #|  \226\136\128 a : Num, \226\136\128 b : Num, coprime((a, b)) == (\226\136\131 x : Num, \226\136\131 y : Num, a * x - b * y == 1 || b * x - a * y == 1)
      #|  \226\136\128 d : Num, \226\136\128 a : Num, \226\136\128 b : Num, divides(d, a * b) && coprime((d, a)) \226\134\146 divides(d, b)
      #|  (\226\136\128 a : Num, coprime((a, 1))) && (\226\136\128 a : Num, coprime((1, a)))
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 a' : Num, \226\136\128 b' : Num, !(gcd((a, b)) == 0) && a == a' * gcd((a, b)) && b == b' * gcd((a, b)) \226\134\146 coprime((a', b'))
      #|  (b : Num)
      #|  (a : Num)
      #|  1
      #|  0
      #|  gcd(((a : Num), (b : Num))) == 0
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\131 a' : Num, \226\136\131 b' : Num, a == a' * gcd((a, b)) && b == b' * gcd((a, b)) && coprime((a', b'))
      #|  (a' : Num)
      #|  (b' : Num)
      #|  (a' : Num)
      #|  (a : Num)
      #|  (d : Num)
      #|  \226\136\128 d : Num, \226\136\128 a : Num, !(d == 0) \226\134\146 (\226\136\128 b : Num, divides(d, a * b) \226\134\146 divides(d, b)) == coprime((d, a))
      #|  op_eq_eq(0, (x : Num), mod((n : Num))) == divides(n, x)
      #|  0
      #|  \226\136\128 a : Num, \226\136\128 n : Num, !(n == 0) \226\134\146 (\226\136\128 x : Num, \226\136\128 y : Num, op_eq_eq(a * x, a * y, mod(n)) \226\134\146 op_eq_eq(x, y, mod(n))) == coprime((a, n))
      #|  \226\136\128 a : Num, \226\136\128 n : Num, !(n == 0) \226\134\146 (\226\136\128 x : Num, \226\136\128 y : Num, op_eq_eq(x * a, y * a, mod(n)) \226\134\146 op_eq_eq(x, y, mod(n))) == coprime((a, n))
      #|  (\226\136\128 d : Num, coprime((d, 0)) == (d == 1)) && (\226\136\128 d : Num, coprime((0, d)) == (d == 1))
      #|  \226\136\128 d : Num, \226\136\128 a : Num, \226\136\128 b : Num, coprime((d, a)) && coprime((d, b)) \226\134\146 coprime((d, a * b))
      #|  \226\136\128 d : Num, \226\136\128 a : Num, \226\136\128 b : Num, coprime((d, a * b)) \226\134\146 coprime((d, b))
      #|  \226\136\128 d : Num, \226\136\128 a : Num, \226\136\128 b : Num, coprime((d, a * b)) \226\134\146 coprime((d, a))
      #|  \226\136\128 d : Num, \226\136\128 a : Num, \226\136\128 b : Num, coprime((a * b, d)) == (coprime((a, d)) && coprime((b, d)))
      #|  \226\136\128 d : Num, \226\136\128 a : Num, \226\136\128 b : Num, coprime((d, a * b)) == (coprime((d, a)) && coprime((d, b)))
      #|  \226\136\128 n : Num, \226\136\128 a : Num, \226\136\128 d : Num, coprime((d, a)) \226\134\146 coprime((d, EXP(a, n)))
      #|  \226\136\128 n : Num, \226\136\128 a : Num, \226\136\128 b : Num, coprime((a, b)) \226\134\146 coprime((EXP(a, n), EXP(b, n)))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 k : Num, coprime((m, EXP(n, k))) == (coprime((m, n)) || k == 0)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 k : Num, coprime((EXP(m, k), n)) == (coprime((m, n)) || k == 0)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 k : Num, coprime((EXP(m, k), EXP(n, k))) == (coprime((m, n)) || k == 0)
      #|  \226\136\128 n : Num, \226\136\128 a : Num, \226\136\128 b : Num, coprime((EXP(a, SUC(n)), EXP(b, SUC(n)))) == coprime((a, b))
      #|  (\226\136\128 f : (A) -> Num, \226\136\128 a : Num, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 coprime((a, nproduct(s, f))) == (\226\136\128 i : A, IN(i, s) \226\134\146 coprime((a, f(i))))) && (\226\136\128 f : (A) -> Num, \226\136\128 b : Num, \226\136\128 s : (A) -> Bool, FINITE(s) \226\134\146 coprime((nproduct(s, f), b)) == (\226\136\128 i : A, IN(i, s) \226\134\146 coprime((f(i), b))))
      #|  \226\136\128 s : (_) -> Bool, \226\136\128 n : Num, FINITE(s) && (\226\136\128 x : _, IN(x, s) \226\134\146 coprime((n, (a : (_) -> Num)(x)))) \226\134\146 coprime((n, nproduct(s, a)))
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 d : Num, \226\136\128 e : Num, divides(d, a) && divides(e, b) && coprime((a, b)) \226\134\146 coprime((d, e))
      #|  \226\136\128 n : Num, coprime((n, n)) == (n == 1)
      #|  \226\136\128 n : Num, coprime((n + 1, n))
      #|  !((n : Num) == 0) \226\134\146 n - (n - 1) == 1
      #|  \226\136\128 n : Num, !(n == 0) \226\134\146 coprime((n - 1, n))
      #|  (x : Num) == 1 && (y : Num) == 1 \226\134\146 (a : Num) * x == a * y
      #|  (b' : Num)
      #|  (a' : Num)
      #|  (b : Num)
      #|  (a : Num)
      #|  \226\136\128 n : Num, \226\136\128 a : Num, \226\136\128 b : Num, gcd((EXP(a, n), EXP(b, n))) == EXP(gcd((a, b)), n)
      #|  \226\136\128 n : Num, \226\136\128 a : Num, \226\136\128 b : Num, divides(EXP(a, n), EXP(b, n)) && !(n == 0) \226\134\146 divides(a, b)
      #|  \226\136\128 n : Num, \226\136\128 a : Num, \226\136\128 b : Num, !(n == 0) \226\134\146 divides(EXP(a, n), EXP(b, n)) == divides(a, b)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 r : Num, divides(m, r) && divides(n, r) && coprime((m, n)) \226\134\146 divides(m * n, r)
      #|  (b : Num)
      #|  (a : Num)
      #|  1
      #|  gcd(((a : Num), (b : Num))) == 0
      #|  gcd(((a : Num), (b : Num)))
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, divides(a, b * c) \226\134\146 (\226\136\131 b' : Num, \226\136\131 c' : Num, a == b' * c' && divides(b', b) && divides(c', c))
      #|  2
      #|  !prime(0)
      #|  !prime(1)
      #|  (p : Num) == 0
      #|  \226\136\128 p : Num, prime(p) == (!(p == 0) && !(p == 1) && (\226\136\128 n : Num, 1 < n && n < p \226\134\146 !divides(n, p)))
      #|  prime(2)
      #|  \226\136\128 n : Num, \226\136\128 p : Num, prime(p) \226\134\146 divides(p, n) || coprime((p, n))
      #|  \226\136\128 n : Num, \226\136\128 p : Num, prime(p) \226\134\146 n == 1 || divides(p, n) || coprime((p, n))
      #|  \226\136\128 p : Num, \226\136\128 n : Num, prime(p) \226\134\146 coprime((p, n)) == !divides(p, n)
      #|  \226\136\128 p : Num, \226\136\128 a : Num, \226\136\128 b : Num, coprime((a, b)) \226\134\146 !(prime(p) && divides(p, a) && divides(p, b))
      #|  \226\136\128 p : Num, \226\136\128 a : Num, \226\136\128 b : Num, prime(p) && divides(p, a * b) \226\134\146 divides(p, a) || divides(p, b)
      #|  \226\136\128 p : Num, \226\136\128 a : Num, \226\136\128 b : Num, prime(p) \226\134\146 divides(p, a * b) == (divides(p, a) || divides(p, b))
      #|  divides((a : Int), -(b : Int)) == divides(a, b)
      #|  \226\136\128 p : Num, \226\136\128 a : Int, \226\136\128 b : Int, prime(p) \226\134\146 divides(int_of_num(p), a * b) == (divides(int_of_num(p), a) || divides(int_of_num(p), b))
      #|  (2 <= (p : Num)) == (!(p == 0) && !(p == 1))
      #|  \226\136\128 p : Num, prime(p) \226\134\146 2 <= p
      #|  prime((n : Num))
      #|  (n : Num)
      #|  \226\136\128 n : Num, !(n == 1) \226\134\146 (\226\136\131 p : Num, prime(p) && divides(p, n))
      #|  MOD((n : Num), (p : Num))
      #|  (n : Num)
      #|  (n : Num)
      #|  (p : Num)
      #|  (p : Num) == 1
      #|  (p : Num) == 0
      #|  \226\136\128 p : Num, prime(p) == (!(p == 0) && !(p == 1) && (\226\136\128 m : Num, 0 < m && m < p \226\134\146 coprime((p, m))))
      #|  (p : Num)
      #|  (d : Num) == 1
      #|  (d : Num)
      #|  (n : Num) == 1
      #|  \226\136\128 n : Num, prime(n) == (!(n == 1) && (\226\136\128 p : Num, prime(p) && divides(p, n) \226\134\146 p == n))
      #|  ((m : Num) < (p : Num) * m) == (1 * m < p * m)
      #|  \226\136\128 n : Num, \226\136\128 m : Num, \226\136\128 p : Num, prime(p) && !(n == 0) && n == p * m \226\134\146 m < n
      #|  (d : Num)
      #|  (p : Num)
      #|  (p : Num)
      #|  (d : Num)
      #|  \226\136\128 a : Num, \226\136\128 b : Num, coprime((a, b)) == (\226\136\128 p : Num, !(prime(p) && divides(p, a) && divides(p, b)))
      #|  (\226\136\128 p : Num, \226\136\128 n : Num, prime(p) \226\134\146 gcd((p, n)) == (if divides(p, n) { p } else { 1 })) && (\226\136\128 p : Num, \226\136\128 n : Num, prime(p) \226\134\146 gcd((n, p)) == (if divides(p, n) { p } else { 1 }))
      #|  (\226\136\128 n : Num, gcd((2, n)) == (if EVEN(n) { 2 } else { 1 })) && (\226\136\128 n : Num, gcd((n, 2)) == (if EVEN(n) { 2 } else { 1 }))
      #|  \226\136\128 p : Num, \226\136\128 k : Num, \226\136\128 m : Num, prime(p) && !(k == 0) \226\134\146 coprime((m, EXP(p, k))) == !divides(p, m)
      #|  \226\136\128 a : Num, \226\136\128 b : Num, coprime((a, b)) && !(b == 1) \226\134\146 (\226\136\131 x : Num, \226\136\131 y : Num, a * x == b * y + 1)
      #|  \226\136\128 a : Num, \226\136\128 b : Num, coprime((a, b)) && !(a == 0) \226\134\146 (\226\136\131 x : Num, \226\136\131 y : Num, a * x == b * y + 1)
      #|  \226\136\128 a : Num, \226\136\128 p : Num, prime(p) && !divides(p, a) \226\134\146 (\226\136\131 x : Num, \226\136\131 y : Num, a * x == p * y + 1)
      #|  \226\136\128 n : Num, \226\136\128 p : Num, \226\136\128 x : Num, prime(p) && divides(p, EXP(x, n)) \226\134\146 divides(p, x)
      #|  \226\136\128 n : Num, \226\136\128 p : Num, \226\136\128 x : Num, prime(p) && divides(p, EXP(x, n)) \226\134\146 divides(EXP(p, n), EXP(x, n))
      #|  (n : Num) == 0
      #|  \226\136\128 n : Num, \226\136\128 p : Num, \226\136\128 x : Num, prime(p) \226\134\146 divides(p, EXP(x, n)) == (divides(p, x) && !(n == 0))
      #|  \226\136\128 x : Num, \226\136\128 y : Num, coprime((x, y)) \226\134\146 coprime((x * y, EXP(x, 2) + EXP(y, 2)))
      #|  \226\136\128 p : Num, prime(p) \226\134\146 !(p == 0)
      #|  \226\136\128 p : Num, \226\136\128 q : Num, prime(p) && prime(q) && !(p == q) \226\134\146 coprime((p, q))
      #|  \226\136\128 x : Num, \226\136\128 p : Num, prime(p) && 0 < x && x < p \226\134\146 coprime((x, p))
      #|  \226\136\128 p : Num, \226\136\128 q : Num, prime(p) && prime(q) \226\134\146 divides(p, q) == (p == q)
      #|  \226\136\128 p : Num, \226\136\128 q : Num, prime(p) && prime(q) \226\134\146 coprime((p, q)) == !(p == q)
      #|  (p : Num) == (q : Num)
      #|  !(SUC((m : Num)) <= 0)
      #|  \226\136\128 p : Num, \226\136\128 q : Num, \226\136\128 m : Num, \226\136\128 n : Num, prime(p) && prime(q) \226\134\146 divides(EXP(p, m), EXP(q, n)) == (m == 0 || p == q && m <= n)
      #|  \226\136\128 p : Num, \226\136\128 q : Num, \226\136\128 m : Num, \226\136\128 n : Num, prime(p) && prime(q) \226\134\146 (EXP(p, m) == EXP(q, n)) == (m == 0 && n == 0 || p == q && m == n)
      #|  2
      #|  \226\136\128 p : Num, prime(p) \226\134\146 p == 2 || ODD(p)
      #|  (p : Num) == 2
      #|  (p : Num) == 1
      #|  (p : Num) == 0
      #|  \226\136\128 p : Num, prime(p) \226\134\146 ODD(p) == (3 <= p)
      #|  !((p : Num) <= (n : Num)) && p <= SUC(n) \226\134\146 p == SUC(n)
      #|  \226\136\128 p : Num, prime(p) \226\134\146 (\226\136\128 n : Num, divides(p, FACT(n)) == (p <= n))
      #|  \226\136\128 p : Num, \226\136\128 m : Num, \226\136\128 n : Num, prime(p) \226\134\146 (EXP(p, m) == EXP(p, n)) == (m == n)
      #|  (\226\136\128 n : Num, coprime((2, n)) == ODD(n)) && (\226\136\128 n : Num, coprime((n, 2)) == ODD(n))
      #|  SUC(2 * SUC((n : Num))) == SUC(2 * n) + 2
      #|  \226\136\128 n : Num, \226\136\128 k : Num, ODD(k) \226\134\146 divides(n + 1, EXP(n, k) + 1)
      #|  (k : Num)
      #|  (k : Num)
      #|  (k : Num)
      #|  (n : Num) == 0
      #|  \226\136\128 k : Num, \226\136\128 n : Num, divides(n - 1, EXP(n, k) - 1)
      #|  ((p : Num) > 1) == (!(p == 0) && !(p == 1))
      #|  \226\136\128 p : Num, prime(p) == (p > 1 && (\226\136\128 a : Num, \226\136\128 b : Num, divides(p, a * b) \226\134\146 divides(p, a) || divides(p, b)))
      #|  \226\136\128 d : Num, \226\136\128 n : Num, \226\136\128 a : Num, \226\136\128 b : Num, divides(EXP(d, n), a * b) && coprime((d, a)) \226\134\146 divides(EXP(d, n), b)
      #|  \226\136\128 p : Num, \226\136\128 a : Num, \226\136\128 b : Num, prime(p) && coprime((a, b)) \226\134\146 coprime((p, a)) || coprime((p, b))
      #|  \226\136\128 n : Num, \226\136\128 p : Num, \226\136\128 a : Num, \226\136\128 b : Num, prime(p) && !divides(p, gcd((a, b))) && divides(EXP(p, n), a * b) \226\134\146 divides(EXP(p, n), a) || divides(EXP(p, n), b)
      #|  \226\136\128 n : Num, \226\136\128 p : Num, \226\136\128 a : Num, \226\136\128 b : Num, prime(p) && !divides(p, gcd((a, b))) \226\134\146 divides(EXP(p, n), a * b) == (divides(EXP(p, n), a) || divides(EXP(p, n), b))
      #|  \226\136\128 n : Num, \226\136\128 p : Num, \226\136\128 a : Num, \226\136\128 b : Num, prime(p) && coprime((a, b)) && divides(EXP(p, n), a * b) \226\134\146 divides(EXP(p, n), a) || divides(EXP(p, n), b)
      #|  \226\136\128 n : Num, \226\136\128 p : Num, \226\136\128 a : Num, \226\136\128 b : Num, prime(p) && coprime((a, b)) \226\134\146 divides(EXP(p, n), a * b) == (divides(EXP(p, n), a) || divides(EXP(p, n), b))
      #|  (d : Num)
      #|  (p : Num)
      #|  (d : Num)
      #|  (p : Num)
      #|  (n : Num) == 1
      #|  (n : Num) == 0
      #|  (n : Num)
      #|  \226\136\128 P : (Num) -> Bool, P(0) && P(1) && (\226\136\128 p : Num, \226\136\128 n : Num, prime(p) && !(n == 0) && P(n) \226\134\146 P(p * n)) \226\134\146 (\226\136\128 n : Num, P(n))
      #|  \226\136\128 P : (Num) -> Bool, P(0) && P(1) && (\226\136\128 p : Num, prime(p) \226\134\146 P(p)) && (\226\136\128 m : Num, \226\136\128 n : Num, P(m) && P(n) \226\134\146 P(m * n)) \226\134\146 (\226\136\128 n : Num, P(n))
      #|  (p : Num) * (n2 : Num)
      #|  (n1 : Num)
      #|  (n2 : Num)
      #|  (p : Num) * (n1 : Num)
      #|  (Q : (Num) -> Bool)((p : Num))
      #|  (n2 : Num)
      #|  (n1 : Num)
      #|  (n : Num)
      #|  (p : Num)
      #|  \226\136\128 Q : (Num) -> Bool, \226\136\128 n : Num, !(n == 0) \226\134\146 (\226\136\131 n1 : Num, \226\136\131 n2 : Num, n1 * n2 == n && (\226\136\128 p : Num, prime(p) && divides(p, n1) \226\134\146 Q(p)) && (\226\136\128 p : Num, prime(p) && divides(p, n2) \226\134\146 !Q(p)))
      #|  (m2 : Num)
      #|  (m1 : Num)
      #|  (m : Num)
      #|  (p : Num) => divides(p, (n2 : Num))
      #|  \226\136\128 n1 : Num, \226\136\128 n2 : Num, \226\136\128 m : Num, coprime((n1, n2)) && !(m == 0) \226\134\146 (\226\136\131 m1 : Num, \226\136\131 m2 : Num, coprime((m1, n1)) && coprime((m2, n2)) && coprime((m1, m2)) && m1 * m2 == m)
      #|  (p : Num)
      #|  (m : Num)
      #|  (k : Num)
      #|  (k : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, \226\136\128 k : Num, !(m == 0) && EXP(m, k) * n == EXP(p, k) \226\134\146 (\226\136\131 q : Num, n == EXP(q, k))
      #|  EXP((p : Num), (n : Num))
      #|  \226\136\128 p : Num, !(p == 0) && (a : Num) * p == (b : Num) * p \226\134\146 a == b
      #|  (a : Num)
      #|  (d : Num)
      #|  (d : Num)
      #|  (b : Num)
      #|  (d : Num)
      #|  divides(EXP((p : Num), (n : Num)), (a : Num)) || divides(EXP(p, n), (b : Num))
      #|  (n : Num) == 0
      #|  \226\136\128 n : Num, \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, coprime((a, b)) && a * b == EXP(c, n) \226\134\146 (\226\136\131 r : Num, \226\136\131 s : Num, a == EXP(r, n) && b == EXP(s, n))
      #|  !((p : Num) == 1)
      #|  !((p : Num) == 0)
      #|  (p : Num) < (pn : Num) \226\134\146 !(p == pn)
      #|  (p : Num)
      #|  (p : Num) == 1
      #|  !(SUC(SUC((n : Num))) == 1)
      #|  (p : Num) == 0
      #|  (n : Num)
      #|  (n : Num)
      #|  \226\136\128 p : Num, \226\136\128 n : Num, prime(EXP(p, n)) == (prime(p) && n == 1)
      #|  (p : Num)
      #|  (x : Num)
      #|  (d : Num)
      #|  (p : Num)
      #|  (y : Num)
      #|  (d : Num)
      #|  (x : Num) * ((p : Num) * (d : Num)) == p * EXP(p, (k : Num))
      #|  (p : Num) * (d : Num) * (y : Num) == p * EXP(p, (k : Num))
      #|  (d : Num)
      #|  !((p : Num) == 0)
      #|  divides((p : Num), (x : Num)) || divides(p, (y : Num))
      #|  \226\136\128 k : Num, \226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 p : Num, prime(p) && x * y == EXP(p, k) \226\134\146 (\226\136\131 i : Num, \226\136\131 j : Num, x == EXP(p, i) && y == EXP(p, j))
      #|  (n : Num) == 0
      #|  \226\136\128 n : Num, \226\136\128 x : Num, \226\136\128 p : Num, \226\136\128 k : Num, prime(p) && !(n == 0) && EXP(x, n) == EXP(p, k) \226\134\146 (\226\136\131 i : Num, x == EXP(p, i))
      #|  (p : Num) == 1
      #|  (p : Num) == 0
      #|  (p : Num)
      #|  (e : Num)
      #|  (d : Num)
      #|  (k : Num)
      #|  (e : Num)
      #|  \226\136\128 p : Num, prime(p) \226\134\146 (\226\136\128 d : Num, divides(d, EXP(p, (k : Num))) == (\226\136\131 i : Num, i <= k && d == EXP(p, i)))
      #|  ((a : Num) == (b : Num) * (c : Num)) == (divides(b, a) && divides(c, a) && b * c == a)
      #|  \226\136\128 p : Num, \226\136\128 k : Num, \226\136\128 m : Num, \226\136\128 n : Num, prime(p) && divides(EXP(p, k), m * n) \226\134\146 (\226\136\131 i : Num, \226\136\131 j : Num, divides(EXP(p, i), m) && divides(EXP(p, j), n) && k == i + j)
      #|  !((x : Num) + 1 == 0)
      #|  (p : Num) == 0 || 1 <= p
      #|  0 < (n : Num) \226\134\146 !(n + 1 == 1)
      #|  FACT((n : Num)) + 1
      #|  \226\136\128 n : Num, \226\136\131 p : Num, prime(p) && n < p && p <= SUC(FACT(n))
      #|  \226\136\128 n : Num, \226\136\131 p : Num, prime(p) && p > n
      #|  INFINITE({(p : Num) | prime(p)})
      #|  (l : Num)
      #|  (l : Num)
      #|  EXP(2, (l : Num))
      #|  (n : Num)
      #|  0
      #|  \226\136\128 n : Num, \226\136\128 p : Num, !(n == 0) && 2 <= p \226\134\146 (\226\136\131 k : Num, divides(EXP(p, k), n) && (\226\136\128 l : Num, k < l \226\134\146 !divides(EXP(p, l), n)))
      #|  (k : Num) == 0
      #|  divides((p : Num), (n : Num))
      #|  (k : Num) < k + 1
      #|  (k : Num) + 1
      #|  (m : Num)
      #|  (k : Num)
      #|  2 <= (n : Num) \226\134\146 !(n == 0)
      #|  (p : Num)
      #|  (n : Num)
      #|  (p : Num)
      #|  (n : Num)
      #|  \226\136\128 n : Num, 2 <= n \226\134\146 (\226\136\131 p : Num, \226\136\131 k : Num, \226\136\131 m : Num, prime(p) && 1 <= k && coprime((p, m)) && n == EXP(p, k) * m)
      #|  (l : Num)
      #|  (q : Num)
      #|  EXP((p : Num), (l : Num))
      #|  (p : Bool) \226\134\146 !p \226\134\146 (q : Bool)
      #|  2 <= (p : Num) \226\134\146 !(p == 1)
      #|  (p : Num)
      #|  coprime(((p : Num), (r : Num)))
      #|  (q : Num) == (p : Num)
      #|  (l : Num) == 0
      #|  (l : Num)
      #|  (q : Num)
      #|  (1 < (p : Num)) == !(p == 0 || p == 1)
      #|  ((q : Num) < (p : Num) * q) == (1 * q < p * q)
      #|  (r : Num) == 0
      #|  (r : Num)
      #|  (s : Num)
      #|  (r : Num)
      #|  (k : Num)
      #|  (p : Num)
      #|  (m : Num)
      #|  (m : Num) == 1
      #|  1
      #|  (p : Num)
      #|  (p : Num)
      #|  (n : Num)
      #|  (m : Num) == 0
      #|  (n : Num)
      #|  (m : Num)
      #|  ((p : Bool) == (q : Bool)) == ((p \226\134\146 q) && (q \226\134\146 p))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, divides(m, n) == (\226\136\128 p : Num, \226\136\128 k : Num, prime(p) && divides(EXP(p, k), m) \226\134\146 divides(EXP(p, k), n))
      #|  divides((a : Num), a * (b : Num))
      #|  (k : Num)
      #|  (p : Num)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (m == n) == (\226\136\128 p : Num, \226\136\128 k : Num, prime(p) \226\134\146 divides(EXP(p, k), m) == divides(EXP(p, k), n))
      #|  (\226\136\131 d : Num, \226\136\131 x : _, \226\136\131 y : _, d == 1 && (P : (_, _, Num) -> Bool)(x, y, d)) == (\226\136\131 x : _, \226\136\131 y : _, P(x, y, 1))
      #|  (a : Num) * (x1 : Num) == (b : Num) * (y1 : Num) + 1
      #|  (b : Num) * (x2 : Num) == (a : Num) * (y2 : Num) + 1
      #|  (v : Num) * (y1 : Num) + (u : Num) * (x2 : Num)
      #|  (v : Num) * (x1 : Num) + (u : Num) * (y2 : Num)
      #|  (v : Num) * ((a : Num) * (x1 : Num)) + (u : Num) * ((b : Num) * (x2 : Num))
      #|  (y2 : Num)
      #|  (x2 : Num)
      #|  (y1 : Num)
      #|  (x1 : Num)
      #|  coprime(((a : Num), (b : Num)))
      #|  \226\136\128 d : Num, (divides(d, (a : Num)) && divides(d, (b : Num))) == (d == 1)
      #|  (b : Num)
      #|  (a : Num)
      #|  (a : Num)
      #|  (b : Num)
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 u : Num, \226\136\128 v : Num, coprime((a, b)) && !(a == 0) && !(b == 0) \226\134\146 (\226\136\131 x : Num, \226\136\131 q1 : Num, \226\136\131 q2 : Num, x == u + q1 * a && x == v + q2 * b)
      #|  EXP(2, (i : Num))
      #|  EXP((p : Num), (i : Num))
      #|  (i : Num)
      #|  op_dot_dot(0, (n : Num))
      #|  \226\136\128 P : (Num) -> Bool, \226\136\128 p : Num, \226\136\128 n : Num, 2 <= p \226\134\146 FINITE({(j : Num) | P(j) && EXP(p, j) <= n})
      #|  {(j : Num) | (P : (Num) -> Bool)(j) && EXP((p : Num), j) <= (n : Num)}
      #|  \226\136\128 P : (Num) -> Bool, \226\136\128 p : Num, \226\136\128 n : Num, 2 <= p && !(n == 0) \226\134\146 FINITE({(j : Num) | P(j) && divides(EXP(p, j), n)})
      #|  (index : (Num, Num) -> Num)((p : Num), (n : Num)) == (if p <= 1 || n == 0 { 0 } else { CARD({(j : Num) | 1 <= j && divides(EXP(p, j), n)}) })
      #|  \226\136\128 p : Num, index(p, 0) == 0
      #|  EXP((p : Num), (a : Num))
      #|  \226\136\128 k : Num, divides(EXP((p : Num), k), (n : Num)) == (k <= (a : Num))
      #|  (a : Num)
      #|  (p : Num)
      #|  (n : Num)
      #|  2 <= (p : Num)
      #|  (p : Num) == 1
      #|  (p : Num) == 0
      #|  (n : Num) == 0
      #|  \226\136\128 n : Num, \226\136\128 p : Num, \226\136\128 k : Num, divides(EXP(p, k), n) == (n == 0 || p == 1 || k <= index(p, n))
      #|  (p : Num) == 1
      #|  (n : Num) == 0
      #|  \226\136\128 n : Num, \226\136\128 p : Num, \226\136\128 k : Num, (k <= index(p, n)) == ((n == 0 || p == 1 \226\134\146 k == 0) && divides(EXP(p, k), n))
      #|  \226\136\128 p : Num, \226\136\128 n : Num, divides(EXP(p, index(p, n)), n)
      #|  (n : Num) == 0
      #|  \226\136\128 n : Num, \226\136\128 p : Num, \226\136\128 k : Num, (!(n == 0) || !(k == 0)) && n < EXP(p, k) \226\134\146 index(p, n) < k
      #|  !(1 <= (j : Num) && j == 0)
      #|  !((p : Num) <= 1) \226\134\146 !(p == 1)
      #|  \226\136\128 p : Num, index(p, 1) == 0
      #|  (p : Num)
      #|  (\226\136\128 k : Num, k <= (m : Num) \226\134\146 k <= (n : Num)) \226\134\146 m <= n
      #|  !((p : Num) == 1)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, prime((p : Num)) && !(m == 0) && !(n == 0) \226\134\146 index(p, m * n) == index(p, m) + index(p, n)
      #|  (n : Num) == 0
      #|  \226\136\128 p : Num, \226\136\128 n : Num, \226\136\128 k : Num, prime(p) \226\134\146 index(p, EXP(n, k)) == k * index(p, n)
      #|  \226\136\128 p : Num, \226\136\128 n : Num, prime(p) \226\134\146 index(p, FACT(n)) == nsum(op_dot_dot(1, n), (m : Num) => index(p, m))
      #|  (1 <= (x : Num)) == !(x == 0)
      #|  (d : Num) == EXP((p : Num), (j : Num)) * (q : Num)
      #|  (q : Num)
      #|  (d : Num)
      #|  {(m : Num) | IN(m, op_dot_dot(1, (n : Num))) && divides(EXP((p : Num), (j : Num)), m)} == IMAGE((q : Num) => EXP(p, j) * q, op_dot_dot(1, DIV(n, EXP(p, j))))
      #|  (j : Num)
      #|  (m : Num)
      #|  nsum(op_dot_dot(1, (n : Num)), (m : Num) => nsum({(j : Num) | 1 <= j && EXP((p : Num), j) <= n}, (j : Num) => if divides(EXP(p, j), m) { 1 } else { 0 }))
      #|  !((p : Num) == 0) && !(p == 1) && 2 <= p && !(p <= 1)
      #|  \226\136\128 p : Num, \226\136\128 n : Num, prime(p) \226\134\146 index(p, FACT(n)) == nsum({(j : Num) | 1 <= j && EXP(p, j) <= n}, (j : Num) => DIV(n, EXP(p, j)))
      #|  \226\136\128 p : Num, \226\136\128 n : Num, prime(p) \226\134\146 index(p, FACT(n)) == nsum({(j : Num) | 1 <= j}, (j : Num) => DIV(n, EXP(p, j)))
      #|  \226\136\128 p : Num, \226\136\128 n : Num, \226\136\128 k : Num, prime(p) \226\134\146 divides(EXP(p, k), FACT(n)) == (k <= nsum({(j : Num) | 1 <= j && EXP(p, j) <= n}, (j : Num) => DIV(n, EXP(p, j))))
      #|  2 <= (n : Num)
      #|  divides((a : Num), (b : Num)) == divides(a, EXP(b, 1))
      #|  (n : Num) == 0
      #|  \226\136\128 n : Num, index(n, n) == (if n <= 1 { 0 } else { 1 })
      #|  ((n : Num) == 0) == !(1 <= n)
      #|  \226\136\128 p : Num, \226\136\128 n : Num, (index(p, n) == 0) == (n == 0 || p == 1 || !divides(p, n))
      #|  \226\136\128 p : Num, \226\136\128 n : Num, !divides(p, n) \226\134\146 index(p, n) == 0
      #|  (d : Num)
      #|  ((m : Num) == (n : Num)) == (\226\136\128 d : Num, (d <= m) == (d <= n))
      #|  (k : Num) == 0
      #|  \226\136\128 p : Num, \226\136\128 n : Num, \226\136\128 k : Num, index(EXP(p, k), n) == DIV(index(p, n), k)
      #|  ((p : Num) <= 1) == (p == 0 || p == 1)
      #|  \226\136\128 p : Num, \226\136\128 a : Num, prime(p) \226\134\146 index(a, p) == (if p == a { 1 } else { 0 })
      #|  EXP(2, (n : Num))
      #|  !((m : Num) <= (n : Num)) \226\134\146 n <= m
      #|  1 < (p : Num) \226\134\146 !(p == 1)
      #|  (n : Num)
      #|  (p : Num)
      #|  (n : Num)
      #|  \226\136\128 n : Num, \226\136\128 p : Num, index(p, n) <= n
      #|  (p : Num) == 1
      #|  (n : Num) == 0
      #|  !((n : Num) + 1 <= n)
      #|  index((p : Num), (n : Num)) + 1
      #|  (p : Num)
      #|  (n : Num)
      #|  (m : Num)
      #|  index((p : Num), (n : Num))
      #|  (p : Num)
      #|  (n : Num)
      #|  \226\136\128 n : Num, \226\136\128 p : Num, \226\136\131 m : Num, EXP(p, index(p, n)) * m == n && (n == 0 || p == 1 || !divides(p, m))
      #|  (n : Num) == 0
      #|  (p : Num) == 1
      #|  (m : Num)
      #|  (p : Num)
      #|  (n : Num)
      #|  \226\136\128 n : Num, \226\136\128 p : Num, prime(p) \226\134\146 (\226\136\131 m : Num, EXP(p, index(p, n)) * m == n && (n == 0 || coprime((p, m))))
      #|  (d : Num)
      #|  ((p : Bool) && !(q : Bool) && !(r : Bool) \226\134\146 (s : Bool)) == (!q \226\134\146 !s \226\134\146 p \226\134\146 r)
      #|  \226\136\128 p : Num, \226\136\128 e1 : Num, \226\136\128 m1 : Num, \226\136\128 e2 : Num, \226\136\128 m2 : Num, EXP(p, e1) * m1 == EXP(p, e2) * m2 && !(p == 0) && !divides(p, m2) \226\134\146 e1 <= e2
      #|  \226\136\128 p : Num, \226\136\128 e1 : Num, \226\136\128 m1 : Num, \226\136\128 e2 : Num, \226\136\128 m2 : Num, EXP(p, e1) * m1 == EXP(p, e2) * m2 && !(p == 0) && !divides(p, m1) && !divides(p, m2) \226\134\146 e1 == e2
      #|  divides((p : Num), p * (q : Num))
      #|  (p : Num) == 0
      #|  (m : Num) == 0
      #|  (p : Num) == 1
      #|  (p : Num) == 0 \226\134\146 (e : Num) == 0
      #|  !((e : Num) + 1 == 0)
      #|  ((i : Num) == (e : Num)) == (e <= i && !(e + 1 <= i))
      #|  \226\136\128 p : Num, \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 e : Num, EXP(p, e) * m == n && (p == 0 \226\134\146 e == 0) && !divides(p, m) \226\134\146 index(p, n) == e
      #|  \226\136\128 n : Num, \226\136\128 p : Num, \226\136\128 k : Num, (index(p, n) == k) == (if p == 1 || n == 0 { k == 0 } else { \226\136\128 j : Num, divides(EXP(p, j), n) == (j <= k) })
      #|  ((k : Num) < (j : Num)) == (k + 1 <= j)
      #|  !divides(EXP((p : Num), (k : Num) + 1), (n : Num))
      #|  (j : Num)
      #|  \226\136\128 n : Num, \226\136\128 p : Num, \226\136\128 k : Num, (index(p, n) == k) == (if p == 1 || n == 0 { k == 0 } else { divides(EXP(p, k), n) && !divides(EXP(p, k + 1), n) })
      #|  EXP((p : Num), index(p, (n : Num)))
      #|  EXP((p : Num), index(p, (m : Num)))
      #|  (MIN((a : Num), (b : Num)) == 0) == (a == 0 || b == 0)
      #|  (p : Num) == 1
      #|  \226\136\128 p : Num, \226\136\128 m : Num, \226\136\128 n : Num, MIN(index(p, m), index(p, n)) <= index(p, m + n)
      #|  EXP((p : Num), index(p, (m : Num)))
      #|  EXP((p : Num), index(p, (n : Num)))
      #|  (n : Num)
      #|  (p : Num) == 1
      #|  \226\136\128 p : Num, \226\136\128 m : Num, \226\136\128 n : Num, n < m \226\134\146 MIN(index(p, m), index(p, n)) <= index(p, m - n)
      #|  divides((p : Num), (m : Num)) && !divides(p, (n : Num)) \226\134\146 !divides(p, m + n)
      #|  (p : Num) == 1
      #|  (m : Num) == 0
      #|  \226\136\128 p : Num, \226\136\128 n : Num, \226\136\128 m : Num, !(n == 0) && (!(m == 0) \226\134\146 index(p, n) < index(p, m)) \226\134\146 index(p, m + n) == index(p, n)
      #|  (p : Num) == 0
      #|  ((p : Bool) \226\134\146 (q : Bool)) && p \226\134\146 p && q
      #|  (\226\136\128 p : Num, \226\136\128 n : Num, index(p, p * n) == (if p <= 1 || n == 0 { 0 } else { index(p, n) + 1 })) && (\226\136\128 p : Num, \226\136\128 n : Num, index(p, n * p) == (if p <= 1 || n == 0 { 0 } else { index(p, n) + 1 }))
      #|  (n : Num) == 0
      #|  (p : Num) <= 1
      #|  (p : Num) == 0
      #|  ((p : Bool) \226\134\146 (q : Bool)) && p \226\134\146 p && q
      #|  (\226\136\128 p : Num, \226\136\128 n : Num, \226\136\128 k : Num, index(p, EXP(p, k) * n) == (if p <= 1 || n == 0 { 0 } else { k + index(p, n) })) && (\226\136\128 p : Num, \226\136\128 n : Num, \226\136\128 k : Num, index(p, n * EXP(p, k)) == (if n == 0 || p <= 1 { 0 } else { index(p, n) + k }))
      #|  (p : Num) <= 1
      #|  ((p : Bool) \226\134\146 (q : Bool)) && p \226\134\146 p && q
      #|  (\226\136\128 p : Num, \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 k : Num, !(n == 0) && index(p, n) < k \226\134\146 index(p, EXP(p, k) * m + n) == index(p, n)) && (\226\136\128 p : Num, \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 k : Num, !(n == 0) && index(p, n) < k \226\134\146 index(p, m * EXP(p, k) + n) == index(p, n)) && (\226\136\128 p : Num, \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 k : Num, !(n == 0) && index(p, n) < k \226\134\146 index(p, n + m * EXP(p, k)) == index(p, n)) && (\226\136\128 p : Num, \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 k : Num, !(n == 0) && index(p, n) < k \226\134\146 index(p, n + EXP(p, k) * m) == index(p, n))
      #|  (m : Num) => (n : Num) <= index((p : Num), m)
      #|  \226\136\128 f : (A) -> Num, \226\136\128 p : Num, \226\136\128 n : Num, \226\136\128 k : (A) -> Bool, FINITE(k) && !(k == {}) && (\226\136\128 a : A, IN(a, k) \226\134\146 n <= index(p, f(a))) \226\134\146 n <= index(p, nsum(k, f))
      #|  prime((p : Num)) \226\134\146 !(p == 1)
      #|  ((m : Num) <= (n : Num)) == (\226\136\128 k : Num, k <= m \226\134\146 k <= n)
      #|  (m : Num) == 0
      #|  (n : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, divides(m, n) == (n == 0 || !(m == 0) && (\226\136\128 p : Num, prime(p) \226\134\146 index(p, m) <= index(p, n)))
      #|  (n : Num) == 0
      #|  (m : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (m == n) == ((m == 0) == (n == 0) && (\226\136\128 p : Num, prime(p) \226\134\146 index(p, m) == index(p, n)))
      #|  prime((p : Num)) \226\134\146 !(p == 1)
      #|  (n : Num) == 0
      #|  (m : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, coprime((m, n)) == ((m == 0 \226\134\146 n == 1) && (n == 0 \226\134\146 m == 1) && (\226\136\128 p : Num, prime(p) \226\134\146 index(p, m) == 0 || index(p, n) == 0))
      #|  ((k : Num) <= (m : Num) && k <= (n : Num)) == (k <= MIN(m, n))
      #|  prime((p : Num)) \226\134\146 !(p == 1)
      #|  EXP((p : Num), (k : Num))
      #|  (n : Num)
      #|  (m : Num)
      #|  (k : Num)
      #|  MIN(0, (n : Num)) == 0 && MIN((m : Num), 0) == 0
      #|  (n : Num) == 0
      #|  (m : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, prime(p) \226\134\146 index(p, gcd((m, n))) == (if m == 0 { index(p, n) } else { if n == 0 { index(p, m) } else { MIN(index(p, m), index(p, n)) } })
      #|  EXP((p : Num), (k : Num))
      #|  (k : Num)
      #|  (\226\136\128 p : Num, prime(p) \226\134\146 (\226\136\128 P : (Num) -> Bool, (\226\136\128 x : Num, P(index(p, x))) == (\226\136\128 k : Num, P(k)))) && (\226\136\128 p : Num, prime(p) \226\134\146 (\226\136\128 P : (Num) -> Bool, (\226\136\128 x : Num, !(x == 0) \226\134\146 P(index(p, x))) == (\226\136\128 k : Num, P(k))))
      #|  (1 <= (n : Num)) == !(n == 0)
      #|  (\226\136\128 x : _, IN((f : (_) -> _)(x), (t : (_) -> Bool)) == IN(x, (s : (_) -> Bool))) && (\226\136\128 y : _, !(P : (_) -> Bool)(y) \226\134\146 IN(y, IMAGE(f, UNIV))) \226\134\146 SUBSET(IMAGE(f, s), t) && (\226\136\128 y : _, IN(y, t) && !IN(y, IMAGE(f, s)) \226\134\146 P(y))
      #|  nsum(IMAGE((i : Num) => (p : Num) * i, op_dot_dot(1, (n : Num))), (m : Num) => index(p, m))
      #|  (n : Num) == 0
      #|  \226\136\128 p : Num, \226\136\128 n : Num, prime(p) \226\134\146 index(p, FACT(p * n)) == n + index(p, FACT(n))
      #|  (q : Num)
      #|  (q : Num)
      #|  EXP((p : Num), (k : (Num) -> Num)(p)) * (n : Num)
      #|  (n : Num)
      #|  prime((p : Num))
      #|  (i : Num) => if i == (p : Num) { 0 } else { (k : (Num) -> Num)(i) }
      #|  (k : (Num) -> Num)
      #|  (s : (Num) -> Bool)
      #|  (p : Num)
      #|  !(1 == 0)
      #|  SUBSET({(p : Num) | prime(p) && !(Z : (Num) -> Bool)(p)}, {}) == (\226\136\128 p : Num, prime(p) \226\134\146 Z(p))
      #|  \226\136\128 s : (Num) -> Bool, FINITE(s) \226\134\146 (\226\136\128 k : (Num) -> Num, SUBSET({(p : Num) | prime(p) && !(k(p) == 0)}, s) \226\134\146 (\226\136\131 n : Num, !(n == 0) && (\226\136\128 p : Num, prime(p) \226\134\146 index(p, n) == k(p))))
      #|  \226\136\128 k : (Num) -> Num, FINITE({(p : Num) | prime(p) && !(k(p) == 0)}) \226\134\146 (\226\136\131 n : Num, !(n == 0) && (\226\136\128 p : Num, prime(p) \226\134\146 index(p, n) == k(p)))
      #|  (p : Num)
      #|  divides(EXP((p : Num), (k : Num)), (n : Num))
      #|  (k : Num) == 0
      #|  (k : Num)
      #|  (p : Num)
      #|  index((q : Num), (n : Num))
      #|  1
      #|  (p : Num)
      #|  (i : Num)
      #|  (p : Num)
      #|  \226\136\128 n : Num, \226\136\128 q : Num, prime(q) \226\134\146 (\226\136\131 i : Num, n == EXP(q, i)) == (\226\136\128 p : Num, prime(p) && divides(p, n) \226\134\146 p == q)
      #|  2
      #|  2
      #|  2
      #|  2
      #|  2
      #|  3
      #|  \226\136\128 n : Num, \226\136\128 p : Num, prime(p) \226\134\146 (\226\136\131 i : Num, n == EXP(p, i)) == (\226\136\128 d : Num, divides(d, n) \226\134\146 d == 1 || divides(p, d))
      #|  (x : Num) * (y : Num) == (z : Num) \226\134\146 x == (m : Num) && y == (n : Num) \226\134\146 z == m * n
      #|  (n : Num)
      #|  (m : Num)
      #|  (p : Num)
      #|  \226\136\128 n : Num, !(n == 0) \226\134\146 nproduct({(p : Num) | prime(p)}, (p : Num) => EXP(p, index(p, n))) == n
      #|  \226\136\128 n : Num, !(n == 0) \226\134\146 nproduct({(p : Num) | prime(p) && divides(p, n)}, (p : Num) => EXP(p, index(p, n))) == n
      #|  lcm(((m : Num), (n : Num))) == (if m * n == 0 { 0 } else { DIV(m * n, gcd((m, n))) })
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 d : Num, divides(lcm((m, n)), d) == (divides(m, d) && divides(n, d))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, divides(m, lcm((m, n))) && divides(n, lcm((m, n))) && (\226\136\128 d : Num, divides(m, d) && divides(n, d) \226\134\146 divides(lcm((m, n)), d))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, divides(lcm((m, n)), m * n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 r : Num, divides(r, m) || divides(r, n) \226\134\146 divides(r, lcm((m, n)))
      #|  (\226\136\128 n : Num, lcm((0, n)) == 0) && (\226\136\128 n : Num, lcm((n, 0)) == 0)
      #|  (\226\136\128 n : Num, lcm((1, n)) == n) && (\226\136\128 n : Num, lcm((n, 1)) == n)
      #|  MAX((m : Num), (n : Num)) == MAX(n, m)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, lcm((m, n)) == lcm((n, m))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 d : Num, divides(d, lcm((m, n))) == divides(d * gcd((m, n)), m * n)
      #|  (k : Num) + MIN((a : Num), (b : Num)) <= a + b \226\134\146 k <= a || k <= b
      #|  (a : Num) < a + 1
      #|  (b : Num) + 1
      #|  \226\136\128 l : Num, (b : Num) < l \226\134\146 !(\226\136\131 x : Num, (n : Num) == EXP((p : Num), l) * x)
      #|  (a : Num) + 1
      #|  \226\136\128 l : Num, (a : Num) < l \226\134\146 !(\226\136\131 x : Num, (m : Num) == EXP((p : Num), l) * x)
      #|  prime((p : Num)) && !divides(p, (n : Num)) \226\134\146 coprime((p, n))
      #|  (a : Num) * (b : Num) * (c : Num) * (d : Num) == a * c * (b * d)
      #|  divides((a : Num) * (b : Num), (c : Num)) \226\134\146 divides(a, c)
      #|  gcd((EXP((p : Num), (a : Num)) * (q : Num), EXP(p, (b : Num)) * (r : Num))) == EXP(p, MIN(a, b)) * gcd((EXP(p, a - MIN(a, b)) * q, EXP(p, b - MIN(a, b)) * r))
      #|  divides(EXP((p : Num), (k : Num)), lcm(((m : Num), (n : Num))))
      #|  (r : Num)
      #|  (b : Num)
      #|  (q : Num)
      #|  (a : Num)
      #|  (p : Num)
      #|  (m : Num)
      #|  (p : Num)
      #|  (n : Num)
      #|  (n : Num) == 0
      #|  (m : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, \226\136\128 k : Num, prime(p) \226\134\146 divides(EXP(p, k), lcm((m, n))) == (divides(EXP(p, k), m) || divides(EXP(p, k), n))
      #|  1
      #|  (p : Num)
      #|  (n : Num)
      #|  (m : Num)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, prime(p) \226\134\146 divides(p, lcm((m, n))) == (divides(p, m) || divides(p, n))
      #|  (n : Num) == 0
      #|  (m : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (lcm((m, n)) == 0) == (m == 0 || n == 0)
      #|  ((k : Num) <= (m : Num) || k <= (n : Num)) == (k <= MAX(m, n))
      #|  prime((p : Num)) \226\134\146 !(p == 1)
      #|  (n : Num)
      #|  (m : Num)
      #|  (n : Num) == 0
      #|  (m : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, prime(p) \226\134\146 index(p, lcm((m, n))) == (if m == 0 || n == 0 { 0 } else { MAX(index(p, m), index(p, n)) })
      #|  (q : Num)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, lcm((m, lcm((n, p)))) == lcm((lcm((m, n)), p))
      #|  MAX((n : Num), n) == n
      #|  \226\136\128 n : Num, lcm((n, n)) == n
      #|  \226\136\128 a : Num, \226\136\128 b : Num, lcm((b, a * b)) == a * b
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, lcm((a, gcd((b, c)))) == gcd((lcm((a, b)), lcm((a, c))))
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, gcd((a, lcm((b, c)))) == lcm((gcd((a, b)), gcd((a, c))))
      #|  \226\136\128 d : Num, \226\136\128 m : Num, \226\136\128 n : Num, (divides(m, d) && divides(n, d) && (\226\136\128 e : Num, divides(m, e) && divides(n, e) \226\134\146 divides(d, e))) == (d == lcm((m, n)))
      #|  \226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 u : Num, \226\136\128 v : Num, (\226\136\128 d : Num, (divides(x, d) && divides(y, d)) == (divides(u, d) && divides(v, d))) \226\134\146 lcm((x, y)) == lcm((u, v))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (lcm((m, n)) == 1) == (m == 1 && n == 1)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, divides(n, m) == (lcm((m, n)) == m)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, divides(m, n) == (lcm((m, n)) == n)
      #|  (n : Num) == 0
      #|  (m : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, lcm((m, n)) * gcd((m, n)) == m * n
      #|  \226\136\128 m : Num, \226\136\128 n : Num, gcd((m, n)) * lcm((m, n)) == m * n
      #|  ((a : Num) * ((c : Num) * (b : Num)) == c * (d : Num) * (g : Num)) == (c * (d * g) == c * (a * b))
      #|  0
      #|  (c : Num) == 0
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, lcm((c * a, c * b)) == c * lcm((a, b))
      #|  \226\136\128 a : Num, \226\136\128 b : Num, \226\136\128 c : Num, lcm((a * c, b * c)) == c * lcm((a, b))
      #|  0
      #|  (n : Num) == 0
      #|  \226\136\128 n : Num, \226\136\128 a : Num, \226\136\128 b : Num, lcm((EXP(a, n), EXP(b, n))) == EXP(lcm((a, b)), n)
      #|  gcd(((m : Num), (n : Num)))
      #|  \226\136\128 d : Num, !(d == 0) && (a : Num) * d == (b : Num) * d \226\134\146 a == b
      #|  (n' : Num) * (n'' : Num)
      #|  (m' : Num) * (m'' : Num)
      #|  (m'' : Num)
      #|  (n'' : Num)
      #|  gcd(((m : Num), (n : Num)))
      #|  (n' : Num)
      #|  (m' : Num)
      #|  (n' : Num)
      #|  (m' : Num)
      #|  (n : Num)
      #|  (m : Num)
      #|  1
      #|  0
      #|  (m : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\131 m' : Num, \226\136\131 n' : Num, divides(m', m) && divides(n', n) && coprime((m', n')) && m' * n' == lcm((m, n))
      #|  (n : Num) == 0
      #|  (m : Num) == 0
      #|  (\226\136\128 m : Num, \226\136\128 n : Num, (m <= lcm((m, n))) == (n == 0 \226\134\146 m == 0)) && (\226\136\128 m : Num, \226\136\128 n : Num, (n <= lcm((m, n))) == (m == 0 \226\134\146 n == 0))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, lcm((m, n)) <= m * n
      #|  (n : Num) == 0
      #|  (m : Num) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (lcm((m, n)) == m * n) == (m == 0 || n == 0 || coprime((m, n)))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (MAX(m, n) <= lcm((m, n))) == ((m == 0) == (n == 0))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (m == 0) == (n == 0) \226\134\146 MAX(m, n) <= lcm((m, n))
      #|  neutral((m : Num) => (n : Num) => gcd((m, n))) == 0
      #|  monoidal((m : Num) => (n : Num) => gcd((m, n)))
      #|  neutral((m : Num) => (n : Num) => lcm((m, n))) == 1
      #|  monoidal((m : Num) => (n : Num) => lcm((m, n)))
      #|  \226\136\128 f : (K) -> Num, \226\136\128 k : (K) -> Bool, \226\136\128 i : K, FINITE(k) && IN(i, k) \226\134\146 divides(iterate((m : Num) => (n : Num) => gcd((m, n)), k, f), f(i))
      #|  (f : (K) -> Num)((i : K)) == 0
      #|  \226\136\128 f : (K) -> Num, \226\136\128 k : (K) -> Bool, \226\136\128 i : K, IN(i, k) \226\134\146 divides(iterate((m : Num) => (n : Num) => gcd((m, n)), k, f), f(i)) == (FINITE({(j : K) | IN(j, k) && !(f(j) == 0)}) || f(i) == 0)
      #|  \226\136\128 f : (K) -> Num, \226\136\128 k : (K) -> Bool, \226\136\128 d : Num, FINITE(k) \226\134\146 divides(d, iterate((m : Num) => (n : Num) => gcd((m, n)), k, f)) == (\226\136\128 i : K, IN(i, k) \226\134\146 divides(d, f(i)))
      #|  \226\136\128 f : (K) -> Num, \226\136\128 k : (K) -> Bool, \226\136\128 d : Num, divides(d, iterate((m : Num) => (n : Num) => gcd((m, n)), k, f)) == (FINITE({(j : K) | IN(j, k) && !(f(j) == 0)}) \226\134\146 (\226\136\128 i : K, IN(i, k) \226\134\146 divides(d, f(i))))
      #|  \226\136\128 f : (K) -> Num, \226\136\128 k : (K) -> Bool, \226\136\128 i : K, FINITE(k) && IN(i, k) \226\134\146 divides(f(i), iterate((m : Num) => (n : Num) => lcm((m, n)), k, f))
      #|  (f : (K) -> Num)((i : K)) == 1
      #|  \226\136\128 f : (K) -> Num, \226\136\128 k : (K) -> Bool, \226\136\128 i : K, IN(i, k) \226\134\146 divides(f(i), iterate((m : Num) => (n : Num) => lcm((m, n)), k, f)) == (FINITE({(j : K) | IN(j, k) && !(f(j) == 1)}) || f(i) == 1)
      #|  \226\136\128 f : (K) -> Num, \226\136\128 k : (K) -> Bool, \226\136\128 n : Num, FINITE(k) \226\134\146 divides(iterate((m : Num) => (n : Num) => lcm((m, n)), k, f), n) == (\226\136\128 i : K, IN(i, k) \226\134\146 divides(f(i), n))
      #|  \226\136\128 f : (K) -> Num, \226\136\128 k : (K) -> Bool, \226\136\128 n : Num, divides(iterate((m : Num) => (n : Num) => lcm((m, n)), k, f), n) == (FINITE({(j : K) | IN(j, k) && !(f(j) == 1)}) \226\134\146 (\226\136\128 i : K, IN(i, k) \226\134\146 divides(f(i), n)))
      #|  \226\136\128 f : (K) -> Num, \226\136\128 k : (K) -> Bool, \226\136\128 p : Num, \226\136\128 m : Num, FINITE(k) && prime(p) \226\134\146 divides(EXP(p, m), iterate((m : Num) => (n : Num) => lcm((m, n)), k, f)) == (m == 0 || (\226\136\131 i : K, IN(i, k) && divides(EXP(p, m), f(i))))
      #|  (m : Num) == 0
      #|  \226\136\128 f : (K) -> Num, \226\136\128 k : (K) -> Bool, \226\136\128 p : Num, \226\136\128 m : Num, prime(p) \226\134\146 divides(EXP(p, m), iterate((m : Num) => (n : Num) => lcm((m, n)), k, f)) == (m == 0 || FINITE({(j : K) | IN(j, k) && !(f(j) == 1)}) && (\226\136\131 i : K, IN(i, k) && divides(EXP(p, m), f(i))))
      #|  1
      #|  (p : Num)
      #|  (k : (K) -> Bool)
      #|  (f : (K) -> Num)
      #|  \226\136\128 f : (K) -> Num, \226\136\128 k : (K) -> Bool, \226\136\128 p : Num, prime(p) \226\134\146 divides(p, iterate((m : Num) => (n : Num) => lcm((m, n)), k, f)) == (FINITE({(j : K) | IN(j, k) && !(f(j) == 1)}) && (\226\136\131 i : K, IN(i, k) && divides(p, f(i))))
      #|  \226\136\128 f : (K) -> Num, \226\136\128 k : (K) -> Bool, \226\136\128 p : Num, FINITE(k) && prime(p) \226\134\146 divides(p, iterate((m : Num) => (n : Num) => lcm((m, n)), k, f)) == (\226\136\131 i : K, IN(i, k) && divides(p, f(i)))
      #|  (k : (K) -> Bool)
      #|  {(j : K) | IN(j, (k : (K) -> Bool)) && !((f : (K) -> Num)(j) == 1)}
      #|  (IN((j : _), (k : (_) -> Bool)) && !((f : (_) -> Num)(j) == 1) && f(j) == 0) == (IN(j, {(j : _) | IN(j, k) && !(f(j) == 1)}) && f(j) == 0)
      #|  ((n : Num) == 0) == (!(n == 1) && n == 0)
      #|  \226\136\128 k : (K) -> Bool, \226\136\128 f : (K) -> Num, (iterate((m : Num) => (n : Num) => lcm((m, n)), k, f) == 0) == (FINITE({(j : K) | IN(j, k) && !(f(j) == 1)}) && (\226\136\131 j : K, IN(j, k) && f(j) == 0))
      #|  \226\136\128 k : (K) -> Bool, \226\136\128 f : (K) -> Num, FINITE(k) \226\134\146 (iterate((m : Num) => (n : Num) => lcm((m, n)), k, f) == 0) == (\226\136\131 j : K, IN(j, k) && f(j) == 0)
      #|  (k : (K) -> Bool)
      #|  {(j : K) | IN(j, (k : (K) -> Bool)) && !((f : (K) -> Num)(j) == 1)}
      #|  (\226\136\128 j : _, IN(j, (k : (_) -> Bool)) \226\134\146 (f : (_) -> Num)(j) == 1) == (\226\136\128 j : _, IN(j, {(j : _) | IN(j, k) && !(f(j) == 1)}) \226\134\146 f(j) == 1)
      #|  \226\136\128 k : (K) -> Bool, \226\136\128 f : (K) -> Num, (iterate((m : Num) => (n : Num) => lcm((m, n)), k, f) == 1) == (FINITE({(j : K) | IN(j, k) && !(f(j) == 1)}) \226\134\146 (\226\136\128 j : K, IN(j, k) \226\134\146 f(j) == 1))
      #|  \226\136\128 k : (K) -> Bool, \226\136\128 f : (K) -> Num, FINITE(k) \226\134\146 (iterate((m : Num) => (n : Num) => lcm((m, n)), k, f) == 1) == (\226\136\128 j : K, IN(j, k) \226\134\146 f(j) == 1)
      #|  (k : (K) -> Bool)
      #|  {(j : K) | IN(j, (k : (K) -> Bool)) && !((f : (K) -> Num)(j) == 0)}
      #|  (\226\136\128 j : _, IN(j, (k : (_) -> Bool)) \226\134\146 (f : (_) -> Num)(j) == 0) == (\226\136\128 j : _, IN(j, {(j : _) | IN(j, k) && !(f(j) == 0)}) \226\134\146 f(j) == 0)
      #|  \226\136\128 k : (K) -> Bool, \226\136\128 f : (K) -> Num, (iterate((m : Num) => (n : Num) => gcd((m, n)), k, f) == 0) == (FINITE({(j : K) | IN(j, k) && !(f(j) == 0)}) \226\134\146 (\226\136\128 j : K, IN(j, k) \226\134\146 f(j) == 0))
      #|  \226\136\128 k : (K) -> Bool, \226\136\128 f : (K) -> Num, FINITE(k) \226\134\146 (iterate((m : Num) => (n : Num) => gcd((m, n)), k, f) == 0) == (\226\136\128 j : K, IN(j, k) \226\134\146 f(j) == 0)
      #|  (m : Num) == 1 * m
      #|  (k : Num) < k + 1
      #|  (1 < (x : Num)) == (!(x == 0) && !(x == 1))
      #|  1 < EXP((p : Num), (k : Num)) * (m : Num)
      #|  0 < 1
      #|  !((k : Num) == 0)
      #|  (m : Num) == 0
      #|  \226\136\128 p : Bool, ((a : Bool) && (b : Bool) && !p) && (c : Bool) && (a && !p \226\134\146 b \226\134\146 (d : Bool)) \226\134\146 a && b && c && d
      #|  (m : Num) == 1
      #|  (m : Num)
      #|  (k : Num)
      #|  1 < (n : Num) \226\134\146 !(n == 0)
      #|  (p : Num)
      #|  (n : Num)
      #|  (p : Num)
      #|  1 < (n : Num) \226\134\146 !(n == 1)
      #|  (n : Num)
      #|  \226\136\128 P : (Num) -> Bool, (\226\136\128 a : Num, \226\136\128 b : Num, 1 < a && 1 < b && coprime((a, b)) && P(a) && P(b) \226\134\146 P(a * b)) && (\226\136\128 p : Num, \226\136\128 k : Num, prime(p) \226\134\146 P(EXP(p, k))) \226\134\146 (\226\136\128 n : Num, 1 < n \226\134\146 P(n))
      #|  (k : Num) == 0
      #|  (k : Num)
      #|  (p : Num)
      #|  ((a : Bool) \226\134\146 (b : Bool)) == (a \226\134\146 a \226\134\146 b)
      #|  \226\136\128 P : (Num) -> Bool, (\226\136\128 a : Num, \226\136\128 b : Num, 1 < a && 1 < b && coprime((a, b)) && P(a) && P(b) \226\134\146 P(a * b)) && (\226\136\128 p : Num, \226\136\128 k : Num, prime(p) && !(k == 0) \226\134\146 P(EXP(p, k))) \226\134\146 (\226\136\128 n : Num, 1 < n \226\134\146 P(n))
      #|  !(1 < (n : Num)) == (n == 0 || n == 1)
      #|  (\226\136\128 n : Num, 1 < n \226\134\146 (P : (Num) -> Bool)(n)) && (\226\136\128 n : Num, !(1 < n) \226\134\146 P(n)) \226\134\146 (\226\136\128 n : Num, P(n))
      #|  \226\136\128 P : (Num) -> Bool, P(0) && (\226\136\128 a : Num, \226\136\128 b : Num, 1 < a && 1 < b && coprime((a, b)) && P(a) && P(b) \226\134\146 P(a * b)) && (\226\136\128 p : Num, \226\136\128 k : Num, prime(p) \226\134\146 P(EXP(p, k))) \226\134\146 (\226\136\128 n : Num, P(n))
      #|  (b : Num)
      #|  !((a : Num) == 0) \226\134\146 divides(a, (b : Num)) == (MOD(b, a) == 0)
      #|  (a : Num)
      #|  (b : Num)
      #|  0
      #|  divides
      #|  (m : Num) * (x : Num) == (n : Num) * (y : Num) + 1 \226\134\146 coprime((m, n)) == true
      #|  (m : Num) * (x : Num) == (n : Num) * (y : Num) + 1 \226\134\146 coprime((n, m)) == true
      #|  (m : Num) == (x : Num) * (d : Num) && (n : Num) == (y : Num) * d && !(d == 1) \226\134\146 coprime((m, n)) == false
      #|  1 == 0
      #|  coprime((0, 0)) == false
      #|  (m : Num)
      #|  (n : Num)
      #|  (x : Num)
      #|  (y : Num)
      #|  (d : Num)
      #|  coprime
      #|  gcd((0, 0)) == 0
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 d : Num, \226\136\128 m' : Num, \226\136\128 n' : Num, m * x == n * y + d && m == m' * d && n == n' * d \226\134\146 gcd((m, n)) == d
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 x : Num, \226\136\128 y : Num, \226\136\128 d : Num, \226\136\128 m' : Num, \226\136\128 n' : Num, n * y == m * x + d && m == m' * d && n == n' * d \226\134\146 gcd((m, n)) == d
      #|  gcd
      #|DIVIDES_0 =  |- (#forall:fun(fun(num,bool),bool) (\x:num. ((#num_divides:fun(num,fun(num,bool)) x:num) (#NUMERAL:fun(num,num) #_0:num))))
      #|DIVIDES_ZERO =  |- (#forall:fun(fun(num,bool),bool) (\x:num. ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) x:num)) ((#=:fun(num,fun(num,bool)) x:num) (#NUMERAL:fun(num,num) #_0:num)))))
      #|DIVIDES_1 =  |- (#forall:fun(fun(num,bool),bool) (\x:num. ((#num_divides:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) x:num)))
      #|DIVIDES_REFL =  |- (#forall:fun(fun(num,bool),bool) (\x:num. ((#num_divides:fun(num,fun(num,bool)) x:num) x:num)))
      #|DIVIDES_TRANS =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) a:num) b:num)) ((#num_divides:fun(num,fun(num,bool)) b:num) c:num))) ((#num_divides:fun(num,fun(num,bool)) a:num) c:num))))))))
      #|DIVIDES_ADD =  |- (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) a:num)) ((#num_divides:fun(num,fun(num,bool)) d:num) b:num))) ((#num_divides:fun(num,fun(num,bool)) d:num) ((#+:fun(num,fun(num,num)) a:num) b:num)))))))))
      #|DIVIDES_SUB_EQ =  |- (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) ((#-:fun(num,fun(num,num)) a:num) b:num))) ((#\/:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) a:num) b:num)) (((#==:fun(num,fun(num,fun(fun(num,fun(num,bool)),bool))) a:num) b:num) (#num_mod:fun(num,fun(num,fun(num,bool))) d:num))))))))))
      #|DIVIDES_SUB =  |- (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) a:num)) ((#num_divides:fun(num,fun(num,bool)) d:num) b:num))) ((#num_divides:fun(num,fun(num,bool)) d:num) ((#-:fun(num,fun(num,num)) a:num) b:num)))))))))
      #|DIVIDES_SUB_1 =  |- (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) (((#==:fun(num,fun(num,fun(fun(num,fun(num,bool)),bool))) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#num_mod:fun(num,fun(num,fun(num,bool))) d:num))))))))
      #|DIVIDES_LMUL =  |- (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\x:num. ((#==>:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) a:num)) ((#num_divides:fun(num,fun(num,bool)) d:num) ((#*:fun(num,fun(num,num)) x:num) a:num)))))))))
      #|DIVIDES_RMUL =  |- (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\x:num. ((#==>:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) a:num)) ((#num_divides:fun(num,fun(num,bool)) d:num) ((#*:fun(num,fun(num,num)) a:num) x:num)))))))))
      #|DIVIDES_ADD_REVR =  |- (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) a:num)) ((#num_divides:fun(num,fun(num,bool)) d:num) ((#+:fun(num,fun(num,num)) a:num) b:num)))) ((#num_divides:fun(num,fun(num,bool)) d:num) b:num))))))))
      #|DIVIDES_ADD_REVL =  |- (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) b:num)) ((#num_divides:fun(num,fun(num,bool)) d:num) ((#+:fun(num,fun(num,num)) a:num) b:num)))) ((#num_divides:fun(num,fun(num,bool)) d:num) a:num))))))))
      #|DIVIDES_MUL_L =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. ((#==>:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) a:num) b:num)) ((#num_divides:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) c:num) a:num)) ((#*:fun(num,fun(num,num)) c:num) b:num)))))))))
      #|DIVIDES_MUL_R =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. ((#==>:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) a:num) b:num)) ((#num_divides:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) a:num) c:num)) ((#*:fun(num,fun(num,num)) b:num) c:num)))))))))
      #|DIVIDES_LMUL2 =  |- (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\x:num. ((#==>:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) x:num) d:num)) a:num)) ((#num_divides:fun(num,fun(num,bool)) d:num) a:num))))))))
      #|DIVIDES_RMUL2 =  |- (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\x:num. ((#==>:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) d:num) x:num)) a:num)) ((#num_divides:fun(num,fun(num,bool)) d:num) a:num))))))))
      #|DIVIDES_CMUL2 =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) c:num) a:num)) ((#*:fun(num,fun(num,num)) c:num) b:num))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) c:num) (#NUMERAL:fun(num,num) #_0:num))))) ((#num_divides:fun(num,fun(num,bool)) a:num) b:num))))))))
      #|DIVIDES_LMUL2_EQ =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) c:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) c:num) a:num)) ((#*:fun(num,fun(num,num)) c:num) b:num))) ((#num_divides:fun(num,fun(num,bool)) a:num) b:num)))))))))
      #|DIVIDES_RMUL2_EQ =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) c:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) a:num) c:num)) ((#*:fun(num,fun(num,num)) b:num) c:num))) ((#num_divides:fun(num,fun(num,bool)) a:num) b:num)))))))))
      #|DIVIDES_EQ_ZERO =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) p:num)) ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) p:num) n:num)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|DIVIDES_CASES =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) n:num) m:num)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) n:num)) ((#<=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)) m:num))))))))
      #|DIVIDES_DIV_NOT =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\q:num. (#forall:fun(fun(num,bool),bool) (\r:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) x:num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) q:num) n:num)) r:num))) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) r:num)) ((#<:fun(num,fun(num,bool)) r:num) n:num)))) (#~:fun(bool,bool) ((#num_divides:fun(num,fun(num,bool)) n:num) x:num)))))))))))
      #|DIVIDES_MUL2 =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. (#forall:fun(fun(num,bool),bool) (\d:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) a:num) b:num)) ((#num_divides:fun(num,fun(num,bool)) c:num) d:num))) ((#num_divides:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) a:num) c:num)) ((#*:fun(num,fun(num,num)) b:num) d:num)))))))))))
      #|DIVIDES_EXP =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) x:num) y:num)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) x:num) n:num)) ((#EXP:fun(num,fun(num,num)) y:num) n:num)))))))))
      #|DIVIDES_EXP2 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) x:num) n:num)) y:num))) ((#num_divides:fun(num,fun(num,bool)) x:num) y:num))))))))
      #|DIVIDES_EXP_LE_IMP =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) m:num)) ((#EXP:fun(num,fun(num,num)) p:num) n:num)))))))))
      #|DIVIDES_EXP_LE =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) p:num)) ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) m:num)) ((#EXP:fun(num,fun(num,num)) p:num) n:num))) ((#<=:fun(num,fun(num,bool)) m:num) n:num)))))))))
      #|DIVIDES_TRIVIAL_UPPERBOUND =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) p:num))) (#~:fun(bool,bool) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) n:num)) n:num)))))))
      #|DIVIDES_FACT =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) p:num)) ((#<=:fun(num,fun(num,bool)) p:num) n:num))) ((#num_divides:fun(num,fun(num,bool)) p:num) (#FACT:fun(num,num) n:num)))))))
      #|DIVIDES_2 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)) (#EVEN:fun(num,bool) n:num))))
      #|DIVIDES_REXP_SUC =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) x:num) y:num)) ((#num_divides:fun(num,fun(num,bool)) x:num) ((#EXP:fun(num,fun(num,num)) y:num) (#SUC:fun(num,num) n:num))))))))))
      #|DIVIDES_REXP =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) x:num) y:num)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))))) ((#num_divides:fun(num,fun(num,bool)) x:num) ((#EXP:fun(num,fun(num,num)) y:num) n:num)))))))))
      #|FINITE_DIVISORS =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) (#FINITE:fun(fun(num,bool),bool) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%1:num. (#?:fun(fun(num,bool),bool) (\d:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%1:num) ((#num_divides:fun(num,fun(num,bool)) d:num) n:num)) d:num)))))))))
      #|FINITE_SPECIAL_DIVISORS =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) (#FINITE:fun(fun(num,bool),bool) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%2:num. (#?:fun(fun(num,bool),bool) (\d:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%2:num) ((#/\:fun(bool,fun(bool,bool)) (P:fun(num,bool) d:num)) ((#num_divides:fun(num,fun(num,bool)) d:num) n:num))) d:num)))))))))
      #|DIVISORS_EQ =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) n:num)) (#forall:fun(fun(num,bool),bool) (\d:num. ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) m:num)) ((#num_divides:fun(num,fun(num,bool)) d:num) n:num)))))))))
      #|MULTIPLES_EQ =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) n:num)) (#forall:fun(fun(num,bool),bool) (\d:num. ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) m:num) d:num)) ((#num_divides:fun(num,fun(num,bool)) n:num) d:num)))))))))
      #|DIVIDES_NSUM =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun('?1,num),bool),bool) (\f:fun('?1,num). (#forall:fun(fun(fun('?1,bool),bool),bool) (\s:fun('?1,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('?1,bool),bool) s:fun('?1,bool))) (#forall:fun(fun('?1,bool),bool) (\i:'?1. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('?1,fun(fun('?1,bool),bool)) i:'?1) s:fun('?1,bool))) ((#num_divides:fun(num,fun(num,bool)) n:num) (f:fun('?1,num) i:'?1))))))) ((#num_divides:fun(num,fun(num,bool)) n:num) ((#nsum:fun(fun('?1,bool),fun(fun('?1,num),num)) s:fun('?1,bool)) f:fun('?1,num))))))))))
      #|DIVIDES_GCD =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\d:num. ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) a:num)) ((#num_divides:fun(num,fun(num,bool)) d:num) b:num)))))))))
      #|GCD_0 =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) a:num))) a:num)))) (#forall:fun(fun(num,bool),bool) (\a:num. ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) (#NUMERAL:fun(num,num) #_0:num)))) a:num))))
      #|GCD_ZERO =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) b:num) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|GCD_REFL =  |- (#forall:fun(fun(num,bool),bool) (\a:num. ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) a:num))) a:num)))
      #|GCD_1 =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) a:num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#forall:fun(fun(num,bool),bool) (\a:num. ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|GCD_MULTIPLE =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) b:num) ((#*:fun(num,fun(num,num)) a:num) b:num)))) b:num)))))
      #|GCD_ADD =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#+:fun(num,fun(num,num)) a:num) b:num)) b:num))) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#+:fun(num,fun(num,num)) b:num) a:num)) b:num))) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) ((#+:fun(num,fun(num,num)) a:num) b:num)))) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num)))))))) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) ((#+:fun(num,fun(num,num)) b:num) a:num)))) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))))))))))
      #|GCD_SUB =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) b:num) a:num)) ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#-:fun(num,fun(num,num)) a:num) b:num)) b:num))) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))))))))) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) a:num) b:num)) ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) ((#-:fun(num,fun(num,num)) b:num) a:num)))) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num)))))))))
      #|DIVIDES_GCD_LEFT =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) m:num) n:num)) ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) m:num))))))
      #|DIVIDES_GCD_RIGHT =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) n:num) m:num)) ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) n:num))))))
      #|GCD_COPRIME_LMUL =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. ((#==>:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#*:fun(num,fun(num,num)) a:num) b:num)) c:num))) ((#*:fun(num,fun(num,num)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) c:num))) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) b:num) c:num)))))))))))
      #|GCD_COPRIME_RMUL =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. ((#==>:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) c:num) ((#*:fun(num,fun(num,num)) a:num) b:num)))) ((#*:fun(num,fun(num,num)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) c:num) a:num))) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) c:num) b:num)))))))))))
      #|DIVIDES_LMUL_GCD =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) ((#*:fun(num,fun(num,num)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) d:num) a:num))) b:num))) ((#num_divides:fun(num,fun(num,bool)) d:num) ((#*:fun(num,fun(num,num)) a:num) b:num)))))))))) (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) ((#*:fun(num,fun(num,num)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) d:num))) b:num))) ((#num_divides:fun(num,fun(num,bool)) d:num) ((#*:fun(num,fun(num,num)) a:num) b:num))))))))))
      #|DIVIDES_RMUL_GCD =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) ((#*:fun(num,fun(num,num)) a:num) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) d:num) b:num))))) ((#num_divides:fun(num,fun(num,bool)) d:num) ((#*:fun(num,fun(num,num)) a:num) b:num)))))))))) (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) ((#*:fun(num,fun(num,num)) a:num) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) b:num) d:num))))) ((#num_divides:fun(num,fun(num,bool)) d:num) ((#*:fun(num,fun(num,num)) a:num) b:num))))))))))
      #|GCD_MUL_COPRIME =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. ((#==>:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) ((#*:fun(num,fun(num,num)) b:num) c:num)))) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) c:num))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. ((#==>:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) c:num))) ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) ((#*:fun(num,fun(num,num)) b:num) c:num)))) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. ((#==>:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) b:num) c:num))) ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) ((#*:fun(num,fun(num,num)) b:num) c:num)))) ((#*:fun(num,fun(num,num)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) c:num)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. ((#==>:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) c:num))) ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#*:fun(num,fun(num,num)) a:num) b:num)) c:num))) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) b:num) c:num))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. ((#==>:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) b:num) c:num))) ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#*:fun(num,fun(num,num)) a:num) b:num)) c:num))) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) c:num))))))))))) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. ((#==>:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#*:fun(num,fun(num,num)) a:num) b:num)) c:num))) ((#*:fun(num,fun(num,num)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) c:num))) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) b:num) c:num))))))))))))))))
      #|GCD_SYM =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) b:num) a:num)))))))
      #|GCD_ASSOC =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) b:num) c:num))))) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) c:num)))))))))
      #|GCD_LMUL =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#*:fun(num,fun(num,num)) c:num) a:num)) ((#*:fun(num,fun(num,num)) c:num) b:num)))) ((#*:fun(num,fun(num,num)) c:num) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))))))))))
      #|GCD_RMUL =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#*:fun(num,fun(num,num)) a:num) c:num)) ((#*:fun(num,fun(num,num)) b:num) c:num)))) ((#*:fun(num,fun(num,num)) c:num) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))))))))))
      #|GCD_BEZOUT_SUM =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) a:num) x:num)) ((#*:fun(num,fun(num,num)) b:num) y:num))) d:num)) ((#num_divides:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) d:num))))))))))))
      #|GCD_COPRIME_DIVIDES_LMUL =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) ((#num_divides:fun(num,fun(num,bool)) a:num) c:num))) ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#*:fun(num,fun(num,num)) a:num) b:num)) c:num))) ((#*:fun(num,fun(num,num)) a:num) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) b:num) c:num)))))))))))
      #|GCD_COPRIME_DIVIDES_RMUL =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) b:num) c:num))) ((#num_divides:fun(num,fun(num,bool)) b:num) a:num))) ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) ((#*:fun(num,fun(num,num)) b:num) c:num)))) ((#*:fun(num,fun(num,num)) b:num) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) c:num)))))))))))
      #|GCD_UNIQUE =  |- (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) a:num)) ((#num_divides:fun(num,fun(num,bool)) d:num) b:num))) (#forall:fun(fun(num,bool),bool) (\e:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) e:num) a:num)) ((#num_divides:fun(num,fun(num,bool)) e:num) b:num))) ((#num_divides:fun(num,fun(num,bool)) e:num) d:num)))))) ((#=:fun(num,fun(num,bool)) d:num) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))))))))))
      #|GCD_EQ =  |- ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\d:num. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) x:num)) ((#num_divides:fun(num,fun(num,bool)) d:num) y:num))) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) u:num)) ((#num_divides:fun(num,fun(num,bool)) d:num) v:num)))))) ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) x:num) y:num))) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) u:num) v:num))))
      #|BEZOUT_GCD_STRONG =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) (#?:fun(fun(num,bool),bool) (\x:num. (#?:fun(fun(num,bool),bool) (\y:num. ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) a:num) x:num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) b:num) y:num)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num)))))))))))))
      #|BEZOUT_ADD_STRONG =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) (#?:fun(fun(num,bool),bool) (\d:num. (#?:fun(fun(num,bool),bool) (\x:num. (#?:fun(fun(num,bool),bool) (\y:num. ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) a:num)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) b:num)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) a:num) x:num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) b:num) y:num)) d:num)))))))))))))))
      #|BEZOUT_GCD =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#?:fun(fun(num,bool),bool) (\x:num. (#?:fun(fun(num,bool),bool) (\y:num. ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) a:num) x:num)) ((#*:fun(num,fun(num,num)) b:num) y:num))) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num)))) ((#=:fun(num,fun(num,bool)) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) b:num) x:num)) ((#*:fun(num,fun(num,num)) a:num) y:num))) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))))))))))))
      #|BEZOUT_ADD =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#?:fun(fun(num,bool),bool) (\d:num. (#?:fun(fun(num,bool),bool) (\x:num. (#?:fun(fun(num,bool),bool) (\y:num. ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) a:num)) ((#num_divides:fun(num,fun(num,bool)) d:num) b:num))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) a:num) x:num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) b:num) y:num)) d:num))) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) b:num) x:num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) a:num) y:num)) d:num))))))))))))))
      #|BEZOUT =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#?:fun(fun(num,bool),bool) (\d:num. (#?:fun(fun(num,bool),bool) (\x:num. (#?:fun(fun(num,bool),bool) (\y:num. ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) a:num)) ((#num_divides:fun(num,fun(num,bool)) d:num) b:num))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) a:num) x:num)) ((#*:fun(num,fun(num,num)) b:num) y:num))) d:num)) ((#=:fun(num,fun(num,bool)) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) b:num) x:num)) ((#*:fun(num,fun(num,num)) a:num) y:num))) d:num)))))))))))))
      #|GCD_BEZOUT =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\d:num. ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\x:num. (#?:fun(fun(num,bool),bool) (\y:num. ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) a:num) x:num)) ((#*:fun(num,fun(num,num)) b:num) y:num))) d:num)) ((#=:fun(num,fun(num,bool)) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) b:num) x:num)) ((#*:fun(num,fun(num,num)) a:num) y:num))) d:num))))))) ((#num_divides:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) d:num))))))))
      #|GCD_LE =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) m:num)) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))))))))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) n:num)) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num)))))))))
      #|GCD_LE_MIN_EQ =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) ((#MIN:fun(num,fun(num,num)) m:num) n:num))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|GCD_LE_MIN =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#<=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) ((#MIN:fun(num,fun(num,num)) m:num) n:num)))))))
      #|GCD_LE_MAX =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) ((#MAX:fun(num,fun(num,num)) m:num) n:num))))))
      #|COPRIME =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#=:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) (#forall:fun(fun(num,bool),bool) (\d:num. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) a:num)) ((#num_divides:fun(num,fun(num,bool)) d:num) b:num))) ((#=:fun(num,fun(num,bool)) d:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))
      #|COPRIME_GCD =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#=:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))
      #|GCD_ONE =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))
      #|COPRIME_SYM =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#=:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) b:num) a:num)))))))
      #|COPRIME_BEZOUT =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#=:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) (#?:fun(fun(num,bool),bool) (\x:num. (#?:fun(fun(num,bool),bool) (\y:num. ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) a:num) x:num)) ((#*:fun(num,fun(num,num)) b:num) y:num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) ((#-:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) b:num) x:num)) ((#*:fun(num,fun(num,num)) a:num) y:num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))
      #|COPRIME_DIVPROD =  |- (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) ((#*:fun(num,fun(num,num)) a:num) b:num))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) d:num) a:num)))) ((#num_divides:fun(num,fun(num,bool)) d:num) b:num))))))))
      #|COPRIME_1 =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#forall:fun(fun(num,bool),bool) (\a:num. (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) a:num)))))
      #|GCD_COPRIME =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\a':num. (#forall:fun(fun(num,bool),bool) (\b':num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) a:num) ((#*:fun(num,fun(num,num)) a':num) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))))) ((#=:fun(num,fun(num,bool)) b:num) ((#*:fun(num,fun(num,num)) b':num) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))))))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a':num) b':num)))))))))))
      #|GCD_COPRIME_EXISTS =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#?:fun(fun(num,bool),bool) (\a':num. (#?:fun(fun(num,bool),bool) (\b':num. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) a:num) ((#*:fun(num,fun(num,num)) a':num) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) b:num) ((#*:fun(num,fun(num,num)) b':num) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a':num) b':num))))))))))))
      #|COPRIME_DIVPROD_IFF =  |- (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(num,bool),bool) (\a:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) d:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) ((#*:fun(num,fun(num,num)) a:num) b:num))) ((#num_divides:fun(num,fun(num,bool)) d:num) b:num))))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) d:num) a:num))))))))
      #|CONG_MULT_LCANCEL_IFF =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. ((#==>:fun(bool,fun(bool,bool)) (((#==:fun(num,fun(num,fun(fun(num,fun(num,bool)),bool))) ((#*:fun(num,fun(num,num)) a:num) x:num)) ((#*:fun(num,fun(num,num)) a:num) y:num)) (#num_mod:fun(num,fun(num,fun(num,bool))) n:num))) (((#==:fun(num,fun(num,fun(fun(num,fun(num,bool)),bool))) x:num) y:num) (#num_mod:fun(num,fun(num,fun(num,bool))) n:num)))))))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) n:num))))))))
      #|CONG_MULT_RCANCEL_IFF =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. ((#==>:fun(bool,fun(bool,bool)) (((#==:fun(num,fun(num,fun(fun(num,fun(num,bool)),bool))) ((#*:fun(num,fun(num,num)) x:num) a:num)) ((#*:fun(num,fun(num,num)) y:num) a:num)) (#num_mod:fun(num,fun(num,fun(num,bool))) n:num))) (((#==:fun(num,fun(num,fun(fun(num,fun(num,bool)),bool))) x:num) y:num) (#num_mod:fun(num,fun(num,fun(num,bool))) n:num)))))))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) n:num))))))))
      #|COPRIME_0 =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\d:num. ((#=:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) d:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) d:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#forall:fun(fun(num,bool),bool) (\d:num. ((#=:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) d:num))) ((#=:fun(num,fun(num,bool)) d:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|COPRIME_MUL =  |- (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) d:num) a:num))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) d:num) b:num)))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) d:num) ((#*:fun(num,fun(num,num)) a:num) b:num))))))))))
      #|COPRIME_LMUL2 =  |- (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) d:num) ((#*:fun(num,fun(num,num)) a:num) b:num)))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) d:num) b:num)))))))))
      #|COPRIME_RMUL2 =  |- (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) d:num) ((#*:fun(num,fun(num,num)) a:num) b:num)))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) d:num) a:num)))))))))
      #|COPRIME_LMUL =  |- (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#=:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) ((#*:fun(num,fun(num,num)) a:num) b:num)) d:num))) ((#/\:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) d:num))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) b:num) d:num))))))))))
      #|COPRIME_RMUL =  |- (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#=:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) d:num) ((#*:fun(num,fun(num,num)) a:num) b:num)))) ((#/\:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) d:num) a:num))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) d:num) b:num))))))))))
      #|COPRIME_EXP =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\d:num. ((#==>:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) d:num) a:num))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) d:num) ((#EXP:fun(num,fun(num,num)) a:num) n:num))))))))))
      #|COPRIME_EXP_IMP =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) ((#EXP:fun(num,fun(num,num)) a:num) n:num)) ((#EXP:fun(num,fun(num,num)) b:num) n:num))))))))))
      #|COPRIME_REXP =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#=:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) m:num) ((#EXP:fun(num,fun(num,num)) n:num) k:num)))) ((#\/:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) ((#=:fun(num,fun(num,bool)) k:num) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|COPRIME_LEXP =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#=:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) ((#EXP:fun(num,fun(num,num)) m:num) k:num)) n:num))) ((#\/:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) ((#=:fun(num,fun(num,bool)) k:num) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|COPRIME_EXP2 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#=:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) ((#EXP:fun(num,fun(num,num)) m:num) k:num)) ((#EXP:fun(num,fun(num,num)) n:num) k:num)))) ((#\/:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) ((#=:fun(num,fun(num,bool)) k:num) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|COPRIME_EXP2_SUC =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#=:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) ((#EXP:fun(num,fun(num,num)) a:num) (#SUC:fun(num,num) n:num))) ((#EXP:fun(num,fun(num,num)) b:num) (#SUC:fun(num,num) n:num))))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num)))))))))
      #|COPRIME_NPRODUCT_EQ =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) ((#nproduct:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))))) (#forall:fun(fun('A,bool),bool) (\i:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) i:'A) s:fun('A,bool))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) (f:fun('A,num) i:'A))))))))))))))) (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#=:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) ((#nproduct:fun(fun('A,bool),fun(fun('A,num),num)) s:fun('A,bool)) f:fun('A,num))) b:num))) (#forall:fun(fun('A,bool),bool) (\i:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) i:'A) s:fun('A,bool))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) (f:fun('A,num) i:'A)) b:num))))))))))))))
      #|COPRIME_NPRODUCT =  |- (#forall:fun(fun(fun('?2,bool),bool),bool) (\s:fun('?2,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('?2,bool),bool) s:fun('?2,bool))) (#forall:fun(fun('?2,bool),bool) (\x:'?2. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('?2,fun(fun('?2,bool),bool)) x:'?2) s:fun('?2,bool))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) n:num) (a:fun('?2,num) x:'?2)))))))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) n:num) ((#nproduct:fun(fun('?2,bool),fun(fun('?2,num),num)) s:fun('?2,bool)) a:fun('?2,num)))))))))
      #|COPRIME_DIVISORS =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(num,bool),bool) (\e:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) a:num)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) e:num) b:num)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) d:num) e:num)))))))))))
      #|COPRIME_REFL =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) n:num) n:num))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|COPRIME_PLUS1 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num))))
      #|COPRIME_MINUS1 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)))))
      #|GCD_EXP =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#EXP:fun(num,fun(num,num)) a:num) n:num)) ((#EXP:fun(num,fun(num,num)) b:num) n:num)))) ((#EXP:fun(num,fun(num,num)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) n:num))))))))
      #|DIVIDES_EXP2_REV =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) a:num) n:num)) ((#EXP:fun(num,fun(num,num)) b:num) n:num))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))))) ((#num_divides:fun(num,fun(num,bool)) a:num) b:num))))))))
      #|DIVIDES_EXP2_EQ =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) a:num) n:num)) ((#EXP:fun(num,fun(num,num)) b:num) n:num))) ((#num_divides:fun(num,fun(num,bool)) a:num) b:num)))))))))
      #|DIVIDES_MUL =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\r:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) m:num) r:num)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) n:num) r:num)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))))) ((#num_divides:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) n:num)) r:num))))))))
      #|DIVISION_DECOMP =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. ((#==>:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) a:num) ((#*:fun(num,fun(num,num)) b:num) c:num))) (#?:fun(fun(num,bool),bool) (\b':num. (#?:fun(fun(num,bool),bool) (\c':num. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) a:num) ((#*:fun(num,fun(num,num)) b':num) c':num))) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) b':num) b:num)) ((#num_divides:fun(num,fun(num,bool)) c':num) c:num))))))))))))))
      #|PRIME_0 =  |- (#~:fun(bool,bool) (#prime:fun(num,bool) (#NUMERAL:fun(num,num) #_0:num)))
      #|PRIME_1 =  |- (#~:fun(bool,bool) (#prime:fun(num,bool) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))
      #|PRIME_ALT =  |- (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) p:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) p:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num)) ((#<:fun(num,fun(num,bool)) n:num) p:num))) (#~:fun(bool,bool) ((#num_divides:fun(num,fun(num,bool)) n:num) p:num))))))))))
      #|PRIME_2 =  |- (#prime:fun(num,bool) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))
      #|PRIME_COPRIME_STRONG =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#\/:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) p:num) n:num)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) p:num) n:num))))))))
      #|PRIME_COPRIME =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#\/:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) p:num) n:num)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) p:num) n:num)))))))))
      #|PRIME_COPRIME_EQ =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#=:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) p:num) n:num))) (#~:fun(bool,bool) ((#num_divides:fun(num,fun(num,bool)) p:num) n:num))))))))
      #|COPRIME_PRIME =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) (#~:fun(bool,bool) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) p:num) a:num)) ((#num_divides:fun(num,fun(num,bool)) p:num) b:num)))))))))))
      #|PRIME_DIVPROD =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#num_divides:fun(num,fun(num,bool)) p:num) ((#*:fun(num,fun(num,num)) a:num) b:num)))) ((#\/:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) p:num) a:num)) ((#num_divides:fun(num,fun(num,bool)) p:num) b:num)))))))))
      #|PRIME_DIVPROD_EQ =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) p:num) ((#*:fun(num,fun(num,num)) a:num) b:num))) ((#\/:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) p:num) a:num)) ((#num_divides:fun(num,fun(num,bool)) p:num) b:num))))))))))
      #|PRIME_INT_DIVPROD_EQ =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(int,bool),bool) (\a:int. (#forall:fun(fun(int,bool),bool) (\b:int. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#=:fun(bool,fun(bool,bool)) ((#int_divides:fun(int,fun(int,bool)) (#int_of_num:fun(num,int) p:num)) ((#int_mul:fun(int,fun(int,int)) a:int) b:int))) ((#\/:fun(bool,fun(bool,bool)) ((#int_divides:fun(int,fun(int,bool)) (#int_of_num:fun(num,int) p:num)) a:int)) ((#int_divides:fun(int,fun(int,bool)) (#int_of_num:fun(num,int) p:num)) b:int))))))))))
      #|PRIME_GE_2 =  |- (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) p:num))))
      #|PRIME_FACTOR =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#?:fun(fun(num,bool),bool) (\p:num. ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#num_divides:fun(num,fun(num,bool)) p:num) n:num)))))))
      #|PRIME =  |- (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) p:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) p:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) m:num)) ((#<:fun(num,fun(num,bool)) m:num) p:num))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) p:num) m:num))))))))))
      #|PRIME_PRIME_FACTOR =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) n:num)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#num_divides:fun(num,fun(num,bool)) p:num) n:num))) ((#=:fun(num,fun(num,bool)) p:num) n:num))))))))
      #|PRIME_FACTOR_LT =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) n:num) ((#*:fun(num,fun(num,num)) p:num) m:num))))) ((#<:fun(num,fun(num,bool)) m:num) n:num))))))))
      #|COPRIME_PRIME_EQ =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#=:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) (#forall:fun(fun(num,bool),bool) (\p:num. (#~:fun(bool,bool) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) p:num) a:num)) ((#num_divides:fun(num,fun(num,bool)) p:num) b:num)))))))))))
      #|GCD_PRIME_CASES =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) p:num) n:num))) (((#COND:fun(bool,fun(num,fun(num,num))) ((#num_divides:fun(num,fun(num,bool)) p:num) n:num)) p:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))) (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) n:num) p:num))) (((#COND:fun(bool,fun(num,fun(num,num))) ((#num_divides:fun(num,fun(num,bool)) p:num) n:num)) p:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|GCD_2_CASES =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num))) (((#COND:fun(bool,fun(num,fun(num,num))) (#EVEN:fun(num,bool) n:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (((#COND:fun(bool,fun(num,fun(num,num))) (#EVEN:fun(num,bool) n:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|COPRIME_PRIMEPOW =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\k:num. (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) k:num) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) m:num) ((#EXP:fun(num,fun(num,num)) p:num) k:num)))) (#~:fun(bool,bool) ((#num_divides:fun(num,fun(num,bool)) p:num) m:num))))))))))
      #|COPRIME_BEZOUT_STRONG =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) b:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#?:fun(fun(num,bool),bool) (\x:num. (#?:fun(fun(num,bool),bool) (\y:num. ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) a:num) x:num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) b:num) y:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))
      #|COPRIME_BEZOUT_ALT =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num))))) (#?:fun(fun(num,bool),bool) (\x:num. (#?:fun(fun(num,bool),bool) (\y:num. ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) a:num) x:num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) b:num) y:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))
      #|BEZOUT_PRIME =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) (#~:fun(bool,bool) ((#num_divides:fun(num,fun(num,bool)) p:num) a:num)))) (#?:fun(fun(num,bool),bool) (\x:num. (#?:fun(fun(num,bool),bool) (\y:num. ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) a:num) x:num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) p:num) y:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))
      #|PRIME_DIVEXP =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\x:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#num_divides:fun(num,fun(num,bool)) p:num) ((#EXP:fun(num,fun(num,num)) x:num) n:num)))) ((#num_divides:fun(num,fun(num,bool)) p:num) x:num))))))))
      #|PRIME_DIVEXP_N =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\x:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#num_divides:fun(num,fun(num,bool)) p:num) ((#EXP:fun(num,fun(num,num)) x:num) n:num)))) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) n:num)) ((#EXP:fun(num,fun(num,num)) x:num) n:num)))))))))
      #|PRIME_DIVEXP_EQ =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\x:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) p:num) ((#EXP:fun(num,fun(num,num)) x:num) n:num))) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) p:num) x:num)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))))))))))))
      #|COPRIME_SOS =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. ((#==>:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) x:num) y:num))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) ((#*:fun(num,fun(num,num)) x:num) y:num)) ((#+:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) x:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#EXP:fun(num,fun(num,num)) y:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))
      #|PRIME_IMP_NZ =  |- (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) p:num) (#NUMERAL:fun(num,num) #_0:num))))))
      #|DISTINCT_PRIME_COPRIME =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\q:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) q:num)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) p:num) q:num))))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) p:num) q:num)))))))
      #|PRIME_COPRIME_LT =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) x:num)) ((#<:fun(num,fun(num,bool)) x:num) p:num)))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) x:num) p:num)))))))
      #|DIVIDES_PRIME_PRIME =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\q:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) (#prime:fun(num,bool) q:num))) ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) p:num) q:num)) ((#=:fun(num,fun(num,bool)) p:num) q:num)))))))
      #|COPRIME_PRIME_PRIME =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\q:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) (#prime:fun(num,bool) q:num))) ((#=:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) p:num) q:num))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) p:num) q:num))))))))
      #|DIVIDES_PRIME_EXP_LE =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\q:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) (#prime:fun(num,bool) q:num))) ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) m:num)) ((#EXP:fun(num,fun(num,num)) q:num) n:num))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) p:num) q:num)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)))))))))))))
      #|EQ_PRIME_EXP =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\q:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) (#prime:fun(num,bool) q:num))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) m:num)) ((#EXP:fun(num,fun(num,num)) q:num) n:num))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) p:num) q:num)) ((#=:fun(num,fun(num,bool)) m:num) n:num)))))))))))))
      #|PRIME_ODD =  |- (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) p:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#ODD:fun(num,bool) p:num)))))
      #|ODD_PRIME =  |- (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#=:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) p:num)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) p:num)))))
      #|DIVIDES_FACT_PRIME =  |- (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) p:num) (#FACT:fun(num,num) n:num))) ((#<=:fun(num,fun(num,bool)) p:num) n:num)))))))
      #|EQ_PRIMEPOW =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) m:num)) ((#EXP:fun(num,fun(num,num)) p:num) n:num))) ((#=:fun(num,fun(num,bool)) m:num) n:num)))))))))
      #|COPRIME_2 =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num))) (#ODD:fun(num,bool) n:num))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#ODD:fun(num,bool) n:num)))))
      #|DIVIDES_EXP_PLUS1 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) k:num)) ((#num_divides:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#+:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) n:num) k:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))
      #|DIVIDES_EXP_MINUS1 =  |- (#forall:fun(fun(num,bool),bool) (\k:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#num_divides:fun(num,fun(num,bool)) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#-:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) n:num) k:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))
      #|PRIME_IRREDUCIBLE =  |- (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#/\:fun(bool,fun(bool,bool)) ((#>:fun(num,fun(num,bool)) p:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) p:num) ((#*:fun(num,fun(num,num)) a:num) b:num))) ((#\/:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) p:num) a:num)) ((#num_divides:fun(num,fun(num,bool)) p:num) b:num)))))))))))
      #|COPRIME_EXP_DIVPROD =  |- (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) d:num) n:num)) ((#*:fun(num,fun(num,num)) a:num) b:num))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) d:num) a:num)))) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) d:num) n:num)) b:num))))))))))
      #|PRIME_COPRIME_CASES =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num)))) ((#\/:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) p:num) a:num))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) p:num) b:num))))))))))
      #|PRIME_DIVPROD_POW_GEN =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#num_divides:fun(num,fun(num,bool)) p:num) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))))) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) n:num)) ((#*:fun(num,fun(num,num)) a:num) b:num))))) ((#\/:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) n:num)) a:num)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) n:num)) b:num)))))))))))
      #|PRIME_DIVPROD_POW_GEN_EQ =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) (#~:fun(bool,bool) ((#num_divides:fun(num,fun(num,bool)) p:num) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num)))))) ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) n:num)) ((#*:fun(num,fun(num,num)) a:num) b:num))) ((#\/:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) n:num)) a:num)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) n:num)) b:num))))))))))))
      #|PRIME_DIVPROD_POW =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#/\:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) n:num)) ((#*:fun(num,fun(num,num)) a:num) b:num))))) ((#\/:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) n:num)) a:num)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) n:num)) b:num)))))))))))
      #|PRIME_DIVPROD_POW_EQ =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num)))) ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) n:num)) ((#*:fun(num,fun(num,num)) a:num) b:num))) ((#\/:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) n:num)) a:num)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) n:num)) b:num))))))))))))
      #|PRIME_FACTOR_INDUCT =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\P:fun(num,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(num,bool) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) (P:fun(num,bool) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) (P:fun(num,bool) n:num)))) (P:fun(num,bool) ((#*:fun(num,fun(num,num)) p:num) n:num)))))))))) (#forall:fun(fun(num,bool),bool) (\n:num. (P:fun(num,bool) n:num))))))
      #|COMPLETE_FACTOR_INDUCT =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\P:fun(num,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(num,bool) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) (P:fun(num,bool) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) (P:fun(num,bool) p:num))))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(num,bool) m:num)) (P:fun(num,bool) n:num))) (P:fun(num,bool) ((#*:fun(num,fun(num,num)) m:num) n:num))))))))))) (#forall:fun(fun(num,bool),bool) (\n:num. (P:fun(num,bool) n:num))))))
      #|PRIME_FACTOR_PARTITION =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\Q:fun(num,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) (#?:fun(fun(num,bool),bool) (\n1:num. (#?:fun(fun(num,bool),bool) (\n2:num. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) n1:num) n2:num)) n:num)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#num_divides:fun(num,fun(num,bool)) p:num) n1:num))) (Q:fun(num,bool) p:num))))) (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#num_divides:fun(num,fun(num,bool)) p:num) n2:num))) (#~:fun(bool,bool) (Q:fun(num,bool) p:num))))))))))))))))
      #|COPRIME_PAIR_DECOMP =  |- (#forall:fun(fun(num,bool),bool) (\n1:num. (#forall:fun(fun(num,bool),bool) (\n2:num. (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) n1:num) n2:num))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))))) (#?:fun(fun(num,bool),bool) (\m1:num. (#?:fun(fun(num,bool),bool) (\m2:num. ((#/\:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) m1:num) n1:num))) ((#/\:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) m2:num) n2:num))) ((#/\:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) m1:num) m2:num))) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m1:num) m2:num)) m:num)))))))))))))))
      #|EXP_MULT_EXISTS =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) m:num) k:num)) n:num)) ((#EXP:fun(num,fun(num,num)) p:num) k:num)))) (#?:fun(fun(num,bool),bool) (\q:num. ((#=:fun(num,fun(num,bool)) n:num) ((#EXP:fun(num,fun(num,num)) q:num) k:num)))))))))))))
      #|COPRIME_POW =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) a:num) b:num)) ((#EXP:fun(num,fun(num,num)) c:num) n:num)))) (#?:fun(fun(num,bool),bool) (\r:num. (#?:fun(fun(num,bool),bool) (\s:num. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) a:num) ((#EXP:fun(num,fun(num,num)) r:num) n:num))) ((#=:fun(num,fun(num,bool)) b:num) ((#EXP:fun(num,fun(num,num)) s:num) n:num))))))))))))))))
      #|PRIME_EXP =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) ((#EXP:fun(num,fun(num,num)) p:num) n:num))) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))
      #|PRIME_POWER_MULT =  |- (#forall:fun(fun(num,bool),bool) (\k:num. (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) x:num) y:num)) ((#EXP:fun(num,fun(num,num)) p:num) k:num)))) (#?:fun(fun(num,bool),bool) (\i:num. (#?:fun(fun(num,bool),bool) (\j:num. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) x:num) ((#EXP:fun(num,fun(num,num)) p:num) i:num))) ((#=:fun(num,fun(num,bool)) y:num) ((#EXP:fun(num,fun(num,num)) p:num) j:num))))))))))))))))
      #|PRIME_POWER_EXP =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) x:num) n:num)) ((#EXP:fun(num,fun(num,num)) p:num) k:num))))) (#?:fun(fun(num,bool),bool) (\i:num. ((#=:fun(num,fun(num,bool)) x:num) ((#EXP:fun(num,fun(num,num)) p:num) i:num)))))))))))))
      #|DIVIDES_PRIMEPOW =  |- (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) (#forall:fun(fun(num,bool),bool) (\d:num. ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) ((#EXP:fun(num,fun(num,num)) p:num) k:num))) (#?:fun(fun(num,bool),bool) (\i:num. ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) i:num) k:num)) ((#=:fun(num,fun(num,bool)) d:num) ((#EXP:fun(num,fun(num,num)) p:num) i:num)))))))))))
      #|PRIMEPOW_DIVIDES_PROD =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\k:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) k:num)) ((#*:fun(num,fun(num,num)) m:num) n:num)))) (#?:fun(fun(num,bool),bool) (\i:num. (#?:fun(fun(num,bool),bool) (\j:num. ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) i:num)) m:num)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) j:num)) n:num)) ((#=:fun(num,fun(num,bool)) k:num) ((#+:fun(num,fun(num,num)) i:num) j:num)))))))))))))))))
      #|EUCLID_BOUND =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#?:fun(fun(num,bool),bool) (\p:num. ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) p:num)) ((#<=:fun(num,fun(num,bool)) p:num) (#SUC:fun(num,num) (#FACT:fun(num,num) n:num)))))))))
      #|EUCLID =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#?:fun(fun(num,bool),bool) (\p:num. ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#>:fun(num,fun(num,bool)) p:num) n:num))))))
      #|PRIMES_INFINITE =  |- (#INFINITE:fun(fun(num,bool),bool) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%3:num. (#?:fun(fun(num,bool),bool) (\p:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%3:num) (#prime:fun(num,bool) p:num)) p:num))))))
      #|FACTORIZATION_INDEX =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) p:num))) (#?:fun(fun(num,bool),bool) (\k:num. ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) k:num)) n:num)) (#forall:fun(fun(num,bool),bool) (\l:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) k:num) l:num)) (#~:fun(bool,bool) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) l:num)) n:num)))))))))))))
      #|PRIMEPOW_FACTOR =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)) (#?:fun(fun(num,bool),bool) (\p:num. (#?:fun(fun(num,bool),bool) (\k:num. (#?:fun(fun(num,bool),bool) (\m:num. ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) k:num)) ((#/\:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) p:num) m:num))) ((#=:fun(num,fun(num,bool)) n:num) ((#*:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) p:num) k:num)) m:num))))))))))))))
      #|PRIMEPOW_DIVISORS_DIVIDES =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) m:num) n:num)) (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) k:num)) m:num))) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) k:num)) n:num)))))))))))
      #|PRIMEPOW_DIVISORS_EQ =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) n:num)) (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) k:num)) m:num)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) k:num)) n:num))))))))))))
      #|CHINESE_REMAINDER =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\u:num. (#forall:fun(fun(num,bool),bool) (\v:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) a:num) (#NUMERAL:fun(num,num) #_0:num)))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) b:num) (#NUMERAL:fun(num,num) #_0:num)))))) (#?:fun(fun(num,bool),bool) (\x:num. (#?:fun(fun(num,bool),bool) (\q1:num. (#?:fun(fun(num,bool),bool) (\q2:num. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) x:num) ((#+:fun(num,fun(num,num)) u:num) ((#*:fun(num,fun(num,num)) q1:num) a:num)))) ((#=:fun(num,fun(num,bool)) x:num) ((#+:fun(num,fun(num,num)) v:num) ((#*:fun(num,fun(num,num)) q2:num) b:num)))))))))))))))))))
      #|FINITE_EXP_LE =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\P:fun(num,bool). (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) p:num)) (#FINITE:fun(fun(num,bool),bool) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%4:num. (#?:fun(fun(num,bool),bool) (\j:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%4:num) ((#/\:fun(bool,fun(bool,bool)) (P:fun(num,bool) j:num)) ((#<=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) j:num)) n:num))) j:num)))))))))))))
      #|FINITE_INDICES =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\P:fun(num,bool). (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) p:num)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))))) (#FINITE:fun(fun(num,bool),bool) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%5:num. (#?:fun(fun(num,bool),bool) (\j:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%5:num) ((#/\:fun(bool,fun(bool,bool)) (P:fun(num,bool) j:num)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) j:num)) n:num))) j:num)))))))))))))
      #|index_def =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) n:num)) (((#COND:fun(bool,fun(num,fun(num,num))) ((#\/:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) p:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) #_0:num)) (#CARD:fun(fun(num,bool),num) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%6:num. (#?:fun(fun(num,bool),bool) (\j:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%6:num) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) j:num)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) j:num)) n:num))) j:num))))))))))))
      #|INDEX_0 =  |- (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) (#NUMERAL:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) #_0:num))))
      #|PRIMEPOW_DIVIDES_INDEX =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) k:num)) n:num)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) p:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#<=:fun(num,fun(num,bool)) k:num) ((#index:fun(num,fun(num,num)) p:num) n:num)))))))))))
      #|LE_INDEX =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#=:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) k:num) ((#index:fun(num,fun(num,num)) p:num) n:num))) ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) p:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#=:fun(num,fun(num,bool)) k:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) k:num)) n:num)))))))))
      #|EXP_INDEX_DIVIDES =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) ((#index:fun(num,fun(num,num)) p:num) n:num))) n:num)))))
      #|INDEX_LT =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) k:num) (#NUMERAL:fun(num,num) #_0:num))))) ((#<:fun(num,fun(num,bool)) n:num) ((#EXP:fun(num,fun(num,num)) p:num) k:num)))) ((#<:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) n:num)) k:num))))))))
      #|INDEX_1 =  |- (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) #_0:num))))
      #|INDEX_MUL =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num)))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))))) ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) ((#*:fun(num,fun(num,num)) m:num) n:num))) ((#+:fun(num,fun(num,num)) ((#index:fun(num,fun(num,num)) p:num) m:num)) ((#index:fun(num,fun(num,num)) p:num) n:num))))))))
      #|INDEX_EXP =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) ((#EXP:fun(num,fun(num,num)) n:num) k:num))) ((#*:fun(num,fun(num,num)) k:num) ((#index:fun(num,fun(num,num)) p:num) n:num))))))))))
      #|INDEX_FACT =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) (#FACT:fun(num,num) n:num))) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num)) (\m:num. ((#index:fun(num,fun(num,num)) p:num) m:num)))))))))
      #|INDEX_FACT_ALT =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) (#FACT:fun(num,num) n:num))) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%7:num. (#?:fun(fun(num,bool),bool) (\j:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%7:num) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) j:num)) ((#<=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) j:num)) n:num))) j:num)))))) (\j:num. ((#DIV:fun(num,fun(num,num)) n:num) ((#EXP:fun(num,fun(num,num)) p:num) j:num))))))))))
      #|INDEX_FACT_UNBOUNDED =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) (#FACT:fun(num,num) n:num))) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%8:num. (#?:fun(fun(num,bool),bool) (\j:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%8:num) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) j:num)) j:num)))))) (\j:num. ((#DIV:fun(num,fun(num,num)) n:num) ((#EXP:fun(num,fun(num,num)) p:num) j:num))))))))))
      #|PRIMEPOW_DIVIDES_FACT =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) k:num)) (#FACT:fun(num,num) n:num))) ((#<=:fun(num,fun(num,bool)) k:num) ((#nsum:fun(fun(num,bool),fun(fun(num,num),num)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%9:num. (#?:fun(fun(num,bool),bool) (\j:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%9:num) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) j:num)) ((#<=:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) j:num)) n:num))) j:num)))))) (\j:num. ((#DIV:fun(num,fun(num,num)) n:num) ((#EXP:fun(num,fun(num,num)) p:num) j:num)))))))))))))
      #|INDEX_REFL =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) n:num) n:num)) (((#COND:fun(bool,fun(num,fun(num,num))) ((#<=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) #_0:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|INDEX_EQ_0 =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) n:num)) (#NUMERAL:fun(num,num) #_0:num))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) p:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#~:fun(bool,bool) ((#num_divides:fun(num,fun(num,bool)) p:num) n:num)))))))))
      #|INDEX_ZERO =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#num_divides:fun(num,fun(num,bool)) p:num) n:num))) ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) n:num)) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|INDEX_POW =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) p:num) k:num)) n:num)) ((#DIV:fun(num,fun(num,num)) ((#index:fun(num,fun(num,num)) p:num) n:num)) k:num))))))))
      #|INDEX_PRIME =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\a:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) a:num) p:num)) (((#COND:fun(bool,fun(num,fun(num,num))) ((#=:fun(num,fun(num,bool)) p:num) a:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|INDEX_TRIVIAL_BOUND =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#<=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) n:num)) n:num)))))
      #|INDEX_DECOMPOSITION =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#?:fun(fun(num,bool),bool) (\m:num. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) p:num) ((#index:fun(num,fun(num,num)) p:num) n:num))) m:num)) n:num)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) p:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#~:fun(bool,bool) ((#num_divides:fun(num,fun(num,bool)) p:num) m:num)))))))))))
      #|INDEX_DECOMPOSITION_PRIME =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) (#?:fun(fun(num,bool),bool) (\m:num. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) p:num) ((#index:fun(num,fun(num,num)) p:num) n:num))) m:num)) n:num)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) p:num) m:num)))))))))))
      #|INDEX_DECOMPOSITION_LE =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\e1:num. (#forall:fun(fun(num,bool),bool) (\m1:num. (#forall:fun(fun(num,bool),bool) (\e2:num. (#forall:fun(fun(num,bool),bool) (\m2:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) p:num) e1:num)) m1:num)) ((#*:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) p:num) e2:num)) m2:num))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) p:num) (#NUMERAL:fun(num,num) #_0:num)))) (#~:fun(bool,bool) ((#num_divides:fun(num,fun(num,bool)) p:num) m2:num))))) ((#<=:fun(num,fun(num,bool)) e1:num) e2:num))))))))))))
      #|INDEX_DECOMPOSITION_UNIQUE =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\e1:num. (#forall:fun(fun(num,bool),bool) (\m1:num. (#forall:fun(fun(num,bool),bool) (\e2:num. (#forall:fun(fun(num,bool),bool) (\m2:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) p:num) e1:num)) m1:num)) ((#*:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) p:num) e2:num)) m2:num))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) p:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#num_divides:fun(num,fun(num,bool)) p:num) m1:num))) (#~:fun(bool,bool) ((#num_divides:fun(num,fun(num,bool)) p:num) m2:num)))))) ((#=:fun(num,fun(num,bool)) e1:num) e2:num))))))))))))
      #|INDEX_UNIQUE =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\e:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) p:num) e:num)) m:num)) n:num)) ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) p:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) e:num) (#NUMERAL:fun(num,num) #_0:num)))) (#~:fun(bool,bool) ((#num_divides:fun(num,fun(num,bool)) p:num) m:num))))) ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) n:num)) e:num))))))))))
      #|INDEX_UNIQUE_EQ =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) n:num)) k:num)) (((#COND:fun(bool,fun(bool,fun(bool,bool))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) p:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) k:num) (#NUMERAL:fun(num,num) #_0:num))) (#forall:fun(fun(num,bool),bool) (\j:num. ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) j:num)) n:num)) ((#<=:fun(num,fun(num,bool)) j:num) k:num))))))))))))
      #|INDEX_UNIQUE_ALT =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) n:num)) k:num)) (((#COND:fun(bool,fun(bool,fun(bool,bool))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) p:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) k:num) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) k:num)) n:num)) (#~:fun(bool,bool) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) n:num)))))))))))
      #|INDEX_ADD_MIN =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) ((#MIN:fun(num,fun(num,num)) ((#index:fun(num,fun(num,num)) p:num) m:num)) ((#index:fun(num,fun(num,num)) p:num) n:num))) ((#index:fun(num,fun(num,num)) p:num) ((#+:fun(num,fun(num,num)) m:num) n:num)))))))))
      #|INDEX_SUB_MIN =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) m:num)) ((#<=:fun(num,fun(num,bool)) ((#MIN:fun(num,fun(num,num)) ((#index:fun(num,fun(num,num)) p:num) m:num)) ((#index:fun(num,fun(num,num)) p:num) n:num))) ((#index:fun(num,fun(num,num)) p:num) ((#-:fun(num,fun(num,num)) m:num) n:num))))))))))
      #|INDEX_ADD =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#<:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) n:num)) ((#index:fun(num,fun(num,num)) p:num) m:num))))) ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) ((#+:fun(num,fun(num,num)) m:num) n:num))) ((#index:fun(num,fun(num,num)) p:num) n:num)))))))))
      #|INDEX_MULT_BASE =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) ((#*:fun(num,fun(num,num)) p:num) n:num))) (((#COND:fun(bool,fun(num,fun(num,num))) ((#\/:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) p:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) #_0:num)) ((#+:fun(num,fun(num,num)) ((#index:fun(num,fun(num,num)) p:num) n:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))) (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) ((#*:fun(num,fun(num,num)) n:num) p:num))) (((#COND:fun(bool,fun(num,fun(num,num))) ((#\/:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) p:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) #_0:num)) ((#+:fun(num,fun(num,num)) ((#index:fun(num,fun(num,num)) p:num) n:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|INDEX_MULT_EXP =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) ((#*:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) p:num) k:num)) n:num))) (((#COND:fun(bool,fun(num,fun(num,num))) ((#\/:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) p:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) #_0:num)) ((#+:fun(num,fun(num,num)) k:num) ((#index:fun(num,fun(num,num)) p:num) n:num))))))))))) (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) ((#*:fun(num,fun(num,num)) n:num) ((#EXP:fun(num,fun(num,num)) p:num) k:num)))) (((#COND:fun(bool,fun(num,fun(num,num))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) ((#<=:fun(num,fun(num,bool)) p:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#NUMERAL:fun(num,num) #_0:num)) ((#+:fun(num,fun(num,num)) ((#index:fun(num,fun(num,num)) p:num) n:num)) k:num))))))))))
      #|INDEX_MULT_ADD =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#<:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) n:num)) k:num))) ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) p:num) k:num)) m:num)) n:num))) ((#index:fun(num,fun(num,num)) p:num) n:num)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#<:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) n:num)) k:num))) ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) ((#EXP:fun(num,fun(num,num)) p:num) k:num))) n:num))) ((#index:fun(num,fun(num,num)) p:num) n:num)))))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#<:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) n:num)) k:num))) ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) ((#+:fun(num,fun(num,num)) n:num) ((#*:fun(num,fun(num,num)) m:num) ((#EXP:fun(num,fun(num,num)) p:num) k:num))))) ((#index:fun(num,fun(num,num)) p:num) n:num)))))))))))) (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#<:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) n:num)) k:num))) ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) ((#+:fun(num,fun(num,num)) n:num) ((#*:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) p:num) k:num)) m:num)))) ((#index:fun(num,fun(num,num)) p:num) n:num))))))))))))))
      #|INDEX_NSUM_LE =  |- (#forall:fun(fun(fun('A,num),bool),bool) (\f:fun('A,num). (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun('A,bool),bool),bool) (\k:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) k:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) k:fun('A,bool)) #EMPTY:fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) k:fun('A,bool))) ((#<=:fun(num,fun(num,bool)) n:num) ((#index:fun(num,fun(num,num)) p:num) (f:fun('A,num) a:'A))))))))) ((#<=:fun(num,fun(num,bool)) n:num) ((#index:fun(num,fun(num,num)) p:num) ((#nsum:fun(fun('A,bool),fun(fun('A,num),num)) k:fun('A,bool)) f:fun('A,num)))))))))))))
      #|DIVIDES_INDEX =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) m:num) n:num)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num)))) (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#<=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) m:num)) ((#index:fun(num,fun(num,num)) p:num) n:num))))))))))))
      #|EQ_INDEX =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) n:num)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) m:num)) ((#index:fun(num,fun(num,num)) p:num) n:num)))))))))))
      #|COPRIME_INDEX =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) m:num)) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) n:num)) (#NUMERAL:fun(num,num) #_0:num)))))))))))))
      #|INDEX_GCD =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)))) (((#COND:fun(bool,fun(num,fun(num,num))) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#index:fun(num,fun(num,num)) p:num) n:num)) (((#COND:fun(bool,fun(num,fun(num,num))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) ((#index:fun(num,fun(num,num)) p:num) m:num)) ((#MIN:fun(num,fun(num,num)) ((#index:fun(num,fun(num,num)) p:num) m:num)) ((#index:fun(num,fun(num,num)) p:num) n:num))))))))))))
      #|FORALL_PRIME_INDEX =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) (#forall:fun(fun(fun(num,bool),bool),bool) (\P:fun(num,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. (P:fun(num,bool) ((#index:fun(num,fun(num,num)) p:num) x:num))))) (#forall:fun(fun(num,bool),bool) (\k:num. (P:fun(num,bool) k:num)))))))))) (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) (#forall:fun(fun(fun(num,bool),bool),bool) (\P:fun(num,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\x:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) x:num) (#NUMERAL:fun(num,num) #_0:num)))) (P:fun(num,bool) ((#index:fun(num,fun(num,num)) p:num) x:num)))))) (#forall:fun(fun(num,bool),bool) (\k:num. (P:fun(num,bool) k:num))))))))))
      #|INDEX_FACT_PRIME_MULT =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) (#FACT:fun(num,num) ((#*:fun(num,fun(num,num)) p:num) n:num)))) ((#+:fun(num,fun(num,num)) n:num) ((#index:fun(num,fun(num,num)) p:num) (#FACT:fun(num,num) n:num)))))))))
      #|PRIME_FACTORIZATION_INDEX =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\k:fun(num,num). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(num,bool),bool) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%10:num. (#?:fun(fun(num,bool),bool) (\p:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%10:num) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) (k:fun(num,num) p:num)) (#NUMERAL:fun(num,num) #_0:num))))) p:num))))))) (#?:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) n:num)) (k:fun(num,num) p:num)))))))))))
      #|PRIME_POWER_EXISTS =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\q:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) q:num)) ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\i:num. ((#=:fun(num,fun(num,bool)) n:num) ((#EXP:fun(num,fun(num,num)) q:num) i:num))))) (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#num_divides:fun(num,fun(num,bool)) p:num) n:num))) ((#=:fun(num,fun(num,bool)) p:num) q:num))))))))))
      #|PRIME_POWER_EXISTS_ALT =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\i:num. ((#=:fun(num,fun(num,bool)) n:num) ((#EXP:fun(num,fun(num,num)) p:num) i:num))))) (#forall:fun(fun(num,bool),bool) (\d:num. ((#==>:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) n:num)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) d:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#num_divides:fun(num,fun(num,bool)) p:num) d:num)))))))))))
      #|PRIME_FACTORIZATION_ALT =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) ((#nproduct:fun(fun(num,bool),fun(fun(num,num),num)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%11:num. (#?:fun(fun(num,bool),bool) (\p:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%11:num) (#prime:fun(num,bool) p:num)) p:num)))))) (\p:num. ((#EXP:fun(num,fun(num,num)) p:num) ((#index:fun(num,fun(num,num)) p:num) n:num))))) n:num))))
      #|PRIME_FACTORIZATION =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) ((#nproduct:fun(fun(num,bool),fun(fun(num,num),num)) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%12:num. (#?:fun(fun(num,bool),bool) (\p:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%12:num) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#num_divides:fun(num,fun(num,bool)) p:num) n:num))) p:num)))))) (\p:num. ((#EXP:fun(num,fun(num,num)) p:num) ((#index:fun(num,fun(num,num)) p:num) n:num))))) n:num))))
      #|lcm =  |- ((#=:fun(num,fun(num,bool)) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) (((#COND:fun(bool,fun(num,fun(num,num))) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) n:num)) (#NUMERAL:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) #_0:num)) ((#DIV:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) n:num)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)))))
      #|LCM_DIVIDES =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\d:num. ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) d:num)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) m:num) d:num)) ((#num_divides:fun(num,fun(num,bool)) n:num) d:num)))))))))
      #|LCM =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) m:num) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) n:num) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)))) (#forall:fun(fun(num,bool),bool) (\d:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) m:num) d:num)) ((#num_divides:fun(num,fun(num,bool)) n:num) d:num))) ((#num_divides:fun(num,fun(num,bool)) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) d:num))))))))))
      #|LCM_DIVIDES_MUL =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#num_divides:fun(num,fun(num,bool)) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) ((#*:fun(num,fun(num,num)) m:num) n:num))))))
      #|DIVIDES_LCM =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\r:num. ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) r:num) m:num)) ((#num_divides:fun(num,fun(num,bool)) r:num) n:num))) ((#num_divides:fun(num,fun(num,bool)) r:num) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))))))))))
      #|LCM_0 =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num))) (#NUMERAL:fun(num,num) #_0:num))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) n:num) (#NUMERAL:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) #_0:num)))))
      #|LCM_1 =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num))) n:num)))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) n:num))))
      #|LCM_SYM =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) n:num) m:num)))))))
      #|DIVIDES_LCM_GCD =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\d:num. ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)))) ((#num_divides:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) d:num) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)))) ((#*:fun(num,fun(num,num)) m:num) n:num)))))))))
      #|PRIMEPOW_DIVIDES_LCM =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) k:num)) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)))) ((#\/:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) k:num)) m:num)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) k:num)) n:num))))))))))))
      #|PRIME_DIVIDES_LCM =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) p:num) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)))) ((#\/:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) p:num) m:num)) ((#num_divides:fun(num,fun(num,bool)) p:num) n:num))))))))))
      #|LCM_ZERO =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) (#NUMERAL:fun(num,num) #_0:num))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|INDEX_LCM =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#=:fun(num,fun(num,bool)) ((#index:fun(num,fun(num,num)) p:num) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)))) (((#COND:fun(bool,fun(num,fun(num,num))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) #_0:num)) ((#MAX:fun(num,fun(num,num)) ((#index:fun(num,fun(num,num)) p:num) m:num)) ((#index:fun(num,fun(num,num)) p:num) n:num)))))))))))
      #|LCM_ASSOC =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(num,fun(num,bool)) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) n:num) p:num))))) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) p:num)))))))))
      #|LCM_REFL =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) n:num) n:num))) n:num)))
      #|LCM_MULTIPLE =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#=:fun(num,fun(num,bool)) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) b:num) ((#*:fun(num,fun(num,num)) a:num) b:num)))) ((#*:fun(num,fun(num,num)) a:num) b:num))))))
      #|LCM_GCD_DISTRIB =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. ((#=:fun(num,fun(num,bool)) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) b:num) c:num))))) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) c:num)))))))))))
      #|GCD_LCM_DISTRIB =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. ((#=:fun(num,fun(num,bool)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) b:num) c:num))))) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) c:num)))))))))))
      #|LCM_UNIQUE =  |- (#forall:fun(fun(num,bool),bool) (\d:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) m:num) d:num)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) n:num) d:num)) (#forall:fun(fun(num,bool),bool) (\e:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) m:num) e:num)) ((#num_divides:fun(num,fun(num,bool)) n:num) e:num))) ((#num_divides:fun(num,fun(num,bool)) d:num) e:num))))))) ((#=:fun(num,fun(num,bool)) d:num) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))))))))))
      #|LCM_EQ =  |- (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. (#forall:fun(fun(num,bool),bool) (\u:num. (#forall:fun(fun(num,bool),bool) (\v:num. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\d:num. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) x:num) d:num)) ((#num_divides:fun(num,fun(num,bool)) y:num) d:num))) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) u:num) d:num)) ((#num_divides:fun(num,fun(num,bool)) v:num) d:num)))))) ((#=:fun(num,fun(num,bool)) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) x:num) y:num))) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) u:num) v:num))))))))))))
      #|LCM_EQ_1 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))
      #|DIVIDES_LCM_LEFT =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) n:num) m:num)) ((#=:fun(num,fun(num,bool)) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) m:num))))))
      #|DIVIDES_LCM_RIGHT =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) m:num) n:num)) ((#=:fun(num,fun(num,bool)) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) n:num))))))
      #|MULT_LCM_GCD =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)))) ((#*:fun(num,fun(num,num)) m:num) n:num))))))
      #|MULT_GCD_LCM =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)))) ((#*:fun(num,fun(num,num)) m:num) n:num))))))
      #|LCM_LMUL =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. ((#=:fun(num,fun(num,bool)) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#*:fun(num,fun(num,num)) c:num) a:num)) ((#*:fun(num,fun(num,num)) c:num) b:num)))) ((#*:fun(num,fun(num,num)) c:num) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))))))))))
      #|LCM_RMUL =  |- (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. (#forall:fun(fun(num,bool),bool) (\c:num. ((#=:fun(num,fun(num,bool)) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#*:fun(num,fun(num,num)) a:num) c:num)) ((#*:fun(num,fun(num,num)) b:num) c:num)))) ((#*:fun(num,fun(num,num)) c:num) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))))))))))
      #|LCM_EXP =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#=:fun(num,fun(num,bool)) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#EXP:fun(num,fun(num,num)) a:num) n:num)) ((#EXP:fun(num,fun(num,num)) b:num) n:num)))) ((#EXP:fun(num,fun(num,num)) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) n:num))))))))
      #|LCM_COPRIME_DECOMP =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#?:fun(fun(num,bool),bool) (\m':num. (#?:fun(fun(num,bool),bool) (\n':num. ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) m':num) m:num)) ((#/\:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) n':num) n:num)) ((#/\:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) m':num) n':num))) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m':num) n':num)) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))))))))))))))
      #|LE_LCM =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))))))))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) n:num) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))))))))
      #|LCM_LE_MULT =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) ((#*:fun(num,fun(num,num)) m:num) n:num))))))
      #|LCM_EQ_MULT =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) ((#*:fun(num,fun(num,num)) m:num) n:num))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)))))))))
      #|MAX_LE_LCM_EQ =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) ((#MAX:fun(num,fun(num,num)) m:num) n:num)) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|MAX_LE_LCM =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#<=:fun(num,fun(num,bool)) ((#MAX:fun(num,fun(num,num)) m:num) n:num)) (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))))))))
      #|NEUTRAL_GCD =  |- ((#=:fun(num,fun(num,bool)) (#neutral:fun(fun(num,fun(num,num)),num) (\m:num. (\n:num. (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)))))) (#NUMERAL:fun(num,num) #_0:num))
      #|MONOIDAL_GCD =  |- (#monoidal:fun(fun(num,fun(num,num)),bool) (\m:num. (\n:num. (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)))))
      #|NEUTRAL_LCM =  |- ((#=:fun(num,fun(num,bool)) (#neutral:fun(fun(num,fun(num,num)),num) (\m:num. (\n:num. (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)))))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))
      #|MONOIDAL_LCM =  |- (#monoidal:fun(fun(num,fun(num,num)),bool) (\m:num. (\n:num. (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)))))
      #|ITERATE_GCD_DIVIDES =  |- (#forall:fun(fun(fun('K,num),bool),bool) (\f:fun('K,num). (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('K,bool),bool) k:fun('K,bool))) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool)))) ((#num_divides:fun(num,fun(num,bool)) (((#iterate:fun(fun(num,fun(num,num)),fun(fun('K,bool),fun(fun('K,num),num))) (\m:num. (\n:num. (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))))) k:fun('K,bool)) f:fun('K,num))) (f:fun('K,num) i:'K)))))))))
      #|ITERATE_GCD_DIVIDES_EQ =  |- (#forall:fun(fun(fun('K,num),bool),bool) (\f:fun('K,num). (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) (((#iterate:fun(fun(num,fun(num,num)),fun(fun('K,bool),fun(fun('K,num),num))) (\m:num. (\n:num. (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))))) k:fun('K,bool)) f:fun('K,num))) (f:fun('K,num) i:'K))) ((#\/:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('K,bool),bool) (#GSPEC:fun(fun('K,bool),fun('K,bool)) (\GEN%PVAR%13:'K. (#?:fun(fun('K,bool),bool) (\j:'K. (((#SETSPEC:fun('K,fun(bool,fun('K,bool))) GEN%PVAR%13:'K) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) j:'K) k:fun('K,bool))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) (f:fun('K,num) j:'K)) (#NUMERAL:fun(num,num) #_0:num))))) j:'K))))))) ((#=:fun(num,fun(num,bool)) (f:fun('K,num) i:'K)) (#NUMERAL:fun(num,num) #_0:num)))))))))))
      #|DIVIDES_ITERATE_GCD =  |- (#forall:fun(fun(fun('K,num),bool),bool) (\f:fun('K,num). (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(num,bool),bool) (\d:num. ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('K,bool),bool) k:fun('K,bool))) ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) (((#iterate:fun(fun(num,fun(num,num)),fun(fun('K,bool),fun(fun('K,num),num))) (\m:num. (\n:num. (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))))) k:fun('K,bool)) f:fun('K,num)))) (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#num_divides:fun(num,fun(num,bool)) d:num) (f:fun('K,num) i:'K)))))))))))))
      #|DIVIDES_ITERATE_GCD_GEN =  |- (#forall:fun(fun(fun('K,num),bool),bool) (\f:fun('K,num). (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(num,bool),bool) (\d:num. ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) d:num) (((#iterate:fun(fun(num,fun(num,num)),fun(fun('K,bool),fun(fun('K,num),num))) (\m:num. (\n:num. (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))))) k:fun('K,bool)) f:fun('K,num)))) ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('K,bool),bool) (#GSPEC:fun(fun('K,bool),fun('K,bool)) (\GEN%PVAR%14:'K. (#?:fun(fun('K,bool),bool) (\j:'K. (((#SETSPEC:fun('K,fun(bool,fun('K,bool))) GEN%PVAR%14:'K) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) j:'K) k:fun('K,bool))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) (f:fun('K,num) j:'K)) (#NUMERAL:fun(num,num) #_0:num))))) j:'K))))))) (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#num_divides:fun(num,fun(num,bool)) d:num) (f:fun('K,num) i:'K)))))))))))))
      #|DIVIDES_ITERATE_LCM =  |- (#forall:fun(fun(fun('K,num),bool),bool) (\f:fun('K,num). (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('K,bool),bool) k:fun('K,bool))) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool)))) ((#num_divides:fun(num,fun(num,bool)) (f:fun('K,num) i:'K)) (((#iterate:fun(fun(num,fun(num,num)),fun(fun('K,bool),fun(fun('K,num),num))) (\m:num. (\n:num. (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))))) k:fun('K,bool)) f:fun('K,num))))))))))
      #|DIVIDES_ITERATE_LCM_GEN =  |- (#forall:fun(fun(fun('K,num),bool),bool) (\f:fun('K,num). (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) (f:fun('K,num) i:'K)) (((#iterate:fun(fun(num,fun(num,num)),fun(fun('K,bool),fun(fun('K,num),num))) (\m:num. (\n:num. (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))))) k:fun('K,bool)) f:fun('K,num)))) ((#\/:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('K,bool),bool) (#GSPEC:fun(fun('K,bool),fun('K,bool)) (\GEN%PVAR%15:'K. (#?:fun(fun('K,bool),bool) (\j:'K. (((#SETSPEC:fun('K,fun(bool,fun('K,bool))) GEN%PVAR%15:'K) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) j:'K) k:fun('K,bool))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) (f:fun('K,num) j:'K)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) j:'K))))))) ((#=:fun(num,fun(num,bool)) (f:fun('K,num) i:'K)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))
      #|ITERATE_LCM_DIVIDES =  |- (#forall:fun(fun(fun('K,num),bool),bool) (\f:fun('K,num). (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('K,bool),bool) k:fun('K,bool))) ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) (((#iterate:fun(fun(num,fun(num,num)),fun(fun('K,bool),fun(fun('K,num),num))) (\m:num. (\n:num. (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))))) k:fun('K,bool)) f:fun('K,num))) n:num)) (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#num_divides:fun(num,fun(num,bool)) (f:fun('K,num) i:'K)) n:num))))))))))))
      #|ITERATE_LCM_DIVIDES_GEN =  |- (#forall:fun(fun(fun('K,num),bool),bool) (\f:fun('K,num). (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) (((#iterate:fun(fun(num,fun(num,num)),fun(fun('K,bool),fun(fun('K,num),num))) (\m:num. (\n:num. (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))))) k:fun('K,bool)) f:fun('K,num))) n:num)) ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('K,bool),bool) (#GSPEC:fun(fun('K,bool),fun('K,bool)) (\GEN%PVAR%16:'K. (#?:fun(fun('K,bool),bool) (\j:'K. (((#SETSPEC:fun('K,fun(bool,fun('K,bool))) GEN%PVAR%16:'K) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) j:'K) k:fun('K,bool))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) (f:fun('K,num) j:'K)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) j:'K))))))) (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#num_divides:fun(num,fun(num,bool)) (f:fun('K,num) i:'K)) n:num))))))))))))
      #|PRIMEPOW_DIVIDES_ITERATE_LCM =  |- (#forall:fun(fun(fun('K,num),bool),bool) (\f:fun('K,num). (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('K,bool),bool) k:fun('K,bool))) (#prime:fun(num,bool) p:num))) ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) m:num)) (((#iterate:fun(fun(num,fun(num,num)),fun(fun('K,bool),fun(fun('K,num),num))) (\m:num. (\n:num. (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))))) k:fun('K,bool)) f:fun('K,num)))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) (#?:fun(fun('K,bool),bool) (\i:'K. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) m:num)) (f:fun('K,num) i:'K))))))))))))))))
      #|PRIMEPOW_DIVIDES_ITERATE_LCM_GEN =  |- (#forall:fun(fun(fun('K,num),bool),bool) (\f:fun('K,num). (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) m:num)) (((#iterate:fun(fun(num,fun(num,num)),fun(fun('K,bool),fun(fun('K,num),num))) (\m:num. (\n:num. (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))))) k:fun('K,bool)) f:fun('K,num)))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('K,bool),bool) (#GSPEC:fun(fun('K,bool),fun('K,bool)) (\GEN%PVAR%17:'K. (#?:fun(fun('K,bool),bool) (\j:'K. (((#SETSPEC:fun('K,fun(bool,fun('K,bool))) GEN%PVAR%17:'K) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) j:'K) k:fun('K,bool))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) (f:fun('K,num) j:'K)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) j:'K))))))) (#?:fun(fun('K,bool),bool) (\i:'K. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#num_divides:fun(num,fun(num,bool)) ((#EXP:fun(num,fun(num,num)) p:num) m:num)) (f:fun('K,num) i:'K)))))))))))))))))
      #|PRIME_DIVIDES_ITERATE_LCM_GEN =  |- (#forall:fun(fun(fun('K,num),bool),bool) (\f:fun('K,num). (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) p:num) (((#iterate:fun(fun(num,fun(num,num)),fun(fun('K,bool),fun(fun('K,num),num))) (\m:num. (\n:num. (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))))) k:fun('K,bool)) f:fun('K,num)))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('K,bool),bool) (#GSPEC:fun(fun('K,bool),fun('K,bool)) (\GEN%PVAR%18:'K. (#?:fun(fun('K,bool),bool) (\j:'K. (((#SETSPEC:fun('K,fun(bool,fun('K,bool))) GEN%PVAR%18:'K) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) j:'K) k:fun('K,bool))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) (f:fun('K,num) j:'K)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) j:'K))))))) (#?:fun(fun('K,bool),bool) (\i:'K. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#num_divides:fun(num,fun(num,bool)) p:num) (f:fun('K,num) i:'K))))))))))))))
      #|PRIME_DIVIDES_ITERATE_LCM =  |- (#forall:fun(fun(fun('K,num),bool),bool) (\f:fun('K,num). (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(num,bool),bool) (\p:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('K,bool),bool) k:fun('K,bool))) (#prime:fun(num,bool) p:num))) ((#=:fun(bool,fun(bool,bool)) ((#num_divides:fun(num,fun(num,bool)) p:num) (((#iterate:fun(fun(num,fun(num,num)),fun(fun('K,bool),fun(fun('K,num),num))) (\m:num. (\n:num. (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))))) k:fun('K,bool)) f:fun('K,num)))) (#?:fun(fun('K,bool),bool) (\i:'K. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) k:fun('K,bool))) ((#num_divides:fun(num,fun(num,bool)) p:num) (f:fun('K,num) i:'K)))))))))))))
      #|ITERATE_LCM_EQ_0_GEN =  |- (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,num),bool),bool) (\f:fun('K,num). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (((#iterate:fun(fun(num,fun(num,num)),fun(fun('K,bool),fun(fun('K,num),num))) (\m:num. (\n:num. (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))))) k:fun('K,bool)) f:fun('K,num))) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('K,bool),bool) (#GSPEC:fun(fun('K,bool),fun('K,bool)) (\GEN%PVAR%19:'K. (#?:fun(fun('K,bool),bool) (\j:'K. (((#SETSPEC:fun('K,fun(bool,fun('K,bool))) GEN%PVAR%19:'K) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) j:'K) k:fun('K,bool))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) (f:fun('K,num) j:'K)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) j:'K))))))) (#?:fun(fun('K,bool),bool) (\j:'K. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) j:'K) k:fun('K,bool))) ((#=:fun(num,fun(num,bool)) (f:fun('K,num) j:'K)) (#NUMERAL:fun(num,num) #_0:num)))))))))))
      #|ITERATE_LCM_EQ_0 =  |- (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,num),bool),bool) (\f:fun('K,num). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('K,bool),bool) k:fun('K,bool))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (((#iterate:fun(fun(num,fun(num,num)),fun(fun('K,bool),fun(fun('K,num),num))) (\m:num. (\n:num. (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))))) k:fun('K,bool)) f:fun('K,num))) (#NUMERAL:fun(num,num) #_0:num))) (#?:fun(fun('K,bool),bool) (\j:'K. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) j:'K) k:fun('K,bool))) ((#=:fun(num,fun(num,bool)) (f:fun('K,num) j:'K)) (#NUMERAL:fun(num,num) #_0:num)))))))))))
      #|ITERATE_LCM_EQ_1_GEN =  |- (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,num),bool),bool) (\f:fun('K,num). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (((#iterate:fun(fun(num,fun(num,num)),fun(fun('K,bool),fun(fun('K,num),num))) (\m:num. (\n:num. (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))))) k:fun('K,bool)) f:fun('K,num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('K,bool),bool) (#GSPEC:fun(fun('K,bool),fun('K,bool)) (\GEN%PVAR%20:'K. (#?:fun(fun('K,bool),bool) (\j:'K. (((#SETSPEC:fun('K,fun(bool,fun('K,bool))) GEN%PVAR%20:'K) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) j:'K) k:fun('K,bool))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) (f:fun('K,num) j:'K)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) j:'K))))))) (#forall:fun(fun('K,bool),bool) (\j:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) j:'K) k:fun('K,bool))) ((#=:fun(num,fun(num,bool)) (f:fun('K,num) j:'K)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))
      #|ITERATE_LCM_EQ_1 =  |- (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,num),bool),bool) (\f:fun('K,num). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('K,bool),bool) k:fun('K,bool))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (((#iterate:fun(fun(num,fun(num,num)),fun(fun('K,bool),fun(fun('K,num),num))) (\m:num. (\n:num. (#num_lcm:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))))) k:fun('K,bool)) f:fun('K,num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#forall:fun(fun('K,bool),bool) (\j:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) j:'K) k:fun('K,bool))) ((#=:fun(num,fun(num,bool)) (f:fun('K,num) j:'K)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))
      #|ITERATE_GCD_EQ_0_GEN =  |- (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,num),bool),bool) (\f:fun('K,num). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (((#iterate:fun(fun(num,fun(num,num)),fun(fun('K,bool),fun(fun('K,num),num))) (\m:num. (\n:num. (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))))) k:fun('K,bool)) f:fun('K,num))) (#NUMERAL:fun(num,num) #_0:num))) ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('K,bool),bool) (#GSPEC:fun(fun('K,bool),fun('K,bool)) (\GEN%PVAR%21:'K. (#?:fun(fun('K,bool),bool) (\j:'K. (((#SETSPEC:fun('K,fun(bool,fun('K,bool))) GEN%PVAR%21:'K) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) j:'K) k:fun('K,bool))) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) (f:fun('K,num) j:'K)) (#NUMERAL:fun(num,num) #_0:num))))) j:'K))))))) (#forall:fun(fun('K,bool),bool) (\j:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) j:'K) k:fun('K,bool))) ((#=:fun(num,fun(num,bool)) (f:fun('K,num) j:'K)) (#NUMERAL:fun(num,num) #_0:num)))))))))))
      #|ITERATE_GCD_EQ_0 =  |- (#forall:fun(fun(fun('K,bool),bool),bool) (\k:fun('K,bool). (#forall:fun(fun(fun('K,num),bool),bool) (\f:fun('K,num). ((#==>:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('K,bool),bool) k:fun('K,bool))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (((#iterate:fun(fun(num,fun(num,num)),fun(fun('K,bool),fun(fun('K,num),num))) (\m:num. (\n:num. (#num_gcd:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))))) k:fun('K,bool)) f:fun('K,num))) (#NUMERAL:fun(num,num) #_0:num))) (#forall:fun(fun('K,bool),bool) (\j:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) j:'K) k:fun('K,bool))) ((#=:fun(num,fun(num,bool)) (f:fun('K,num) j:'K)) (#NUMERAL:fun(num,num) #_0:num)))))))))))
      #|INDUCT_COPRIME =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\P:fun(num,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) a:num)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) b:num)) ((#/\:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) ((#/\:fun(bool,fun(bool,bool)) (P:fun(num,bool) a:num)) (P:fun(num,bool) b:num)))))) (P:fun(num,bool) ((#*:fun(num,fun(num,num)) a:num) b:num)))))))) (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) (P:fun(num,bool) ((#EXP:fun(num,fun(num,num)) p:num) k:num))))))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num)) (P:fun(num,bool) n:num)))))))
      #|INDUCT_COPRIME_STRONG =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\P:fun(num,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) a:num)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) b:num)) ((#/\:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) ((#/\:fun(bool,fun(bool,bool)) (P:fun(num,bool) a:num)) (P:fun(num,bool) b:num)))))) (P:fun(num,bool) ((#*:fun(num,fun(num,num)) a:num) b:num)))))))) (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) k:num) (#NUMERAL:fun(num,num) #_0:num))))) (P:fun(num,bool) ((#EXP:fun(num,fun(num,num)) p:num) k:num))))))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) n:num)) (P:fun(num,bool) n:num)))))))
      #|INDUCT_COPRIME_ALT =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\P:fun(num,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(num,bool) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\a:num. (#forall:fun(fun(num,bool),bool) (\b:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) a:num)) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) b:num)) ((#/\:fun(bool,fun(bool,bool)) (#num_coprime:fun(prod(num,num),bool) ((#,:fun(num,fun(num,prod(num,num))) a:num) b:num))) ((#/\:fun(bool,fun(bool,bool)) (P:fun(num,bool) a:num)) (P:fun(num,bool) b:num)))))) (P:fun(num,bool) ((#*:fun(num,fun(num,num)) a:num) b:num)))))))) (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) (#prime:fun(num,bool) p:num)) (P:fun(num,bool) ((#EXP:fun(num,fun(num,num)) p:num) k:num)))))))))) (#forall:fun(fun(num,bool),bool) (\n:num. (P:fun(num,bool) n:num))))))
      #|types = tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = index superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 264
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?3
      #|counter_genvar = _128409:bool
      #|
    ),
  )
}
