// Formal_ineqs/taylor/theory/taylor_interval-compiled.hl in its directory's load order: the test block of
// formal_ineqs/taylor/theory/taylor_interval_compiled/taylor_interval_compiled_ref_test.mbt (tools/ocaml_ref/chain_test.py), with the same golden
// (tools/ocaml_ref/Formal_ineqs_taylor_theory_taylor_interval-compiled_ref.expected).

///|
test "Formal_ineqs/taylor/theory/taylor_interval-compiled matches Formal_ineqs/taylor/theory/taylor_interval-compiled.ml" {
  @testkit.release_output()
  @taylor_interval_compiled.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for th in ["Formal_ineqs/taylor/theory/taylor_interval-compiled"] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Formal_ineqs/taylor/theory/taylor_interval-compiled")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("Taylor_interval.derivative", () => {
    sthm(@taylor_interval_compiled.derivative())
  })
  log.attempt("Taylor_interval.nth_derivative", () => {
    sthm(@taylor_interval_compiled.nth_derivative())
  })
  log.attempt("Taylor_interval.nth_differentiable", () => {
    sthm(@taylor_interval_compiled.nth_differentiable())
  })
  log.attempt("Taylor_interval.nth_differentiable_on", () => {
    sthm(@taylor_interval_compiled.nth_differentiable_on())
  })
  log.attempt("Taylor_interval.nth_differentiable_on_int", () => {
    sthm(@taylor_interval_compiled.nth_differentiable_on_int())
  })
  log.attempt("Taylor_interval.nth_diff_weak", () => {
    sthm(@taylor_interval_compiled.nth_diff_weak())
  })
  log.attempt("Taylor_interval.nth_diff_strong", () => {
    sthm(@taylor_interval_compiled.nth_diff_strong())
  })
  log.attempt("Taylor_interval.nth_diff_strong_int", () => {
    sthm(@taylor_interval_compiled.nth_diff_strong_int())
  })
  log.attempt("Taylor_interval.derivative_eq_real_derivative", () => {
    sthm(@taylor_interval_compiled.derivative_eq_real_derivative_v1())
  })
  log.attempt("Taylor_interval.has_derivative_cond", () => {
    sthm(@taylor_interval_compiled.has_derivative_cond_v1())
  })
  log.attempt("Taylor_interval.has_derivative_alt", () => {
    sthm(@taylor_interval_compiled.has_derivative_alt_v1())
  })
  log.attempt("Taylor_interval.derivative_unique", () => {
    sthm(@taylor_interval_compiled.derivative_unique_v1())
  })
  log.attempt("Taylor_interval.derivative_unique_on", () => {
    sthm(@taylor_interval_compiled.derivative_unique_on_v1())
  })
  log.attempt("Taylor_interval.has_derivative_lemma", () => {
    sthm(@taylor_interval_compiled.has_derivative_lemma_v1())
  })
  log.attempt("Taylor_interval.nth_derivative0", () => {
    sthm(@taylor_interval_compiled.nth_derivative0_v1())
  })
  log.attempt("Taylor_interval.nth_derivativeS", () => {
    sthm(@taylor_interval_compiled.nth_derivatives_v1())
  })
  log.attempt("Taylor_interval.nth_Sderivative", () => {
    sthm(@taylor_interval_compiled.nth_sderivative_v1())
  })
  log.attempt("Taylor_interval.nth_derivative1", () => {
    sthm(@taylor_interval_compiled.nth_derivative1_v1())
  })
  log.attempt("Taylor_interval.nth_derivative2", () => {
    sthm(@taylor_interval_compiled.nth_derivative2_v1())
  })
  log.attempt("Taylor_interval.nth_diff_continuous", () => {
    sthm(@taylor_interval_compiled.nth_diff_continuous_v1())
  })
  log.attempt("Taylor_interval.nth_differentiable_cond", () => {
    sthm(@taylor_interval_compiled.nth_differentiable_cond_v1())
  })
  log.attempt("Taylor_interval.nth_differentiable_on_cond", () => {
    sthm(@taylor_interval_compiled.nth_differentiable_on_cond_v1())
  })
  log.attempt("Taylor_interval.nth_differentiable_eq", () => {
    sthm(@taylor_interval_compiled.nth_differentiable_eq_v1())
  })
  log.attempt("Taylor_interval.nth_differentiable_on_int2", () => {
    sthm(@taylor_interval_compiled.nth_differentiable_on_int2_v1())
  })
  log.attempt("Taylor_interval.nth_mth_diff", () => {
    sthm(@taylor_interval_compiled.nth_mth_diff_v1())
  })
  log.attempt("Taylor_interval.nth_differentiable1", () => {
    sthm(@taylor_interval_compiled.nth_differentiable1_v1())
  })
  log.attempt("Taylor_interval.nth_diff_imp_diff", () => {
    sthm(@taylor_interval_compiled.nth_diff_imp_diff_v1())
  })
  log.attempt("Taylor_interval.nth_derivative_continuous", () => {
    sthm(@taylor_interval_compiled.nth_derivative_continuous_v1())
  })
  log.attempt("Taylor_interval.ith_derivative_differentiable", () => {
    sthm(@taylor_interval_compiled.ith_derivative_differentiable_v1())
  })
  log.attempt("Taylor_interval.nth_diff_strong_imp_diff", () => {
    sthm(@taylor_interval_compiled.nth_diff_strong_imp_diff_v1())
  })
  log.attempt("Taylor_interval.HAS_REAL_DERIVATIVE_ABS_POS", () => {
    sthm(@taylor_interval_compiled.has_real_derivative_abs_pos_v3())
  })
  log.attempt("Taylor_interval.HAS_REAL_DERIVATIVE_ABS_NEG", () => {
    sthm(@taylor_interval_compiled.has_real_derivative_abs_neg_v3())
  })
  log.attempt("Taylor_interval.derivative_x", () => {
    sthm(@taylor_interval_compiled.derivative_x_v3())
  })
  log.attempt("Taylor_interval.derivative_const", () => {
    sthm(@taylor_interval_compiled.derivative_const_v3())
  })
  log.attempt("Taylor_interval.derivative_abs_pos", () => {
    sthm(@taylor_interval_compiled.derivative_abs_pos_v3())
  })
  log.attempt("Taylor_interval.derivative_abs_neg", () => {
    sthm(@taylor_interval_compiled.derivative_abs_neg_v3())
  })
  log.attempt("Taylor_interval.derivative_pow_x", () => {
    sthm(@taylor_interval_compiled.derivative_pow_x_v3())
  })
  log.attempt("Taylor_interval.derivative_pow2_x", () => {
    sthm(@taylor_interval_compiled.derivative_pow2_x_v3())
  })
  log.attempt("Taylor_interval.derivative_pow3_x", () => {
    sthm(@taylor_interval_compiled.derivative_pow3_x_v3())
  })
  log.attempt("Taylor_interval.derivative_inv", () => {
    sthm(@taylor_interval_compiled.derivative_inv_v3())
  })
  log.attempt("Taylor_interval.derivative_atn", () => {
    sthm(@taylor_interval_compiled.derivative_atn_v3())
  })
  log.attempt("Taylor_interval.derivative_exp", () => {
    sthm(@taylor_interval_compiled.derivative_exp_v3())
  })
  log.attempt("Taylor_interval.derivative_log", () => {
    sthm(@taylor_interval_compiled.derivative_log_v3())
  })
  log.attempt("Taylor_interval.derivative_sin", () => {
    sthm(@taylor_interval_compiled.derivative_sin_v3())
  })
  log.attempt("Taylor_interval.derivative_cos", () => {
    sthm(@taylor_interval_compiled.derivative_cos_v3())
  })
  log.attempt("Taylor_interval.derivative_asn", () => {
    sthm(@taylor_interval_compiled.derivative_asn_v3())
  })
  log.attempt("Taylor_interval.derivative_acs", () => {
    sthm(@taylor_interval_compiled.derivative_acs_v3())
  })
  log.attempt("Taylor_interval.derivative_sqrt", () => {
    sthm(@taylor_interval_compiled.derivative_sqrt_v3())
  })
  log.attempt("Taylor_interval.derivative_matan", () => {
    sthm(@taylor_interval_compiled.derivative_matan_v3())
  })
  log.attempt("Taylor_interval.matan_differentiable", () => {
    sthm(@taylor_interval_compiled.matan_differentiable_v3())
  })
  log.attempt("Taylor_interval.derivative_composition", () => {
    sthm(@taylor_interval_compiled.derivative_composition_v3())
  })
  log.attempt("Taylor_interval.REAL_DIFFERENTIABLE_AT_INV", () => {
    sthm(@taylor_interval_compiled.real_differentiable_at_inv_v4())
  })
  log.attempt("Taylor_interval.REAL_DIFFERENTIABLE_AT_ABS_POS", () => {
    sthm(@taylor_interval_compiled.real_differentiable_at_abs_pos_v4())
  })
  log.attempt("Taylor_interval.REAL_DIFFERENTIABLE_AT_ABS_NEG", () => {
    sthm(@taylor_interval_compiled.real_differentiable_at_abs_neg_v4())
  })
  log.attempt("Taylor_interval.derivative_compose_abs_pos", () => {
    sthm(@taylor_interval_compiled.derivative_compose_abs_pos_v4())
  })
  log.attempt("Taylor_interval.derivative_compose_abs_neg", () => {
    sthm(@taylor_interval_compiled.derivative_compose_abs_neg_v4())
  })
  log.attempt("Taylor_interval.derivative_compose_pow", () => {
    sthm(@taylor_interval_compiled.derivative_compose_pow_v4())
  })
  log.attempt("Taylor_interval.derivative_compose_pow2", () => {
    sthm(@taylor_interval_compiled.derivative_compose_pow2_v4())
  })
  log.attempt("Taylor_interval.derivative_compose_pow3", () => {
    sthm(@taylor_interval_compiled.derivative_compose_pow3_v4())
  })
  log.attempt("Taylor_interval.derivative_compose_atn", () => {
    sthm(@taylor_interval_compiled.derivative_compose_atn_v4())
  })
  log.attempt("Taylor_interval.derivative_compose_exp", () => {
    sthm(@taylor_interval_compiled.derivative_compose_exp_v4())
  })
  log.attempt("Taylor_interval.derivative_compose_log", () => {
    sthm(@taylor_interval_compiled.derivative_compose_log_v4())
  })
  log.attempt("Taylor_interval.derivative_compose_cos", () => {
    sthm(@taylor_interval_compiled.derivative_compose_cos_v4())
  })
  log.attempt("Taylor_interval.derivative_compose_sin", () => {
    sthm(@taylor_interval_compiled.derivative_compose_sin_v4())
  })
  log.attempt("Taylor_interval.derivative_compose_inv", () => {
    sthm(@taylor_interval_compiled.derivative_compose_inv_v4())
  })
  log.attempt("Taylor_interval.derivative_compose_sqrt", () => {
    sthm(@taylor_interval_compiled.derivative_compose_sqrt_v4())
  })
  log.attempt("Taylor_interval.derivative_compose_acs", () => {
    sthm(@taylor_interval_compiled.derivative_compose_acs_v4())
  })
  log.attempt("Taylor_interval.derivative_compose_asn", () => {
    sthm(@taylor_interval_compiled.derivative_compose_asn_v4())
  })
  log.attempt("Taylor_interval.derivative_compose_matan", () => {
    sthm(@taylor_interval_compiled.derivative_compose_matan_v4())
  })
  log.attempt("Taylor_interval.derivative_scale", () => {
    sthm(@taylor_interval_compiled.derivative_scale_v2())
  })
  log.attempt("Taylor_interval.derivative_neg", () => {
    sthm(@taylor_interval_compiled.derivative_neg_v2())
  })
  log.attempt("Taylor_interval.derivative_pow", () => {
    sthm(@taylor_interval_compiled.derivative_pow_v2())
  })
  log.attempt("Taylor_interval.derivative_add", () => {
    sthm(@taylor_interval_compiled.derivative_add_v2())
  })
  log.attempt("Taylor_interval.derivative_mul", () => {
    sthm(@taylor_interval_compiled.derivative_mul_v2())
  })
  log.attempt("Taylor_interval.derivative_sub", () => {
    sthm(@taylor_interval_compiled.derivative_sub_v2())
  })
  log.attempt("Taylor_interval.derivative_div", () => {
    sthm(@taylor_interval_compiled.derivative_div_v2())
  })
  log.attempt("Taylor_interval.differentiable_sum_numseg", () => {
    sthm(@taylor_interval_compiled.differentiable_sum_numseg_v2())
  })
  log.attempt("Taylor_interval.derivative_sum_numseg", () => {
    sthm(@taylor_interval_compiled.derivative_sum_numseg_v2())
  })
  log.attempt("Taylor_interval.HAS_REAL_DERIVATIVE_LOCAL", () => {
    sthm(@taylor_interval_compiled.has_real_derivative_local_v1())
  })
  log.attempt("Taylor_interval.differentiable_local", () => {
    sthm(@taylor_interval_compiled.differentiable_local_v1())
  })
  log.attempt("Taylor_interval.nth_derivative_scale_strong", () => {
    sthm(@taylor_interval_compiled.nth_derivative_scale_strong_v2())
  })
  log.attempt("Taylor_interval.nth_derivative_scale_strong_all", () => {
    sthm(@taylor_interval_compiled.nth_derivative_scale_strong_all_v2())
  })
  log.attempt("Taylor_interval.nth_derivative_scale", () => {
    sthm(@taylor_interval_compiled.nth_derivative_scale_v2())
  })
  log.attempt("Taylor_interval.nth_diff_scale", () => {
    sthm(@taylor_interval_compiled.nth_diff_scale_v2())
  })
  log.attempt("Taylor_interval.nth_derivative_add_strong", () => {
    sthm(@taylor_interval_compiled.nth_derivative_add_strong_v2())
  })
  log.attempt("Taylor_interval.nth_derivative_add_strong_all", () => {
    sthm(@taylor_interval_compiled.nth_derivative_add_strong_all_v2())
  })
  log.attempt("Taylor_interval.nth_derivative_add", () => {
    sthm(@taylor_interval_compiled.nth_derivative_add_v4())
  })
  log.attempt("Taylor_interval.nth_diff_add", () => {
    sthm(@taylor_interval_compiled.nth_diff_add_v2())
  })
  log.attempt("Taylor_interval.nth_derivative_sub_strong", () => {
    sthm(@taylor_interval_compiled.nth_derivative_sub_strong_v2())
  })
  log.attempt("Taylor_interval.nth_derivative_sub_strong_all", () => {
    sthm(@taylor_interval_compiled.nth_derivative_sub_strong_all_v2())
  })
  log.attempt("Taylor_interval.nth_derivative_sub", () => {
    sthm(@taylor_interval_compiled.nth_derivative_sub_v2())
  })
  log.attempt("Taylor_interval.nth_diff_sub", () => {
    sthm(@taylor_interval_compiled.nth_diff_sub_v2())
  })
  log.attempt("Taylor_interval.nth_derivative_mul_strong", () => {
    sthm(@taylor_interval_compiled.nth_derivative_mul_strong_v2())
  })
  log.attempt("Taylor_interval.nth_derivative_mul_strong_all", () => {
    sthm(@taylor_interval_compiled.nth_derivative_mul_strong_all_v2())
  })
  log.attempt("Taylor_interval.nth_derivative_mul", () => {
    sthm(@taylor_interval_compiled.nth_derivative_mul_v2())
  })
  log.attempt("Taylor_interval.nth_diff_mul", () => {
    sthm(@taylor_interval_compiled.nth_diff_mul_v2())
  })
  log.attempt("Taylor_interval.lin_approx", () => {
    sthm(@taylor_interval_compiled.lin_approx())
  })
  log.attempt("Taylor_interval.has_bounded_second_derivative", () => {
    sthm(@taylor_interval_compiled.has_bounded_second_derivative())
  })
  log.attempt("Taylor_interval.taylor_interval", () => {
    sthm(@taylor_interval_compiled.taylor_interval())
  })
  log.attempt("Taylor_interval.nth_diff_strong_imp_diff_int", () => {
    sthm(@taylor_interval_compiled.nth_diff_strong_imp_diff_int())
  })
  log.attempt("Taylor_interval.has_bounded_second_derivative_old", () => {
    sthm(@taylor_interval_compiled.has_bounded_second_derivative_old())
  })
  log.attempt("Taylor_interval.exists_and_left", () => {
    sthm(@taylor_interval_compiled.exists_and_left())
  })
  log.attempt("Taylor_interval.lim_ineq", () => {
    sthm(@taylor_interval_compiled.lim_ineq())
  })
  log.attempt("Taylor_interval.continuous_leq", () => {
    sthm(@taylor_interval_compiled.continuous_leq())
  })
  log.attempt("Taylor_interval.continuous_reflection", () => {
    sthm(@taylor_interval_compiled.continuous_reflection())
  })
  log.attempt("Taylor_interval.continuous_leq_segment", () => {
    sthm(@taylor_interval_compiled.continuous_leq_segment())
  })
  log.attempt("Taylor_interval.pair_eq", () => {
    sthm(@taylor_interval_compiled.pair_eq())
  })
  log.attempt("Taylor_interval.iabs_alt", () => {
    sthm(@taylor_interval_compiled.iabs_alt_v1())
  })
  log.attempt("Taylor_interval.iabs_pos", () => {
    sthm(@taylor_interval_compiled.iabs_pos_v1())
  })
  log.attempt("Taylor_interval.f_continuous", () => {
    sthm(@taylor_interval_compiled.f_continuous_v1())
  })
  log.attempt("Taylor_interval.taylor_error", () => {
    sthm(@taylor_interval_compiled.taylor_error_v1())
  })
  log.attempt("Taylor_interval.taylor_upper_bound", () => {
    sthm(@taylor_interval_compiled.taylor_upper_bound_v1())
  })
  log.attempt("Taylor_interval.taylor_lower_bound", () => {
    sthm(@taylor_interval_compiled.taylor_lower_bound_v1())
  })
  log.attempt("Taylor_interval.taylor_derivative_error", () => {
    sthm(@taylor_interval_compiled.taylor_derivative_error_v1())
  })
  log.attempt("Taylor_interval.derivative_interval", () => {
    sthm(@taylor_interval_compiled.derivative_interval_v1())
  })
  log.attempt("Taylor_interval.taylor_derivative_upper_bound", () => {
    sthm(@taylor_interval_compiled.taylor_derivative_upper_bound_v1())
  })
  log.attempt("Taylor_interval.taylor_derivative_lower_bound", () => {
    sthm(@taylor_interval_compiled.taylor_derivative_lower_bound_v1())
  })
  log.attempt("Taylor_interval.lin_approx_eq", () => {
    sthm(@taylor_interval_compiled.lin_approx_eq_v1())
  })
  log.attempt("Taylor_interval.lin_approx_imp_f_interval", () => {
    sthm(@taylor_interval_compiled.lin_approx_imp_f_interval_v1())
  })
  log.attempt("Taylor_interval.lin_approx_imp_df_interval", () => {
    sthm(@taylor_interval_compiled.lin_approx_imp_df_interval_v1())
  })
  log.attempt("Taylor_interval.lin_approx_imp_f_diff", () => {
    sthm(@taylor_interval_compiled.lin_approx_imp_f_diff_v1())
  })
  log.attempt("Taylor_interval.interval_arith_not_zero", () => {
    sthm(@taylor_interval_compiled.interval_arith_not_zero_v1())
  })
  log.attempt("Taylor_interval.interval_arith_pos", () => {
    sthm(@taylor_interval_compiled.interval_arith_pos_v1())
  })
  log.attempt("Taylor_interval.interval_arith_neg", () => {
    sthm(@taylor_interval_compiled.interval_arith_neg_v1())
  })
  log.attempt("Taylor_interval.interval_arith_abs", () => {
    sthm(@taylor_interval_compiled.interval_arith_abs_v1())
  })
  log.attempt("Taylor_interval.lin_approx_x", () => {
    sthm(@taylor_interval_compiled.lin_approx_x_v1())
  })
  log.attempt("Taylor_interval.lin_approx_const", () => {
    sthm(@taylor_interval_compiled.lin_approx_const_v1())
  })
  log.attempt("Taylor_interval.lin_approx_compose_atn", () => {
    sthm(@taylor_interval_compiled.lin_approx_compose_atn_v2())
  })
  log.attempt("Taylor_interval.lin_approx_compose_exp", () => {
    sthm(@taylor_interval_compiled.lin_approx_compose_exp_v2())
  })
  log.attempt("Taylor_interval.lin_approx_compose_log", () => {
    sthm(@taylor_interval_compiled.lin_approx_compose_log_v2())
  })
  log.attempt("Taylor_interval.lin_approx_compose_cos", () => {
    sthm(@taylor_interval_compiled.lin_approx_compose_cos_v2())
  })
  log.attempt("Taylor_interval.lin_approx_compose_sin", () => {
    sthm(@taylor_interval_compiled.lin_approx_compose_sin_v2())
  })
  log.attempt("Taylor_interval.lin_approx_compose_inv", () => {
    sthm(@taylor_interval_compiled.lin_approx_compose_inv_v2())
  })
  log.attempt("Taylor_interval.lin_approx_compose_sqrt", () => {
    sthm(@taylor_interval_compiled.lin_approx_compose_sqrt_v2())
  })
  log.attempt("Taylor_interval.lin_approx_compose_acs", () => {
    sthm(@taylor_interval_compiled.lin_approx_compose_acs_v2())
  })
  log.attempt("Taylor_interval.lin_approx_compose_asn", () => {
    sthm(@taylor_interval_compiled.lin_approx_compose_asn_v2())
  })
  log.attempt("Taylor_interval.lin_approx_compose_matan", () => {
    sthm(@taylor_interval_compiled.lin_approx_compose_matan_v2())
  })
  log.attempt("Taylor_interval.lin_approx_imp_add_diff", () => {
    sthm(@taylor_interval_compiled.lin_approx_imp_add_diff_v1())
  })
  log.attempt("Taylor_interval.lin_approx_imp_sub_diff", () => {
    sthm(@taylor_interval_compiled.lin_approx_imp_sub_diff_v1())
  })
  log.attempt("Taylor_interval.lin_approx_imp_mul_diff", () => {
    sthm(@taylor_interval_compiled.lin_approx_imp_mul_diff_v1())
  })
  log.attempt("Taylor_interval.lin_approx_imp_div_diff", () => {
    sthm(@taylor_interval_compiled.lin_approx_imp_div_diff_v1())
  })
  log.attempt("Taylor_interval.lin_approx_scale", () => {
    sthm(@taylor_interval_compiled.lin_approx_scale_v1())
  })
  log.attempt("Taylor_interval.lin_approx_add", () => {
    sthm(@taylor_interval_compiled.lin_approx_add_v1())
  })
  log.attempt("Taylor_interval.nth_diff_strong2_eq_alt", () => {
    sthm(@taylor_interval_compiled.nth_diff_strong2_eq_alt_v1())
  })
  log.attempt("Taylor_interval.nth_diff_strong2_eq", () => {
    sthm(@taylor_interval_compiled.nth_diff_strong2_eq_v1())
  })
  log.attempt("Taylor_interval.lin_approx_compose", () => {
    sthm(@taylor_interval_compiled.lin_approx_compose_v1())
  })
  log.attempt("Taylor_interval.second_derivative_abs_pos", () => {
    sthm(@taylor_interval_compiled.second_derivative_abs_pos_v1())
  })
  log.attempt("Taylor_interval.second_derivative_abs_neg", () => {
    sthm(@taylor_interval_compiled.second_derivative_abs_neg_v1())
  })
  log.attempt("Taylor_interval.diff2_abs_pos", () => {
    sthm(@taylor_interval_compiled.diff2_abs_pos_v1())
  })
  log.attempt("Taylor_interval.diff2_abs_neg", () => {
    sthm(@taylor_interval_compiled.diff2_abs_neg_v1())
  })
  log.attempt("Taylor_interval.pow_x_has_real_derivative", () => {
    sthm(@taylor_interval_compiled.pow_x_has_real_derivative_v1())
  })
  log.attempt("Taylor_interval.second_derivative_pow_x", () => {
    sthm(@taylor_interval_compiled.second_derivative_pow_x_v1())
  })
  log.attempt("Taylor_interval.diff2_pow_x", () => {
    sthm(@taylor_interval_compiled.diff2_pow_x_v1())
  })
  log.attempt("Taylor_interval.second_derivative_pow2_x", () => {
    sthm(@taylor_interval_compiled.second_derivative_pow2_x_v1())
  })
  log.attempt("Taylor_interval.second_derivative_pow3_x", () => {
    sthm(@taylor_interval_compiled.second_derivative_pow3_x_v1())
  })
  log.attempt("Taylor_interval.second_derivative_atn_eq", () => {
    sthm(@taylor_interval_compiled.second_derivative_atn_eq_v1())
  })
  log.attempt("Taylor_interval.second_derivative_atn", () => {
    sthm(@taylor_interval_compiled.second_derivative_atn_v1())
  })
  log.attempt("Taylor_interval.diff2_atn", () => {
    sthm(@taylor_interval_compiled.diff2_atn_v1())
  })
  log.attempt("Taylor_interval.second_derivative_cos", () => {
    sthm(@taylor_interval_compiled.second_derivative_cos_v1())
  })
  log.attempt("Taylor_interval.diff2_cos", () => {
    sthm(@taylor_interval_compiled.diff2_cos_v1())
  })
  log.attempt("Taylor_interval.second_derivative_sin", () => {
    sthm(@taylor_interval_compiled.second_derivative_sin_v1())
  })
  log.attempt("Taylor_interval.diff2_sin", () => {
    sthm(@taylor_interval_compiled.diff2_sin_v1())
  })
  log.attempt("Taylor_interval.second_derivative_exp", () => {
    sthm(@taylor_interval_compiled.second_derivative_exp_v1())
  })
  log.attempt("Taylor_interval.diff2_exp", () => {
    sthm(@taylor_interval_compiled.diff2_exp_v1())
  })
  log.attempt("Taylor_interval.second_derivative_log", () => {
    sthm(@taylor_interval_compiled.second_derivative_log_v1())
  })
  log.attempt("Taylor_interval.diff2_log", () => {
    sthm(@taylor_interval_compiled.diff2_log_v1())
  })
  log.attempt("Taylor_interval.second_derivative_inv", () => {
    sthm(@taylor_interval_compiled.second_derivative_inv_v1())
  })
  log.attempt("Taylor_interval.diff2_inv", () => {
    sthm(@taylor_interval_compiled.diff2_inv_v1())
  })
  log.attempt("Taylor_interval.SQRT_POW", () => {
    sthm(@taylor_interval_compiled.sqrt_pow_v1())
  })
  log.attempt("Taylor_interval.second_derivative_sqrt", () => {
    sthm(@taylor_interval_compiled.second_derivative_sqrt_v1())
  })
  log.attempt("Taylor_interval.diff2_sqrt", () => {
    sthm(@taylor_interval_compiled.diff2_sqrt_v1())
  })
  log.attempt("Taylor_interval.real_powS", () => {
    sthm(@taylor_interval_compiled.real_pows_v1())
  })
  log.attempt("Taylor_interval.second_derivative_acs", () => {
    sthm(@taylor_interval_compiled.second_derivative_acs_v1())
  })
  log.attempt("Taylor_interval.diff2_acs", () => {
    sthm(@taylor_interval_compiled.diff2_acs_v1())
  })
  log.attempt("Taylor_interval.second_derivative_asn", () => {
    sthm(@taylor_interval_compiled.second_derivative_asn_v1())
  })
  log.attempt("Taylor_interval.diff2_asn", () => {
    sthm(@taylor_interval_compiled.diff2_asn_v1())
  })
  log.attempt("Taylor_interval.second_derivative_matan", () => {
    sthm(@taylor_interval_compiled.second_derivative_matan_v1())
  })
  log.attempt("Taylor_interval.diff2_matan", () => {
    sthm(@taylor_interval_compiled.diff2_matan_v1())
  })
  log.attempt("Taylor_interval.REAL_CONTINUOUS_OPEN_PREIMAGE", () => {
    sthm(@taylor_interval_compiled.real_continuous_open_preimage_v2())
  })
  log.attempt("Taylor_interval.second_derivative_compose", () => {
    sthm(@taylor_interval_compiled.second_derivative_compose_v2())
  })
  log.attempt("Taylor_interval.diff2_compose", () => {
    sthm(@taylor_interval_compiled.diff2_compose_v2())
  })
  log.attempt("Taylor_interval.continuous_not0_exists_open", () => {
    sthm(@taylor_interval_compiled.continuous_not0_exists_open_v2())
  })
  log.attempt("Taylor_interval.continuous_gt_exists_open", () => {
    sthm(@taylor_interval_compiled.continuous_gt_exists_open_v2())
  })
  log.attempt("Taylor_interval.continuous_lt_exists_open", () => {
    sthm(@taylor_interval_compiled.continuous_lt_exists_open_v2())
  })
  log.attempt("Taylor_interval.second_derivative_compose_abs_pos", () => {
    sthm(@taylor_interval_compiled.second_derivative_compose_abs_pos_v2())
  })
  log.attempt("Taylor_interval.second_derivative_compose_abs_neg", () => {
    sthm(@taylor_interval_compiled.second_derivative_compose_abs_neg_v2())
  })
  log.attempt("Taylor_interval.second_derivative_compose_pow", () => {
    sthm(@taylor_interval_compiled.second_derivative_compose_pow_v2())
  })
  log.attempt("Taylor_interval.second_derivative_compose_pow2", () => {
    sthm(@taylor_interval_compiled.second_derivative_compose_pow2_v2())
  })
  log.attempt("Taylor_interval.second_derivative_compose_pow3", () => {
    sthm(@taylor_interval_compiled.second_derivative_compose_pow3_v2())
  })
  log.attempt("Taylor_interval.second_derivative_compose_atn", () => {
    sthm(@taylor_interval_compiled.second_derivative_compose_atn_v2())
  })
  log.attempt("Taylor_interval.second_derivative_compose_cos", () => {
    sthm(@taylor_interval_compiled.second_derivative_compose_cos_v2())
  })
  log.attempt("Taylor_interval.second_derivative_compose_sin", () => {
    sthm(@taylor_interval_compiled.second_derivative_compose_sin_v2())
  })
  log.attempt("Taylor_interval.second_derivative_compose_exp", () => {
    sthm(@taylor_interval_compiled.second_derivative_compose_exp_v2())
  })
  log.attempt("Taylor_interval.second_derivative_compose_log", () => {
    sthm(@taylor_interval_compiled.second_derivative_compose_log_v2())
  })
  log.attempt("Taylor_interval.second_derivative_compose_inv", () => {
    sthm(@taylor_interval_compiled.second_derivative_compose_inv_v2())
  })
  log.attempt("Taylor_interval.second_derivative_compose_sqrt", () => {
    sthm(@taylor_interval_compiled.second_derivative_compose_sqrt_v2())
  })
  log.attempt("Taylor_interval.second_derivative_compose_acs", () => {
    sthm(@taylor_interval_compiled.second_derivative_compose_acs_v2())
  })
  log.attempt("Taylor_interval.second_derivative_compose_asn", () => {
    sthm(@taylor_interval_compiled.second_derivative_compose_asn_v2())
  })
  log.attempt("Taylor_interval.second_derivative_compose_matan", () => {
    sthm(@taylor_interval_compiled.second_derivative_compose_matan_v2())
  })
  log.attempt("Taylor_interval.diff2_compose_abs_pos", () => {
    sthm(@taylor_interval_compiled.diff2_compose_abs_pos_v2())
  })
  log.attempt("Taylor_interval.diff2_compose_abs_neg", () => {
    sthm(@taylor_interval_compiled.diff2_compose_abs_neg_v2())
  })
  log.attempt("Taylor_interval.diff2_compose_pow", () => {
    sthm(@taylor_interval_compiled.diff2_compose_pow_v2())
  })
  log.attempt("Taylor_interval.diff2_compose_atn", () => {
    sthm(@taylor_interval_compiled.diff2_compose_atn_v2())
  })
  log.attempt("Taylor_interval.diff2_compose_cos", () => {
    sthm(@taylor_interval_compiled.diff2_compose_cos_v2())
  })
  log.attempt("Taylor_interval.diff2_compose_sin", () => {
    sthm(@taylor_interval_compiled.diff2_compose_sin_v2())
  })
  log.attempt("Taylor_interval.diff2_compose_exp", () => {
    sthm(@taylor_interval_compiled.diff2_compose_exp_v2())
  })
  log.attempt("Taylor_interval.diff2_compose_log", () => {
    sthm(@taylor_interval_compiled.diff2_compose_log_v2())
  })
  log.attempt("Taylor_interval.diff2_compose_inv", () => {
    sthm(@taylor_interval_compiled.diff2_compose_inv_v2())
  })
  log.attempt("Taylor_interval.diff2_compose_sqrt", () => {
    sthm(@taylor_interval_compiled.diff2_compose_sqrt_v2())
  })
  log.attempt("Taylor_interval.diff2_compose_acs", () => {
    sthm(@taylor_interval_compiled.diff2_compose_acs_v2())
  })
  log.attempt("Taylor_interval.diff2_compose_asn", () => {
    sthm(@taylor_interval_compiled.diff2_compose_asn_v2())
  })
  log.attempt("Taylor_interval.diff2_compose_matan", () => {
    sthm(@taylor_interval_compiled.diff2_compose_matan_v2())
  })
  log.attempt("Taylor_interval.second_derivative_mul", () => {
    sthm(@taylor_interval_compiled.second_derivative_mul_v1())
  })
  log.attempt("Taylor_interval.second_derivative_div", () => {
    sthm(@taylor_interval_compiled.second_derivative_div_v1())
  })
  log.attempt("Taylor_interval.diff2_div", () => {
    sthm(@taylor_interval_compiled.diff2_div_v1())
  })
  log.attempt("Taylor_interval.second_derivative_scale", () => {
    sthm(@taylor_interval_compiled.second_derivative_scale_v1())
  })
  log.attempt("Taylor_interval.second_derivative_add", () => {
    sthm(@taylor_interval_compiled.second_derivative_add_v1())
  })
  log.attempt("Taylor_interval.second_derivative_sub", () => {
    sthm(@taylor_interval_compiled.second_derivative_sub_v1())
  })
  log.attempt("Taylor_interval.second_derivative_compose_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_compose_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_abs_pos_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_abs_pos_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_abs_neg_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_abs_neg_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_compose_abs_pos_bounds", () => {
    sthm(
      @taylor_interval_compiled.second_derivative_compose_abs_pos_bounds_v1(),
    )
  })
  log.attempt("Taylor_interval.second_derivative_compose_abs_neg_bounds", () => {
    sthm(
      @taylor_interval_compiled.second_derivative_compose_abs_neg_bounds_v1(),
    )
  })
  log.attempt("Taylor_interval.second_derivative_pow_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_pow_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_compose_pow_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_compose_pow_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_pow2_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_pow2_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_compose_pow2_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_compose_pow2_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_pow3_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_pow3_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_compose_pow3_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_compose_pow3_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_atn_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_atn_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_compose_atn_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_compose_atn_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_cos_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_cos_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_compose_cos_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_compose_cos_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_sin_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_sin_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_compose_sin_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_compose_sin_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_exp_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_exp_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_compose_exp_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_compose_exp_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_log_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_log_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_compose_log_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_compose_log_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_inv_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_inv_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_compose_inv_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_compose_inv_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_sqrt_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_sqrt_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_compose_sqrt_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_compose_sqrt_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_acs_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_acs_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_compose_acs_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_compose_acs_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_asn_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_asn_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_compose_asn_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_compose_asn_bounds_v1())
  })
  log.attempt("Taylor_interval.interval_arith_gt", () => {
    sthm(@taylor_interval_compiled.interval_arith_gt_v1())
  })
  log.attempt("Taylor_interval.second_derivative_matan_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_matan_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_compose_matan_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_compose_matan_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_scale_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_scale_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_add_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_add_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_sub_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_sub_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_mul_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_mul_bounds_v1())
  })
  log.attempt("Taylor_interval.second_derivative_div_bounds", () => {
    sthm(@taylor_interval_compiled.second_derivative_div_bounds_v1())
  })
  log.attempt("Taylor_interval.cell_domain", () => {
    sthm(@taylor_interval_compiled.cell_domain())
  })
  log.attempt("Taylor_interval.taylor_x", () => {
    sthm(@taylor_interval_compiled.taylor_x_v1())
  })
  log.attempt("Taylor_interval.taylor_const", () => {
    sthm(@taylor_interval_compiled.taylor_const_v1())
  })
  log.attempt("Taylor_interval.taylor_f_bounds", () => {
    sthm(@taylor_interval_compiled.taylor_f_bounds_v1())
  })
  log.attempt("Taylor_interval.taylor_df_bounds", () => {
    sthm(@taylor_interval_compiled.taylor_df_bounds_v1())
  })
  log.attempt("Taylor_interval.bounded_on_int_compose", () => {
    sthm(@taylor_interval_compiled.bounded_on_int_compose_v1())
  })
  log.attempt("Taylor_interval.bounded_on_int_imp_interval_arith", () => {
    sthm(@taylor_interval_compiled.bounded_on_int_imp_interval_arith_v1())
  })
  log.attempt("Taylor_interval.taylor_interval_narrow", () => {
    sthm(@taylor_interval_compiled.taylor_interval_narrow_v1())
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
  log.probe_counters()
  @testkit.check_axioms()
  inspect(
    @testkit.normalize_times(log.contents()),
    content=(
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
      #|1 basis elements and 0 critical pairs
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
      #|Formal_ineqs/taylor/theory/taylor_interval-compiled quotations (812):
      #|  (derivative : ((Real) -> Real, Real) -> Real)((f : (Real) -> Real)) == ((y : Real) => select((d : Real) => has_real_derivative(f, d, atreal(y))))
      #|  (nth_derivative : (Num, (Real) -> Real, Real) -> Real)((n : Num), (f : (Real) -> Real)) == iter(n, derivative, f)
      #|  (nth_differentiable : (Num, (Real) -> Real, Real) -> Bool)(0, (f : (Real) -> Real), (x : Real)) == real_continuous(f, atreal(x)) && nth_differentiable(SUC((n : Num)), f, x) == (nth_differentiable(n, f, x) && real_differentiable(nth_derivative(n, f), atreal(x)))
      #|  :P
      #|  :P
      #|  :P
      #|  (n : Num) => n + 1
      #|  (n : Num) => n + 1
      #|  (n : Num) => n + 1
      #|  (n : Num) => n + 1
      #|  (n : Num) => n + 1
      #|  (nth_differentiable_on : (Num, (Real) -> Bool, (Real) -> Real) -> Bool)((n : Num), (s : (Real) -> Bool), (f : (Real) -> Real)) == (\226\136\128 x : Real, IN(x, s) \226\134\146 nth_differentiable(n, f, x))
      #|  (nth_differentiable_on_int : (Num, (Real, Real), (Real) -> Real) -> Bool)((n : Num), (int : (Real, Real)), (f : (Real) -> Real)) == (\226\136\128 x : Real, interval_arith(x, int) \226\134\146 nth_differentiable(n, f, x))
      #|  (nth_diff_weak : (Num, (Real) -> Real, Real) -> Bool)((n : Num), (f : (Real) -> Real), (x : Real)) == (real_continuous(f, atreal(x)) && (\226\136\131 F : (Num, Real) -> Real, F(0) == f && (\226\136\128 i : Num, i < n \226\134\146 has_real_derivative(F(i), F(SUC(i), x), atreal(x)))))
      #|  (nth_diff_strong : (Num, (Real) -> Real, Real) -> Bool)((n : Num), (f : (Real) -> Real), (x : Real)) == (\226\136\131 s : (Real) -> Bool, real_open(s) && IN(x, s) && nth_differentiable_on(n, s, f))
      #|  (nth_diff_strong_int : (Num, (Real, Real), (Real) -> Real) -> Bool)((n : Num), (int : (Real, Real)), (f : (Real) -> Real)) == (\226\136\128 x : Real, interval_arith(x, int) \226\134\146 nth_diff_strong(n, f, x))
      #|  derivative == real_derivative
      #|  derivative((f : (Real) -> Real), (x : Real)) == (d : Real)
      #|  (\226\136\131 d : Real, has_real_derivative((f : (Real) -> Real), d, atreal((x : Real)))) \226\134\146 has_real_derivative(f, derivative(f, x), atreal(x))
      #|  real_differentiable((f : (Real) -> Real), atreal((x : Real))) \226\134\146 has_real_derivative(f, derivative(f, x), atreal(x))
      #|  has_real_derivative((f : (Real) -> Real), (f' : Real), atreal((x : Real))) \226\134\146 derivative(f, x) == f'
      #|  (\226\136\128 x : Real, IN(x, (s : (Real) -> Bool)) \226\134\146 has_real_derivative((f : (Real) -> Real), (f' : (Real) -> Real)(x), atreal(x))) \226\134\146 (\226\136\128 x : Real, IN(x, s) \226\134\146 f'(x) == derivative(f, x))
      #|  (f' : (_) -> _)((x : _))
      #|  real_differentiable((f : (Real) -> Real), atreal((x : Real))) && derivative(f, x) == (f' : Real) \226\134\146 has_real_derivative(f, f', atreal(x))
      #|  nth_derivative(0, (f : (Real) -> Real)) == f
      #|  nth_derivative(SUC((n : Num)), (f : (Real) -> Real)) == derivative(nth_derivative(n, f))
      #|  nth_derivative(SUC((n : Num)), (f : (Real) -> Real)) == nth_derivative(n, derivative(f))
      #|  nth_derivative(1, (f : (Real) -> Real)) == derivative(f)
      #|  2 == SUC(SUC(0))
      #|  nth_derivative(2, (f : (Real) -> Real)) == derivative(derivative(f))
      #|  nth_derivative((n : Num), nth_derivative((m : Num), (f : (Real) -> Real))) == nth_derivative(n + m, f)
      #|  nth_differentiable((n : Num), (f : (Real) -> Real), (x : Real)) \226\134\146 real_continuous(f, atreal(x))
      #|  nth_differentiable((n : Num), (f : (Real) -> Real), (x : Real)) \226\134\146 (\226\136\128 i : Num, i < n \226\134\146 has_real_derivative(nth_derivative(i, f), nth_derivative(SUC(i), f, x), atreal(x)))
      #|  nth_differentiable_on((n : Num), (s : (Real) -> Bool), (f : (Real) -> Real)) \226\134\146 (\226\136\128 x : Real, IN(x, s) \226\134\146 (\226\136\128 i : Num, i < n \226\134\146 has_real_derivative(nth_derivative(i, f), nth_derivative(SUC(i), f, x), atreal(x))))
      #|  nth_derivative(SUC((n : Num)), (f : (Real) -> Real), (x : Real))
      #|  nth_differentiable((n : Num), (f : (Real) -> Real), (x : Real)) == (real_continuous(f, atreal(x)) && (\226\136\128 i : Num, i < n \226\134\146 has_real_derivative(nth_derivative(i, f), nth_derivative(SUC(i), f, x), atreal(x))))
      #|  2 == SUC(1)
      #|  nth_derivative(2, (f : (Real) -> Real))
      #|  derivative((f : (Real) -> Real))
      #|  nth_differentiable_on_int(2, (int : (Real, Real)), (f : (Real) -> Real)) \226\134\146 (\226\136\131 f' : (Real) -> Real, \226\136\131 f'' : (Real) -> Real, f' == derivative(f) && f'' == nth_derivative(2, f) && (\226\136\128 x : Real, interval_arith(x, int) \226\134\146 has_real_derivative(f, f'(x), atreal(x)) && has_real_derivative(f', f''(x), atreal(x))))
      #|  2
      #|  2
      #|  2
      #|  2
      #|  2
      #|  (n : Num) <= (m : Num) \226\134\146 nth_differentiable(m, (f : (Real) -> Real), (x : Real)) \226\134\146 nth_differentiable(n, f, x)
      #|  nth_differentiable(1, (f : (Real) -> Real), (x : Real)) == real_differentiable(f, atreal(x))
      #|  0 < (n : Num) \226\134\146 nth_differentiable(n, (f : (Real) -> Real), (x : Real)) \226\134\146 real_differentiable(f, atreal(x))
      #|  nth_derivative(SUC((i : Num)), (f : (Real) -> Real), (x : Real))
      #|  nth_differentiable((n : Num), (f : (Real) -> Real), (x : Real)) \226\134\146 (i : Num) < n \226\134\146 real_continuous(nth_derivative(i, f), atreal(x))
      #|  nth_differentiable((n : Num), (f : (Real) -> Real), (x : Real)) \226\134\146 (i : Num) < n \226\134\146 nth_differentiable(n - i, nth_derivative(i, f), x)
      #|  nth_diff_strong((n : Num), (f : (Real) -> Real), (x : Real)) \226\134\146 nth_differentiable(n, f, x)
      #|  (x : _) => x
      #|  real_of_num(0) < (x : Real) \226\134\146 has_real_derivative(abs, real_of_num(1), atreal(x))
      #|  -(x : Real)
      #|  (x : Real) => -x
      #|  (x : Real) < real_of_num(0) \226\134\146 has_real_derivative(abs, -real_of_num(1), atreal(x))
      #|  derivative((x : Real) => x) == ((x : Real) => real_of_num(1))
      #|  derivative((x : Real) => (c : Real)) == ((x : Real) => real_of_num(0))
      #|  real_of_num(0) < (x : Real) \226\134\146 derivative(abs, x) == real_of_num(1)
      #|  (x : Real) < real_of_num(0) \226\134\146 derivative(abs, x) == -real_of_num(1)
      #|  pow((x : Real), (n : Num) - 1)
      #|  derivative((x : Real) => pow(x, (n : Num))) == ((x : Real) => real_of_num(n) * pow(x, n - 1))
      #|  2 - 1 == 1
      #|  derivative((x : Real) => pow(x, 2)) == ((x : Real) => real_of_num(2) * x)
      #|  3 - 1 == 2
      #|  derivative((x : Real) => pow(x, 3)) == ((x : Real) => real_of_num(3) * pow(x, 2))
      #|  !((x : Real) == real_of_num(0)) \226\134\146 derivative(inv, x) == -inv(x * x)
      #|  derivative(atn) == ((x : Real) => inv(real_of_num(1) + x * x))
      #|  derivative(exp) == exp
      #|  real_of_num(0) < (x : Real) \226\134\146 derivative(log, x) == inv(x)
      #|  derivative(sin) == cos
      #|  derivative(cos) == ((x : Real) => -sin(x))
      #|  abs((x : Real)) < real_of_num(1) \226\134\146 derivative(asn, x) == inv(sqrt(real_of_num(1) - x * x))
      #|  abs((x : Real)) < real_of_num(1) \226\134\146 derivative(acs, x) == -inv(sqrt(real_of_num(1) - x * x))
      #|  real_of_num(0) < (x : Real) \226\134\146 derivative(sqrt, x) == inv(real_of_num(2) * sqrt(x))
      #|  derivative(matan, (x : Real)) == dmatan(x)
      #|  inv((_1 : Real)) - (_2 : Real)
      #|  -real_of_num(1) < (x : Real) \226\134\146 real_differentiable(matan, atreal(x))
      #|  (x : Real) < real_of_num(1)
      #|  derivative((f : (Real) -> Real), (x : Real))
      #|  real_differentiable((f : (Real) -> Real), atreal((x : Real))) \226\134\146 real_differentiable((g : (Real) -> Real), atreal(f(x))) \226\134\146 derivative((x : Real) => g(f(x)), x) == derivative(f, x) * derivative(g, f(x))
      #|  derivative((g : (Real) -> Real))
      #|  (y : _) => y == (f : (_) -> _)((x : _))
      #|  !((x : Real) == real_of_num(0)) \226\134\146 real_differentiable(inv, atreal(x))
      #|  (x : Real) => x
      #|  !(P : Bool) == (P == false)
      #|  real_of_num(1)
      #|  real_of_num(0) < (x : Real) \226\134\146 real_differentiable(abs, atreal(x))
      #|  -real_of_num(1)
      #|  (x : Real) < real_of_num(0) \226\134\146 real_differentiable(abs, atreal(x))
      #|  :(Real) -> Real
      #|  :Real
      #|  real_differentiable((f : (Real) -> Real), atreal((x : Real)))
      #|  real_of_num(0) < (f : (Real) -> Real)((x : Real)) \226\134\146 real_differentiable((x : Real) => abs(f(x)), atreal(x)) && derivative((x : Real) => abs(f(x)), x) == derivative(f, x)
      #|  real_abs
      #|  (f : (Real) -> Real)((x : Real)) < real_of_num(0) \226\134\146 real_differentiable((x : Real) => abs(f(x)), atreal(x)) && derivative((x : Real) => abs(f(x)), x) == -derivative(f, x)
      #|  real_abs
      #|  real_differentiable((x : Real) => pow((f : (Real) -> Real)(x), (n : Num)), atreal((x : Real))) && derivative((x : Real) => pow(f(x), n), x) == real_of_num(n) * (pow(f(x), n - 1) * derivative(f, x))
      #|  2 - 1 == 1
      #|  real_differentiable((x : Real) => pow((f : (Real) -> Real)(x), 2), atreal((x : Real))) && derivative((x : Real) => pow(f(x), 2), x) == real_of_num(2) * (f(x) * derivative(f, x))
      #|  3 - 1 == 2
      #|  real_differentiable((x : Real) => pow((f : (Real) -> Real)(x), 3), atreal((x : Real))) && derivative((x : Real) => pow(f(x), 3), x) == real_of_num(3) * (pow(f(x), 2) * derivative(f, x))
      #|  real_differentiable((x : Real) => atn((f : (Real) -> Real)(x)), atreal((x : Real))) && derivative((x : Real) => atn(f(x)), x) == derivative(f, x) / (real_of_num(1) + f(x) * f(x))
      #|  atn
      #|  real_differentiable((x : Real) => exp((f : (Real) -> Real)(x)), atreal((x : Real))) && derivative((x : Real) => exp(f(x)), x) == exp(f(x)) * derivative(f, x)
      #|  exp
      #|  real_of_num(0) < (f : (Real) -> Real)((x : Real)) \226\134\146 real_differentiable((x : Real) => log(f(x)), atreal(x)) && derivative((x : Real) => log(f(x)), x) == derivative(f, x) / f(x)
      #|  log
      #|  real_differentiable((x : Real) => cos((f : (Real) -> Real)(x)), atreal((x : Real))) && derivative((x : Real) => cos(f(x)), x) == -(sin(f(x)) * derivative(f, x))
      #|  cos
      #|  real_differentiable((x : Real) => sin((f : (Real) -> Real)(x)), atreal((x : Real))) && derivative((x : Real) => sin(f(x)), x) == cos(f(x)) * derivative(f, x)
      #|  sin
      #|  !((f : (Real) -> Real)((x : Real)) == real_of_num(0)) \226\134\146 real_differentiable((x : Real) => inv(f(x)), atreal(x)) && derivative((x : Real) => inv(f(x)), x) == -inv(f(x) * f(x)) * derivative(f, x)
      #|  real_of_num(0) < (f : (Real) -> Real)((x : Real)) \226\134\146 real_differentiable((x : Real) => sqrt(f(x)), atreal(x)) && derivative((x : Real) => sqrt(f(x)), x) == derivative(f, x) / (real_of_num(2) * sqrt(f(x)))
      #|  sqrt
      #|  abs((f : (Real) -> Real)((x : Real))) < real_of_num(1) \226\134\146 real_differentiable((x : Real) => acs(f(x)), atreal(x)) && derivative((x : Real) => acs(f(x)), x) == -(derivative(f, x) / sqrt(real_of_num(1) - f(x) * f(x)))
      #|  acs
      #|  abs((f : (Real) -> Real)((x : Real))) < real_of_num(1) \226\134\146 real_differentiable((x : Real) => asn(f(x)), atreal(x)) && derivative((x : Real) => asn(f(x)), x) == derivative(f, x) / sqrt(real_of_num(1) - f(x) * f(x))
      #|  asn
      #|  -real_of_num(1) < (f : (Real) -> Real)((x : Real)) \226\134\146 real_differentiable((x : Real) => matan(f(x)), atreal(x)) && derivative((x : Real) => matan(f(x)), x) == dmatan(f(x)) * derivative(f, x)
      #|  matan
      #|  :(Real) -> Real
      #|  :(Real) -> Real
      #|  :Real
      #|  :Real
      #|  real_differentiable((f : (Real) -> Real), atreal((x : Real)))
      #|  derivative((x : Real) => (c : Real) * (f : (Real) -> Real)(x), (x : Real)) == c * derivative(f, x)
      #|  derivative((x : Real) => -(f : (Real) -> Real)(x), (x : Real)) == -derivative(f, x)
      #|  derivative((x : Real) => pow((f : (Real) -> Real)(x), (n : Num)), (x : Real)) == real_of_num(n) * (pow(f(x), n - 1) * derivative(f, x))
      #|  real_differentiable((g : (Real) -> Real), atreal((x : Real)))
      #|  derivative((x : Real) => (f : (Real) -> Real)(x) + (g : (Real) -> Real)(x), (x : Real)) == derivative(f, x) + derivative(g, x)
      #|  derivative((x : Real) => (f : (Real) -> Real)(x) * (g : (Real) -> Real)(x), (x : Real)) == f(x) * derivative(g, x) + derivative(f, x) * g(x)
      #|  derivative((x : Real) => (f : (Real) -> Real)(x) - (g : (Real) -> Real)(x), (x : Real)) == derivative(f, x) - derivative(g, x)
      #|  !((g : (Real) -> Real)((x : Real)) == real_of_num(0)) \226\134\146 derivative((x : Real) => (f : (Real) -> Real)(x) / g(x), x) == (derivative(f, x) * g(x) - f(x) * derivative(g, x)) / (g(x) * g(x))
      #|  (\226\136\128 i : Num, IN(i, op_dot_dot((n : Num), (m : Num))) \226\134\146 real_differentiable((G : (Num, Real) -> Real)(i), atreal((x : Real)))) \226\134\146 real_differentiable((x : Real) => sum(op_dot_dot(n, m), (i : Num) => G(i, x)), atreal(x))
      #|  (n : Num) == 0
      #|  (n : Num) <= SUC((m : Num))
      #|  (n : Num) == 0
      #|  (\226\136\128 i : Num, IN(i, op_dot_dot((n : Num), (m : Num))) \226\134\146 real_differentiable((G : (Num, Real) -> Real)(i), atreal((x : Real)))) \226\134\146 derivative((x : Real) => sum(op_dot_dot(n, m), (i : Num) => G(i, x)), x) == sum(op_dot_dot(n, m), (i : Num) => derivative(G(i), x))
      #|  (n : Num) <= SUC((m : Num))
      #|  real_of_num(1)
      #|  has_real_derivative((g : (Real) -> Real), (g' : Real), atreal((x : Real))) && (\226\136\131 s : (Real) -> Bool, real_open(s) && IN(x, s) && (\226\136\128 y : Real, IN(y, s) \226\134\146 (f : (Real) -> Real)(y) == g(y))) \226\134\146 has_real_derivative(f, g', atreal(x))
      #|  true
      #|  true
      #|  true
      #|  true
      #|  true
      #|  true
      #|  real_differentiable((g : (Real) -> Real), atreal((x : Real))) && real_open((s : (Real) -> Bool)) && IN(x, s) && (\226\136\128 y : Real, IN(y, s) \226\134\146 (f : (Real) -> Real)(y) == g(y)) \226\134\146 real_differentiable(f, atreal(x))
      #|  :(Real) -> Real
      #|  :(Real) -> Real
      #|  :(Real, Real)
      #|  :Num
      #|  nth_diff_strong_int((n : Num), (int : (Real, Real)), (f : (Real) -> Real))
      #|  INTER((s : (_) -> Bool), (t : (_) -> Bool))
      #|  (y : Real) => (c : Real) * nth_derivative((i : Num), (f : (Real) -> Real), y)
      #|  INTER((s : (_) -> Bool), (t : (_) -> Bool))
      #|  interval_arith((x : Real), (int : (Real, Real))) \226\134\146 (i : Num) <= (n : Num) \226\134\146 (\226\136\131 s : (Real) -> Bool, real_open(s) && IN(x, s) && (\226\136\128 y : Real, IN(y, s) \226\134\146 nth_derivative(i, (y : Real) => (c : Real) * (f : (Real) -> Real)(y), y) == c * nth_derivative(i, f, y)))
      #|  INTERS(IMAGE((i : Num) => select((P : (Num, (_) -> Bool) -> Bool)(i)), op_dot_dot(0, (n : Num))))
      #|  \226\136\128 i : Num, i <= (n : Num) \226\134\146 (P : (Num, _) -> Bool)(i, select(P(i)))
      #|  (i : Num) => (s : (Real) -> Bool) => real_open(s) && IN((x : Real), s) && (\226\136\128 y : Real, IN(y, s) \226\134\146 nth_derivative(i, (y : Real) => (c : Real) * (f : (Real) -> Real)(y), y) == c * nth_derivative(i, f, y))
      #|  interval_arith((x : Real), (int : (Real, Real))) \226\134\146 (\226\136\131 s : (Real) -> Bool, real_open(s) && IN(x, s) && (\226\136\128 i : Num, \226\136\128 y : Real, i <= (n : Num) && IN(y, s) \226\134\146 nth_derivative(i, (y : Real) => (c : Real) * (f : (Real) -> Real)(y), y) == c * nth_derivative(i, f, y)))
      #|  select((P : (_, _) -> Bool)((i : _)))
      #|  interval_arith((x : Real), (int : (Real, Real))) \226\134\146 (i : Num) <= (n : Num) \226\134\146 nth_derivative(i, (x : Real) => (c : Real) * (f : (Real) -> Real)(x), x) == c * nth_derivative(i, f, x)
      #|  (y : Real) => (c : Real) * nth_derivative((i : Num), (f : (Real) -> Real), y)
      #|  INTER((s : (_) -> Bool), (t : (_) -> Bool))
      #|  nth_diff_strong_int((n : Num), (int : (Real, Real)), (x : Real) => (c : Real) * (f : (Real) -> Real)(x))
      #|  nth_diff_strong_int((n : Num), (int : (Real, Real)), (g : (Real) -> Real))
      #|  INTER((sf : (_) -> Bool), INTER((sg : (_) -> Bool), (t : (_) -> Bool)))
      #|  (y : Real) => nth_derivative((i : Num), (f : (Real) -> Real), y) + nth_derivative(i, (g : (Real) -> Real), y)
      #|  INTER((sf : (_) -> Bool), INTER((sg : (_) -> Bool), (t : (_) -> Bool)))
      #|  interval_arith((x : Real), (int : (Real, Real))) \226\134\146 (i : Num) <= (n : Num) \226\134\146 (\226\136\131 s : (Real) -> Bool, real_open(s) && IN(x, s) && (\226\136\128 y : Real, IN(y, s) \226\134\146 nth_derivative(i, (y : Real) => (f : (Real) -> Real)(y) + (g : (Real) -> Real)(y), y) == nth_derivative(i, f, y) + nth_derivative(i, g, y)))
      #|  INTERS(IMAGE((i : Num) => select((P : (Num, (_) -> Bool) -> Bool)(i)), op_dot_dot(0, (n : Num))))
      #|  \226\136\128 i : Num, i <= (n : Num) \226\134\146 (P : (Num, _) -> Bool)(i, select(P(i)))
      #|  (i : Num) => (s : (Real) -> Bool) => real_open(s) && IN((x : Real), s) && (\226\136\128 y : Real, IN(y, s) \226\134\146 nth_derivative(i, (y : Real) => (f : (Real) -> Real)(y) + (g : (Real) -> Real)(y), y) == nth_derivative(i, f, y) + nth_derivative(i, g, y))
      #|  interval_arith((x : Real), (int : (Real, Real))) \226\134\146 (\226\136\131 s : (Real) -> Bool, real_open(s) && IN(x, s) && (\226\136\128 i : Num, \226\136\128 y : Real, i <= (n : Num) && IN(y, s) \226\134\146 nth_derivative(i, (y : Real) => (f : (Real) -> Real)(y) + (g : (Real) -> Real)(y), y) == nth_derivative(i, f, y) + nth_derivative(i, g, y)))
      #|  select((P : (_, _) -> Bool)((i : _)))
      #|  interval_arith((x : Real), (int : (Real, Real))) \226\134\146 (i : Num) <= (n : Num) \226\134\146 nth_derivative(i, (x : Real) => (f : (Real) -> Real)(x) + (g : (Real) -> Real)(x), x) == nth_derivative(i, f, x) + nth_derivative(i, g, x)
      #|  (y : Real) => nth_derivative((i : Num), (f : (Real) -> Real), y) + nth_derivative(i, (g : (Real) -> Real), y)
      #|  INTER((s : (_) -> Bool), INTER((tf : (_) -> Bool), (tg : (_) -> Bool)))
      #|  nth_diff_strong_int((n : Num), (int : (Real, Real)), (x : Real) => (f : (Real) -> Real)(x) + (g : (Real) -> Real)(x))
      #|  INTER((sf : (_) -> Bool), INTER((sg : (_) -> Bool), (t : (_) -> Bool)))
      #|  (y : Real) => nth_derivative((i : Num), (f : (Real) -> Real), y) - nth_derivative(i, (g : (Real) -> Real), y)
      #|  INTER((sf : (_) -> Bool), INTER((sg : (_) -> Bool), (t : (_) -> Bool)))
      #|  interval_arith((x : Real), (int : (Real, Real))) \226\134\146 (i : Num) <= (n : Num) \226\134\146 (\226\136\131 s : (Real) -> Bool, real_open(s) && IN(x, s) && (\226\136\128 y : Real, IN(y, s) \226\134\146 nth_derivative(i, (y : Real) => (f : (Real) -> Real)(y) - (g : (Real) -> Real)(y), y) == nth_derivative(i, f, y) - nth_derivative(i, g, y)))
      #|  INTERS(IMAGE((i : Num) => select((P : (Num, (_) -> Bool) -> Bool)(i)), op_dot_dot(0, (n : Num))))
      #|  \226\136\128 i : Num, i <= (n : Num) \226\134\146 (P : (Num, _) -> Bool)(i, select(P(i)))
      #|  (i : Num) => (s : (Real) -> Bool) => real_open(s) && IN((x : Real), s) && (\226\136\128 y : Real, IN(y, s) \226\134\146 nth_derivative(i, (y : Real) => (f : (Real) -> Real)(y) - (g : (Real) -> Real)(y), y) == nth_derivative(i, f, y) - nth_derivative(i, g, y))
      #|  interval_arith((x : Real), (int : (Real, Real))) \226\134\146 (\226\136\131 s : (Real) -> Bool, real_open(s) && IN(x, s) && (\226\136\128 i : Num, \226\136\128 y : Real, i <= (n : Num) && IN(y, s) \226\134\146 nth_derivative(i, (y : Real) => (f : (Real) -> Real)(y) - (g : (Real) -> Real)(y), y) == nth_derivative(i, f, y) - nth_derivative(i, g, y)))
      #|  select((P : (_, _) -> Bool)((i : _)))
      #|  interval_arith((x : Real), (int : (Real, Real))) \226\134\146 (i : Num) <= (n : Num) \226\134\146 nth_derivative(i, (x : Real) => (f : (Real) -> Real)(x) - (g : (Real) -> Real)(x), x) == nth_derivative(i, f, x) - nth_derivative(i, g, x)
      #|  (y : Real) => nth_derivative((i : Num), (f : (Real) -> Real), y) - nth_derivative(i, (g : (Real) -> Real), y)
      #|  INTER((s : (_) -> Bool), INTER((tf : (_) -> Bool), (tg : (_) -> Bool)))
      #|  nth_diff_strong_int((n : Num), (int : (Real, Real)), (x : Real) => (f : (Real) -> Real)(x) - (g : (Real) -> Real)(x))
      #|  SUC((i : Num) - (k : Num)) == SUC(i) - k
      #|  binom(((i : Num), SUC(i))) == 0
      #|  0 <= SUC((i : Num))
      #|  (lhs : Real) == (sum1 : Real) + (sum2 : Real)
      #|  sum(op_dot_dot(0, (i : Num) + 1), (k : Num) => real_of_num(binom((i, k))) * (nth_derivative(k, (f : (Real) -> Real), (y : Real)) * nth_derivative(SUC(i) - k, (g : (Real) -> Real), y)))
      #|  sum(op_dot_dot(0 + 1, (i : Num) + 1), (k : Num) => real_of_num(binom((i, k - 1))) * (nth_derivative(k, (f : (Real) -> Real), (y : Real)) * nth_derivative(SUC(i) - k, (g : (Real) -> Real), y)))
      #|  sum(op_dot_dot(0, (i : Num)), (_any : (Num) -> Real))
      #|  \226\136\128 k : Num, IN(k, op_dot_dot(0, (i : Num))) \226\134\146 real_differentiable((y : Real) => real_of_num(binom((i, k))) * (nth_derivative(k, (f : (Real) -> Real), y) * nth_derivative(i - k, (g : (Real) -> Real), y)), atreal((y : Real)))
      #|  nth_derivative(SUC((i : Num) - (k : Num)), (g : (Real) -> Real), (y : Real))
      #|  nth_derivative(SUC((k : Num)), (f : (Real) -> Real), (y : Real))
      #|  \226\136\128 k : Num, IN(k, op_dot_dot(0, (i : Num))) \226\134\146 real_differentiable(nth_derivative(k, (f : (Real) -> Real)), atreal((y : Real))) && real_differentiable(nth_derivative(i - k, (g : (Real) -> Real)), atreal(y))
      #|  INTER((sf : (_) -> Bool), INTER((sg : (_) -> Bool), (t : (_) -> Bool)))
      #|  (y : Real) => sum(op_dot_dot(0, (i : Num)), (k : Num) => real_of_num(binom((i, k))) * (nth_derivative(k, (f : (Real) -> Real), y) * nth_derivative(i - k, (g : (Real) -> Real), y)))
      #|  INTER((sf : (_) -> Bool), INTER((sg : (_) -> Bool), (t : (_) -> Bool)))
      #|  interval_arith((x : Real), (int : (Real, Real))) \226\134\146 (i : Num) <= (n : Num) \226\134\146 (\226\136\131 s : (Real) -> Bool, real_open(s) && IN(x, s) && (\226\136\128 y : Real, IN(y, s) \226\134\146 nth_derivative(i, (y : Real) => (f : (Real) -> Real)(y) * (g : (Real) -> Real)(y), y) == sum(op_dot_dot(0, i), (k : Num) => real_of_num(binom((i, k))) * (nth_derivative(k, f, y) * nth_derivative(i - k, g, y)))))
      #|  INTERS(IMAGE((i : Num) => select((P : (Num, (_) -> Bool) -> Bool)(i)), op_dot_dot(0, (n : Num))))
      #|  \226\136\128 i : Num, i <= (n : Num) \226\134\146 (P : (Num, _) -> Bool)(i, select(P(i)))
      #|  (i : Num) => (s : (Real) -> Bool) => real_open(s) && IN((x : Real), s) && (\226\136\128 y : Real, IN(y, s) \226\134\146 nth_derivative(i, (y : Real) => (f : (Real) -> Real)(y) * (g : (Real) -> Real)(y), y) == sum(op_dot_dot(0, i), (k : Num) => real_of_num(binom((i, k))) * (nth_derivative(k, f, y) * nth_derivative(i - k, g, y))))
      #|  interval_arith((x : Real), (int : (Real, Real))) \226\134\146 (\226\136\131 s : (Real) -> Bool, real_open(s) && IN(x, s) && (\226\136\128 i : Num, \226\136\128 y : Real, i <= (n : Num) && IN(y, s) \226\134\146 nth_derivative(i, (y : Real) => (f : (Real) -> Real)(y) * (g : (Real) -> Real)(y), y) == sum(op_dot_dot(0, i), (k : Num) => real_of_num(binom((i, k))) * (nth_derivative(k, f, y) * nth_derivative(i - k, g, y)))))
      #|  select((P : (_, _) -> Bool)((i : _)))
      #|  interval_arith((x : Real), (int : (Real, Real))) \226\134\146 (i : Num) <= (n : Num) \226\134\146 nth_derivative(i, (x : Real) => (f : (Real) -> Real)(x) * (g : (Real) -> Real)(x), x) == sum(op_dot_dot(0, i), (k : Num) => real_of_num(binom((i, k))) * (nth_derivative(k, f, x) * nth_derivative(i - k, g, x)))
      #|  nth_derivative(SUC((i : Num) - (k : Num)), (g : (Real) -> Real), (y : Real))
      #|  nth_derivative(SUC((k : Num)), (f : (Real) -> Real), (y : Real))
      #|  (y : Real) => sum(op_dot_dot(0, (i : Num)), (k : Num) => real_of_num(binom((i, k))) * (nth_derivative(k, (f : (Real) -> Real), y) * nth_derivative(i - k, (g : (Real) -> Real), y)))
      #|  INTER((s : (_) -> Bool), INTER((tf : (_) -> Bool), (tg : (_) -> Bool)))
      #|  nth_diff_strong_int((n : Num), (int : (Real, Real)), (x : Real) => (f : (Real) -> Real)(x) * (g : (Real) -> Real)(x))
      #|  (lin_approx : ((Real) -> Real, Real, (Real, Real), (Real, Real)) -> Bool)((f : (Real) -> Real), (x : Real), (f_bounds : (Real, Real)), (df_bounds : (Real, Real))) == (interval_arith(f(x), f_bounds) && (\226\136\131 f' : Real, has_real_derivative(f, f', atreal(x)) && interval_arith(f', df_bounds)))
      #|  (has_bounded_second_derivative : ((Real) -> Real, (Real, Real), (Real, Real)) -> Bool)((f : (Real) -> Real), (int : (Real, Real)), (dd_bounds : (Real, Real))) == (nth_diff_strong_int(2, int, f) && bounded_on_int(nth_derivative(2, f), int, dd_bounds))
      #|  (taylor_interval : ((Real) -> Real, Real, Real, Real, Real, (Real, Real), (Real, Real), (Real, Real)) -> Bool)((f : (Real) -> Real), (x : Real), (y : Real), (z : Real), (w : Real), (f_bounds : (Real, Real)), (df_bounds : (Real, Real)), (ddf_bounds : (Real, Real))) == (x <= y && y <= z && y - x <= w && z - y <= w && lin_approx(f, y, f_bounds, df_bounds) && has_bounded_second_derivative(f, (x, z), ddf_bounds))
      #|  nth_diff_strong_int((n : Num), (int : (Real, Real)), (f : (Real) -> Real)) \226\134\146 nth_differentiable_on_int(n, int, f)
      #|  has_bounded_second_derivative((f : (Real) -> Real), (int : (Real, Real)), (dd_bounds : (Real, Real))) \226\134\146 (\226\136\131 f' : (Real) -> Real, \226\136\131 f'' : (Real) -> Real, \226\136\128 x : Real, interval_arith(x, int) \226\134\146 has_real_derivative(f, f'(x), atreal(x)) && has_real_derivative(f', f''(x), atreal(x)) && interval_arith(f''(x), dd_bounds))
      #|  (\226\136\131 x : _, (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)) \226\134\146 (\226\136\131 x : _, P(x))
      #|  ((a : Real) - (b : Real)) / real_of_num(2)
      #|  (\226\136\128 e : Real, real_of_num(0) < e \226\134\146 (a : Real) <= (b : Real) + e) == (a <= b)
      #|  (a : Real) + min((b : Real) - a, (d : Real)) / real_of_num(2)
      #|  (\226\136\131 b : Real, (a : Real) < b && (\226\136\128 x : Real, IN(x, real_interval((a, b))) \226\134\146 (f : (Real) -> Real)(x) <= (c : Real))) && real_continuous(f, atreal(a)) \226\134\146 f(a) <= c
      #|  real_continuous((f : (Real) -> Real), atreal((x : Real))) == real_continuous((x : Real) => f(-x), atreal(-x))
      #|  -(y : Real)
      #|  -(a : Real)
      #|  \226\136\128 x : Real, (f : (Real) -> _)(x) == (g : (Real) -> _)(-x)
      #|  (x : Real) => (f : (Real) -> _)(-x)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, (a <= b) == (a == b || a < b)
      #|  (a : Real) < (b : Real) \226\134\146 real_continuous((f : (Real) -> Real), atreal(a)) \226\134\146 real_continuous(f, atreal(b)) \226\134\146 (\226\136\128 x : Real, IN(x, real_interval((a, b))) \226\134\146 f(x) <= (c : Real)) \226\134\146 (\226\136\128 x : Real, IN(x, real_interval([(a, b)])) \226\134\146 f(x) <= c)
      #|  -(y : Real)
      #|  (p : (_, _)) == (FST(p), SND(p))
      #|  interval_arith((a : Real), ((lo : Real), (hi : Real))) \226\134\146 iabs((lo, hi)) == max(abs(lo), abs(hi))
      #|  interval_arith((a : Real), ((lo : Real), (hi : Real))) \226\134\146 real_of_num(0) <= iabs((lo, hi))
      #|  :(Real) -> Real
      #|  :Real
      #|  :Real
      #|  :Real
      #|  :Real
      #|  :(Real, Real)
      #|  :(Real, Real)
      #|  :(Real, Real)
      #|  :Real
      #|  (dd_bound : Real) == iabs((ddf_bounds : (Real, Real)))
      #|  taylor_interval((f : (Real) -> Real), (x : Real), (y : Real), (z : Real), (w : Real), (f_bounds : (Real, Real)), (df_bounds : (Real, Real)), (ddf_bounds : (Real, Real)))
      #|  (f' : (_) -> _)((t : _))
      #|  \226\136\128 t : Real, IN(t, real_interval([((x : Real), (z : Real))])) \226\134\146 real_continuous((f : (Real) -> Real), atreal(t))
      #|  FACT(1) == 1 && FACT(1 + 1) == 2
      #|  0 <= 1 && !(1 == 0)
      #|  ((i : Num) <= 1) == (i == 0 || i == 1)
      #|  0 + 1 == 1 && !(1 == 0) && 1 + 1 == 2 && !(2 == 1) && !(2 == 1) && !(2 == 0)
      #|  (i : Num) => if i == 0 { (f : (_) -> _) } else { if i == 1 { (f' : (_) -> _) } else { if i == 2 { (f'' : (_) -> _) } else { I } } }
      #|  1 + 1 == 2
      #|  (ff : _) == (f' : (_) -> _)((y : _))
      #|  \226\136\128 a : Real, \226\136\128 b : Real, a - b == a - (b + (b1 : Real)) + b1
      #|  abs((f : (_) -> Real)((t : _)) - (f((y : _)) + (b1 : Real))) + abs(b1)
      #|  (dd_bound : Real) * (_any : Real)
      #|  (f' : (_) -> Real)((y : _)) * (_any : Real)
      #|  abs((f : (Real) -> Real)((t : Real)) - (f((y : Real)) + (f' : (Real) -> Real)(y) * pow(t - y, 1))) <= (dd_bound : Real) * (pow(abs(t - y), 1 + 1) / real_of_num(2))
      #|  real_of_num(0) <= (dd_bound : Real) && (\226\136\128 p : Real, IN(p, real_interval([((x : Real), (z : Real))])) \226\134\146 abs((f'' : (Real) -> Real)(p)) <= dd_bound)
      #|  interval_arith((y : Real), ((x : Real), (z : Real)))
      #|  abs((t : Real) - (y : Real)) <= (w : Real)
      #|  (x : Real) <= (t : Real) && t <= (z : Real) \226\134\146 abs((f : (Real) -> Real)(t) - f((y : Real))) <= (w : Real) * iabs((df_bounds : (Real, Real))) + w * (w * ((dd_bound : Real) / real_of_num(2)))
      #|  1
      #|  real_interval([((x : Real), (z : Real))])
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  \226\136\128 t : Real, (x : Real) <= t && t <= (z : Real) \226\134\146 (f : (Real) -> Real)(t) <= SND((f_bounds : (_, Real))) + ((w : Real) * iabs((df_bounds : (Real, Real))) + w * (w * ((dd_bound : Real) / real_of_num(2))))
      #|  \226\136\128 t : Real, (x : Real) <= t && t <= (z : Real) \226\134\146 FST((f_bounds : (Real, _))) - ((w : Real) * iabs((df_bounds : (Real, Real))) + w * (w * ((dd_bound : Real) / real_of_num(2)))) <= (f : (Real) -> Real)(t)
      #|  (dd_bound : Real) * abs((t : Real) - (y : Real))
      #|  FACT(1) == 1
      #|  ((i : Num) <= 0) == (i == 0)
      #|  0 + 1 == 1 && !(1 == 0) && 1 + 1 == 2 && !(2 == 1) && !(2 == 1) && !(2 == 0)
      #|  (i : Num) => if i == 0 { (f' : (_) -> _) } else { if i == 1 { (f'' : (_) -> _) } else { I } }
      #|  real_of_num(0) <= (dd_bound : Real) && (\226\136\128 p : Real, IN(p, real_interval([((x : Real), (z : Real))])) \226\134\146 abs((f'' : (Real) -> Real)(p)) <= dd_bound)
      #|  \226\136\128 p : Real, (x : Real) <= p && p <= (z : Real) \226\134\146 derivative((f : (Real) -> Real), p) == (f' : (Real) -> Real)(p)
      #|  abs((t : Real) - (y : Real)) <= (w : Real)
      #|  \226\136\128 t : Real, (x : Real) <= t && t <= (z : Real) \226\134\146 abs(derivative((f : (Real) -> Real), t) - derivative(f, (y : Real))) <= (w : Real) * (dd_bound : Real)
      #|  0
      #|  real_interval([((x : Real), (z : Real))])
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  derivative((f : (Real) -> Real), (y : Real)) == (g : Real)
      #|  FST((df_bounds : (Real, Real))) <= derivative((f : (Real) -> Real), (y : Real)) && derivative(f, y) <= SND(df_bounds)
      #|  \226\136\128 t : Real, (x : Real) <= t && t <= (z : Real) \226\134\146 derivative((f : (Real) -> Real), t) <= SND((df_bounds : (_, Real))) + (w : Real) * (dd_bound : Real)
      #|  \226\136\128 t : Real, (x : Real) <= t && t <= (z : Real) \226\134\146 FST((df_bounds : (Real, _))) - (w : Real) * (dd_bound : Real) <= derivative((f : (Real) -> Real), t)
      #|  :(Real) -> Real
      #|  :(Real, Real)
      #|  :(Real, Real)
      #|  :Real
      #|  lin_approx((f : (Real) -> Real), (x : Real), (f_bounds : (Real, Real)), (df_bounds : (Real, Real))) == (real_differentiable(f, atreal(x)) && interval_arith(f(x), f_bounds) && interval_arith(derivative(f, x), df_bounds))
      #|  lin_approx((f : (Real) -> Real), (x : Real), (f_bounds : (Real, Real)), (df_bounds : (Real, Real)))
      #|  interval_arith((f : (_) -> Real)((x : _)), (f_bounds : (Real, Real)))
      #|  interval_arith(derivative((f : (Real) -> Real), (x : Real)), (df_bounds : (Real, Real)))
      #|  real_differentiable((f : (Real) -> Real), atreal((x : Real)))
      #|  :(Real) -> Real
      #|  :(Real) -> Real
      #|  :Real
      #|  :(Real, Real)
      #|  :(Real, Real)
      #|  :(Real, Real)
      #|  :(Real, Real)
      #|  interval_arith((x : Real), (int : (Real, Real))) \226\134\146 interval_not_zero(int) \226\134\146 !(x == real_of_num(0))
      #|  interval_arith((x : Real), (int : (Real, Real))) \226\134\146 interval_pos(int) \226\134\146 real_of_num(0) < x
      #|  interval_arith((x : Real), (int : (Real, Real))) \226\134\146 interval_neg(int) \226\134\146 x < real_of_num(0)
      #|  interval_arith((x : Real), (int : (Real, Real))) \226\134\146 iabs(int) < (y : Real) \226\134\146 abs(x) < y
      #|  lin_approx((x : Real) => x, (x : Real), (x, x), (real_of_num(1), real_of_num(1)))
      #|  lin_approx((x : Real) => (c : Real), (x : Real), (c, c), (real_of_num(0), real_of_num(0)))
      #|  lin_approx((f : (Real) -> Real), (x : Real), (f_bounds : (Real, Real)), (df_bounds : (Real, Real)))
      #|  real_differentiable((x : Real) => atn((f : (Real) -> Real)(x)), atreal((x : Real))) && derivative((x : Real) => atn(f(x)), x) == derivative(f, x) / (real_of_num(1) + f(x) * f(x))
      #|  real_differentiable((x : Real) => exp((f : (Real) -> Real)(x)), atreal((x : Real))) && derivative((x : Real) => exp(f(x)), x) == exp(f(x)) * derivative(f, x)
      #|  real_of_num(0) < (f : (_) -> Real)((x : _))
      #|  interval_pos((f_bounds : (Real, _))) \226\134\146 real_differentiable((x : Real) => log((f : (Real) -> Real)(x)), atreal((x : Real))) && derivative((x : Real) => log(f(x)), x) == derivative(f, x) / f(x)
      #|  real_differentiable((x : Real) => cos((f : (Real) -> Real)(x)), atreal((x : Real))) && derivative((x : Real) => cos(f(x)), x) == -(sin(f(x)) * derivative(f, x))
      #|  real_differentiable((x : Real) => sin((f : (Real) -> Real)(x)), atreal((x : Real))) && derivative((x : Real) => sin(f(x)), x) == cos(f(x)) * derivative(f, x)
      #|  !((f : (_) -> Real)((x : _)) == real_of_num(0))
      #|  interval_not_zero((f_bounds : (Real, Real))) \226\134\146 real_differentiable((x : Real) => inv((f : (Real) -> Real)(x)), atreal((x : Real))) && derivative((x : Real) => inv(f(x)), x) == -inv(f(x) * f(x)) * derivative(f, x)
      #|  real_of_num(0) < (f : (_) -> Real)((x : _))
      #|  interval_pos((f_bounds : (Real, _))) \226\134\146 real_differentiable((x : Real) => sqrt((f : (Real) -> Real)(x)), atreal((x : Real))) && derivative((x : Real) => sqrt(f(x)), x) == derivative(f, x) / (real_of_num(2) * sqrt(f(x)))
      #|  abs((f : (_) -> Real)((x : _))) < real_of_num(1)
      #|  iabs((f_bounds : (Real, Real))) < real_of_num(1) \226\134\146 real_differentiable((x : Real) => acs((f : (Real) -> Real)(x)), atreal((x : Real))) && derivative((x : Real) => acs(f(x)), x) == -(derivative(f, x) / sqrt(real_of_num(1) - f(x) * f(x)))
      #|  abs((f : (_) -> Real)((x : _))) < real_of_num(1)
      #|  iabs((f_bounds : (Real, Real))) < real_of_num(1) \226\134\146 real_differentiable((x : Real) => asn((f : (Real) -> Real)(x)), atreal((x : Real))) && derivative((x : Real) => asn(f(x)), x) == derivative(f, x) / sqrt(real_of_num(1) - f(x) * f(x))
      #|  -real_of_num(1) < (f : (_) -> Real)((x : _))
      #|  interval_gt(-real_of_num(1), (f_bounds : (Real, _))) \226\134\146 real_differentiable((x : Real) => matan((f : (Real) -> Real)(x)), atreal((x : Real))) && derivative((x : Real) => matan(f(x)), x) == dmatan(f(x)) * derivative(f, x)
      #|  lin_approx((f : (Real) -> Real), (x : Real), (f_bounds : (Real, Real)), (df_bounds : (Real, Real)))
      #|  lin_approx((g : (Real) -> Real), (x : Real), (g_bounds : (Real, Real)), (dg_bounds : (Real, Real)))
      #|  real_differentiable((x : Real) => (f : (Real) -> Real)(x) + (g : (Real) -> Real)(x), atreal((x : Real)))
      #|  real_differentiable((x : Real) => (f : (Real) -> Real)(x) - (g : (Real) -> Real)(x), atreal((x : Real)))
      #|  real_differentiable((x : Real) => (f : (Real) -> Real)(x) * (g : (Real) -> Real)(x), atreal((x : Real)))
      #|  interval_not_zero((g_bounds : (Real, Real))) \226\134\146 real_differentiable((x : Real) => (f : (Real) -> Real)(x) / (g : (Real) -> Real)(x), atreal((x : Real)))
      #|  :(Real) -> Real
      #|  :(Real) -> Real
      #|  :(Real, Real)
      #|  :(Real, Real)
      #|  :Real
      #|  :Real
      #|  :Real
      #|  :Real
      #|  :(Real, Real)
      #|  :Real
      #|  :Real
      #|  :Real
      #|  lin_approx((f1 : (Real) -> Real), (x : Real), (f1_bounds : (Real, Real)), ((df1_lo : Real), (df1_hi : Real)))
      #|  (c : Real) * (df1_hi : Real)
      #|  (c : Real) * (df1_lo : Real)
      #|  (c : Real) * (f1' : Real)
      #|  real_of_num(0) <= (c : Real) \226\134\146 interval_arith(c * (f1 : (Real) -> Real)((x : Real)), (f_bounds : (Real, Real))) && (df_lo : Real) <= c * (df1_lo : Real) && c * (df1_hi : Real) <= (df_hi : Real) \226\134\146 lin_approx((x : Real) => c * f1(x), x, f_bounds, (df_lo, df_hi))
      #|  lin_approx((f2 : (Real) -> Real), (x : Real), (f2_bounds : (Real, Real)), ((df2_lo : Real), (df2_hi : Real)))
      #|  (f1' : Real) + (f2' : Real)
      #|  interval_arith((f1 : (Real) -> Real)((x : Real)) + (f2 : (Real) -> Real)(x), (f_bounds : (Real, Real))) && (df_lo : Real) <= (df1_lo : Real) + (df2_lo : Real) && (df1_hi : Real) + (df2_hi : Real) <= (df_hi : Real) \226\134\146 lin_approx((x : Real) => f1(x) + f2(x), x, f_bounds, (df_lo, df_hi))
      #|  :(Real) -> Real
      #|  :(Real) -> Real
      #|  :(Real, Real)
      #|  :(Real, Real)
      #|  :(Real, Real)
      #|  derivative((f : (Real) -> Real), (y : Real))
      #|  ((i : Num) < 2) == (i == 0 || i == 1)
      #|  nth_diff_strong(2, (f : (Real) -> Real), (x : Real)) == (\226\136\131 s : (Real) -> Bool, real_open(s) && IN(x, s) && (\226\136\128 y : Real, IN(y, s) \226\134\146 has_real_derivative(f, derivative(f, y), atreal(y)) && has_real_derivative(derivative(f), nth_derivative(2, f, y), atreal(y))))
      #|  1
      #|  0
      #|  nth_diff_strong(2, (f : (Real) -> Real), (x : Real)) == (\226\136\131 s : (Real) -> Bool, real_open(s) && IN(x, s) && (\226\136\128 y : Real, IN(y, s) \226\134\146 real_differentiable(f, atreal(y)) && real_differentiable(derivative(f), atreal(y))))
      #|  real_differentiable((f : (Real) -> Real), atreal((g : (_) -> Real)((y : _))))
      #|  nth_diff_strong_int(2, (g_bounds : (Real, Real)), (f : (Real) -> Real)) \226\134\146 real_differentiable((g : (Real) -> Real), atreal((y : Real))) \226\134\146 interval_arith(g(y), g_bounds) \226\134\146 bounded_on_int(f, g_bounds, (f_bounds : (Real, Real))) \226\134\146 interval_arith(derivative(g, y) * derivative(f, g(y)), (d_bounds : (Real, Real))) \226\134\146 lin_approx((x : Real) => f(g(x)), y, f_bounds, d_bounds)
      #|  (x : _) => real_of_num(1)
      #|  real_of_num(0) < (x : Real) \226\134\146 nth_derivative(2, abs, x) == real_of_num(0)
      #|  -(x : Real)
      #|  (x : _) => -real_of_num(1)
      #|  (x : Real) < real_of_num(0) \226\134\146 nth_derivative(2, abs, x) == real_of_num(0)
      #|  real_interval(((y : Real) - abs(y), y + abs(y)))
      #|  (x : _) => real_of_num(1)
      #|  real_interval(((x : Real) - abs(x), x + abs(x)))
      #|  real_of_num(0) < (x : Real) \226\134\146 nth_diff_strong(2, abs, x)
      #|  real_interval(((y : Real) - abs(y), y + abs(y)))
      #|  (x : _) => -real_of_num(1)
      #|  real_interval(((x : Real) - abs(x), x + abs(x)))
      #|  (x : Real) < real_of_num(0) \226\134\146 nth_diff_strong(2, abs, x)
      #|  pow((x : Real), (n : Num) - 1)
      #|  has_real_derivative((x : Real) => pow(x, (n : Num)), real_of_num(n) * pow((x : Real), n - 1), atreal(x))
      #|  (n : Num) - 2 == n - 1 - 1
      #|  derivative(derivative((x : Real) => pow(x, (n : Num)))) == ((x : Real) => real_of_num(n * (n - 1)) * pow(x, n - 2))
      #|  (n : Num) - 2 == n - 1 - 1
      #|  (UNIV : (Real) -> Bool)
      #|  nth_diff_strong(2, (x : Real) => pow(x, (n : Num)), (x : Real))
      #|  2 * (2 - 1) == 2
      #|  derivative(derivative((x : Real) => pow(x, 2))) == ((x : Real) => real_of_num(2))
      #|  3 * (3 - 1) == 6 && 3 - 2 == 1
      #|  derivative(derivative((x : Real) => pow(x, 3))) == ((x : Real) => real_of_num(6) * x)
      #|  real_of_num(2) * (x : Real) == x * real_of_num(1) + real_of_num(1) * x
      #|  has_real_derivative((x : Real) => inv(real_of_num(1) + pow(x, 2)), -real_of_num(2) * (x : Real) * pow(inv(real_of_num(1) + pow(x, 2)), 2), atreal(x))
      #|  real_of_num(2) * (x : Real)
      #|  !(P : Bool) == (P == false)
      #|  derivative(derivative(atn)) == ((x : Real) => -real_of_num(2) * x * pow(inv(real_of_num(1) + pow(x, 2)), 2))
      #|  (UNIV : (Real) -> Bool)
      #|  nth_diff_strong(2, atn, (x : Real))
      #|  nth_derivative(2, cos) == ((x : Real) => -cos(x))
      #|  (UNIV : (Real) -> Bool)
      #|  nth_diff_strong(2, cos, (x : Real))
      #|  nth_derivative(2, sin) == ((x : Real) => -sin(x))
      #|  (UNIV : (Real) -> Bool)
      #|  nth_diff_strong(2, sin, (x : Real))
      #|  nth_derivative(2, exp) == exp
      #|  (UNIV : (Real) -> Bool)
      #|  nth_diff_strong(2, exp, (x : Real))
      #|  real_interval(((x : Real) - abs(x), x + abs(x)))
      #|  \226\136\128 a : Real, -real_of_num(1) * a == -a
      #|  real_of_num(0) < (x : Real) \226\134\146 !(x == real_of_num(0))
      #|  has_real_derivative((x : Real) => inv(x), (f : Real), atreal((x : Real)))
      #|  (x : Real) => inv(x)
      #|  real_of_num(0) < (x : Real) \226\134\146 nth_derivative(2, log, x) == -inv(pow(x, 2))
      #|  !(P : Bool) == (P == false)
      #|  real_interval(((y : Real) - abs(y), y + abs(y)))
      #|  (x : Real) => inv(x)
      #|  real_interval(((x : Real) - abs(x), x + abs(x)))
      #|  real_of_num(0) < (x : Real) \226\134\146 nth_diff_strong(2, log, x)
      #|  real_interval(((x : Real) - abs(x), x + abs(x)))
      #|  \226\136\128 a : Real, real_of_num(2) * (x : Real) * (inv(x) * a) == real_of_num(2) * (x * inv(x) * a)
      #|  pow((x : Real) * x, 2) == x * pow(x, 3)
      #|  has_real_derivative((x : Real) => -inv(x * x), (f : Real), atreal((x : Real)))
      #|  (x : Real) => -inv(x * x)
      #|  !((x : Real) == real_of_num(0)) \226\134\146 nth_derivative(2, inv, x) == real_of_num(2) * inv(pow(x, 3))
      #|  !(P : Bool) == (P == false)
      #|  real_interval(((y : Real) - abs(y), y + abs(y)))
      #|  (x : Real) => -inv(x * x)
      #|  real_interval(((x : Real) - abs(x), x + abs(x)))
      #|  !((x : Real) == real_of_num(0)) \226\134\146 nth_diff_strong(2, inv, x)
      #|  pow(sqrt((x : Real)), (n : Num)) == sqrt(pow(x, n))
      #|  real_interval((real_of_num(0), (x : Real) + real_of_num(1)))
      #|  SUC(2) == 3
      #|  pow(real_of_num(2), 2) == real_of_num(4)
      #|  !(real_of_num(2) * sqrt((x : Real)) == real_of_num(0))
      #|  has_real_derivative((x : Real) => inv(real_of_num(2) * sqrt(x)), (f : Real), atreal((x : Real)))
      #|  (x : Real) => inv(real_of_num(2) * sqrt(x))
      #|  real_of_num(0) < (x : Real) \226\134\146 nth_derivative(2, sqrt, x) == -inv(real_of_num(4) * sqrt(pow(x, 3)))
      #|  !(P : Bool) == (P == false)
      #|  real_interval((real_of_num(0), (y : Real) + real_of_num(1)))
      #|  (x : Real) => inv(real_of_num(2) * sqrt(x))
      #|  real_interval((real_of_num(0), (x : Real) + real_of_num(1)))
      #|  real_of_num(0) < (x : Real) \226\134\146 nth_diff_strong(2, sqrt, x)
      #|  pow((x : Real), SUC((n : Num))) == x * pow(x, n)
      #|  real_interval(((x : Real) - (e : Real), x + e))
      #|  real_of_num(1) - abs((x : Real))
      #|  SUC(2) == 3
      #|  \226\136\128 a : Real, real_of_num(2) * (x : Real) * (inv(real_of_num(2)) * a) == real_of_num(2) * inv(real_of_num(2)) * (x * a)
      #|  real_of_num(1) - (x : Real) * x == (real_of_num(1) - x) * (real_of_num(1) + x)
      #|  real_of_num(0) < real_of_num(1) - (x : Real) * x
      #|  real_of_num(0) < real_of_num(1) - (x : Real) * x && !(sqrt(real_of_num(1) - x * x) == real_of_num(0))
      #|  has_real_derivative((x : Real) => -inv(sqrt(real_of_num(1) - x * x)), (f : Real), atreal((x : Real)))
      #|  (x : Real) => -inv(sqrt(real_of_num(1) - x * x))
      #|  abs((x : Real)) < real_of_num(1) \226\134\146 nth_derivative(2, acs, x) == -(x / sqrt(pow(real_of_num(1) - x * x, 3)))
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  ((x : Real) => sqrt(real_of_num(1) - x * x)) == o(sqrt, (x : Real) => real_of_num(1) - x * x)
      #|  real_of_num(1) - (y : Real) * y == (real_of_num(1) - y) * (real_of_num(1) + y)
      #|  real_of_num(0) < real_of_num(1) - (y : Real) * y
      #|  real_interval(((y : Real) - (e2 : Real), y + e2))
      #|  (x : Real) => -inv(sqrt(real_of_num(1) - x * x))
      #|  real_of_num(1) - abs((y : Real))
      #|  real_interval(((x : Real) - (e : Real), x + e))
      #|  real_of_num(1) - abs((x : Real))
      #|  abs((x : Real)) < real_of_num(1) \226\134\146 nth_diff_strong(2, acs, x)
      #|  !(P : Bool) == (P == false)
      #|  real_interval(((x : Real) - (e : Real), x + e))
      #|  real_of_num(1) - abs((x : Real))
      #|  SUC(2) == 3
      #|  \226\136\128 a : Real, real_of_num(2) * (x : Real) * (inv(real_of_num(2)) * a) == real_of_num(2) * inv(real_of_num(2)) * (x * a)
      #|  real_of_num(1) - (x : Real) * x == (real_of_num(1) - x) * (real_of_num(1) + x)
      #|  real_of_num(0) < real_of_num(1) - (x : Real) * x
      #|  real_of_num(0) < real_of_num(1) - (x : Real) * x && !(sqrt(real_of_num(1) - x * x) == real_of_num(0))
      #|  has_real_derivative((x : Real) => inv(sqrt(real_of_num(1) - x * x)), (f : Real), atreal((x : Real)))
      #|  (x : Real) => inv(sqrt(real_of_num(1) - x * x))
      #|  abs((x : Real)) < real_of_num(1) \226\134\146 nth_derivative(2, asn, x) == x / sqrt(pow(real_of_num(1) - x * x, 3))
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  ((x : Real) => sqrt(real_of_num(1) - x * x)) == o(sqrt, (x : Real) => real_of_num(1) - x * x)
      #|  real_of_num(1) - (y : Real) * y == (real_of_num(1) - y) * (real_of_num(1) + y)
      #|  real_of_num(0) < real_of_num(1) - (y : Real) * y
      #|  real_interval(((y : Real) - (e2 : Real), y + e2))
      #|  (x : Real) => inv(sqrt(real_of_num(1) - x * x))
      #|  real_of_num(1) - abs((y : Real))
      #|  real_interval(((x : Real) - (e : Real), x + e))
      #|  real_of_num(1) - abs((x : Real))
      #|  abs((x : Real)) < real_of_num(1) \226\134\146 nth_diff_strong(2, asn, x)
      #|  !(P : Bool) == (P == false)
      #|  nth_derivative(2, matan, (x : Real)) == ddmatan(x)
      #|  (_1 : Real) - (_2 : Real)
      #|  real_interval(((y : Real) - real_of_num(1), y + real_of_num(1)))
      #|  (x : Real) => inv(real_of_num(2) * (x * (x + real_of_num(1)))) - atn(sqrt(x)) / (real_of_num(2) * (x * sqrt(x)))
      #|  real_interval((-real_of_num(1), (y : Real) + real_of_num(1)))
      #|  dmatan
      #|  real_interval((-real_of_num(1), (x : Real) + real_of_num(1)))
      #|  -real_of_num(1) < (x : Real) \226\134\146 nth_diff_strong(2, matan, x)
      #|  (y : Real) < real_of_num(1)
      #|  drop((x : Cart[Real, Unit]))
      #|  lift((x : Real))
      #|  IMAGE(lift, {(x : Real) | IN(x, (s : (Real) -> Bool)) && IN((f : (Real) -> Real)(x), (t : (Real) -> Bool))}) == {(x : Cart[Real, Unit]) | IN(x, IMAGE(lift, s)) && IN(o(lift, o(f, drop), x), IMAGE(lift, t))}
      #|  real_continuous_on((f : (Real) -> Real), (s : (Real) -> Bool)) \226\134\146 real_open(s) \226\134\146 real_open((t : (Real) -> Bool)) \226\134\146 real_open({(x : Real) | IN(x, s) && IN(f(x), t)})
      #|  INTER((t : (_) -> Bool), (s' : (_) -> Bool))
      #|  real_open((s' : (Real) -> Bool))
      #|  {(z : _) | IN(z, (t : (_) -> Bool)) && IN((g : (_) -> _)(z), (s : (_) -> Bool))}
      #|  (x : Real) => derivative((f : (Real) -> Real), (g : (Real) -> Real)(x)) * derivative(g, x)
      #|  nth_diff_strong(2, (g : (Real) -> Real), (x : Real)) \226\134\146 nth_diff_strong(2, (f : (Real) -> Real), g(x)) \226\134\146 nth_derivative(2, (x : Real) => f(g(x)), x) == nth_derivative(2, f, g(x)) * pow(derivative(g, x), 2) + derivative(f, g(x)) * nth_derivative(2, g, x)
      #|  derivative((f : (Real) -> Real))
      #|  INTER((s : (_) -> Bool), (s' : (_) -> Bool))
      #|  (x : Real) => derivative((g : (Real) -> Real), x) * derivative((f : (Real) -> Real), g(x))
      #|  INTER((s : (_) -> Bool), (s' : (_) -> Bool))
      #|  real_open((s' : (Real) -> Bool))
      #|  {(z : _) | IN(z, (s : (_) -> Bool)) && IN((g : (_) -> _)(z), (t : (_) -> Bool))}
      #|  nth_diff_strong(2, (g : (Real) -> Real), (x : Real)) \226\134\146 nth_diff_strong(2, (f : (Real) -> Real), g(x)) \226\134\146 nth_diff_strong(2, (x : Real) => f(g(x)), x)
      #|  derivative((f : (Real) -> Real))
      #|  real_interval(((x : Real) - (d : Real), x + d))
      #|  !((f : (Real) -> Real)((x : Real)) == real_of_num(0)) \226\134\146 real_continuous(f, atreal(x)) \226\134\146 (\226\136\131 s : (Real) -> Bool, real_open(s) && IN(x, s) && (\226\136\128 y : Real, IN(y, s) \226\134\146 !(f(y) == real_of_num(0))))
      #|  abs((f : (_) -> Real)((x : _)))
      #|  real_interval(((x : Real) - (d : Real), x + d))
      #|  (a : Real) < (f : (Real) -> Real)((x : Real)) \226\134\146 real_continuous(f, atreal(x)) \226\134\146 (\226\136\131 s : (Real) -> Bool, real_open(s) && IN(x, s) && (\226\136\128 y : Real, IN(y, s) \226\134\146 a < f(y)))
      #|  (f : (_) -> Real)((x : _)) - (a : Real)
      #|  real_interval(((x : Real) - (d : Real), x + d))
      #|  (f : (Real) -> Real)((x : Real)) < (a : Real) \226\134\146 real_continuous(f, atreal(x)) \226\134\146 (\226\136\131 s : (Real) -> Bool, real_open(s) && IN(x, s) && (\226\136\128 y : Real, IN(y, s) \226\134\146 f(y) < a))
      #|  (a : Real) - (f : (_) -> Real)((x : _))
      #|  :(Real) -> Real
      #|  :Real
      #|  nth_diff_strong(2, (f : (Real) -> Real), (x : Real))
      #|  real_of_num(0) < (f : (Real) -> Real)((x : Real)) \226\134\146 nth_derivative(2, (x : Real) => abs(f(x)), x) == nth_derivative(2, f, x)
      #|  (f : (Real) -> Real)((x : Real)) < real_of_num(0) \226\134\146 nth_derivative(2, (x : Real) => abs(f(x)), x) == -nth_derivative(2, f, x)
      #|  ((x : _) => pow((f : (_) -> Real)(x), (n : Num))) == ((x : _) => (g : (Real) -> Real)(f(x)))
      #|  (x : Real) => pow(x, (n : Num))
      #|  nth_derivative(2, (x : Real) => pow((f : (Real) -> Real)(x), (n : Num)), (x : Real)) == real_of_num(n) * (nth_derivative(2, f, x) * pow(f(x), n - 1) + real_of_num(n - 1) * (pow(f(x), n - 2) * pow(derivative(f, x), 2)))
      #|  2 - 1 == 1
      #|  nth_derivative(2, (x : Real) => pow((f : (Real) -> Real)(x), 2), (x : Real)) == real_of_num(2) * (nth_derivative(2, f, x) * f(x) + pow(derivative(f, x), 2))
      #|  3 - 1 == 2 && 3 - 2 == 1
      #|  nth_derivative(2, (x : Real) => pow((f : (Real) -> Real)(x), 3), (x : Real)) == real_of_num(3) * (nth_derivative(2, f, x) * pow(f(x), 2) + real_of_num(2) * (f(x) * pow(derivative(f, x), 2)))
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, \226\136\128 d : Real, a * (b * (c * d)) == a * (b * c * d)
      #|  (_1 : Real) * pow((_2 : Real), 2)
      #|  (lhs1 : Real) == (rhs1 : Real) && (lhs2 : Real) == (rhs2 : Real) \226\134\146 lhs1 - lhs2 == rhs1 - rhs2
      #|  (_1 : Real) * (_2 : Real)
      #|  (_1 : Real) * (_2 : Real)
      #|  (_1 : Real) * (_2 : Real)
      #|  (_1 : Real) * (_2 : Real)
      #|  nth_derivative(2, (x : Real) => atn((f : (Real) -> Real)(x)), (x : Real)) == (nth_derivative(2, f, x) * (real_of_num(1) + f(x) * f(x)) - real_of_num(2) * (f(x) * pow(derivative(f, x), 2))) / pow(real_of_num(1) + f(x) * f(x), 2)
      #|  (f : (_) -> _)((x : _))
      #|  nth_derivative(2, (x : Real) => cos((f : (Real) -> Real)(x)), (x : Real)) == -(nth_derivative(2, f, x) * sin(f(x)) + cos(f(x)) * pow(derivative(f, x), 2))
      #|  nth_derivative(2, (x : Real) => sin((f : (Real) -> Real)(x)), (x : Real)) == nth_derivative(2, f, x) * cos(f(x)) - sin(f(x)) * pow(derivative(f, x), 2)
      #|  nth_derivative(2, (x : Real) => exp((f : (Real) -> Real)(x)), (x : Real)) == nth_derivative(2, f, x) * exp(f(x)) + exp(f(x)) * pow(derivative(f, x), 2)
      #|  real_of_num(0) < (f : (Real) -> Real)((x : Real)) \226\134\146 nth_derivative(2, (x : Real) => log(f(x)), x) == nth_derivative(2, f, x) / f(x) - pow(derivative(f, x) / f(x), 2)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, \226\136\128 d : Real, a * b * (c * d) == a * (b * c * d)
      #|  3 == SUC(2)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, \226\136\128 d : Real, a == c && b == d \226\134\146 a - b == c - d
      #|  !((f : (Real) -> Real)((x : Real)) == real_of_num(0)) \226\134\146 nth_derivative(2, (x : Real) => inv(f(x)), x) == (real_of_num(2) * pow(derivative(f, x), 2) - nth_derivative(2, f, x) * f(x)) / pow(f(x), 3)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, \226\136\128 d : Real, real_of_num(2) * (a * b) * (inv(real_of_num(4)) * (c * d)) == inv(real_of_num(2)) * c * (a * (b * d))
      #|  3 == SUC(2)
      #|  sqrt(pow((f : (_) -> Real)((x : _)), 3)) == sqrt(f(x)) * f(x)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, \226\136\128 d : Real, a == c && b == d \226\134\146 a - b == c - d
      #|  real_of_num(0) < (f : (Real) -> Real)((x : Real)) \226\134\146 nth_derivative(2, (x : Real) => sqrt(f(x)), x) == (real_of_num(2) * (nth_derivative(2, f, x) * f(x)) - pow(derivative(f, x), 2)) / (real_of_num(4) * sqrt(pow(f(x), 3)))
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, \226\136\128 d : Real, a * b * (c * d) == c * (a * (b * d))
      #|  3 == SUC(2)
      #|  sqrt(pow((y : Real), 3)) == sqrt(y) * y
      #|  \226\136\128 a : Real, real_of_num(1) - a * a == (real_of_num(1) - a) * (real_of_num(1) + a)
      #|  real_of_num(0) <= (y : Real) && real_of_num(0) < y && !(y == real_of_num(0))
      #|  real_of_num(1) - (f : (_) -> Real)((x : _)) * f(x)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, \226\136\128 d : Real, a == c && b == d \226\134\146 a + b == c + d
      #|  abs((f : (Real) -> Real)((x : Real))) < real_of_num(1) \226\134\146 nth_derivative(2, (x : Real) => acs(f(x)), x) == -((nth_derivative(2, f, x) * (real_of_num(1) - f(x) * f(x)) + f(x) * pow(derivative(f, x), 2)) / sqrt(pow(real_of_num(1) - f(x) * f(x), 3)))
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, \226\136\128 d : Real, a * b * (c * d) == c * (a * (b * d))
      #|  3 == SUC(2)
      #|  sqrt(pow((y : Real), 3)) == sqrt(y) * y
      #|  \226\136\128 a : Real, real_of_num(1) - a * a == (real_of_num(1) - a) * (real_of_num(1) + a)
      #|  real_of_num(0) <= (y : Real) && real_of_num(0) < y && !(y == real_of_num(0))
      #|  real_of_num(1) - (f : (_) -> Real)((x : _)) * f(x)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, \226\136\128 d : Real, a == c && b == d \226\134\146 a + b == c + d
      #|  abs((f : (Real) -> Real)((x : Real))) < real_of_num(1) \226\134\146 nth_derivative(2, (x : Real) => asn(f(x)), x) == (nth_derivative(2, f, x) * (real_of_num(1) - f(x) * f(x)) + f(x) * pow(derivative(f, x), 2)) / sqrt(pow(real_of_num(1) - f(x) * f(x), 3))
      #|  -real_of_num(1) < (f : (Real) -> Real)((x : Real)) \226\134\146 nth_derivative(2, (x : Real) => matan(f(x)), x) == nth_derivative(2, f, x) * dmatan(f(x)) + pow(derivative(f, x), 2) * ddmatan(f(x))
      #|  real_of_num(0) < (f : (Real) -> Real)((x : Real)) \226\134\146 nth_diff_strong(2, (x : Real) => abs(f(x)), x)
      #|  (f : (Real) -> Real)((x : Real)) < real_of_num(0) \226\134\146 nth_diff_strong(2, (x : Real) => abs(f(x)), x)
      #|  ((x : _) => pow((f : (_) -> Real)(x), (n : Num))) == ((x : _) => (g : (Real) -> Real)(f(x)))
      #|  (x : Real) => pow(x, (n : Num))
      #|  nth_diff_strong(2, (x : Real) => pow((f : (Real) -> Real)(x), (n : Num)), (x : Real))
      #|  nth_diff_strong(2, (x : Real) => atn((f : (Real) -> Real)(x)), (x : Real))
      #|  nth_diff_strong(2, (x : Real) => cos((f : (Real) -> Real)(x)), (x : Real))
      #|  nth_diff_strong(2, (x : Real) => sin((f : (Real) -> Real)(x)), (x : Real))
      #|  nth_diff_strong(2, (x : Real) => exp((f : (Real) -> Real)(x)), (x : Real))
      #|  real_of_num(0) < (f : (Real) -> Real)((x : Real)) \226\134\146 nth_diff_strong(2, (x : Real) => log(f(x)), x)
      #|  !((f : (Real) -> Real)((x : Real)) == real_of_num(0)) \226\134\146 nth_diff_strong(2, (x : Real) => inv(f(x)), x)
      #|  real_of_num(0) < (f : (Real) -> Real)((x : Real)) \226\134\146 nth_diff_strong(2, (x : Real) => sqrt(f(x)), x)
      #|  abs((f : (Real) -> Real)((x : Real))) < real_of_num(1) \226\134\146 nth_diff_strong(2, (x : Real) => acs(f(x)), x)
      #|  abs((f : (Real) -> Real)((x : Real))) < real_of_num(1) \226\134\146 nth_diff_strong(2, (x : Real) => asn(f(x)), x)
      #|  -real_of_num(1) < (f : (Real) -> Real)((x : Real)) \226\134\146 nth_diff_strong(2, (x : Real) => matan(f(x)), x)
      #|  2 - 1 == 1
      #|  \226\136\128 n : Num, 0 <= SUC(n)
      #|  interval_arith((x : Real), (int : (Real, Real))) && nth_diff_strong_int(2, int, (f : (Real) -> Real)) && nth_diff_strong_int(2, int, (g : (Real) -> Real))
      #|  ((x : _), x)
      #|  nth_diff_strong(2, (f : (Real) -> Real), (x : Real)) \226\134\146 nth_diff_strong(2, (g : (Real) -> Real), x) \226\134\146 nth_derivative(2, (x : Real) => f(x) * g(x), x) == f(x) * nth_derivative(2, g, x) + (real_of_num(2) * (derivative(f, x) * derivative(g, x)) + nth_derivative(2, f, x) * g(x))
      #|  2
      #|  (g : (_) -> Real)((x : _)) * inv(pow(g(x), 2)) == inv(g(x))
      #|  3 == SUC(2)
      #|  (g : (_) -> Real)((x : _)) * inv(pow(g(x), 3)) == inv(pow(g(x), 2))
      #|  \226\136\128 f : (_) -> Real, \226\136\128 g : (_) -> Real, \226\136\128 x : _, (((ddf : Real) * g(x) - f(x) * (ddg : Real)) * g(x) - real_of_num(2) * ((dg : Real) * ((df : Real) * g(x) - f(x) * dg))) * inv(pow(g(x), 3)) == f(x) * ((real_of_num(2) * pow(dg, 2) - ddg * g(x)) * inv(pow(g(x), 3))) + (real_of_num(2) * (df * (-(g(x) * inv(pow(g(x), 3))) * dg)) + ddf * (g(x) * (g(x) * inv(pow(g(x), 3)))))
      #|  (_1 : Real) + (_2 : Real)
      #|  nth_derivative(2, (f : (Real) -> Real), (x : Real))
      #|  nth_derivative(2, (g : (Real) -> Real), (x : Real))
      #|  derivative((f : (Real) -> Real), (x : Real))
      #|  derivative((g : (Real) -> Real), (x : Real))
      #|  !((g : (Real) -> Real)((x : Real)) == real_of_num(0)) \226\134\146 nth_diff_strong(2, (f : (Real) -> Real), x) \226\134\146 nth_diff_strong(2, g, x) \226\134\146 nth_derivative(2, (x : Real) => f(x) / g(x), x) == ((nth_derivative(2, f, x) * g(x) - f(x) * nth_derivative(2, g, x)) * g(x) - real_of_num(2) * (derivative(g, x) * (derivative(f, x) * g(x) - f(x) * derivative(g, x)))) / pow(g(x), 3)
      #|  (g : (_) -> _)((x : _))
      #|  interval_arith((x : Real), (int : (Real, Real))) && nth_diff_strong_int(2, int, (f : (Real) -> Real)) && nth_diff_strong_int(2, int, (g : (Real) -> Real))
      #|  ((x : _), x)
      #|  !((g : (Real) -> Real)((x : Real)) == real_of_num(0)) \226\134\146 nth_diff_strong(2, (f : (Real) -> Real), x) \226\134\146 nth_diff_strong(2, g, x) \226\134\146 nth_diff_strong(2, (x : Real) => f(x) / g(x), x)
      #|  2
      #|  (x : _) => inv((g : (_) -> Real)(x))
      #|  interval_arith((x : Real), (int : (Real, Real))) && nth_diff_strong_int(2, int, (f : (Real) -> Real))
      #|  ((x : _), x)
      #|  nth_diff_strong(2, (f : (Real) -> Real), (x : Real)) \226\134\146 nth_derivative(2, (x : Real) => (c : Real) * f(x), x) == c * nth_derivative(2, f, x)
      #|  2
      #|  interval_arith((x : Real), (int : (Real, Real))) && nth_diff_strong_int(2, int, (f : (Real) -> Real)) && nth_diff_strong_int(2, int, (g : (Real) -> Real))
      #|  ((x : _), x)
      #|  nth_diff_strong(2, (f : (Real) -> Real), (x : Real)) \226\134\146 nth_diff_strong(2, (g : (Real) -> Real), x) \226\134\146 nth_derivative(2, (x : Real) => f(x) + g(x), x) == nth_derivative(2, f, x) + nth_derivative(2, g, x)
      #|  2
      #|  interval_arith((x : Real), (int : (Real, Real))) && nth_diff_strong_int(2, int, (f : (Real) -> Real)) && nth_diff_strong_int(2, int, (g : (Real) -> Real))
      #|  ((x : _), x)
      #|  nth_diff_strong(2, (f : (Real) -> Real), (x : Real)) \226\134\146 nth_diff_strong(2, (g : (Real) -> Real), x) \226\134\146 nth_derivative(2, (x : Real) => f(x) - g(x), x) == nth_derivative(2, f, x) - nth_derivative(2, g, x)
      #|  2
      #|  nth_diff_strong_int(2, (int : (Real, Real)), (g : (Real) -> Real)) \226\134\146 bounded_on_int(g, int, (g_bounds : (Real, Real))) \226\134\146 nth_diff_strong_int(2, g_bounds, (f : (Real) -> Real)) \226\134\146 bounded_on_int((x : Real) => nth_derivative(2, f, g(x)) * pow(derivative(g, x), 2) + derivative(f, g(x)) * nth_derivative(2, g, x), int, (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative((x : Real) => f(g(x)), int, dd_bounds)
      #|  interval_pos((int : (Real, Real))) \226\134\146 bounded_on_int((x : Real) => real_of_num(0), int, (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative(abs, int, dd_bounds)
      #|  interval_neg((int : (Real, Real))) \226\134\146 bounded_on_int((x : Real) => real_of_num(0), int, (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative(abs, int, dd_bounds)
      #|  \226\136\128 x : Real, interval_arith(x, (int : (Real, Real))) \226\134\146 real_of_num(0) < (f : (Real) -> Real)(x)
      #|  bounded_on_int((f : (Real) -> Real), (int : (Real, Real)), (f_bounds : (Real, Real))) \226\134\146 interval_pos(f_bounds) \226\134\146 nth_diff_strong_int(2, int, f) \226\134\146 bounded_on_int((x : Real) => nth_derivative(2, f, x), int, (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative((x : Real) => abs(f(x)), int, dd_bounds)
      #|  (f : (_) -> _)((x : _))
      #|  \226\136\128 x : Real, interval_arith(x, (int : (Real, Real))) \226\134\146 (f : (Real) -> Real)(x) < real_of_num(0)
      #|  bounded_on_int((f : (Real) -> Real), (int : (Real, Real)), (f_bounds : (Real, Real))) \226\134\146 interval_neg(f_bounds) \226\134\146 nth_diff_strong_int(2, int, f) \226\134\146 bounded_on_int((x : Real) => -nth_derivative(2, f, x), int, (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative((x : Real) => abs(f(x)), int, dd_bounds)
      #|  (f : (_) -> _)((x : _))
      #|  bounded_on_int((x : Real) => real_of_num((n : Num) * (n - 1)) * pow(x, n - 2), (int : (Real, Real)), (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative((x : Real) => pow(x, n), int, dd_bounds)
      #|  nth_diff_strong_int(2, (int : (Real, Real)), (f : (Real) -> Real)) \226\134\146 bounded_on_int((x : Real) => real_of_num((n : Num)) * (nth_derivative(2, f, x) * pow(f(x), n - 1) + real_of_num(n - 1) * (pow(f(x), n - 2) * pow(derivative(f, x), 2))), int, (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative((x : Real) => pow(f(x), n), int, dd_bounds)
      #|  2 * (2 - 1) == 2
      #|  bounded_on_int((x : Real) => real_of_num(2), (int : (Real, Real)), (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative((x : Real) => pow(x, 2), int, dd_bounds)
      #|  2 - 1 == 1
      #|  nth_diff_strong_int(2, (int : (Real, Real)), (f : (Real) -> Real)) \226\134\146 bounded_on_int((x : Real) => real_of_num(2) * (nth_derivative(2, f, x) * f(x) + pow(derivative(f, x), 2)), int, (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative((x : Real) => pow(f(x), 2), int, dd_bounds)
      #|  3 * (3 - 1) == 6 && 3 - 2 == 1
      #|  bounded_on_int((x : Real) => real_of_num(6) * x, (int : (Real, Real)), (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative((x : Real) => pow(x, 3), int, dd_bounds)
      #|  3 - 1 == 2 && 3 - 2 == 1
      #|  nth_diff_strong_int(2, (int : (Real, Real)), (f : (Real) -> Real)) \226\134\146 bounded_on_int((x : Real) => real_of_num(3) * (nth_derivative(2, f, x) * pow(f(x), 2) + real_of_num(2) * (f(x) * pow(derivative(f, x), 2))), int, (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative((x : Real) => pow(f(x), 3), int, dd_bounds)
      #|  bounded_on_int((x : Real) => -real_of_num(2) * x * pow(inv(real_of_num(1) + pow(x, 2)), 2), (int : (Real, Real)), (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative(atn, int, dd_bounds)
      #|  nth_diff_strong_int(2, (int : (Real, Real)), (f : (Real) -> Real)) \226\134\146 bounded_on_int((x : Real) => (nth_derivative(2, f, x) * (real_of_num(1) + f(x) * f(x)) - real_of_num(2) * (f(x) * pow(derivative(f, x), 2))) / pow(real_of_num(1) + f(x) * f(x), 2), int, (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative((x : Real) => atn(f(x)), int, dd_bounds)
      #|  bounded_on_int((x : Real) => -cos(x), (int : (Real, Real)), (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative(cos, int, dd_bounds)
      #|  nth_diff_strong_int(2, (int : (Real, Real)), (f : (Real) -> Real)) \226\134\146 bounded_on_int((x : Real) => -(nth_derivative(2, f, x) * sin(f(x)) + cos(f(x)) * pow(derivative(f, x), 2)), int, (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative((x : Real) => cos(f(x)), int, dd_bounds)
      #|  bounded_on_int((x : Real) => -sin(x), (int : (Real, Real)), (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative(sin, int, dd_bounds)
      #|  nth_diff_strong_int(2, (int : (Real, Real)), (f : (Real) -> Real)) \226\134\146 bounded_on_int((x : Real) => nth_derivative(2, f, x) * cos(f(x)) - sin(f(x)) * pow(derivative(f, x), 2), int, (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative((x : Real) => sin(f(x)), int, dd_bounds)
      #|  bounded_on_int(exp, (int : (Real, Real)), (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative(exp, int, dd_bounds)
      #|  nth_diff_strong_int(2, (int : (Real, Real)), (f : (Real) -> Real)) \226\134\146 bounded_on_int((x : Real) => nth_derivative(2, f, x) * exp(f(x)) + exp(f(x)) * pow(derivative(f, x), 2), int, (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative((x : Real) => exp(f(x)), int, dd_bounds)
      #|  interval_pos((int : (Real, Real))) \226\134\146 bounded_on_int((x : Real) => -inv(pow(x, 2)), int, (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative(log, int, dd_bounds)
      #|  \226\136\128 x : Real, interval_arith(x, (int : (Real, Real))) \226\134\146 real_of_num(0) < (f : (Real) -> Real)(x)
      #|  bounded_on_int((f : (Real) -> Real), (int : (Real, Real)), (f_bounds : (Real, Real))) \226\134\146 interval_pos(f_bounds) \226\134\146 nth_diff_strong_int(2, int, f) \226\134\146 bounded_on_int((x : Real) => nth_derivative(2, f, x) / f(x) - pow(derivative(f, x) / f(x), 2), int, (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative((x : Real) => log(f(x)), int, dd_bounds)
      #|  (f : (_) -> _)((x : _))
      #|  interval_not_zero((int : (Real, Real))) \226\134\146 bounded_on_int((x : Real) => real_of_num(2) * inv(pow(x, 3)), int, (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative(inv, int, dd_bounds)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  \226\136\128 x : Real, interval_arith(x, (int : (Real, Real))) \226\134\146 !((f : (Real) -> Real)(x) == real_of_num(0))
      #|  bounded_on_int((f : (Real) -> Real), (int : (Real, Real)), (f_bounds : (Real, Real))) \226\134\146 interval_not_zero(f_bounds) \226\134\146 nth_diff_strong_int(2, int, f) \226\134\146 bounded_on_int((x : Real) => (real_of_num(2) * pow(derivative(f, x), 2) - nth_derivative(2, f, x) * f(x)) / pow(f(x), 3), int, (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative((x : Real) => inv(f(x)), int, dd_bounds)
      #|  (f : (_) -> _)((x : _))
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  interval_pos((int : (Real, Real))) \226\134\146 bounded_on_int((x : Real) => -inv(real_of_num(4) * sqrt(pow(x, 3))), int, (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative(sqrt, int, dd_bounds)
      #|  \226\136\128 x : Real, interval_arith(x, (int : (Real, Real))) \226\134\146 real_of_num(0) < (f : (Real) -> Real)(x)
      #|  bounded_on_int((f : (Real) -> Real), (int : (Real, Real)), (f_bounds : (Real, Real))) \226\134\146 interval_pos(f_bounds) \226\134\146 nth_diff_strong_int(2, int, f) \226\134\146 bounded_on_int((x : Real) => (real_of_num(2) * (nth_derivative(2, f, x) * f(x)) - pow(derivative(f, x), 2)) / (real_of_num(4) * sqrt(pow(f(x), 3))), int, (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative((x : Real) => sqrt(f(x)), int, dd_bounds)
      #|  (f : (_) -> _)((x : _))
      #|  iabs((int : (Real, Real))) < real_of_num(1) \226\134\146 bounded_on_int((x : Real) => -(x / sqrt(pow(real_of_num(1) - x * x, 3))), int, (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative(acs, int, dd_bounds)
      #|  \226\136\128 x : Real, interval_arith(x, (int : (Real, Real))) \226\134\146 abs((f : (Real) -> Real)(x)) < real_of_num(1)
      #|  bounded_on_int((f : (Real) -> Real), (int : (Real, Real)), (f_bounds : (Real, Real))) \226\134\146 iabs(f_bounds) < real_of_num(1) \226\134\146 nth_diff_strong_int(2, int, f) \226\134\146 bounded_on_int((x : Real) => -((nth_derivative(2, f, x) * (real_of_num(1) - f(x) * f(x)) + f(x) * pow(derivative(f, x), 2)) / sqrt(pow(real_of_num(1) - f(x) * f(x), 3))), int, (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative((x : Real) => acs(f(x)), int, dd_bounds)
      #|  (f : (_) -> _)((x : _))
      #|  iabs((int : (Real, Real))) < real_of_num(1) \226\134\146 bounded_on_int((x : Real) => x / sqrt(pow(real_of_num(1) - x * x, 3)), int, (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative(asn, int, dd_bounds)
      #|  \226\136\128 x : Real, interval_arith(x, (int : (Real, Real))) \226\134\146 abs((f : (Real) -> Real)(x)) < real_of_num(1)
      #|  bounded_on_int((f : (Real) -> Real), (int : (Real, Real)), (f_bounds : (Real, Real))) \226\134\146 iabs(f_bounds) < real_of_num(1) \226\134\146 nth_diff_strong_int(2, int, f) \226\134\146 bounded_on_int((x : Real) => (nth_derivative(2, f, x) * (real_of_num(1) - f(x) * f(x)) + f(x) * pow(derivative(f, x), 2)) / sqrt(pow(real_of_num(1) - f(x) * f(x), 3)), int, (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative((x : Real) => asn(f(x)), int, dd_bounds)
      #|  (f : (_) -> _)((x : _))
      #|  interval_arith((x : Real), (int : (Real, Real))) && interval_gt((f : Real), int) \226\134\146 f < x
      #|  interval_gt(-real_of_num(1), (int : (Real, Real))) \226\134\146 bounded_on_int(ddmatan, int, (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative(matan, int, dd_bounds)
      #|  \226\136\128 x : Real, interval_arith(x, (int : (Real, Real))) \226\134\146 -real_of_num(1) < (f : (Real) -> Real)(x)
      #|  bounded_on_int((f : (Real) -> Real), (int : (Real, Real)), (f_bounds : (Real, Real))) \226\134\146 interval_gt(-real_of_num(1), f_bounds) \226\134\146 nth_diff_strong_int(2, int, f) \226\134\146 bounded_on_int((x : Real) => nth_derivative(2, f, x) * dmatan(f(x)) + pow(derivative(f, x), 2) * ddmatan(f(x)), int, (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative((x : Real) => matan(f(x)), int, dd_bounds)
      #|  (f : (_) -> _)((x : _))
      #|  nth_diff_strong_int(2, (int : (Real, Real)), (f : (Real) -> Real)) \226\134\146 bounded_on_int((x : Real) => (c : Real) * nth_derivative(2, f, x), int, (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative((x : Real) => c * f(x), int, dd_bounds)
      #|  nth_diff_strong_int(2, (int : (Real, Real)), (f : (Real) -> Real)) \226\134\146 nth_diff_strong_int(2, int, (g : (Real) -> Real)) \226\134\146 bounded_on_int((x : Real) => nth_derivative(2, f, x) + nth_derivative(2, g, x), int, (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative((x : Real) => f(x) + g(x), int, dd_bounds)
      #|  nth_diff_strong_int(2, (int : (Real, Real)), (f : (Real) -> Real)) \226\134\146 nth_diff_strong_int(2, int, (g : (Real) -> Real)) \226\134\146 bounded_on_int((x : Real) => nth_derivative(2, f, x) - nth_derivative(2, g, x), int, (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative((x : Real) => f(x) - g(x), int, dd_bounds)
      #|  nth_diff_strong_int(2, (int : (Real, Real)), (f : (Real) -> Real)) \226\134\146 nth_diff_strong_int(2, int, (g : (Real) -> Real)) \226\134\146 bounded_on_int((x : Real) => f(x) * nth_derivative(2, g, x) + (real_of_num(2) * (derivative(f, x) * derivative(g, x)) + nth_derivative(2, f, x) * g(x)), int, (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative((x : Real) => f(x) * g(x), int, dd_bounds)
      #|  (g_bounds : _)
      #|  \226\136\128 x : Real, interval_arith(x, (int : (Real, Real))) \226\134\146 !((g : (Real) -> Real)(x) == real_of_num(0))
      #|  bounded_on_int((g : (Real) -> Real), (int : (Real, Real)), (g_bounds : (Real, Real))) \226\134\146 interval_not_zero(g_bounds) \226\134\146 nth_diff_strong_int(2, int, (f : (Real) -> Real)) \226\134\146 nth_diff_strong_int(2, int, g) \226\134\146 bounded_on_int((x : Real) => ((nth_derivative(2, f, x) * g(x) - f(x) * nth_derivative(2, g, x)) * g(x) - real_of_num(2) * (derivative(g, x) * (derivative(f, x) * g(x) - f(x) * derivative(g, x)))) / pow(g(x), 3), int, (dd_bounds : (Real, Real))) \226\134\146 has_bounded_second_derivative((x : Real) => f(x) / g(x), int, dd_bounds)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  !(P : Bool) == (P == false)
      #|  (cell_domain : (Real, Real, Real, Real) -> Bool)((x : Real), (y : Real), (z : Real), (w : Real)) == (x <= y && y <= z && y - x <= w && z - y <= w)
      #|  ((i : Num) < 2) == (i == 0 || i == 1)
      #|  (UNIV : (Real) -> Bool)
      #|  cell_domain((x : Real), (y : Real), (z : Real), (w : Real)) \226\134\146 taylor_interval((x : Real) => x, x, y, z, w, (y, y), (real_of_num(1), real_of_num(1)), (real_of_num(0), real_of_num(0)))
      #|  ((i : Num) < 2) == (i == 0 || i == 1)
      #|  (UNIV : (Real) -> Bool)
      #|  cell_domain((x : Real), (y : Real), (z : Real), (w : Real)) \226\134\146 taylor_interval((x : Real) => (c : Real), x, y, z, w, (c, c), (real_of_num(0), real_of_num(0)), (real_of_num(0), real_of_num(0)))
      #|  :(Real) -> Real
      #|  :Real
      #|  :Real
      #|  :Real
      #|  :Real
      #|  :(Real, Real)
      #|  :(Real, Real)
      #|  :(Real, Real)
      #|  :Real
      #|  :Real
      #|  :Real
      #|  :Real
      #|  taylor_interval((f : (Real) -> Real), (x : Real), (y : Real), (z : Real), (w : Real), ((f_lo : Real), (f_hi : Real)), (df_bounds : (Real, Real)), (dd_bounds : (Real, Real))) \226\134\146 iabs(df_bounds) == (df : Real) \226\134\146 iabs(dd_bounds) == (dd : Real) \226\134\146 w * (df + w * (dd * inv(real_of_num(2)))) <= (t : Real) \226\134\146 f_hi + t <= (hi : Real) \226\134\146 (lo : Real) <= f_lo - t \226\134\146 bounded_on_int(f, (x, z), (lo, hi))
      #|  taylor_interval((f : (Real) -> Real), (x : Real), (y : Real), (z : Real), (w : Real), (f_bounds : (Real, Real)), ((df_lo : Real), (df_hi : Real)), (dd_bounds : (Real, Real))) \226\134\146 iabs(dd_bounds) == (dd : Real) \226\134\146 df_hi + w * dd <= (hi : Real) \226\134\146 (lo : Real) <= df_lo - w * dd \226\134\146 bounded_on_int(derivative(f), (x, z), (lo, hi))
      #|  bounded_on_int((g : (Real) -> Real), (int : (Real, Real)), (g_bounds : (Real, Real))) \226\134\146 bounded_on_int((f : (Real) -> Real), g_bounds, (f_bounds : (Real, Real))) \226\134\146 bounded_on_int((x : Real) => f(g(x)), int, f_bounds)
      #|  bounded_on_int((f : (Real) -> Real), (int : (Real, Real)), (f_bounds : (Real, Real))) \226\134\146 interval_arith((y : Real), int) \226\134\146 interval_arith(f(y), f_bounds)
      #|  taylor_interval((f : (Real) -> Real), (x : Real), (y : Real), (z : Real), (w : Real), (f_bounds : (Real, Real)), (df_bounds : (Real, Real)), (dd_bounds : (Real, Real))) \226\134\146 cell_domain((x0 : Real), y, (z0 : Real), (w0 : Real)) \226\134\146 x <= x0 \226\134\146 z0 <= z \226\134\146 taylor_interval(f, x0, y, z0, w0, f_bounds, df_bounds, dd_bounds)
      #|Taylor_interval.derivative =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real))) (\y:real. (#@:fun(fun(real,bool),real) (\d:real. (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) f:fun(real,real)) d:real) (#atreal:fun(real,net(real)) y:real))))))))
      #|Taylor_interval.nth_derivative =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). ((#=:fun(fun(real,real),fun(fun(real,real),bool)) ((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) n:num) f:fun(real,real))) (((#iter:fun(num,fun(fun(fun(real,real),fun(real,real)),fun(fun(real,real),fun(real,real)))) n:num) #derivative:fun(fun(real,real),fun(real,real))) f:fun(real,real)))))))
      #|Taylor_interval.nth_differentiable =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) (((#nth_differentiable:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) #_0:num)) f:fun(real,real)) x:real)) ((#real_continuous:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real)))) ((#=:fun(bool,fun(bool,bool)) (((#nth_differentiable:fun(num,fun(fun(real,real),fun(real,bool))) (#SUC:fun(num,num) n:num)) f:fun(real,real)) x:real)) ((#/\:fun(bool,fun(bool,bool)) (((#nth_differentiable:fun(num,fun(fun(real,real),fun(real,bool))) n:num) f:fun(real,real)) x:real)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) ((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) n:num) f:fun(real,real))) (#atreal:fun(real,net(real)) x:real)))))
      #|Taylor_interval.nth_differentiable_on =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). ((#=:fun(bool,fun(bool,bool)) (((#nth_differentiable_on:fun(num,fun(fun(real,bool),fun(fun(real,real),bool))) n:num) s:fun(real,bool)) f:fun(real,real))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) (((#nth_differentiable:fun(num,fun(fun(real,real),fun(real,bool))) n:num) f:fun(real,real)) x:real)))))))))))
      #|Taylor_interval.nth_differentiable_on_int =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). ((#=:fun(bool,fun(bool,bool)) (((#nth_differentiable_on_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) f:fun(real,real))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) x:real) int:prod(real,real))) (((#nth_differentiable:fun(num,fun(fun(real,real),fun(real,bool))) n:num) f:fun(real,real)) x:real)))))))))))
      #|Taylor_interval.nth_diff_weak =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) (((#nth_diff_weak:fun(num,fun(fun(real,real),fun(real,bool))) n:num) f:fun(real,real)) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_continuous:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) (#?:fun(fun(fun(num,fun(real,real)),bool),bool) (\F:fun(num,fun(real,real)). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (F:fun(num,fun(real,real)) (#NUMERAL:fun(num,num) #_0:num))) f:fun(real,real))) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) i:num) n:num)) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) (F:fun(num,fun(real,real)) i:num)) ((F:fun(num,fun(real,real)) (#SUC:fun(num,num) i:num)) x:real)) (#atreal:fun(real,net(real)) x:real))))))))))))))))
      #|Taylor_interval.nth_diff_strong =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). ((#=:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) n:num) f:fun(real,real)) x:real)) (#?:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#/\:fun(bool,fun(bool,bool)) (#real_open:fun(fun(real,bool),bool) s:fun(real,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) (((#nth_differentiable_on:fun(num,fun(fun(real,bool),fun(fun(real,real),bool))) n:num) s:fun(real,bool)) f:fun(real,real)))))))))))))
      #|Taylor_interval.nth_diff_strong_int =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). ((#=:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) f:fun(real,real))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) x:real) int:prod(real,real))) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) n:num) f:fun(real,real)) x:real)))))))))))
      #|Taylor_interval.derivative_eq_real_derivative =  |- ((#=:fun(fun(fun(real,real),fun(real,real)),fun(fun(fun(real,real),fun(real,real)),bool)) #derivative:fun(fun(real,real),fun(real,real))) #real_derivative:fun(fun(real,real),fun(real,real)))
      #|Taylor_interval.has_derivative_cond =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\d:real. (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) f:fun(real,real)) d:real) (#atreal:fun(real,net(real)) x:real))))) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) f:fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#atreal:fun(real,net(real)) x:real)))))))
      #|Taylor_interval.has_derivative_alt =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) f:fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#atreal:fun(real,net(real)) x:real)))))))
      #|Taylor_interval.derivative_unique =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\f':real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) f:fun(real,real)) f':real) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) f':real))))))))
      #|Taylor_interval.derivative_unique_on =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f':fun(real,real). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) f:fun(real,real)) (f':fun(real,real) x:real)) (#atreal:fun(real,net(real)) x:real)))))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#=:fun(real,fun(real,bool)) (f':fun(real,real) x:real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real))))))))))))
      #|Taylor_interval.has_derivative_lemma =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\f':real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) f':real))) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) f:fun(real,real)) f':real) (#atreal:fun(real,net(real)) x:real)))))))))
      #|Taylor_interval.nth_derivative0 =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). ((#=:fun(fun(real,real),fun(fun(real,real),bool)) ((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) #_0:num)) f:fun(real,real))) f:fun(real,real))))
      #|Taylor_interval.nth_derivativeS =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). ((#=:fun(fun(real,real),fun(fun(real,real),bool)) ((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#SUC:fun(num,num) n:num)) f:fun(real,real))) (#derivative:fun(fun(real,real),fun(real,real)) ((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) n:num) f:fun(real,real))))))))
      #|Taylor_interval.nth_Sderivative =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). ((#=:fun(fun(real,real),fun(fun(real,real),bool)) ((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#SUC:fun(num,num) n:num)) f:fun(real,real))) ((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) n:num) (#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real))))))))
      #|Taylor_interval.nth_derivative1 =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). ((#=:fun(fun(real,real),fun(fun(real,real),bool)) ((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) f:fun(real,real))) (#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)))))
      #|Taylor_interval.nth_derivative2 =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). ((#=:fun(fun(real,real),fun(fun(real,real),bool)) ((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real))) (#derivative:fun(fun(real,real),fun(real,real)) (#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real))))))
      #|Taylor_interval.nth_diff_continuous =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_differentiable:fun(num,fun(fun(real,real),fun(real,bool))) n:num) f:fun(real,real)) x:real)) ((#real_continuous:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real)))))))))
      #|Taylor_interval.nth_differentiable_cond =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_differentiable:fun(num,fun(fun(real,real),fun(real,bool))) n:num) f:fun(real,real)) x:real)) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) i:num) n:num)) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) ((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) f:fun(real,real))) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#SUC:fun(num,num) i:num)) f:fun(real,real)) x:real)) (#atreal:fun(real,net(real)) x:real))))))))))))
      #|Taylor_interval.nth_differentiable_on_cond =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_differentiable_on:fun(num,fun(fun(real,bool),fun(fun(real,real),bool))) n:num) s:fun(real,bool)) f:fun(real,real))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) i:num) n:num)) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) ((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) f:fun(real,real))) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#SUC:fun(num,num) i:num)) f:fun(real,real)) x:real)) (#atreal:fun(real,net(real)) x:real)))))))))))))))
      #|Taylor_interval.nth_differentiable_eq =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) (((#nth_differentiable:fun(num,fun(fun(real,real),fun(real,bool))) n:num) f:fun(real,real)) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_continuous:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) i:num) n:num)) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) ((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) f:fun(real,real))) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#SUC:fun(num,num) i:num)) f:fun(real,real)) x:real)) (#atreal:fun(real,net(real)) x:real)))))))))))))
      #|Taylor_interval.nth_differentiable_on_int2 =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_differentiable_on_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) int:prod(real,real)) f:fun(real,real))) (#?:fun(fun(fun(real,real),bool),bool) (\f':fun(real,real). (#?:fun(fun(fun(real,real),bool),bool) (\f'':fun(real,real). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) f':fun(real,real)) (#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(real,real),fun(fun(real,real),bool)) f'':fun(real,real)) ((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) x:real) int:prod(real,real))) ((#/\:fun(bool,fun(bool,bool)) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) f:fun(real,real)) (f':fun(real,real) x:real)) (#atreal:fun(real,net(real)) x:real))) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) f':fun(real,real)) (f'':fun(real,real) x:real)) (#atreal:fun(real,net(real)) x:real)))))))))))))))))
      #|Taylor_interval.nth_mth_diff =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) n:num) m:num)) ((#==>:fun(bool,fun(bool,bool)) (((#nth_differentiable:fun(num,fun(fun(real,real),fun(real,bool))) m:num) f:fun(real,real)) x:real)) (((#nth_differentiable:fun(num,fun(fun(real,real),fun(real,bool))) n:num) f:fun(real,real)) x:real)))))))))))
      #|Taylor_interval.nth_differentiable1 =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) (((#nth_differentiable:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) f:fun(real,real)) x:real)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real)))))))
      #|Taylor_interval.nth_diff_imp_diff =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) n:num)) ((#==>:fun(bool,fun(bool,bool)) (((#nth_differentiable:fun(num,fun(fun(real,real),fun(real,bool))) n:num) f:fun(real,real)) x:real)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))))))))))
      #|Taylor_interval.nth_derivative_continuous =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) (((#nth_differentiable:fun(num,fun(fun(real,real),fun(real,bool))) n:num) f:fun(real,real)) x:real)) ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) i:num) n:num)) ((#real_continuous:fun(fun(real,real),fun(net(real),bool)) ((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) f:fun(real,real))) (#atreal:fun(real,net(real)) x:real))))))))))))
      #|Taylor_interval.ith_derivative_differentiable =  |- (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_differentiable:fun(num,fun(fun(real,real),fun(real,bool))) n:num) f:fun(real,real)) x:real)) ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) i:num) n:num)) (((#nth_differentiable:fun(num,fun(fun(real,real),fun(real,bool))) ((#-:fun(num,fun(num,num)) n:num) i:num)) ((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) f:fun(real,real))) x:real)))))))))))
      #|Taylor_interval.nth_diff_strong_imp_diff =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) n:num) f:fun(real,real)) x:real)) (((#nth_differentiable:fun(num,fun(fun(real,real),fun(real,bool))) n:num) f:fun(real,real)) x:real))))))))
      #|Taylor_interval.HAS_REAL_DERIVATIVE_ABS_POS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) #real_abs:fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#atreal:fun(real,net(real)) x:real)))))
      #|Taylor_interval.HAS_REAL_DERIVATIVE_ABS_NEG =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) #real_abs:fun(real,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#atreal:fun(real,net(real)) x:real)))))
      #|Taylor_interval.derivative_x =  |- ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#derivative:fun(fun(real,real),fun(real,real)) (\x:real. x:real))) (\x:real. (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))
      #|Taylor_interval.derivative_const =  |- (#forall:fun(fun(real,bool),bool) (\c:real. ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#derivative:fun(fun(real,real),fun(real,real)) (\x:real. c:real))) (\x:real. (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))
      #|Taylor_interval.derivative_abs_pos =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) #real_abs:fun(real,real)) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|Taylor_interval.derivative_abs_neg =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) #real_abs:fun(real,real)) x:real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))
      #|Taylor_interval.derivative_pow_x =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#derivative:fun(fun(real,real),fun(real,real)) (\x:real. ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))) (\x:real. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))
      #|Taylor_interval.derivative_pow2_x =  |- ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#derivative:fun(fun(real,real),fun(real,real)) (\x:real. ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (\x:real. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:real)))
      #|Taylor_interval.derivative_pow3_x =  |- ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#derivative:fun(fun(real,real),fun(real,real)) (\x:real. ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (\x:real. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|Taylor_interval.derivative_inv =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) #real_inv:fun(real,real)) x:real)) (#real_neg:fun(real,real) (#real_inv:fun(real,real) ((#real_mul:fun(real,fun(real,real)) x:real) x:real)))))))
      #|Taylor_interval.derivative_atn =  |- ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#derivative:fun(fun(real,real),fun(real,real)) #atn:fun(real,real))) (\x:real. (#real_inv:fun(real,real) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_mul:fun(real,fun(real,real)) x:real) x:real)))))
      #|Taylor_interval.derivative_exp =  |- ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#derivative:fun(fun(real,real),fun(real,real)) #exp:fun(real,real))) #exp:fun(real,real))
      #|Taylor_interval.derivative_log =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) #log:fun(real,real)) x:real)) (#real_inv:fun(real,real) x:real)))))
      #|Taylor_interval.derivative_sin =  |- ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#derivative:fun(fun(real,real),fun(real,real)) #sin:fun(real,real))) #cos:fun(real,real))
      #|Taylor_interval.derivative_cos =  |- ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#derivative:fun(fun(real,real),fun(real,real)) #cos:fun(real,real))) (\x:real. (#real_neg:fun(real,real) (#sin:fun(real,real) x:real))))
      #|Taylor_interval.derivative_asn =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) #asn:fun(real,real)) x:real)) (#real_inv:fun(real,real) (#sqrt:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_mul:fun(real,fun(real,real)) x:real) x:real))))))))
      #|Taylor_interval.derivative_acs =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) #acs:fun(real,real)) x:real)) (#real_neg:fun(real,real) (#real_inv:fun(real,real) (#sqrt:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_mul:fun(real,fun(real,real)) x:real) x:real)))))))))
      #|Taylor_interval.derivative_sqrt =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) #sqrt:fun(real,real)) x:real)) (#real_inv:fun(real,real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#sqrt:fun(real,real) x:real)))))))
      #|Taylor_interval.derivative_matan =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) #matan:fun(real,real)) x:real)) (#dmatan:fun(real,real) x:real))))
      #|Taylor_interval.matan_differentiable =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:real)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) #matan:fun(real,real)) (#atreal:fun(real,net(real)) x:real)))))
      #|Taylor_interval.derivative_composition =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) g:fun(real,real)) (#atreal:fun(real,net(real)) (f:fun(real,real) x:real)))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. (g:fun(real,real) (f:fun(real,real) x:real)))) x:real)) ((#real_mul:fun(real,fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) ((#derivative:fun(fun(real,real),fun(real,real)) g:fun(real,real)) (f:fun(real,real) x:real))))))))))))
      #|Taylor_interval.REAL_DIFFERENTIABLE_AT_INV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) #real_inv:fun(real,real)) (#atreal:fun(real,net(real)) x:real)))))
      #|Taylor_interval.REAL_DIFFERENTIABLE_AT_ABS_POS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) #real_abs:fun(real,real)) (#atreal:fun(real,net(real)) x:real)))))
      #|Taylor_interval.REAL_DIFFERENTIABLE_AT_ABS_NEG =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) #real_abs:fun(real,real)) (#atreal:fun(real,net(real)) x:real)))))
      #|Taylor_interval.derivative_compose_abs_pos =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun(real,real) x:real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (\x:real. (#real_abs:fun(real,real) (f:fun(real,real) x:real)))) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. (#real_abs:fun(real,real) (f:fun(real,real) x:real)))) x:real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)))))))))
      #|Taylor_interval.derivative_compose_abs_neg =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (\x:real. (#real_abs:fun(real,real) (f:fun(real,real) x:real)))) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. (#real_abs:fun(real,real) (f:fun(real,real) x:real)))) x:real)) (#real_neg:fun(real,real) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real))))))))))
      #|Taylor_interval.derivative_compose_pow =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (\x:real. ((#real_pow:fun(real,fun(num,real)) (f:fun(real,real) x:real)) n:num))) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. ((#real_pow:fun(real,fun(num,real)) (f:fun(real,real) x:real)) n:num))) x:real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (f:fun(real,real) x:real)) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real))))))))))))
      #|Taylor_interval.derivative_compose_pow2 =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (\x:real. ((#real_pow:fun(real,fun(num,real)) (f:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. ((#real_pow:fun(real,fun(num,real)) (f:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) x:real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real))))))))))
      #|Taylor_interval.derivative_compose_pow3 =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (\x:real. ((#real_pow:fun(real,fun(num,real)) (f:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. ((#real_pow:fun(real,fun(num,real)) (f:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) x:real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (f:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real))))))))))
      #|Taylor_interval.derivative_compose_atn =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (\x:real. (#atn:fun(real,real) (f:fun(real,real) x:real)))) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. (#atn:fun(real,real) (f:fun(real,real) x:real)))) x:real)) ((#real_div:fun(real,fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (f:fun(real,real) x:real)))))))))))
      #|Taylor_interval.derivative_compose_exp =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (\x:real. (#exp:fun(real,real) (f:fun(real,real) x:real)))) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. (#exp:fun(real,real) (f:fun(real,real) x:real)))) x:real)) ((#real_mul:fun(real,fun(real,real)) (#exp:fun(real,real) (f:fun(real,real) x:real))) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)))))))))
      #|Taylor_interval.derivative_compose_log =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun(real,real) x:real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (\x:real. (#log:fun(real,real) (f:fun(real,real) x:real)))) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. (#log:fun(real,real) (f:fun(real,real) x:real)))) x:real)) ((#real_div:fun(real,fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (f:fun(real,real) x:real))))))))))
      #|Taylor_interval.derivative_compose_cos =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (\x:real. (#cos:fun(real,real) (f:fun(real,real) x:real)))) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. (#cos:fun(real,real) (f:fun(real,real) x:real)))) x:real)) (#real_neg:fun(real,real) ((#real_mul:fun(real,fun(real,real)) (#sin:fun(real,real) (f:fun(real,real) x:real))) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real))))))))))
      #|Taylor_interval.derivative_compose_sin =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (\x:real. (#sin:fun(real,real) (f:fun(real,real) x:real)))) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. (#sin:fun(real,real) (f:fun(real,real) x:real)))) x:real)) ((#real_mul:fun(real,fun(real,real)) (#cos:fun(real,real) (f:fun(real,real) x:real))) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)))))))))
      #|Taylor_interval.derivative_compose_inv =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (\x:real. (#real_inv:fun(real,real) (f:fun(real,real) x:real)))) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. (#real_inv:fun(real,real) (f:fun(real,real) x:real)))) x:real)) ((#real_mul:fun(real,fun(real,real)) (#real_neg:fun(real,real) (#real_inv:fun(real,real) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (f:fun(real,real) x:real))))) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real))))))))))
      #|Taylor_interval.derivative_compose_sqrt =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun(real,real) x:real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (\x:real. (#sqrt:fun(real,real) (f:fun(real,real) x:real)))) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. (#sqrt:fun(real,real) (f:fun(real,real) x:real)))) x:real)) ((#real_div:fun(real,fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#sqrt:fun(real,real) (f:fun(real,real) x:real))))))))))))
      #|Taylor_interval.derivative_compose_acs =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(real,real) x:real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (\x:real. (#acs:fun(real,real) (f:fun(real,real) x:real)))) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. (#acs:fun(real,real) (f:fun(real,real) x:real)))) x:real)) (#real_neg:fun(real,real) ((#real_div:fun(real,fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#sqrt:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (f:fun(real,real) x:real))))))))))))))
      #|Taylor_interval.derivative_compose_asn =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(real,real) x:real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (\x:real. (#asn:fun(real,real) (f:fun(real,real) x:real)))) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. (#asn:fun(real,real) (f:fun(real,real) x:real)))) x:real)) ((#real_div:fun(real,fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#sqrt:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (f:fun(real,real) x:real)))))))))))))
      #|Taylor_interval.derivative_compose_matan =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (f:fun(real,real) x:real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (\x:real. (#matan:fun(real,real) (f:fun(real,real) x:real)))) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. (#matan:fun(real,real) (f:fun(real,real) x:real)))) x:real)) ((#real_mul:fun(real,fun(real,real)) (#dmatan:fun(real,real) (f:fun(real,real) x:real))) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real))))))))))
      #|Taylor_interval.derivative_scale =  |- (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. ((#real_mul:fun(real,fun(real,real)) c:real) (f:fun(real,real) x:real)))) x:real)) ((#real_mul:fun(real,fun(real,real)) c:real) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real))))))))))
      #|Taylor_interval.derivative_neg =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. (#real_neg:fun(real,real) (f:fun(real,real) x:real)))) x:real)) (#real_neg:fun(real,real) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real))))))))
      #|Taylor_interval.derivative_pow =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. ((#real_pow:fun(real,fun(num,real)) (f:fun(real,real) x:real)) n:num))) x:real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (f:fun(real,real) x:real)) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)))))))))))
      #|Taylor_interval.derivative_add =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) g:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. ((#real_add:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) x:real)) ((#real_add:fun(real,fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) ((#derivative:fun(fun(real,real),fun(real,real)) g:fun(real,real)) x:real)))))))))))
      #|Taylor_interval.derivative_mul =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) g:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) x:real)) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) ((#derivative:fun(fun(real,real),fun(real,real)) g:fun(real,real)) x:real))) ((#real_mul:fun(real,fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (g:fun(real,real) x:real))))))))))))
      #|Taylor_interval.derivative_sub =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) g:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) x:real)) ((#real_sub:fun(real,fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) ((#derivative:fun(fun(real,real),fun(real,real)) g:fun(real,real)) x:real)))))))))))
      #|Taylor_interval.derivative_div =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) g:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (g:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. ((#real_div:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) x:real)) ((#real_div:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (g:fun(real,real) x:real))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) ((#derivative:fun(fun(real,real),fun(real,real)) g:fun(real,real)) x:real)))) ((#real_mul:fun(real,fun(real,real)) (g:fun(real,real) x:real)) (g:fun(real,real) x:real)))))))))))))
      #|Taylor_interval.differentiable_sum_numseg =  |- (#forall:fun(fun(fun(num,fun(real,real)),bool),bool) (\G:fun(num,fun(real,real)). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) i:num) ((#..:fun(num,fun(num,fun(num,bool))) n:num) m:num))) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (G:fun(num,fun(real,real)) i:num)) (#atreal:fun(real,net(real)) x:real)))))) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (\x:real. ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) n:num) m:num)) (\i:num. ((G:fun(num,fun(real,real)) i:num) x:real))))) (#atreal:fun(real,net(real)) x:real)))))))))))
      #|Taylor_interval.derivative_sum_numseg =  |- (#forall:fun(fun(fun(num,fun(real,real)),bool),bool) (\G:fun(num,fun(real,real)). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(num,fun(fun(num,bool),bool)) i:num) ((#..:fun(num,fun(num,fun(num,bool))) n:num) m:num))) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (G:fun(num,fun(real,real)) i:num)) (#atreal:fun(real,net(real)) x:real)))))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) n:num) m:num)) (\i:num. ((G:fun(num,fun(real,real)) i:num) x:real))))) x:real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) n:num) m:num)) (\i:num. ((#derivative:fun(fun(real,real),fun(real,real)) (G:fun(num,fun(real,real)) i:num)) x:real)))))))))))))
      #|Taylor_interval.HAS_REAL_DERIVATIVE_LOCAL =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\g':real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) g:fun(real,real)) g':real) (#atreal:fun(real,net(real)) x:real))) (#?:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#/\:fun(bool,fun(bool,bool)) (#real_open:fun(fun(real,bool),bool) s:fun(real,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) y:real) s:fun(real,bool))) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) y:real)) (g:fun(real,real) y:real))))))))))) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) f:fun(real,real)) g':real) (#atreal:fun(real,net(real)) x:real)))))))))))
      #|Taylor_interval.differentiable_local =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) g:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#/\:fun(bool,fun(bool,bool)) (#real_open:fun(fun(real,bool),bool) s:fun(real,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) y:real) s:fun(real,bool))) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) y:real)) (g:fun(real,real) y:real))))))))) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real)))))))))))
      #|Taylor_interval.nth_derivative_scale_strong =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) f:fun(real,real))) (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) x:real) int:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) i:num) n:num)) (#?:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#/\:fun(bool,fun(bool,bool)) (#real_open:fun(fun(real,bool),bool) s:fun(real,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) y:real) s:fun(real,bool))) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) (\y:real. ((#real_mul:fun(real,fun(real,real)) c:real) (f:fun(real,real) y:real)))) y:real)) ((#real_mul:fun(real,fun(real,real)) c:real) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) f:fun(real,real)) y:real)))))))))))))))))))))))))
      #|Taylor_interval.nth_derivative_scale_strong_all =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) f:fun(real,real))) (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) x:real) int:prod(real,real))) (#?:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#/\:fun(bool,fun(bool,bool)) (#real_open:fun(fun(real,bool),bool) s:fun(real,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) i:num) n:num)) ((#IN:fun(real,fun(fun(real,bool),bool)) y:real) s:fun(real,bool)))) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) (\y:real. ((#real_mul:fun(real,fun(real,real)) c:real) (f:fun(real,real) y:real)))) y:real)) ((#real_mul:fun(real,fun(real,real)) c:real) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) f:fun(real,real)) y:real))))))))))))))))))))))))
      #|Taylor_interval.nth_derivative_scale =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) f:fun(real,real))) (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) x:real) int:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) i:num) n:num)) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) (\x:real. ((#real_mul:fun(real,fun(real,real)) c:real) (f:fun(real,real) x:real)))) x:real)) ((#real_mul:fun(real,fun(real,real)) c:real) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) f:fun(real,real)) x:real))))))))))))))))))
      #|Taylor_interval.nth_diff_scale =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) f:fun(real,real))) (#forall:fun(fun(real,bool),bool) (\c:real. (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) (\x:real. ((#real_mul:fun(real,fun(real,real)) c:real) (f:fun(real,real) x:real)))))))))))))
      #|Taylor_interval.nth_derivative_add_strong =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) g:fun(real,real))) (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) x:real) int:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) i:num) n:num)) (#?:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#/\:fun(bool,fun(bool,bool)) (#real_open:fun(fun(real,bool),bool) s:fun(real,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) y:real) s:fun(real,bool))) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) (\y:real. ((#real_add:fun(real,fun(real,real)) (f:fun(real,real) y:real)) (g:fun(real,real) y:real)))) y:real)) ((#real_add:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) f:fun(real,real)) y:real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) g:fun(real,real)) y:real))))))))))))))))))))))))))
      #|Taylor_interval.nth_derivative_add_strong_all =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) g:fun(real,real))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) x:real) int:prod(real,real))) (#?:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#/\:fun(bool,fun(bool,bool)) (#real_open:fun(fun(real,bool),bool) s:fun(real,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) i:num) n:num)) ((#IN:fun(real,fun(fun(real,bool),bool)) y:real) s:fun(real,bool)))) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) (\y:real. ((#real_add:fun(real,fun(real,real)) (f:fun(real,real) y:real)) (g:fun(real,real) y:real)))) y:real)) ((#real_add:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) f:fun(real,real)) y:real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) g:fun(real,real)) y:real)))))))))))))))))))))))))
      #|Taylor_interval.nth_derivative_add =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) g:fun(real,real))) (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) x:real) int:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) i:num) n:num)) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) (\x:real. ((#real_add:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) x:real)) ((#real_add:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) f:fun(real,real)) x:real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) g:fun(real,real)) x:real)))))))))))))))))))
      #|Taylor_interval.nth_diff_add =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) g:fun(real,real))) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) (\x:real. ((#real_add:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real))))))))))))))
      #|Taylor_interval.nth_derivative_sub_strong =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) g:fun(real,real))) (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) x:real) int:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) i:num) n:num)) (#?:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#/\:fun(bool,fun(bool,bool)) (#real_open:fun(fun(real,bool),bool) s:fun(real,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) y:real) s:fun(real,bool))) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) (\y:real. ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) y:real)) (g:fun(real,real) y:real)))) y:real)) ((#real_sub:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) f:fun(real,real)) y:real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) g:fun(real,real)) y:real))))))))))))))))))))))))))
      #|Taylor_interval.nth_derivative_sub_strong_all =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) g:fun(real,real))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) x:real) int:prod(real,real))) (#?:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#/\:fun(bool,fun(bool,bool)) (#real_open:fun(fun(real,bool),bool) s:fun(real,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) i:num) n:num)) ((#IN:fun(real,fun(fun(real,bool),bool)) y:real) s:fun(real,bool)))) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) (\y:real. ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) y:real)) (g:fun(real,real) y:real)))) y:real)) ((#real_sub:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) f:fun(real,real)) y:real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) g:fun(real,real)) y:real)))))))))))))))))))))))))
      #|Taylor_interval.nth_derivative_sub =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) g:fun(real,real))) (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) x:real) int:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) i:num) n:num)) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) (\x:real. ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) x:real)) ((#real_sub:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) f:fun(real,real)) x:real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) g:fun(real,real)) x:real)))))))))))))))))))
      #|Taylor_interval.nth_diff_sub =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) g:fun(real,real))) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) (\x:real. ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real))))))))))))))
      #|Taylor_interval.nth_derivative_mul_strong =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) g:fun(real,real))) (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) x:real) int:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) i:num) n:num)) (#?:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#/\:fun(bool,fun(bool,bool)) (#real_open:fun(fun(real,bool),bool) s:fun(real,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) y:real) s:fun(real,bool))) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) (\y:real. ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) y:real)) (g:fun(real,real) y:real)))) y:real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) i:num)) (\k:num. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#binom:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) i:num) k:num)))) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) k:num) f:fun(real,real)) y:real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) ((#-:fun(num,fun(num,num)) i:num) k:num)) g:fun(real,real)) y:real)))))))))))))))))))))))))))))
      #|Taylor_interval.nth_derivative_mul_strong_all =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) g:fun(real,real))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) x:real) int:prod(real,real))) (#?:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#/\:fun(bool,fun(bool,bool)) (#real_open:fun(fun(real,bool),bool) s:fun(real,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) i:num) n:num)) ((#IN:fun(real,fun(fun(real,bool),bool)) y:real) s:fun(real,bool)))) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) (\y:real. ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) y:real)) (g:fun(real,real) y:real)))) y:real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) i:num)) (\k:num. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#binom:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) i:num) k:num)))) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) k:num) f:fun(real,real)) y:real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) ((#-:fun(num,fun(num,num)) i:num) k:num)) g:fun(real,real)) y:real))))))))))))))))))))))))))))
      #|Taylor_interval.nth_derivative_mul =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) g:fun(real,real))) (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) x:real) int:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) i:num) n:num)) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) i:num) (\x:real. ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) x:real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) i:num)) (\k:num. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#binom:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) i:num) k:num)))) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) k:num) f:fun(real,real)) x:real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) ((#-:fun(num,fun(num,num)) i:num) k:num)) g:fun(real,real)) x:real))))))))))))))))))))))
      #|Taylor_interval.nth_diff_mul =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) g:fun(real,real))) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) (\x:real. ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real))))))))))))))
      #|Taylor_interval.lin_approx =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(prod(real,real),bool),bool) (\df_bounds:prod(real,real). ((#=:fun(bool,fun(bool,bool)) ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) f:fun(real,real)) x:real) f_bounds:prod(real,real)) df_bounds:prod(real,real))) ((#/\:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) (f:fun(real,real) x:real)) f_bounds:prod(real,real))) (#?:fun(fun(real,bool),bool) (\f':real. ((#/\:fun(bool,fun(bool,bool)) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) f:fun(real,real)) f':real) (#atreal:fun(real,net(real)) x:real))) ((#interval_arith:fun(real,fun(prod(real,real),bool)) f':real) df_bounds:prod(real,real)))))))))))))))
      #|Taylor_interval.has_bounded_second_derivative =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#=:fun(bool,fun(bool,bool)) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) f:fun(real,real)) int:prod(real,real)) dd_bounds:prod(real,real))) ((#/\:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) int:prod(real,real)) f:fun(real,real))) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) ((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real))) int:prod(real,real)) dd_bounds:prod(real,real))))))))))
      #|Taylor_interval.taylor_interval =  |- (#forall:fun(fun(real,bool),bool) (\w:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\df_bounds:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(prod(real,real),bool),bool) (\ddf_bounds:prod(real,real). ((#=:fun(bool,fun(bool,bool)) ((((((((#taylor_interval:fun(fun(real,real),fun(real,fun(real,fun(real,fun(real,fun(prod(real,real),fun(prod(real,real),fun(prod(real,real),bool)))))))) f:fun(real,real)) x:real) y:real) z:real) w:real) f_bounds:prod(real,real)) df_bounds:prod(real,real)) ddf_bounds:prod(real,real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) y:real) z:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) y:real) x:real)) w:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) z:real) y:real)) w:real)) ((#/\:fun(bool,fun(bool,bool)) ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) f:fun(real,real)) y:real) f_bounds:prod(real,real)) df_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) f:fun(real,real)) ((#,:fun(real,fun(real,prod(real,real))) x:real) z:real)) ddf_bounds:prod(real,real))))))))))))))))))))))))
      #|Taylor_interval.nth_diff_strong_imp_diff_int =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) f:fun(real,real))) (((#nth_differentiable_on_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) n:num) int:prod(real,real)) f:fun(real,real)))))))))
      #|Taylor_interval.has_bounded_second_derivative_old =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) f:fun(real,real)) int:prod(real,real)) dd_bounds:prod(real,real))) (#?:fun(fun(fun(real,real),bool),bool) (\f':fun(real,real). (#?:fun(fun(fun(real,real),bool),bool) (\f'':fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) x:real) int:prod(real,real))) ((#/\:fun(bool,fun(bool,bool)) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) f:fun(real,real)) (f':fun(real,real) x:real)) (#atreal:fun(real,net(real)) x:real))) ((#/\:fun(bool,fun(bool,bool)) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) f':fun(real,real)) (f'':fun(real,real) x:real)) (#atreal:fun(real,net(real)) x:real))) ((#interval_arith:fun(real,fun(prod(real,real),bool)) (f'':fun(real,real) x:real)) dd_bounds:prod(real,real))))))))))))))))))
      #|Taylor_interval.exists_and_left =  |- (#forall:fun(fun(fun('?1,bool),bool),bool) (\P:fun('?1,bool). (#forall:fun(fun(fun('?1,bool),bool),bool) (\Q:fun('?1,bool). ((#==>:fun(bool,fun(bool,bool)) (#?:fun(fun('?1,bool),bool) (\x:'?1. ((#/\:fun(bool,fun(bool,bool)) (P:fun('?1,bool) x:'?1)) (Q:fun('?1,bool) x:'?1))))) (#?:fun(fun('?1,bool),bool) (\x:'?1. (P:fun('?1,bool) x:'?1))))))))
      #|Taylor_interval.lim_ineq =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) ((#real_le:fun(real,fun(real,bool)) a:real) ((#real_add:fun(real,fun(real,real)) b:real) e:real)))))) ((#real_le:fun(real,fun(real,bool)) a:real) b:real))))))
      #|Taylor_interval.continuous_leq =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(real,bool),bool) (\a:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\b:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) b:real)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) (#open_real_interval:fun(prod(real,real),fun(real,bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)))) ((#real_le:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) c:real)))))))) ((#real_continuous:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) a:real)))) ((#real_le:fun(real,fun(real,bool)) (f:fun(real,real) a:real)) c:real))))))))
      #|Taylor_interval.continuous_reflection =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_continuous:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#real_continuous:fun(fun(real,real),fun(net(real),bool)) (\x:real. (f:fun(real,real) (#real_neg:fun(real,real) x:real)))) (#atreal:fun(real,net(real)) (#real_neg:fun(real,real) x:real))))))))
      #|Taylor_interval.continuous_leq_segment =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) b:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_continuous:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) a:real))) ((#==>:fun(bool,fun(bool,bool)) ((#real_continuous:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) b:real))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) (#open_real_interval:fun(prod(real,real),fun(real,bool)) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)))) ((#real_le:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) c:real))))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real)))))) ((#real_le:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) c:real))))))))))))))))
      #|Taylor_interval.pair_eq =  |- (#forall:fun(fun(prod('?2,'?3),bool),bool) (\p:prod('?2,'?3). ((#=:fun(prod('?2,'?3),fun(prod('?2,'?3),bool)) p:prod('?2,'?3)) ((#,:fun('?2,fun('?3,prod('?2,'?3))) (#FST:fun(prod('?2,'?3),'?2) p:prod('?2,'?3))) (#SND:fun(prod('?2,'?3),'?3) p:prod('?2,'?3))))))
      #|Taylor_interval.iabs_alt =  |- (#forall:fun(fun(real,bool),bool) (\lo:real. (#forall:fun(fun(real,bool),bool) (\hi:real. (#forall:fun(fun(real,bool),bool) (\a:real. ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) a:real) ((#,:fun(real,fun(real,prod(real,real))) lo:real) hi:real))) ((#=:fun(real,fun(real,bool)) (#iabs:fun(prod(real,real),real) ((#,:fun(real,fun(real,prod(real,real))) lo:real) hi:real))) ((#real_max:fun(real,fun(real,real)) (#real_abs:fun(real,real) lo:real)) (#real_abs:fun(real,real) hi:real))))))))))
      #|Taylor_interval.iabs_pos =  |- (#forall:fun(fun(real,bool),bool) (\lo:real. (#forall:fun(fun(real,bool),bool) (\hi:real. (#forall:fun(fun(real,bool),bool) (\a:real. ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) a:real) ((#,:fun(real,fun(real,prod(real,real))) lo:real) hi:real))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#iabs:fun(prod(real,real),real) ((#,:fun(real,fun(real,prod(real,real))) lo:real) hi:real))))))))))
      #|Taylor_interval.f_continuous =  |- (#forall:fun(fun(real,bool),bool) (\dd_bound:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\w:real. (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\df_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\ddf_bounds:prod(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) dd_bound:real) (#iabs:fun(prod(real,real),real) ddf_bounds:prod(real,real)))) ((#==>:fun(bool,fun(bool,bool)) ((((((((#taylor_interval:fun(fun(real,real),fun(real,fun(real,fun(real,fun(real,fun(prod(real,real),fun(prod(real,real),fun(prod(real,real),bool)))))))) f:fun(real,real)) x:real) y:real) z:real) w:real) f_bounds:prod(real,real)) df_bounds:prod(real,real)) ddf_bounds:prod(real,real))) (#forall:fun(fun(real,bool),bool) (\t:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) t:real) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) x:real) z:real)) #NIL:list(prod(real,real)))))) ((#real_continuous:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) t:real)))))))))))))))))))))))))
      #|Taylor_interval.taylor_error =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\ddf_bounds:prod(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(prod(real,real),bool),bool) (\df_bounds:prod(real,real). (#forall:fun(fun(real,bool),bool) (\w:real. (#forall:fun(fun(real,bool),bool) (\dd_bound:real. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) dd_bound:real) (#iabs:fun(prod(real,real),real) ddf_bounds:prod(real,real)))) ((#==>:fun(bool,fun(bool,bool)) ((((((((#taylor_interval:fun(fun(real,real),fun(real,fun(real,fun(real,fun(real,fun(prod(real,real),fun(prod(real,real),fun(prod(real,real),bool)))))))) f:fun(real,real)) x:real) y:real) z:real) w:real) f_bounds:prod(real,real)) df_bounds:prod(real,real)) ddf_bounds:prod(real,real))) (#forall:fun(fun(real,bool),bool) (\t:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) t:real)) ((#real_le:fun(real,fun(real,bool)) t:real) z:real))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) t:real)) (f:fun(real,real) y:real)))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) w:real) (#iabs:fun(prod(real,real),real) df_bounds:prod(real,real)))) ((#real_mul:fun(real,fun(real,real)) w:real) ((#real_mul:fun(real,fun(real,real)) w:real) ((#real_div:fun(real,fun(real,real)) dd_bound:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))))))))))))))))))))))
      #|Taylor_interval.taylor_upper_bound =  |- (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(prod(real,real),bool),bool) (\ddf_bounds:prod(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\df_bounds:prod(real,real). (#forall:fun(fun(real,bool),bool) (\w:real. (#forall:fun(fun(real,bool),bool) (\dd_bound:real. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) dd_bound:real) (#iabs:fun(prod(real,real),real) ddf_bounds:prod(real,real)))) ((#==>:fun(bool,fun(bool,bool)) ((((((((#taylor_interval:fun(fun(real,real),fun(real,fun(real,fun(real,fun(real,fun(prod(real,real),fun(prod(real,real),fun(prod(real,real),bool)))))))) f:fun(real,real)) x:real) y:real) z:real) w:real) f_bounds:prod(real,real)) df_bounds:prod(real,real)) ddf_bounds:prod(real,real))) (#forall:fun(fun(real,bool),bool) (\t:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) t:real)) ((#real_le:fun(real,fun(real,bool)) t:real) z:real))) ((#real_le:fun(real,fun(real,bool)) (f:fun(real,real) t:real)) ((#real_add:fun(real,fun(real,real)) (#SND:fun(prod(real,real),real) f_bounds:prod(real,real))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) w:real) (#iabs:fun(prod(real,real),real) df_bounds:prod(real,real)))) ((#real_mul:fun(real,fun(real,real)) w:real) ((#real_mul:fun(real,fun(real,real)) w:real) ((#real_div:fun(real,fun(real,real)) dd_bound:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))))))))))))))))))))))
      #|Taylor_interval.taylor_lower_bound =  |- (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(prod(real,real),bool),bool) (\ddf_bounds:prod(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\df_bounds:prod(real,real). (#forall:fun(fun(real,bool),bool) (\w:real. (#forall:fun(fun(real,bool),bool) (\dd_bound:real. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) dd_bound:real) (#iabs:fun(prod(real,real),real) ddf_bounds:prod(real,real)))) ((#==>:fun(bool,fun(bool,bool)) ((((((((#taylor_interval:fun(fun(real,real),fun(real,fun(real,fun(real,fun(real,fun(prod(real,real),fun(prod(real,real),fun(prod(real,real),bool)))))))) f:fun(real,real)) x:real) y:real) z:real) w:real) f_bounds:prod(real,real)) df_bounds:prod(real,real)) ddf_bounds:prod(real,real))) (#forall:fun(fun(real,bool),bool) (\t:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) t:real)) ((#real_le:fun(real,fun(real,bool)) t:real) z:real))) ((#real_le:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) (#FST:fun(prod(real,real),real) f_bounds:prod(real,real))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) w:real) (#iabs:fun(prod(real,real),real) df_bounds:prod(real,real)))) ((#real_mul:fun(real,fun(real,real)) w:real) ((#real_mul:fun(real,fun(real,real)) w:real) ((#real_div:fun(real,fun(real,real)) dd_bound:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))) (f:fun(real,real) t:real)))))))))))))))))))))))))
      #|Taylor_interval.taylor_derivative_error =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\df_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\ddf_bounds:prod(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\w:real. (#forall:fun(fun(real,bool),bool) (\dd_bound:real. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) dd_bound:real) (#iabs:fun(prod(real,real),real) ddf_bounds:prod(real,real)))) ((#==>:fun(bool,fun(bool,bool)) ((((((((#taylor_interval:fun(fun(real,real),fun(real,fun(real,fun(real,fun(real,fun(prod(real,real),fun(prod(real,real),fun(prod(real,real),bool)))))))) f:fun(real,real)) x:real) y:real) z:real) w:real) f_bounds:prod(real,real)) df_bounds:prod(real,real)) ddf_bounds:prod(real,real))) (#forall:fun(fun(real,bool),bool) (\t:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) t:real)) ((#real_le:fun(real,fun(real,bool)) t:real) z:real))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) t:real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) y:real)))) ((#real_mul:fun(real,fun(real,real)) w:real) dd_bound:real)))))))))))))))))))))))))
      #|Taylor_interval.derivative_interval =  |- (#forall:fun(fun(real,bool),bool) (\dd_bound:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(real,bool),bool) (\w:real. (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\ddf_bounds:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(prod(real,real),bool),bool) (\df_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) dd_bound:real) (#iabs:fun(prod(real,real),real) ddf_bounds:prod(real,real)))) ((#==>:fun(bool,fun(bool,bool)) ((((((((#taylor_interval:fun(fun(real,real),fun(real,fun(real,fun(real,fun(real,fun(prod(real,real),fun(prod(real,real),fun(prod(real,real),bool)))))))) f:fun(real,real)) x:real) y:real) z:real) w:real) f_bounds:prod(real,real)) df_bounds:prod(real,real)) ddf_bounds:prod(real,real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#FST:fun(prod(real,real),real) df_bounds:prod(real,real))) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) y:real))) ((#real_le:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) y:real)) (#SND:fun(prod(real,real),real) df_bounds:prod(real,real))))))))))))))))))))))))
      #|Taylor_interval.taylor_derivative_upper_bound =  |- (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\ddf_bounds:prod(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\df_bounds:prod(real,real). (#forall:fun(fun(real,bool),bool) (\w:real. (#forall:fun(fun(real,bool),bool) (\dd_bound:real. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) dd_bound:real) (#iabs:fun(prod(real,real),real) ddf_bounds:prod(real,real)))) ((#==>:fun(bool,fun(bool,bool)) ((((((((#taylor_interval:fun(fun(real,real),fun(real,fun(real,fun(real,fun(real,fun(prod(real,real),fun(prod(real,real),fun(prod(real,real),bool)))))))) f:fun(real,real)) x:real) y:real) z:real) w:real) f_bounds:prod(real,real)) df_bounds:prod(real,real)) ddf_bounds:prod(real,real))) (#forall:fun(fun(real,bool),bool) (\t:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) t:real)) ((#real_le:fun(real,fun(real,bool)) t:real) z:real))) ((#real_le:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) t:real)) ((#real_add:fun(real,fun(real,real)) (#SND:fun(prod(real,real),real) df_bounds:prod(real,real))) ((#real_mul:fun(real,fun(real,real)) w:real) dd_bound:real))))))))))))))))))))))))))
      #|Taylor_interval.taylor_derivative_lower_bound =  |- (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\ddf_bounds:prod(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(prod(real,real),bool),bool) (\df_bounds:prod(real,real). (#forall:fun(fun(real,bool),bool) (\w:real. (#forall:fun(fun(real,bool),bool) (\dd_bound:real. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) dd_bound:real) (#iabs:fun(prod(real,real),real) ddf_bounds:prod(real,real)))) ((#==>:fun(bool,fun(bool,bool)) ((((((((#taylor_interval:fun(fun(real,real),fun(real,fun(real,fun(real,fun(real,fun(prod(real,real),fun(prod(real,real),fun(prod(real,real),bool)))))))) f:fun(real,real)) x:real) y:real) z:real) w:real) f_bounds:prod(real,real)) df_bounds:prod(real,real)) ddf_bounds:prod(real,real))) (#forall:fun(fun(real,bool),bool) (\t:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) t:real)) ((#real_le:fun(real,fun(real,bool)) t:real) z:real))) ((#real_le:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) (#FST:fun(prod(real,real),real) df_bounds:prod(real,real))) ((#real_mul:fun(real,fun(real,real)) w:real) dd_bound:real))) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) t:real)))))))))))))))))))))))))
      #|Taylor_interval.lin_approx_eq =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(prod(real,real),bool),bool) (\df_bounds:prod(real,real). ((#=:fun(bool,fun(bool,bool)) ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) f:fun(real,real)) x:real) f_bounds:prod(real,real)) df_bounds:prod(real,real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) ((#/\:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) (f:fun(real,real) x:real)) f_bounds:prod(real,real))) ((#interval_arith:fun(real,fun(prod(real,real),bool)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) df_bounds:prod(real,real)))))))))))))
      #|Taylor_interval.lin_approx_imp_f_interval =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\df_bounds:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) f:fun(real,real)) x:real) f_bounds:prod(real,real)) df_bounds:prod(real,real))) ((#interval_arith:fun(real,fun(prod(real,real),bool)) (f:fun(real,real) x:real)) f_bounds:prod(real,real)))))))))))
      #|Taylor_interval.lin_approx_imp_df_interval =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(prod(real,real),bool),bool) (\df_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) f:fun(real,real)) x:real) f_bounds:prod(real,real)) df_bounds:prod(real,real))) ((#interval_arith:fun(real,fun(prod(real,real),bool)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) df_bounds:prod(real,real)))))))))))
      #|Taylor_interval.lin_approx_imp_f_diff =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\df_bounds:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) f:fun(real,real)) x:real) f_bounds:prod(real,real)) df_bounds:prod(real,real))) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real)))))))))))
      #|Taylor_interval.interval_arith_not_zero =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) x:real) int:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (#interval_not_zero:fun(prod(real,real),bool) int:prod(real,real))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|Taylor_interval.interval_arith_pos =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) x:real) int:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (#interval_pos:fun(prod(real,real),bool) int:prod(real,real))) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)))))))
      #|Taylor_interval.interval_arith_neg =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) x:real) int:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (#interval_neg:fun(prod(real,real),bool) int:prod(real,real))) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))
      #|Taylor_interval.interval_arith_abs =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) x:real) int:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#iabs:fun(prod(real,real),real) int:prod(real,real))) y:real)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) y:real)))))))))
      #|Taylor_interval.lin_approx_x =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) (\x:real. x:real)) x:real) ((#,:fun(real,fun(real,prod(real,real))) x:real) x:real)) ((#,:fun(real,fun(real,prod(real,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|Taylor_interval.lin_approx_const =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\c:real. ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) (\x:real. c:real)) x:real) ((#,:fun(real,fun(real,prod(real,real))) c:real) c:real)) ((#,:fun(real,fun(real,prod(real,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|Taylor_interval.lin_approx_compose_atn =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\df_bounds:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) f:fun(real,real)) x:real) f_bounds:prod(real,real)) df_bounds:prod(real,real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (\x:real. (#atn:fun(real,real) (f:fun(real,real) x:real)))) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. (#atn:fun(real,real) (f:fun(real,real) x:real)))) x:real)) ((#real_div:fun(real,fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (f:fun(real,real) x:real)))))))))))))))
      #|Taylor_interval.lin_approx_compose_exp =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\df_bounds:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) f:fun(real,real)) x:real) f_bounds:prod(real,real)) df_bounds:prod(real,real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (\x:real. (#exp:fun(real,real) (f:fun(real,real) x:real)))) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. (#exp:fun(real,real) (f:fun(real,real) x:real)))) x:real)) ((#real_mul:fun(real,fun(real,real)) (#exp:fun(real,real) (f:fun(real,real) x:real))) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)))))))))))))
      #|Taylor_interval.lin_approx_compose_log =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\df_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) f:fun(real,real)) x:real) f_bounds:prod(real,real)) df_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (#interval_pos:fun(prod(real,real),bool) f_bounds:prod(real,real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (\x:real. (#log:fun(real,real) (f:fun(real,real) x:real)))) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. (#log:fun(real,real) (f:fun(real,real) x:real)))) x:real)) ((#real_div:fun(real,fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (f:fun(real,real) x:real))))))))))))))
      #|Taylor_interval.lin_approx_compose_cos =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\df_bounds:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) f:fun(real,real)) x:real) f_bounds:prod(real,real)) df_bounds:prod(real,real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (\x:real. (#cos:fun(real,real) (f:fun(real,real) x:real)))) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. (#cos:fun(real,real) (f:fun(real,real) x:real)))) x:real)) (#real_neg:fun(real,real) ((#real_mul:fun(real,fun(real,real)) (#sin:fun(real,real) (f:fun(real,real) x:real))) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real))))))))))))))
      #|Taylor_interval.lin_approx_compose_sin =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\df_bounds:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) f:fun(real,real)) x:real) f_bounds:prod(real,real)) df_bounds:prod(real,real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (\x:real. (#sin:fun(real,real) (f:fun(real,real) x:real)))) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. (#sin:fun(real,real) (f:fun(real,real) x:real)))) x:real)) ((#real_mul:fun(real,fun(real,real)) (#cos:fun(real,real) (f:fun(real,real) x:real))) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)))))))))))))
      #|Taylor_interval.lin_approx_compose_inv =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\df_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) f:fun(real,real)) x:real) f_bounds:prod(real,real)) df_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (#interval_not_zero:fun(prod(real,real),bool) f_bounds:prod(real,real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (\x:real. (#real_inv:fun(real,real) (f:fun(real,real) x:real)))) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. (#real_inv:fun(real,real) (f:fun(real,real) x:real)))) x:real)) ((#real_mul:fun(real,fun(real,real)) (#real_neg:fun(real,real) (#real_inv:fun(real,real) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (f:fun(real,real) x:real))))) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real))))))))))))))
      #|Taylor_interval.lin_approx_compose_sqrt =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\df_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) f:fun(real,real)) x:real) f_bounds:prod(real,real)) df_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (#interval_pos:fun(prod(real,real),bool) f_bounds:prod(real,real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (\x:real. (#sqrt:fun(real,real) (f:fun(real,real) x:real)))) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. (#sqrt:fun(real,real) (f:fun(real,real) x:real)))) x:real)) ((#real_div:fun(real,fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#sqrt:fun(real,real) (f:fun(real,real) x:real))))))))))))))))
      #|Taylor_interval.lin_approx_compose_acs =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\df_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) f:fun(real,real)) x:real) f_bounds:prod(real,real)) df_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#iabs:fun(prod(real,real),real) f_bounds:prod(real,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (\x:real. (#acs:fun(real,real) (f:fun(real,real) x:real)))) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. (#acs:fun(real,real) (f:fun(real,real) x:real)))) x:real)) (#real_neg:fun(real,real) ((#real_div:fun(real,fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#sqrt:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (f:fun(real,real) x:real))))))))))))))))))
      #|Taylor_interval.lin_approx_compose_asn =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\df_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) f:fun(real,real)) x:real) f_bounds:prod(real,real)) df_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#iabs:fun(prod(real,real),real) f_bounds:prod(real,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (\x:real. (#asn:fun(real,real) (f:fun(real,real) x:real)))) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. (#asn:fun(real,real) (f:fun(real,real) x:real)))) x:real)) ((#real_div:fun(real,fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#sqrt:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (f:fun(real,real) x:real)))))))))))))))))
      #|Taylor_interval.lin_approx_compose_matan =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\df_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) f:fun(real,real)) x:real) f_bounds:prod(real,real)) df_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((#interval_gt:fun(real,fun(prod(real,real),bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) f_bounds:prod(real,real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (\x:real. (#matan:fun(real,real) (f:fun(real,real) x:real)))) (#atreal:fun(real,net(real)) x:real))) ((#=:fun(real,fun(real,bool)) ((#derivative:fun(fun(real,real),fun(real,real)) (\x:real. (#matan:fun(real,real) (f:fun(real,real) x:real)))) x:real)) ((#real_mul:fun(real,fun(real,real)) (#dmatan:fun(real,real) (f:fun(real,real) x:real))) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real))))))))))))))
      #|Taylor_interval.lin_approx_imp_add_diff =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\df_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\g_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dg_bounds:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) f:fun(real,real)) x:real) f_bounds:prod(real,real)) df_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) g:fun(real,real)) x:real) g_bounds:prod(real,real)) dg_bounds:prod(real,real))) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (\x:real. ((#real_add:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) (#atreal:fun(real,net(real)) x:real))))))))))))))))))
      #|Taylor_interval.lin_approx_imp_sub_diff =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\df_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\g_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dg_bounds:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) f:fun(real,real)) x:real) f_bounds:prod(real,real)) df_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) g:fun(real,real)) x:real) g_bounds:prod(real,real)) dg_bounds:prod(real,real))) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (\x:real. ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) (#atreal:fun(real,net(real)) x:real))))))))))))))))))
      #|Taylor_interval.lin_approx_imp_mul_diff =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\df_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\g_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dg_bounds:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) f:fun(real,real)) x:real) f_bounds:prod(real,real)) df_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) g:fun(real,real)) x:real) g_bounds:prod(real,real)) dg_bounds:prod(real,real))) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (\x:real. ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) (#atreal:fun(real,net(real)) x:real))))))))))))))))))
      #|Taylor_interval.lin_approx_imp_div_diff =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\df_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dg_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\g_bounds:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) f:fun(real,real)) x:real) f_bounds:prod(real,real)) df_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) g:fun(real,real)) x:real) g_bounds:prod(real,real)) dg_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (#interval_not_zero:fun(prod(real,real),bool) g_bounds:prod(real,real))) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (\x:real. ((#real_div:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) (#atreal:fun(real,net(real)) x:real)))))))))))))))))))
      #|Taylor_interval.lin_approx_scale =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\f1_bounds:prod(real,real). (#forall:fun(fun(real,bool),bool) (\df1_lo:real. (#forall:fun(fun(real,bool),bool) (\df1_hi:real. (#forall:fun(fun(fun(real,real),bool),bool) (\f1:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(real,bool),bool) (\df_lo:real. (#forall:fun(fun(real,bool),bool) (\df_hi:real. ((#==>:fun(bool,fun(bool,bool)) ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) f1:fun(real,real)) x:real) f1_bounds:prod(real,real)) ((#,:fun(real,fun(real,prod(real,real))) df1_lo:real) df1_hi:real))) (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) c:real)) ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) ((#real_mul:fun(real,fun(real,real)) c:real) (f1:fun(real,real) x:real))) f_bounds:prod(real,real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) df_lo:real) ((#real_mul:fun(real,fun(real,real)) c:real) df1_lo:real))) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) c:real) df1_hi:real)) df_hi:real)))) ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) (\x:real. ((#real_mul:fun(real,fun(real,real)) c:real) (f1:fun(real,real) x:real)))) x:real) f_bounds:prod(real,real)) ((#,:fun(real,fun(real,prod(real,real))) df_lo:real) df_hi:real)))))))))))))))))))))))
      #|Taylor_interval.lin_approx_add =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\f1_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\f2_bounds:prod(real,real). (#forall:fun(fun(real,bool),bool) (\df1_lo:real. (#forall:fun(fun(real,bool),bool) (\df2_lo:real. (#forall:fun(fun(real,bool),bool) (\df1_hi:real. (#forall:fun(fun(real,bool),bool) (\df2_hi:real. (#forall:fun(fun(fun(real,real),bool),bool) (\f1:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f2:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(real,bool),bool) (\df_lo:real. (#forall:fun(fun(real,bool),bool) (\df_hi:real. ((#==>:fun(bool,fun(bool,bool)) ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) f1:fun(real,real)) x:real) f1_bounds:prod(real,real)) ((#,:fun(real,fun(real,prod(real,real))) df1_lo:real) df1_hi:real))) ((#==>:fun(bool,fun(bool,bool)) ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) f2:fun(real,real)) x:real) f2_bounds:prod(real,real)) ((#,:fun(real,fun(real,prod(real,real))) df2_lo:real) df2_hi:real))) ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) ((#real_add:fun(real,fun(real,real)) (f1:fun(real,real) x:real)) (f2:fun(real,real) x:real))) f_bounds:prod(real,real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) df_lo:real) ((#real_add:fun(real,fun(real,real)) df1_lo:real) df2_lo:real))) ((#real_le:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) df1_hi:real) df2_hi:real)) df_hi:real)))) ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) (\x:real. ((#real_add:fun(real,fun(real,real)) (f1:fun(real,real) x:real)) (f2:fun(real,real) x:real)))) x:real) f_bounds:prod(real,real)) ((#,:fun(real,fun(real,prod(real,real))) df_lo:real) df_hi:real)))))))))))))))))))))))))))))
      #|Taylor_interval.nth_diff_strong2_eq_alt =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (#?:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#/\:fun(bool,fun(bool,bool)) (#real_open:fun(fun(real,bool),bool) s:fun(real,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) y:real) s:fun(real,bool))) ((#/\:fun(bool,fun(bool,bool)) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) f:fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) y:real)) (#atreal:fun(real,net(real)) y:real))) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) (#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real))) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) y:real)) (#atreal:fun(real,net(real)) y:real)))))))))))))))
      #|Taylor_interval.nth_diff_strong2_eq =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (#?:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#/\:fun(bool,fun(bool,bool)) (#real_open:fun(fun(real,bool),bool) s:fun(real,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) y:real) s:fun(real,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) y:real))) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real))) (#atreal:fun(real,net(real)) y:real)))))))))))))))
      #|Taylor_interval.lin_approx_compose =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(prod(real,real),bool),bool) (\g_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\d_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) g_bounds:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) g:fun(real,real)) (#atreal:fun(real,net(real)) y:real))) ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) (g:fun(real,real) y:real)) g_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) f:fun(real,real)) g_bounds:prod(real,real)) f_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) ((#real_mul:fun(real,fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) g:fun(real,real)) y:real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) (g:fun(real,real) y:real)))) d_bounds:prod(real,real))) ((((#lin_approx:fun(fun(real,real),fun(real,fun(prod(real,real),fun(prod(real,real),bool)))) (\x:real. (f:fun(real,real) (g:fun(real,real) x:real)))) y:real) f_bounds:prod(real,real)) d_bounds:prod(real,real)))))))))))))))))))
      #|Taylor_interval.second_derivative_abs_pos =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #real_abs:fun(real,real)) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))
      #|Taylor_interval.second_derivative_abs_neg =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #real_abs:fun(real,real)) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))
      #|Taylor_interval.diff2_abs_pos =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #real_abs:fun(real,real)) x:real))))
      #|Taylor_interval.diff2_abs_neg =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #real_abs:fun(real,real)) x:real))))
      #|Taylor_interval.pow_x_has_real_derivative =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) (\x:real. ((#real_pow:fun(real,fun(num,real)) x:real) n:num))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) x:real) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#atreal:fun(real,net(real)) x:real))))))
      #|Taylor_interval.second_derivative_pow_x =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#derivative:fun(fun(real,real),fun(real,real)) (#derivative:fun(fun(real,real),fun(real,real)) (\x:real. ((#real_pow:fun(real,fun(num,real)) x:real) n:num))))) (\x:real. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#*:fun(num,fun(num,num)) n:num) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|Taylor_interval.diff2_pow_x =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. ((#real_pow:fun(real,fun(num,real)) x:real) n:num))) x:real)))))
      #|Taylor_interval.second_derivative_pow2_x =  |- ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#derivative:fun(fun(real,real),fun(real,real)) (#derivative:fun(fun(real,real),fun(real,real)) (\x:real. ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (\x:real. (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|Taylor_interval.second_derivative_pow3_x =  |- ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#derivative:fun(fun(real,real),fun(real,real)) (#derivative:fun(fun(real,real),fun(real,real)) (\x:real. ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (\x:real. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) x:real)))
      #|Taylor_interval.second_derivative_atn_eq =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) (\x:real. (#real_inv:fun(real,real) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_mul:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) x:real)) ((#real_pow:fun(real,fun(num,real)) (#real_inv:fun(real,real) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#atreal:fun(real,net(real)) x:real))))
      #|Taylor_interval.second_derivative_atn =  |- ((#=:fun(fun(real,real),fun(fun(real,real),bool)) (#derivative:fun(fun(real,real),fun(real,real)) (#derivative:fun(fun(real,real),fun(real,real)) #atn:fun(real,real)))) (\x:real. ((#real_mul:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) x:real)) ((#real_pow:fun(real,fun(num,real)) (#real_inv:fun(real,real) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|Taylor_interval.diff2_atn =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #atn:fun(real,real)) x:real)))
      #|Taylor_interval.second_derivative_cos =  |- ((#=:fun(fun(real,real),fun(fun(real,real),bool)) ((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #cos:fun(real,real))) (\x:real. (#real_neg:fun(real,real) (#cos:fun(real,real) x:real))))
      #|Taylor_interval.diff2_cos =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #cos:fun(real,real)) x:real)))
      #|Taylor_interval.second_derivative_sin =  |- ((#=:fun(fun(real,real),fun(fun(real,real),bool)) ((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #sin:fun(real,real))) (\x:real. (#real_neg:fun(real,real) (#sin:fun(real,real) x:real))))
      #|Taylor_interval.diff2_sin =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #sin:fun(real,real)) x:real)))
      #|Taylor_interval.second_derivative_exp =  |- ((#=:fun(fun(real,real),fun(fun(real,real),bool)) ((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #exp:fun(real,real))) #exp:fun(real,real))
      #|Taylor_interval.diff2_exp =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #exp:fun(real,real)) x:real)))
      #|Taylor_interval.second_derivative_log =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #log:fun(real,real)) x:real)) (#real_neg:fun(real,real) (#real_inv:fun(real,real) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|Taylor_interval.diff2_log =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #log:fun(real,real)) x:real))))
      #|Taylor_interval.second_derivative_inv =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #real_inv:fun(real,real)) x:real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_inv:fun(real,real) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|Taylor_interval.diff2_inv =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #real_inv:fun(real,real)) x:real))))
      #|Taylor_interval.SQRT_POW =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) (#sqrt:fun(real,real) x:real)) n:num)) (#sqrt:fun(real,real) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))))))
      #|Taylor_interval.second_derivative_sqrt =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #sqrt:fun(real,real)) x:real)) (#real_neg:fun(real,real) (#real_inv:fun(real,real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#sqrt:fun(real,real) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))
      #|Taylor_interval.diff2_sqrt =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #sqrt:fun(real,real)) x:real))))
      #|Taylor_interval.real_powS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) (#SUC:fun(num,num) n:num))) ((#real_mul:fun(real,fun(real,real)) x:real) ((#real_pow:fun(real,fun(num,real)) x:real) n:num)))))))
      #|Taylor_interval.second_derivative_acs =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #acs:fun(real,real)) x:real)) (#real_neg:fun(real,real) ((#real_div:fun(real,fun(real,real)) x:real) (#sqrt:fun(real,real) ((#real_pow:fun(real,fun(num,real)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_mul:fun(real,fun(real,real)) x:real) x:real))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))
      #|Taylor_interval.diff2_acs =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #acs:fun(real,real)) x:real))))
      #|Taylor_interval.second_derivative_asn =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #asn:fun(real,real)) x:real)) ((#real_div:fun(real,fun(real,real)) x:real) (#sqrt:fun(real,real) ((#real_pow:fun(real,fun(num,real)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_mul:fun(real,fun(real,real)) x:real) x:real))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|Taylor_interval.diff2_asn =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #asn:fun(real,real)) x:real))))
      #|Taylor_interval.second_derivative_matan =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #matan:fun(real,real)) x:real)) (#ddmatan:fun(real,real) x:real))))
      #|Taylor_interval.diff2_matan =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:real)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #matan:fun(real,real)) x:real))))
      #|Taylor_interval.REAL_CONTINUOUS_OPEN_PREIMAGE =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). (#forall:fun(fun(fun(real,bool),bool),bool) (\t:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#real_continuous_on:fun(fun(real,real),fun(fun(real,bool),bool)) f:fun(real,real)) s:fun(real,bool))) ((#==>:fun(bool,fun(bool,bool)) (#real_open:fun(fun(real,bool),bool) s:fun(real,bool))) ((#==>:fun(bool,fun(bool,bool)) (#real_open:fun(fun(real,bool),bool) t:fun(real,bool))) (#real_open:fun(fun(real,bool),bool) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%1:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%1:real) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) ((#IN:fun(real,fun(fun(real,bool),bool)) (f:fun(real,real) x:real)) t:fun(real,bool)))) x:real)))))))))))))))
      #|Taylor_interval.second_derivative_compose =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) g:fun(real,real)) x:real)) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) (g:fun(real,real) x:real))) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. (f:fun(real,real) (g:fun(real,real) x:real)))) x:real)) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) (g:fun(real,real) x:real))) ((#real_pow:fun(real,fun(num,real)) ((#derivative:fun(fun(real,real),fun(real,real)) g:fun(real,real)) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_mul:fun(real,fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) (g:fun(real,real) x:real))) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) g:fun(real,real)) x:real))))))))))))
      #|Taylor_interval.diff2_compose =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) g:fun(real,real)) x:real)) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) (g:fun(real,real) x:real))) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. (f:fun(real,real) (g:fun(real,real) x:real)))) x:real)))))))))
      #|Taylor_interval.continuous_not0_exists_open =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#==>:fun(bool,fun(bool,bool)) ((#real_continuous:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) (#?:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#/\:fun(bool,fun(bool,bool)) (#real_open:fun(fun(real,bool),bool) s:fun(real,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) y:real) s:fun(real,bool))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) y:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))))))))))
      #|Taylor_interval.continuous_gt_exists_open =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) (f:fun(real,real) x:real))) ((#==>:fun(bool,fun(bool,bool)) ((#real_continuous:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) (#?:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#/\:fun(bool,fun(bool,bool)) (#real_open:fun(fun(real,bool),bool) s:fun(real,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) y:real) s:fun(real,bool))) ((#real_lt:fun(real,fun(real,bool)) a:real) (f:fun(real,real) y:real)))))))))))))))))
      #|Taylor_interval.continuous_lt_exists_open =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) a:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_continuous:fun(fun(real,real),fun(net(real),bool)) f:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) (#?:fun(fun(fun(real,bool),bool),bool) (\s:fun(real,bool). ((#/\:fun(bool,fun(bool,bool)) (#real_open:fun(fun(real,bool),bool) s:fun(real,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) s:fun(real,bool))) (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(real,fun(fun(real,bool),bool)) y:real) s:fun(real,bool))) ((#real_lt:fun(real,fun(real,bool)) (f:fun(real,real) y:real)) a:real))))))))))))))))
      #|Taylor_interval.second_derivative_compose_abs_pos =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun(real,real) x:real))) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. (#real_abs:fun(real,real) (f:fun(real,real) x:real)))) x:real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real))))))))
      #|Taylor_interval.second_derivative_compose_abs_neg =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. (#real_abs:fun(real,real) (f:fun(real,real) x:real)))) x:real)) (#real_neg:fun(real,real) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)))))))))
      #|Taylor_interval.second_derivative_compose_pow =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. ((#real_pow:fun(real,fun(num,real)) (f:fun(real,real) x:real)) n:num))) x:real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#real_pow:fun(real,fun(num,real)) (f:fun(real,real) x:real)) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (f:fun(real,real) x:real)) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_pow:fun(real,fun(num,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))))))
      #|Taylor_interval.second_derivative_compose_pow2 =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. ((#real_pow:fun(real,fun(num,real)) (f:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) x:real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (f:fun(real,real) x:real))) ((#real_pow:fun(real,fun(num,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))
      #|Taylor_interval.second_derivative_compose_pow3 =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. ((#real_pow:fun(real,fun(num,real)) (f:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) x:real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#real_pow:fun(real,fun(num,real)) (f:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) ((#real_pow:fun(real,fun(num,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))))
      #|Taylor_interval.second_derivative_compose_atn =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. (#atn:fun(real,real) (f:fun(real,real) x:real)))) x:real)) ((#real_div:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (f:fun(real,real) x:real))))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) ((#real_pow:fun(real,fun(num,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_pow:fun(real,fun(num,real)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (f:fun(real,real) x:real)))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))
      #|Taylor_interval.second_derivative_compose_cos =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. (#cos:fun(real,real) (f:fun(real,real) x:real)))) x:real)) (#real_neg:fun(real,real) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (#sin:fun(real,real) (f:fun(real,real) x:real)))) ((#real_mul:fun(real,fun(real,real)) (#cos:fun(real,real) (f:fun(real,real) x:real))) ((#real_pow:fun(real,fun(num,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))
      #|Taylor_interval.second_derivative_compose_sin =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. (#sin:fun(real,real) (f:fun(real,real) x:real)))) x:real)) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (#cos:fun(real,real) (f:fun(real,real) x:real)))) ((#real_mul:fun(real,fun(real,real)) (#sin:fun(real,real) (f:fun(real,real) x:real))) ((#real_pow:fun(real,fun(num,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))
      #|Taylor_interval.second_derivative_compose_exp =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. (#exp:fun(real,real) (f:fun(real,real) x:real)))) x:real)) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (#exp:fun(real,real) (f:fun(real,real) x:real)))) ((#real_mul:fun(real,fun(real,real)) (#exp:fun(real,real) (f:fun(real,real) x:real))) ((#real_pow:fun(real,fun(num,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))
      #|Taylor_interval.second_derivative_compose_log =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun(real,real) x:real))) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. (#log:fun(real,real) (f:fun(real,real) x:real)))) x:real)) ((#real_sub:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (f:fun(real,real) x:real))) ((#real_pow:fun(real,fun(num,real)) ((#real_div:fun(real,fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (f:fun(real,real) x:real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))
      #|Taylor_interval.second_derivative_compose_inv =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. (#real_inv:fun(real,real) (f:fun(real,real) x:real)))) x:real)) ((#real_div:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_pow:fun(real,fun(num,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (f:fun(real,real) x:real)))) ((#real_pow:fun(real,fun(num,real)) (f:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))
      #|Taylor_interval.second_derivative_compose_sqrt =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun(real,real) x:real))) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. (#sqrt:fun(real,real) (f:fun(real,real) x:real)))) x:real)) ((#real_div:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (f:fun(real,real) x:real)))) ((#real_pow:fun(real,fun(num,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#sqrt:fun(real,real) ((#real_pow:fun(real,fun(num,real)) (f:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))))
      #|Taylor_interval.second_derivative_compose_acs =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(real,real) x:real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. (#acs:fun(real,real) (f:fun(real,real) x:real)))) x:real)) (#real_neg:fun(real,real) ((#real_div:fun(real,fun(real,real)) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (f:fun(real,real) x:real))))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) ((#real_pow:fun(real,fun(num,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#sqrt:fun(real,real) ((#real_pow:fun(real,fun(num,real)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (f:fun(real,real) x:real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))))
      #|Taylor_interval.second_derivative_compose_asn =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(real,real) x:real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. (#asn:fun(real,real) (f:fun(real,real) x:real)))) x:real)) ((#real_div:fun(real,fun(real,real)) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (f:fun(real,real) x:real))))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) ((#real_pow:fun(real,fun(num,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#sqrt:fun(real,real) ((#real_pow:fun(real,fun(num,real)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (f:fun(real,real) x:real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))
      #|Taylor_interval.second_derivative_compose_matan =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (f:fun(real,real) x:real))) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. (#matan:fun(real,real) (f:fun(real,real) x:real)))) x:real)) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (#dmatan:fun(real,real) (f:fun(real,real) x:real)))) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#ddmatan:fun(real,real) (f:fun(real,real) x:real)))))))))))
      #|Taylor_interval.diff2_compose_abs_pos =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun(real,real) x:real))) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. (#real_abs:fun(real,real) (f:fun(real,real) x:real)))) x:real)))))))
      #|Taylor_interval.diff2_compose_abs_neg =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. (#real_abs:fun(real,real) (f:fun(real,real) x:real)))) x:real)))))))
      #|Taylor_interval.diff2_compose_pow =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (#forall:fun(fun(num,bool),bool) (\n:num. (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. ((#real_pow:fun(real,fun(num,real)) (f:fun(real,real) x:real)) n:num))) x:real))))))))
      #|Taylor_interval.diff2_compose_atn =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. (#atn:fun(real,real) (f:fun(real,real) x:real)))) x:real))))))
      #|Taylor_interval.diff2_compose_cos =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. (#cos:fun(real,real) (f:fun(real,real) x:real)))) x:real))))))
      #|Taylor_interval.diff2_compose_sin =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. (#sin:fun(real,real) (f:fun(real,real) x:real)))) x:real))))))
      #|Taylor_interval.diff2_compose_exp =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. (#exp:fun(real,real) (f:fun(real,real) x:real)))) x:real))))))
      #|Taylor_interval.diff2_compose_log =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun(real,real) x:real))) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. (#log:fun(real,real) (f:fun(real,real) x:real)))) x:real)))))))
      #|Taylor_interval.diff2_compose_inv =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (f:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. (#real_inv:fun(real,real) (f:fun(real,real) x:real)))) x:real)))))))
      #|Taylor_interval.diff2_compose_sqrt =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (f:fun(real,real) x:real))) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. (#sqrt:fun(real,real) (f:fun(real,real) x:real)))) x:real)))))))
      #|Taylor_interval.diff2_compose_acs =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(real,real) x:real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. (#acs:fun(real,real) (f:fun(real,real) x:real)))) x:real)))))))
      #|Taylor_interval.diff2_compose_asn =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(real,real) x:real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. (#asn:fun(real,real) (f:fun(real,real) x:real)))) x:real)))))))
      #|Taylor_interval.diff2_compose_matan =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (f:fun(real,real) x:real))) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. (#matan:fun(real,real) (f:fun(real,real) x:real)))) x:real)))))))
      #|Taylor_interval.second_derivative_mul =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) g:fun(real,real)) x:real)) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) x:real)) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) g:fun(real,real)) x:real))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_mul:fun(real,fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) ((#derivative:fun(fun(real,real),fun(real,real)) g:fun(real,real)) x:real)))) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (g:fun(real,real) x:real)))))))))))))
      #|Taylor_interval.second_derivative_div =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (g:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) g:fun(real,real)) x:real)) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. ((#real_div:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) x:real)) ((#real_div:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (g:fun(real,real) x:real))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) g:fun(real,real)) x:real)))) (g:fun(real,real) x:real))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_mul:fun(real,fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) g:fun(real,real)) x:real)) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (g:fun(real,real) x:real))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) ((#derivative:fun(fun(real,real),fun(real,real)) g:fun(real,real)) x:real))))))) ((#real_pow:fun(real,fun(num,real)) (g:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))))
      #|Taylor_interval.diff2_div =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) (g:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) g:fun(real,real)) x:real)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. ((#real_div:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) x:real))))))))))
      #|Taylor_interval.second_derivative_scale =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. ((#real_mul:fun(real,fun(real,real)) c:real) (f:fun(real,real) x:real)))) x:real)) ((#real_mul:fun(real,fun(real,real)) c:real) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real))))))))))
      #|Taylor_interval.second_derivative_add =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) g:fun(real,real)) x:real)) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. ((#real_add:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) x:real)) ((#real_add:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) g:fun(real,real)) x:real)))))))))))
      #|Taylor_interval.second_derivative_sub =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong:fun(num,fun(fun(real,real),fun(real,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) g:fun(real,real)) x:real)) ((#=:fun(real,fun(real,bool)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (\x:real. ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) x:real)) ((#real_sub:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) g:fun(real,real)) x:real)))))))))))
      #|Taylor_interval.second_derivative_compose_bounds =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\g_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) int:prod(real,real)) g:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) g:fun(real,real)) int:prod(real,real)) g_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) g_bounds:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) (g:fun(real,real) x:real))) ((#real_pow:fun(real,fun(num,real)) ((#derivative:fun(fun(real,real),fun(real,real)) g:fun(real,real)) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_mul:fun(real,fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) (g:fun(real,real) x:real))) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) g:fun(real,real)) x:real))))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. (f:fun(real,real) (g:fun(real,real) x:real)))) int:prod(real,real)) dd_bounds:prod(real,real))))))))))))))))
      #|Taylor_interval.second_derivative_abs_pos_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (#interval_pos:fun(prod(real,real),bool) int:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) #real_abs:fun(real,real)) int:prod(real,real)) dd_bounds:prod(real,real))))))))
      #|Taylor_interval.second_derivative_abs_neg_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (#interval_neg:fun(prod(real,real),bool) int:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) #real_abs:fun(real,real)) int:prod(real,real)) dd_bounds:prod(real,real))))))))
      #|Taylor_interval.second_derivative_compose_abs_pos_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) f:fun(real,real)) int:prod(real,real)) f_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (#interval_pos:fun(prod(real,real),bool) f_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. (#real_abs:fun(real,real) (f:fun(real,real) x:real)))) int:prod(real,real)) dd_bounds:prod(real,real))))))))))))))
      #|Taylor_interval.second_derivative_compose_abs_neg_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) f:fun(real,real)) int:prod(real,real)) f_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (#interval_neg:fun(prod(real,real),bool) f_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. (#real_neg:fun(real,real) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. (#real_abs:fun(real,real) (f:fun(real,real) x:real)))) int:prod(real,real)) dd_bounds:prod(real,real))))))))))))))
      #|Taylor_interval.second_derivative_pow_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#*:fun(num,fun(num,num)) n:num) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_pow:fun(real,fun(num,real)) x:real) n:num))) int:prod(real,real)) dd_bounds:prod(real,real)))))))))
      #|Taylor_interval.second_derivative_compose_pow_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#real_pow:fun(real,fun(num,real)) (f:fun(real,real) x:real)) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (f:fun(real,real) x:real)) ((#-:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_pow:fun(real,fun(num,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_pow:fun(real,fun(num,real)) (f:fun(real,real) x:real)) n:num))) int:prod(real,real)) dd_bounds:prod(real,real))))))))))))
      #|Taylor_interval.second_derivative_pow2_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) int:prod(real,real)) dd_bounds:prod(real,real)))))))
      #|Taylor_interval.second_derivative_compose_pow2_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (f:fun(real,real) x:real))) ((#real_pow:fun(real,fun(num,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_pow:fun(real,fun(num,real)) (f:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) int:prod(real,real)) dd_bounds:prod(real,real))))))))))
      #|Taylor_interval.second_derivative_pow3_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) x:real))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) int:prod(real,real)) dd_bounds:prod(real,real)))))))
      #|Taylor_interval.second_derivative_compose_pow3_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#real_pow:fun(real,fun(num,real)) (f:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) ((#real_pow:fun(real,fun(num,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_pow:fun(real,fun(num,real)) (f:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) int:prod(real,real)) dd_bounds:prod(real,real))))))))))
      #|Taylor_interval.second_derivative_atn_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_mul:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) x:real)) ((#real_pow:fun(real,fun(num,real)) (#real_inv:fun(real,real) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) #atn:fun(real,real)) int:prod(real,real)) dd_bounds:prod(real,real)))))))
      #|Taylor_interval.second_derivative_compose_atn_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_div:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (f:fun(real,real) x:real))))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) ((#real_pow:fun(real,fun(num,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_pow:fun(real,fun(num,real)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (f:fun(real,real) x:real)))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. (#atn:fun(real,real) (f:fun(real,real) x:real)))) int:prod(real,real)) dd_bounds:prod(real,real))))))))))
      #|Taylor_interval.second_derivative_cos_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. (#real_neg:fun(real,real) (#cos:fun(real,real) x:real)))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) #cos:fun(real,real)) int:prod(real,real)) dd_bounds:prod(real,real)))))))
      #|Taylor_interval.second_derivative_compose_cos_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. (#real_neg:fun(real,real) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (#sin:fun(real,real) (f:fun(real,real) x:real)))) ((#real_mul:fun(real,fun(real,real)) (#cos:fun(real,real) (f:fun(real,real) x:real))) ((#real_pow:fun(real,fun(num,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. (#cos:fun(real,real) (f:fun(real,real) x:real)))) int:prod(real,real)) dd_bounds:prod(real,real))))))))))
      #|Taylor_interval.second_derivative_sin_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. (#real_neg:fun(real,real) (#sin:fun(real,real) x:real)))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) #sin:fun(real,real)) int:prod(real,real)) dd_bounds:prod(real,real)))))))
      #|Taylor_interval.second_derivative_compose_sin_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (#cos:fun(real,real) (f:fun(real,real) x:real)))) ((#real_mul:fun(real,fun(real,real)) (#sin:fun(real,real) (f:fun(real,real) x:real))) ((#real_pow:fun(real,fun(num,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. (#sin:fun(real,real) (f:fun(real,real) x:real)))) int:prod(real,real)) dd_bounds:prod(real,real))))))))))
      #|Taylor_interval.second_derivative_exp_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) #exp:fun(real,real)) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) #exp:fun(real,real)) int:prod(real,real)) dd_bounds:prod(real,real)))))))
      #|Taylor_interval.second_derivative_compose_exp_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (#exp:fun(real,real) (f:fun(real,real) x:real)))) ((#real_mul:fun(real,fun(real,real)) (#exp:fun(real,real) (f:fun(real,real) x:real))) ((#real_pow:fun(real,fun(num,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. (#exp:fun(real,real) (f:fun(real,real) x:real)))) int:prod(real,real)) dd_bounds:prod(real,real))))))))))
      #|Taylor_interval.second_derivative_log_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (#interval_pos:fun(prod(real,real),bool) int:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. (#real_neg:fun(real,real) (#real_inv:fun(real,real) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) #log:fun(real,real)) int:prod(real,real)) dd_bounds:prod(real,real))))))))
      #|Taylor_interval.second_derivative_compose_log_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) f:fun(real,real)) int:prod(real,real)) f_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (#interval_pos:fun(prod(real,real),bool) f_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_sub:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (f:fun(real,real) x:real))) ((#real_pow:fun(real,fun(num,real)) ((#real_div:fun(real,fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (f:fun(real,real) x:real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. (#log:fun(real,real) (f:fun(real,real) x:real)))) int:prod(real,real)) dd_bounds:prod(real,real))))))))))))))
      #|Taylor_interval.second_derivative_inv_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (#interval_not_zero:fun(prod(real,real),bool) int:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_inv:fun(real,real) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) #real_inv:fun(real,real)) int:prod(real,real)) dd_bounds:prod(real,real))))))))
      #|Taylor_interval.second_derivative_compose_inv_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) f:fun(real,real)) int:prod(real,real)) f_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (#interval_not_zero:fun(prod(real,real),bool) f_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_div:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_pow:fun(real,fun(num,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (f:fun(real,real) x:real)))) ((#real_pow:fun(real,fun(num,real)) (f:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. (#real_inv:fun(real,real) (f:fun(real,real) x:real)))) int:prod(real,real)) dd_bounds:prod(real,real))))))))))))))
      #|Taylor_interval.second_derivative_sqrt_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (#interval_pos:fun(prod(real,real),bool) int:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. (#real_neg:fun(real,real) (#real_inv:fun(real,real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#sqrt:fun(real,real) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) #sqrt:fun(real,real)) int:prod(real,real)) dd_bounds:prod(real,real))))))))
      #|Taylor_interval.second_derivative_compose_sqrt_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) f:fun(real,real)) int:prod(real,real)) f_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (#interval_pos:fun(prod(real,real),bool) f_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_div:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (f:fun(real,real) x:real)))) ((#real_pow:fun(real,fun(num,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#sqrt:fun(real,real) ((#real_pow:fun(real,fun(num,real)) (f:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. (#sqrt:fun(real,real) (f:fun(real,real) x:real)))) int:prod(real,real)) dd_bounds:prod(real,real))))))))))))))
      #|Taylor_interval.second_derivative_acs_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#iabs:fun(prod(real,real),real) int:prod(real,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. (#real_neg:fun(real,real) ((#real_div:fun(real,fun(real,real)) x:real) (#sqrt:fun(real,real) ((#real_pow:fun(real,fun(num,real)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_mul:fun(real,fun(real,real)) x:real) x:real))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) #acs:fun(real,real)) int:prod(real,real)) dd_bounds:prod(real,real))))))))
      #|Taylor_interval.second_derivative_compose_acs_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) f:fun(real,real)) int:prod(real,real)) f_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#iabs:fun(prod(real,real),real) f_bounds:prod(real,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. (#real_neg:fun(real,real) ((#real_div:fun(real,fun(real,real)) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (f:fun(real,real) x:real))))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) ((#real_pow:fun(real,fun(num,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#sqrt:fun(real,real) ((#real_pow:fun(real,fun(num,real)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (f:fun(real,real) x:real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. (#acs:fun(real,real) (f:fun(real,real) x:real)))) int:prod(real,real)) dd_bounds:prod(real,real))))))))))))))
      #|Taylor_interval.second_derivative_asn_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#iabs:fun(prod(real,real),real) int:prod(real,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_div:fun(real,fun(real,real)) x:real) (#sqrt:fun(real,real) ((#real_pow:fun(real,fun(num,real)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_mul:fun(real,fun(real,real)) x:real) x:real))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) #asn:fun(real,real)) int:prod(real,real)) dd_bounds:prod(real,real))))))))
      #|Taylor_interval.second_derivative_compose_asn_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) f:fun(real,real)) int:prod(real,real)) f_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#iabs:fun(prod(real,real),real) f_bounds:prod(real,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_div:fun(real,fun(real,real)) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (f:fun(real,real) x:real))))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) ((#real_pow:fun(real,fun(num,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#sqrt:fun(real,real) ((#real_pow:fun(real,fun(num,real)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (f:fun(real,real) x:real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. (#asn:fun(real,real) (f:fun(real,real) x:real)))) int:prod(real,real)) dd_bounds:prod(real,real))))))))))))))
      #|Taylor_interval.interval_arith_gt =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(real,bool),bool) (\f:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) x:real) int:prod(real,real))) ((#interval_gt:fun(real,fun(prod(real,real),bool)) f:real) int:prod(real,real)))) ((#real_lt:fun(real,fun(real,bool)) f:real) x:real))))))))
      #|Taylor_interval.second_derivative_matan_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) ((#interval_gt:fun(real,fun(prod(real,real),bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) int:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) #ddmatan:fun(real,real)) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) #matan:fun(real,real)) int:prod(real,real)) dd_bounds:prod(real,real))))))))
      #|Taylor_interval.second_derivative_compose_matan_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) f:fun(real,real)) int:prod(real,real)) f_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((#interval_gt:fun(real,fun(prod(real,real),bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) f_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (#dmatan:fun(real,real) (f:fun(real,real) x:real)))) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#ddmatan:fun(real,real) (f:fun(real,real) x:real)))))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. (#matan:fun(real,real) (f:fun(real,real) x:real)))) int:prod(real,real)) dd_bounds:prod(real,real))))))))))))))
      #|Taylor_interval.second_derivative_scale_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_mul:fun(real,fun(real,real)) c:real) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_mul:fun(real,fun(real,real)) c:real) (f:fun(real,real) x:real)))) int:prod(real,real)) dd_bounds:prod(real,real))))))))))))
      #|Taylor_interval.second_derivative_add_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) int:prod(real,real)) g:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_add:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) g:fun(real,real)) x:real)))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_add:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) int:prod(real,real)) dd_bounds:prod(real,real)))))))))))))
      #|Taylor_interval.second_derivative_sub_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) int:prod(real,real)) g:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_sub:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) g:fun(real,real)) x:real)))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) int:prod(real,real)) dd_bounds:prod(real,real)))))))))))))
      #|Taylor_interval.second_derivative_mul_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) int:prod(real,real)) g:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) g:fun(real,real)) x:real))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_mul:fun(real,fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) ((#derivative:fun(fun(real,real),fun(real,real)) g:fun(real,real)) x:real)))) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (g:fun(real,real) x:real)))))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) int:prod(real,real)) dd_bounds:prod(real,real)))))))))))))
      #|Taylor_interval.second_derivative_div_bounds =  |- (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\g_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) g:fun(real,real)) int:prod(real,real)) g_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (#interval_not_zero:fun(prod(real,real),bool) g_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) int:prod(real,real)) f:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#nth_diff_strong_int:fun(num,fun(prod(real,real),fun(fun(real,real),bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) int:prod(real,real)) g:fun(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_div:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(real,real)) x:real)) (g:fun(real,real) x:real))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (((#nth_derivative:fun(num,fun(fun(real,real),fun(real,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) g:fun(real,real)) x:real)))) (g:fun(real,real) x:real))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_mul:fun(real,fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) g:fun(real,real)) x:real)) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) ((#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real)) x:real)) (g:fun(real,real) x:real))) ((#real_mul:fun(real,fun(real,real)) (f:fun(real,real) x:real)) ((#derivative:fun(fun(real,real),fun(real,real)) g:fun(real,real)) x:real))))))) ((#real_pow:fun(real,fun(num,real)) (g:fun(real,real) x:real)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) int:prod(real,real)) dd_bounds:prod(real,real))) (((#has_bounded_second_derivative:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. ((#real_div:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (g:fun(real,real) x:real)))) int:prod(real,real)) dd_bounds:prod(real,real)))))))))))))))))
      #|Taylor_interval.cell_domain =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\w:real. ((#=:fun(bool,fun(bool,bool)) ((((#cell_domain:fun(real,fun(real,fun(real,fun(real,bool)))) x:real) y:real) z:real) w:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) y:real) z:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) y:real) x:real)) w:real)) ((#real_le:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) z:real) y:real)) w:real)))))))))))))
      #|Taylor_interval.taylor_x =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(real,bool),bool) (\w:real. ((#==>:fun(bool,fun(bool,bool)) ((((#cell_domain:fun(real,fun(real,fun(real,fun(real,bool)))) x:real) y:real) z:real) w:real)) ((((((((#taylor_interval:fun(fun(real,real),fun(real,fun(real,fun(real,fun(real,fun(prod(real,real),fun(prod(real,real),fun(prod(real,real),bool)))))))) (\x:real. x:real)) x:real) y:real) z:real) w:real) ((#,:fun(real,fun(real,prod(real,real))) y:real) y:real)) ((#,:fun(real,fun(real,prod(real,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#,:fun(real,fun(real,prod(real,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))))))
      #|Taylor_interval.taylor_const =  |- (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(real,bool),bool) (\w:real. ((#==>:fun(bool,fun(bool,bool)) ((((#cell_domain:fun(real,fun(real,fun(real,fun(real,bool)))) x:real) y:real) z:real) w:real)) ((((((((#taylor_interval:fun(fun(real,real),fun(real,fun(real,fun(real,fun(real,fun(prod(real,real),fun(prod(real,real),fun(prod(real,real),bool)))))))) (\x:real. c:real)) x:real) y:real) z:real) w:real) ((#,:fun(real,fun(real,prod(real,real))) c:real) c:real)) ((#,:fun(real,fun(real,prod(real,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#,:fun(real,fun(real,prod(real,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))))))))
      #|Taylor_interval.taylor_f_bounds =  |- (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(prod(real,real),bool),bool) (\df_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). (#forall:fun(fun(real,bool),bool) (\w:real. (#forall:fun(fun(real,bool),bool) (\f_hi:real. (#forall:fun(fun(real,bool),bool) (\f_lo:real. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(real,bool),bool) (\df:real. (#forall:fun(fun(real,bool),bool) (\dd:real. (#forall:fun(fun(real,bool),bool) (\lo:real. (#forall:fun(fun(real,bool),bool) (\hi:real. (#forall:fun(fun(real,bool),bool) (\t:real. ((#==>:fun(bool,fun(bool,bool)) ((((((((#taylor_interval:fun(fun(real,real),fun(real,fun(real,fun(real,fun(real,fun(prod(real,real),fun(prod(real,real),fun(prod(real,real),bool)))))))) f:fun(real,real)) x:real) y:real) z:real) w:real) ((#,:fun(real,fun(real,prod(real,real))) f_lo:real) f_hi:real)) df_bounds:prod(real,real)) dd_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#iabs:fun(prod(real,real),real) df_bounds:prod(real,real))) df:real)) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#iabs:fun(prod(real,real),real) dd_bounds:prod(real,real))) dd:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) w:real) ((#real_add:fun(real,fun(real,real)) df:real) ((#real_mul:fun(real,fun(real,real)) w:real) ((#real_mul:fun(real,fun(real,real)) dd:real) (#real_inv:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))) t:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) f_hi:real) t:real)) hi:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) lo:real) ((#real_sub:fun(real,fun(real,real)) f_lo:real) t:real))) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) f:fun(real,real)) ((#,:fun(real,fun(real,prod(real,real))) x:real) z:real)) ((#,:fun(real,fun(real,prod(real,real))) lo:real) hi:real))))))))))))))))))))))))))))))))))))
      #|Taylor_interval.taylor_df_bounds =  |- (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). (#forall:fun(fun(real,bool),bool) (\df_hi:real. (#forall:fun(fun(real,bool),bool) (\df_lo:real. (#forall:fun(fun(real,bool),bool) (\w:real. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(real,bool),bool) (\dd:real. (#forall:fun(fun(real,bool),bool) (\lo:real. (#forall:fun(fun(real,bool),bool) (\hi:real. ((#==>:fun(bool,fun(bool,bool)) ((((((((#taylor_interval:fun(fun(real,real),fun(real,fun(real,fun(real,fun(real,fun(prod(real,real),fun(prod(real,real),fun(prod(real,real),bool)))))))) f:fun(real,real)) x:real) y:real) z:real) w:real) f_bounds:prod(real,real)) ((#,:fun(real,fun(real,prod(real,real))) df_lo:real) df_hi:real)) dd_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#iabs:fun(prod(real,real),real) dd_bounds:prod(real,real))) dd:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) df_hi:real) ((#real_mul:fun(real,fun(real,real)) w:real) dd:real))) hi:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) lo:real) ((#real_sub:fun(real,fun(real,real)) df_lo:real) ((#real_mul:fun(real,fun(real,real)) w:real) dd:real)))) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (#derivative:fun(fun(real,real),fun(real,real)) f:fun(real,real))) ((#,:fun(real,fun(real,prod(real,real))) x:real) z:real)) ((#,:fun(real,fun(real,prod(real,real))) lo:real) hi:real))))))))))))))))))))))))))))))
      #|Taylor_interval.bounded_on_int_compose =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\g_bounds:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) g:fun(real,real)) int:prod(real,real)) g_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) f:fun(real,real)) g_bounds:prod(real,real)) f_bounds:prod(real,real))) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) (\x:real. (f:fun(real,real) (g:fun(real,real) x:real)))) int:prod(real,real)) f_bounds:prod(real,real))))))))))))))
      #|Taylor_interval.bounded_on_int_imp_interval_arith =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\int:prod(real,real). ((#==>:fun(bool,fun(bool,bool)) (((#bounded_on_int:fun(fun(real,real),fun(prod(real,real),fun(prod(real,real),bool))) f:fun(real,real)) int:prod(real,real)) f_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((#interval_arith:fun(real,fun(prod(real,real),bool)) y:real) int:prod(real,real))) ((#interval_arith:fun(real,fun(prod(real,real),bool)) (f:fun(real,real) y:real)) f_bounds:prod(real,real))))))))))))
      #|Taylor_interval.taylor_interval_narrow =  |- (#forall:fun(fun(real,bool),bool) (\w:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(prod(real,real),bool),bool) (\f_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\df_bounds:prod(real,real). (#forall:fun(fun(prod(real,real),bool),bool) (\dd_bounds:prod(real,real). (#forall:fun(fun(real,bool),bool) (\x0:real. (#forall:fun(fun(real,bool),bool) (\z0:real. (#forall:fun(fun(real,bool),bool) (\w0:real. ((#==>:fun(bool,fun(bool,bool)) ((((((((#taylor_interval:fun(fun(real,real),fun(real,fun(real,fun(real,fun(real,fun(prod(real,real),fun(prod(real,real),fun(prod(real,real),bool)))))))) f:fun(real,real)) x:real) y:real) z:real) w:real) f_bounds:prod(real,real)) df_bounds:prod(real,real)) dd_bounds:prod(real,real))) ((#==>:fun(bool,fun(bool,bool)) ((((#cell_domain:fun(real,fun(real,fun(real,fun(real,bool)))) x0:real) y:real) z0:real) w0:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) x0:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) z0:real) z:real)) ((((((((#taylor_interval:fun(fun(real,real),fun(real,fun(real,fun(real,fun(real,fun(prod(real,real),fun(prod(real,real),fun(prod(real,real),bool)))))))) f:fun(real,real)) x0:real) y:real) z0:real) w0:real) f_bounds:prod(real,real)) df_bounds:prod(real,real)) dd_bounds:prod(real,real))))))))))))))))))))))))))))
      #|types = multivector/1 matroid/1 group/1 frag/1 metric/1 net/1 topology/1 tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = cell_domain taylor_interval has_bounded_second_derivative lin_approx nth_diff_strong_int nth_diff_strong nth_diff_weak nth_differentiable_on_int nth_differentiable_on nth_differentiable nth_derivative derivative distn leqif uphalf half HALF double odd iteri iter minn maxn relU preim predD predC predU predI predT pred0 subrel subpred XOR isSome associative idempotent commutative self_inverse rev_left_loop left_loop right_distributive left_commutative right_zero left_id rev_right_loop right_loop left_distributive right_commutative left_zero right_id right_injective left_injective right_inverse left_inverse involutive bijective ocancel pcancel cancel injective pcomp omap obind odflt oapp ssreflect_eq error_mul_f1 error_mul_f2 list_sum2 list_sum ddmatan dmatan matan halfatn4 halfatn poly_f_odd poly_f_even poly_f real_zero l_seq TABLE REVERSE_TABLE mod_plus arith_base float_num min_exp interval_gt interval_neg interval_pos interval_not_zero iabs bounded_on_int bounded_on interval_arith num_exp D199 D198 D197 D196 D195 D194 D193 D192 D191 D190 D189 D188 D187 D186 D185 D184 D183 D182 D181 D180 D179 D178 D177 D176 D175 D174 D173 D172 D171 D170 D169 D168 D167 D166 D165 D164 D163 D162 D161 D160 D159 D158 D157 D156 D155 D154 D153 D152 D151 D150 D149 D148 D147 D146 D145 D144 D143 D142 D141 D140 D139 D138 D137 D136 D135 D134 D133 D132 D131 D130 D129 D128 D127 D126 D125 D124 D123 D122 D121 D120 D119 D118 D117 D116 D115 D114 D113 D112 D111 D110 D109 D108 D107 D106 D105 D104 D103 D102 D101 D100 D99 D98 D97 D96 D95 D94 D93 D92 D91 D90 D89 D88 D87 D86 D85 D84 D83 D82 D81 D80 D79 D78 D77 D76 D75 D74 D73 D72 D71 D70 D69 D68 D67 D66 D65 D64 D63 D62 D61 D60 D59 D58 D57 D56 D55 D54 D53 D52 D51 D50 D49 D48 D47 D46 D45 D44 D43 D42 D41 D40 D39 D38 D37 D36 D35 D34 D33 D32 D31 D30 D29 D28 D27 D26 D25 D24 D23 D22 D21 D20 D19 D18 D17 D16 D15 D14 D13 D12 D11 D10 D9 D8 D7 D6 D5 D4 D3 D2 D1 D0 NUM200 real_variation has_bounded_real_variation_on real_lebesgue_measurable real_measurable_on bernoulli vector_polynomial_function real_polynomial_function bernstein slice real_measure real_measurable has_real_measure absolutely_real_integrable_on real_negligible real_integral real_integrable_on has_real_integral real_log_convex_on log_convex_on real_convex_on open_real_segment closed_real_segment has_liminf has_limsup real_differentiable_on higher_real_derivative real_derivative real_differentiable has_real_derivative real_uniformly_continuous_on real_continuous_on real_continuous atreal binom rpow root acs asn cacs casn atn catn unwinding cpow clog tan ctan rotate2d Arg pi log cos sin exp csin ccos cexp analytic_on holomorphic_on higher_complex_derivative complex_derivative complex_differentiable has_complex_derivative cproduct real csqrt cnj complex_pow complex_div complex_inv complex_mul ii Cx complex Im Re lebesgue_measurable measurable_on measure measurable has_measure path_length rectifiable_path absolutely_continuous_on absolutely_setcontinuous_on vector_variation has_bounded_variation_on equiintegrable_on absolutely_integrable_on has_bounded_setvariation_on set_variation negligible division_points lifted operative integral integrable_on has_integral has_integral_compact_interval fine tagged_division_of tagged_partial_division_of division_of gauge content interval_lowerbound interval_upperbound reversion outermorphism seqiterate inner outer geom_mul Product grade multivector multivec mbasis lambdas $$ codeset setcode dest_multivector mk_multivector binarysum bitset vector_derivative has_vector_derivative jacobian frechet_derivative differentiable_on differentiable has_derivative interval_bij ENR ANR AR retract_of retraction brouwer_degree brouwer_degree1 triangulation simplicial_complex simplex polyhedron polytope edge_of facet_of extreme_point_of exposed_face_of face_of covering_space dimension contractible homotopy_equivalent fundamental_group simply_connected homotopic_loops homotopic_paths outside inside path_connected path_components path_component linepath subpath shiftpath arc simple_path ++ reversepath path_image pathfinish pathstart path barycentre relative_frontier relative_interior starlike epigraph convex_cone polar_dual aff_dim convex_on coplanar affine_dependent conic convex affine analytic borel_measurable_on baire borel fsigma gdelta locally hausdist setdist closest_point summable infsum sums homeomorphic homeomorphism is_interval diameter components connected_component uniformly_continuous_on continuous_on continuous complete cauchy compact bounded condensation_point_of lim --> in_direction at_neginfinity at_posinfinity at_infinity at frontier closure interior limit_point_of connected open_segment closed_segment manhattan sphere cball ball closed euclidean_metric euclidean open reflect_along rotoinversion_matrix rotation_matrix orthogonal_matrix orthogonal_transformation positive_definite positive_semidefinite diagonal_matrix cofactor det trace sign evenperm permutation swapseq three_cycle swap inverse permutes closed_interval open_interval midpoint between collinear infnorm matrix_inv rank columnvector rowvector euclidean_matroid dim independent dependent span subspace pushin dropout indicator drop lift onorm matrix invertible normal_matrix symmetric_matrix columns rows column row transp mat vector_matrix_mul matrix_vector_mul matrix_mul matrix_sub matrix_add matrix_neg %% adjoint bilinear linear orthogonal basis vsum distance vector_norm dot vec % vector_neg vector_sub vector_add matroid_dim matroid_finite_dim matroid_dimension matroid_finite_dimensional submatroid matroid_subspace matroid_dependent matroid_basis matroid_independent matroid_spanning matroid_span matroid_set dest_matroid matroid brouwer_degree2 reduced_homology_group hom_relboundary hom_induced hom_boundary homology_group relative_homology_group relcycle_group chain_group singular_subdivision simplicial_subdivision simplicial_vertex simplicial_cone simplex_cone simplicial_chain simplicial_simplex oriented_simplex chain_map simplex_map homologous_rel singular_relboundary singular_relcycle mod_subset chain_boundary singular_chain singular_face singular_simplex simplicial_face standard_simplex short_exact_sequence group_exactness solvable_group free_abelian_group pgroup integer_mod_group integer_group finitely_generated_group cyclic_group group_element_order trivial_homomorphism group_image group_kernel quotient_group group_normalizer group_centralizer group_conjugate normal_subgroup_of left_coset right_coset group_orbit group_stabilizer group_action group_setmul group_setinv isomorphic_group group_automorphism group_isomorphism group_isomorphisms group_endomorphism group_epimorphism group_monomorphism group_homomorphism sum_group product_group prod_group subgroup_generated subgroup_of group_conjugation group_sum group_product group_nmul group_add group_neg abelian_group group_zpow group_pow group_div opposite_group trivial_group singleton_group group_mul group_inv group_id group_carrier group_operations group index frag_extend frag_sub frag_add frag_cmul frag_neg frag_of frag_0 frag_support dest_frag mk_frag cantor_set cantor_map cantor_term cantor_space dimension_le sigma_locally_finite_in paracompact_space cfunspace funspace nsphere euclidean_space capped_metric fccoverable_in ulc_space fccoverable_space mdiameter cauchy_continuous_map uniformly_continuous_map lipschitz_continuous_map prod_metric completely_metrizable_space contractible_space homotopy_equivalent_space homotopic_with alexandroff_compactification kification k_space quasi_components_of quasi_component_of locally_connected_space locally_connected_at weakly_locally_connected_at locally_path_connected_space locally_path_connected_at weakly_locally_path_connected_at completely_regular_space normal_space path_components_of path_component_of path_connected_in path_connected_space path_in real_summable real_infsum real_sums reallim ---> topcontinuous_at totally_bounded_in mcomplete cauchy_in limit atpointof real_compact real_bounded real_euclidean_metric euclideanreal real_closed real_open locally_compact_space regular_space kolmogorov_quotient t0_space neighbourhood_base_of neighbourhood_base_at monotone_map connected_components_of connected_component_of separated_between connected_in connected_space metrizable_space discrete_metric mbounded msphere mcball mtopology submetric mball mdist mspace dest_metric metric is_metric_space borel_measurable_map borel_in gdelta_in fsigma_in sequentially trivial_limit eventually within netlimit netlimits netfilter dest_net mk_net separable_space first_countable second_countable lindelof_space perfect_map proper_map kc_space hausdorff_space t1_space separated_in compact_space compact_in retract_of_space retraction_map section_map retraction_maps embedding_map homeomorphic_space homeomorphic_maps homeomorphic_map sum_topology product_topology prod_topology quotient_map closed_map open_map continuous_map locally_finite_in frontier_of interior_of closure_of derived_set_of hereditarily subtopology discrete_space discrete_topology closed_in topspace open_in topology istopology ITER suslin suslin_operation relative_to from hull matrify vectorize closed_real_interval open_real_interval is_realinterval frac floor rational ^_c *_c +_c ordinal linseg inseg properly strictly antichain chain wqoset woset toset poset qoset fld superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 1135
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?4
      #|counter_genvar = _3723720:bool
      #|
    ),
  )
}
