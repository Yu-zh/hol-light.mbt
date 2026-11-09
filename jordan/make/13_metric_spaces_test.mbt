// Jordan/metric_spaces.ml in its directory's load order: the test block of
// jordan/metric_spaces/metric_spaces_ref_test.mbt (tools/ocaml_ref/chain_test.py), with the same golden
// (tools/ocaml_ref/Jordan_metric_spaces_ref.expected).

///|
test "Jordan/metric_spaces matches Jordan/metric_spaces.ml" {
  @testkit.release_output()
  @metric_spaces.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot", "impconv", "pair", "compute", "nums", "recursion",
      "arith", "wf", "calc_num", "normalizer", "grobner", "ind_types", "lists", "realax",
      "calc_int", "realarith", "real", "calc_rat", "int", "sets", "iterate", "cart",
      "define", "Library/analysis", "Library/transc", "Examples/polylog", "Jordan/tactics_refine",
      "Jordan/lib_ext", "Jordan/tactics_fix", "Jordan/parse_ext_override_interface",
      "Jordan/tactics_ext", "Jordan/num_ext_gcd", "Jordan/num_ext_nabs", "Jordan/real_ext_geom_series",
      "Rqe/num_calc_simp", "Jordan/real_ext", "Jordan/float", "Jordan/tactics_ext2",
      "Jordan/misc_defs_and_lemmas", "Jordan/metric_spaces",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Jordan/metric_spaces")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("Q_ELIM_THM", () => sthm(@metric_spaces.q_elim_thm()))
  log.attempt("Q_ELIM_THM'", () => sthm(@metric_spaces.q_elim_thm_p()))
  log.attempt("Q_ELIM_THM''", () => sthm(@metric_spaces.q_elim_thm_p_p()))
  log.attempt("DIFF_SUBSET", () => sthm(@metric_spaces.diff_subset()))
  log.attempt("SUBSET_INTERS", () => sthm(@metric_spaces.subset_inters()))
  log.attempt("DIFF_INTER", () => sthm(@metric_spaces.diff_inter()))
  log.attempt("SUB_IMP_INTER", () => sthm(@metric_spaces.sub_imp_inter()))
  log.attempt("SUBSET_UNIONS_INSERT", () => {
    sthm(@metric_spaces.subset_unions_insert())
  })
  log.attempt("UNIONS_DELETE2", () => sthm(@metric_spaces.unions_delete2()))
  log.attempt("finite_subset", () => sthm(@metric_spaces.finite_subset()))
  log.attempt("inters_singleton", () => sthm(@metric_spaces.inters_singleton()))
  log.attempt("delete_empty", () => sthm(@metric_spaces.delete_empty()))
  log.attempt("inters_subset", () => sthm(@metric_spaces.inters_subset()))
  log.attempt("delete_inters", () => sthm(@metric_spaces.delete_inters()))
  log.attempt("EQ_EMPTY", () => sthm(@metric_spaces.eq_empty()))
  log.attempt("UNIONS_EQ_EMPTY", () => sthm(@metric_spaces.unions_eq_empty()))
  log.attempt("INTERS_EQ_EMPTY", () => sthm(@metric_spaces.inters_eq_empty()))
  log.attempt("CARD_SING_CONV", () => sthm(@metric_spaces.card_sing_conv()))
  log.attempt("countable_prod", () => sthm(@metric_spaces.countable_prod()))
  log.attempt("IMAGE_I", () => sthm(@metric_spaces.image_i()))
  log.attempt("EMPTY_NOT_EXISTS", () => sthm(@metric_spaces.empty_not_exists()))
  log.attempt("DIFF_SURJ", () => sthm(@metric_spaces.diff_surj()))
  log.attempt("union_subset", () => sthm(@metric_spaces.union_subset()))
  log.attempt("preimage_disjoint", () => {
    sthm(@metric_spaces.preimage_disjoint())
  })
  log.attempt("preimage_union", () => sthm(@metric_spaces.preimage_union()))
  log.attempt("subset_preimage", () => sthm(@metric_spaces.subset_preimage()))
  log.attempt("preimage_unions", () => sthm(@metric_spaces.preimage_unions()))
  log.attempt("preimage_subset", () => sthm(@metric_spaces.preimage_subset()))
  log.attempt("INTER_THM", () => sthm(@metric_spaces.inter_thm()))
  log.attempt("REAL_SUM_SQUARE_POS", () => {
    sthm(@metric_spaces.real_sum_square_pos())
  })
  log.attempt("twopow_pos", () => sthm(@metric_spaces.twopow_pos()))
  log.attempt("twopow_double", () => sthm(@metric_spaces.twopow_double()))
  log.attempt("min_finite", () => sthm(@metric_spaces.min_finite()))
  log.attempt("min_finite_delta", () => sthm(@metric_spaces.min_finite_delta()))
  log.attempt("union_closed_interval", () => {
    sthm(@metric_spaces.union_closed_interval())
  })
  log.attempt("real_half_LT", () => sthm(@metric_spaces.real_half_lt()))
  log.attempt("real_half_LE", () => sthm(@metric_spaces.real_half_le()))
  log.attempt("real_half_EL", () => sthm(@metric_spaces.real_half_el()))
  log.attempt("real_half_LLE", () => sthm(@metric_spaces.real_half_lle()))
  log.attempt("interval_finite", () => sthm(@metric_spaces.interval_finite()))
  log.attempt("euclid_add_closure", () => {
    sthm(@metric_spaces.euclid_add_closure())
  })
  log.attempt("euclid_scale_closure", () => {
    sthm(@metric_spaces.euclid_scale_closure())
  })
  log.attempt("euclid_neg_closure", () => {
    sthm(@metric_spaces.euclid_neg_closure())
  })
  log.attempt("euclid_sub_closure", () => {
    sthm(@metric_spaces.euclid_sub_closure())
  })
  log.attempt("neg_dim", () => sthm(@metric_spaces.neg_dim()))
  log.attempt("euclid_updim", () => sthm(@metric_spaces.euclid_updim()))
  log.attempt("euclidean_add_closure", () => {
    sthm(@metric_spaces.euclidean_add_closure())
  })
  log.attempt("euclidean_sub_closure", () => {
    sthm(@metric_spaces.euclidean_sub_closure())
  })
  log.attempt("euclidean_scale_closure", () => {
    sthm(@metric_spaces.euclidean_scale_closure())
  })
  log.attempt("euclidean_neg_closure", () => {
    sthm(@metric_spaces.euclidean_neg_closure())
  })
  log.attempt("euclid_add_comm", () => sthm(@metric_spaces.euclid_add_comm()))
  log.attempt("euclid_add_assoc", () => sthm(@metric_spaces.euclid_add_assoc()))
  log.attempt("euclid_lzero", () => sthm(@metric_spaces.euclid_lzero()))
  log.attempt("euclid_rzero", () => sthm(@metric_spaces.euclid_rzero()))
  log.attempt("euclid_ldistrib", () => sthm(@metric_spaces.euclid_ldistrib()))
  log.attempt("euclid_rdistrib", () => sthm(@metric_spaces.euclid_rdistrib()))
  log.attempt("euclid_scale_act", () => sthm(@metric_spaces.euclid_scale_act()))
  log.attempt("euclid_scale_one", () => sthm(@metric_spaces.euclid_scale_one()))
  log.attempt("euclid_neg_sum", () => sthm(@metric_spaces.euclid_neg_sum()))
  log.attempt("trivial_lin_combo", () => {
    sthm(@metric_spaces.trivial_lin_combo())
  })
  log.attempt("dot_euclid", () => sthm(@metric_spaces.dot_euclid()))
  log.attempt("dot_updim", () => sthm(@metric_spaces.dot_updim()))
  log.attempt("dot_nonneg", () => sthm(@metric_spaces.dot_nonneg()))
  log.attempt("dot_comm", () => sthm(@metric_spaces.dot_comm()))
  log.attempt("dot_neg", () => sthm(@metric_spaces.dot_neg()))
  log.attempt("dot_neg2", () => sthm(@metric_spaces.dot_neg2()))
  log.attempt("dot_scale", () => sthm(@metric_spaces.dot_scale()))
  log.attempt("dot_scale_euclidean", () => {
    sthm(@metric_spaces.dot_scale_euclidean())
  })
  log.attempt("dot_scale2", () => sthm(@metric_spaces.dot_scale2()))
  log.attempt("dot_scale2_euclidean", () => {
    sthm(@metric_spaces.dot_scale2_euclidean())
  })
  log.attempt("dot_linear", () => sthm(@metric_spaces.dot_linear()))
  log.attempt("dot_minus_linear", () => sthm(@metric_spaces.dot_minus_linear()))
  log.attempt("dot_linear_euclidean", () => {
    sthm(@metric_spaces.dot_linear_euclidean())
  })
  log.attempt("dot_minus_linear_euclidean", () => {
    sthm(@metric_spaces.dot_minus_linear_euclidean())
  })
  log.attempt("dot_linear2", () => sthm(@metric_spaces.dot_linear2()))
  log.attempt("dot_linear2_euclidean", () => {
    sthm(@metric_spaces.dot_linear2_euclidean())
  })
  log.attempt("dot_minus_linear2", () => {
    sthm(@metric_spaces.dot_minus_linear2())
  })
  log.attempt("dot_minus_linear2_euclidean", () => {
    sthm(@metric_spaces.dot_minus_linear2_euclidean())
  })
  log.attempt("dot_rzero", () => sthm(@metric_spaces.dot_rzero()))
  log.attempt("dot_lzero", () => sthm(@metric_spaces.dot_lzero()))
  log.attempt("dot_zero", () => sthm(@metric_spaces.dot_zero()))
  log.attempt("dot_zero_euclidean", () => {
    sthm(@metric_spaces.dot_zero_euclidean())
  })
  log.attempt("norm_nonneg", () => sthm(@metric_spaces.norm_nonneg()))
  log.attempt("norm_neg", () => sthm(@metric_spaces.norm_neg()))
  log.attempt("cauchy_schwartz", () => sthm(@metric_spaces.cauchy_schwartz()))
  log.attempt("norm_dot", () => sthm(@metric_spaces.norm_dot()))
  log.attempt("norm_triangle", () => sthm(@metric_spaces.norm_triangle()))
  log.attempt("metric_space_zero", () => {
    sthm(@metric_spaces.metric_space_zero())
  })
  log.attempt("metric_space_symm", () => {
    sthm(@metric_spaces.metric_space_symm())
  })
  log.attempt("metric_space_triangle", () => {
    sthm(@metric_spaces.metric_space_triangle())
  })
  log.attempt("metric_subspace", () => sthm(@metric_spaces.metric_subspace()))
  log.attempt("metric_euclidean", () => sthm(@metric_spaces.metric_euclidean()))
  log.attempt("metric_euclid", () => sthm(@metric_spaces.metric_euclid()))
  log.attempt("euclid1_abs", () => sthm(@metric_spaces.euclid1_abs()))
  log.attempt("coord_dirac", () => sthm(@metric_spaces.coord_dirac()))
  log.attempt("dirac_0", () => sthm(@metric_spaces.dirac_0()))
  log.attempt("euclid1_dirac", () => sthm(@metric_spaces.euclid1_dirac()))
  log.attempt("proj", () => sthm(@metric_spaces.proj()))
  log.attempt("proj_euclid1", () => sthm(@metric_spaces.proj_euclid1()))
  log.attempt("d_euclid_n", () => sthm(@metric_spaces.d_euclid_n()))
  log.attempt("norm_n", () => sthm(@metric_spaces.norm_n()))
  log.attempt("proj_d_euclid", () => sthm(@metric_spaces.proj_d_euclid()))
  log.attempt("d_euclid_pos", () => sthm(@metric_spaces.d_euclid_pos()))
  log.attempt("proj_contraction", () => sthm(@metric_spaces.proj_contraction()))
  log.attempt("euclid_dirac", () => sthm(@metric_spaces.euclid_dirac()))
  log.attempt("d_euclid_pow2", () => sthm(@metric_spaces.d_euclid_pow2()))
  log.attempt("D_EUCLID_BOUND", () => sthm(@metric_spaces.d_euclid_bound()))
  log.attempt("metric_translate", () => sthm(@metric_spaces.metric_translate()))
  log.attempt("metric_translate_LEFT", () => {
    sthm(@metric_spaces.metric_translate_left())
  })
  log.attempt("norm_scale", () => sthm(@metric_spaces.norm_scale()))
  log.attempt("norm_scale_vec", () => sthm(@metric_spaces.norm_scale_vec()))
  log.attempt("topology", () => sthm(@metric_spaces.topology()))
  log.attempt("open_DEF", () => sthm(@metric_spaces.open_def()))
  log.attempt("closed", () => sthm(@metric_spaces.closed()))
  log.attempt("closure", () => sthm(@metric_spaces.closure()))
  log.attempt("induced_top", () => sthm(@metric_spaces.induced_top()))
  log.attempt("open_ball", () => sthm(@metric_spaces.open_ball()))
  log.attempt("closed_ball", () => sthm(@metric_spaces.closed_ball()))
  log.attempt("open_balls", () => sthm(@metric_spaces.open_balls()))
  log.attempt("top_of_metric", () => sthm(@metric_spaces.top_of_metric()))
  log.attempt("open_EMPTY", () => sthm(@metric_spaces.open_empty()))
  log.attempt("open_closed", () => sthm(@metric_spaces.open_closed()))
  log.attempt("closed_UNIV", () => sthm(@metric_spaces.closed_univ()))
  log.attempt("top_univ", () => sthm(@metric_spaces.top_univ()))
  log.attempt("empty_closed", () => sthm(@metric_spaces.empty_closed()))
  log.attempt("closed_open", () => sthm(@metric_spaces.closed_open()))
  log.attempt("closed_inter", () => sthm(@metric_spaces.closed_inter()))
  log.attempt("open_nbd", () => sthm(@metric_spaces.open_nbd()))
  log.attempt("open_inters", () => sthm(@metric_spaces.open_inters()))
  log.attempt("top_unions", () => sthm(@metric_spaces.top_unions()))
  log.attempt("top_inter", () => sthm(@metric_spaces.top_inter()))
  log.attempt("open_ball_nonempty", () => {
    sthm(@metric_spaces.open_ball_nonempty())
  })
  log.attempt("open_ball_subset", () => sthm(@metric_spaces.open_ball_subset()))
  log.attempt("open_ball_subspace", () => {
    sthm(@metric_spaces.open_ball_subspace())
  })
  log.attempt("open_ball_empty", () => sthm(@metric_spaces.open_ball_empty()))
  log.attempt("open_ball_intersect", () => {
    sthm(@metric_spaces.open_ball_intersect())
  })
  log.attempt("open_ball_center", () => sthm(@metric_spaces.open_ball_center()))
  log.attempt("open_ball_nonempty_center", () => {
    sthm(@metric_spaces.open_ball_nonempty_center())
  })
  log.attempt("open_ball_neg_radius", () => {
    sthm(@metric_spaces.open_ball_neg_radius())
  })
  log.attempt("open_ball_nest", () => sthm(@metric_spaces.open_ball_nest()))
  log.attempt("open_ball_inter", () => sthm(@metric_spaces.open_ball_inter()))
  log.attempt("BALL_DIST", () => sthm(@metric_spaces.ball_dist()))
  log.attempt("BALL_DIST_CLOSED", () => sthm(@metric_spaces.ball_dist_closed()))
  log.attempt("open_ball_sub_closed", () => {
    sthm(@metric_spaces.open_ball_sub_closed())
  })
  log.attempt("ball_symm", () => sthm(@metric_spaces.ball_symm()))
  log.attempt("ball_subset_ball", () => sthm(@metric_spaces.ball_subset_ball()))
  log.attempt("top_of_metric_unions", () => {
    sthm(@metric_spaces.top_of_metric_unions())
  })
  log.attempt("top_of_metric_empty", () => {
    sthm(@metric_spaces.top_of_metric_empty())
  })
  log.attempt("top_of_metric_open", () => {
    sthm(@metric_spaces.top_of_metric_open())
  })
  log.attempt("top_of_metric_open_balls", () => {
    sthm(@metric_spaces.top_of_metric_open_balls())
  })
  log.attempt("open_ball_open", () => sthm(@metric_spaces.open_ball_open()))
  log.attempt("top_of_metric_nbd", () => {
    sthm(@metric_spaces.top_of_metric_nbd())
  })
  log.attempt("top_of_metric_inter", () => {
    sthm(@metric_spaces.top_of_metric_inter())
  })
  log.attempt("top_of_metric_union", () => {
    sthm(@metric_spaces.top_of_metric_union())
  })
  log.attempt("top_of_metric_top", () => {
    sthm(@metric_spaces.top_of_metric_top())
  })
  log.attempt("closed_ball_closed", () => {
    sthm(@metric_spaces.closed_ball_closed())
  })
  log.attempt("open_ball_nbd", () => sthm(@metric_spaces.open_ball_nbd()))
  log.attempt("closure_closed", () => sthm(@metric_spaces.closure_closed()))
  log.attempt("subset_closure", () => sthm(@metric_spaces.subset_closure()))
  log.attempt("closure_subset", () => sthm(@metric_spaces.closure_subset()))
  log.attempt("closure_self", () => sthm(@metric_spaces.closure_self()))
  log.attempt("closure_close", () => sthm(@metric_spaces.closure_close()))
  log.attempt("closure_open", () => sthm(@metric_spaces.closure_open()))
  log.attempt("image_top", () => sthm(@metric_spaces.image_top()))
  log.attempt("induced_top_support", () => {
    sthm(@metric_spaces.induced_top_support())
  })
  log.attempt("induced_top_top", () => sthm(@metric_spaces.induced_top_top()))
  log.attempt("induced_top_open", () => sthm(@metric_spaces.induced_top_open()))
  log.attempt("induced_trans", () => sthm(@metric_spaces.induced_trans()))
  log.attempt("induced_top_unions", () => {
    sthm(@metric_spaces.induced_top_unions())
  })
  log.attempt("gen", () => sthm(@metric_spaces.gen()))
  log.attempt("top_of_metric_gen", () => {
    sthm(@metric_spaces.top_of_metric_gen())
  })
  log.attempt("gen_subset", () => sthm(@metric_spaces.gen_subset()))
  log.attempt("gen_subspace", () => sthm(@metric_spaces.gen_subspace()))
  log.attempt("gen_induced", () => sthm(@metric_spaces.gen_induced()))
  log.attempt("top_of_metric_induced", () => {
    sthm(@metric_spaces.top_of_metric_induced())
  })
  log.attempt("continuous", () => sthm(@metric_spaces.continuous()))
  log.attempt("metric_continuous_pt", () => {
    sthm(@metric_spaces.metric_continuous_pt())
  })
  log.attempt("metric_continuous", () => {
    sthm(@metric_spaces.metric_continuous())
  })
  log.attempt("metric_continuous_pt_domain", () => {
    sthm(@metric_spaces.metric_continuous_pt_domain())
  })
  log.attempt("metric_continuous_continuous", () => {
    sthm(@metric_spaces.metric_continuous_continuous())
  })
  log.attempt("continuous_induced", () => {
    sthm(@metric_spaces.continuous_induced())
  })
  log.attempt("metric_cont", () => sthm(@metric_spaces.metric_cont()))
  log.attempt("continuous_sum", () => sthm(@metric_spaces.continuous_sum()))
  log.attempt("sequence", () => sthm(@metric_spaces.sequence()))
  log.attempt("converge", () => sthm(@metric_spaces.converge()))
  log.attempt("cauchy_seq", () => sthm(@metric_spaces.cauchy_seq()))
  log.attempt("complete", () => sthm(@metric_spaces.complete()))
  log.attempt("converge_cauchy", () => sthm(@metric_spaces.converge_cauchy()))
  log.attempt("cauchy_seq_cauchy", () => {
    sthm(@metric_spaces.cauchy_seq_cauchy())
  })
  log.attempt("complete_real", () => sthm(@metric_spaces.complete_real()))
  log.attempt("sequence_in", () => sthm(@metric_spaces.sequence_in()))
  log.attempt("proj_cauchy", () => sthm(@metric_spaces.proj_cauchy()))
  log.attempt("complete_euclid", () => sthm(@metric_spaces.complete_euclid()))
  log.attempt("subset_sequence", () => sthm(@metric_spaces.subset_sequence()))
  log.attempt("subset_cauchy", () => sthm(@metric_spaces.subset_cauchy()))
  log.attempt("complete_closed", () => sthm(@metric_spaces.complete_closed()))
  log.attempt("totally_bounded", () => sthm(@metric_spaces.totally_bounded()))
  log.attempt("totally_bounded_subset", () => {
    sthm(@metric_spaces.totally_bounded_subset())
  })
  log.attempt("integer_cube_finite", () => {
    sthm(@metric_spaces.integer_cube_finite())
  })
  log.attempt("FINITE_scaled_lattice", () => {
    sthm(@metric_spaces.finite_scaled_lattice())
  })
  log.attempt("totally_bounded_cube", () => {
    sthm(@metric_spaces.totally_bounded_cube())
  })
  log.attempt("center_FINITE", () => sthm(@metric_spaces.center_finite()))
  log.attempt("open_ball_dist", () => sthm(@metric_spaces.open_ball_dist()))
  log.attempt("totally_bounded_bounded", () => {
    sthm(@metric_spaces.totally_bounded_bounded())
  })
  log.attempt("subsequence_rec", () => sthm(@metric_spaces.subsequence_rec()))
  log.attempt("sequence_subseq", () => sthm(@metric_spaces.sequence_subseq()))
  log.attempt("cauchy_subseq", () => sthm(@metric_spaces.cauchy_subseq()))
  log.attempt("convergent_subseq", () => {
    sthm(@metric_spaces.convergent_subseq())
  })
  log.attempt("dense", () => sthm(@metric_spaces.dense()))
  log.attempt("hausdorff", () => sthm(@metric_spaces.hausdorff()))
  log.attempt("dense_subset", () => sthm(@metric_spaces.dense_subset()))
  log.attempt("dense_open", () => sthm(@metric_spaces.dense_open()))
  log.attempt("countable_dense", () => sthm(@metric_spaces.countable_dense()))
  log.attempt("metric_hausdorff", () => sthm(@metric_spaces.metric_hausdorff()))
  log.attempt("compact", () => sthm(@metric_spaces.compact()))
  log.attempt("closed_compact", () => sthm(@metric_spaces.closed_compact()))
  log.attempt("compact_closed", () => sthm(@metric_spaces.compact_closed()))
  log.attempt("compact_totally_bounded", () => {
    sthm(@metric_spaces.compact_totally_bounded())
  })
  log.attempt("finite_inters", () => sthm(@metric_spaces.finite_inters()))
  log.attempt("cauchy_subseq_sublemma", () => {
    sthm(@metric_spaces.cauchy_subseq_sublemma())
  })
  log.attempt("subseq_cauchy", () => sthm(@metric_spaces.subseq_cauchy()))
  log.attempt("compact_complete", () => sthm(@metric_spaces.compact_complete()))
  log.attempt("countable_cover", () => sthm(@metric_spaces.countable_cover()))
  log.attempt("complete_compact", () => sthm(@metric_spaces.complete_compact()))
  log.attempt("uniformly_continuous", () => {
    sthm(@metric_spaces.uniformly_continuous())
  })
  log.attempt("compact_uniformly_continuous", () => {
    sthm(@metric_spaces.compact_uniformly_continuous())
  })
  log.attempt("image_compact", () => sthm(@metric_spaces.image_compact()))
  log.attempt("metric_bounded", () => sthm(@metric_spaces.metric_bounded()))
  log.attempt("euclid_ball_cube", () => sthm(@metric_spaces.euclid_ball_cube()))
  log.attempt("totally_bounded_euclid", () => {
    sthm(@metric_spaces.totally_bounded_euclid())
  })
  log.attempt("induced_compact", () => sthm(@metric_spaces.induced_compact()))
  log.attempt("compact_euclid", () => sthm(@metric_spaces.compact_euclid()))
  log.attempt("neg_continuous", () => sthm(@metric_spaces.neg_continuous()))
  log.attempt("continuous_comp", () => sthm(@metric_spaces.continuous_comp()))
  log.attempt("compact_max", () => sthm(@metric_spaces.compact_max()))
  log.attempt("homeomorphism", () => sthm(@metric_spaces.homeomorphism()))
  log.attempt("INV_homeomorphism", () => {
    sthm(@metric_spaces.inv_homeomorphism())
  })
  log.attempt("bicont_homeomorphism", () => {
    sthm(@metric_spaces.bicont_homeomorphism())
  })
  log.attempt("open_and_closed", () => sthm(@metric_spaces.open_and_closed()))
  log.attempt("hausdorff_homeomorphsim", () => {
    sthm(@metric_spaces.hausdorff_homeomorphsim())
  })
  log.attempt("d_real", () => sthm(@metric_spaces.d_real()))
  log.attempt("metric_real", () => sthm(@metric_spaces.metric_real()))
  log.attempt("continuous_euclid1", () => {
    sthm(@metric_spaces.continuous_euclid1())
  })
  log.attempt("interval_closed_ball", () => {
    sthm(@metric_spaces.interval_closed_ball())
  })
  log.attempt("interval_euclid1_closed", () => {
    sthm(@metric_spaces.interval_euclid1_closed())
  })
  log.attempt("interval_euclid1_bounded", () => {
    sthm(@metric_spaces.interval_euclid1_bounded())
  })
  log.attempt("interval_euclid1_compact", () => {
    sthm(@metric_spaces.interval_euclid1_compact())
  })
  log.attempt("interval_image", () => sthm(@metric_spaces.interval_image()))
  log.attempt("interval_compact", () => sthm(@metric_spaces.interval_compact()))
  log.attempt("half_open", () => sthm(@metric_spaces.half_open()))
  log.attempt("half_open_above", () => sthm(@metric_spaces.half_open_above()))
  log.attempt("joinf", () => sthm(@metric_spaces.joinf()))
  log.attempt("joinf_cont", () => sthm(@metric_spaces.joinf_cont()))
  log.attempt("neg_cont", () => sthm(@metric_spaces.neg_cont()))
  log.attempt("add_cont", () => sthm(@metric_spaces.add_cont()))
  log.attempt("continuous_scale", () => sthm(@metric_spaces.continuous_scale()))
  log.attempt("continuous_lin_combo", () => {
    sthm(@metric_spaces.continuous_lin_combo())
  })
  log.attempt("connected", () => sthm(@metric_spaces.connected()))
  log.attempt("connected_unions", () => sthm(@metric_spaces.connected_unions()))
  log.attempt("component_DEF", () => sthm(@metric_spaces.component_def()))
  log.attempt("connected_sing", () => sthm(@metric_spaces.connected_sing()))
  log.attempt("component_refl", () => sthm(@metric_spaces.component_refl()))
  log.attempt("component_symm", () => sthm(@metric_spaces.component_symm()))
  log.attempt("component_trans", () => sthm(@metric_spaces.component_trans()))
  log.attempt("connect_real", () => sthm(@metric_spaces.connect_real()))
  log.attempt("connect_image", () => sthm(@metric_spaces.connect_image()))
  log.attempt("path", () => sthm(@metric_spaces.path()))
  log.attempt("const_continuous", () => sthm(@metric_spaces.const_continuous()))
  log.attempt("path_component", () => sthm(@metric_spaces.path_component()))
  log.attempt("path_refl", () => sthm(@metric_spaces.path_refl()))
  log.attempt("path_symm", () => sthm(@metric_spaces.path_symm()))
  log.attempt("path_symm_eq", () => sthm(@metric_spaces.path_symm_eq()))
  log.attempt("path_trans", () => sthm(@metric_spaces.path_trans()))
  log.attempt("loc_path_conn", () => sthm(@metric_spaces.loc_path_conn()))
  log.attempt("path_eq_conn", () => sthm(@metric_spaces.path_eq_conn()))
  log.attempt("open_ball_star", () => sthm(@metric_spaces.open_ball_star()))
  log.attempt("open_ball_path", () => sthm(@metric_spaces.open_ball_path()))
  log.attempt("path_domain", () => sthm(@metric_spaces.path_domain()))
  log.attempt("path_component_subspace", () => {
    sthm(@metric_spaces.path_component_subspace())
  })
  log.attempt("path_component_in", () => {
    sthm(@metric_spaces.path_component_in())
  })
  log.attempt("loc_path_conn_euclid", () => {
    sthm(@metric_spaces.loc_path_conn_euclid())
  })
  log.attempt("loc_path_euclid_cor", () => {
    sthm(@metric_spaces.loc_path_euclid_cor())
  })
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
      #|0..0..1..2..4..10..20..solved at 26
      #|0..0..1..2..4..9..17..solved at 23
      #|0..0..1..2..8..17..51..106..269..solved at 320
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..4..10..20..solved at 26
      #|0..0..1..2..4..9..17..solved at 23
      #|0..0..1..2..8..17..51..106..269..solved at 320
      #|priority is now real
      #|num_ext_gcd loaded
      #|0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..solved at 3
      #|0..0..1..2..5..9..15..22..29..36..49..62..81..solved at 104
      #|0..0..1..3..7..solved at 12
      #|0..0..solved at 2
      #|0..0..1..2..5..9..15..22..29..36..49..62..81..solved at 104
      #|0..0..1..3..7..solved at 12
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|priority is now real
      #|0..0..2..4..solved at 8
      #|0..0..2..4..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..4..12..23..41..70..solved at 88
      #|0..0..1..2..4..12..23..41..70..solved at 88
      #|priority is now real
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..2..solved at 11
      #|0..0..1..2..solved at 11
      #|0..0..1..2..6..12..27..46..solved at 85
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..3..9..solved at 19
      #|0..0..1..3..7..solved at 17
      #|0..0..1..2..solved at 6
      #|0..0..1..2..4..solved at 9
      #|0..0..2..4..solved at 8
      #|0..0..2..6..17..38..84..solved at 103
      #|0..0..1..2..solved at 6
      #|0..0..solved at 3
      #|0..0..1..solved at 5
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..3..7..13..21..solved at 36
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..1..2..3..7..13..21..solved at 36
      #|0..0..1..3..7..16..31..54..95..158..249..382..565..818..solved at 1233
      #|0..0..1..2..5..9..15..33..53..90..167..269..451..solved at 776
      #|0..0..1..2..6..11..20..37..60..104..solved at 160
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..1..3..5..10..19..30..solved at 40
      #|0..0..1..5..12..27..61..114..202..378..707..1267..solved at 1292
      #|0..0..1..5..12..27..61..113..197..363..639..1077..solved at 1107
      #|0..0..1..2..7..13..solved at 22
      #|0..0..1..4..solved at 10
      #|0..0..1..3..solved at 7
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..11..22..solved at 34
      #|0..0..1..2..3..solved at 11
      #|0..0..1..2..3..11..22..solved at 36
      #|0..0..1..2..3..solved at 9
      #|priority is now real
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..3..9..21..36..solved at 43
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
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
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 5
      #|Warning: inventing type variables
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Warning: inventing type variables
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Warning: inventing type variables
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
      #|Searching with limit 5
      #|Warning: inventing type variables
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Warning: inventing type variables
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Warning: inventing type variables
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
      #|Searching with limit 5
      #|Warning: inventing type variables
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Warning: inventing type variables
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Warning: inventing type variables
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
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..4..13..solved at 33
      #|0..0..1..4..13..solved at 24
      #|0..0..1..2..5..11..solved at 24
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..2..6..solved at 19
      #|0..0..2..7..solved at 13
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..3..12..37..124..344..980..solved at 2136
      #|0..0..solved at 2
      #|0..0..2..8..24..83..226..636..solved at 1215
      #|0..0..3..10..27..90..237..636..solved at 1186
      #|0..0..2..6..14..49..119..302..solved at 318
      #|0..0..1..2..solved at 6
      #|0..0..1..3..6..solved at 12
      #|0..0..2..4..6..solved at 13
      #|0..0..2..4..6..solved at 11
      #|0..0..2..4..6..solved at 18
      #|0..0..2..4..6..solved at 15
      #|0..0..1..2..3..solved at 10
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..solved at 10
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..1..2..3..8..solved at 16
      #|0..0..1..solved at 4
      #|0..0..1..2..5..8..11..19..solved at 30
      #|0..0..0..1..2..3..4..5..6..solved at 19
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..15..38..65..116..solved at 202
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..0..solved at 4
      #|0..0..1..solved at 6
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..2..solved at 6
      #|0..0..1..solved at 5
      #|0..0..0..0..0..0..1..2..3..4..5..6..7..8..9..11..13..15..17..19..21..23..25..27..solved at 48
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..1..solved at 6
      #|0..0..0..solved at 3
      #|0..0..1..4..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..3..8..solved at 16
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..3..7..13..solved at 21
      #|0..0..2..solved at 7
      #|Warning: inventing type variables
      #|0..0..1..3..solved at 7
      #|0..0..1..2..5..12..22..38..58..82..120..solved at 165
      #|0..0..1..3..solved at 7
      #|0..0..0..1..2..3..5..7..9..21..42..67..111..solved at 151
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..0..1..2..3..solved at 8
      #|0..0..1..solved at 4
      #|0..0..1..2..5..9..15..39..solved at 62
      #|0..0..1..solved at 4
      #|0..0..1..2..4..solved at 9
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..2..4..8..solved at 13
      #|0..0..1..2..4..solved at 9
      #|0..0..1..solved at 4
      #|0..0..1..2..4..solved at 9
      #|0..0..1..solved at 4
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..1..2..3..7..13..21..44..73..solved at 108
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..9..solved at 21
      #|0..0..1..2..6..solved at 11
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..1..2..5..9..16..24..33..42..81..120..189..282..375..492..717..942..1275..1654..2033..2458..6920..11785..30392..solved at 49891
      #|0..0..1..2..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 7
      #|0..0..3..9..21..solved at 28
      #|0..0..4..9..solved at 13
      #|0..0..2..solved at 5
      #|0..0..1..2..12..28..127..297..solved at 1025
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..2..5..11..22..solved at 29
      #|0..0..1..3..7..solved at 12
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..3..solved at 8
      #|0..0..solved at 2
      #|0..0..3..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 8
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..3..8..17..32..65..solved at 94
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 8
      #|0..0..1..solved at 4
      #|0..0..2..4..solved at 8
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..5..solved at 11
      #|priority is now real
      #|0..0..0..solved at 3
      #|0..0..0..0..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..4..9..solved at 16
      #|0..0..1..4..8..solved at 15
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..3..solved at 8
      #|0..0..1..3..7..17..38..78..154..261..solved at 356
      #|0..0..0..3..8..20..47..80..solved at 95
      #|0..0..1..5..10..23..61..128..268..505..875..1615..solved at 2815
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..1..2..3..7..solved at 15
      #|0..0..1..3..solved at 7
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..1..3..5..10..19..30..solved at 49
      #|0..0..1..5..11..solved at 20
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..2..4..solved at 8
      #|0..0..0..2..solved at 6
      #|0..0..2..8..solved at 12
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..4..12..24..51..117..213..377..solved at 391
      #|0..0..4..13..27..57..135..247..440..solved at 482
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..3..solved at 8
      #|0..0..2..4..14..30..60..solved at 74
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..0..2..solved at 6
      #|0..0..2..8..solved at 12
      #|0..0..2..solved at 5
      #|0..0..1..3..5..11..23..40..73..133..211..337..solved at 532
      #|0..0..0..1..2..3..5..7..9..15..21..27..solved at 57
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 8
      #|0..0..2..4..solved at 8
      #|0..0..1..solved at 4
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..2..4..10..solved at 17
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
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
      #|0..0..solved at 2
      #|0..0..3..7..solved at 15
      #|0..0..2..4..solved at 8
      #|0..0..3..6..solved at 12
      #|0..0..2..4..solved at 8
      #|0..0..solved at 3
      #|0..0..6..12..solved at 19
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..0..solved at 5
      #|0..0..1..2..5..10..21..44..75..122..192..solved at 213
      #|0..0..1..2..5..10..22..42..74..solved at 88
      #|0..0..1..2..5..10..21..44..75..122..192..solved at 213
      #|0..0..1..3..7..solved at 12
      #|Warning: inventing type variables
      #|0..0..1..2..7..12..22..33..46..61..solved at 70
      #|Warning: inventing type variables
      #|0..0..1..2..7..12..22..33..46..61..solved at 70
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..4..solved at 9
      #|0..0..1..4..solved at 8
      #|0..0..1..2..8..solved at 13
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 7
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..5..solved at 13
      #|0..0..1..2..5..solved at 13
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..8..19..solved at 27
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..8..solved at 14
      #|0..0..1..2..5..9..15..23..31..solved at 44
      #|0..0..1..2..6..11..solved at 24
      #|0..0..1..2..3..7..solved at 17
      #|0..0..1..2..6..12..solved at 18
      #|0..0..1..solved at 4
      #|0..0..1..3..8..21..44..solved at 74
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..solved at 11
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..5..solved at 11
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..11..22..39..63..solved at 84
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..4..solved at 8
      #|0..0..1..2..5..9..solved at 16
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..2..5..solved at 9
      #|0..0..2..6..14..solved at 23
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..4..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..solved at 7
      #|0..0..1..3..6..solved at 11
      #|0..0..1..solved at 4
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
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..3..6..solved at 10
      #|0..0..3..6..solved at 10
      #|0..0..4..solved at 8
      #|0..0..3..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..3..solved at 8
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..3..6..solved at 11
      #|0..0..1..3..6..solved at 11
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..3..7..13..22..solved at 36
      #|0..0..1..2..solved at 6
      #|0..0..3..6..16..33..59..106..167..solved at 219
      #|0..0..solved at 2
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
      #|0..0..3..6..17..36..65..solved at 102
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..0..0..solved at 4
      #|0..0..2..4..solved at 14
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..1..3..5..solved at 10
      #|0..0..solved at 2
      #|0..0..1..2..5..solved at 11
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..4..8..solved at 14
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..3..7..13..23..36..56..solved at 80
      #|0..0..1..2..3..7..13..23..36..56..solved at 80
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..3..4..solved at 10
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..3..solved at 8
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..3..solved at 8
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..3..solved at 7
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|0..0..1..3..7..solved at 13
      #|0..0..solved at 2
      #|0..0..1..3..5..solved at 10
      #|0..0..1..3..5..solved at 10
      #|0..0..1..2..3..7..12..17..28..40..58..88..126..168..241..solved at 288
      #|0..0..1..3..solved at 8
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..5..solved at 11
      #|0..0..2..4..8..solved at 14
      #|0..0..2..6..solved at 16
      #|Warning: inventing type variables
      #|0..0..1..2..3..7..12..17..28..solved at 39
      #|0..0..1..3..5..solved at 10
      #|0..0..0..2..solved at 6
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
      #|0..0..2..5..solved at 9
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|0..0..0..1..3..5..solved at 10
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
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
      #|0..0..0..1..solved at 5
      #|0..0..0..1..solved at 5
      #|0..0..1..2..3..solved at 8
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..2..5..12..22..solved at 38
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..0..2..6..solved at 15
      #|0..0..1..5..12..solved at 18
      #|0..0..0..1..4..10..solved at 18
      #|0..0..1..3..6..12..23..41..70..113..solved at 128
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..0..solved at 3
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..2..5..11..21..49..85..173..308..696..1268..3688..7095..solved at 7153
      #|0..0..solved at 2
      #|0..0..1..4..11..30..solved at 73
      #|0..0..1..4..11..30..solved at 73
      #|0..0..2..4..7..solved at 17
      #|0..0..1..2..4..solved at 10
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..3..solved at 7
      #|0..0..1..solved at 4
      #|0..0..1..3..7..15..solved at 27
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..7..solved at 15
      #|0..0..1..2..3..solved at 8
      #|0..0..0..2..5..9..14..19..25..32..39..46..57..68..79..solved at 97
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..6..14..solved at 21
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..2..5..10..solved at 15
      #|0..0..1..solved at 4
      #|0..0..1..4..8..12..16..22..solved at 31
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..1..2..3..7..14..27..47..73..solved at 90
      #|0..0..1..2..3..7..14..27..47..73..solved at 99
      #|0..0..1..2..3..7..solved at 13
      #|0..0..1..2..3..7..solved at 13
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..solved at 7
      #|0..0..1..solved at 5
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..2..solved at 7
      #|0..0..1..solved at 5
      #|0..0..2..4..solved at 8
      #|0..0..1..2..7..20..38..86..173..solved at 204
      #|0..0..4..8..21..54..110..solved at 143
      #|0..0..3..6..16..37..75..147..280..472..890..1619..2986..solved at 4351
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..3..7..13..23..36..55..76..108..142..190..solved at 304
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..3..solved at 7
      #|0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..2..6..solved at 10
      #|0..0..1..3..solved at 7
      #|0..0..1..3..solved at 7
      #|0..0..1..solved at 5
      #|0..0..2..5..12..solved at 45
      #|0..0..1..3..solved at 7
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..5..solved at 9
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..5..12..solved at 18
      #|0..0..2..solved at 7
      #|0..0..1..solved at 4
      #|0..0..2..solved at 7
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..5..12..solved at 18
      #|0..0..solved at 2
      #|0..0..1..3..7..solved at 12
      #|0..0..2..solved at 5
      #|0..0..1..solved at 7
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..9..solved at 15
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..7..solved at 11
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..2..solved at 6
      #|0..0..2..5..11..22..solved at 30
      #|0..0..1..3..5..10..solved at 16
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..1..3..5..solved at 10
      #|0..0..1..3..5..solved at 10
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 5
      #|0..0..1..2..8..19..65..solved at 132
      #|0..0..1..2..8..19..65..solved at 120
      #|0..0..1..3..solved at 7
      #|0..0..1..2..solved at 6
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..1..3..5..10..solved at 18
      #|0..0..1..3..5..10..solved at 16
      #|Warning: inventing type variables
      #|0..0..0..1..2..3..4..5..6..7..8..9..solved at 18
      #|0..0..1..solved at 4
      #|0..0..1..2..3..8..solved at 14
      #|Warning: inventing type variables
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
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
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
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..2..5..10..21..solved at 27
      #|0..0..1..solved at 5
      #|0..0..3..solved at 9
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
      #|0..0..1..solved at 4
      #|0..0..0..1..4..7..solved at 12
      #|0..0..solved at 2
      #|0..0..2..5..solved at 10
      #|0..0..1..3..solved at 7
      #|0..0..2..4..solved at 8
      #|0..0..1..2..solved at 6
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
      #|0..0..solved at 3
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..2..6..solved at 15
      #|0..0..1..2..6..solved at 15
      #|0..0..0..0..3..solved at 8
      #|0..0..2..6..11..solved at 21
      #|0..0..2..5..9..solved at 18
      #|0..0..1..3..6..solved at 11
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..3..5..9..solved at 15
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..3..8..solved at 13
      #|0..0..solved at 2
      #|0..0..1..5..solved at 12
      #|0..0..3..9..solved at 13
      #|0..0..2..solved at 5
      #|0..0..3..9..solved at 13
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..1..solved at 5
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..5..8..18..solved at 30
      #|0..0..2..5..8..18..solved at 29
      #|0..0..1..3..5..11..solved at 17
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..3..solved at 7
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..7..13..21..solved at 31
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
      #|0..0..2..solved at 9
      #|0..0..2..solved at 7
      #|0..0..1..solved at 6
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..1..3..7..13..29..solved at 38
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..3..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 5
      #|0..0..1..2..8..19..65..solved at 132
      #|0..0..1..2..8..19..65..solved at 120
      #|0..0..1..3..solved at 7
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
      #|0..0..solved at 2
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
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..2..5..9..solved at 14
      #|0..0..2..5..solved at 9
      #|0..0..2..5..8..13..solved at 19
      #|0..0..1..2..solved at 6
      #|0..0..solved at 3
      #|0..0..2..5..9..solved at 14
      #|0..0..2..5..solved at 9
      #|0..0..2..5..8..13..solved at 19
      #|0..0..1..2..solved at 6
      #|0..0..2..6..13..30..60..107..184..299..477..761..1152..1727..solved at 1941
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
      #|0..0..0..1..2..3..4..5..6..solved at 13
      #|0..0..0..solved at 3
      #|0..0..1..2..3..7..16..29..solved at 52
      #|0..0..1..2..3..7..14..23..45..71..109..164..229..323..478..solved at 609
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..3..5..9..solved at 15
      #|0..0..2..4..6..14..solved at 32
      #|0..0..2..4..8..16..solved at 35
      #|0..0..1..2..3..7..solved at 20
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
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..2..4..8..16..28..43..solved at 54
      #|0..0..1..2..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 7
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
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..solved at 7
      #|0..0..2..solved at 7
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..1..solved at 5
      #|0..0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..0..solved at 3
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
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
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
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
      #|0..0..2..8..19..42..89..166..321..solved at 491
      #|0..0..2..7..15..33..67..120..233..solved at 333
      #|0..0..1..3..6..14..31..59..125..solved at 153
      #|0..0..2..6..11..solved at 21
      #|0..0..2..5..9..solved at 18
      #|0..0..1..3..6..solved at 11
      #|0..0..1..2..8..solved at 15
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..2..5..14..25..42..solved at 51
      #|0..0..1..2..3..7..solved at 14
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..3..5..12..solved at 18
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
      #|0..0..1..solved at 4
      #|0..0..0..0..solved at 4
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 5
      #|0..0..4..8..14..solved at 19
      #|0..0..2..4..10..20..33..53..73..93..123..157..195..266..347..432..587..776..969..1231..1674..solved at 2134
      #|0..0..2..4..9..18..30..45..62..79..104..140..180..237..314..395..493..621..753..928..1169..solved at 1408
      #|0..0..1..2..solved at 10
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..5..9..16..24..32..solved at 41
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..2..5..9..17..26..35..solved at 49
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..5..9..16..24..32..solved at 41
      #|0..0..0..solved at 3
      #|0..0..0..solved at 3
      #|0..0..1..2..5..9..17..26..35..solved at 49
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..3..solved at 7
      #|0..0..1..2..solved at 6
      #|0..0..1..2..3..solved at 8
      #|0..0..1..2..5..9..15..24..33..44..solved at 69
      #|0..0..1..2..3..solved at 8
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..3..solved at 7
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..3..6..solved at 12
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
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..3..6..12..24..solved at 37
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..6..12..25..48..solved at 76
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..2..5..9..solved at 14
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..2..5..10..22..solved at 28
      #|0..0..2..5..10..22..solved at 30
      #|0..0..1..5..11..24..43..67..102..139..214..342..484..712..1131..solved at 1595
      #|0..0..solved at 2
      #|0..0..1..5..11..25..45..70..106..144..221..354..501..734..1162..solved at 1636
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..5..11..24..43..67..102..139..214..342..484..712..1131..solved at 1564
      #|0..0..1..5..11..25..45..70..106..144..221..354..501..734..1162..solved at 1636
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..2..4..solved at 8
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..0..1..3..5..solved at 11
      #|0..0..1..2..3..5..8..11..16..solved at 24
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
      #|0..0..5..10..solved at 18
      #|0..0..5..10..solved at 18
      #|0..0..5..10..solved at 20
      #|0..0..5..10..solved at 20
      #|0..0..5..10..solved at 20
      #|0..0..5..10..solved at 20
      #|0..0..5..10..solved at 18
      #|0..0..5..10..solved at 18
      #|0..0..5..10..20..50..96..157..0..0..5..10..20..50..96..157..0..0..5..10..solved at 18
      #|0..0..5..10..solved at 18
      #|0..0..5..10..20..50..96..157..0..0..5..10..20..50..96..157..0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..1..3..5..solved at 10
      #|0..0..1..3..5..solved at 10
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
      #|0..0..solved at 2
      #|0..0..solved at 2
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
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..0..0..solved at 4
      #|0..0..0..0..3..solved at 8
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
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..1..solved at 4
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 8
      #|0..0..3..solved at 8
      #|0..0..3..solved at 8
      #|0..0..2..solved at 6
      #|0..0..2..solved at 6
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 7
      #|0..0..3..solved at 7
      #|0..0..3..solved at 7
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..1..solved at 4
      #|0..0..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..1..2..4..12..22..41..69..106..159..287..444..842..1414..2264..4032..6945..12419..21621..36928..solved at 39581
      #|0..0..1..2..5..9..solved at 16
      #|0..0..0..solved at 3
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
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..solved at 4
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..3..solved at 6
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..5..solved at 10
      #|0..0..4..solved at 7
      #|0..0..4..solved at 7
      #|0..0..5..solved at 12
      #|0..0..5..solved at 8
      #|0..0..4..solved at 9
      #|0..0..4..solved at 9
      #|0..0..4..solved at 7
      #|0..0..3..solved at 6
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 4
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..5..solved at 8
      #|0..0..5..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..5..solved at 8
      #|0..0..5..solved at 8
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 4
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..4..solved at 7
      #|0..0..4..solved at 7
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..solved at 6
      #|0..0..1..4..9..18..29..42..68..solved at 78
      #|0..0..1..4..9..18..29..solved at 36
      #|0..0..1..3..5..9..14..solved at 21
      #|Warning: inventing type variables
      #|0..0..2..solved at 5
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..2..3..7..13..21..solved at 33
      #|0..0..1..2..3..7..13..21..solved at 31
      #|0..0..1..2..solved at 6
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|Warning: No useful-looking instantiations of lemma
      #|0..0..1..3..solved at 7
      #|0..0..1..3..5..10..solved at 16
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|Jordan/metric_spaces quotations (1950):
      #|  \226\136\128 P : (A) -> B, \226\136\128 Q : (A) -> Bool, \226\136\128 R : (B) -> Bool, (\226\136\131 u : B, (\226\136\131 x : A, u == P(x) && Q(x)) && R(u)) == (\226\136\131 x : A, Q(x) && R(P(x)))
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 Q : (A) -> B, \226\136\128 R : (B) -> Bool, (\226\136\128 t : B, (\226\136\131 x : A, P(x) && t == Q(x)) \226\134\146 R(t)) == (\226\136\128 x : A, P(x) \226\134\146 R(Q(x)))
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 Q : (A) -> B, \226\136\128 R : (B) -> Bool, (\226\136\128 t : B, (\226\136\131 x : A, t == Q(x) && P(x)) \226\134\146 R(t)) == (\226\136\128 x : A, P(x) \226\134\146 R(Q(x)))
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 A : (A) -> Bool, \226\136\128 B : (A) -> Bool, SUBSET(A, DIFF(X, B)) == (SUBSET(A, X) && INTER(A, B) == {})
      #|  (x : A)
      #|  \226\136\128 X : ((A) -> Bool) -> Bool, \226\136\128 A : (A) -> Bool, SUBSET(A, INTERS(X)) == (\226\136\128 x : (A) -> Bool, X(x) \226\134\146 SUBSET(A, x))
      #|  \226\136\128 P : (A) -> Bool, ({(x : A) | P(x)} == {}) == (\226\136\128 x : A, !P(x))
      #|  (x : A)
      #|  \226\136\128 A : (A) -> Bool, \226\136\128 B : (A) -> Bool, \226\136\128 C : (A) -> Bool, (INTER(DIFF(A, B), C) == {}) == SUBSET(INTER(A, C), B)
      #|  \226\136\128 A : (A) -> Bool, \226\136\128 B : (A) -> Bool, \226\136\128 C : (A) -> Bool, (SUBSET(A, B) \226\134\146 SUBSET(INTER(A, C), B)) && (SUBSET(A, B) \226\134\146 SUBSET(INTER(C, A), B))
      #|  \226\136\128 A : (A) -> Bool, \226\136\128 B : (A) -> Bool, \226\136\128 C : ((A) -> Bool) -> Bool, SUBSET(A, UNIONS(INSERT(B, C))) == SUBSET(DIFF(A, B), UNIONS(C))
      #|  \226\136\128 A : (A) -> Bool, \226\136\128 B : ((A) -> Bool) -> Bool, \226\136\128 C : (A) -> Bool, SUBSET(A, UNIONS(B)) && INTER(A, C) == {} \226\134\146 SUBSET(A, UNIONS(DELETE(B, C)))
      #|  (x : _)
      #|  IMAGE((x' : (_) -> _), (B : (_) -> Bool))
      #|  \226\136\128 A : (A) -> Bool, \226\136\128 f : (A) -> B, \226\136\128 B : (B) -> Bool, SUBSET(B, IMAGE(f, A)) && FINITE(B) \226\134\146 (\226\136\131 C : (A) -> Bool, SUBSET(C, A) && FINITE(C) && B == IMAGE(f, C))
      #|  TAGB
      #|  TAGB
      #|  \226\136\128 A : (A) -> Bool, INTERS({A}) == A
      #|  ((a : Bool) \226\134\146 (b : Bool)) \226\134\146 !(a && !b)
      #|  (x' : A)
      #|  (u : A)
      #|  \226\136\128 A : (A) -> Bool, \226\136\128 x : A, (DELETE(A, x) == {}) == (!(A == {}) \226\134\146 A == {x})
      #|  (u : A)
      #|  TAGB
      #|  \226\136\128 A : ((A) -> Bool) -> Bool, \226\136\128 B : ((A) -> Bool) -> Bool, SUBSET(A, B) \226\134\146 SUBSET(INTERS(B), INTERS(A))
      #|  SUBSET(INTERS(DELETE((V : ((_) -> Bool) -> Bool), (u : (_) -> Bool))), (x : (_) -> Bool))
      #|  SUBSET(INTER(INTERS(DELETE((V : ((_) -> Bool) -> Bool), (u : (_) -> Bool))), u), INTERS(DELETE(V, u)))
      #|  (x : _) == (u : _)
      #|  SUBSET(INTER(INTERS(DELETE((V : ((_) -> Bool) -> Bool), (u : (_) -> Bool))), u), u)
      #|  \226\136\128 V : ((A) -> Bool) -> Bool, \226\136\128 u : (A) -> Bool, V(u) \226\134\146 INTERS(V) == INTER(INTERS(DELETE(V, u)), u)
      #|  \226\136\128 A : (A) -> Bool, (A == {}) == (\226\136\128 x : A, !A(x))
      #|  (x' : (_) -> Bool) == {}
      #|  (x' : _)
      #|  (x : _)
      #|  (x : _)
      #|  \226\136\128 x : _, !(U : (_) -> Bool)(x)
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, (UNIONS(U) == {}) == (U == {} || U == {{}})
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  \226\136\128 A : ((A) -> Bool) -> Bool, (INTERS(A) == {}) == (\226\136\128 x : A, \226\136\131 a : (A) -> Bool, A(a) && !a(x))
      #|  (SUC((a : Num)) == 1) == (a == 0)
      #|  SUC(CARD(DELETE((X : (_) -> Bool), CHOICE(X)))) == 1
      #|  !(0 == 1)
      #|  !((X : (_) -> Bool) == {})
      #|  CHOICE((X : (_) -> Bool))
      #|  \226\136\128 X : (A) -> Bool, HAS_SIZE(X, 1) \226\134\146 SING(X)
      #|  ((x' : _), (x'' : _))
      #|  (b : _)
      #|  (a : _)
      #|  fn { (u, v) => ((f : (_) -> _)(u), (f' : (_) -> _)(v)) }
      #|  {((m : Num), (n : Num)) | true}
      #|  :A
      #|  :(Num, Num)
      #|  \226\136\128 A : (A) -> Bool, \226\136\128 B : (B) -> Bool, COUNTABLE(A) && COUNTABLE(B) \226\134\146 COUNTABLE({((a : A), (b : B)) | A(a) && B(b)})
      #|  \226\136\128 A : (A) -> Bool, IMAGE(I, A) == A
      #|  \226\136\128 X : (A) -> Bool, (X == {}) == !(\226\136\131 u : A, X(u))
      #|  (y : B)
      #|  \226\136\128 f : (A) -> B, \226\136\128 X : (A) -> Bool, \226\136\128 Y : (B) -> Bool, BIJ(f, X, Y) \226\134\146 (\226\136\128 t : (A) -> Bool, SUBSET(t, X) \226\134\146 IMAGE(f, DIFF(X, t)) == DIFF(Y, IMAGE(f, t)))
      #|  \226\136\128 Z1 : (A) -> Bool, \226\136\128 Z2 : (A) -> Bool, \226\136\128 A : (A) -> Bool, SUBSET(UNION(Z1, Z2), A) == (SUBSET(Z1, A) && SUBSET(Z2, A))
      #|  \226\136\128 f : (A) -> B, \226\136\128 A : (B) -> Bool, \226\136\128 B : (B) -> Bool, \226\136\128 X : (A) -> Bool, INTER(A, B) == {} \226\134\146 INTER(preimage(X, f, A), preimage(X, f, B)) == {}
      #|  \226\136\128 f : (A) -> B, \226\136\128 A : (B) -> Bool, \226\136\128 B : (B) -> Bool, \226\136\128 X : (A) -> Bool, \226\136\128 Z : (A) -> Bool, SUBSET(Z, UNION(preimage(X, f, A), preimage(X, f, B))) == (SUBSET(Z, X) && SUBSET(IMAGE(f, Z), UNION(A, B)))
      #|  \226\136\128 f : (A) -> B, \226\136\128 A : (B) -> Bool, \226\136\128 X : (A) -> Bool, \226\136\128 Z : (A) -> Bool, SUBSET(Z, preimage(X, f, A)) == (SUBSET(Z, X) && SUBSET(IMAGE(f, Z), A))
      #|  \226\136\128 dom : (A) -> Bool, \226\136\128 f : (A) -> B, \226\136\128 C : ((B) -> Bool) -> Bool, preimage(dom, f, UNIONS(C)) == UNIONS(IMAGE(preimage(dom, f), C))
      #|  \226\136\128 f : (A) -> B, \226\136\128 X : (A) -> Bool, \226\136\128 A : (B) -> Bool, \226\136\128 B : (B) -> Bool, SUBSET(A, B) \226\134\146 SUBSET(preimage(X, f, A), preimage(X, f, B))
      #|  \226\136\128 X : (A) -> Bool, ((B : (A) -> Bool) => INTER(B, X)) == INTER(X) && ((B : (A) -> Bool) => INTER(X, B)) == INTER(X)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 x : (Num) -> Real, real_of_num(0) <= sum((m, n), (i : Num) => x(i) * x(i))
      #|  (n : Int)
      #|  \226\136\128 n : Int, real_of_num(0) < twopow(n)
      #|  (a : Real) * ((b : Real) * (cc : Real)) == a * cc * b
      #|  \226\136\128 n : Num, real_of_num(2) * twopow(-int_of_num(n + 1)) == twopow(-int_of_num(n))
      #|  (x : _)
      #|  (x : _) == CHOICE((X : (_) -> Bool))
      #|  (x : _) == CHOICE((X : (_) -> Bool))
      #|  if (delta : Real) < CHOICE((X : (Real) -> Bool)) { delta } else { CHOICE(X) }
      #|  ((b : Bool) \226\134\146 !(a : Bool)) \226\134\146 a \226\134\146 !b
      #|  SUC((x : Num)) == SUC((y : Num)) \226\134\146 x == y
      #|  (a : Bool) && (b : Bool) \226\134\146 b && a
      #|  FINITE(DELETE((X : (_) -> Bool), CHOICE(X))) && !(DELETE(X, CHOICE(X)) == {}) && HAS_SIZE(DELETE(X, CHOICE(X)), (k : Num))
      #|  (x : _)
      #|  SING((X : (_) -> Bool))
      #|  SUC(0) == 1
      #|  (k : Num) == 0
      #|  DELETE((X : (_) -> Bool), CHOICE(X))
      #|  CARD((X : (_) -> Bool))
      #|  (X : _)
      #|  (\226\136\128 X : (Real) -> Bool, \226\136\128 k : Num, FINITE(X) && !(X == {}) && HAS_SIZE(X, k) \226\134\146 (\226\136\131 delta : Real, X(delta) && (\226\136\128 x : Real, X(x) \226\134\146 delta <= x))) \226\134\146 (\226\136\128 X : (Real) -> Bool, FINITE(X) && !(X == {}) \226\134\146 (\226\136\131 delta : Real, X(delta) && (\226\136\128 x : Real, X(x) \226\134\146 delta <= x)))
      #|  \226\136\128 X : (Real) -> Bool, FINITE(X) && !(X == {}) \226\134\146 (\226\136\131 delta : Real, X(delta) && (\226\136\128 x : Real, X(x) \226\134\146 delta <= x))
      #|  TAGB
      #|  (c : Real) + real_of_num(1)
      #|  (delta : _)
      #|  !((X : (_) -> Bool) == {})
      #|  \226\136\128 c : Real, \226\136\128 X : (Real) -> Bool, FINITE(X) && (\226\136\128 x : Real, X(x) \226\134\146 c < x) \226\134\146 (\226\136\131 delta : Real, c < delta && (\226\136\128 x : Real, X(x) \226\134\146 delta <= x))
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, a <= b && b <= c \226\134\146 UNION({(x : Real) | a <= x && x < b}, {(x : Real) | b <= x && x <= c}) == {(x : Real) | a <= x && x <= c}
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, x < z / real_of_num(2) && y < z / real_of_num(2) \226\134\146 x + y < z
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, x < z / real_of_num(2) && y <= z / real_of_num(2) \226\134\146 x + y < z
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, x <= z / real_of_num(2) && y < z / real_of_num(2) \226\134\146 x + y < z
      #|  \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 z : Real, x <= z / real_of_num(2) && y <= z / real_of_num(2) \226\134\146 x + y <= z
      #|  (j : Num)
      #|  (x : Num)
      #|  (x : Num)
      #|  ((a : Bool) \226\134\146 (b : Bool)) && ((c : Bool) \226\134\146 b) \226\134\146 a || c \226\134\146 b
      #|  (c : Real)
      #|  \226\136\128 a : (Real) -> Bool, \226\136\128 b : (Real) -> Bool, a == b \226\134\146 FINITE(a) \226\134\146 FINITE(b)
      #|  FINITE({(y : Real) | \226\136\131 x : Num, IN(x, (inter : (Num) -> Bool)) && y == -real_of_num(x)})
      #|  FINITE({(y : Real) | \226\136\131 x : Num, IN(x, (inter : (Num) -> Bool)) && y == real_of_num(x)})
      #|  (inter : (Num) -> Bool) == {(n : Num) | n <= (N : Num)}
      #|  \226\136\128 N : Num, FINITE({(x : Real) | \226\136\131 j : Num, abs(x) == real_of_num(j) && j <= N})
      #|  real_of_num(0) + real_of_num(0) == real_of_num(0)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, \226\136\128 n : Num, euclid_euclid(n, f) && euclid_euclid(n, g) \226\134\146 euclid_euclid(n, f + g)
      #|  (t : Real) * real_of_num(0) == real_of_num(0)
      #|  \226\136\128 n : Num, \226\136\128 t : Real, \226\136\128 f : (Num) -> Real, euclid_euclid(n, f) \226\134\146 euclid_euclid(n, euclid_euclid_scale(t, f))
      #|  (-(x : Real) == real_of_num(0)) == (x == real_of_num(0))
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 n : Num, euclid_euclid(n, f) \226\134\146 euclid_euclid(n, -f)
      #|  real_of_num(0) - real_of_num(0) == real_of_num(0)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, \226\136\128 n : Num, euclid_euclid(n, f) && euclid_euclid(n, g) \226\134\146 euclid_euclid(n, f - g)
      #|  ((x : Real) == real_of_num(0)) == (-x == real_of_num(0))
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 n : Num, euclid_euclid(n, f) == euclid_euclid(n, -f)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 m : Num, \226\136\128 n : Num, m <= n && euclid_euclid(m, f) \226\134\146 euclid_euclid(n, f)
      #|  (n' : Num) <= (n : Num) + n'
      #|  (n : Num) <= n + (n' : Num)
      #|  (n : Num) + (n' : Num)
      #|  (op_q : ((_) -> Bool) -> Bool)
      #|  euclid_euclid
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, euclid_euclidean(f) && euclid_euclidean(g) \226\134\146 euclid_euclidean(f + g)
      #|  (n' : Num) <= (n : Num) + n'
      #|  (n : Num) <= n + (n' : Num)
      #|  (n : Num) + (n' : Num)
      #|  (op_q : ((_) -> Bool) -> Bool)
      #|  euclid_euclid
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, euclid_euclidean(f) && euclid_euclidean(g) \226\134\146 euclid_euclidean(f - g)
      #|  (n : Num)
      #|  \226\136\128 s : Real, \226\136\128 f : (Num) -> Real, euclid_euclidean(f) \226\134\146 euclid_euclidean(euclid_euclid_scale(s, f))
      #|  (n : Num)
      #|  \226\136\128 f : (Num) -> Real, euclid_euclidean(f) \226\134\146 euclid_euclidean(-f)
      #|  (a : Real) + (b : Real) == b + a
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, f + g == g + f
      #|  (a : Real) + (b : Real) + (c : Real) == a + (b + c)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, \226\136\128 h : (Num) -> Real, f + g + h == f + (g + h)
      #|  :B
      #|  :Real
      #|  :A
      #|  :Num
      #|  real_of_num(0) + (a : Real) == a
      #|  \226\136\128 f : (Num) -> Real, euclid_euclid0 + f == f
      #|  :B
      #|  :Real
      #|  :A
      #|  :Num
      #|  (a : Real) + real_of_num(0) == a
      #|  \226\136\128 f : (Num) -> Real, f + euclid_euclid0 == f
      #|  (a : Real) * ((b : Real) + (c : Real)) == a * b + a * c
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, \226\136\128 r : Real, euclid_euclid_scale(r, f + g) == euclid_euclid_scale(r, f) + euclid_euclid_scale(r, g)
      #|  ((a : Real) + (b : Real)) * (c : Real) == a * c + b * c
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 r : Real, \226\136\128 s : Real, euclid_euclid_scale(r + s, f) == euclid_euclid_scale(r, f) + euclid_euclid_scale(s, f)
      #|  (a : Real) * (b : Real) * (c : Real) == a * (b * c)
      #|  \226\136\128 r : Real, \226\136\128 s : Real, \226\136\128 f : (Num) -> Real, euclid_euclid_scale(r, euclid_euclid_scale(s, f)) == euclid_euclid_scale(r * s, f)
      #|  \226\136\128 f : (Num) -> Real, euclid_euclid_scale(real_of_num(1), f) == f
      #|  \226\136\128 x : (Num) -> Real, \226\136\128 y : (Num) -> Real, -x - -y == -(x - y)
      #|  \226\136\128 x : (Num) -> Real, \226\136\128 t : Real, euclid_euclid_scale(t, x) + euclid_euclid_scale(real_of_num(1) - t, x) == x
      #|  (q : Num) >= q
      #|  ((a : Num) <= (b : Num)) == (b >= a)
      #|  (n : Num) >= (q : Num)
      #|  euclid_euclid((q : Num), (f : (Num) -> Real))
      #|  (f : (Num) -> Real)((n : Num)) == real_of_num(0)
      #|  \226\136\128 n : Num, n >= (q : Num) \226\134\146 ((i : Num) => (f : (Num) -> Real)(i) * (g : (Num) -> Real)(i))(n) == real_of_num(0)
      #|  (u : Real) == real_of_num(0) \226\134\146 (x : Real) == x + u
      #|  (p : Num)
      #|  (q : Num)
      #|  (q : Num) == min_num((P : (Num) -> Bool))
      #|  euclid_euclid(min_num((P : (Num) -> Bool)), (f : (Num) -> Real)) && euclid_euclid(min_num(P), (g : (Num) -> Real))
      #|  min_num((P : (Num) -> Bool)) <= (p : Num)
      #|  (P : (Num) -> Bool)((p : Num))
      #|  (P : (Num) -> Bool) == ((m : Num) => euclid_euclid(m, (f : (Num) -> Real)) && euclid_euclid(m, (g : (Num) -> Real)))
      #|  \226\136\128 p : Num, \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, euclid_euclid(p, f) && euclid_euclid(p, g) \226\134\146 euclid_dot(f, g) == sum((0, p), (i : Num) => f(i) * g(i))
      #|  real_of_num(0) * (a : Real) == real_of_num(0)
      #|  euclid_euclid((n : Num), (f : (Num) -> Real)) && euclid_euclid(n, (g : (Num) -> Real))
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, \226\136\128 m : Num, \226\136\128 n : Num, m <= n && euclid_euclid(m, f) && euclid_euclid(m, g) \226\134\146 euclid_dot(f, g) == sum((0, n), (i : Num) => f(i) * g(i))
      #|  (i : Num) => (f : (Num) -> Real)(i) * f(i)
      #|  \226\136\128 n : Num, real_of_num(0) <= ((i : Num) => (f : (Num) -> Real)(i) * f(i))(n)
      #|  \226\136\128 f : (Num) -> Real, real_of_num(0) <= euclid_dot(f, f)
      #|  ((a : Bool) && (b : Bool)) == (b && a)
      #|  (a : Real) * (b : Real) == b * a
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, euclid_dot(f, g) == euclid_dot(g, f)
      #|  -(x : Real) * (y : Real) == -(x * y)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, euclid_dot(-f, g) == -euclid_dot(f, g)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, euclid_dot(f, -g) == -euclid_dot(f, g)
      #|  (a : Real) * ((b : Real) * (c : Real)) == a * b * c
      #|  (f : (Num) -> Real)
      #|  (s : Real)
      #|  (n : Num)
      #|  euclid_euclid((n : Num), (i : Num) => (s : Real) * (f : (Num) -> Real)(i)) && euclid_euclid(n, (g : (Num) -> Real))
      #|  \226\136\128 n : Num, \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, \226\136\128 s : Real, euclid_euclid(n, f) && euclid_euclid(n, g) \226\134\146 euclid_dot(euclid_euclid_scale(s, f), g) == s * euclid_dot(f, g)
      #|  euclid_euclid((n : Num) + (n' : Num), (f : (Num) -> Real)) && euclid_euclid(n + n', (g : (Num) -> Real))
      #|  (n : Num) <= n + (n' : Num)
      #|  (n' : Num) <= (n : Num) + n'
      #|  euclid_euclid
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, \226\136\128 s : Real, euclid_euclidean(f) && euclid_euclidean(g) \226\134\146 euclid_dot(euclid_euclid_scale(s, f), g) == s * euclid_dot(f, g)
      #|  \226\136\128 n : Num, \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, \226\136\128 s : Real, euclid_euclid(n, f) && euclid_euclid(n, g) \226\134\146 euclid_dot(f, euclid_euclid_scale(s, g)) == s * euclid_dot(f, g)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, \226\136\128 s : Real, euclid_euclidean(f) && euclid_euclidean(g) \226\134\146 euclid_dot(f, euclid_euclid_scale(s, g)) == s * euclid_dot(f, g)
      #|  ((a : Real) + (b : Real)) * (c : Real) == a * c + b * c
      #|  (h : (Num) -> Real)
      #|  (f : (Num) -> Real) + (g : (Num) -> Real)
      #|  (n : Num)
      #|  (h : (Num) -> Real)
      #|  (g : (Num) -> Real)
      #|  (n : Num)
      #|  (h : (Num) -> Real)
      #|  (f : (Num) -> Real)
      #|  (n : Num)
      #|  euclid_euclid((n : Num), (f : (Num) -> Real) + (g : (Num) -> Real))
      #|  \226\136\128 n : Num, \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, \226\136\128 h : (Num) -> Real, euclid_euclid(n, f) && euclid_euclid(n, g) && euclid_euclid(n, h) \226\134\146 euclid_dot(f + g, h) == euclid_dot(f, h) + euclid_dot(g, h)
      #|  ((a : Real) - (b : Real)) * (c : Real) == a * c - b * c
      #|  (h : (Num) -> Real)
      #|  (f : (Num) -> Real) - (g : (Num) -> Real)
      #|  (n : Num)
      #|  (h : (Num) -> Real)
      #|  (g : (Num) -> Real)
      #|  (n : Num)
      #|  (h : (Num) -> Real)
      #|  (f : (Num) -> Real)
      #|  (n : Num)
      #|  euclid_euclid((n : Num), (f : (Num) -> Real) - (g : (Num) -> Real))
      #|  \226\136\128 n : Num, \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, \226\136\128 h : (Num) -> Real, euclid_euclid(n, f) && euclid_euclid(n, g) && euclid_euclid(n, h) \226\134\146 euclid_dot(f - g, h) == euclid_dot(f, h) - euclid_dot(g, h)
      #|  (n'' : Num) <= (n : Num) + ((n' : Num) + n'')
      #|  euclid_euclid((n : Num) + ((n' : Num) + (n'' : Num)), (h : (Num) -> Real))
      #|  (n' : Num) <= (n : Num) + (n' + (n'' : Num))
      #|  euclid_euclid((n : Num) + ((n' : Num) + (n'' : Num)), (g : (Num) -> Real))
      #|  (n : Num) <= n + ((n' : Num) + (n'' : Num))
      #|  euclid_euclid((n : Num) + ((n' : Num) + (n'' : Num)), (f : (Num) -> Real))
      #|  euclid_euclid
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, \226\136\128 h : (Num) -> Real, euclid_euclidean(f) && euclid_euclidean(g) && euclid_euclidean(h) \226\134\146 euclid_dot(f + g, h) == euclid_dot(f, h) + euclid_dot(g, h)
      #|  (n'' : Num) <= (n : Num) + ((n' : Num) + n'')
      #|  euclid_euclid((n : Num) + ((n' : Num) + (n'' : Num)), (h : (Num) -> Real))
      #|  (n' : Num) <= (n : Num) + (n' + (n'' : Num))
      #|  euclid_euclid((n : Num) + ((n' : Num) + (n'' : Num)), (g : (Num) -> Real))
      #|  (n : Num) <= n + ((n' : Num) + (n'' : Num))
      #|  euclid_euclid((n : Num) + ((n' : Num) + (n'' : Num)), (f : (Num) -> Real))
      #|  euclid_euclid
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, \226\136\128 h : (Num) -> Real, euclid_euclidean(f) && euclid_euclidean(g) && euclid_euclidean(h) \226\134\146 euclid_dot(f - g, h) == euclid_dot(f, h) - euclid_dot(g, h)
      #|  \226\136\128 n : Num, \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, \226\136\128 h : (Num) -> Real, euclid_euclid(n, f) && euclid_euclid(n, g) && euclid_euclid(n, h) \226\134\146 euclid_dot(h, f + g) == euclid_dot(h, f) + euclid_dot(h, g)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, \226\136\128 h : (Num) -> Real, euclid_euclidean(f) && euclid_euclidean(g) && euclid_euclidean(h) \226\134\146 euclid_dot(h, f + g) == euclid_dot(h, f) + euclid_dot(h, g)
      #|  \226\136\128 n : Num, \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, \226\136\128 h : (Num) -> Real, euclid_euclid(n, f) && euclid_euclid(n, g) && euclid_euclid(n, h) \226\134\146 euclid_dot(h, f - g) == euclid_dot(h, f) - euclid_dot(h, g)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, \226\136\128 h : (Num) -> Real, euclid_euclidean(f) && euclid_euclidean(g) && euclid_euclidean(h) \226\134\146 euclid_dot(h, f - g) == euclid_dot(h, f) - euclid_dot(h, g)
      #|  (a : Real) * real_of_num(0) == real_of_num(0)
      #|  ((i : Num) => (f : (Num) -> Real)(i) * real_of_num(0)) == ((r : Num) => real_of_num(0))
      #|  \226\136\128 f : (Num) -> Real, euclid_dot(f, euclid_euclid0) == real_of_num(0)
      #|  \226\136\128 f : (Num) -> Real, euclid_dot(euclid_euclid0, f) == real_of_num(0)
      #|  euclid_euclid((n : Num), (f : (Num) -> Real))
      #|  (a : Real) <= real_of_num(0) && real_of_num(0) <= a \226\134\146 a == real_of_num(0)
      #|  (a : Real) == (f : (Num) -> Real)((x : Num))
      #|  (a : Real) + (b : Real) <= real_of_num(0) \226\134\146 real_of_num(0) <= a \226\134\146 b <= real_of_num(0)
      #|  (a : Real) + (b : Real) == real_of_num(0) \226\134\146 real_of_num(0) <= b \226\134\146 a <= real_of_num(0)
      #|  (i : Num) => (f : (Num) -> Real)(i) * f(i)
      #|  \226\136\128 a : Num, \226\136\128 b : Num, real_of_num(0) <= sum((a, b), (i : Num) => (f : (Num) -> Real)(i) * f(i))
      #|  0 + (x : Num) == x
      #|  sum((0, (n : Num)), (i : Num) => (f : (Num) -> Real)(i) * f(i)) == real_of_num(0)
      #|  (n : Num)
      #|  SUC((x : Num))
      #|  (x : Num) < (n : Num) \226\134\146 SUC(x) <= n
      #|  (x : Num) < (n : Num) || n <= x
      #|  (f : (Num) -> Real)
      #|  (f : (Num) -> Real)
      #|  (n : Num)
      #|  euclid_dot((f : (Num) -> Real), f) == real_of_num(0)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 n : Num, euclid_euclid(n, f) && euclid_dot(f, f) == real_of_num(0) \226\134\146 f == euclid_euclid0
      #|  euclid_euclid
      #|  \226\136\128 f : (Num) -> Real, euclid_euclidean(f) && euclid_dot(f, f) == real_of_num(0) \226\134\146 f == euclid_euclid0
      #|  \226\136\128 f : (Num) -> Real, real_of_num(0) <= euclid_norm(f)
      #|  --(x : Real) == x
      #|  \226\136\128 f : (Num) -> Real, euclid_norm(-f) == euclid_norm(f)
      #|  (a : Real)
      #|  (real_of_num(0) <= (a : Real) * (a * (c : Real)) + -(b : Real) * (a * b)) == (a * (b * b) <= a * (a * c))
      #|  (x : Real) + real_of_num(0) == x
      #|  -(b : Real) * ((a : Real) * b) + b * (b * a) == real_of_num(0)
      #|  (a : Real) * (-(b : Real) * (c : Real)) == -(a * (b * c)) && -(-a * b) == a * b
      #|  real_of_num(2) * (x : Real) == x + x
      #|  (c : Real) == euclid_dot((g : (Num) -> Real), g)
      #|  (b : Real) == euclid_dot((f : (Num) -> Real), (g : (Num) -> Real))
      #|  (a : Real) == euclid_dot((f : (Num) -> Real), f)
      #|  real_le
      #|  !((x : Real) == real_of_num(0)) && real_of_num(0) <= x \226\134\146 real_of_num(0) < x
      #|  real_of_num(0) < euclid_dot((f : (Num) -> Real), f)
      #|  (g : (Num) -> Real)
      #|  (f : (Num) -> Real)
      #|  euclid_euclid_scale(-euclid_dot((f : (Num) -> Real), (g : (Num) -> Real)), f) + euclid_euclid_scale(euclid_dot(f, f), g)
      #|  (a : Real) == (b : Real) \226\134\146 a + b == a * real_of_num(2)
      #|  (b : Real) + (c : Real) == (e : Real) \226\134\146 (a : Real) + (b + (c + (d : Real))) == a + (e + d)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, euclid_dot(euclid_euclid_scale(a, (f : (Num) -> Real)) + euclid_euclid_scale(b, (g : (Num) -> Real)), euclid_euclid_scale(a, f) + euclid_euclid_scale(b, g)) == a * (a * euclid_dot(f, f)) + (real_of_num(2) * (a * (b * euclid_dot(f, g))) + b * (b * euclid_dot(g, g)))
      #|  (x : Real) <= x
      #|  real_of_num(0) * (x : Real) == real_of_num(0)
      #|  (f : (Num) -> Real) == euclid_euclid0 || !(f == euclid_euclid0)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, euclid_euclidean(f) && euclid_euclidean(g) \226\134\146 abs(euclid_dot(f, g)) <= euclid_norm(f) * euclid_norm(g)
      #|  euclid_dot((f : (Num) -> Real), f)
      #|  -euclid_dot((f : (Num) -> Real), (g : (Num) -> Real))
      #|  \226\136\128 h : (Num) -> Real, euclid_norm(h) * euclid_norm(h) == euclid_dot(h, h)
      #|  (x : Real) <= abs(x)
      #|  (a : Real) == (b : Real) && a <= (e : Real) \226\134\146 a + (b + (c : Real)) <= c + (e + e)
      #|  (b : Real) <= (c : Real) \226\134\146 (a : Real) + b <= a + c
      #|  real_of_num(0) <= (x : Real) && real_of_num(0) <= (y : Real) \226\134\146 real_of_num(0) <= x + y
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 g : (Num) -> Real, euclid_euclidean(f) && euclid_euclidean(g) \226\134\146 euclid_norm(f + g) <= euclid_norm(f) + euclid_norm(g)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 a : A, euclid_metric_space((X, d)) && X(a) \226\134\146 d(a, a) == real_of_num(0)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 a : A, \226\136\128 b : A, euclid_metric_space((X, d)) && X(a) && X(b) \226\134\146 d(a, b) == d(b, a)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 a : A, \226\136\128 b : A, \226\136\128 c : A, euclid_metric_space((X, d)) && X(a) && X(b) && X(c) \226\134\146 d(a, c) <= d(a, b) + d(b, c)
      #|  op_slash_bslash
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 Y : (A) -> Bool, \226\136\128 d : (A, A) -> Real, SUBSET(Y, X) && euclid_metric_space((X, d)) \226\134\146 euclid_metric_space((Y, d))
      #|  (z : A)
      #|  (y : A)
      #|  (x : A)
      #|  (x : (Num) -> Real) - (z : (Num) -> Real) == x - (y : (Num) -> Real) + (y - z)
      #|  (x : (Num) -> Real) - (y : (Num) -> Real) == -(y - x)
      #|  (y : (Num) -> Real) - y == euclid_euclid0
      #|  ((a : Real) == (b : Real)) == (a - b == real_of_num(0))
      #|  (n : Num)
      #|  (x : (Num) -> Real) - (y : (Num) -> Real) == euclid_euclid0
      #|  (real_of_num(0) == (x : Real)) == (x == real_of_num(0))
      #|  euclid_metric_space((euclid_euclidean, euclid_d_euclid))
      #|  (n : Num)
      #|  euclid_euclidean
      #|  \226\136\128 n : Num, euclid_metric_space((euclid_euclid(n), euclid_d_euclid))
      #|  0 + 0 == 0
      #|  real_of_num(0) + (x : Real) == x
      #|  1 == SUC(0)
      #|  1
      #|  1
      #|  (x : (Num) -> Real) - (y : (Num) -> Real)
      #|  (x : (Num) -> Real) - (y : (Num) -> Real)
      #|  1 <= 1
      #|  euclid_euclid(1, (x : (Num) -> Real) - (y : (Num) -> Real))
      #|  \226\136\128 x : (Num) -> Real, \226\136\128 y : (Num) -> Real, euclid_euclid(1, x) && euclid_euclid(1, y) \226\134\146 euclid_d_euclid(x, y) == abs(x(0) - y(0))
      #|  \226\136\128 i : Num, \226\136\128 t : Real, euclid_coord(i, euclid_euclid_scale(t, dirac_delta(i))) == t
      #|  \226\136\128 x : Real, euclid_euclid_scale(x, dirac_delta(0), 0) == x
      #|  1 <= (m : Num) \226\134\146 !(0 == m)
      #|  !(0 == (m : Num)) \226\134\146 1 <= m
      #|  (n : Num)
      #|  \226\136\128 x : (Num) -> Real, euclid_euclid(1, x) == (x == euclid_euclid_scale(x(0), dirac_delta(0)))
      #|  (proj : (Num, (Num) -> Real, Num) -> Real)((i : Num), (x : (Num) -> Real)) == ((j : Num) => if j == 0 { x(i) } else { real_of_num(0) })
      #|  \226\136\128 i : Num, \226\136\128 x : (Num) -> Real, euclid_euclid(1, euclid_proj(i, x))
      #|  (n : Num)
      #|  (n : Num)
      #|  (x : (Num) -> Real) - (y : (Num) -> Real)
      #|  (x : (Num) -> Real) - (y : (Num) -> Real)
      #|  euclid_euclid((n : Num), (x : (Num) -> Real) - (y : (Num) -> Real))
      #|  (n : Num) <= n
      #|  \226\136\128 n : Num, \226\136\128 x : (Num) -> Real, \226\136\128 y : (Num) -> Real, euclid_euclid(n, x) && euclid_euclid(n, y) \226\134\146 euclid_d_euclid(x, y) == sqrt(sum((0, n), (i : Num) => (x(i) - y(i)) * (x(i) - y(i))))
      #|  (n : _)
      #|  (n : _)
      #|  (x : _)
      #|  (x : _)
      #|  \226\136\128 n : Num, \226\136\128 x : (Num) -> Real, euclid_euclid(n, x) \226\134\146 euclid_norm(x) == sqrt(sum((0, n), (i : Num) => x(i) * x(i)))
      #|  (n : Num) <= n
      #|  real_of_num(0) + (x : Real) == x
      #|  1 == SUC(0)
      #|  1
      #|  \226\136\128 i : Num, \226\136\128 x : (Num) -> Real, \226\136\128 y : (Num) -> Real, euclid_d_euclid(euclid_proj(i, x), euclid_proj(i, y)) == abs(x(i) - y(i))
      #|  \226\136\128 x : (Num) -> Real, \226\136\128 y : (Num) -> Real, \226\136\128 n : Num, euclid_euclid(n, x) && euclid_euclid(n, y) \226\134\146 real_of_num(0) <= euclid_d_euclid(x, y)
      #|  (x : (Num) -> Real) - (y : (Num) -> Real)
      #|  (n : Num) - (i : Num) - 1
      #|  SUC((i : Num))
      #|  (x : (Num) -> Real) - (y : (Num) -> Real)
      #|  (i : Num)
      #|  0
      #|  (a : Real) == (c : Real) && real_of_num(0) <= (b : Real) \226\134\146 a <= b + c
      #|  0 + (i : Num) == i
      #|  (a : Real) <= (b : Real) && real_of_num(0) <= (c : Real) \226\134\146 a <= b + c
      #|  !((n : Num) <= (i : Num)) \226\134\146 i < n && n == SUC(i) + (n - i - 1)
      #|  (x : Real) == real_of_num(0) && real_of_num(0) <= (y : Real) \226\134\146 x <= y
      #|  (n : Num) <= (i : Num)
      #|  real_of_num(0) <= sum((0, (n : Num)), (i : Num) => ((x : (Num) -> Real)(i) - (y : (Num) -> Real)(i)) * (x(i) - y(i)))
      #|  euclid_euclid((n : Num), (x : (Num) -> Real) - (y : (Num) -> Real))
      #|  (n : Num)
      #|  \226\136\128 n : Num, \226\136\128 x : (Num) -> Real, \226\136\128 y : (Num) -> Real, \226\136\128 i : Num, euclid_euclid(n, x) && euclid_euclid(n, y) \226\134\146 abs(x(i) - y(i)) <= euclid_d_euclid(x, y)
      #|  1 <= (m : Num) \226\134\146 !(0 == m)
      #|  \226\136\128 x : Real, euclid_euclid(1, euclid_euclid_scale(x, dirac_delta(0)))
      #|  \226\136\128 n : Num, \226\136\128 x : (Num) -> Real, \226\136\128 y : (Num) -> Real, euclid_euclid(n, x) && euclid_euclid(n, y) \226\134\146 pow(euclid_d_euclid(x, y), 2) == sum((0, n), (i : Num) => (x(i) - y(i)) * (x(i) - y(i)))
      #|  real_of_num(0) <= real_of_num((n : Num))
      #|  (t : Real) == (x : (Num) -> Real)((i : Num)) - (y : (Num) -> Real)(i)
      #|  (i : Num)
      #|  \226\136\128 i : Num, ((x : (Num) -> Real)(i) - (y : (Num) -> Real)(i)) * (x(i) - y(i)) <= (eps : Real) * eps
      #|  abs((x : Real)) <= (eps : Real) \226\134\146 real_of_num(0) <= eps
      #|  0
      #|  \226\136\128 n : Num, \226\136\128 x : (Num) -> Real, \226\136\128 y : (Num) -> Real, \226\136\128 eps : Real, euclid_euclid(n, x) && euclid_euclid(n, y) && (\226\136\128 i : Num, abs(x(i) - y(i)) <= eps) \226\134\146 euclid_d_euclid(x, y) <= sqrt(real_of_num(n)) * eps
      #|  (i : Num)
      #|  (x : (Num) -> Real) + (z : (Num) -> Real) - ((y : (Num) -> Real) + z) == x - y
      #|  (n : Num)
      #|  euclid_euclid((n : Num), (x : (Num) -> Real) + (z : (Num) -> Real) - ((y : (Num) -> Real) + z))
      #|  euclid_euclid((n : Num), (x : (Num) -> Real) - (y : (Num) -> Real))
      #|  \226\136\128 n : Num, \226\136\128 x : (Num) -> Real, \226\136\128 y : (Num) -> Real, \226\136\128 z : (Num) -> Real, euclid_euclid(n, x) && euclid_euclid(n, y) && euclid_euclid(n, z) \226\134\146 euclid_d_euclid(x + z, y + z) == euclid_d_euclid(x, y)
      #|  (i : Num)
      #|  (z : (Num) -> Real) + (x : (Num) -> Real) - (z + (y : (Num) -> Real)) == x - y
      #|  (n : Num)
      #|  euclid_euclid((n : Num), (z : (Num) -> Real) + (x : (Num) -> Real) - (z + (y : (Num) -> Real)))
      #|  euclid_euclid((n : Num), (x : (Num) -> Real) - (y : (Num) -> Real))
      #|  \226\136\128 n : Num, \226\136\128 x : (Num) -> Real, \226\136\128 y : (Num) -> Real, \226\136\128 z : (Num) -> Real, euclid_euclid(n, x) && euclid_euclid(n, y) && euclid_euclid(n, z) \226\134\146 euclid_d_euclid(z + x, z + y) == euclid_d_euclid(x, y)
      #|  (a : Real) * (a * (b : Real)) == b * (a * a)
      #|  \226\136\128 t : Real, \226\136\128 t' : Real, \226\136\128 x : (Num) -> Real, euclid_euclidean(x) \226\134\146 euclid_d_euclid(euclid_euclid_scale(t, x), euclid_euclid_scale(t', x)) == abs(t - t') * euclid_norm(x)
      #|  TAGB
      #|  (t : Real) * (t * (b : Real)) == t * t * b
      #|  \226\136\128 n : Num, \226\136\128 t : Real, \226\136\128 x : (Num) -> Real, \226\136\128 x' : (Num) -> Real, euclid_euclid(n, x) && euclid_euclid(n, x') \226\134\146 euclid_d_euclid(euclid_euclid_scale(t, x), euclid_euclid_scale(t, x')) == abs(t) * euclid_d_euclid(x, x')
      #|  (topology_ : (((A) -> Bool) -> Bool) -> Bool)((U : ((A) -> Bool) -> Bool)) == (\226\136\128 A : (A) -> Bool, \226\136\128 B : (A) -> Bool, \226\136\128 V : ((A) -> Bool) -> Bool, U({}) && (U(A) && U(B) \226\134\146 U(INTER(A, B))) && (SUBSET(V, U) \226\134\146 U(UNIONS(V))))
      #|  (open_ : (((A) -> Bool) -> Bool, (A) -> Bool) -> Bool)((U : ((A) -> Bool) -> Bool), (A : (A) -> Bool)) == U(A)
      #|  (closed_ : (((A) -> Bool) -> Bool, (A) -> Bool) -> Bool)((U : ((A) -> Bool) -> Bool), (B : (A) -> Bool)) == (SUBSET(B, UNIONS(U)) && euclid_open_(U, DIFF(UNIONS(U), B)))
      #|  (closure : (((A) -> Bool) -> Bool, (A) -> Bool, A) -> Bool)((U : ((A) -> Bool) -> Bool), (A : (A) -> Bool)) == INTERS({(B : (A) -> Bool) | euclid_closed_(U, B) && SUBSET(A, B)})
      #|  (induced_top : (((A) -> Bool) -> Bool, (A) -> Bool, (A) -> Bool) -> Bool)((U : ((A) -> Bool) -> Bool), (A : (A) -> Bool)) == IMAGE((B : (A) -> Bool) => INTER(B, A), U)
      #|  (open_ball : (((A) -> Bool, (A, A) -> Real), A, Real, A) -> Bool)(((X : (A) -> Bool), (d : (A, A) -> Real)), (x : A), (r : Real)) == {(y : A) | X(x) && X(y) && d(x, y) < r}
      #|  (closed_ball : (((A) -> Bool, (A, A) -> Real), A, Real, A) -> Bool)(((X : (A) -> Bool), (d : (A, A) -> Real)), (x : A), (r : Real)) == {(y : A) | X(x) && X(y) && d(x, y) <= r}
      #|  (open_balls : (((A) -> Bool, (A, A) -> Real), (A) -> Bool) -> Bool)(((X : (A) -> Bool), (d : (A, A) -> Real))) == {(B : (A) -> Bool) | \226\136\131 x : A, \226\136\131 r : Real, B == euclid_open_ball((X, d), x, r)}
      #|  (top_of_metric : (((A) -> Bool, (A, A) -> Real), (A) -> Bool) -> Bool)(((X : (A) -> Bool), (d : (A, A) -> Real))) == {(A : (A) -> Bool) | \226\136\131 F : ((A) -> Bool) -> Bool, SUBSET(F, euclid_open_balls((X, d))) && A == UNIONS(F)}
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, euclid_topology_(U) \226\134\146 euclid_open_(U, {})
      #|  SUBSET((A : (A) -> Bool), UNIONS((U : ((A) -> Bool) -> Bool)))
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 A : (A) -> Bool, euclid_topology_(U) && euclid_open_(U, A) \226\134\146 euclid_closed_(U, DIFF(UNIONS(U), A))
      #|  (a : (_) -> Bool) == UNIONS((U : ((_) -> Bool) -> Bool))
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, euclid_topology_(U) \226\134\146 euclid_closed_(U, UNIONS(U))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, euclid_topology_(U) \226\134\146 U(UNIONS(U))
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, euclid_topology_(U) \226\134\146 euclid_closed_(U, {})
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 A : (A) -> Bool, euclid_closed_(U, A) \226\134\146 euclid_open_(U, DIFF(UNIONS(U), A))
      #|  (euclid_open_ : (((_) -> Bool) -> Bool, (_) -> Bool) -> Bool)
      #|  DIFF(UNIONS((U : ((A) -> Bool) -> Bool)), INTERS((V : ((A) -> Bool) -> Bool))) == UNIONS((VCOMP : ((A) -> Bool) -> Bool))
      #|  euclid_open_((U : ((A) -> Bool) -> Bool), UNIONS((VCOMP : ((A) -> Bool) -> Bool)))
      #|  SUBSET((VCOMP : ((A) -> Bool) -> Bool), (U : ((A) -> Bool) -> Bool))
      #|  (VCOMP : _)
      #|  (VCOMP : ((A) -> Bool) -> Bool) == IMAGE(DIFF(UNIONS((U : ((A) -> Bool) -> Bool))), (V : ((A) -> Bool) -> Bool))
      #|  (u : (A) -> Bool)
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 V : ((A) -> Bool) -> Bool, euclid_topology_(U) && (\226\136\128 a : (A) -> Bool, V(a) \226\134\146 euclid_closed_(U, a)) && !(V == {}) \226\134\146 euclid_closed_(U, INTERS(V))
      #|  (W : (_) -> Bool) == IMAGE((B : (_) -> _), (A : (_) -> Bool))
      #|  SUBSET(IMAGE((B : (_) -> _), (A : (_) -> Bool)), (U : (_) -> Bool))
      #|  (B : (_) -> _)((x : _))
      #|  (x : A)
      #|  UNIONS(IMAGE((B : (_, _) -> Bool), (A : (_) -> Bool))) == A
      #|  (A : (A) -> Bool)
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 A : (A) -> Bool, euclid_topology_(U) \226\134\146 U(A) == (\226\136\128 x : A, \226\136\131 B : (A) -> Bool, A(x) \226\134\146 SUBSET(B, A) && B(x) && U(B))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  (U : _)
      #|  (u : _)
      #|  INTERS(DELETE((V : ((_) -> Bool) -> Bool), (u : (_) -> Bool)))
      #|  SUBSET(DELETE((V : (_) -> Bool), (u : _)), (U : (_) -> Bool))
      #|  (V : (_) -> Bool) == {(u : _)}
      #|  DELETE((V : (_) -> Bool), (u : _))
      #|  (u : _)
      #|  (U : _)
      #|  (U : _)
      #|  (V : _)
      #|  \226\136\131 n : Num, HAS_SIZE((V : (_) -> Bool), n)
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 V : ((A) -> Bool) -> Bool, euclid_topology_(U) && SUBSET(V, U) && FINITE(V) && !(V == {}) \226\134\146 U(INTERS(V))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 V : ((A) -> Bool) -> Bool, euclid_topology_(U) && SUBSET(V, U) \226\134\146 U(UNIONS(V))
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 A : (A) -> Bool, \226\136\128 B : (A) -> Bool, euclid_topology_(U) && U(A) && U(B) \226\134\146 U(INTER(A, B))
      #|  (a : A)
      #|  (a : A)
      #|  (a : A)
      #|  op_slash_bslash
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 a : A, \226\136\128 r : Real, euclid_metric_space((X, d)) && real_of_num(0) < r && X(a) \226\134\146 IN(a, euclid_open_ball((X, d), a, r))
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 a : A, \226\136\128 r : Real, SUBSET(euclid_open_ball((X, d), a, r), X)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 Y : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 a : A, \226\136\128 r : Real, SUBSET(Y, X) \226\134\146 SUBSET(euclid_open_ball((Y, d), a, r), euclid_open_ball((X, d), a, r))
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 a : A, \226\136\128 r : Real, !IN(a, X) \226\134\146 {} == euclid_open_ball((X, d), a, r)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 Y : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 a : A, \226\136\128 r : Real, SUBSET(Y, X) && IN(a, Y) \226\134\146 euclid_open_ball((Y, d), a, r) == INTER(euclid_open_ball((X, d), a, r), Y)
      #|  (forall : ((_) -> Bool) -> Bool)
      #|  ((u : Real) < (v : Real) - (w : Real)) == (w + u < v)
      #|  (real_of_num(0) < (r : Real) - (s : Real)) == (s < r)
      #|  (IN : (_, (_) -> Bool) -> Bool)
      #|  (r : Real) - (d : (A, A) -> Real)((a : A), (b : A))
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 a : A, \226\136\128 b : A, \226\136\128 r : Real, euclid_metric_space((X, d)) && IN(a, euclid_open_ball((X, d), b, r)) \226\134\146 (\226\136\131 r' : Real, real_of_num(0) < r' && SUBSET(euclid_open_ball((X, d), a, r'), euclid_open_ball((X, d), b, r)))
      #|  (x : A)
      #|  (a : A)
      #|  (b : A)
      #|  real_add
      #|  IN((a : A), {(y : A) | (X : (A) -> Bool)(a) && X(y) && (d : (A, A) -> Real)(a, y) < (r : Real)})
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 a : A, \226\136\128 r : Real, euclid_metric_space((X, d)) \226\134\146 IN(a, euclid_open_ball((X, d), a, r)) == !(euclid_open_ball((X, d), a, r) == {})
      #|  (a : A)
      #|  (x : A)
      #|  (a : A)
      #|  (a : A)
      #|  (x : A)
      #|  (a : A)
      #|  (a : A)
      #|  (a : A)
      #|  (a : A)
      #|  \226\136\128 d : Real, \226\136\128 r : Real, !(d < r && r < real_of_num(0) && real_of_num(0) <= d)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 a : A, \226\136\128 r : Real, euclid_metric_space((X, d)) && r < real_of_num(0) \226\134\146 {} == euclid_open_ball((X, d), a, r)
      #|  (a : A)
      #|  (x : A)
      #|  (a : A)
      #|  (r : Real) < (r' : Real) && (a : Real) < r \226\134\146 a < r'
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 a : A, \226\136\128 r : Real, \226\136\128 r' : Real, r < r' \226\134\146 SUBSET(euclid_open_ball((X, d), a, r), euclid_open_ball((X, d), a, r'))
      #|  !((r'' : Real) < (r''' : Real)) \226\134\146 r''' < r'' || r''' == r''
      #|  if (r'' : Real) < (r''' : Real) { r'' } else { r''' }
      #|  (r : Real)
      #|  (a : A)
      #|  (c : A)
      #|  (d : (A, A) -> Real)
      #|  (X : (A) -> Bool)
      #|  (r' : Real)
      #|  (b : A)
      #|  (c : A)
      #|  (d : (A, A) -> Real)
      #|  (X : (A) -> Bool)
      #|  (X : (A) -> Bool)((c : A))
      #|  (INTER : ((_) -> Bool, (_) -> Bool, _) -> Bool)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 a : A, \226\136\128 b : A, \226\136\128 c : A, \226\136\128 r : Real, \226\136\128 r' : Real, euclid_metric_space((X, d)) && X(a) && X(b) && IN(c, INTER(euclid_open_ball((X, d), a, r), euclid_open_ball((X, d), b, r'))) \226\134\146 (\226\136\131 r'' : Real, real_of_num(0) < r'' && SUBSET(euclid_open_ball((X, d), c, r''), INTER(euclid_open_ball((X, d), a, r), euclid_open_ball((X, d), b, r'))))
      #|  (y : A)
      #|  (z : A)
      #|  (x : A)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 x : A, \226\136\128 y : A, \226\136\128 z : A, \226\136\128 r : Real, euclid_metric_space((X, d)) && euclid_open_ball((X, d), z, r, x) && euclid_open_ball((X, d), z, r, y) \226\134\146 d(x, y) < real_of_num(2) * r
      #|  (y : A)
      #|  (z : A)
      #|  (x : A)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 x : A, \226\136\128 y : A, \226\136\128 z : A, \226\136\128 r : Real, euclid_metric_space((X, d)) && euclid_closed_ball((X, d), z, r, x) && euclid_closed_ball((X, d), z, r, y) \226\134\146 d(x, y) <= real_of_num(2) * r
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 x : A, \226\136\128 r : Real, SUBSET(euclid_open_ball((X, d), x, r), euclid_closed_ball((X, d), x, r))
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 x : A, \226\136\128 y : A, \226\136\128 r : Real, euclid_metric_space((X, d)) && X(x) && X(y) \226\134\146 euclid_open_ball((X, d), x, r, y) == euclid_open_ball((X, d), y, r, x)
      #|  euclid_open_ball(((X : (_) -> Bool), (d : (_, _) -> Real)), (z : _), (r : Real), (x : _))
      #|  (X : (_) -> Bool)((z : _)) && X((x' : _)) && X((x : _))
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 x : A, \226\136\128 z : A, \226\136\128 r : Real, euclid_metric_space((X, d)) && euclid_open_ball((X, d), x, r, z) \226\134\146 SUBSET(euclid_open_ball((X, d), z, r), euclid_open_ball((X, d), x, real_of_num(2) * r))
      #|  IN((B : (A) -> Bool), euclid_open_balls(((X : (A) -> Bool), (d : (A, A) -> Real))))
      #|  (B : (A) -> Bool)
      #|  real_of_num(0) < real_of_num(1)
      #|  (euclid_metric_space : (((_) -> Bool, (_, _) -> Real)) -> Bool)
      #|  (IN : (_, (_) -> Bool) -> Bool)
      #|  {euclid_open_ball(((X : (A) -> Bool), (d : (A, A) -> Real)), (x : A), real_of_num(1))}
      #|  IN((x : A), (X : (A) -> Bool))
      #|  euclid_open_ball(((X : (A) -> Bool), (d : (A, A) -> Real)), (x : A), real_of_num(1))
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, euclid_metric_space((X, d)) \226\134\146 X == UNIONS(euclid_top_of_metric((X, d)))
      #|  (x : A)
      #|  (x : A)
      #|  (x : A)
      #|  ({} : ((A) -> Bool) -> Bool)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, euclid_top_of_metric((X, d), {})
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 F : ((A) -> Bool) -> Bool, SUBSET(F, euclid_open_balls((X, d))) \226\134\146 IN(UNIONS(F), euclid_top_of_metric((X, d)))
      #|  {(x : (A) -> Bool)}
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, SUBSET(euclid_open_balls((X, d)), euclid_top_of_metric((X, d)))
      #|  (d : _)
      #|  (X : _)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 x : A, \226\136\128 r : Real, euclid_metric_space((X, d)) \226\134\146 euclid_top_of_metric((X, d), euclid_open_ball((X, d), x, r))
      #|  (forall : ((_) -> Bool) -> Bool)
      #|  (op_q : ((_) -> Bool) -> Bool)
      #|  (a : A)
      #|  euclid_open_ball(((X : (A) -> Bool), (d : (A, A) -> Real)), (a : A), (r : (A) -> Real)(a))
      #|  (a : A)
      #|  IMAGE((b : A) => euclid_open_ball(((X : (A) -> Bool), (d : (A, A) -> Real)), b, (r : (A) -> Real)(b)), (A : (A) -> Bool))
      #|  \226\136\128 s : (A) -> Bool, IN(s, (F' : ((A) -> Bool) -> Bool)) \226\134\146 SUBSET(s, UNIONS(F'))
      #|  (r' : Real)
      #|  IN((a : A), euclid_open_ball(((X : (A) -> Bool), (d : (A, A) -> Real)), (x : A), (r : Real)))
      #|  (r : Real)
      #|  (x : A)
      #|  (a : A)
      #|  (d : (A, A) -> Real)
      #|  (X : (A) -> Bool)
      #|  IN((t : (A) -> Bool), euclid_open_balls(((X : (A) -> Bool), (d : (A, A) -> Real))))
      #|  (IN : (_, (_) -> Bool) -> Bool)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 A : (A) -> Bool, euclid_metric_space((X, d)) \226\134\146 euclid_top_of_metric((X, d), A) == (SUBSET(A, X) && (\226\136\128 a : A, IN(a, A) \226\134\146 (\226\136\131 r : Real, real_of_num(0) < r && SUBSET(euclid_open_ball((X, d), a, r), A))))
      #|  (x : A)
      #|  !((r : Real) < (r' : Real)) \226\134\146 r' < r || r' == r
      #|  if (r : Real) < (r' : Real) { r } else { r' }
      #|  (IN : (_, (_) -> Bool) -> Bool)
      #|  (IN : (_, (_) -> Bool) -> Bool)
      #|  (INTER : ((_) -> Bool, (_) -> Bool, _) -> Bool)
      #|  euclid_top_of_metric(((X : (A) -> Bool), (d : (A, A) -> Real)), (A : (A) -> Bool))
      #|  euclid_top_of_metric(((X : (A) -> Bool), (d : (A, A) -> Real)), (B : (A) -> Bool))
      #|  (d : (A, A) -> Real)
      #|  (X : (A) -> Bool)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, euclid_metric_space((X, d)) \226\134\146 (\226\136\128 A : (A) -> Bool, \226\136\128 B : (A) -> Bool, euclid_top_of_metric((X, d), A) && euclid_top_of_metric((X, d), B) \226\134\146 euclid_top_of_metric((X, d), INTER(A, B)))
      #|  (r : Real)
      #|  (forall : ((_) -> Bool) -> Bool)
      #|  (d : (A, A) -> Real)
      #|  (X : (A) -> Bool)
      #|  euclid_top_of_metric(((X : (A) -> Bool), (d : (A, A) -> Real)), (t : (A) -> Bool))
      #|  (d : (A, A) -> Real)
      #|  (X : (A) -> Bool)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, euclid_metric_space((X, d)) \226\134\146 (\226\136\128 V : ((A) -> Bool) -> Bool, SUBSET(V, euclid_top_of_metric((X, d))) \226\134\146 euclid_top_of_metric((X, d), UNIONS(V)))
      #|  (a : A)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, euclid_metric_space((X, d)) \226\134\146 euclid_topology_(euclid_top_of_metric((X, d)))
      #|  euclid_closed_ball(((X : (_) -> Bool), (d : (_, _) -> Real)), (x : _), (r : Real)) == {}
      #|  !(real_of_num(0) < (d : (_, _) -> Real)((x : _), (x' : _)) - (r : Real)) \226\134\146 d(x, x') <= r
      #|  (d : _)
      #|  (X : _)
      #|  (d : (_, _) -> _)((x' : _), (y : _)) == d(y, x')
      #|  (x' : _)
      #|  (y : _)
      #|  (x : _)
      #|  (y : A)
      #|  (X : (_) -> _)((x' : _))
      #|  (R : Real) == (d : (_, _) -> Real)((x : _), (x' : _)) - (r : Real)
      #|  euclid_open_ball(((X : (_) -> Bool), (d : (_, _) -> Real)), (x' : _), d((x : _), x') - (r : Real))
      #|  (X : (_) -> _)((x : _))
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 x : A, \226\136\128 r : Real, euclid_metric_space((X, d)) \226\134\146 euclid_closed_(euclid_top_of_metric((X, d)), euclid_closed_ball((X, d), x, r))
      #|  (r' : _)
      #|  (r : _)
      #|  (x' : _)
      #|  (x : _)
      #|  (d : _)
      #|  (X : _)
      #|  (u : _)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 C : (A) -> Bool, \226\136\128 x : A, \226\136\131 e : Real, euclid_metric_space((X, d)) && C(x) && euclid_top_of_metric((X, d), C) \226\134\146 real_of_num(0) < e && SUBSET(euclid_open_ball((X, d), x, e), C)
      #|  TAGB
      #|  UNIONS((U : ((_) -> Bool) -> Bool))
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 A : (A) -> Bool, euclid_topology_(U) && SUBSET(A, UNIONS(U)) \226\134\146 euclid_closed_(U, euclid_closure(U, A))
      #|  (a : A)
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 A : (A) -> Bool, euclid_topology_(U) \226\134\146 SUBSET(A, euclid_closure(U, A))
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 A : (A) -> Bool, \226\136\128 B : (A) -> Bool, euclid_topology_(U) && euclid_closed_(U, B) && SUBSET(A, B) \226\134\146 SUBSET(euclid_closure(U, A), B)
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 A : (A) -> Bool, euclid_topology_(U) && euclid_closed_(U, A) \226\134\146 euclid_closure(U, A) == A
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 Z : (A) -> Bool, \226\136\128 A : (A) -> Bool, euclid_topology_(U) && SUBSET(Z, UNIONS(U)) \226\134\146 (A == euclid_closure(U, Z)) == (SUBSET(Z, A) && euclid_closed_(U, A) && (\226\136\128 B : (A) -> Bool, euclid_closed_(U, B) && SUBSET(Z, B) \226\134\146 SUBSET(A, B)))
      #|  SUBSET((A : (_) -> Bool), INTER(UNIONS((U : ((_) -> Bool) -> Bool)), A))
      #|  DIFF(UNIONS((U : ((A) -> Bool) -> Bool)), (B : (A) -> Bool))
      #|  DIFF(UNIONS((U : ((A) -> Bool) -> Bool)), (B : (A) -> Bool))
      #|  ((A : Bool) \226\134\146 (B : Bool) == (C : Bool)) \226\134\146 (A && B) == (A && C)
      #|  ((A : Bool) \226\134\146 (B : Bool) == (C : Bool)) \226\134\146 (A && B) == (A && C)
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 Z : (A) -> Bool, \226\136\128 A : (A) -> Bool, euclid_topology_(U) && SUBSET(Z, UNIONS(U)) \226\134\146 (A == euclid_closure(U, Z)) == (SUBSET(Z, A) && euclid_closed_(U, A) && (\226\136\128 B : (A) -> Bool, euclid_open_(U, B) && INTER(B, Z) == {} \226\134\146 INTER(B, A) == {}))
      #|  UNIONS((Z : ((A) -> Bool) -> Bool))
      #|  INTER((x : (A) -> Bool), (x' : (A) -> Bool))
      #|  (op_q : ((_) -> Bool) -> Bool)
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 f : ((A) -> Bool, B) -> Bool, euclid_topology_(U) && {} == f({}) && (\226\136\128 a : (A) -> Bool, \226\136\128 b : (A) -> Bool, IN(a, U) && IN(b, U) \226\134\146 INTER(f(a), f(b)) == f(INTER(a, b))) && (\226\136\128 V : ((A) -> Bool) -> Bool, SUBSET(V, U) \226\134\146 UNIONS(IMAGE(f, V)) == f(UNIONS(V))) \226\134\146 euclid_topology_(IMAGE(f, U))
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 C : (A) -> Bool, UNIONS(euclid_induced_top(U, C)) == INTER(UNIONS(U), C)
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 C : (A) -> Bool, euclid_topology_(U) \226\134\146 euclid_topology_(euclid_induced_top(U, C))
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 C : (A) -> Bool, \226\136\128 A : (A) -> Bool, euclid_topology_(U) \226\134\146 euclid_induced_top(U, C, A) == (\226\136\131 B : (A) -> Bool, U(B) && INTER(B, C) == A)
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 A : (A) -> Bool, \226\136\128 B : (A) -> Bool, euclid_topology_(U) && U(A) && euclid_induced_top(U, A, B) \226\134\146 U(B)
      #|  SUBSET((x : (_) -> Bool), UNIONS((U : ((_) -> Bool) -> Bool)))
      #|  (x : _)
      #|  SUBSET((B : (_) -> Bool), UNIONS((U : ((_) -> Bool) -> Bool)))
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, euclid_topology_(U) \226\134\146 euclid_induced_top(U, UNIONS(U)) == U
      #|  (gen : (((A) -> Bool) -> Bool, (A) -> Bool) -> Bool)((X : ((A) -> Bool) -> Bool)) == {(A : (A) -> Bool) | \226\136\131 Y : ((A) -> Bool) -> Bool, SUBSET(Y, X) && A == UNIONS(Y)}
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, euclid_gen(euclid_open_balls((X, d))) == euclid_top_of_metric((X, d))
      #|  (A : (A) -> Bool)
      #|  UNIONS(IMAGE((Y' : ((A) -> Bool, (A) -> Bool) -> Bool), (Y : ((A) -> Bool) -> Bool)))
      #|  (op_q : ((_) -> Bool) -> Bool)
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 V : ((A) -> Bool) -> Bool, SUBSET(U, V) && (\226\136\128 A : (A) -> Bool, IN(A, V) \226\134\146 (\226\136\131 Y : ((A) -> Bool) -> Bool, SUBSET(Y, U) && A == UNIONS(Y))) \226\134\146 euclid_gen(U) == euclid_gen(V)
      #|  (SUBSET : ((_) -> Bool, (_) -> Bool) -> Bool)
      #|  (UNIONS : (((_) -> Bool) -> Bool, _) -> Bool)
      #|  UNIONS((Z : ((A) -> Bool) -> Bool))
      #|  IMAGE(INTER((Y : (A) -> Bool)), (F' : ((A) -> Bool) -> Bool))
      #|  (INTER : ((_) -> Bool, (_) -> Bool, _) -> Bool)
      #|  (op_q : ((_) -> Bool) -> Bool)
      #|  (C : (A) -> Bool)
      #|  (B : (A) -> Bool)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 Y : (A) -> Bool, \226\136\128 d : (A, A) -> Real, SUBSET(Y, X) && euclid_metric_space((X, d)) \226\134\146 euclid_induced_top(euclid_top_of_metric((X, d)), Y) == euclid_gen(euclid_induced_top(euclid_open_balls((X, d)), Y))
      #|  (x'' : A)
      #|  euclid_open_ball(((Y : (A) -> Bool), (d : (A, A) -> Real)), (x'' : A), (s : (A) -> Real)(x''))
      #|  IMAGE((t : A) => euclid_open_ball(((Y : (A) -> Bool), (d : (A, A) -> Real)), t, (s : (A) -> Real)(t)), INTER((x : (A) -> Bool), Y))
      #|  (r' : Real)
      #|  IN((a : A), euclid_open_ball(((X : (A) -> Bool), (d : (A, A) -> Real)), (x' : A), (r : Real)))
      #|  (r : _)
      #|  (x' : _)
      #|  (a : _)
      #|  (d : _)
      #|  (X : _)
      #|  \226\136\128 a : A, IN(a, INTER((x : (A) -> Bool), (Y : (A) -> Bool))) \226\134\146 (\226\136\131 s : Real, real_of_num(0) < s && SUBSET(euclid_open_ball((Y, (d : (A, A) -> Real)), a, s), INTER(x, Y)))
      #|  -real_of_num(1) < real_of_num(0)
      #|  euclid_open_ball(((X : (A) -> Bool), (d : (A, A) -> Real)), (x : A), -real_of_num(1))
      #|  euclid_open_ball(((X : (A) -> Bool), (d : (A, A) -> Real)), (x : A), (r : Real))
      #|  (Y : (A) -> Bool)((x : A))
      #|  (A : (A) -> Bool)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 Y : (A) -> Bool, \226\136\128 d : (A, A) -> Real, SUBSET(Y, X) && euclid_metric_space((X, d)) \226\134\146 euclid_gen(euclid_open_balls((Y, d))) == euclid_gen(euclid_induced_top(euclid_open_balls((X, d)), Y))
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 Y : (A) -> Bool, \226\136\128 d : (A, A) -> Real, SUBSET(Y, X) && euclid_metric_space((X, d)) \226\134\146 euclid_induced_top(euclid_top_of_metric((X, d)), Y) == euclid_top_of_metric((Y, d))
      #|  (continuous : ((A) -> B, ((A) -> Bool) -> Bool, ((B) -> Bool) -> Bool) -> Bool)((f : (A) -> B), (U : ((A) -> Bool) -> Bool), (V : ((B) -> Bool) -> Bool)) == (\226\136\128 v : (B) -> Bool, IN(v, V) \226\134\146 IN(preimage(UNIONS(U), f, v), U))
      #|  (metric_continuous_pt : ((A) -> B, ((A) -> Bool, (A, A) -> Real), ((B) -> Bool, (B, B) -> Real), A) -> Bool)((f : (A) -> B), ((X : (A) -> Bool), (dX : (A, A) -> Real)), ((Y : (B) -> Bool), (dY : (B, B) -> Real)), (x : A)) == (\226\136\128 epsilon : Real, \226\136\131 delta : Real, real_of_num(0) < epsilon \226\134\146 real_of_num(0) < delta && (\226\136\128 y : A, IN(x, X) && IN(y, X) && dX(x, y) < delta \226\134\146 dY(f(x), f(y)) < epsilon))
      #|  (metric_continuous : ((A) -> B, ((A) -> Bool, (A, A) -> Real), ((B) -> Bool, (B, B) -> Real)) -> Bool)((f : (A) -> B), ((X : (A) -> Bool), (dX : (A, A) -> Real)), ((Y : (B) -> Bool), (dY : (B, B) -> Real))) == (\226\136\128 x : A, euclid_metric_continuous_pt(f, (X, dX), (Y, dY), x))
      #|  \226\136\128 f : (A) -> B, \226\136\128 X : (A) -> Bool, \226\136\128 dX : (A, A) -> Real, \226\136\128 Y : (B) -> Bool, \226\136\128 dY : (B, B) -> Real, \226\136\128 x : A, !IN(x, X) \226\134\146 euclid_metric_continuous_pt(f, (X, dX), (Y, dY), x)
      #|  (IMAGE : ((_) -> _, (_) -> Bool, _) -> Bool)
      #|  \226\136\128 x : A, (X : (A) -> Bool)(x) \226\134\146 (Y : (B) -> Bool)((f : (A) -> B)(x))
      #|  (euclid_open_ball : (((_) -> Bool, (_, _) -> Real), _, Real, _) -> Bool)
      #|  (y : A)
      #|  (delta : Real)
      #|  IN((v : (_) -> Bool), euclid_top_of_metric(((Y : (_) -> Bool), (dY : (_, _) -> Real))))
      #|  \226\136\131 eps : Real, real_of_num(0) < eps && SUBSET(euclid_open_ball(((Y : (B) -> Bool), (dY : (B, B) -> Real)), (f : (A) -> B)((a : A)), eps), (v : (B) -> Bool))
      #|  (preimage : ((_) -> Bool, (_) -> _, (_) -> Bool, _) -> Bool)
      #|  euclid_open_ball(((X : (A) -> Bool), (dX : (A, A) -> Real)), (x : A), (r : Real))
      #|  \226\136\128 x : A, \226\136\128 B : (A) -> Bool, (\226\136\131 A : (A) -> Bool, IN(x, A) && SUBSET(A, B)) \226\134\146 IN(x, B)
      #|  IN((y : A), (B : (A) -> Bool))
      #|  (r : Real)
      #|  \226\136\131 r : Real, real_of_num(0) < r && SUBSET(euclid_open_ball(((X : (A) -> Bool), (dX : (A, A) -> Real)), (x : A), r), (B : (A) -> Bool))
      #|  (B : (A) -> Bool) == preimage(UNIONS(euclid_top_of_metric(((X : (A) -> Bool), (dX : (A, A) -> Real)))), (f : (A) -> B), euclid_open_ball(((Y : (B) -> Bool), (dY : (B, B) -> Real)), f((x : A)), (epsilon : Real)))
      #|  IN((x : A), (X : (A) -> Bool))
      #|  (IMAGE : ((_) -> _, (_) -> Bool, _) -> Bool)
      #|  (Y : (B) -> Bool)((f : (A) -> B)((x : A)))
      #|  IN((x : A), preimage(UNIONS(euclid_top_of_metric(((X : (A) -> Bool), (dX : (A, A) -> Real)))), (f : (A) -> B), euclid_open_ball(((Y : (B) -> Bool), (dY : (B, B) -> Real)), f(x), (epsilon : Real))))
      #|  euclid_open_balls(((Y : (B) -> Bool), (dY : (B, B) -> Real)))
      #|  \226\136\128 x : A, \226\136\128 B : (A) -> Bool, (\226\136\131 A : (A) -> Bool, IN(x, A) && SUBSET(A, B)) \226\134\146 IN(x, B)
      #|  IN(euclid_open_ball(((Y : (B) -> Bool), (dY : (B, B) -> Real)), (f : (A) -> B)((x : A)), (epsilon : Real)), euclid_top_of_metric((Y, dY)))
      #|  IN((x : A), (X : (A) -> Bool))
      #|  \226\136\128 f : (A) -> B, \226\136\128 X : (A) -> Bool, \226\136\128 Y : (B) -> Bool, \226\136\128 dX : (A, A) -> Real, \226\136\128 dY : (B, B) -> Real, SUBSET(IMAGE(f, X), Y) && euclid_metric_space((X, dX)) && euclid_metric_space((Y, dY)) \226\134\146 euclid_continuous(f, euclid_top_of_metric((X, dX)), euclid_top_of_metric((Y, dY))) == euclid_metric_continuous(f, (X, dX), (Y, dY))
      #|  (a : A)
      #|  (a : A)
      #|  (a : A)
      #|  (a : A)
      #|  (a : A)
      #|  (a : A)
      #|  (eps : Real)
      #|  (y : A)
      #|  (y : A)
      #|  (y : A)
      #|  (y : A)
      #|  (y : A)
      #|  (f : (A) -> B)((y : A))
      #|  \226\136\128 f : (A) -> B, \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 V : ((B) -> Bool) -> Bool, \226\136\128 A : (B) -> Bool, euclid_topology_(V) && euclid_continuous(f, U, V) && V(A) \226\134\146 euclid_continuous(f, U, euclid_induced_top(V, A))
      #|  (x' : _)
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 X : (B) -> Bool, \226\136\128 d : (B, B) -> Real, \226\136\128 f : (A) -> B, euclid_metric_space((X, d)) && euclid_topology_(U) \226\134\146 euclid_continuous(f, U, euclid_top_of_metric((X, d))) == (\226\136\128 x : B, \226\136\128 r : Real, U(preimage(UNIONS(U), f, euclid_open_ball((X, d), x, r))))
      #|  (n : Num)
      #|  (b : Real) + (C : Real) < (d : Real) \226\134\146 (a : Real) <= b + C \226\134\146 a < d
      #|  euclid_d_euclid
      #|  euclid_euclid((n : Num))
      #|  euclid_d_euclid((f : (_, Num) -> Real)((t : _)) + (g : (_, Num) -> Real)(t), f((x' : _)) + g(x')) <= euclid_d_euclid(f(t) + g(t), f(x') + g(t)) + euclid_d_euclid(f(x') + g(t), f(x') + g(x'))
      #|  \226\136\128 D : (A) -> Bool, \226\136\128 B : (A) -> Bool, \226\136\128 C : (A) -> Bool, SUBSET(B, D) \226\134\146 SUBSET(D, C) \226\134\146 SUBSET(B, C)
      #|  UNIONS((U : ((_) -> Bool) -> Bool))
      #|  (t : _) => (f : (_, Num) -> Real)(t) + (g : (_, Num) -> Real)(t)
      #|  (B : _)
      #|  (B : (_) -> Bool) == INTER(preimage(UNIONS((U : ((_) -> Bool) -> Bool)), (f : (_, Num) -> Real), euclid_open_ball((euclid_euclid((n : Num)), euclid_d_euclid), f((t : _)), (r' : Real) / real_of_num(2))), preimage(UNIONS(U), (g : (_, Num) -> Real), euclid_open_ball((euclid_euclid(n), euclid_d_euclid), g(t), r' / real_of_num(2))))
      #|  euclid_open_ball((euclid_euclid((n : Num)), euclid_d_euclid), (g : (_, Num) -> Real)((t : _)), (r' : Real) / real_of_num(2))
      #|  euclid_open_ball((euclid_euclid((n : Num)), euclid_d_euclid), (f : (_, Num) -> Real)((t : _)), (r' : Real) / real_of_num(2))
      #|  (n : _)
      #|  (t : A)
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 f : (A, Num) -> Real, \226\136\128 g : (A, Num) -> Real, \226\136\128 n : Num, euclid_topology_(U) && euclid_continuous(f, U, euclid_top_of_metric((euclid_euclid(n), euclid_d_euclid))) && euclid_continuous(g, U, euclid_top_of_metric((euclid_euclid(n), euclid_d_euclid))) && SUBSET(IMAGE(f, UNIONS(U)), euclid_euclid(n)) && SUBSET(IMAGE(g, UNIONS(U)), euclid_euclid(n)) \226\134\146 euclid_continuous((t : A) => f(t) + g(t), U, euclid_top_of_metric((euclid_euclid(n), euclid_d_euclid)))
      #|  TAGB
      #|  (sequence : ((A) -> Bool, (Num) -> A) -> Bool)((X : (A) -> Bool), (f : (Num) -> A)) == SUBSET(IMAGE(f, UNIV), X)
      #|  (converge : (((A) -> Bool, (A, A) -> Real), (Num) -> A) -> Bool)(((X : (A) -> Bool), (d : (A, A) -> Real)), (f : (Num) -> A)) == (\226\136\131 x : A, IN(x, X) && (\226\136\128 eps : Real, \226\136\131 n : Num, real_of_num(0) < eps \226\134\146 (\226\136\128 i : Num, n <= i \226\134\146 d(x, f(i)) < eps)))
      #|  (cauchy_seq : (((A) -> Bool, (A, A) -> Real), (Num) -> A) -> Bool)(((X : (A) -> Bool), (d : (A, A) -> Real)), (f : (Num) -> A)) == (euclid_sequence(X, f) && (\226\136\128 eps : Real, \226\136\131 n : Num, \226\136\128 i : Num, \226\136\128 j : Num, real_of_num(0) < eps && n <= i && n <= j \226\134\146 d(f(i), f(j)) < eps))
      #|  (complete : (((A) -> Bool, (A, A) -> Real)) -> Bool)(((X : (A) -> Bool), (d : (A, A) -> Real))) == (\226\136\128 f : (Num) -> A, euclid_cauchy_seq((X, d), f) \226\134\146 euclid_converge((X, d), f))
      #|  (X : (A) -> Bool)((f : (Num) -> A)((i : Num))) && X((x : A)) && X(f((j : Num)))
      #|  (euclid_sequence : ((_) -> Bool, (Num) -> _) -> Bool)
      #|  (n : Num) <= (j : Num)
      #|  (n : Num) <= (i : Num)
      #|  real_of_num(0) < (eps : Real) / real_of_num(2)
      #|  (n : Num)
      #|  (IN : (_, (_) -> Bool) -> Bool)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 f : (Num) -> A, euclid_metric_space((X, d)) && euclid_sequence(X, f) && euclid_converge((X, d), f) \226\134\146 euclid_cauchy_seq((X, d), f)
      #|  (eps : Real) / real_of_num(2)
      #|  (eps : Real) / real_of_num(2)
      #|  (f : (Num) -> A)((j : Num))
      #|  (x : A)
      #|  (f : (Num) -> A)((i : Num))
      #|  (f : (Num) -> A)((j : Num))
      #|  (x : A)
      #|  (f : (Num) -> A)((i : Num))
      #|  (f : (Num) -> A)((j : Num))
      #|  (x : A)
      #|  (f : (Num) -> A)((i : Num))
      #|  (f : (Num) -> A)((j : Num))
      #|  (x : A)
      #|  (f : (Num) -> A)((i : Num))
      #|  (f : (Num) -> A)((j : Num))
      #|  (x : A)
      #|  (f : (Num) -> A)((i : Num))
      #|  (f : (Num) -> A)((j : Num))
      #|  (x : A)
      #|  (f : (Num) -> A)((i : Num))
      #|  (f : (Num) -> A)((j : Num))
      #|  (x : A)
      #|  (f : (Num) -> A)((i : Num))
      #|  (f : (Num) -> A)((j : Num))
      #|  (x : A)
      #|  (f : (Num) -> A)((i : Num))
      #|  euclid_euclid(1, (f : (Num, Num) -> Real)((m : Num))) && euclid_euclid(1, f((n' : Num)))
      #|  ((a : Num) >= (b : Num)) == (b <= a)
      #|  (n : Num)
      #|  \226\136\128 f : (Num, Num) -> Real, euclid_cauchy_seq((euclid_euclid(1), euclid_d_euclid), f) \226\134\146 cauchy((x : Num) => f(x, 0))
      #|  (e : Real)
      #|  (e : Real)
      #|  (e : Real)
      #|  ((n : Num) >= (N : Num)) == (N <= n)
      #|  (IN : (_, (_) -> Bool) -> Bool)
      #|  (euclid_cauchy_seq : (((_) -> Bool, (_, _) -> Real), (Num) -> _) -> Bool)
      #|  euclid_euclid(1, (f : (Num, Num) -> Real)((i : Num)))
      #|  (N : Num)
      #|  IN((c : (Num) -> Real), euclid_euclid(1))
      #|  (c : (Num) -> Real)
      #|  (c : (Num) -> Real) == ((j : Num) => if j == 0 { (z : Real) } else { real_of_num(0) })
      #|  (z : Real) == lim((x : Num) => (f : (Num, Num) -> Real)(x, 0))
      #|  euclid_complete((euclid_euclid(1), euclid_d_euclid))
      #|  (eps : Real)
      #|  (eps : Real)
      #|  (eps : Real)
      #|  (eps : Real)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 f : (Num) -> A, \226\136\128 i : Num, euclid_sequence(X, f) \226\134\146 X(f(i))
      #|  (n : Num)
      #|  (a : Real) <= (b : Real) \226\134\146 b < (eps : Real) \226\134\146 a < eps
      #|  euclid_d_euclid
      #|  (n' : Num)
      #|  euclid_sequence(euclid_euclid(1), o(euclid_proj((i : Num)), (f : (Num, Num) -> Real)))
      #|  \226\136\128 i : Num, \226\136\128 f : (Num, Num) -> Real, \226\136\128 n : Num, euclid_cauchy_seq((euclid_euclid(n), euclid_d_euclid), f) \226\134\146 euclid_cauchy_seq((euclid_euclid(1), euclid_d_euclid), o(euclid_proj(i), f))
      #|  (eps : Real)
      #|  (eps : Real)
      #|  (eps : Real)
      #|  (j : Num)
      #|  (i' : Num)
      #|  (j : Num)
      #|  (i' : Num)
      #|  (j : Num)
      #|  (i' : Num)
      #|  (j : Num)
      #|  (i' : Num)
      #|  0 == (n : Num) * 0
      #|  0 <= (a : Num) && 0 <= (b : Num) && 0 < 1 \226\134\146 a < 1 + (a + (a + b))
      #|  (1 + (n : Num)) * ((1 + n) * 1) == 1 + (n + (n + n * n))
      #|  real_of_num(0) < real_of_num(1) + real_of_num((n : Num))
      #|  pow((eps : Real), 2) == eps * (eps * real_of_num(1))
      #|  (b : Real) < (c : Real) \226\134\146 (a : Real) <= b \226\134\146 a < c
      #|  (a : Real) == (L : (Num, Num) -> Real)((r : Num), 0) - (f : (Num, Num) -> Real)((i : Num), r)
      #|  (b : Real) == (eps : Real) / (real_of_num(1) + real_of_num((n : Num)))
      #|  (r : Num)
      #|  (i : Num)
      #|  (r : Num)
      #|  abs((L : (Num, Num) -> Real)((r : Num), 0) - (f : (Num, Num) -> Real)((i : Num), r)) < (eps : Real) / (real_of_num(1) + real_of_num((n : Num)))
      #|  (n : Num) + 0 == n
      #|  (c : (Num) -> Num)((r : Num)) == (t : (Num) -> Num)(r)
      #|  sum((0, (n : Num)), (i' : Num) => ((L : (Num, Num) -> Real)(i', 0) - (f : (Num, Num) -> Real)((i : Num), i')) * (L(i', 0) - f(i, i'))) <= sum((0, n), (i' : Num) => (eps : Real) / (real_of_num(1) + real_of_num(n)) * (eps / (real_of_num(1) + real_of_num(n))))
      #|  (M : Num)
      #|  (m : Num) < (n : Num) \226\134\146 !(n <= m)
      #|  (n : Num)
      #|  \226\136\131 M : Num, \226\136\128 j : Num, (t : (Num) -> Num)(j) <= M
      #|  (t : (Num) -> Num) == ((u : Num) => if u < (n : Num) { (c : (Num) -> Num)(u) } else { 0 })
      #|  (i : Num)
      #|  (j : Num)
      #|  (n' : (Num) -> Num)
      #|  \226\136\128 j : Num, \226\136\131 c : Num, \226\136\128 i : Num, c <= i \226\134\146 abs((L : (Num, Num) -> Real)(j, 0) - (f : (Num, Num) -> Real)(i, j)) < (eps : Real) / (real_of_num(1) + real_of_num((n : Num)))
      #|  \226\136\128 i : Num, euclid_euclid((n : Num), (f : (Num, Num) -> Real)(i))
      #|  \226\136\128 i : Num, \226\136\128 j : Num, euclid_euclid(1, o(euclid_proj(i), (f : (Num, Num) -> Real), j))
      #|  real_of_num(0) < (eps : Real) / (real_of_num(1) + real_of_num((n : Num)))
      #|  (eps : Real) / (real_of_num(1) + real_of_num((n : Num)))
      #|  euclid_euclid((n : Num), (f : (Num, Num) -> Real)(n + (n' : Num)))
      #|  real_of_num(0) == (x : Real) \226\134\146 abs((u : Real) - x) == abs(u)
      #|  euclid_euclid(1, euclid_proj((m : Num), (f : (Num, Num) -> Real)((n : Num) + (n' : Num))))
      #|  (x : Real) == (y : Real) \226\134\146 !(x < y)
      #|  (n' : Num) <= (n : Num) + n'
      #|  (n : Num) + (n' : Num)
      #|  euclid_d_euclid
      #|  \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 real_of_num(0) < abs(x)
      #|  (j : Num) => (L : (Num, Num) -> Real)(j, 0)
      #|  (L : (Num, Num) -> Real)
      #|  \226\136\128 i : Num, euclid_converge((euclid_euclid(1), euclid_d_euclid), o(euclid_proj(i), (f : (Num, Num) -> Real)))
      #|  \226\136\128 n : Num, euclid_complete((euclid_euclid(n), euclid_d_euclid))
      #|  (m : Num)
      #|  abs((L : (Num, Num) -> Real)((m : Num), 0))
      #|  abs((L : (Num, Num) -> Real)((m : Num), 0))
      #|  abs((L : (Num, Num) -> Real)((m : Num), 0))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 S : (A) -> Bool, \226\136\128 f : (Num) -> A, SUBSET(S, X) && euclid_sequence(S, f) \226\134\146 euclid_sequence(X, f)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 S : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 f : (Num) -> A, SUBSET(S, X) && euclid_cauchy_seq((S, d), f) \226\134\146 euclid_cauchy_seq((X, d), f)
      #|  (a : (Num) -> Real) == (f : (Num, Num) -> Real)((n' : Num))
      #|  (X : ((Num) -> Real) -> Bool) == euclid_euclid((n : Num))
      #|  (S : ((Num) -> Real) -> Bool)((f : (Num, Num) -> Real)((n' : Num)))
      #|  (f : (Num, Num) -> Real)((n' : Num))
      #|  (n : Num) <= n
      #|  (n' : Num)
      #|  (r : Real)
      #|  (x : (Num) -> Real)
      #|  (n : Num)
      #|  TAGB
      #|  !IN((x : (Num) -> Real), (S : ((Num) -> Real) -> Bool)) \226\134\146 IN(x, DIFF(euclid_euclid((n : Num)), S))
      #|  (x : (Num) -> Real)
      #|  euclid_converge((euclid_euclid((n : Num)), euclid_d_euclid), (f : (Num, Num) -> Real))
      #|  euclid_cauchy_seq((euclid_euclid((n : Num)), euclid_d_euclid), (f : (Num, Num) -> Real))
      #|  \226\136\128 n : Num, \226\136\128 S : ((Num) -> Real) -> Bool, euclid_closed_(euclid_top_of_metric((euclid_euclid(n), euclid_d_euclid)), S) && SUBSET(S, euclid_euclid(n)) \226\134\146 euclid_complete((S, euclid_d_euclid))
      #|  TAGB
      #|  (totally_bounded : (((A) -> Bool, (A, A) -> Real)) -> Bool)(((X : (A) -> Bool), (d : (A, A) -> Real))) == (\226\136\128 eps : Real, \226\136\131 B : ((A) -> Bool) -> Bool, real_of_num(0) < eps \226\134\146 FINITE(B) && (\226\136\128 b : (A) -> Bool, B(b) \226\134\146 (\226\136\131 x : A, b == euclid_open_ball((X, d), x, eps))) && X == UNIONS(B))
      #|  (c : (A) -> Bool)
      #|  (eps : Real)
      #|  (eps : Real)
      #|  (a : Real) <= (b : Real) + (c : Real) \226\134\146 (\226\136\128 e : Real, b + c < e \226\134\146 a < e)
      #|  (u : A)
      #|  (x : A)
      #|  (v : A)
      #|  (X : (A) -> Bool)((x : A)) && X((u : A)) && X((v : A))
      #|  (v : A) == (s : ((A) -> Bool) -> A)((b : (A) -> Bool))
      #|  (b : (A) -> Bool)
      #|  (b : (A) -> Bool)((s : ((A) -> Bool) -> A)(b))
      #|  (S : (A) -> Bool)((s : ((A) -> Bool) -> A)((b : (A) -> Bool)))
      #|  (u : A)
      #|  IN((u : A), INTER((b : (A) -> Bool), (S : (A) -> Bool)))
      #|  euclid_open_ball(((S : (A) -> Bool), (d : (A, A) -> Real)), (s : ((A) -> Bool) -> A)((b : (A) -> Bool)), (eps : Real))
      #|  (b : (A) -> Bool)
      #|  (b : (A) -> Bool)
      #|  (b : (A) -> Bool)
      #|  (X : (A) -> Bool)((u : A))
      #|  (u : A)
      #|  (c : (A) -> Bool)
      #|  IMAGE((c : (A) -> Bool) => euclid_open_ball(((S : (A) -> Bool), (d : (A, A) -> Real)), (s : ((A) -> Bool) -> A)(c), (eps : Real)), (B : ((A) -> Bool) -> Bool))
      #|  \226\136\128 b : (A) -> Bool, \226\136\131 s : A, (\226\136\131 t : A, IN(t, INTER(b, (S : (A) -> Bool)))) \226\134\146 IN(s, INTER(b, S))
      #|  real_of_num(0) < (eps : Real) \226\134\146 real_of_num(0) < eps / real_of_num(2)
      #|  (eps : Real) / real_of_num(2)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 S : (A) -> Bool, euclid_metric_space((X, d)) && euclid_totally_bounded((X, d)) && SUBSET(S, X) \226\134\146 euclid_totally_bounded((S, d))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  !((n : Num) <= (q : Num)) \226\134\146 q < n
      #|  (q : Num)
      #|  (p : Num) => if p < (n : Num) { (x : (Num) -> Real)(p) } else { CHOICE(UNIV) }
      #|  !((n : Num) <= (i : Num)) \226\134\146 i < n
      #|  (i : Num)
      #|  0
      #|  euclid_euclid((n : Num), (x : (Num) -> Real))
      #|  \226\136\128 a : ((Num) -> Real) -> Bool, \226\136\128 b : ((Num) -> Real) -> Bool, a == b \226\134\146 FINITE(a) \226\134\146 FINITE(b)
      #|  FINITE({(y : (Num) -> Real) | \226\136\131 x : (Num) -> Real, IN(x, (fs : ((Num) -> Real) -> Bool)) && y == (G : ((Num) -> Real, Num) -> Real)(x)})
      #|  (G : ((Num) -> Real, Num) -> Real) == ((u : (Num) -> Real) => (j : Num) => if (n : Num) <= j { real_of_num(0) } else { u(j) })
      #|  \226\136\128 a : (Num) -> Bool, \226\136\128 b : (Real) -> Bool, FINITE(a) && FINITE(b) \226\134\146 FINITE(FUN(a, b))
      #|  FINITE((fs : ((Num) -> Real) -> Bool))
      #|  (gs : ((Num) -> Real) -> Bool) == {(f : (Num) -> Real) | euclid_euclid((n : Num), f) && (\226\136\128 i : Num, \226\136\131 j : Num, abs(f(i)) == real_of_num(j) && j <= (N : Num))}
      #|  (fs : ((Num) -> Real) -> Bool) == FUN({(m : Num) | m < (n : Num)}, {(x : Real) | \226\136\131 j : Num, abs(x) == real_of_num(j) && j <= (N : Num)})
      #|  \226\136\128 n : Num, \226\136\128 N : Num, FINITE({(f : (Num) -> Real) | euclid_euclid(n, f) && (\226\136\128 i : Num, \226\136\131 j : Num, abs(f(i)) == real_of_num(j) && j <= N)})
      #|  real_of_num(0) < (s' : Real) \226\134\146 real_of_num(0) <= s'
      #|  (s' : Real) == inv((s : Real))
      #|  (j : Num)
      #|  abs((s : Real)) == s
      #|  (i : Num)
      #|  real_of_num(0) < (s : Real) \226\134\146 !(s == real_of_num(0))
      #|  euclid_euclid_scale(inv((s : Real)), (c : (Num) -> Real))
      #|  (c : (Num) -> Real)
      #|  \226\136\128 a : (A) -> Bool, \226\136\128 b : (A) -> Bool, SUBSET(b, a) \226\134\146 FINITE(a) \226\134\146 FINITE(b)
      #|  (map : ((Num) -> Real, Num) -> Real)
      #|  (M : Num)
      #|  (n : Num)
      #|  (M : Num)
      #|  inv((s : Real)) * real_of_num((N : Num))
      #|  (map : ((Num) -> Real, Num) -> Real) == euclid_euclid_scale((s : Real))
      #|  \226\136\128 n : Num, \226\136\128 N : Num, \226\136\128 s : Real, real_of_num(0) < s \226\134\146 FINITE({(x : (Num) -> Real) | euclid_euclid(n, x) && (\226\136\128 i : Num, (\226\136\131 j : Num, abs(x(i)) == s * real_of_num(j)) && abs(x(i)) <= real_of_num(N))})
      #|  (cube : ((Num) -> Real) -> Bool)
      #|  (m : Num) == (n : Num) * n + n
      #|  \226\136\128 x : Real, real_of_num(0) <= x \226\134\146 pow(sqrt(x), 2) == x
      #|  real_of_num(0) <= real_of_num((n : Num))
      #|  (a : Real) * ((b : Real) * (c : Real)) == a * b * c
      #|  !(real_of_num((n : Num) + 1) == real_of_num(0))
      #|  real_of_num((n : Num)) + real_of_num(1)
      #|  (t : Real) < (e : Real) * real_of_num(1) \226\134\146 t < e
      #|  (b : Real) < (c : Real) \226\134\146 (a : Real) <= b \226\134\146 a < c
      #|  \226\136\128 u : Real, !(real_of_num(0) <= u) \226\134\146 real_of_num(0) <= -u
      #|  (x : Real) + (y : Real) == x - -y
      #|  -(x : Real) - (y : Real) == -(x + y)
      #|  (x' : Real)
      #|  \226\136\128 x : Real, real_of_num(0) <= x \226\134\146 abs(real_of_num((cs : (Real) -> Num)(x)) * (s : Real) - x) <= s
      #|  \226\136\128 x : Real, \226\136\128 a : Real, \226\136\128 b : Real, a <= x && x < b \226\134\146 abs(a - x) <= b - a
      #|  euclid_d_euclid((cx : (Num) -> Real), (x : (Num) -> Real)) <= sqrt(real_of_num((n : Num))) * (s : Real)
      #|  real_of_num(0) < (x : Real) \226\134\146 real_of_num(0) <= x
      #|  real_of_num(0) <= (x : Real) \226\134\146 abs(x) == x
      #|  \226\136\128 v : Real, -v <= abs(v)
      #|  (i : Num)
      #|  \226\136\128 x : Real, !(real_of_num(0) <= x) \226\134\146 real_of_num(0) <= -x
      #|  -(x : (Num) -> Real)((i : Num))
      #|  real_of_num(0) < (x : Real) \226\134\146 real_of_num(0) <= x
      #|  real_of_num(0) <= (x : Real) \226\134\146 abs(x) == x
      #|  (cs : (Real) -> Num)(-(x : (Num) -> Real)((i : Num)))
      #|  real_of_num(0) <= (x : Real) \226\134\146 abs(x) == x
      #|  (i : Num)
      #|  (x : (Num) -> Real)((i : Num))
      #|  real_of_num(0) <= real_of_num((cs : (Real) -> Num)((x : (Num) -> Real)((i : Num)))) * (s : Real)
      #|  (cs : (Real) -> Num)((x : (Num) -> Real)((i : Num)))
      #|  (q : Real) == real_of_num((a : Num)) * (s : Real)
      #|  real_of_num(0) <= real_of_num((a : Num)) * (s : Real)
      #|  (a : Num) == (cs : (Real) -> Num)(real_of_num(0))
      #|  real_of_num(0)
      #|  IN((cx : (Num) -> Real), euclid_euclid((n : Num)))
      #|  euclid_euclid((n : Num), (x : (Num) -> Real))
      #|  euclid_open_ball(((cube : ((Num) -> Real) -> Bool), euclid_d_euclid), (cx : (Num) -> Real), (eps : Real))
      #|  (cx : (Num) -> Real)
      #|  (cx : (Num) -> Real) == ((i : Num) => if real_of_num(0) <= (x : (Num) -> Real)(i) { real_of_num((cs : (Real) -> Num)(x(i))) * (s : Real) } else { -(real_of_num(cs(-x(i))) * s) })
      #|  (cs : (Real) -> Num)
      #|  (s : Real)
      #|  SUBSET((cent : ((Num) -> Real) -> Bool), (cube : ((Num) -> Real) -> Bool))
      #|  IMAGE((c : (Num) -> Real) => euclid_open_ball(((cube : ((Num) -> Real) -> Bool), euclid_d_euclid), c, (eps : Real)), (cent : ((Num) -> Real) -> Bool))
      #|  (cube : ((Num) -> Real) -> Bool) == {(x : (Num) -> Real) | euclid_euclid((n : Num), x) && (\226\136\128 i : Num, abs(x(i)) <= real_of_num((N : Num)))}
      #|  FINITE((cent : ((Num) -> Real) -> Bool))
      #|  real_of_num(0) < (s : Real)
      #|  (s : Real) == (eps : Real) / (real_of_num((n : Num)) + real_of_num(1))
      #|  real_of_num(0) < real_of_num((n : Num)) + real_of_num(1)
      #|  (cent : ((Num) -> Real) -> Bool) == {(x : (Num) -> Real) | euclid_euclid((n : Num), x) && (\226\136\128 i : Num, (\226\136\131 j : Num, abs(x(i)) == (eps : Real) / (real_of_num(n) + real_of_num(1)) * real_of_num(j)) && abs(x(i)) <= real_of_num((N : Num)))}
      #|  \226\136\128 n : Num, \226\136\128 N : Num, euclid_totally_bounded(({(x : (Num) -> Real) | euclid_euclid(n, x) && (\226\136\128 i : Num, abs(x(i)) <= real_of_num(N))}, euclid_d_euclid))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  (m : Num)
      #|  (E : (A) -> Bool) == euclid_open_ball(((X : (A) -> Bool), (d : (A, A) -> Real)), (a : A), (eps : Real))
      #|  (a : A) == (x : ((A) -> Bool) -> A)((b : (A) -> Bool))
      #|  (b : (A) -> Bool)
      #|  (a : A) == (x : ((A) -> Bool) -> A)((x' : (A) -> Bool))
      #|  (x : ((A) -> Bool) -> A)((x' : (A) -> Bool))
      #|  (x' : (A) -> Bool)
      #|  (x' : (A) -> Bool)
      #|  FINITE(IMAGE((x : ((A) -> Bool) -> A), (B : ((A) -> Bool) -> Bool)))
      #|  SUBSET((C' : (A) -> Bool), IMAGE((x : ((A) -> Bool) -> A), (B : ((A) -> Bool) -> Bool)))
      #|  (C' : (A) -> Bool)
      #|  (C' : (A) -> Bool) == {(z : A) | (X : (A) -> Bool)(z) && (\226\136\131 b : (A) -> Bool, (B : ((A) -> Bool) -> Bool)(b) && z == (x : ((A) -> Bool) -> A)(b))}
      #|  (eps : Real)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, euclid_metric_space((X, d)) && euclid_totally_bounded((X, d)) \226\134\146 (\226\136\128 eps : Real, real_of_num(0) < eps \226\134\146 (\226\136\131 C : (A) -> Bool, SUBSET(C, X) && FINITE(C) && X == UNIONS(IMAGE((x : A) => euclid_open_ball((X, d), x, eps), C))))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 x : A, \226\136\128 y : A, \226\136\128 r : Real, euclid_open_ball((X, d), x, r, y) \226\134\146 d(x, y) < r
      #|  (X : (A) -> Bool)((x' : A))
      #|  (x : A)
      #|  (x' : A)
      #|  CHOICE((X : (A) -> Bool))
      #|  IN((d : (A, A) -> Real)(CHOICE((X : (A) -> Bool)), (x' : A)), (dset : (Real) -> Bool))
      #|  (a : Real) + real_of_num(1)
      #|  FINITE((dset : (Real) -> Bool))
      #|  (dset : (Real) -> Bool) == IMAGE((c : A) => (d : (A, A) -> Real)(CHOICE((X : (A) -> Bool)), c), (C : (A) -> Bool))
      #|  (X : (A) -> Bool) == {}
      #|  CHOICE((X : (A) -> Bool))
      #|  real_of_num(1)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, euclid_metric_space((X, d)) && euclid_totally_bounded((X, d)) \226\134\146 (\226\136\131 a : A, \226\136\131 r : Real, SUBSET(X, euclid_open_ball((X, d), a, r)))
      #|  (x : A)
      #|  (n : Num) + 2 == 1 + SUC(n)
      #|  real_of_num(0) < (r : Real) \226\134\146 !(r == real_of_num(0))
      #|  real_of_num(2) * (r : Real) == r * real_of_num(2)
      #|  (b : Real) == (c : Real) \226\134\146 (a : Real) < b \226\134\146 a < c
      #|  (b : (A) -> Bool)
      #|  (X : (A) -> Bool)((x : A)) && X((y : A))
      #|  (s' : Num) == CHOICE((J : (Num) -> Bool))
      #|  (J : (Num) -> Bool)(CHOICE(J))
      #|  CHOICE((J : (Num) -> Bool))
      #|  (J : (Num) -> Bool) == INTER({(i : Num) | INTER((C : (A) -> Bool), (b : (A) -> Bool), (f : (Num) -> A)(i))}, {(i : Num) | (s : Num) < i})
      #|  !FINITE(INTER({(i : Num) | INTER((C : (A) -> Bool), (b : (A) -> Bool), (f : (Num) -> A)(i))}, {(i : Num) | (s : Num) < i}))
      #|  INTER((C : (A) -> Bool), (b : (A) -> Bool))
      #|  (C : (A) -> Bool)
      #|  (B : ((A) -> Bool) -> Bool)
      #|  (f : (Num) -> A)
      #|  (UNIV : (Num) -> Bool)
      #|  -int_of_num((n : Num) + 2)
      #|  (r : Real) * twopow(-int_of_num((n : Num) + 2))
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 f : (Num) -> A, \226\136\128 C : (A) -> Bool, \226\136\128 s : Num, \226\136\128 n : Num, \226\136\128 r : Real, euclid_metric_space((X, d)) && euclid_totally_bounded((X, d)) && euclid_sequence(X, f) && SUBSET(C, X) && real_of_num(0) < r && !FINITE({(j : Num) | C(f(j))}) && C(f(s)) && (\226\136\128 x : A, \226\136\128 y : A, C(x) && C(y) \226\134\146 d(x, y) < r * twopow(-int_of_num(n))) \226\134\146 (\226\136\131 C' : (A) -> Bool, \226\136\131 s' : Num, SUBSET(C', C) && s < s' && !FINITE({(j : Num) | C'(f(j))}) && C'(f(s')) && (\226\136\128 x : A, \226\136\128 y : A, C'(x) && C'(y) \226\134\146 d(x, y) < r * twopow(-int_of_num(SUC(n)))))
      #|  TAGB
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 f : (Num) -> A, \226\136\128 ss : (Num) -> Num, euclid_sequence(X, f) \226\134\146 euclid_sequence(X, o(f, ss))
      #|  (c : Real) < (a : Real) \226\134\146 a < (b : Real) \226\134\146 c < b
      #|  (j : Num)
      #|  (n : Num)
      #|  (i : Num)
      #|  (n : Num)
      #|  (f : (_) -> _)((sn : (_) -> _)((j : _)))
      #|  (f : (_) -> _)((sn : (_) -> _)((i : _)))
      #|  (e2 : Real) == (R : Real) * twopow(-int_of_num((n : Num)))
      #|  (j : Num)
      #|  (i : Num)
      #|  (n : Num)
      #|  (n : Num)
      #|  (eps : Real)
      #|  (R : Real)
      #|  (n : Num)
      #|  (R' : Real) / (e : Real)
      #|  \226\136\128 n : Num, real_of_num(0) < pow(real_of_num(2), n)
      #|  \226\136\128 R : Real, \226\136\128 e : Real, \226\136\131 n : Num, real_of_num(0) < R && real_of_num(0) < e \226\134\146 R * twopow(-int_of_num(n)) < e
      #|  \226\136\128 i : Num, \226\136\128 j : Num, i <= j \226\134\146 SUBSET((Cn : (Num, _) -> Bool)(j), Cn(i))
      #|  (n : Num)
      #|  \226\136\128 n : _, SUBSET((Cn : (_, _) -> Bool)(n), (X : (_) -> Bool)) && (cond : (((_) -> Bool, _), _) -> Bool)((Cn(n), (sn : (_) -> _)(n)), n)
      #|  \226\136\128 n : Num, (fn_ : (Num) -> ((A) -> Bool, Num))(n) == ((Cn : (Num, A) -> Bool)(n), (sn : (Num) -> Num)(n))
      #|  (sn : (Num) -> Num)(0) == 0 && (Cn : (Num, A) -> Bool)(0) == (X : (A) -> Bool)
      #|  (Cn : (Num, A) -> Bool) == ((i : Num) => FST((fn_ : (Num) -> ((A) -> Bool, Num))(i)))
      #|  (sn : (Num) -> Num) == ((i : Num) => SND((fn_ : (Num) -> ((A) -> Bool, Num))(i)))
      #|  (fn_ : (Num) -> ((A) -> Bool, Num))((n : Num))
      #|  (n : Num)
      #|  (i : Num) => SND((fn_ : (Num) -> ((A) -> Bool, Num))(i))
      #|  (cs' : (((A) -> Bool, Num), Num) -> ((A) -> Bool, Num))
      #|  ((X : (A) -> Bool), 0)
      #|  ((C' : (A) -> Bool), (s' : Num))
      #|  (cs : ((A) -> Bool, Num))
      #|  \226\136\128 cs : ((A) -> Bool, Num), \226\136\128 n : Num, \226\136\131 cs' : ((A) -> Bool, Num), SUBSET(FST(cs), (X : (A) -> Bool)) && (cond : (((A) -> Bool, Num), Num) -> Bool)(cs, n) \226\134\146 SUBSET(FST(cs'), FST(cs)) && SND(cs) < SND(cs') && cond(cs', SUC(n))
      #|  real_of_num(0) < (R : Real)
      #|  {(j : Num) | (X : (A) -> Bool)((f : (Num) -> A)(j))} == UNIV
      #|  \226\136\128 x : Num, (X : (A) -> Bool)((f : (Num) -> A)(x))
      #|  SUBSET((X : (A) -> Bool), X) && (cond : (((A) -> Bool, Num), Num) -> Bool)((X, 0), 0)
      #|  (R : Real) == real_of_num(2) * (r' : Real)
      #|  (cond : (((A) -> Bool, Num), Num) -> Bool) == fn { (C, s) => (n : Num) => !FINITE({(j : Num) | C((f : (Num) -> A)(j))}) && C(f(s)) && (\226\136\128 x : A, \226\136\128 y : A, C(x) && C(y) \226\134\146 (d : (A, A) -> Real)(x, y) < real_of_num(2) * (r' : Real) * twopow(-int_of_num(n))) }
      #|  (y : A)
      #|  (x : A)
      #|  \226\136\128 x : A, \226\136\128 y : A, (X : (A) -> Bool)(x) && X(y) \226\134\146 (d : (A, A) -> Real)(x, y) < real_of_num(2) * (r' : Real)
      #|  SUBSET(euclid_open_ball(((X : (A) -> Bool), (d : (A, A) -> Real)), (a : A), (r : Real)), euclid_open_ball((X, d), a, (r' : Real)))
      #|  (r' : Real) == real_of_num(1) + abs((r : Real))
      #|  real_of_num(0) < real_of_num(1) + abs((r : Real))
      #|  (r : Real) < real_of_num(1) + abs(r)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 f : (Num) -> A, euclid_metric_space((X, d)) && euclid_totally_bounded((X, d)) && euclid_sequence(X, f) \226\134\146 (\226\136\131 ss : (Num) -> Num, subseq(ss) && euclid_cauchy_seq((X, d), o(f, ss)))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  (ss : (Num) -> Num)
      #|  \226\136\131 ss : (Num) -> Num, subseq(ss) && euclid_cauchy_seq(((X : (_) -> Bool), (d : (_, _) -> Real)), o((f : (Num) -> _), ss))
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 f : (Num) -> A, euclid_metric_space((X, d)) && euclid_totally_bounded((X, d)) && euclid_complete((X, d)) && euclid_sequence(X, f) \226\134\146 (\226\136\131 ss : (Num) -> Num, subseq(ss) && euclid_converge((X, d), o(f, ss)))
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 Z : (A) -> Bool, (dense : (((A) -> Bool) -> Bool, (A) -> Bool) -> Bool)(U, Z) == (euclid_closure(U, Z) == UNIONS(U))
      #|  (hausdorff : (((A) -> Bool) -> Bool) -> Bool)((U : ((A) -> Bool) -> Bool)) == (\226\136\128 x : A, \226\136\128 y : A, UNIONS(U, x) && UNIONS(U, y) && !(x == y) \226\134\146 (\226\136\131 A : (A) -> Bool, \226\136\131 B : (A) -> Bool, U(A) && U(B) && A(x) && B(y) && INTER(A, B) == {}))
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 Z : (A) -> Bool, euclid_topology_(U) && euclid_dense(U, Z) \226\134\146 SUBSET(Z, UNIONS(U))
      #|  (B : (A) -> Bool)
      #|  SUBSET((Z : (_) -> Bool), DIFF(UNIONS((U : ((_) -> Bool) -> Bool)), (A : (_) -> Bool)))
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 Z : (A) -> Bool, euclid_topology_(U) && SUBSET(Z, UNIONS(U)) \226\134\146 euclid_dense(U, Z) == (\226\136\128 A : (A) -> Bool, euclid_open_(U, A) && INTER(A, Z) == {} \226\134\146 A == {})
      #|  (z0 : _)
      #|  (x : _)
      #|  (z0 : _)
      #|  (z0 : A)
      #|  (z0 : A)
      #|  (z0 : A)
      #|  IN((x : _), (X : (_) -> Bool))
      #|  (r : Num)
      #|  (eps : Real)
      #|  real_of_num(1)
      #|  \226\136\131 r : Num, twopow(-int_of_num(r)) < (eps : Real)
      #|  (eps : Real)
      #|  (x : _)
      #|  ((a : Bool) && !(b : Bool) \226\134\146 !(c : Bool)) \226\134\146 a && c \226\134\146 b
      #|  euclid_topology_((U : ((_) -> Bool) -> Bool)) && SUBSET((Z : (_) -> Bool), UNIONS(U))
      #|  (Z : (_) -> Bool) == UNIONS(IMAGE((z : (_, _) -> Bool), UNIV))
      #|  (U : ((_) -> Bool) -> Bool) == euclid_top_of_metric(((X : (_) -> Bool), (d : (_, _) -> Real)))
      #|  (z : _)
      #|  (UNIV : (Num) -> Bool)
      #|  UNIONS(IMAGE((z : (Num, _) -> Bool), UNIV))
      #|  (z : (A) -> Bool)
      #|  (z : (A) -> Bool)
      #|  -int_of_num((r : Num))
      #|  twopow(-int_of_num((r : Num)))
      #|  \226\136\128 r : Num, \226\136\131 z : (_) -> Bool, COUNTABLE(z) && SUBSET(z, (X : (_) -> Bool)) && X == UNIONS(IMAGE((x : _) => euclid_open_ball((X, (d : (_, _) -> Real)), x, twopow(-int_of_num(r))), z))
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, euclid_metric_space((X, d)) && euclid_totally_bounded((X, d)) \226\134\146 (\226\136\131 Z : (A) -> Bool, COUNTABLE(Z) && euclid_dense(euclid_top_of_metric((X, d)), Z))
      #|  TAGB
      #|  (a : Real) < (c : Real) && (b : Real) < c \226\134\146 b + a < c + c
      #|  (X : (_) -> _)((u : _))
      #|  (y : _)
      #|  (u : _)
      #|  (y : _)
      #|  (y : _)
      #|  (u : _)
      #|  (x : _)
      #|  euclid_open_ball(((X : (_) -> Bool), (d : (_, _) -> Real)), (y : _), (r : Real) / real_of_num(2))
      #|  euclid_open_ball(((X : (_) -> Bool), (d : (_, _) -> Real)), (x : _), (r : Real) / real_of_num(2))
      #|  real_of_num(0) < (r : Real)
      #|  (r : _) == (d : (_, _) -> _)((x : _), (y : _))
      #|  (x : _)
      #|  (y : _)
      #|  (x : _)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, euclid_metric_space((X, d)) \226\134\146 euclid_hausdorff(euclid_top_of_metric((X, d)))
      #|  (compact : (((A) -> Bool) -> Bool, (A) -> Bool) -> Bool)((U : ((A) -> Bool) -> Bool), (K : (A) -> Bool)) == (SUBSET(K, UNIONS(U)) && (\226\136\128 V : ((A) -> Bool) -> Bool, SUBSET(K, UNIONS(V)) && SUBSET(V, U) \226\134\146 (\226\136\131 W : ((A) -> Bool) -> Bool, SUBSET(W, V) && FINITE(W) && SUBSET(K, UNIONS(W)))))
      #|  (X : (_) -> Bool) == UNIONS((U : ((_) -> Bool) -> Bool))
      #|  DELETE((W : (_) -> Bool), (A : _))
      #|  SUBSET((V' : (_) -> Bool), (U : (_) -> Bool))
      #|  (X : (_) -> Bool) == UNIONS((U : ((_) -> Bool) -> Bool))
      #|  SUBSET((K : (_) -> Bool), UNIONS((V' : ((_) -> Bool) -> Bool)))
      #|  (V' : _)
      #|  (V' : (_) -> Bool) == INSERT((A : _), (V : (_) -> Bool))
      #|  euclid_open_((U : ((_) -> Bool) -> Bool), (A : (_) -> Bool))
      #|  (A : (_) -> Bool) == DIFF(UNIONS((U : ((_) -> Bool) -> Bool)), (S : (_) -> Bool))
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 K : (A) -> Bool, \226\136\128 S : (A) -> Bool, euclid_topology_(U) && euclid_compact(U, K) && euclid_closed_(U, S) && SUBSET(S, K) \226\134\146 euclid_compact(U, S)
      #|  (A : (_) -> _)((u : _))
      #|  (x'' : A)
      #|  (x' : _)
      #|  (b' : (_) -> Bool) == UNIONS(IMAGE((B : (_, _) -> Bool), (kc : (_) -> Bool)))
      #|  (a' : (_) -> Bool) == INTERS(IMAGE((A : (_, _) -> Bool), (kc : (_) -> Bool)))
      #|  (u : _)
      #|  (u : _)
      #|  (A : (_) -> _)((u : _))
      #|  (K : (_) -> _)((x'' : _))
      #|  (x'' : _)
      #|  (A : (_) -> _)((x'' : _))
      #|  (x'' : _)
      #|  ((a : Bool) \226\134\146 !(b : Bool)) \226\134\146 !(a && b)
      #|  INTER(INTERS(IMAGE((A : (_, _) -> Bool), (kc : (_) -> Bool))), UNIONS(IMAGE((B : (_, _) -> Bool), kc))) == {}
      #|  INTERS(IMAGE((A : (_, _) -> Bool), (kc : (_) -> Bool)))
      #|  !((kc : (_) -> Bool) == {})
      #|  (C : (A) -> Bool)
      #|  (K : (_) -> Bool) == {}
      #|  (kc : (A) -> Bool)
      #|  (y : A)
      #|  SUBSET((K : (_) -> Bool), UNIONS(IMAGE((B : (_, _) -> Bool), K))) && SUBSET(IMAGE(B, K), (U : ((_) -> Bool) -> Bool))
      #|  IMAGE((B : (_) -> _), (K : (_) -> Bool))
      #|  \226\136\128 y : _, (K : (_) -> Bool)(y) \226\134\146 (\226\136\131 A : (_) -> Bool, \226\136\131 B : (_) -> Bool, (U : ((_) -> Bool) -> Bool)(A) && U(B) && A((x : _)) && B(y) && INTER(A, B) == {})
      #|  (C : (_) -> Bool) == DIFF(UNIONS((U : ((_) -> Bool) -> Bool)), (K : (_) -> Bool))
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 K : (A) -> Bool, euclid_topology_(U) && euclid_hausdorff(U) && euclid_compact(U, K) \226\134\146 euclid_closed_(U, K)
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  (x' : A)
      #|  SUBSET((W : ((_) -> Bool) -> Bool), euclid_top_of_metric(((X : (_) -> Bool), (d : (_, _) -> Real))))
      #|  (W : _)
      #|  SUBSET(IMAGE((x : _) => euclid_open_ball(((X : (_) -> Bool), (d : (_, _) -> Real)), x, (eps : Real)), X), euclid_open_balls((X, d)))
      #|  SUBSET(IMAGE((x : _) => euclid_open_ball(((X : (_) -> Bool), (d : (_, _) -> Real)), x, (eps : Real)), X), euclid_top_of_metric((X, d)))
      #|  euclid_open_ball(((X : (_) -> Bool), (d : (_, _) -> Real)), (x : _), (eps : Real))
      #|  (x : _)
      #|  SUBSET((X : (_) -> Bool), UNIONS(IMAGE((x : _) => euclid_open_ball((X, (d : (_, _) -> Real)), x, (eps : Real)), X)))
      #|  IMAGE((x : _) => euclid_open_ball(((X : (_) -> Bool), (d : (_, _) -> Real)), x, (eps : Real)), X)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, euclid_metric_space((X, d)) && euclid_compact(euclid_top_of_metric((X, d)), X) \226\134\146 euclid_totally_bounded((X, d))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  (V : (_) -> _)((u : _))
      #|  (u : _)
      #|  (S : _)
      #|  (S : (A) -> Bool)
      #|  UNIONS(IMAGE((r : (_) -> Bool) => DIFF(UNIONS((U : ((_) -> Bool) -> Bool)), r), (s' : ((_) -> Bool) -> Bool)), (x : _))
      #|  UNIONS((W : ((_) -> Bool) -> Bool), (x : _))
      #|  UNIONS((U : ((_) -> Bool) -> Bool), (x : _))
      #|  (s' : _)
      #|  SUBSET((V : ((_) -> Bool) -> Bool), {{}})
      #|  (u : _)
      #|  \226\136\128 u : (_) -> Bool, (V : ((_) -> Bool) -> Bool)(u) \226\134\146 u == {}
      #|  (V : _)
      #|  DIFF(UNIONS({}), (u : (_) -> Bool))
      #|  (u : _)
      #|  (V : (_) -> Bool) == {}
      #|  (s' : (_) -> Bool) == {}
      #|  DIFF(UNIONS((U : ((_) -> Bool) -> Bool)), (a : (_) -> Bool))
      #|  (a : _)
      #|  (x : _)
      #|  SUBSET(UNIONS((U : ((_) -> Bool) -> Bool)), UNIONS(IMAGE((r : (_) -> Bool) => DIFF(UNIONS(U), r), (V : ((_) -> Bool) -> Bool))))
      #|  (x' : _)
      #|  SUBSET(IMAGE((r : (_) -> Bool) => DIFF(UNIONS((U : ((_) -> Bool) -> Bool)), r), (V : ((_) -> Bool) -> Bool)), U)
      #|  IMAGE((r : (_) -> Bool) => DIFF(UNIONS((U : ((_) -> Bool) -> Bool)), r), (V : ((_) -> Bool) -> Bool))
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 V : ((A) -> Bool) -> Bool, euclid_topology_(U) && euclid_compact(U, UNIONS(U)) && INTERS(V) == {} && (\226\136\128 u : (A) -> Bool, V(u) \226\134\146 euclid_closed_(U, u)) \226\134\146 (\226\136\131 W : ((A) -> Bool) -> Bool, SUBSET(W, V) && FINITE(W) && INTERS(W) == {})
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  (cond : _)
      #|  (sn : _)
      #|  (Cn : _)
      #|  (R : _)
      #|  (n : Num)
      #|  \226\136\128 n : _, SUBSET((Cn : (_, _) -> Bool)(n), (X : (_) -> Bool)) && (cond : (((_) -> Bool, _), _) -> Bool)((Cn(n), (sn : (_) -> _)(n)), n)
      #|  \226\136\128 n : Num, (fn_ : (Num) -> ((A) -> Bool, Num))(n) == ((Cn : (Num, A) -> Bool)(n), (sn : (Num) -> Num)(n))
      #|  (sn : (Num) -> Num)(0) == 0 && (Cn : (Num, A) -> Bool)(0) == (X : (A) -> Bool)
      #|  (Cn : (Num, A) -> Bool) == ((i : Num) => FST((fn_ : (Num) -> ((A) -> Bool, Num))(i)))
      #|  (sn : (Num) -> Num) == ((i : Num) => SND((fn_ : (Num) -> ((A) -> Bool, Num))(i)))
      #|  (fn_ : (Num) -> ((A) -> Bool, Num))((n : Num))
      #|  (n : Num)
      #|  (cs' : (((A) -> Bool, Num), Num) -> ((A) -> Bool, Num))
      #|  ((X : (A) -> Bool), 0)
      #|  ((C' : (A) -> Bool), (s' : Num))
      #|  (cs : ((A) -> Bool, Num))
      #|  \226\136\128 cs : ((A) -> Bool, Num), \226\136\128 n : Num, \226\136\131 cs' : ((A) -> Bool, Num), SUBSET(FST(cs), (X : (A) -> Bool)) && (cond : (((A) -> Bool, Num), Num) -> Bool)(cs, n) \226\134\146 SUBSET(FST(cs'), FST(cs)) && SND(cs) < SND(cs') && cond(cs', SUC(n))
      #|  real_of_num(0) < (R : Real)
      #|  {(j : Num) | (X : (A) -> Bool)((f : (Num) -> A)(j))} == UNIV
      #|  \226\136\128 x : Num, (X : (A) -> Bool)((f : (Num) -> A)(x))
      #|  SUBSET((X : (A) -> Bool), X) && (cond : (((A) -> Bool, Num), Num) -> Bool)((X, 0), 0)
      #|  (R : Real) == real_of_num(2) * (r' : Real)
      #|  (cond : (((A) -> Bool, Num), Num) -> Bool) == fn { (C, s) => (n : Num) => !FINITE({(j : Num) | C((f : (Num) -> A)(j))}) && C(f(s)) && (\226\136\128 x : A, \226\136\128 y : A, C(x) && C(y) \226\134\146 (d : (A, A) -> Real)(x, y) < real_of_num(2) * (r' : Real) * twopow(-int_of_num(n))) }
      #|  (y : A)
      #|  (x : A)
      #|  \226\136\128 x : A, \226\136\128 y : A, (X : (A) -> Bool)(x) && X(y) \226\134\146 (d : (A, A) -> Real)(x, y) < real_of_num(2) * (r' : Real)
      #|  SUBSET(euclid_open_ball(((X : (A) -> Bool), (d : (A, A) -> Real)), (a : A), (r : Real)), euclid_open_ball((X, d), a, (r' : Real)))
      #|  (r' : Real) == real_of_num(1) + abs((r : Real))
      #|  real_of_num(0) < real_of_num(1) + abs((r : Real))
      #|  (r : Real) < real_of_num(1) + abs(r)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 f : (Num) -> A, euclid_metric_space((X, d)) && euclid_totally_bounded((X, d)) && euclid_sequence(X, f) \226\134\146 (\226\136\131 R : Real, \226\136\131 Cn : (Num, A) -> Bool, \226\136\131 sn : (Num) -> Num, \226\136\131 cond : (((A) -> Bool, Num), Num) -> Bool, real_of_num(0) < R && (\226\136\128 x : A, \226\136\128 y : A, X(x) && X(y) \226\134\146 d(x, y) < R) && cond((X, 0), 0) && sn(0) == 0 && Cn(0) == X && (\226\136\128 n : Num, SUBSET(Cn(n), X) && cond((Cn(n), sn(n)), n)) && (\226\136\128 n : Num, SUBSET(Cn(SUC(n)), Cn(n)) && sn(n) < sn(SUC(n))) && fn { (C, s) => (n : Num) => !FINITE({(j : Num) | C(f(j))}) && C(f(s)) && (\226\136\128 x : A, \226\136\128 y : A, C(x) && C(y) \226\134\146 d(x, y) < R * twopow(-int_of_num(n))) } == cond)
      #|  TAGB
      #|  TAGB
      #|  (c : _) == (d : (_, _) -> _)((x : _), (f : (_) -> _)((i : _)))
      #|  (b : _) == (d : (_, _) -> _)((x : _), (f : (_) -> _)((s : (Num) -> _)((n : Num) + (n' : Num))))
      #|  (a : _) == (d : (_, _) -> _)((f : (_) -> _)((s : (Num) -> _)((n : Num) + (n' : Num))), f((i : _)))
      #|  (eps : Real)
      #|  (f : (_) -> _)((i : _))
      #|  (f : (_) -> _)((s : (Num) -> _)((n : Num) + (n' : Num)))
      #|  (x : _)
      #|  (d : _)
      #|  (X : _)
      #|  (n' : Num) <= (n : Num) + n'
      #|  (n : Num) + (n' : Num)
      #|  (n' : Num) <= (s : (Num) -> Num)((n : Num) + n')
      #|  (i : _)
      #|  (s : (Num) -> _)((n : Num) + (n' : Num))
      #|  (n : Num) <= n + (n' : Num)
      #|  (n : Num) + (n' : Num)
      #|  (n' : _)
      #|  (eps : Real) / real_of_num(2)
      #|  (eps : Real) / real_of_num(2)
      #|  (x : _)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 f : (Num) -> A, \226\136\128 s : (Num) -> Num, euclid_metric_space((X, d)) && euclid_cauchy_seq((X, d), f) && subseq(s) && euclid_converge((X, d), o(f, s)) \226\134\146 euclid_converge((X, d), f)
      #|  TAGB
      #|  (r : Real) == (R : Real) * twopow(-int_of_num((n : Num)))
      #|  IN(o((f : (_) -> _), (sn : (Num) -> _), (i : Num)), euclid_closed_ball(((X : (_) -> Bool), (d : (_, _) -> Real)), f(sn((n : Num))), (R : Real) * twopow(-int_of_num(n))))
      #|  (i : Num)
      #|  SUBSET((Cn : (_, _) -> Bool)((i : _)), Cn((n : _)))
      #|  (x : Real) < (y : Real) \226\134\146 x <= y
      #|  (n : Num)
      #|  SUBSET((Cn : (Num, _) -> Bool)((n : Num)), euclid_closed_ball(((X : (_) -> Bool), (d : (_, _) -> Real)), (f : (_) -> _)((sn : (Num) -> _)(n)), (R : Real) * twopow(-int_of_num(n))))
      #|  (n : Num)
      #|  euclid_closed_ball(((X : (_) -> Bool), (d : (_, _) -> Real)), (f : (_) -> _)((sn : (Num) -> _)((n : Num))), (R : Real) * twopow(-int_of_num(n)))
      #|  (x : Real) <= (a : Real) \226\134\146 a < (b : Real) \226\134\146 x < b
      #|  real_of_num(0) < real_of_num(2) * (R : Real)
      #|  (n : _)
      #|  (eps : _)
      #|  real_of_num(2) * (R : Real)
      #|  0
      #|  euclid_closed_ball(((X : (_) -> Bool), (d : (_, _) -> Real)), (f : (_) -> _)((sn : (Num) -> _)(0)), (R : Real) * twopow(-int_of_num(0)))
      #|  (u : _)
      #|  (a : Num)
      #|  SUBSET((Cn : (_, _) -> Bool)((a : _)), Cn((m : _)))
      #|  (x : Real) < (y : Real) \226\134\146 x <= y
      #|  (m : Num)
      #|  SUBSET((Cn : (Num, _) -> Bool)((m : Num)), euclid_closed_ball(((X : (_) -> Bool), (d : (_, _) -> Real)), (f : (_) -> _)((sn : (Num) -> _)(m)), (R : Real) * twopow(-int_of_num(m))))
      #|  (m : Num)
      #|  (m : Num)
      #|  (t : _)
      #|  IN((f : (_) -> _)((sn : (_) -> _)((a : _))), INTERS((W : ((_) -> Bool) -> Bool)))
      #|  {(z : (_) -> Bool) | \226\136\131 n : Num, z == euclid_closed_ball(((X : (_) -> Bool), (d : (_, _) -> Real)), (f : (_) -> _)((sn : (Num) -> _)(n)), (R : Real) * twopow(-int_of_num(n)))} == IMAGE((n : Num) => euclid_closed_ball((X, d), f(sn(n)), R * twopow(-int_of_num(n))), UNIV)
      #|  euclid_topology_(euclid_top_of_metric(((X : (_) -> Bool), (d : (_, _) -> Real)))) && euclid_compact(euclid_top_of_metric((X, d)), UNIONS(euclid_top_of_metric((X, d)))) && (\226\136\128 u : (_) -> Bool, {(z : (_) -> Bool) | \226\136\131 n : Num, z == euclid_closed_ball((X, d), (f : (_) -> _)((sn : (Num) -> _)(n)), (R : Real) * twopow(-int_of_num(n)))}(u) \226\134\146 euclid_closed_(euclid_top_of_metric((X, d)), u))
      #|  {(z : (_) -> Bool) | \226\136\131 n : Num, z == euclid_closed_ball(((X : (_) -> Bool), (d : (_, _) -> Real)), (f : (_) -> _)((sn : (Num) -> _)(n)), (R : Real) * twopow(-int_of_num(n)))}
      #|  euclid_top_of_metric(((X : (_) -> Bool), (d : (_, _) -> Real)))
      #|  !(INTERS({(z : (_) -> Bool) | \226\136\131 n : Num, z == euclid_closed_ball(((X : (_) -> Bool), (d : (_, _) -> Real)), (f : (_) -> _)((sn : (Num) -> _)(n)), (R : Real) * twopow(-int_of_num(n)))}) == {})
      #|  (sn : _)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, euclid_metric_space((X, d)) && euclid_compact(euclid_top_of_metric((X, d)), X) \226\134\146 euclid_complete((X, d))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  GABS((f : ((_, _)) -> _) => \226\136\128 z : _, \226\136\128 n : _, GEQ(f((z, n)), (A : (_, _) -> _)(z, n)))
      #|  (S : _)
      #|  (x : _)
      #|  (t : _)
      #|  (n : Num) + 1
      #|  (z : _)
      #|  (S : ((_, Num)) -> _)(((z : _), (n : Num) + 1))
      #|  (n : Num) + 1
      #|  (z : _)
      #|  SUBSET(euclid_open_ball(((X : (_) -> Bool), (d : (_, _) -> Real)), (z : _), twopow(-int_of_num((n : Num) + 1))), euclid_open_ball((X, d), (x : _), twopow(-int_of_num(n))))
      #|  (t : _)
      #|  (n : Num) + 1
      #|  (z : _)
      #|  (A : (_, Num) -> _)((z : _), (n : Num) + 1)
      #|  ((z : _), (n : Num) + 1)
      #|  euclid_open_ball(((X : (_) -> Bool), (d : (_, _) -> Real)), (z : _), twopow(-int_of_num((n : Num) + 1)), (x : _))
      #|  (X : (_) -> _)((z : _))
      #|  (B : (_) -> Bool) == euclid_open_ball(((X : (_) -> Bool), (d : (_, _) -> Real)), (x : _), twopow(-int_of_num((n : Num) + 1)))
      #|  \226\136\131 z : _, (Z : (_) -> Bool)(z) && euclid_open_ball(((X : (_) -> Bool), (d : (_, _) -> Real)), (x : _), twopow(-int_of_num((n : Num) + 1)), z)
      #|  euclid_open_ball(((X : (_) -> Bool), (d : (_, _) -> Real)), (x : _), twopow(-int_of_num((n : Num) + 1)), x)
      #|  euclid_open_ball(((X : (_) -> Bool), (d : (_, _) -> Real)), (x : _), twopow(-int_of_num((n : Num) + 1)))
      #|  -int_of_num((n : Num))
      #|  (x : _)
      #|  (d : _)
      #|  (X : _)
      #|  (r : Real)
      #|  real_of_num(1)
      #|  (x : _)
      #|  euclid_top_of_metric(((X : (_) -> Bool), (d : (_, _) -> Real)), (t : (_) -> Bool))
      #|  (x : _)
      #|  (n : _) == SND((zn : (_, _)))
      #|  (z : _) == FST((zn : (_, _)))
      #|  (zn : (A, Num))
      #|  (zn : (A, Num))
      #|  (Azn : (A) -> Bool)
      #|  IMAGE(GABS((f : ((_, _)) -> _) => \226\136\128 z : _, \226\136\128 n : _, GEQ(f((z, n)), (A : (_, _) -> _)(z, n))), (S : ((_, _)) -> Bool))
      #|  (A : _)
      #|  \226\136\128 z : _, \226\136\128 n : Num, (S : ((_, Num)) -> Bool)((z, n)) \226\134\146 (\226\136\131 A : (_) -> Bool, (Z : (_) -> Bool)(z) && SUBSET(euclid_open_ball(((X : (_) -> Bool), (d : (_, _) -> Real)), z, twopow(-int_of_num(n))), A) && (U : ((_) -> Bool) -> Bool)(A))
      #|  (I : ((A, Num)) -> (A, Num))
      #|  {((z : _), (n : Num)) | (Z : (_) -> Bool)(z) && UNIV(n)}
      #|  :A
      #|  :(A, Num)
      #|  COUNTABLE((S : (_) -> Bool))
      #|  (S : ((_, Num)) -> Bool) == {((z : _), (n : Num)) | \226\136\131 A : (_) -> Bool, (Z : (_) -> Bool)(z) && SUBSET(euclid_open_ball(((X : (_) -> Bool), (d : (_, _) -> Real)), z, twopow(-int_of_num(n))), A) && (U : ((_) -> Bool) -> Bool)(A)}
      #|  \226\136\131 Z : (_) -> Bool, COUNTABLE(Z) && euclid_dense(euclid_top_of_metric(((X : (_) -> Bool), (d : (_, _) -> Real))), Z)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 U : ((A) -> Bool) -> Bool, euclid_metric_space((X, d)) && euclid_totally_bounded((X, d)) && SUBSET(X, UNIONS(U)) && SUBSET(U, euclid_top_of_metric((X, d))) \226\134\146 (\226\136\131 V : ((A) -> Bool) -> Bool, SUBSET(V, U) && SUBSET(X, UNIONS(V)) && COUNTABLE(V))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  (ss : (Num) -> _)((n : Num) + (j : Num))
      #|  (j : Num) <= (a : Num) && a <= (ss : (Num) -> Num)(a) \226\134\146 j <= ss(a)
      #|  (j : _)
      #|  (u : _)
      #|  UNIONS((B : (_, (_) -> Bool) -> Bool)((ss : (Num) -> _)((n : Num) + (j : Num))), o((a : (_) -> _), ss, n + j))
      #|  (z : _) == o((a : (_) -> _), (ss : (Num) -> _), (n : Num) + (j : Num))
      #|  (ss : (Num) -> _)((n : Num) + (j : Num))
      #|  o((a : (_) -> _), (ss : (Num) -> _), (n : Num) + (j : Num))
      #|  (u : (_) -> _)(o((a : (_) -> _), (ss : (Num) -> _), (n : Num) + (j : Num)))
      #|  (n : Num) <= n + (a : Num)
      #|  (n : Num) + (j : Num)
      #|  (r : _)
      #|  (x : _)
      #|  euclid_top_of_metric(((X : (_) -> Bool), (d : (_, _) -> Real)), (u : (_) -> Bool))
      #|  (j : Num) <= j
      #|  (j : _)
      #|  SUBSET((u : (_) -> Bool), UNIONS((B : (_, (_) -> Bool) -> Bool)((j : _))))
      #|  (j : Num) <= j
      #|  (j : _)
      #|  (u : _)
      #|  UNIONS((B : (_, (_) -> Bool) -> Bool)((j : _)), (x : _))
      #|  (j : Num)
      #|  (u : _)
      #|  (x : _)
      #|  \226\136\131 ss : (Num) -> Num, subseq(ss) && euclid_converge(((X : (_) -> Bool), (d : (_, _) -> Real)), o((a : (Num) -> _), ss))
      #|  \226\136\128 i : _, SUBSET(UNIONS((B : (_, (_) -> Bool) -> Bool)(i)), (X : (_) -> Bool))
      #|  SUBSET(UNIONS((V' : ((_) -> Bool) -> Bool)), (X : (_) -> Bool))
      #|  {(u : Num) | u <= (i : Num)}
      #|  (B : (_) -> _)((i : _))
      #|  \226\136\131 i : _, UNIONS((B : (_, (_) -> Bool) -> Bool)(i)) == (X : (_) -> Bool)
      #|  (B : (Num, _) -> Bool) == ((i : Num) => IMAGE((f : (Num) -> _), {(u : Num) | u <= i && (V' : (_) -> Bool)(f(u))}))
      #|  (d : _)
      #|  \226\136\131 V' : ((_) -> Bool) -> Bool, SUBSET(V', (V : ((_) -> Bool) -> Bool)) && SUBSET((X : (_) -> Bool), UNIONS(V')) && COUNTABLE(V')
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 d : (A, A) -> Real, euclid_metric_space((X, d)) && euclid_totally_bounded((X, d)) && euclid_complete((X, d)) \226\134\146 euclid_compact(euclid_top_of_metric((X, d)), X)
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  (uniformly_continuous : ((A) -> B, ((A) -> Bool, (A, A) -> Real), ((B) -> Bool, (B, B) -> Real)) -> Bool)((f : (A) -> B), ((X : (A) -> Bool), (dX : (A, A) -> Real)), ((Y : (B) -> Bool), (dY : (B, B) -> Real))) == (\226\136\128 epsilon : Real, \226\136\131 delta : Real, real_of_num(0) < epsilon \226\134\146 real_of_num(0) < delta && (\226\136\128 x : A, \226\136\128 y : A, X(x) && X(y) && dX(x, y) < delta \226\134\146 dY(f(x), f(y)) < epsilon))
      #|  (f : (_) -> _)((y : _))
      #|  (f : (_) -> _)((x' : _))
      #|  (f : (_) -> _)((x : _))
      #|  (dY : _)
      #|  (Y : _)
      #|  (f : (_) -> _)((x' : _))
      #|  (f : (_) -> _)((x : _))
      #|  (dY : _)
      #|  (Y : _)
      #|  (dY : (_, _) -> _)((f : (_) -> _)((x : _)), f((x' : _))) == dY(f(x'), f(x))
      #|  (Y : (_) -> Bool)((f : (_) -> _)((x : _))) && Y(f((y : _))) && Y(f((x' : _)))
      #|  (x : _)
      #|  (y : _)
      #|  (x' : _)
      #|  (dY : (_, _) -> Real)((f : (_) -> _)((x : _)), f((x' : _))) < (u0 : Real) && dY(f(x'), f((y : _))) < u0 && dY(f(x), f(y)) <= dY(f(x), f(x')) + dY(f(x'), f(y)) \226\134\146 dY(f(x), f(y)) < u0 + u0
      #|  (X : _)
      #|  (u : Real) + u <= (v : Real) + v \226\134\146 u <= v
      #|  (u : Real) <= (v : Real) \226\134\146 (a : Real) < u \226\134\146 a < v
      #|  (dX : (_, _) -> Real)((x' : _), (x : _)) < (u : Real) && dX(x, (y : _)) < u && dX(x', y) <= dX(x', x) + dX(x, y) \226\134\146 dX(x', y) < u + u
      #|  (dX : (_, _) -> Real)((x' : _), (y : _)) < (delta : (_) -> Real)(x')
      #|  (x' : _)
      #|  (u : Real) < (v : Real) \226\134\146 (a : Real) < u \226\134\146 a < v
      #|  (dX : (_, _) -> Real)((x' : _), (x : _)) < (delta : (_) -> Real)(x')
      #|  (y : _)
      #|  (x : _)
      #|  (delta' : Real) / real_of_num(2)
      #|  FINITE((ds : (Real) -> Bool)) && (\226\136\128 x : Real, ds(x) \226\134\146 real_of_num(0) < x)
      #|  (ds : (_) -> Bool) == IMAGE((delta : (_) -> _), (S : (_) -> Bool))
      #|  (S : (A) -> Bool)
      #|  euclid_open_ball(((X : (_) -> Bool), (dX : (_, _) -> Real)), (x : _), (delta : (_) -> Real)(x) / real_of_num(2))
      #|  SUBSET((X : (_) -> Bool), UNIONS((cov : ((_) -> Bool) -> Bool))) && SUBSET(cov, euclid_top_of_metric((X, (dX : (_, _) -> Real))))
      #|  \226\136\128 x : _, real_of_num(0) < (delta : (_) -> Real)(x) / real_of_num(2)
      #|  (cov : _)
      #|  (cov : ((_) -> Bool) -> Bool) == IMAGE((x : _) => euclid_open_ball(((X : (_) -> Bool), (dX : (_, _) -> Real)), x, (delta : (_) -> Real)(x) / real_of_num(2)), X)
      #|  (epsilon : Real) / real_of_num(2)
      #|  \226\136\128 f : (A) -> B, \226\136\128 X : (A) -> Bool, \226\136\128 dX : (A, A) -> Real, \226\136\128 Y : (B) -> Bool, \226\136\128 dY : (B, B) -> Real, euclid_metric_continuous(f, (X, dX), (Y, dY)) && euclid_metric_space((X, dX)) && euclid_metric_space((Y, dY)) && euclid_compact(euclid_top_of_metric((X, dX)), X) && SUBSET(IMAGE(f, X), Y) \226\134\146 euclid_uniformly_continuous(f, (X, dX), (Y, dY))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  (u' : _)
      #|  (u' : (B) -> Bool)
      #|  (x' : _)
      #|  (V'' : _)
      #|  \226\136\131 V'' : ((_) -> Bool) -> Bool, SUBSET(V'', (V' : ((_) -> Bool) -> Bool)) && FINITE(V'') && (W : ((_) -> Bool) -> Bool) == IMAGE((v : (_) -> Bool) => preimage(UNIONS((U : ((_) -> Bool) -> Bool)), (f : (_) -> _), v), V'')
      #|  (cov : _)
      #|  preimage(UNIONS((U : ((_) -> Bool) -> Bool)), (f : (_) -> _), (u : (_) -> Bool))
      #|  (u : _)
      #|  \226\136\131 u : (_) -> Bool, (V' : ((_) -> Bool) -> Bool)(u) && u((f : (_) -> _)((x : _)))
      #|  (f : (_) -> _)((x : _))
      #|  (x : _)
      #|  SUBSET((K : (_) -> Bool), UNIONS((cov : ((_) -> Bool) -> Bool)))
      #|  (x' : _)
      #|  SUBSET((cov : (_) -> Bool), (U : (_) -> Bool))
      #|  (cov : ((_) -> Bool) -> Bool) == IMAGE((v : (_) -> Bool) => preimage(UNIONS((U : ((_) -> Bool) -> Bool)), (f : (_) -> _), v), (V' : ((_) -> Bool) -> Bool))
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 V : ((B) -> Bool) -> Bool, \226\136\128 f : (A) -> B, \226\136\128 K : (A) -> Bool, euclid_continuous(f, U, V) && euclid_compact(U, K) && SUBSET(IMAGE(f, K), UNIONS(V)) \226\134\146 euclid_compact(V, IMAGE(f, K))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  (metric_bounded : (((A) -> Bool, (A, A) -> Real)) -> Bool)(((X : (A) -> Bool), (d : (A, A) -> Real))) == (\226\136\131 x : A, \226\136\131 r : Real, SUBSET(X, euclid_open_ball((X, d), x, r)))
      #|  euclid_euclid((n : Num))
      #|  euclid_d_euclid((x' : (Num) -> Real), (x : (Num) -> Real)) == euclid_d_euclid(x, x')
      #|  euclid_euclid((n : Num))
      #|  euclid_d_euclid((x' : (Num) -> Real), (i : Num) => real_of_num(0)) <= euclid_d_euclid(x', (x : (Num) -> Real)) + euclid_d_euclid(x, (i : Num) => real_of_num(0))
      #|  (n : _)
      #|  euclid_euclid((n : Num), (i : Num) => real_of_num(0))
      #|  (i : _)
      #|  (i : Num) => real_of_num(0)
      #|  (x' : _)
      #|  (n : _)
      #|  (N : _)
      #|  (N : Num)
      #|  euclid_d_euclid((x : (Num) -> Real), (i : Num) => real_of_num(0)) + (r : Real)
      #|  \226\136\128 n : Num, \226\136\128 x : (Num) -> Real, \226\136\128 r : Real, \226\136\131 N : Num, SUBSET(euclid_open_ball((euclid_euclid(n), euclid_d_euclid), x, r), {(x : (Num) -> Real) | euclid_euclid(n, x) && (\226\136\128 i : Num, abs(x(i)) <= real_of_num(N))})
      #|  euclid_euclid((n : Num))
      #|  {(x : (Num) -> Real) | euclid_euclid((n : Num), x) && (\226\136\128 i : Num, abs(x(i)) <= real_of_num((N : Num)))}
      #|  (r : _)
      #|  (x : _)
      #|  euclid_d_euclid
      #|  (X : _)
      #|  euclid_euclid((n : Num))
      #|  (r : _)
      #|  (x : _)
      #|  (n : _)
      #|  \226\136\128 X : ((Num) -> Real) -> Bool, \226\136\128 n : Num, euclid_metric_bounded((X, euclid_d_euclid)) && SUBSET(X, euclid_euclid(n)) \226\134\146 euclid_totally_bounded((X, euclid_d_euclid))
      #|  (R : (_) -> Bool) == UNIONS((C : ((_) -> Bool) -> Bool))
      #|  (C : _)
      #|  (WK : _)
      #|  INTER((K : (_) -> Bool))
      #|  (V : _)
      #|  (WK : ((A) -> Bool) -> Bool)
      #|  SUBSET((K : (_) -> Bool), UNIONS((VK : ((_) -> Bool) -> Bool))) && SUBSET(VK, euclid_induced_top((U : ((_) -> Bool) -> Bool), K))
      #|  (VK : _)
      #|  (VK : ((_) -> Bool) -> Bool) == IMAGE((b : (_) -> Bool) => INTER(b, (K : (_) -> Bool)), (V : ((_) -> Bool) -> Bool))
      #|  (x' : _)
      #|  (x' : _)
      #|  (x' : _)
      #|  (x : _)
      #|  SUBSET((K : (_) -> Bool), UNIONS(IMAGE((u : (_, _) -> Bool), (W' : (_) -> Bool))))
      #|  (W' : _)
      #|  (W' : ((A) -> Bool) -> Bool)
      #|  (K : _)
      #|  (u : (_) -> _)((v : _))
      #|  (v : _)
      #|  (u : (_) -> _)((v : _))
      #|  (v : _)
      #|  (v : (A) -> Bool)
      #|  (x : _)
      #|  SUBSET((K : (_) -> Bool), UNIONS(IMAGE((u : (_, _) -> Bool), (V : (_) -> Bool)))) && SUBSET(IMAGE(u, V), (U : ((_) -> Bool) -> Bool))
      #|  IMAGE((u : (_) -> _), (V : (_) -> Bool))
      #|  (u : ((A) -> Bool, A) -> Bool)
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 K : (A) -> Bool, SUBSET(K, UNIONS(U)) \226\134\146 euclid_compact(U, K) == euclid_compact(euclid_induced_top(U, K), K)
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  (n : _)
      #|  euclid_induced_top(euclid_top_of_metric((euclid_euclid((n : Num)), euclid_d_euclid)), (X : ((Num) -> Real) -> Bool)) == euclid_top_of_metric((X, euclid_d_euclid))
      #|  SUBSET((X : ((Num) -> Real) -> Bool), UNIONS(euclid_top_of_metric((euclid_euclid((n : Num)), euclid_d_euclid))))
      #|  euclid_metric_space(((X : ((Num) -> Real) -> Bool), euclid_d_euclid))
      #|  euclid_top_of_metric(((X : ((Num) -> Real) -> Bool), euclid_d_euclid)) == euclid_induced_top(euclid_top_of_metric((euclid_euclid((n : Num)), euclid_d_euclid)), X)
      #|  \226\136\128 X : ((Num) -> Real) -> Bool, \226\136\128 n : Num, SUBSET(X, euclid_euclid(n)) \226\134\146 euclid_compact(euclid_top_of_metric((euclid_euclid(n), euclid_d_euclid)), X) == (euclid_closed_(euclid_top_of_metric((euclid_euclid(n), euclid_d_euclid)), X) && euclid_metric_bounded((X, euclid_d_euclid)))
      #|  (epsilon : _)
      #|  \226\136\128 n : Num, euclid_metric_continuous(op_minus_minus, (euclid_euclid(n), euclid_d_euclid), (euclid_euclid(n), euclid_d_euclid))
      #|  TAGB
      #|  (VV : (_) -> Bool) == UNIONS((V : ((_) -> Bool) -> Bool))
      #|  (UU : (_) -> Bool) == UNIONS((U : ((_) -> Bool) -> Bool))
      #|  ((a : Bool) \226\134\146 (b : Bool)) \226\134\146 (a && b && (c : Bool)) == (a && c)
      #|  (U : ((_) -> Bool) -> Bool)({(x : _) | UNIONS(U, x) && UNIONS((V : ((_) -> Bool) -> Bool), (f : (_) -> _)(x)) && (w : (_) -> Bool)((g : (_) -> _)(f(x)))}) == U({(x : _) | UNIONS(U, x) && w(g(f(x)))})
      #|  {(x : _) | UNIONS((V : ((_) -> Bool) -> Bool), x) && (w : (_) -> Bool)((g : (_) -> _)(x))}
      #|  (w : _)
      #|  (w : (C) -> Bool)
      #|  \226\136\128 f : (A) -> B, \226\136\128 g : (B) -> C, \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 V : ((B) -> Bool) -> Bool, \226\136\128 W : ((C) -> Bool) -> Bool, euclid_continuous(f, U, V) && euclid_continuous(g, V, W) && SUBSET(IMAGE(f, UNIONS(U)), UNIONS(V)) \226\134\146 euclid_continuous(o(g, f), U, W)
      #|  (f : (_, Num) -> _)((y : _), 0)
      #|  (x' : _)
      #|  (t : Real) == sup((P : (Real) -> Bool))
      #|  (x : _)
      #|  (B : (_) -> Bool) == IMAGE((f : (_) -> _), (K : (_) -> Bool))
      #|  (B : Bool) \226\134\146 !((A : Bool) && !B)
      #|  (y : Real) < (x : Real) \226\134\146 (t : Real) - y < (u : Real) \226\134\146 t < u + x
      #|  (1 <= (m : Num)) == !(0 == m)
      #|  (1 <= (m : Num)) == !(0 == m)
      #|  DIFF(euclid_euclid(1), IMAGE((f : (_, Num) -> Real), (K : (_) -> Bool)), euclid_euclid_scale((u : Real), dirac_delta(0)))
      #|  (u : _)
      #|  (u : Real)
      #|  real_of_num(0) < (x : Real) \226\134\146 (t : Real) - x < t
      #|  (t : Real) - (r : Real) / real_of_num(2) < t
      #|  (t : Real) - (r : Real) / real_of_num(2)
      #|  real_of_num(0) < (x : Real) \226\134\146 real_of_num(0) <= x
      #|  (t : Real) - (t - (r : Real) / real_of_num(2)) == r / real_of_num(2)
      #|  (t : Real) * real_of_num(0) == real_of_num(0)
      #|  1 <= (m : Num) \226\134\146 !(0 == m)
      #|  (t : Real) * real_of_num(0) == real_of_num(0)
      #|  1 <= (m : Num) \226\134\146 !(0 == m)
      #|  euclid_euclid(1, (z : (Num) -> Real)) && euclid_euclid(1, euclid_euclid_scale((t : Real) - (r : Real) / real_of_num(2), dirac_delta(0))) && euclid_d_euclid(z, euclid_euclid_scale(t - r / real_of_num(2), dirac_delta(0))) < r
      #|  euclid_euclid_scale((t : Real) - (r : Real) / real_of_num(2), dirac_delta(0))
      #|  (z : _)
      #|  1 <= (m : Num) \226\134\146 !(0 == m)
      #|  DIFF(euclid_euclid(1), IMAGE((f : (_, Num) -> Real), (K : (_) -> Bool)), (z : (Num) -> Real))
      #|  (z : (Num) -> Real) == euclid_euclid_scale((t : Real), dirac_delta(0))
      #|  1
      #|  euclid_euclid_scale((t : Real), dirac_delta(0))
      #|  !IMAGE((f : (_, Num) -> Real), (K : (_) -> Bool), euclid_euclid_scale((t : Real), dirac_delta(0)))
      #|  (u : _)
      #|  !((x : Real) < x)
      #|  (t : _)
      #|  !((x : Real) < x)
      #|  (t : _)
      #|  (s : _)
      #|  !((s : Real) == (t : Real)) \226\134\146 s < t || t < s
      #|  (s : _) == (t : _)
      #|  (\226\136\128 u : Real, (P : (Real) -> Bool)(u) \226\134\146 u <= sup(P)) && P(sup(P))
      #|  euclid_d_euclid((x0 : (Num) -> Real), (f : (_, Num) -> Real)((x : _))) == abs(x0(0) - f(x, 0))
      #|  (fx : _)
      #|  (x : _)
      #|  (x : A)
      #|  (fx : (Num) -> Real)
      #|  (x0 : (Num) -> Real)(0) + (r : Real)
      #|  (r : Real)
      #|  (x0 : (Num) -> Real)
      #|  (u : _)
      #|  (f : (_, Num) -> _)((u : _), 0)
      #|  \226\136\131 s : Real, \226\136\128 y : Real, (\226\136\131 x : Real, (P : (Real) -> Bool)(x) && y < x) == (y < s)
      #|  (P : (Real) -> Bool) == IMAGE(euclid_coord(0), IMAGE((f : (_, Num) -> Real), (K : (_) -> Bool)))
      #|  euclid_euclid(1) == UNIONS(euclid_top_of_metric((euclid_euclid(1), euclid_d_euclid)))
      #|  \226\136\128 f : (A, Num) -> Real, \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 K : (A) -> Bool, euclid_continuous(f, U, euclid_top_of_metric((euclid_euclid(1), euclid_d_euclid))) && SUBSET(IMAGE(f, K), euclid_euclid(1)) && euclid_compact(U, K) && !(K == {}) \226\134\146 (\226\136\131 x : A, K(x) && (\226\136\128 y : A, K(y) \226\134\146 f(y, 0) <= f(x, 0)))
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  (homeomorphism : ((A) -> B, ((A) -> Bool) -> Bool, ((B) -> Bool) -> Bool) -> Bool)((f : (A) -> B), (U : ((A) -> Bool) -> Bool), (V : ((B) -> Bool) -> Bool)) == (BIJ(f, UNIONS(U), UNIONS(V)) && euclid_continuous(f, U, V) && (\226\136\128 A : (A) -> Bool, U(A) \226\134\146 V(IMAGE(f, A))))
      #|  UNIONS((U : ((_) -> Bool) -> Bool), (x : _))
      #|  INV((f : (_) -> _), UNIONS((U : ((_) -> Bool) -> Bool)), UNIONS((V : ((_) -> Bool) -> Bool)), (t : _)) == (x : _)
      #|  (x : _)
      #|  INV((f : (_) -> _), UNIONS((U : ((_) -> Bool) -> Bool)), UNIONS((V : ((_) -> Bool) -> Bool)), (t : _))
      #|  (t : B)
      #|  {(x : _) | UNIONS((V : ((_) -> Bool) -> Bool), x) && (u : (_) -> Bool)(INV((f : (_) -> _), UNIONS((U : ((_) -> Bool) -> Bool)), UNIONS(V), x))} == IMAGE(f, u)
      #|  (u : (A) -> Bool)
      #|  \226\136\128 f : (A) -> B, \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 V : ((B) -> Bool) -> Bool, euclid_homeomorphism(f, U, V) \226\134\146 euclid_continuous(INV(f, UNIONS(U), UNIONS(V)), V, U)
      #|  UNIONS((U : ((_) -> Bool) -> Bool), (x : _))
      #|  INV((f : (_) -> _), UNIONS((U : ((_) -> Bool) -> Bool)), UNIONS((V : ((_) -> Bool) -> Bool)), (t : _)) == (x : _)
      #|  (x : _)
      #|  INV((f : (_) -> _), UNIONS((U : ((_) -> Bool) -> Bool)), UNIONS((V : ((_) -> Bool) -> Bool)), (t : _))
      #|  (t : B)
      #|  {(x : _) | UNIONS((V : ((_) -> Bool) -> Bool), x) && (A : (_) -> Bool)(INV((f : (_) -> _), UNIONS((U : ((_) -> Bool) -> Bool)), UNIONS(V), x))} == IMAGE(f, A)
      #|  (A : _)
      #|  \226\136\128 f : (A) -> B, \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 V : ((B) -> Bool) -> Bool, BIJ(f, UNIONS(U), UNIONS(V)) && euclid_continuous(f, U, V) && euclid_continuous(INV(f, UNIONS(U), UNIONS(V)), V, U) \226\134\146 euclid_homeomorphism(f, U, V)
      #|  DIFF(UNIONS((V : ((_) -> Bool) -> Bool)), IMAGE((f : (_) -> _), DIFF(UNIONS((U : ((_) -> Bool) -> Bool)), (A : (_) -> Bool)))) == IMAGE(f, A)
      #|  SUBSET(DIFF(UNIONS((U : ((_) -> Bool) -> Bool)), (A : (_) -> Bool)), UNIONS(U)) && U(DIFF(UNIONS(U), DIFF(UNIONS(U), A)))
      #|  DIFF(UNIONS((U : ((_) -> Bool) -> Bool)), (A : (_) -> Bool))
      #|  IMAGE((f : (_) -> _), DIFF(UNIONS((U : ((_) -> Bool) -> Bool)), (B : (_) -> Bool))) == DIFF(UNIONS((V : ((_) -> Bool) -> Bool)), IMAGE(f, B))
      #|  DIFF(UNIONS((U : ((_) -> Bool) -> Bool)), (B : (_) -> Bool))
      #|  (y : B)
      #|  \226\136\128 f : (A) -> B, \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 V : ((B) -> Bool) -> Bool, euclid_topology_(U) && euclid_topology_(V) && BIJ(f, UNIONS(U), UNIONS(V)) \226\134\146 (\226\136\128 A : (A) -> Bool, U(A) \226\134\146 V(IMAGE(f, A))) == (\226\136\128 B : (A) -> Bool, euclid_closed_(U, B) \226\134\146 euclid_closed_(V, IMAGE(f, B)))
      #|  (U : _)
      #|  (B : _)
      #|  UNIONS((U : ((_) -> Bool) -> Bool))
      #|  (U : _)
      #|  \226\136\128 f : (A) -> B, \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 V : ((B) -> Bool) -> Bool, BIJ(f, UNIONS(U), UNIONS(V)) && euclid_continuous(f, U, V) && euclid_compact(U, UNIONS(U)) && euclid_hausdorff(V) && euclid_topology_(U) && euclid_topology_(V) \226\134\146 euclid_homeomorphism(f, U, V)
      #|  (d_real : (Real, Real) -> Real)((x : Real), (y : Real)) == abs(x - y)
      #|  euclid_metric_space((UNIV, euclid_d_real))
      #|  (a : Real) <= (b : Real) \226\134\146 b < (e : Real) \226\134\146 a < e
      #|  (epsilon : _)
      #|  (n : _)
      #|  (i : _)
      #|  \226\136\128 i : Num, \226\136\128 n : Num, SUBSET(IMAGE(euclid_coord(i), euclid_euclid(n)), UNIV) && euclid_metric_space((euclid_euclid(n), euclid_d_euclid)) && euclid_metric_space((UNIV, euclid_d_real))
      #|  \226\136\128 i : Num, \226\136\128 n : Num, euclid_continuous(euclid_coord(i), euclid_top_of_metric((euclid_euclid(n), euclid_d_euclid)), euclid_top_of_metric((UNIV, euclid_d_real)))
      #|  TAGB
      #|  ((a : Real) + (b : Real)) * (C : Real) + (b - a) * C == b * (real_of_num(2) * C)
      #|  ((a : Real) + (b : Real)) / real_of_num(2) + (b - a) / real_of_num(2) == b
      #|  ((a : Real) + (b : Real)) * (C : Real) - (b - a) * C == a * (real_of_num(2) * C)
      #|  ((a : Real) + (b : Real)) / real_of_num(2) - (b - a) / real_of_num(2) == a
      #|  ((x : Real) <= (u : Real) + (v : Real)) == (x - v <= u) && (x - u <= v) == (x <= v + u)
      #|  (a : Bool) == (d : Bool) && (b : Bool) == (C : Bool) \226\134\146 (a && b) == (C && d)
      #|  (t : _) == (x : (Num) -> _)(0)
      #|  euclid_euclid(1, (z : (Num) -> Real))
      #|  (z : (Num) -> Real) == euclid_euclid_scale(((a : Real) + (b : Real)) / real_of_num(2), dirac_delta(0))
      #|  ((a : Bool) \226\134\146 (b : Bool) == ((d : Bool) && (c : Bool))) \226\134\146 (a && b) == (d && a && c)
      #|  ((b : Real) - (a : Real)) / real_of_num(2)
      #|  euclid_euclid_scale(((a : Real) + (b : Real)) / real_of_num(2), dirac_delta(0))
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\131 x : (Num) -> Real, \226\136\131 r : Real, a <= b \226\134\146 {(x : (Num) -> Real) | euclid_euclid(1, x) && a <= x(0) && x(0) <= b} == euclid_closed_ball((euclid_euclid(1), euclid_d_euclid), x, r)
      #|  !((b : Bool) && (C : Bool)) \226\134\146 !((a : Bool) && b && C)
      #|  (t : _) == (x : (Num) -> _)(0)
      #|  {(x : (Num) -> Real) | euclid_euclid(1, x) && (a : Real) <= x(0) && x(0) <= (b : Real)} == {}
      #|  (b : _)
      #|  (a : _)
      #|  (a : Real) <= (b : Real)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, euclid_closed_(euclid_top_of_metric((euclid_euclid(1), euclid_d_euclid)), {(x : (Num) -> Real) | euclid_euclid(1, x) && a <= x(0) && x(0) <= b})
      #|  !((b : Bool) && (C : Bool)) \226\134\146 !((a : Bool) && b && C)
      #|  (t : _) == (x : (Num) -> _)(0)
      #|  {(x : (Num) -> Real) | euclid_euclid(1, x) && (a : Real) <= x(0) && x(0) <= (b : Real)} == {}
      #|  real_of_num(0) <= (r : Real)
      #|  (s : _) == (x' : (Num) -> _)(0)
      #|  (t : _) == (x : (Num) -> _)(0)
      #|  (r : Real) + real_of_num(1)
      #|  (x : _)
      #|  (a : Real) <= (b : Real)
      #|  (b : _)
      #|  (a : _)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, euclid_metric_bounded(({(x : (Num) -> Real) | euclid_euclid(1, x) && a <= x(0) && x(0) <= b}, euclid_d_euclid))
      #|  SUBSET({(x : (Num) -> Real) | euclid_euclid(1, x) && (a : Real) <= x(0) && x(0) <= (b : Real)}, euclid_euclid(1))
      #|  \226\136\128 a : Real, \226\136\128 b : Real, euclid_compact(euclid_top_of_metric((euclid_euclid(1), euclid_d_euclid)), {(x : (Num) -> Real) | euclid_euclid(1, x) && a <= x(0) && x(0) <= b})
      #|  euclid_euclid_scale((x : Real), dirac_delta(0))
      #|  \226\136\128 a : Real, \226\136\128 b : Real, {(x : Real) | a <= x && x <= b} == IMAGE(euclid_coord(0), {(x : (Num) -> Real) | euclid_euclid(1, x) && a <= x(0) && x(0) <= b})
      #|  euclid_top_of_metric((euclid_euclid(1), euclid_d_euclid))
      #|  \226\136\128 a : Real, \226\136\128 b : Real, euclid_compact(euclid_top_of_metric((UNIV, euclid_d_real)), {(x : Real) | a <= x && x <= b})
      #|  euclid_open_ball((UNIV, euclid_d_real), (x : Real), (a : Real) - x)
      #|  {(x : Real) | x < (a : Real)}
      #|  euclid_top_of_metric((UNIV, euclid_d_real))
      #|  \226\136\128 a : Real, euclid_top_of_metric((UNIV, euclid_d_real), {(x : Real) | x < a})
      #|  euclid_open_ball((UNIV, euclid_d_real), (x : Real), x - (a : Real))
      #|  {(x : Real) | (a : Real) < x}
      #|  euclid_top_of_metric((UNIV, euclid_d_real))
      #|  \226\136\128 a : Real, euclid_top_of_metric((UNIV, euclid_d_real), {(x : Real) | a < x})
      #|  (joinf : ((Real) -> A, (Real) -> A, Real, Real) -> A)((f : (Real) -> A), (g : (Real) -> A), (a : Real)) == ((x : Real) => if x < a { f(x) } else { g(x) })
      #|  preimage(UNIONS(euclid_top_of_metric((UNIV, euclid_d_real))), (g : (Real) -> _), (v : (_) -> Bool))
      #|  {(x : Real) | (a : Real) < x}
      #|  (v : _)
      #|  (v : _)
      #|  euclid_d_real
      #|  (UNIV : (Real) -> Bool)
      #|  (a : Real) < (x'' : Real) \226\134\146 !(x'' < a)
      #|  (a : Real) < (x'' : Real) \226\134\146 !(x'' < a)
      #|  (B : _)
      #|  (B : (Real) -> Bool) == INTER({(x : Real) | (a : Real) < x}, preimage(UNIONS(euclid_top_of_metric((UNIV, euclid_d_real))), (g : (Real) -> _), (v : (_) -> Bool)))
      #|  preimage(UNIONS(euclid_top_of_metric((UNIV, euclid_d_real))), (f : (Real) -> _), (v : (_) -> Bool))
      #|  {(x : Real) | x < (a : Real)}
      #|  (v : _)
      #|  (v : _)
      #|  euclid_d_real
      #|  (UNIV : (Real) -> Bool)
      #|  (B : _)
      #|  (B : (Real) -> Bool) == INTER({(x : Real) | x < (a : Real)}, preimage(UNIONS(euclid_top_of_metric((UNIV, euclid_d_real))), (f : (Real) -> _), (v : (_) -> Bool)))
      #|  (v : _)
      #|  (v : _)
      #|  euclid_d_real
      #|  (UNIV : (Real) -> Bool)
      #|  !((a : Real) < a)
      #|  (B : _)
      #|  (B : (Real) -> Bool) == INTER(preimage(UNIONS(euclid_top_of_metric((UNIV, euclid_d_real))), (f : (Real) -> _), (v : (_) -> Bool)), preimage(UNIONS(euclid_top_of_metric((UNIV, euclid_d_real))), (g : (Real) -> _), v))
      #|  (x : Real) == (a : Real) || x < a || a < x
      #|  preimage(UNIONS(euclid_top_of_metric((UNIV, euclid_d_real))), euclid_joinf((f : (Real) -> _), (g : (Real) -> _), (a : Real)), (v : (_) -> Bool))
      #|  euclid_top_of_metric((UNIV, euclid_d_real))
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 a : Real, \226\136\128 f : (Real) -> A, \226\136\128 g : (Real) -> A, euclid_continuous(f, euclid_top_of_metric((UNIV, euclid_d_real)), U) && euclid_continuous(g, euclid_top_of_metric((UNIV, euclid_d_real)), U) && f(a) == g(a) \226\134\146 euclid_continuous(euclid_joinf(f, g, a), euclid_top_of_metric((UNIV, euclid_d_real)), U)
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  (epsilon : _)
      #|  (SUBSET : ((Real) -> Bool, (Real) -> Bool) -> Bool)((IMAGE : ((Real) -> Real, (Real) -> Bool, Real) -> Bool)(op_minus_minus, (UNIV : (Real) -> Bool)), (UNIV : (Real) -> Bool))
      #|  euclid_continuous(op_minus_minus, euclid_top_of_metric((UNIV, euclid_d_real)), euclid_top_of_metric((UNIV, euclid_d_real)))
      #|  (epsilon : _)
      #|  SUBSET(IMAGE(op_plus((u : Real)), UNIV), UNIV)
      #|  \226\136\128 u : Real, euclid_continuous(op_plus(u), euclid_top_of_metric((UNIV, euclid_d_real)), euclid_top_of_metric((UNIV, euclid_d_real)))
      #|  !((x : Real) <= real_of_num(1)) \226\134\146 real_of_num(0) < x
      #|  (epsilon : Real) / euclid_norm((x : (Num) -> Real))
      #|  (x' : Real) - (y : Real)
      #|  (x' : Real) - (y : Real)
      #|  (epsilon : _)
      #|  euclid_norm((x : (Num) -> Real)) <= real_of_num(1)
      #|  euclid_euclidean((x : (Num) -> Real))
      #|  SUBSET(IMAGE((t : Real) => euclid_euclid_scale(t, (x : (Num) -> Real)), UNIV), euclid_euclid((n : Num)))
      #|  \226\136\128 x : (Num) -> Real, \226\136\128 n : Num, euclid_euclid(n, x) \226\134\146 euclid_continuous((t : Real) => euclid_euclid_scale(t, x), euclid_top_of_metric((UNIV, euclid_d_real)), euclid_top_of_metric((euclid_euclid(n), euclid_d_euclid)))
      #|  euclid_top_of_metric((UNIV, euclid_d_real))
      #|  -(-(u : Real) + (v : Real)) == u - v
      #|  ((t : Real) => euclid_euclid_scale(real_of_num(1) - t, (y : (Num) -> Real))) == o((t : Real) => euclid_euclid_scale(t, y), o(op_minus_minus, op_plus(-real_of_num(1))))
      #|  \226\136\128 x : (Num) -> Real, \226\136\128 y : (Num) -> Real, \226\136\128 n : Num, euclid_euclid(n, x) && euclid_euclid(n, y) \226\134\146 euclid_continuous((t : Real) => euclid_euclid_scale(t, x) + euclid_euclid_scale(real_of_num(1) - t, y), euclid_top_of_metric((UNIV, euclid_d_real)), euclid_top_of_metric((euclid_euclid(n), euclid_d_euclid)))
      #|  (connected : (((A) -> Bool) -> Bool, (A) -> Bool) -> Bool)((U : ((A) -> Bool) -> Bool), (Z : (A) -> Bool)) == (SUBSET(Z, UNIONS(U)) && (\226\136\128 A : (A) -> Bool, \226\136\128 B : (A) -> Bool, U(A) && U(B) && INTER(A, B) == {} && SUBSET(Z, UNION(A, B)) \226\134\146 SUBSET(Z, A) || SUBSET(Z, B)))
      #|  !(SUBSET((Z2 : (_) -> Bool), (A : (_) -> Bool)) && SUBSET((Z1 : (_) -> Bool), (B : (_) -> Bool)))
      #|  !(SUBSET((Z1 : (_) -> Bool), (A : (_) -> Bool)) && SUBSET((Z2 : (_) -> Bool), (B : (_) -> Bool)))
      #|  (!(b : Bool) \226\134\146 (a : Bool)) \226\134\146 a || b
      #|  (B : _)
      #|  (A : _)
      #|  (B : _)
      #|  (A : _)
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 Z1 : (A) -> Bool, \226\136\128 Z2 : (A) -> Bool, euclid_connected(U, Z1) && euclid_connected(U, Z2) && !(INTER(Z1, Z2) == {}) \226\134\146 euclid_connected(U, UNION(Z1, Z2))
      #|  (component : (((A) -> Bool) -> Bool, A, A) -> Bool)((U : ((A) -> Bool) -> Bool), (x : A), (y : A)) == (\226\136\131 Z : (A) -> Bool, euclid_connected(U, Z) && Z(x) && Z(y))
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 x : A, UNIONS(U, x) \226\134\146 euclid_connected(U, {x})
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 x : A, UNIONS(U, x) \226\134\146 euclid_component(U, x, x)
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 x : A, \226\136\128 y : A, euclid_component(U, x, y) \226\134\146 euclid_component(U, y, x)
      #|  UNION((Z : (_) -> Bool), (Z' : (_) -> Bool))
      #|  (y : _)
      #|  euclid_connected((U : ((_) -> Bool) -> Bool), UNION((Z : (_) -> Bool), (Z' : (_) -> Bool)))
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 x : A, \226\136\128 y : A, \226\136\128 z : A, euclid_component(U, x, y) && euclid_component(U, y, z) \226\134\146 euclid_component(U, x, z)
      #|  SUBSET({(x : Real) | (a' : Real) <= x && x <= (b' : Real)}, {(y : Real) | abs((x : Real) - y) < (e : Real)})
      #|  (d : Bool) \226\134\146 (a : Bool) || (b : Bool) || (C : Bool) || d
      #|  (e : _)
      #|  (x : _)
      #|  (B : _)
      #|  SUBSET({(x : Real) | (a' : Real) <= x && x <= (b' : Real)}, {(y : Real) | abs((x : Real) - y) < (e : Real)})
      #|  (C : Bool) \226\134\146 (a : Bool) || (b : Bool) || C || (d : Bool)
      #|  (e : _)
      #|  (x : _)
      #|  (A : _)
      #|  (A : (_) -> _)((x : _))
      #|  euclid_d_real
      #|  (UNIV : (Real) -> Bool)
      #|  UNION((A : (_) -> Bool), (B : (_) -> Bool), (x : _))
      #|  real_of_num(1)
      #|  (b : Real) < (x : Real)
      #|  real_of_num(1)
      #|  (x : Real) < (a : Real)
      #|  (d : Bool) \226\134\146 (a : Bool) || (b : Bool) || (c : Bool) || d
      #|  (S : (Real) -> Bool) == {(x : Real) | (b' : Real) <= x && x <= (c : Real)}
      #|  (R : (Real) -> Bool) == {(x : Real) | (a' : Real) <= x && x <= (b' : Real)}
      #|  (S : (Real) -> Bool) == {(x : Real) | (b' : Real) <= x && x <= (c : Real)}
      #|  (R : (Real) -> Bool) == {(x : Real) | (a' : Real) <= x && x <= (b' : Real)}
      #|  (c : Bool) \226\134\146 (a : Bool) || (b : Bool) || c || (d : Bool)
      #|  ((b : Real) < (b' : Real) && b' <= (c : Real) \226\134\146 b < c) && ((a' : Real) <= b' && b' < (a : Real) \226\134\146 a' < a)
      #|  UNION({(x : Real) | (a' : Real) <= x && x <= (b' : Real)}, {(x : Real) | b' <= x && x <= (c : Real)}) == {(x : Real) | a' <= x && x <= c}
      #|  {(x : Real) | (b' : Real) <= x && x <= (c : Real)}(b')
      #|  {(x : Real) | (a' : Real) <= x && x <= (b' : Real)}(b')
      #|  (b' : _)
      #|  {(x : Real) | (a : Real) <= x && x <= (b : Real)} == {}
      #|  (a : Real) <= (b : Real)
      #|  !((a : Real) < a)
      #|  (b : _)
      #|  (a : _)
      #|  ((b : Bool) \226\134\146 (c : Bool)) && (a : Bool) \226\134\146 (a \226\134\146 b) \226\134\146 c
      #|  GABS((f : ((Real, Real)) -> Bool) => \226\136\128 u : Real, \226\136\128 v : Real, GEQ(f((u, v)), u < (a : Real) || (b : Real) < v || SUBSET({(x : Real) | u <= x && x <= v}, (A : (Real) -> Bool)) || SUBSET({(x : Real) | u <= x && x <= v}, (B : (Real) -> Bool))))
      #|  \226\136\128 a : Real, \226\136\128 b : Real, euclid_connected(euclid_top_of_metric((UNIV, euclid_d_real)), {(x : Real) | a <= x && x <= b})
      #|  SUBSET((Z : (_) -> Bool), UNION(preimage(UNIONS((U : ((_) -> Bool) -> Bool)), (f : (_) -> _), (A : (_) -> Bool)), preimage(UNIONS(U), f, (B : (_) -> Bool))))
      #|  preimage(UNIONS((U : ((_) -> Bool) -> Bool)), (f : (_) -> _), (B : (_) -> Bool))
      #|  preimage(UNIONS((U : ((_) -> Bool) -> Bool)), (f : (_) -> _), (A : (_) -> Bool))
      #|  (B : _)
      #|  (A : _)
      #|  \226\136\128 f : (A) -> B, \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 V : ((B) -> Bool) -> Bool, \226\136\128 Z : (A) -> Bool, euclid_continuous(f, U, V) && SUBSET(IMAGE(f, Z), UNIONS(V)) && euclid_connected(U, Z) \226\134\146 euclid_connected(V, IMAGE(f, Z))
      #|  (path : (((A) -> Bool) -> Bool, A, A) -> Bool)((U : ((A) -> Bool) -> Bool), (x : A), (y : A)) == (\226\136\131 f : (Real) -> A, \226\136\131 a : Real, \226\136\131 b : Real, euclid_continuous(f, euclid_top_of_metric((UNIV, euclid_d_real)), U) && f(a) == x && f(b) == y)
      #|  {(x : A) | false} == ((x : A) => false)
      #|  (a : Bool) == (b : Bool) \226\134\146 a \226\134\146 b
      #|  (t : (_) -> Bool) == UNIONS((U : ((_) -> Bool) -> Bool))
      #|  (v : (_) -> _)((y : _))
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 V : ((B) -> Bool) -> Bool, \226\136\128 y : B, euclid_topology_(U) \226\134\146 euclid_continuous((x : A) => y, U, V)
      #|  (path_component : (((A) -> Bool) -> Bool, A, A) -> Bool)((U : ((A) -> Bool) -> Bool), (x : A), (y : A)) == (\226\136\131 f : (Real) -> A, \226\136\131 a : Real, \226\136\131 b : Real, euclid_continuous(f, euclid_top_of_metric((UNIV, euclid_d_real)), U) && a < b && f(a) == x && f(b) == y && SUBSET(IMAGE(f, {(t : Real) | a <= t && t <= b}), UNIONS(U)))
      #|  real_of_num(1)
      #|  real_of_num(0)
      #|  (t : Real) => (x : _)
      #|  euclid_d_real
      #|  (UNIV : (Real) -> Bool)
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 x : A, UNIONS(U, x) \226\134\146 euclid_path_component(U, x, x)
      #|  -(x'' : Real)
      #|  (x' : _)
      #|  euclid_top_of_metric((UNIV, euclid_d_real))
      #|  -(a : Real)
      #|  -(b : Real)
      #|  o((f : (Real) -> _), op_minus_minus)
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 x : A, \226\136\128 y : A, euclid_path_component(U, x, y) \226\134\146 euclid_path_component(U, y, x)
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 x : A, \226\136\128 y : A, euclid_path_component(U, x, y) == euclid_path_component(U, y, x)
      #|  !((x' : Real) + ((b : Real) - (a' : Real)) < b)
      #|  (x' : Real) + ((b : Real) - (a' : Real))
      #|  (a' : Real) < (b' : Real) && (a : Real) < (b : Real) && b <= (x' : Real) && x' <= b' + (b - a')
      #|  (a' : Real) - (b : Real) + (x' : Real)
      #|  !((x' : Real) < (b : Real))
      #|  (t : A)
      #|  IMAGE(euclid_joinf((f : (Real) -> _), o((f' : (Real) -> _), op_plus((a' : Real) - (b : Real))), b), {(t : Real) | b <= t && t <= (b' : Real) + (b - a')}) == IMAGE(f', {(t : Real) | a' <= t && t <= b'})
      #|  (a : Real) < (b : Real) \226\134\146 a <= b
      #|  SUBSET(IMAGE((f : (Real) -> _), {(t : Real) | (a : Real) <= t && t < (b : Real)}), IMAGE(f, {(t : Real) | a <= t && t <= b}))
      #|  (x' : _)
      #|  (t : A)
      #|  IMAGE(euclid_joinf((f : (Real) -> _), o((f' : (Real) -> _), op_plus((a' : Real) - (b : Real))), b), {(t : Real) | (a : Real) <= t && t < b}) == IMAGE(f, {(t : Real) | a <= t && t < b})
      #|  (a' : Real) < (b' : Real) && (a : Real) < (b : Real)
      #|  (a : Real) <= (b : Real) && b <= (b' : Real) + (b - (a' : Real))
      #|  (a' : Real) - (b : Real) + ((b' : Real) + (b - a')) == b'
      #|  (a' : Real) < (b' : Real) && (a : Real) < (b : Real)
      #|  !((b' : Real) + ((b : Real) - (a' : Real)) < b)
      #|  euclid_top_of_metric((UNIV, euclid_d_real))
      #|  (b' : Real) + ((b : Real) - (a' : Real))
      #|  (a : _)
      #|  euclid_joinf((f : (Real) -> _), o((f' : (Real) -> _), op_plus((a' : Real) - (b : Real))), b)
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 x : A, \226\136\128 y : A, \226\136\128 z : A, euclid_path_component(U, x, y) && euclid_path_component(U, y, z) \226\134\146 euclid_path_component(U, x, z)
      #|  (loc_path_conn : (((A) -> Bool) -> Bool) -> Bool)((U : ((A) -> Bool) -> Bool)) == (\226\136\128 A : (A) -> Bool, \226\136\128 x : A, U(A) && A(x) \226\134\146 U(euclid_path_component(euclid_induced_top(U, A), x)))
      #|  (A : (_) -> _)((x : _))
      #|  (x : _)
      #|  euclid_path_component((U : ((_) -> Bool) -> Bool), (x' : _))
      #|  (x' : _)
      #|  (A : (_) -> _)((x' : _))
      #|  (x'' : _)
      #|  UNIONS((U : ((_) -> Bool) -> Bool))
      #|  IMAGE((z : _) => euclid_path_component((U : ((_) -> Bool) -> Bool), z), DIFF((Z : (_) -> Bool), (A : (_) -> Bool)))
      #|  ({} : (A) -> Bool)
      #|  ({} : (A) -> Bool)
      #|  UNIONS((U : ((_) -> Bool) -> Bool), (x : _))
      #|  (x : _)
      #|  UNIONS((U : ((_) -> Bool) -> Bool))
      #|  (U : ((_) -> Bool) -> Bool)((A : (_) -> Bool)) && U((B : (_) -> Bool)) && INTER(A, B) == {} && SUBSET((Z : (_) -> Bool), UNION(A, B))
      #|  (B : _)
      #|  (B : (_) -> Bool) == UNIONS(IMAGE((z : _) => euclid_path_component((U : ((_) -> Bool) -> Bool), z), DIFF((Z : (_) -> Bool), (A : (_) -> Bool))))
      #|  (A : (_) -> Bool) == euclid_path_component((U : ((_) -> Bool) -> Bool), (x : _))
      #|  euclid_path_component((U : ((_) -> Bool) -> Bool), (x : _))
      #|  (b : _)
      #|  (a : _)
      #|  euclid_top_of_metric((UNIV, euclid_d_real))
      #|  IMAGE((f : (Real) -> _), {(t : Real) | (a : Real) <= t && t <= (b : Real)})
      #|  (y : A)
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 x : A, euclid_loc_path_conn(U) && euclid_topology_(U) \226\134\146 euclid_path_component(U, x) == euclid_component(U, x)
      #|  TAGB
      #|  TAGB
      #|  TAGB
      #|  (b : Real) <= (a : Real) \226\134\146 a < (C : Real) \226\134\146 b < C
      #|  real_of_num(0) <= (t : Real) && t <= real_of_num(1) \226\134\146 abs(real_of_num(1) - t) <= real_of_num(1)
      #|  euclid_euclid_scale((t : Real), (x : (Num) -> Real))
      #|  euclid_euclid_scale(real_of_num(1) - (t : Real), (y : (Num) -> Real))
      #|  euclid_euclid_scale(real_of_num(1) - (t : Real), (x : (Num) -> Real))
      #|  (n : Num)
      #|  \226\136\128 x : (Num) -> Real, \226\136\128 r : Real, \226\136\128 y : (Num) -> Real, \226\136\128 t : Real, \226\136\128 n : Num, euclid_open_ball((euclid_euclid(n), euclid_d_euclid), x, r, y) && real_of_num(0) <= t && t <= real_of_num(1) \226\134\146 euclid_open_ball((euclid_euclid(n), euclid_d_euclid), x, r, euclid_euclid_scale(t, x) + euclid_euclid_scale(real_of_num(1) - t, y))
      #|  UNIONS(euclid_top_of_metric((euclid_open_ball((euclid_euclid((n : Num)), euclid_d_euclid), (x : (Num) -> Real), (r : Real)), euclid_d_euclid))) == euclid_open_ball((euclid_euclid(n), euclid_d_euclid), x, r)
      #|  euclid_euclid((n : Num), (x : (Num) -> Real)) && euclid_euclid(n, (y : (Num) -> Real))
      #|  euclid_top_of_metric((euclid_open_ball((euclid_euclid((n : Num)), euclid_d_euclid), (x : (Num) -> Real), (r : Real)), euclid_d_euclid)) == euclid_induced_top(euclid_top_of_metric((euclid_euclid(n), euclid_d_euclid)), euclid_open_ball((euclid_euclid(n), euclid_d_euclid), x, r))
      #|  real_of_num(1)
      #|  real_of_num(0)
      #|  (t : Real) => euclid_euclid_scale(t, (x : (Num) -> Real)) + euclid_euclid_scale(real_of_num(1) - t, (y : (Num) -> Real))
      #|  \226\136\128 x : (Num) -> Real, \226\136\128 r : Real, \226\136\128 y : (Num) -> Real, \226\136\128 n : Num, euclid_open_ball((euclid_euclid(n), euclid_d_euclid), x, r, y) \226\134\146 euclid_path_component(euclid_top_of_metric((euclid_open_ball((euclid_euclid(n), euclid_d_euclid), x, r), euclid_d_euclid)), y, x)
      #|  (b : _)
      #|  (a : _)
      #|  (f : _)
      #|  (b : Real) <= b && ((a : Real) < b \226\134\146 a <= b)
      #|  (b : Real) <= (x' : Real) \226\134\146 !(x' < b)
      #|  (a : Real) <= (x' : Real) \226\134\146 !(x' < a)
      #|  (x' : Real) < (b : Real) \226\134\146 x' <= b
      #|  (a : Real) <= (x' : Real) \226\134\146 !(x' < a)
      #|  (x' : Real) < (b : Real) || b <= x'
      #|  (a : Real) <= a && (a < (b : Real) \226\134\146 a <= b)
      #|  (x' : Real) < (a : Real) || a <= x'
      #|  (x' : _)
      #|  (b : _)
      #|  (a : _)
      #|  !((b : Real) < b)
      #|  (a : Real) < (b : Real) \226\134\146 !(b < a)
      #|  !((a : Real) < a)
      #|  (b : _)
      #|  (a : _)
      #|  euclid_joinf((t : Real) => (f : (Real) -> _)((a : Real)), euclid_joinf(f, (t : Real) => f((b : Real)), b), a)
      #|  \226\136\128 U : ((A) -> Bool) -> Bool, \226\136\128 x : A, \226\136\128 y : A, euclid_path_component(U, x, y) == (\226\136\131 f : (Real) -> A, \226\136\131 a : Real, \226\136\131 b : Real, euclid_continuous(f, euclid_top_of_metric((UNIV, euclid_d_real)), U) && a < b && f(a) == x && f(b) == y && SUBSET(IMAGE(f, UNIV), UNIONS(U)))
      #|  SUBSET(IMAGE((f : (_) -> _), UNIV), (X : (_) -> Bool)) && SUBSET(IMAGE(f, UNIV), (Y : (_) -> Bool))
      #|  euclid_metric_space(((Y : (_) -> Bool), (d : (_, _) -> Real)))
      #|  (b : _)
      #|  (a : _)
      #|  (f : _)
      #|  \226\136\128 X : (A) -> Bool, \226\136\128 Y : (A) -> Bool, \226\136\128 d : (A, A) -> Real, \226\136\128 y : A, SUBSET(Y, X) && euclid_metric_space((X, d)) && Y(y) \226\134\146 SUBSET(euclid_path_component(euclid_top_of_metric((Y, d)), y), euclid_path_component(euclid_top_of_metric((X, d)), y))
      #|  (a : Real) < (b : Real) \226\134\146 a <= b && b <= b
      #|  (b : _)
      #|  \226\136\128 x : A, \226\136\128 y : A, \226\136\128 U : ((A) -> Bool) -> Bool, euclid_path_component(U, x, y) \226\134\146 UNIONS(U, y)
      #|  \226\136\128 A : (A) -> Bool, \226\136\128 B : (A) -> Bool, \226\136\128 C : (A) -> Bool, SUBSET(B, C) \226\134\146 SUBSET(A, B) \226\134\146 SUBSET(A, C)
      #|  \226\136\128 A : (A) -> Bool, \226\136\128 B : (A) -> Bool, \226\136\128 C : (A) -> Bool, SUBSET(A, B) \226\134\146 SUBSET(B, C) \226\134\146 SUBSET(A, C)
      #|  \226\136\128 A : (A) -> Bool, \226\136\128 B : (A) -> Bool, \226\136\128 C : (A) -> Bool, SUBSET(B, C) \226\134\146 SUBSET(A, B) \226\134\146 SUBSET(A, C)
      #|  SUBSET(euclid_open_ball((euclid_euclid((n : Num)), euclid_d_euclid), (a : (Num) -> Real), (r : Real)), euclid_path_component(euclid_top_of_metric((euclid_open_ball((euclid_euclid(n), euclid_d_euclid), a, r), euclid_d_euclid)), a))
      #|  SUBSET(euclid_open_ball((euclid_euclid((n : Num)), euclid_d_euclid), (a : (Num) -> Real), (r : Real)), euclid_path_component(euclid_top_of_metric(((A' : ((Num) -> Real) -> Bool), euclid_d_euclid)), a))
      #|  SUBSET(euclid_open_ball(((A : ((Num) -> Real) -> Bool), euclid_d_euclid), (a : (Num) -> Real), (r : Real)), euclid_path_component(euclid_top_of_metric(((A' : ((Num) -> Real) -> Bool), euclid_d_euclid)), a))
      #|  (r : _)
      #|  (a : _)
      #|  (A : _)
      #|  euclid_top_of_metric((euclid_euclid((n : Num)), euclid_d_euclid), (A' : ((Num) -> Real) -> Bool))
      #|  SUBSET((A : ((Num) -> Real) -> Bool), euclid_euclid((n : Num)))
      #|  (A' : (_) -> _)((a : _))
      #|  (b : Real) <= b && ((a : Real) < b \226\134\146 a <= b)
      #|  (b : _)
      #|  euclid_metric_space(((A' : ((Num) -> Real) -> Bool), euclid_d_euclid))
      #|  SUBSET((A' : (_) -> Bool), (A : (_) -> Bool))
      #|  euclid_euclid((n : Num))
      #|  euclid_metric_space(((A : ((Num) -> Real) -> Bool), euclid_d_euclid))
      #|  \226\136\128 n : Num, \226\136\128 A : ((Num) -> Real) -> Bool, euclid_top_of_metric((euclid_euclid(n), euclid_d_euclid), A) \226\134\146 euclid_loc_path_conn(euclid_top_of_metric((A, euclid_d_euclid)))
      #|  \226\136\128 n : Num, \226\136\128 A : ((Num) -> Real) -> Bool, euclid_top_of_metric((euclid_euclid(n), euclid_d_euclid), A) \226\134\146 euclid_path_component(euclid_top_of_metric((A, euclid_d_euclid))) == euclid_component(euclid_top_of_metric((A, euclid_d_euclid)))
      #|Q_ELIM_THM =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\P:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\Q:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\R:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('B,bool),bool) (\u:'B. ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) u:'B) (P:fun('A,'B) x:'A))) (Q:fun('A,bool) x:'A))))) (R:fun('B,bool) u:'B))))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) (Q:fun('A,bool) x:'A)) (R:fun('B,bool) (P:fun('A,'B) x:'A))))))))))))
      #|Q_ELIM_THM' =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\Q:fun('A,'B). (#forall:fun(fun(fun('B,bool),bool),bool) (\R:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\t:'B. ((#==>:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#=:fun('B,fun('B,bool)) t:'B) (Q:fun('A,'B) x:'A)))))) (R:fun('B,bool) t:'B))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (R:fun('B,bool) (Q:fun('A,'B) x:'A))))))))))))
      #|Q_ELIM_THM'' =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\Q:fun('A,'B). (#forall:fun(fun(fun('B,bool),bool),bool) (\R:fun('B,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('B,bool),bool) (\t:'B. ((#==>:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) t:'B) (Q:fun('A,'B) x:'A))) (P:fun('A,bool) x:'A))))) (R:fun('B,bool) t:'B))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (R:fun('B,bool) (Q:fun('A,'B) x:'A))))))))))))
      #|DIFF_SUBSET =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) X:fun('A,bool)) B:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) X:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) A:fun('A,bool)) B:fun('A,bool))) #EMPTY:fun('A,bool))))))))))
      #|SUBSET_INTERS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\X:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) X:fun(fun('A,bool),bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\x:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (X:fun(fun('A,bool),bool) x:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) x:fun('A,bool))))))))))
      #|DIFF_INTER =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\C:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) A:fun('A,bool)) B:fun('A,bool))) C:fun('A,bool))) #EMPTY:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) A:fun('A,bool)) C:fun('A,bool))) B:fun('A,bool)))))))))
      #|SUB_IMP_INTER =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\C:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) B:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) A:fun('A,bool)) C:fun('A,bool))) B:fun('A,bool)))) ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) B:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) C:fun('A,bool)) A:fun('A,bool))) B:fun('A,bool))))))))))
      #|SUBSET_UNIONS_INSERT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\C:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#INSERT:fun(fun('A,bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) B:fun('A,bool)) C:fun(fun('A,bool),bool))))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) A:fun('A,bool)) B:fun('A,bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) C:fun(fun('A,bool),bool))))))))))
      #|UNIONS_DELETE2 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\B:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\C:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) B:fun(fun('A,bool),bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) A:fun('A,bool)) C:fun('A,bool))) #EMPTY:fun('A,bool)))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#DELETE:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) B:fun(fun('A,bool),bool)) C:fun('A,bool)))))))))))
      #|finite_subset =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('B,bool),bool),bool) (\B:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) B:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) A:fun('A,bool)))) (#FINITE:fun(fun('B,bool),bool) B:fun('B,bool)))) (#?:fun(fun(fun('A,bool),bool),bool) (\C:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) C:fun('A,bool)) A:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) C:fun('A,bool))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) B:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) C:fun('A,bool))))))))))))))
      #|inters_singleton =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#INSERT:fun(fun('A,bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) A:fun('A,bool)) #EMPTY:fun(fun('A,bool),bool)))) A:fun('A,bool))))
      #|delete_empty =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#DELETE:fun(fun('A,bool),fun('A,fun('A,bool))) A:fun('A,bool)) x:'A)) #EMPTY:fun('A,bool))) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) #EMPTY:fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) #EMPTY:fun('A,bool)))))))))
      #|inters_subset =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\A:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\B:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) A:fun(fun('A,bool),bool)) B:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) B:fun(fun('A,bool),bool))) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) A:fun(fun('A,bool),bool))))))))
      #|delete_inters =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\V:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (V:fun(fun('A,bool),bool) u:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) V:fun(fun('A,bool),bool))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#DELETE:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) V:fun(fun('A,bool),bool)) u:fun('A,bool)))) u:fun('A,bool))))))))
      #|EQ_EMPTY =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) #EMPTY:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#~:fun(bool,bool) (A:fun('A,bool) x:'A)))))))
      #|UNIONS_EQ_EMPTY =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))) #EMPTY:fun('A,bool))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) U:fun(fun('A,bool),bool)) #EMPTY:fun(fun('A,bool),bool))) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) U:fun(fun('A,bool),bool)) ((#INSERT:fun(fun('A,bool),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) #EMPTY:fun('A,bool)) #EMPTY:fun(fun('A,bool),bool)))))))
      #|INTERS_EQ_EMPTY =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\A:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) A:fun(fun('A,bool),bool))) #EMPTY:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (A:fun(fun('A,bool),bool) a:fun('A,bool))) (#~:fun(bool,bool) (a:fun('A,bool) x:'A))))))))))
      #|CARD_SING_CONV =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#HAS_SIZE:fun(fun('A,bool),fun(num,bool)) X:fun('A,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#SING:fun(fun('A,bool),bool) X:fun('A,bool)))))
      #|countable_prod =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\B:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) A:fun('A,bool))) (#COUNTABLE:fun(fun('B,bool),bool) B:fun('B,bool)))) (#COUNTABLE:fun(fun(prod('A,'B),bool),bool) (#GSPEC:fun(fun(prod('A,'B),bool),fun(prod('A,'B),bool)) (\GEN%PVAR%1:prod('A,'B). (#?:fun(fun('A,bool),bool) (\a:'A. (#?:fun(fun('B,bool),bool) (\b:'B. (((#SETSPEC:fun(prod('A,'B),fun(bool,fun(prod('A,'B),bool))) GEN%PVAR%1:prod('A,'B)) ((#/\:fun(bool,fun(bool,bool)) (A:fun('A,bool) a:'A)) (B:fun('B,bool) b:'B))) ((#,:fun('A,fun('B,prod('A,'B))) a:'A) b:'B))))))))))))))
      #|IMAGE_I =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#IMAGE:fun(fun('A,'A),fun(fun('A,bool),fun('A,bool))) #I:fun('A,'A)) A:fun('A,bool))) A:fun('A,bool))))
      #|EMPTY_NOT_EXISTS =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) X:fun('A,bool)) #EMPTY:fun('A,bool))) (#~:fun(bool,bool) (#?:fun(fun('A,bool),bool) (\u:'A. (X:fun('A,bool) u:'A)))))))
      #|DIFF_SURJ =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\Y:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) (((#BIJ:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,'B)) X:fun('A,bool)) Y:fun('B,bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) X:fun('A,bool))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) X:fun('A,bool)) t:fun('A,bool)))) ((#DIFF:fun(fun('B,bool),fun(fun('B,bool),fun('B,bool))) Y:fun('B,bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) t:fun('A,bool))))))))))))))
      #|union_subset =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\Z1:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\Z2:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) Z1:fun('A,bool)) Z2:fun('A,bool))) A:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z1:fun('A,bool)) A:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z2:fun('A,bool)) A:fun('A,bool))))))))))
      #|preimage_disjoint =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('B,bool),bool),bool) (\A:fun('B,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\B:fun('B,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#INTER:fun(fun('B,bool),fun(fun('B,bool),fun('B,bool))) A:fun('B,bool)) B:fun('B,bool))) #EMPTY:fun('B,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (((#preimage:fun(fun('A,bool),fun(fun('A,'B),fun(fun('B,bool),fun('A,bool)))) X:fun('A,bool)) f:fun('A,'B)) A:fun('B,bool))) (((#preimage:fun(fun('A,bool),fun(fun('A,'B),fun(fun('B,bool),fun('A,bool)))) X:fun('A,bool)) f:fun('A,'B)) B:fun('B,bool)))) #EMPTY:fun('A,bool)))))))))))
      #|preimage_union =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('B,bool),bool),bool) (\A:fun('B,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\B:fun('B,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\Z:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (((#preimage:fun(fun('A,bool),fun(fun('A,'B),fun(fun('B,bool),fun('A,bool)))) X:fun('A,bool)) f:fun('A,'B)) A:fun('B,bool))) (((#preimage:fun(fun('A,bool),fun(fun('A,'B),fun(fun('B,bool),fun('A,bool)))) X:fun('A,bool)) f:fun('A,'B)) B:fun('B,bool))))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) X:fun('A,bool))) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) Z:fun('A,bool))) ((#UNION:fun(fun('B,bool),fun(fun('B,bool),fun('B,bool))) A:fun('B,bool)) B:fun('B,bool)))))))))))))))
      #|subset_preimage =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('B,bool),bool),bool) (\A:fun('B,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\Z:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) (((#preimage:fun(fun('A,bool),fun(fun('A,'B),fun(fun('B,bool),fun('A,bool)))) X:fun('A,bool)) f:fun('A,'B)) A:fun('B,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) X:fun('A,bool))) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) Z:fun('A,bool))) A:fun('B,bool))))))))))))
      #|preimage_unions =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\dom:fun('A,bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun(fun('B,bool),bool),bool),bool) (\C:fun(fun('B,bool),bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#preimage:fun(fun('A,bool),fun(fun('A,'B),fun(fun('B,bool),fun('A,bool)))) dom:fun('A,bool)) f:fun('A,'B)) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) C:fun(fun('B,bool),bool)))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#IMAGE:fun(fun(fun('B,bool),fun('A,bool)),fun(fun(fun('B,bool),bool),fun(fun('A,bool),bool))) ((#preimage:fun(fun('A,bool),fun(fun('A,'B),fun(fun('B,bool),fun('A,bool)))) dom:fun('A,bool)) f:fun('A,'B))) C:fun(fun('B,bool),bool))))))))))
      #|preimage_subset =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\A:fun('B,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\B:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) A:fun('B,bool)) B:fun('B,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#preimage:fun(fun('A,bool),fun(fun('A,'B),fun(fun('B,bool),fun('A,bool)))) X:fun('A,bool)) f:fun('A,'B)) A:fun('B,bool))) (((#preimage:fun(fun('A,bool),fun(fun('A,'B),fun(fun('B,bool),fun('A,bool)))) X:fun('A,bool)) f:fun('A,'B)) B:fun('B,bool))))))))))))
      #|INTER_THM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun(fun('A,bool),fun('A,bool)),fun(fun(fun('A,bool),fun('A,bool)),bool)) (\B:fun('A,bool). ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) B:fun('A,bool)) X:fun('A,bool)))) (#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) X:fun('A,bool)))) ((#=:fun(fun(fun('A,bool),fun('A,bool)),fun(fun(fun('A,bool),fun('A,bool)),bool)) (\B:fun('A,bool). ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) X:fun('A,bool)) B:fun('A,bool)))) (#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) X:fun('A,bool))))))
      #|REAL_SUM_SQUARE_POS =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (x:fun(num,real) i:num)) (x:fun(num,real) i:num)))))))))))
      #|twopow_pos =  |- (#forall:fun(fun(int,bool),bool) (\n:int. ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#twopow:fun(int,real) n:int))))
      #|twopow_double =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#twopow:fun(int,real) (#int_neg:fun(int,int) (#int_of_num:fun(num,int) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (#twopow:fun(int,real) (#int_neg:fun(int,int) (#int_of_num:fun(num,int) n:num))))))
      #|min_finite =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\X:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(real,bool),bool) X:fun(real,bool))) (#~:fun(bool,bool) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) X:fun(real,bool)) #EMPTY:fun(real,bool))))) (#?:fun(fun(real,bool),bool) (\delta:real. ((#/\:fun(bool,fun(bool,bool)) (X:fun(real,bool) delta:real)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (X:fun(real,bool) x:real)) ((#real_le:fun(real,fun(real,bool)) delta:real) x:real))))))))))
      #|min_finite_delta =  |- (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(fun(real,bool),bool),bool) (\X:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(real,bool),bool) X:fun(real,bool))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (X:fun(real,bool) x:real)) ((#real_lt:fun(real,fun(real,bool)) c:real) x:real)))))) (#?:fun(fun(real,bool),bool) (\delta:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) c:real) delta:real)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (X:fun(real,bool) x:real)) ((#real_le:fun(real,fun(real,bool)) delta:real) x:real))))))))))))
      #|union_closed_interval =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#real_le:fun(real,fun(real,bool)) b:real) c:real))) ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) ((#UNION:fun(fun(real,bool),fun(fun(real,bool),fun(real,bool))) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%2:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%2:real) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) b:real))) x:real)))))) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%3:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%3:real) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) b:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) c:real))) x:real))))))) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%4:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%4:real) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) c:real))) x:real)))))))))))))
      #|real_half_LT =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_div:fun(real,fun(real,real)) z:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_lt:fun(real,fun(real,bool)) y:real) ((#real_div:fun(real,fun(real,real)) z:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) z:real))))))))
      #|real_half_LE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) ((#real_div:fun(real,fun(real,real)) z:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_le:fun(real,fun(real,bool)) y:real) ((#real_div:fun(real,fun(real,real)) z:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) z:real))))))))
      #|real_half_EL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) ((#real_div:fun(real,fun(real,real)) z:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_lt:fun(real,fun(real,bool)) y:real) ((#real_div:fun(real,fun(real,real)) z:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_lt:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) z:real))))))))
      #|real_half_LLE =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) ((#real_div:fun(real,fun(real,real)) z:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_le:fun(real,fun(real,bool)) y:real) ((#real_div:fun(real,fun(real,real)) z:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_le:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) z:real))))))))
      #|interval_finite =  |- (#forall:fun(fun(num,bool),bool) (\N:num. (#FINITE:fun(fun(real,bool),bool) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%5:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%5:real) (#?:fun(fun(num,bool),bool) (\j:num. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) j:num))) ((#<=:fun(num,fun(num,bool)) j:num) N:num))))) x:real))))))))
      #|euclid_add_closure =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) f:fun(num,real))) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) g:fun(num,real)))) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) ((#euclid_euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real))))))))))
      #|euclid_scale_closure =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\t:real. (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) f:fun(num,real))) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) ((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) t:real) f:fun(num,real))))))))))
      #|euclid_neg_closure =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) f:fun(num,real))) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) (#euclid_euclid_neg:fun(fun(num,real),fun(num,real)) f:fun(num,real))))))))
      #|euclid_sub_closure =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) f:fun(num,real))) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) g:fun(num,real)))) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) ((#euclid_euclid_minus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real))))))))))
      #|neg_dim =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) f:fun(num,real))) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) (#euclid_euclid_neg:fun(fun(num,real),fun(num,real)) f:fun(num,real))))))))
      #|euclid_updim =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) m:num) f:fun(num,real)))) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) f:fun(num,real)))))))))
      #|euclidean_add_closure =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_euclidean:fun(fun(num,real),bool) f:fun(num,real))) (#euclid_euclidean:fun(fun(num,real),bool) g:fun(num,real)))) (#euclid_euclidean:fun(fun(num,real),bool) ((#euclid_euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real))))))))
      #|euclidean_sub_closure =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_euclidean:fun(fun(num,real),bool) f:fun(num,real))) (#euclid_euclidean:fun(fun(num,real),bool) g:fun(num,real)))) (#euclid_euclidean:fun(fun(num,real),bool) ((#euclid_euclid_minus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real))))))))
      #|euclidean_scale_closure =  |- (#forall:fun(fun(real,bool),bool) (\s:real. (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) (#euclid_euclidean:fun(fun(num,real),bool) f:fun(num,real))) (#euclid_euclidean:fun(fun(num,real),bool) ((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) s:real) f:fun(num,real))))))))
      #|euclidean_neg_closure =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) (#euclid_euclidean:fun(fun(num,real),bool) f:fun(num,real))) (#euclid_euclidean:fun(fun(num,real),bool) (#euclid_euclid_neg:fun(fun(num,real),fun(num,real)) f:fun(num,real))))))
      #|euclid_add_comm =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#=:fun(fun(num,real),fun(fun(num,real),bool)) ((#euclid_euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real))) ((#euclid_euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) g:fun(num,real)) f:fun(num,real)))))))
      #|euclid_add_assoc =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\h:fun(num,real). ((#=:fun(fun(num,real),fun(fun(num,real),bool)) ((#euclid_euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) ((#euclid_euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real))) h:fun(num,real))) ((#euclid_euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) ((#euclid_euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) g:fun(num,real)) h:fun(num,real))))))))))
      #|euclid_lzero =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(fun(num,real),fun(fun(num,real),bool)) ((#euclid_euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) #euclid_euclid0:fun(num,real)) f:fun(num,real))) f:fun(num,real))))
      #|euclid_rzero =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(fun(num,real),fun(fun(num,real),bool)) ((#euclid_euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) #euclid_euclid0:fun(num,real))) f:fun(num,real))))
      #|euclid_ldistrib =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#forall:fun(fun(real,bool),bool) (\r:real. ((#=:fun(fun(num,real),fun(fun(num,real),bool)) ((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) r:real) ((#euclid_euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real)))) ((#euclid_euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) ((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) r:real) f:fun(num,real))) ((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) r:real) g:fun(num,real))))))))))
      #|euclid_rdistrib =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(real,bool),bool) (\r:real. (#forall:fun(fun(real,bool),bool) (\s:real. ((#=:fun(fun(num,real),fun(fun(num,real),bool)) ((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) ((#real_add:fun(real,fun(real,real)) r:real) s:real)) f:fun(num,real))) ((#euclid_euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) ((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) r:real) f:fun(num,real))) ((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) s:real) f:fun(num,real))))))))))
      #|euclid_scale_act =  |- (#forall:fun(fun(real,bool),bool) (\r:real. (#forall:fun(fun(real,bool),bool) (\s:real. (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(fun(num,real),fun(fun(num,real),bool)) ((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) r:real) ((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) s:real) f:fun(num,real)))) ((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) ((#real_mul:fun(real,fun(real,real)) r:real) s:real)) f:fun(num,real)))))))))
      #|euclid_scale_one =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(fun(num,real),fun(fun(num,real),bool)) ((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) f:fun(num,real))) f:fun(num,real))))
      #|euclid_neg_sum =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). ((#=:fun(fun(num,real),fun(fun(num,real),bool)) ((#euclid_euclid_minus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) (#euclid_euclid_neg:fun(fun(num,real),fun(num,real)) x:fun(num,real))) (#euclid_euclid_neg:fun(fun(num,real),fun(num,real)) y:fun(num,real)))) (#euclid_euclid_neg:fun(fun(num,real),fun(num,real)) ((#euclid_euclid_minus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) x:fun(num,real)) y:fun(num,real))))))))
      #|trivial_lin_combo =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(real,bool),bool) (\t:real. ((#=:fun(fun(num,real),fun(fun(num,real),bool)) ((#euclid_euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) ((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) t:real) x:fun(num,real))) ((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) t:real)) x:fun(num,real)))) x:fun(num,real))))))
      #|dot_euclid =  |- (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) p:num) f:fun(num,real))) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) p:num) g:fun(num,real)))) ((#=:fun(real,fun(real,bool)) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) g:fun(num,real))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) p:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) i:num)) (g:fun(num,real) i:num))))))))))))
      #|dot_updim =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) n:num)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) m:num) f:fun(num,real))) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) m:num) g:fun(num,real))))) ((#=:fun(real,fun(real,bool)) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) g:fun(num,real))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) i:num)) (g:fun(num,real) i:num))))))))))))))
      #|dot_nonneg =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) f:fun(num,real)))))
      #|dot_comm =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#=:fun(real,fun(real,bool)) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) g:fun(num,real))) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) g:fun(num,real)) f:fun(num,real)))))))
      #|dot_neg =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#=:fun(real,fun(real,bool)) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) (#euclid_euclid_neg:fun(fun(num,real),fun(num,real)) f:fun(num,real))) g:fun(num,real))) (#real_neg:fun(real,real) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) g:fun(num,real))))))))
      #|dot_neg2 =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#=:fun(real,fun(real,bool)) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) (#euclid_euclid_neg:fun(fun(num,real),fun(num,real)) g:fun(num,real)))) (#real_neg:fun(real,real) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) g:fun(num,real))))))))
      #|dot_scale =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#forall:fun(fun(real,bool),bool) (\s:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) f:fun(num,real))) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) g:fun(num,real)))) ((#=:fun(real,fun(real,bool)) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) ((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) s:real) f:fun(num,real))) g:fun(num,real))) ((#real_mul:fun(real,fun(real,real)) s:real) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) g:fun(num,real)))))))))))))
      #|dot_scale_euclidean =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#forall:fun(fun(real,bool),bool) (\s:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_euclidean:fun(fun(num,real),bool) f:fun(num,real))) (#euclid_euclidean:fun(fun(num,real),bool) g:fun(num,real)))) ((#=:fun(real,fun(real,bool)) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) ((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) s:real) f:fun(num,real))) g:fun(num,real))) ((#real_mul:fun(real,fun(real,real)) s:real) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) g:fun(num,real)))))))))))
      #|dot_scale2 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#forall:fun(fun(real,bool),bool) (\s:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) f:fun(num,real))) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) g:fun(num,real)))) ((#=:fun(real,fun(real,bool)) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) ((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) s:real) g:fun(num,real)))) ((#real_mul:fun(real,fun(real,real)) s:real) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) g:fun(num,real)))))))))))))
      #|dot_scale2_euclidean =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#forall:fun(fun(real,bool),bool) (\s:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_euclidean:fun(fun(num,real),bool) f:fun(num,real))) (#euclid_euclidean:fun(fun(num,real),bool) g:fun(num,real)))) ((#=:fun(real,fun(real,bool)) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) ((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) s:real) g:fun(num,real)))) ((#real_mul:fun(real,fun(real,real)) s:real) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) g:fun(num,real)))))))))))
      #|dot_linear =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\h:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) f:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) g:fun(num,real))) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) h:fun(num,real))))) ((#=:fun(real,fun(real,bool)) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) ((#euclid_euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real))) h:fun(num,real))) ((#real_add:fun(real,fun(real,real)) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) h:fun(num,real))) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) g:fun(num,real)) h:fun(num,real)))))))))))))
      #|dot_minus_linear =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\h:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) f:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) g:fun(num,real))) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) h:fun(num,real))))) ((#=:fun(real,fun(real,bool)) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) ((#euclid_euclid_minus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real))) h:fun(num,real))) ((#real_sub:fun(real,fun(real,real)) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) h:fun(num,real))) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) g:fun(num,real)) h:fun(num,real)))))))))))))
      #|dot_linear_euclidean =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\h:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_euclidean:fun(fun(num,real),bool) f:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) (#euclid_euclidean:fun(fun(num,real),bool) g:fun(num,real))) (#euclid_euclidean:fun(fun(num,real),bool) h:fun(num,real))))) ((#=:fun(real,fun(real,bool)) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) ((#euclid_euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real))) h:fun(num,real))) ((#real_add:fun(real,fun(real,real)) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) h:fun(num,real))) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) g:fun(num,real)) h:fun(num,real)))))))))))
      #|dot_minus_linear_euclidean =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\h:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_euclidean:fun(fun(num,real),bool) f:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) (#euclid_euclidean:fun(fun(num,real),bool) g:fun(num,real))) (#euclid_euclidean:fun(fun(num,real),bool) h:fun(num,real))))) ((#=:fun(real,fun(real,bool)) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) ((#euclid_euclid_minus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real))) h:fun(num,real))) ((#real_sub:fun(real,fun(real,real)) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) h:fun(num,real))) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) g:fun(num,real)) h:fun(num,real)))))))))))
      #|dot_linear2 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\h:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) f:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) g:fun(num,real))) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) h:fun(num,real))))) ((#=:fun(real,fun(real,bool)) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) h:fun(num,real)) ((#euclid_euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real)))) ((#real_add:fun(real,fun(real,real)) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) h:fun(num,real)) f:fun(num,real))) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) h:fun(num,real)) g:fun(num,real)))))))))))))
      #|dot_linear2_euclidean =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\h:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_euclidean:fun(fun(num,real),bool) f:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) (#euclid_euclidean:fun(fun(num,real),bool) g:fun(num,real))) (#euclid_euclidean:fun(fun(num,real),bool) h:fun(num,real))))) ((#=:fun(real,fun(real,bool)) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) h:fun(num,real)) ((#euclid_euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real)))) ((#real_add:fun(real,fun(real,real)) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) h:fun(num,real)) f:fun(num,real))) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) h:fun(num,real)) g:fun(num,real)))))))))))
      #|dot_minus_linear2 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\h:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) f:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) g:fun(num,real))) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) h:fun(num,real))))) ((#=:fun(real,fun(real,bool)) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) h:fun(num,real)) ((#euclid_euclid_minus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real)))) ((#real_sub:fun(real,fun(real,real)) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) h:fun(num,real)) f:fun(num,real))) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) h:fun(num,real)) g:fun(num,real)))))))))))))
      #|dot_minus_linear2_euclidean =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\h:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_euclidean:fun(fun(num,real),bool) f:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) (#euclid_euclidean:fun(fun(num,real),bool) g:fun(num,real))) (#euclid_euclidean:fun(fun(num,real),bool) h:fun(num,real))))) ((#=:fun(real,fun(real,bool)) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) h:fun(num,real)) ((#euclid_euclid_minus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real)))) ((#real_sub:fun(real,fun(real,real)) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) h:fun(num,real)) f:fun(num,real))) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) h:fun(num,real)) g:fun(num,real)))))))))))
      #|dot_rzero =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(real,fun(real,bool)) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) #euclid_euclid0:fun(num,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))
      #|dot_lzero =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(real,fun(real,bool)) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) #euclid_euclid0:fun(num,real)) f:fun(num,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))
      #|dot_zero =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) f:fun(num,real))) ((#=:fun(real,fun(real,bool)) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) f:fun(num,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(fun(num,real),fun(fun(num,real),bool)) f:fun(num,real)) #euclid_euclid0:fun(num,real)))))))
      #|dot_zero_euclidean =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_euclidean:fun(fun(num,real),bool) f:fun(num,real))) ((#=:fun(real,fun(real,bool)) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) f:fun(num,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(fun(num,real),fun(fun(num,real),bool)) f:fun(num,real)) #euclid_euclid0:fun(num,real)))))
      #|norm_nonneg =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#euclid_norm:fun(fun(num,real),real) f:fun(num,real)))))
      #|norm_neg =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#=:fun(real,fun(real,bool)) (#euclid_norm:fun(fun(num,real),real) (#euclid_euclid_neg:fun(fun(num,real),fun(num,real)) f:fun(num,real)))) (#euclid_norm:fun(fun(num,real),real) f:fun(num,real)))))
      #|cauchy_schwartz =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_euclidean:fun(fun(num,real),bool) f:fun(num,real))) (#euclid_euclidean:fun(fun(num,real),bool) g:fun(num,real)))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) f:fun(num,real)) g:fun(num,real)))) ((#real_mul:fun(real,fun(real,real)) (#euclid_norm:fun(fun(num,real),real) f:fun(num,real))) (#euclid_norm:fun(fun(num,real),real) g:fun(num,real)))))))))
      #|norm_dot =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\h:fun(num,real). ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (#euclid_norm:fun(fun(num,real),real) h:fun(num,real))) (#euclid_norm:fun(fun(num,real),real) h:fun(num,real)))) ((#euclid_dot:fun(fun(num,real),fun(fun(num,real),real)) h:fun(num,real)) h:fun(num,real)))))
      #|norm_triangle =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\g:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_euclidean:fun(fun(num,real),bool) f:fun(num,real))) (#euclid_euclidean:fun(fun(num,real),bool) g:fun(num,real)))) ((#real_le:fun(real,fun(real,bool)) (#euclid_norm:fun(fun(num,real),real) ((#euclid_euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) f:fun(num,real)) g:fun(num,real)))) ((#real_add:fun(real,fun(real,real)) (#euclid_norm:fun(fun(num,real),real) f:fun(num,real))) (#euclid_norm:fun(fun(num,real),real) g:fun(num,real)))))))))
      #|metric_space_zero =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (X:fun('A,bool) a:'A))) ((#=:fun(real,fun(real,bool)) ((d:fun('A,fun('A,real)) a:'A) a:'A)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|metric_space_symm =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('A,bool),bool) (\b:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) (X:fun('A,bool) a:'A)) (X:fun('A,bool) b:'A)))) ((#=:fun(real,fun(real,bool)) ((d:fun('A,fun('A,real)) a:'A) b:'A)) ((d:fun('A,fun('A,real)) b:'A) a:'A)))))))))))
      #|metric_space_triangle =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('A,bool),bool) (\b:'A. (#forall:fun(fun('A,bool),bool) (\c:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) (X:fun('A,bool) a:'A)) ((#/\:fun(bool,fun(bool,bool)) (X:fun('A,bool) b:'A)) (X:fun('A,bool) c:'A))))) ((#real_le:fun(real,fun(real,bool)) ((d:fun('A,fun('A,real)) a:'A) c:'A)) ((#real_add:fun(real,fun(real,real)) ((d:fun('A,fun('A,real)) a:'A) b:'A)) ((d:fun('A,fun('A,real)) b:'A) c:'A))))))))))))))
      #|metric_subspace =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\Y:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Y:fun('A,bool)) X:fun('A,bool))) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) Y:fun('A,bool)) d:fun('A,fun('A,real)))))))))))
      #|metric_euclidean =  |- (#euclid_metric_space:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),bool) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) #euclid_euclidean:fun(fun(num,real),bool)) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real))))
      #|metric_euclid =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#euclid_metric_space:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),bool) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real))))))
      #|euclid1_abs =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) x:fun(num,real))) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) y:fun(num,real)))) ((#=:fun(real,fun(real,bool)) ((#euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)) x:fun(num,real)) y:fun(num,real))) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (x:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (y:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|coord_dirac =  |- (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(real,bool),bool) (\t:real. ((#=:fun(real,fun(real,bool)) ((#euclid_coord:fun(num,fun(fun(num,real),real)) i:num) ((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) t:real) (#dirac_delta:fun(num,fun(num,real)) i:num)))) t:real)))))
      #|dirac_0 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) x:real) (#dirac_delta:fun(num,fun(num,real)) (#NUMERAL:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) #_0:num))) x:real)))
      #|euclid1_dirac =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). ((#=:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) x:fun(num,real))) ((#=:fun(fun(num,real),fun(fun(num,real),bool)) x:fun(num,real)) ((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) (x:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (#dirac_delta:fun(num,fun(num,real)) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|proj =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(num,bool),bool) (\i:num. ((#=:fun(fun(num,real),fun(fun(num,real),bool)) ((#euclid_proj:fun(num,fun(fun(num,real),fun(num,real))) i:num) x:fun(num,real))) (\j:num. (((#COND:fun(bool,fun(real,fun(real,real))) ((#=:fun(num,fun(num,bool)) j:num) (#NUMERAL:fun(num,num) #_0:num))) (x:fun(num,real) i:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))))
      #|proj_euclid1 =  |- (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) ((#euclid_proj:fun(num,fun(fun(num,real),fun(num,real))) i:num) x:fun(num,real)))))))
      #|d_euclid_n =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) x:fun(num,real))) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) y:fun(num,real)))) ((#=:fun(real,fun(real,bool)) ((#euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)) x:fun(num,real)) y:fun(num,real))) (#sqrt:fun(real,real) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) (x:fun(num,real) i:num)) (y:fun(num,real) i:num))) ((#real_sub:fun(real,fun(real,real)) (x:fun(num,real) i:num)) (y:fun(num,real) i:num))))))))))))))
      #|norm_n =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) x:fun(num,real))) ((#=:fun(real,fun(real,bool)) (#euclid_norm:fun(fun(num,real),real) x:fun(num,real))) (#sqrt:fun(real,real) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (x:fun(num,real) i:num)) (x:fun(num,real) i:num)))))))))))
      #|proj_d_euclid =  |- (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). ((#=:fun(real,fun(real,bool)) ((#euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)) ((#euclid_proj:fun(num,fun(fun(num,real),fun(num,real))) i:num) x:fun(num,real))) ((#euclid_proj:fun(num,fun(fun(num,real),fun(num,real))) i:num) y:fun(num,real)))) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (x:fun(num,real) i:num)) (y:fun(num,real) i:num))))))))))
      #|d_euclid_pos =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) x:fun(num,real))) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) y:fun(num,real)))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)) x:fun(num,real)) y:fun(num,real))))))))))
      #|proj_contraction =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) x:fun(num,real))) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) y:fun(num,real)))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (x:fun(num,real) i:num)) (y:fun(num,real) i:num)))) ((#euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)) x:fun(num,real)) y:fun(num,real))))))))))))
      #|euclid_dirac =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) ((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) x:real) (#dirac_delta:fun(num,fun(num,real)) (#NUMERAL:fun(num,num) #_0:num))))))
      #|d_euclid_pow2 =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) x:fun(num,real))) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) y:fun(num,real)))) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) ((#euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)) x:fun(num,real)) y:fun(num,real))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#psum:fun(prod(num,num),fun(fun(num,real),real)) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) (x:fun(num,real) i:num)) (y:fun(num,real) i:num))) ((#real_sub:fun(real,fun(real,real)) (x:fun(num,real) i:num)) (y:fun(num,real) i:num)))))))))))))
      #|D_EUCLID_BOUND =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). (#forall:fun(fun(real,bool),bool) (\eps:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) x:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) y:fun(num,real))) (#forall:fun(fun(num,bool),bool) (\i:num. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (x:fun(num,real) i:num)) (y:fun(num,real) i:num)))) eps:real)))))) ((#real_le:fun(real,fun(real,bool)) ((#euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)) x:fun(num,real)) y:fun(num,real))) ((#real_mul:fun(real,fun(real,real)) (#sqrt:fun(real,real) (#real_of_num:fun(num,real) n:num))) eps:real)))))))))))
      #|metric_translate =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\z:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) x:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) y:fun(num,real))) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) z:fun(num,real))))) ((#=:fun(real,fun(real,bool)) ((#euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)) ((#euclid_euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) x:fun(num,real)) z:fun(num,real))) ((#euclid_euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) y:fun(num,real)) z:fun(num,real)))) ((#euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)) x:fun(num,real)) y:fun(num,real))))))))))))
      #|metric_translate_LEFT =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\z:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) x:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) y:fun(num,real))) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) z:fun(num,real))))) ((#=:fun(real,fun(real,bool)) ((#euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)) ((#euclid_euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) z:fun(num,real)) x:fun(num,real))) ((#euclid_euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) z:fun(num,real)) y:fun(num,real)))) ((#euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)) x:fun(num,real)) y:fun(num,real))))))))))))
      #|norm_scale =  |- (#forall:fun(fun(real,bool),bool) (\t:real. (#forall:fun(fun(real,bool),bool) (\t':real. (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) (#euclid_euclidean:fun(fun(num,real),bool) x:fun(num,real))) ((#=:fun(real,fun(real,bool)) ((#euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)) ((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) t:real) x:fun(num,real))) ((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) t':real) x:fun(num,real)))) ((#real_mul:fun(real,fun(real,real)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) t:real) t':real))) (#euclid_norm:fun(fun(num,real),real) x:fun(num,real)))))))))))
      #|norm_scale_vec =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\t:real. (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\x':fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) x:fun(num,real))) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) x':fun(num,real)))) ((#=:fun(real,fun(real,bool)) ((#euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)) ((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) t:real) x:fun(num,real))) ((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) t:real) x':fun(num,real)))) ((#real_mul:fun(real,fun(real,real)) (#real_abs:fun(real,real) t:real)) ((#euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)) x:fun(num,real)) x':fun(num,real)))))))))))))
      #|topology =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\V:fun(fun('A,bool),bool). ((#/\:fun(bool,fun(bool,bool)) (U:fun(fun('A,bool),bool) #EMPTY:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (U:fun(fun('A,bool),bool) A:fun('A,bool))) (U:fun(fun('A,bool),bool) B:fun('A,bool)))) (U:fun(fun('A,bool),bool) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) A:fun('A,bool)) B:fun('A,bool))))) ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) V:fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool))) (U:fun(fun('A,bool),bool) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) V:fun(fun('A,bool),bool)))))))))))))))
      #|open_DEF =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#euclid_open_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) A:fun('A,bool))) (U:fun(fun('A,bool),bool) A:fun('A,bool)))))))
      #|closed =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#euclid_closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) B:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) B:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)))) ((#euclid_open_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))) B:fun('A,bool)))))))))
      #|closure =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#euclid_closure:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun('A,bool))) U:fun(fun('A,bool),bool)) A:fun('A,bool))) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%6:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%6:fun('A,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) B:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) B:fun('A,bool)))) B:fun('A,bool))))))))))))
      #|induced_top =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) ((#euclid_induced_top:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) U:fun(fun('A,bool),bool)) A:fun('A,bool))) ((#IMAGE:fun(fun(fun('A,bool),fun('A,bool)),fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool))) (\B:fun('A,bool). ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) B:fun('A,bool)) A:fun('A,bool)))) U:fun(fun('A,bool),bool)))))))
      #|open_ball =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(real,bool),bool) (\r:real. ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) x:'A) r:real)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%7:'A. (#?:fun(fun('A,bool),bool) (\y:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%7:'A) ((#/\:fun(bool,fun(bool,bool)) (X:fun('A,bool) x:'A)) ((#/\:fun(bool,fun(bool,bool)) (X:fun('A,bool) y:'A)) ((#real_lt:fun(real,fun(real,bool)) ((d:fun('A,fun('A,real)) x:'A) y:'A)) r:real)))) y:'A))))))))))))))
      #|closed_ball =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(real,bool),bool) (\r:real. ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#euclid_closed_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) x:'A) r:real)) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%8:'A. (#?:fun(fun('A,bool),bool) (\y:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%8:'A) ((#/\:fun(bool,fun(bool,bool)) (X:fun('A,bool) x:'A)) ((#/\:fun(bool,fun(bool,bool)) (X:fun('A,bool) y:'A)) ((#real_le:fun(real,fun(real,bool)) ((d:fun('A,fun('A,real)) x:'A) y:'A)) r:real)))) y:'A))))))))))))))
      #|open_balls =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) (#euclid_open_balls:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%9:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%9:fun('A,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun(real,bool),bool) (\r:real. ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) B:fun('A,bool)) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) x:'A) r:real))))))) B:fun('A,bool)))))))))))
      #|top_of_metric =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) (#euclid_top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%10:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%10:fun('A,bool)) (#?:fun(fun(fun(fun('A,bool),bool),bool),bool) (\F:fun(fun('A,bool),bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) F:fun(fun('A,bool),bool)) (#euclid_open_balls:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) F:fun(fun('A,bool),bool))))))) A:fun('A,bool)))))))))))
      #|open_EMPTY =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#euclid_open_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) #EMPTY:fun('A,bool)))))
      #|open_closed =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#euclid_open_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) A:fun('A,bool)))) ((#euclid_closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))) A:fun('A,bool))))))))
      #|closed_UNIV =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#euclid_closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))))))
      #|top_univ =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) (U:fun(fun('A,bool),bool) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))))))
      #|empty_closed =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#euclid_closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) #EMPTY:fun('A,bool)))))
      #|closed_open =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#euclid_closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) A:fun('A,bool))) ((#euclid_open_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) ((#DIFF:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))) A:fun('A,bool))))))))
      #|closed_inter =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\V:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (V:fun(fun('A,bool),bool) a:fun('A,bool))) ((#euclid_closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) a:fun('A,bool)))))) (#~:fun(bool,bool) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) V:fun(fun('A,bool),bool)) #EMPTY:fun(fun('A,bool),bool)))))) ((#euclid_closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) V:fun(fun('A,bool),bool))))))))
      #|open_nbd =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#=:fun(bool,fun(bool,bool)) (U:fun(fun('A,bool),bool) A:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (A:fun('A,bool) x:'A)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) B:fun('A,bool)) A:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (B:fun('A,bool) x:'A)) (U:fun(fun('A,bool),bool) B:fun('A,bool)))))))))))))))
      #|open_inters =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\V:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) V:fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(fun('A,bool),bool),bool) V:fun(fun('A,bool),bool))) (#~:fun(bool,bool) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) V:fun(fun('A,bool),bool)) #EMPTY:fun(fun('A,bool),bool))))))) (U:fun(fun('A,bool),bool) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) V:fun(fun('A,bool),bool))))))))
      #|top_unions =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\V:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) V:fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)))) (U:fun(fun('A,bool),bool) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) V:fun(fun('A,bool),bool))))))))
      #|top_inter =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (U:fun(fun('A,bool),bool) A:fun('A,bool))) (U:fun(fun('A,bool),bool) B:fun('A,bool))))) (U:fun(fun('A,bool),bool) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) A:fun('A,bool)) B:fun('A,bool))))))))))
      #|open_ball_nonempty =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) r:real)) (X:fun('A,bool) a:'A)))) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r:real)))))))))))
      #|open_ball_subset =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun(real,bool),bool) (\r:real. ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r:real)) X:fun('A,bool))))))))))
      #|open_ball_subspace =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\Y:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Y:fun('A,bool)) X:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) Y:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r:real)) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r:real)))))))))))))
      #|open_ball_empty =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) X:fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) #EMPTY:fun('A,bool)) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r:real)))))))))))
      #|open_ball_intersect =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\Y:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Y:fun('A,bool)) X:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) Y:fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) Y:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r:real)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r:real)) Y:fun('A,bool))))))))))))))
      #|open_ball_center =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('A,bool),bool) (\b:'A. (#forall:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) b:'A) r:real)))) (#?:fun(fun(real,bool),bool) (\r':real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) r':real)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r':real)) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) b:'A) r:real))))))))))))))))
      #|open_ball_nonempty_center =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r:real))) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r:real)) #EMPTY:fun('A,bool)))))))))))))
      #|open_ball_neg_radius =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#real_lt:fun(real,fun(real,bool)) r:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) #EMPTY:fun('A,bool)) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r:real)))))))))))
      #|open_ball_nest =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun(real,bool),bool) (\r:real. (#forall:fun(fun(real,bool),bool) (\r':real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) r:real) r':real)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r:real)) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r':real)))))))))))))
      #|open_ball_inter =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('A,bool),bool) (\b:'A. (#forall:fun(fun('A,bool),bool) (\c:'A. (#forall:fun(fun(real,bool),bool) (\r:real. (#forall:fun(fun(real,bool),bool) (\r':real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) (X:fun('A,bool) a:'A)) ((#/\:fun(bool,fun(bool,bool)) (X:fun('A,bool) b:'A)) ((#IN:fun('A,fun(fun('A,bool),bool)) c:'A) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r:real)) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) b:'A) r':real))))))) (#?:fun(fun(real,bool),bool) (\r'':real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) r'':real)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) c:'A) r'':real)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r:real)) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) b:'A) r':real)))))))))))))))))))))
      #|BALL_DIST =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. (#forall:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) ((((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) z:'A) r:real) x:'A)) ((((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) z:'A) r:real) y:'A)))) ((#real_lt:fun(real,fun(real,bool)) ((d:fun('A,fun('A,real)) x:'A) y:'A)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) r:real)))))))))))))))
      #|BALL_DIST_CLOSED =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. (#forall:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) ((((#euclid_closed_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) z:'A) r:real) x:'A)) ((((#euclid_closed_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) z:'A) r:real) y:'A)))) ((#real_le:fun(real,fun(real,bool)) ((d:fun('A,fun('A,real)) x:'A) y:'A)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) r:real)))))))))))))))
      #|open_ball_sub_closed =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(real,bool),bool) (\r:real. ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) x:'A) r:real)) (((#euclid_closed_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) x:'A) r:real))))))))))
      #|ball_symm =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) (X:fun('A,bool) x:'A)) (X:fun('A,bool) y:'A)))) ((#=:fun(bool,fun(bool,bool)) ((((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) x:'A) r:real) y:'A)) ((((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) y:'A) r:real) x:'A)))))))))))))
      #|ball_subset_ball =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. (#forall:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) x:'A) r:real) z:'A))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) z:'A) r:real)) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) x:'A) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) r:real))))))))))))))
      #|top_of_metric_unions =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) X:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) (#euclid_top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))))))))
      #|top_of_metric_empty =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#euclid_top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) #EMPTY:fun('A,bool))))))
      #|top_of_metric_open =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\F:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) F:fun(fun('A,bool),bool)) (#euclid_open_balls:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) F:fun(fun('A,bool),bool))) (#euclid_top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))))))))))
      #|top_of_metric_open_balls =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) (#euclid_open_balls:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (#euclid_top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))))))
      #|open_ball_open =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#euclid_top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) x:'A) r:real)))))))))))
      #|top_of_metric_nbd =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#=:fun(bool,fun(bool,bool)) ((#euclid_top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) A:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) X:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) A:fun('A,bool))) (#?:fun(fun(real,bool),bool) (\r:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) r:real)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r:real)) A:fun('A,bool)))))))))))))))))
      #|top_of_metric_inter =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) A:fun('A,bool))) ((#euclid_top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) B:fun('A,bool)))) ((#euclid_top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) A:fun('A,bool)) B:fun('A,bool)))))))))))))
      #|top_of_metric_union =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\V:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) V:fun(fun('A,bool),bool)) (#euclid_top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))) ((#euclid_top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) V:fun(fun('A,bool),bool)))))))))))
      #|top_of_metric_top =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) (#euclid_top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))))))))
      #|closed_ball_closed =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#euclid_closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (#euclid_top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (((#euclid_closed_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) x:'A) r:real)))))))))))
      #|open_ball_nbd =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun(fun('A,bool),bool),bool) (\C:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) (C:fun('A,bool) x:'A)) ((#euclid_top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) C:fun('A,bool))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) x:'A) e:real)) C:fun('A,bool))))))))))))))
      #|closure_closed =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))))) ((#euclid_closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) ((#euclid_closure:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun('A,bool))) U:fun(fun('A,bool),bool)) A:fun('A,bool))))))))
      #|subset_closure =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) ((#euclid_closure:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun('A,bool))) U:fun(fun('A,bool),bool)) A:fun('A,bool))))))))
      #|closure_subset =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) B:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) B:fun('A,bool))))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#euclid_closure:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun('A,bool))) U:fun(fun('A,bool),bool)) A:fun('A,bool))) B:fun('A,bool)))))))))
      #|closure_self =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#euclid_closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) A:fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#euclid_closure:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun('A,bool))) U:fun(fun('A,bool),bool)) A:fun('A,bool))) A:fun('A,bool)))))))
      #|closure_close =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\Z:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) ((#euclid_closure:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun('A,bool))) U:fun(fun('A,bool),bool)) Z:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) A:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) A:fun('A,bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) B:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) B:fun('A,bool)))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) B:fun('A,bool)))))))))))))))
      #|closure_open =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\Z:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) ((#euclid_closure:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun('A,bool))) U:fun(fun('A,bool),bool)) Z:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) A:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) A:fun('A,bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_open_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) B:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) B:fun('A,bool)) Z:fun('A,bool))) #EMPTY:fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) B:fun('A,bool)) A:fun('A,bool))) #EMPTY:fun('A,bool)))))))))))))))
      #|image_top =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),fun('B,bool)),bool),bool) (\f:fun(fun('A,bool),fun('B,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) #EMPTY:fun('B,bool)) (f:fun(fun('A,bool),fun('B,bool)) #EMPTY:fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\b:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) a:fun('A,bool)) U:fun(fun('A,bool),bool))) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) b:fun('A,bool)) U:fun(fun('A,bool),bool)))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#INTER:fun(fun('B,bool),fun(fun('B,bool),fun('B,bool))) (f:fun(fun('A,bool),fun('B,bool)) a:fun('A,bool))) (f:fun(fun('A,bool),fun('B,bool)) b:fun('A,bool)))) (f:fun(fun('A,bool),fun('B,bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) a:fun('A,bool)) b:fun('A,bool)))))))))) (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\V:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) V:fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool))) ((#=:fun(fun('B,bool),fun(fun('B,bool),bool)) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) ((#IMAGE:fun(fun(fun('A,bool),fun('B,bool)),fun(fun(fun('A,bool),bool),fun(fun('B,bool),bool))) f:fun(fun('A,bool),fun('B,bool))) V:fun(fun('A,bool),bool)))) (f:fun(fun('A,bool),fun('B,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) V:fun(fun('A,bool),bool))))))))))) (#euclid_topology_:fun(fun(fun('B,bool),bool),bool) ((#IMAGE:fun(fun(fun('A,bool),fun('B,bool)),fun(fun(fun('A,bool),bool),fun(fun('B,bool),bool))) f:fun(fun('A,bool),fun('B,bool))) U:fun(fun('A,bool),bool))))))))
      #|induced_top_support =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\C:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#euclid_induced_top:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) U:fun(fun('A,bool),bool)) C:fun('A,bool)))) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))) C:fun('A,bool)))))))
      #|induced_top_top =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\C:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) ((#euclid_induced_top:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) U:fun(fun('A,bool),bool)) C:fun('A,bool))))))))
      #|induced_top_open =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\C:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#=:fun(bool,fun(bool,bool)) (((#euclid_induced_top:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) U:fun(fun('A,bool),bool)) C:fun('A,bool)) A:fun('A,bool))) (#?:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (U:fun(fun('A,bool),bool) B:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) B:fun('A,bool)) C:fun('A,bool))) A:fun('A,bool)))))))))))))
      #|induced_trans =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (U:fun(fun('A,bool),bool) A:fun('A,bool))) (((#euclid_induced_top:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) U:fun(fun('A,bool),bool)) A:fun('A,bool)) B:fun('A,bool))))) (U:fun(fun('A,bool),bool) B:fun('A,bool)))))))))
      #|induced_top_unions =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) ((#euclid_induced_top:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) U:fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)))) U:fun(fun('A,bool),bool)))))
      #|gen =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\X:fun(fun('A,bool),bool). ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) (#euclid_gen:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) X:fun(fun('A,bool),bool))) (#GSPEC:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (\GEN%PVAR%11:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (((#SETSPEC:fun(fun('A,bool),fun(bool,fun(fun('A,bool),bool))) GEN%PVAR%11:fun('A,bool)) (#?:fun(fun(fun(fun('A,bool),bool),bool),bool) (\Y:fun(fun('A,bool),bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) Y:fun(fun('A,bool),bool)) X:fun(fun('A,bool),bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) Y:fun(fun('A,bool),bool))))))) A:fun('A,bool)))))))))
      #|top_of_metric_gen =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) (#euclid_gen:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (#euclid_open_balls:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))) (#euclid_top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))))))
      #|gen_subset =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\V:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) U:fun(fun('A,bool),bool)) V:fun(fun('A,bool),bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) A:fun('A,bool)) V:fun(fun('A,bool),bool))) (#?:fun(fun(fun(fun('A,bool),bool),bool),bool) (\Y:fun(fun('A,bool),bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) Y:fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) Y:fun(fun('A,bool),bool))))))))))) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) (#euclid_gen:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool))) (#euclid_gen:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) V:fun(fun('A,bool),bool))))))))
      #|gen_subspace =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\Y:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Y:fun('A,bool)) X:fun('A,bool))) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) ((#euclid_induced_top:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) (#euclid_top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) Y:fun('A,bool))) (#euclid_gen:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) ((#euclid_induced_top:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) (#euclid_open_balls:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) Y:fun('A,bool)))))))))))
      #|gen_induced =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\Y:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Y:fun('A,bool)) X:fun('A,bool))) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) (#euclid_gen:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (#euclid_open_balls:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) Y:fun('A,bool)) d:fun('A,fun('A,real)))))) (#euclid_gen:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) ((#euclid_induced_top:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) (#euclid_open_balls:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) Y:fun('A,bool)))))))))))
      #|top_of_metric_induced =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\Y:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Y:fun('A,bool)) X:fun('A,bool))) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) ((#euclid_induced_top:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) (#euclid_top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) Y:fun('A,bool))) (#euclid_top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) Y:fun('A,bool)) d:fun('A,fun('A,real))))))))))))
      #|continuous =  |- (#forall:fun(fun(fun(fun('B,bool),bool),bool),bool) (\V:fun(fun('B,bool),bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) (((#euclid_continuous:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) f:fun('A,'B)) U:fun(fun('A,bool),bool)) V:fun(fun('B,bool),bool))) (#forall:fun(fun(fun('B,bool),bool),bool) (\v:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('B,bool),fun(fun(fun('B,bool),bool),bool)) v:fun('B,bool)) V:fun(fun('B,bool),bool))) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) (((#preimage:fun(fun('A,bool),fun(fun('A,'B),fun(fun('B,bool),fun('A,bool)))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))) f:fun('A,'B)) v:fun('B,bool))) U:fun(fun('A,bool),bool))))))))))))
      #|metric_continuous_pt =  |- (#forall:fun(fun(fun('B,bool),bool),bool) (\Y:fun('B,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\dX:fun('A,fun('A,real)). (#forall:fun(fun(fun('B,fun('B,real)),bool),bool) (\dY:fun('B,fun('B,real)). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) ((((#euclid_metric_continuous_pt:fun(fun('A,'B),fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(prod(fun('B,bool),fun('B,fun('B,real))),fun('A,bool)))) f:fun('A,'B)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) dX:fun('A,fun('A,real)))) ((#,:fun(fun('B,bool),fun(fun('B,fun('B,real)),prod(fun('B,bool),fun('B,fun('B,real))))) Y:fun('B,bool)) dY:fun('B,fun('B,real)))) x:'A)) (#forall:fun(fun(real,bool),bool) (\epsilon:real. (#?:fun(fun(real,bool),bool) (\delta:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) epsilon:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) delta:real)) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) X:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) X:fun('A,bool))) ((#real_lt:fun(real,fun(real,bool)) ((dX:fun('A,fun('A,real)) x:'A) y:'A)) delta:real)))) ((#real_lt:fun(real,fun(real,bool)) ((dY:fun('B,fun('B,real)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))) epsilon:real)))))))))))))))))))))))
      #|metric_continuous =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\dX:fun('A,fun('A,real)). (#forall:fun(fun(fun('B,bool),bool),bool) (\Y:fun('B,bool). (#forall:fun(fun(fun('B,fun('B,real)),bool),bool) (\dY:fun('B,fun('B,real)). ((#=:fun(bool,fun(bool,bool)) (((#euclid_metric_continuous:fun(fun('A,'B),fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(prod(fun('B,bool),fun('B,fun('B,real))),bool))) f:fun('A,'B)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) dX:fun('A,fun('A,real)))) ((#,:fun(fun('B,bool),fun(fun('B,fun('B,real)),prod(fun('B,bool),fun('B,fun('B,real))))) Y:fun('B,bool)) dY:fun('B,fun('B,real))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((((#euclid_metric_continuous_pt:fun(fun('A,'B),fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(prod(fun('B,bool),fun('B,fun('B,real))),fun('A,bool)))) f:fun('A,'B)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) dX:fun('A,fun('A,real)))) ((#,:fun(fun('B,bool),fun(fun('B,fun('B,real)),prod(fun('B,bool),fun('B,fun('B,real))))) Y:fun('B,bool)) dY:fun('B,fun('B,real)))) x:'A))))))))))))))
      #|metric_continuous_pt_domain =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\dX:fun('A,fun('A,real)). (#forall:fun(fun(fun('B,bool),bool),bool) (\Y:fun('B,bool). (#forall:fun(fun(fun('B,fun('B,real)),bool),bool) (\dY:fun('B,fun('B,real)). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) X:fun('A,bool)))) ((((#euclid_metric_continuous_pt:fun(fun('A,'B),fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(prod(fun('B,bool),fun('B,fun('B,real))),fun('A,bool)))) f:fun('A,'B)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) dX:fun('A,fun('A,real)))) ((#,:fun(fun('B,bool),fun(fun('B,fun('B,real)),prod(fun('B,bool),fun('B,fun('B,real))))) Y:fun('B,bool)) dY:fun('B,fun('B,real)))) x:'A))))))))))))))
      #|metric_continuous_continuous =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\Y:fun('B,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\dX:fun('A,fun('A,real)). (#forall:fun(fun(fun('B,fun('B,real)),bool),bool) (\dY:fun('B,fun('B,real)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) X:fun('A,bool))) Y:fun('B,bool))) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) dX:fun('A,fun('A,real))))) (#euclid_metric_space:fun(prod(fun('B,bool),fun('B,fun('B,real))),bool) ((#,:fun(fun('B,bool),fun(fun('B,fun('B,real)),prod(fun('B,bool),fun('B,fun('B,real))))) Y:fun('B,bool)) dY:fun('B,fun('B,real))))))) ((#=:fun(bool,fun(bool,bool)) (((#euclid_continuous:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) f:fun('A,'B)) (#euclid_top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) dX:fun('A,fun('A,real))))) (#euclid_top_of_metric:fun(prod(fun('B,bool),fun('B,fun('B,real))),fun(fun('B,bool),bool)) ((#,:fun(fun('B,bool),fun(fun('B,fun('B,real)),prod(fun('B,bool),fun('B,fun('B,real))))) Y:fun('B,bool)) dY:fun('B,fun('B,real)))))) (((#euclid_metric_continuous:fun(fun('A,'B),fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(prod(fun('B,bool),fun('B,fun('B,real))),bool))) f:fun('A,'B)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) dX:fun('A,fun('A,real)))) ((#,:fun(fun('B,bool),fun(fun('B,fun('B,real)),prod(fun('B,bool),fun('B,fun('B,real))))) Y:fun('B,bool)) dY:fun('B,fun('B,real))))))))))))))))
      #|continuous_induced =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('B,bool),bool),bool),bool) (\V:fun(fun('B,bool),bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\A:fun('B,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('B,bool),bool),bool) V:fun(fun('B,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (((#euclid_continuous:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) f:fun('A,'B)) U:fun(fun('A,bool),bool)) V:fun(fun('B,bool),bool))) (V:fun(fun('B,bool),bool) A:fun('B,bool))))) (((#euclid_continuous:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) f:fun('A,'B)) U:fun(fun('A,bool),bool)) ((#euclid_induced_top:fun(fun(fun('B,bool),bool),fun(fun('B,bool),fun(fun('B,bool),bool))) V:fun(fun('B,bool),bool)) A:fun('B,bool))))))))))))
      #|metric_cont =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun('B,bool),bool),bool) (\X:fun('B,bool). (#forall:fun(fun(fun('B,fun('B,real)),bool),bool) (\d:fun('B,fun('B,real)). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('B,bool),fun('B,fun('B,real))),bool) ((#,:fun(fun('B,bool),fun(fun('B,fun('B,real)),prod(fun('B,bool),fun('B,fun('B,real))))) X:fun('B,bool)) d:fun('B,fun('B,real))))) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool)))) ((#=:fun(bool,fun(bool,bool)) (((#euclid_continuous:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) f:fun('A,'B)) U:fun(fun('A,bool),bool)) (#euclid_top_of_metric:fun(prod(fun('B,bool),fun('B,fun('B,real))),fun(fun('B,bool),bool)) ((#,:fun(fun('B,bool),fun(fun('B,fun('B,real)),prod(fun('B,bool),fun('B,fun('B,real))))) X:fun('B,bool)) d:fun('B,fun('B,real)))))) (#forall:fun(fun('B,bool),bool) (\x:'B. (#forall:fun(fun(real,bool),bool) (\r:real. (U:fun(fun('A,bool),bool) (((#preimage:fun(fun('A,bool),fun(fun('A,'B),fun(fun('B,bool),fun('A,bool)))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))) f:fun('A,'B)) (((#euclid_open_ball:fun(prod(fun('B,bool),fun('B,fun('B,real))),fun('B,fun(real,fun('B,bool)))) ((#,:fun(fun('B,bool),fun(fun('B,fun('B,real)),prod(fun('B,bool),fun('B,fun('B,real))))) X:fun('B,bool)) d:fun('B,fun('B,real)))) x:'B) r:real)))))))))))))))))
      #|continuous_sum =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,fun(num,real)),bool),bool) (\f:fun('A,fun(num,real)). (#forall:fun(fun(fun('A,fun(num,real)),bool),bool) (\g:fun('A,fun(num,real)). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (((#euclid_continuous:fun(fun('A,fun(num,real)),fun(fun(fun('A,bool),bool),fun(fun(fun(fun(num,real),bool),bool),bool))) f:fun('A,fun(num,real))) U:fun(fun('A,bool),bool)) (#euclid_top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)))))) ((#/\:fun(bool,fun(bool,bool)) (((#euclid_continuous:fun(fun('A,fun(num,real)),fun(fun(fun('A,bool),bool),fun(fun(fun(fun(num,real),bool),bool),bool))) g:fun('A,fun(num,real))) U:fun(fun('A,bool),bool)) (#euclid_top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)))))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) ((#IMAGE:fun(fun('A,fun(num,real)),fun(fun('A,bool),fun(fun(num,real),bool))) f:fun('A,fun(num,real))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num))) ((#SUBSET:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) ((#IMAGE:fun(fun('A,fun(num,real)),fun(fun('A,bool),fun(fun(num,real),bool))) g:fun('A,fun(num,real))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num))))))) (((#euclid_continuous:fun(fun('A,fun(num,real)),fun(fun(fun('A,bool),bool),fun(fun(fun(fun(num,real),bool),bool),bool))) (\t:'A. ((#euclid_euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) (f:fun('A,fun(num,real)) t:'A)) (g:fun('A,fun(num,real)) t:'A)))) U:fun(fun('A,bool),bool)) (#euclid_top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real))))))))))))))
      #|sequence =  |- (#forall:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#euclid_sequence:fun(fun('A,bool),fun(fun(num,'A),bool)) X:fun('A,bool)) f:fun(num,'A))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#IMAGE:fun(fun(num,'A),fun(fun(num,bool),fun('A,bool))) f:fun(num,'A)) #UNIV:fun(num,bool))) X:fun('A,bool)))))))
      #|converge =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#=:fun(bool,fun(bool,bool)) ((#euclid_converge:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun(num,'A),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) f:fun(num,'A))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) X:fun('A,bool))) (#forall:fun(fun(real,bool),bool) (\eps:real. (#?:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) eps:real)) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) n:num) i:num)) ((#real_lt:fun(real,fun(real,bool)) ((d:fun('A,fun('A,real)) x:'A) (f:fun(num,'A) i:num))) eps:real)))))))))))))))))))
      #|cauchy_seq =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#=:fun(bool,fun(bool,bool)) ((#euclid_cauchy_seq:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun(num,'A),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) f:fun(num,'A))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_sequence:fun(fun('A,bool),fun(fun(num,'A),bool)) X:fun('A,bool)) f:fun(num,'A))) (#forall:fun(fun(real,bool),bool) (\eps:real. (#?:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(num,bool),bool) (\j:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) eps:real)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) n:num) i:num)) ((#<=:fun(num,fun(num,bool)) n:num) j:num)))) ((#real_lt:fun(real,fun(real,bool)) ((d:fun('A,fun('A,real)) (f:fun(num,'A) i:num)) (f:fun(num,'A) j:num))) eps:real))))))))))))))))))
      #|complete =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#=:fun(bool,fun(bool,bool)) (#euclid_complete:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (#forall:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#==>:fun(bool,fun(bool,bool)) ((#euclid_cauchy_seq:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun(num,'A),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) f:fun(num,'A))) ((#euclid_converge:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun(num,'A),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) f:fun(num,'A))))))))))
      #|converge_cauchy =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_sequence:fun(fun('A,bool),fun(fun(num,'A),bool)) X:fun('A,bool)) f:fun(num,'A))) ((#euclid_converge:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun(num,'A),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) f:fun(num,'A))))) ((#euclid_cauchy_seq:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun(num,'A),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) f:fun(num,'A)))))))))
      #|cauchy_seq_cauchy =  |- (#forall:fun(fun(fun(num,fun(num,real)),bool),bool) (\f:fun(num,fun(num,real)). ((#==>:fun(bool,fun(bool,bool)) ((#euclid_cauchy_seq:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(num,fun(num,real)),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)))) f:fun(num,fun(num,real)))) (#cauchy:fun(fun(num,real),bool) (\x:num. ((f:fun(num,fun(num,real)) x:num) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|complete_real =  |- (#euclid_complete:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),bool) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real))))
      #|sequence_in =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#euclid_sequence:fun(fun('A,bool),fun(fun(num,'A),bool)) X:fun('A,bool)) f:fun(num,'A))) (X:fun('A,bool) (f:fun(num,'A) i:num)))))))))
      #|proj_cauchy =  |- (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(fun(num,fun(num,real)),bool),bool) (\f:fun(num,fun(num,real)). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#euclid_cauchy_seq:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(num,fun(num,real)),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)))) f:fun(num,fun(num,real)))) ((#euclid_cauchy_seq:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(num,fun(num,real)),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)))) ((#o:fun(fun(fun(num,real),fun(num,real)),fun(fun(num,fun(num,real)),fun(num,fun(num,real)))) (#euclid_proj:fun(num,fun(fun(num,real),fun(num,real))) i:num)) f:fun(num,fun(num,real)))))))))))
      #|complete_euclid =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#euclid_complete:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),bool) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real))))))
      #|subset_sequence =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\S:fun('A,bool). (#forall:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) S:fun('A,bool)) X:fun('A,bool))) ((#euclid_sequence:fun(fun('A,bool),fun(fun(num,'A),bool)) S:fun('A,bool)) f:fun(num,'A)))) ((#euclid_sequence:fun(fun('A,bool),fun(fun(num,'A),bool)) X:fun('A,bool)) f:fun(num,'A)))))))))
      #|subset_cauchy =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\S:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) S:fun('A,bool)) X:fun('A,bool))) ((#euclid_cauchy_seq:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun(num,'A),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) S:fun('A,bool)) d:fun('A,fun('A,real)))) f:fun(num,'A)))) ((#euclid_cauchy_seq:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun(num,'A),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) f:fun(num,'A)))))))))))
      #|complete_closed =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(fun(num,real),bool),bool),bool) (\S:fun(fun(num,real),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_closed_:fun(fun(fun(fun(num,real),bool),bool),fun(fun(fun(num,real),bool),bool)) (#euclid_top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real))))) S:fun(fun(num,real),bool))) ((#SUBSET:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) S:fun(fun(num,real),bool)) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num)))) (#euclid_complete:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),bool) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) S:fun(fun(num,real),bool)) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)))))))))
      #|totally_bounded =  |- (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#euclid_totally_bounded:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (#forall:fun(fun(real,bool),bool) (\eps:real. (#?:fun(fun(fun(fun('A,bool),bool),bool),bool) (\B:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) eps:real)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(fun('A,bool),bool),bool) B:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\b:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (B:fun(fun('A,bool),bool) b:fun('A,bool))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) b:fun('A,bool)) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) x:'A) eps:real)))))))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) X:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) B:fun(fun('A,bool),bool)))))))))))))))
      #|totally_bounded_subset =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun(fun('A,bool),bool),bool) (\S:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) (#euclid_totally_bounded:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) S:fun('A,bool)) X:fun('A,bool))))) (#euclid_totally_bounded:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) S:fun('A,bool)) d:fun('A,fun('A,real)))))))))))
      #|integer_cube_finite =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\N:num. (#FINITE:fun(fun(fun(num,real),bool),bool) (#GSPEC:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) (\GEN%PVAR%12:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (((#SETSPEC:fun(fun(num,real),fun(bool,fun(fun(num,real),bool))) GEN%PVAR%12:fun(num,real)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) f:fun(num,real))) (#forall:fun(fun(num,bool),bool) (\i:num. (#?:fun(fun(num,bool),bool) (\j:num. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(num,real) i:num))) (#real_of_num:fun(num,real) j:num))) ((#<=:fun(num,fun(num,bool)) j:num) N:num)))))))) f:fun(num,real)))))))))))
      #|FINITE_scaled_lattice =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\N:num. (#forall:fun(fun(real,bool),bool) (\s:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) s:real)) (#FINITE:fun(fun(fun(num,real),bool),bool) (#GSPEC:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) (\GEN%PVAR%13:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (((#SETSPEC:fun(fun(num,real),fun(bool,fun(fun(num,real),bool))) GEN%PVAR%13:fun(num,real)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) x:fun(num,real))) (#forall:fun(fun(num,bool),bool) (\i:num. ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\j:num. ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (x:fun(num,real) i:num))) ((#real_mul:fun(real,fun(real,real)) s:real) (#real_of_num:fun(num,real) j:num)))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (x:fun(num,real) i:num))) (#real_of_num:fun(num,real) N:num))))))) x:fun(num,real))))))))))))))
      #|totally_bounded_cube =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\N:num. (#euclid_totally_bounded:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),bool) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#GSPEC:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) (\GEN%PVAR%14:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (((#SETSPEC:fun(fun(num,real),fun(bool,fun(fun(num,real),bool))) GEN%PVAR%14:fun(num,real)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) x:fun(num,real))) (#forall:fun(fun(num,bool),bool) (\i:num. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (x:fun(num,real) i:num))) (#real_of_num:fun(num,real) N:num)))))) x:fun(num,real))))))) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real))))))))
      #|center_FINITE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (#euclid_totally_bounded:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))) (#forall:fun(fun(real,bool),bool) (\eps:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) eps:real)) (#?:fun(fun(fun('A,bool),bool),bool) (\C:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) C:fun('A,bool)) X:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) C:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) X:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) ((#IMAGE:fun(fun('A,fun('A,bool)),fun(fun('A,bool),fun(fun('A,bool),bool))) (\x:'A. (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) x:'A) eps:real))) C:fun('A,bool))))))))))))))))
      #|open_ball_dist =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) ((((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) x:'A) r:real) y:'A)) ((#real_lt:fun(real,fun(real,bool)) ((d:fun('A,fun('A,real)) x:'A) y:'A)) r:real))))))))))))
      #|totally_bounded_bounded =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (#euclid_totally_bounded:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))) (#?:fun(fun('A,bool),bool) (\a:'A. (#?:fun(fun(real,bool),bool) (\r:real. ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) X:fun('A,bool)) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) a:'A) r:real)))))))))))
      #|subsequence_rec =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). (#forall:fun(fun(fun('A,bool),bool),bool) (\C:fun('A,bool). (#forall:fun(fun(num,bool),bool) (\s:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) (#euclid_totally_bounded:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_sequence:fun(fun('A,bool),fun(fun(num,'A),bool)) X:fun('A,bool)) f:fun(num,'A))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) C:fun('A,bool)) X:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) r:real)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#FINITE:fun(fun(num,bool),bool) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%15:num. (#?:fun(fun(num,bool),bool) (\j:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%15:num) (C:fun('A,bool) (f:fun(num,'A) j:num))) j:num)))))))) ((#/\:fun(bool,fun(bool,bool)) (C:fun('A,bool) (f:fun(num,'A) s:num))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (C:fun('A,bool) x:'A)) (C:fun('A,bool) y:'A))) ((#real_lt:fun(real,fun(real,bool)) ((d:fun('A,fun('A,real)) x:'A) y:'A)) ((#real_mul:fun(real,fun(real,real)) r:real) (#twopow:fun(int,real) (#int_neg:fun(int,int) (#int_of_num:fun(num,int) n:num)))))))))))))))))) (#?:fun(fun(fun('A,bool),bool),bool) (\C':fun('A,bool). (#?:fun(fun(num,bool),bool) (\s':num. ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) C':fun('A,bool)) C:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) s:num) s':num)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#FINITE:fun(fun(num,bool),bool) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%16:num. (#?:fun(fun(num,bool),bool) (\j:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%16:num) (C':fun('A,bool) (f:fun(num,'A) j:num))) j:num)))))))) ((#/\:fun(bool,fun(bool,bool)) (C':fun('A,bool) (f:fun(num,'A) s':num))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (C':fun('A,bool) x:'A)) (C':fun('A,bool) y:'A))) ((#real_lt:fun(real,fun(real,bool)) ((d:fun('A,fun('A,real)) x:'A) y:'A)) ((#real_mul:fun(real,fun(real,real)) r:real) (#twopow:fun(int,real) (#int_neg:fun(int,int) (#int_of_num:fun(num,int) (#SUC:fun(num,num) n:num))))))))))))))))))))))))))))))))))
      #|sequence_subseq =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). (#forall:fun(fun(fun(num,num),bool),bool) (\ss:fun(num,num). ((#==>:fun(bool,fun(bool,bool)) ((#euclid_sequence:fun(fun('A,bool),fun(fun(num,'A),bool)) X:fun('A,bool)) f:fun(num,'A))) ((#euclid_sequence:fun(fun('A,bool),fun(fun(num,'A),bool)) X:fun('A,bool)) ((#o:fun(fun(num,'A),fun(fun(num,num),fun(num,'A))) f:fun(num,'A)) ss:fun(num,num))))))))))
      #|cauchy_subseq =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) (#euclid_totally_bounded:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#euclid_sequence:fun(fun('A,bool),fun(fun(num,'A),bool)) X:fun('A,bool)) f:fun(num,'A))))) (#?:fun(fun(fun(num,num),bool),bool) (\ss:fun(num,num). ((#/\:fun(bool,fun(bool,bool)) (#subseq:fun(fun(num,num),bool) ss:fun(num,num))) ((#euclid_cauchy_seq:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun(num,'A),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) ((#o:fun(fun(num,'A),fun(fun(num,num),fun(num,'A))) f:fun(num,'A)) ss:fun(num,num)))))))))))))
      #|convergent_subseq =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) (#euclid_totally_bounded:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) (#euclid_complete:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#euclid_sequence:fun(fun('A,bool),fun(fun(num,'A),bool)) X:fun('A,bool)) f:fun(num,'A)))))) (#?:fun(fun(fun(num,num),bool),bool) (\ss:fun(num,num). ((#/\:fun(bool,fun(bool,bool)) (#subseq:fun(fun(num,num),bool) ss:fun(num,num))) ((#euclid_converge:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun(num,'A),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) ((#o:fun(fun(num,'A),fun(fun(num,num),fun(num,'A))) f:fun(num,'A)) ss:fun(num,num)))))))))))))
      #|dense =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\Z:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#euclid_dense:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) Z:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#euclid_closure:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun('A,bool))) U:fun(fun('A,bool),bool)) Z:fun('A,bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))))))))
      #|hausdorff =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) (#euclid_hausdorff:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)) x:'A)) ((#/\:fun(bool,fun(bool,bool)) ((#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)) y:'A)) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))) (#?:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#?:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (U:fun(fun('A,bool),bool) A:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (U:fun(fun('A,bool),bool) B:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (A:fun('A,bool) x:'A)) ((#/\:fun(bool,fun(bool,bool)) (B:fun('A,bool) y:'A)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) A:fun('A,bool)) B:fun('A,bool))) #EMPTY:fun('A,bool))))))))))))))))))
      #|dense_subset =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\Z:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#euclid_dense:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) Z:fun('A,bool)))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))))))))
      #|dense_open =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\Z:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))))) ((#=:fun(bool,fun(bool,bool)) ((#euclid_dense:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) Z:fun('A,bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_open_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) A:fun('A,bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) A:fun('A,bool)) Z:fun('A,bool))) #EMPTY:fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) A:fun('A,bool)) #EMPTY:fun('A,bool)))))))))))
      #|countable_dense =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (#euclid_totally_bounded:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))) (#?:fun(fun(fun('A,bool),bool),bool) (\Z:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (#COUNTABLE:fun(fun('A,bool),bool) Z:fun('A,bool))) ((#euclid_dense:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (#euclid_top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) Z:fun('A,bool))))))))))
      #|metric_hausdorff =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (#euclid_hausdorff:fun(fun(fun('A,bool),bool),bool) (#euclid_top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))))))))
      #|compact =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\K:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#euclid_compact:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) K:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) K:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)))) (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\V:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) K:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) V:fun(fun('A,bool),bool)))) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) V:fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)))) (#?:fun(fun(fun(fun('A,bool),bool),bool),bool) (\W:fun(fun('A,bool),bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) W:fun(fun('A,bool),bool)) V:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(fun('A,bool),bool),bool) W:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) K:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) W:fun(fun('A,bool),bool))))))))))))))))
      #|closed_compact =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\K:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\S:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_compact:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) K:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) S:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) S:fun('A,bool)) K:fun('A,bool)))))) ((#euclid_compact:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) S:fun('A,bool)))))))))
      #|compact_closed =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\K:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#euclid_hausdorff:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#euclid_compact:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) K:fun('A,bool))))) ((#euclid_closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) K:fun('A,bool)))))))
      #|compact_totally_bounded =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#euclid_compact:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (#euclid_top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) X:fun('A,bool)))) (#euclid_totally_bounded:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))))))
      #|finite_inters =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\V:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_compact:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) V:fun(fun('A,bool),bool))) #EMPTY:fun('A,bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (V:fun(fun('A,bool),bool) u:fun('A,bool))) ((#euclid_closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) u:fun('A,bool))))))))) (#?:fun(fun(fun(fun('A,bool),bool),bool),bool) (\W:fun(fun('A,bool),bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) W:fun(fun('A,bool),bool)) V:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun(fun('A,bool),bool),bool) W:fun(fun('A,bool),bool))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#INTERS:fun(fun(fun('A,bool),bool),fun('A,bool)) W:fun(fun('A,bool),bool))) #EMPTY:fun('A,bool)))))))))))
      #|cauchy_subseq_sublemma =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) (#euclid_totally_bounded:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#euclid_sequence:fun(fun('A,bool),fun(fun(num,'A),bool)) X:fun('A,bool)) f:fun(num,'A))))) (#?:fun(fun(real,bool),bool) (\R:real. (#?:fun(fun(fun(num,fun('A,bool)),bool),bool) (\Cn:fun(num,fun('A,bool)). (#?:fun(fun(fun(num,num),bool),bool) (\sn:fun(num,num). (#?:fun(fun(fun(prod(fun('A,bool),num),fun(num,bool)),bool),bool) (\cond:fun(prod(fun('A,bool),num),fun(num,bool)). ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) R:real)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (X:fun('A,bool) x:'A)) (X:fun('A,bool) y:'A))) ((#real_lt:fun(real,fun(real,bool)) ((d:fun('A,fun('A,real)) x:'A) y:'A)) R:real))))))) ((#/\:fun(bool,fun(bool,bool)) ((cond:fun(prod(fun('A,bool),num),fun(num,bool)) ((#,:fun(fun('A,bool),fun(num,prod(fun('A,bool),num))) X:fun('A,bool)) (#NUMERAL:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (sn:fun(num,num) (#NUMERAL:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) #_0:num))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (Cn:fun(num,fun('A,bool)) (#NUMERAL:fun(num,num) #_0:num))) X:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (Cn:fun(num,fun('A,bool)) n:num)) X:fun('A,bool))) ((cond:fun(prod(fun('A,bool),num),fun(num,bool)) ((#,:fun(fun('A,bool),fun(num,prod(fun('A,bool),num))) (Cn:fun(num,fun('A,bool)) n:num)) (sn:fun(num,num) n:num))) n:num))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (Cn:fun(num,fun('A,bool)) (#SUC:fun(num,num) n:num))) (Cn:fun(num,fun('A,bool)) n:num))) ((#<:fun(num,fun(num,bool)) (sn:fun(num,num) n:num)) (sn:fun(num,num) (#SUC:fun(num,num) n:num))))))) ((#=:fun(fun(prod(fun('A,bool),num),fun(num,bool)),fun(fun(prod(fun('A,bool),num),fun(num,bool)),bool)) (#GABS:fun(fun(fun(prod(fun('A,bool),num),fun(num,bool)),bool),fun(prod(fun('A,bool),num),fun(num,bool))) (\f:fun(prod(fun('A,bool),num),fun(num,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\C:fun('A,bool). (#forall:fun(fun(num,bool),bool) (\s:num. ((#GEQ:fun(fun(num,bool),fun(fun(num,bool),bool)) (f:fun(prod(fun('A,bool),num),fun(num,bool)) ((#,:fun(fun('A,bool),fun(num,prod(fun('A,bool),num))) C:fun('A,bool)) s:num))) (\n:num. ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#FINITE:fun(fun(num,bool),bool) (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%17:num. (#?:fun(fun(num,bool),bool) (\j:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%17:num) (C:fun('A,bool) (f:fun(num,'A) j:num))) j:num)))))))) ((#/\:fun(bool,fun(bool,bool)) (C:fun('A,bool) (f:fun(num,'A) s:num))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (C:fun('A,bool) x:'A)) (C:fun('A,bool) y:'A))) ((#real_lt:fun(real,fun(real,bool)) ((d:fun('A,fun('A,real)) x:'A) y:'A)) ((#real_mul:fun(real,fun(real,real)) R:real) (#twopow:fun(int,real) (#int_neg:fun(int,int) (#int_of_num:fun(num,int) n:num))))))))))))))))))))) cond:fun(prod(fun('A,bool),num),fun(num,bool)))))))))))))))))))))))))
      #|subseq_cauchy =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). (#forall:fun(fun(fun(num,num),bool),bool) (\s:fun(num,num). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_cauchy_seq:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun(num,'A),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) f:fun(num,'A))) ((#/\:fun(bool,fun(bool,bool)) (#subseq:fun(fun(num,num),bool) s:fun(num,num))) ((#euclid_converge:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun(num,'A),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) ((#o:fun(fun(num,'A),fun(fun(num,num),fun(num,'A))) f:fun(num,'A)) s:fun(num,num))))))) ((#euclid_converge:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun(num,'A),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) f:fun(num,'A)))))))))))
      #|compact_complete =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#euclid_compact:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (#euclid_top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) X:fun('A,bool)))) (#euclid_complete:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))))))))
      #|countable_cover =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) (#euclid_totally_bounded:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) X:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)))) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) U:fun(fun('A,bool),bool)) (#euclid_top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))))))) (#?:fun(fun(fun(fun('A,bool),bool),bool),bool) (\V:fun(fun('A,bool),bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) V:fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) X:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) V:fun(fun('A,bool),bool)))) (#COUNTABLE:fun(fun(fun('A,bool),bool),bool) V:fun(fun('A,bool),bool)))))))))))))
      #|complete_compact =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) (#euclid_totally_bounded:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (#euclid_complete:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))))) ((#euclid_compact:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (#euclid_top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) X:fun('A,bool)))))))
      #|uniformly_continuous =  |- (#forall:fun(fun(fun('B,bool),bool),bool) (\Y:fun('B,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\dX:fun('A,fun('A,real)). (#forall:fun(fun(fun('B,fun('B,real)),bool),bool) (\dY:fun('B,fun('B,real)). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) (((#euclid_uniformly_continuous:fun(fun('A,'B),fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(prod(fun('B,bool),fun('B,fun('B,real))),bool))) f:fun('A,'B)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) dX:fun('A,fun('A,real)))) ((#,:fun(fun('B,bool),fun(fun('B,fun('B,real)),prod(fun('B,bool),fun('B,fun('B,real))))) Y:fun('B,bool)) dY:fun('B,fun('B,real))))) (#forall:fun(fun(real,bool),bool) (\epsilon:real. (#?:fun(fun(real,bool),bool) (\delta:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) epsilon:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) delta:real)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (X:fun('A,bool) x:'A)) ((#/\:fun(bool,fun(bool,bool)) (X:fun('A,bool) y:'A)) ((#real_lt:fun(real,fun(real,bool)) ((dX:fun('A,fun('A,real)) x:'A) y:'A)) delta:real)))) ((#real_lt:fun(real,fun(real,bool)) ((dY:fun('B,fun('B,real)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A))) epsilon:real)))))))))))))))))))))))
      #|compact_uniformly_continuous =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\dX:fun('A,fun('A,real)). (#forall:fun(fun(fun('B,bool),bool),bool) (\Y:fun('B,bool). (#forall:fun(fun(fun('B,fun('B,real)),bool),bool) (\dY:fun('B,fun('B,real)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#euclid_metric_continuous:fun(fun('A,'B),fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(prod(fun('B,bool),fun('B,fun('B,real))),bool))) f:fun('A,'B)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) dX:fun('A,fun('A,real)))) ((#,:fun(fun('B,bool),fun(fun('B,fun('B,real)),prod(fun('B,bool),fun('B,fun('B,real))))) Y:fun('B,bool)) dY:fun('B,fun('B,real))))) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) dX:fun('A,fun('A,real))))) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('B,bool),fun('B,fun('B,real))),bool) ((#,:fun(fun('B,bool),fun(fun('B,fun('B,real)),prod(fun('B,bool),fun('B,fun('B,real))))) Y:fun('B,bool)) dY:fun('B,fun('B,real))))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_compact:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) (#euclid_top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) dX:fun('A,fun('A,real))))) X:fun('A,bool))) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) X:fun('A,bool))) Y:fun('B,bool))))))) (((#euclid_uniformly_continuous:fun(fun('A,'B),fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(prod(fun('B,bool),fun('B,fun('B,real))),bool))) f:fun('A,'B)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) dX:fun('A,fun('A,real)))) ((#,:fun(fun('B,bool),fun(fun('B,fun('B,real)),prod(fun('B,bool),fun('B,fun('B,real))))) Y:fun('B,bool)) dY:fun('B,fun('B,real)))))))))))))))
      #|image_compact =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('B,bool),bool),bool),bool) (\V:fun(fun('B,bool),bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,bool),bool),bool) (\K:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#euclid_continuous:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) f:fun('A,'B)) U:fun(fun('A,bool),bool)) V:fun(fun('B,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_compact:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) K:fun('A,bool))) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) K:fun('A,bool))) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) V:fun(fun('B,bool),bool)))))) ((#euclid_compact:fun(fun(fun('B,bool),bool),fun(fun('B,bool),bool)) V:fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) K:fun('A,bool))))))))))))
      #|metric_bounded =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). ((#=:fun(bool,fun(bool,bool)) (#euclid_metric_bounded:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun(real,bool),bool) (\r:real. ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) X:fun('A,bool)) (((#euclid_open_ball:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun('A,fun(real,fun('A,bool)))) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real)))) x:'A) r:real)))))))))))
      #|euclid_ball_cube =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(real,bool),bool) (\r:real. (#?:fun(fun(num,bool),bool) (\N:num. ((#SUBSET:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) (((#euclid_open_ball:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(num,real),fun(real,fun(fun(num,real),bool)))) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)))) x:fun(num,real)) r:real)) (#GSPEC:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) (\GEN%PVAR%18:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (((#SETSPEC:fun(fun(num,real),fun(bool,fun(fun(num,real),bool))) GEN%PVAR%18:fun(num,real)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) x:fun(num,real))) (#forall:fun(fun(num,bool),bool) (\i:num. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (x:fun(num,real) i:num))) (#real_of_num:fun(num,real) N:num)))))) x:fun(num,real)))))))))))))))
      #|totally_bounded_euclid =  |- (#forall:fun(fun(fun(fun(num,real),bool),bool),bool) (\X:fun(fun(num,real),bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_bounded:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),bool) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) X:fun(fun(num,real),bool)) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real))))) ((#SUBSET:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) X:fun(fun(num,real),bool)) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num)))) (#euclid_totally_bounded:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),bool) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) X:fun(fun(num,real),bool)) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)))))))))
      #|induced_compact =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\K:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) K:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)))) ((#=:fun(bool,fun(bool,bool)) ((#euclid_compact:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) K:fun('A,bool))) ((#euclid_compact:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) ((#euclid_induced_top:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) U:fun(fun('A,bool),bool)) K:fun('A,bool))) K:fun('A,bool))))))))
      #|compact_euclid =  |- (#forall:fun(fun(fun(fun(num,real),bool),bool),bool) (\X:fun(fun(num,real),bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) X:fun(fun(num,real),bool)) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num))) ((#=:fun(bool,fun(bool,bool)) ((#euclid_compact:fun(fun(fun(fun(num,real),bool),bool),fun(fun(fun(num,real),bool),bool)) (#euclid_top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real))))) X:fun(fun(num,real),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_closed_:fun(fun(fun(fun(num,real),bool),bool),fun(fun(fun(num,real),bool),bool)) (#euclid_top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real))))) X:fun(fun(num,real),bool))) (#euclid_metric_bounded:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),bool) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) X:fun(fun(num,real),bool)) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)))))))))))
      #|neg_continuous =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (((#euclid_metric_continuous:fun(fun(fun(num,real),fun(num,real)),fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),bool))) #euclid_euclid_neg:fun(fun(num,real),fun(num,real))) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)))) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real))))))
      #|continuous_comp =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('B,'C),bool),bool) (\g:fun('B,'C). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('B,bool),bool),bool),bool) (\V:fun(fun('B,bool),bool). (#forall:fun(fun(fun(fun('C,bool),bool),bool),bool) (\W:fun(fun('C,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#euclid_continuous:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) f:fun('A,'B)) U:fun(fun('A,bool),bool)) V:fun(fun('B,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (((#euclid_continuous:fun(fun('B,'C),fun(fun(fun('B,bool),bool),fun(fun(fun('C,bool),bool),bool))) g:fun('B,'C)) V:fun(fun('B,bool),bool)) W:fun(fun('C,bool),bool))) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)))) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) V:fun(fun('B,bool),bool)))))) (((#euclid_continuous:fun(fun('A,'C),fun(fun(fun('A,bool),bool),fun(fun(fun('C,bool),bool),bool))) ((#o:fun(fun('B,'C),fun(fun('A,'B),fun('A,'C))) g:fun('B,'C)) f:fun('A,'B))) U:fun(fun('A,bool),bool)) W:fun(fun('C,bool),bool)))))))))))))
      #|compact_max =  |- (#forall:fun(fun(fun('A,fun(num,real)),bool),bool) (\f:fun('A,fun(num,real)). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\K:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#euclid_continuous:fun(fun('A,fun(num,real)),fun(fun(fun('A,bool),bool),fun(fun(fun(fun(num,real),bool),bool),bool))) f:fun('A,fun(num,real))) U:fun(fun('A,bool),bool)) (#euclid_top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)))))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) ((#IMAGE:fun(fun('A,fun(num,real)),fun(fun('A,bool),fun(fun(num,real),bool))) f:fun('A,fun(num,real))) K:fun('A,bool))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_compact:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) K:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) K:fun('A,bool)) #EMPTY:fun('A,bool))))))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) (K:fun('A,bool) x:'A)) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) (K:fun('A,bool) y:'A)) ((#real_le:fun(real,fun(real,bool)) ((f:fun('A,fun(num,real)) y:'A) (#NUMERAL:fun(num,num) #_0:num))) ((f:fun('A,fun(num,real)) x:'A) (#NUMERAL:fun(num,num) #_0:num))))))))))))))))
      #|homeomorphism =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('B,bool),bool),bool),bool) (\V:fun(fun('B,bool),bool). (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) (((#euclid_homeomorphism:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) f:fun('A,'B)) U:fun(fun('A,bool),bool)) V:fun(fun('B,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (((#BIJ:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,'B)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) V:fun(fun('B,bool),bool)))) ((#/\:fun(bool,fun(bool,bool)) (((#euclid_continuous:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) f:fun('A,'B)) U:fun(fun('A,bool),bool)) V:fun(fun('B,bool),bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (U:fun(fun('A,bool),bool) A:fun('A,bool))) (V:fun(fun('B,bool),bool) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) A:fun('A,bool)))))))))))))))
      #|INV_homeomorphism =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('B,bool),bool),bool),bool) (\V:fun(fun('B,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (((#euclid_homeomorphism:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) f:fun('A,'B)) U:fun(fun('A,bool),bool)) V:fun(fun('B,bool),bool))) (((#euclid_continuous:fun(fun('B,'A),fun(fun(fun('B,bool),bool),fun(fun(fun('A,bool),bool),bool))) (((#INV:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),fun('B,'A)))) f:fun('A,'B)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) V:fun(fun('B,bool),bool)))) V:fun(fun('B,bool),bool)) U:fun(fun('A,bool),bool)))))))))
      #|bicont_homeomorphism =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('B,bool),bool),bool),bool) (\V:fun(fun('B,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#BIJ:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,'B)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) V:fun(fun('B,bool),bool)))) ((#/\:fun(bool,fun(bool,bool)) (((#euclid_continuous:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) f:fun('A,'B)) U:fun(fun('A,bool),bool)) V:fun(fun('B,bool),bool))) (((#euclid_continuous:fun(fun('B,'A),fun(fun(fun('B,bool),bool),fun(fun(fun('A,bool),bool),bool))) (((#INV:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),fun('B,'A)))) f:fun('A,'B)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) V:fun(fun('B,bool),bool)))) V:fun(fun('B,bool),bool)) U:fun(fun('A,bool),bool))))) (((#euclid_homeomorphism:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) f:fun('A,'B)) U:fun(fun('A,bool),bool)) V:fun(fun('B,bool),bool)))))))))
      #|open_and_closed =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('B,bool),bool),bool),bool) (\V:fun(fun('B,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('B,bool),bool),bool) V:fun(fun('B,bool),bool))) (((#BIJ:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,'B)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) V:fun(fun('B,bool),bool)))))) ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (U:fun(fun('A,bool),bool) A:fun('A,bool))) (V:fun(fun('B,bool),bool) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) A:fun('A,bool))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#euclid_closed_:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) B:fun('A,bool))) ((#euclid_closed_:fun(fun(fun('B,bool),bool),fun(fun('B,bool),bool)) V:fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) B:fun('A,bool))))))))))))))
      #|hausdorff_homeomorphsim =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('B,bool),bool),bool),bool) (\V:fun(fun('B,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#BIJ:fun(fun('A,'B),fun(fun('A,bool),fun(fun('B,bool),bool))) f:fun('A,'B)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) V:fun(fun('B,bool),bool)))) ((#/\:fun(bool,fun(bool,bool)) (((#euclid_continuous:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) f:fun('A,'B)) U:fun(fun('A,bool),bool)) V:fun(fun('B,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_compact:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)))) ((#/\:fun(bool,fun(bool,bool)) (#euclid_hausdorff:fun(fun(fun('B,bool),bool),bool) V:fun(fun('B,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) (#euclid_topology_:fun(fun(fun('B,bool),bool),bool) V:fun(fun('B,bool),bool)))))))) (((#euclid_homeomorphism:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) f:fun('A,'B)) U:fun(fun('A,bool),bool)) V:fun(fun('B,bool),bool)))))))))
      #|d_real =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#euclid_d_real:fun(real,fun(real,real)) x:real) y:real)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) x:real) y:real)))))))
      #|metric_real =  |- (#euclid_metric_space:fun(prod(fun(real,bool),fun(real,fun(real,real))),bool) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid_d_real:fun(real,fun(real,real))))
      #|continuous_euclid1 =  |- (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(num,bool),bool) (\n:num. (((#euclid_continuous:fun(fun(fun(num,real),real),fun(fun(fun(fun(num,real),bool),bool),fun(fun(fun(real,bool),bool),bool))) (#euclid_coord:fun(num,fun(fun(num,real),real)) i:num)) (#euclid_top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real))))) (#euclid_top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid_d_real:fun(real,fun(real,real)))))))))
      #|interval_closed_ball =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#?:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#?:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) b:real)) ((#=:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),bool),bool)) (#GSPEC:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) (\GEN%PVAR%19:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (((#SETSPEC:fun(fun(num,real),fun(bool,fun(fun(num,real),bool))) GEN%PVAR%19:fun(num,real)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) x:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) (x:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_le:fun(real,fun(real,bool)) (x:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) b:real)))) x:fun(num,real))))))) (((#euclid_closed_ball:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(num,real),fun(real,fun(fun(num,real),bool)))) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)))) x:fun(num,real)) r:real)))))))))))
      #|interval_euclid1_closed =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#euclid_closed_:fun(fun(fun(fun(num,real),bool),bool),fun(fun(fun(num,real),bool),bool)) (#euclid_top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real))))) (#GSPEC:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) (\GEN%PVAR%20:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (((#SETSPEC:fun(fun(num,real),fun(bool,fun(fun(num,real),bool))) GEN%PVAR%20:fun(num,real)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) x:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) (x:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_le:fun(real,fun(real,bool)) (x:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) b:real)))) x:fun(num,real)))))))))))
      #|interval_euclid1_bounded =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#euclid_metric_bounded:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),bool) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#GSPEC:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) (\GEN%PVAR%21:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (((#SETSPEC:fun(fun(num,real),fun(bool,fun(fun(num,real),bool))) GEN%PVAR%21:fun(num,real)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) x:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) (x:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_le:fun(real,fun(real,bool)) (x:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) b:real)))) x:fun(num,real))))))) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real))))))))
      #|interval_euclid1_compact =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#euclid_compact:fun(fun(fun(fun(num,real),bool),bool),fun(fun(fun(num,real),bool),bool)) (#euclid_top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real))))) (#GSPEC:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) (\GEN%PVAR%22:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (((#SETSPEC:fun(fun(num,real),fun(bool,fun(fun(num,real),bool))) GEN%PVAR%22:fun(num,real)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) x:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) (x:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_le:fun(real,fun(real,bool)) (x:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) b:real)))) x:fun(num,real)))))))))))
      #|interval_image =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#=:fun(fun(real,bool),fun(fun(real,bool),bool)) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%23:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%23:real) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) x:real)))))) ((#IMAGE:fun(fun(fun(num,real),real),fun(fun(fun(num,real),bool),fun(real,bool))) (#euclid_coord:fun(num,fun(fun(num,real),real)) (#NUMERAL:fun(num,num) #_0:num))) (#GSPEC:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) (\GEN%PVAR%24:fun(num,real). (#?:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (((#SETSPEC:fun(fun(num,real),fun(bool,fun(fun(num,real),bool))) GEN%PVAR%24:fun(num,real)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) x:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) (x:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_le:fun(real,fun(real,bool)) (x:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) b:real)))) x:fun(num,real))))))))))))
      #|interval_compact =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#euclid_compact:fun(fun(fun(real,bool),bool),fun(fun(real,bool),bool)) (#euclid_top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid_d_real:fun(real,fun(real,real))))) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%25:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%25:real) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) x:real))))))))))
      #|half_open =  |- (#forall:fun(fun(real,bool),bool) (\a:real. ((#euclid_top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid_d_real:fun(real,fun(real,real)))) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%26:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%26:real) ((#real_lt:fun(real,fun(real,bool)) x:real) a:real)) x:real))))))))
      #|half_open_above =  |- (#forall:fun(fun(real,bool),bool) (\a:real. ((#euclid_top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid_d_real:fun(real,fun(real,real)))) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%27:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%27:real) ((#real_lt:fun(real,fun(real,bool)) a:real) x:real)) x:real))))))))
      #|joinf =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(fun(real,'A),bool),bool) (\f:fun(real,'A). (#forall:fun(fun(fun(real,'A),bool),bool) (\g:fun(real,'A). ((#=:fun(fun(real,'A),fun(fun(real,'A),bool)) (((#euclid_joinf:fun(fun(real,'A),fun(fun(real,'A),fun(real,fun(real,'A)))) f:fun(real,'A)) g:fun(real,'A)) a:real)) (\x:real. (((#COND:fun(bool,fun('A,fun('A,'A))) ((#real_lt:fun(real,fun(real,bool)) x:real) a:real)) (f:fun(real,'A) x:real)) (g:fun(real,'A) x:real))))))))))
      #|joinf_cont =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(fun(real,'A),bool),bool) (\f:fun(real,'A). (#forall:fun(fun(fun(real,'A),bool),bool) (\g:fun(real,'A). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#euclid_continuous:fun(fun(real,'A),fun(fun(fun(real,bool),bool),fun(fun(fun('A,bool),bool),bool))) f:fun(real,'A)) (#euclid_top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid_d_real:fun(real,fun(real,real))))) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) (((#euclid_continuous:fun(fun(real,'A),fun(fun(fun(real,bool),bool),fun(fun(fun('A,bool),bool),bool))) g:fun(real,'A)) (#euclid_top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid_d_real:fun(real,fun(real,real))))) U:fun(fun('A,bool),bool))) ((#=:fun('A,fun('A,bool)) (f:fun(real,'A) a:real)) (g:fun(real,'A) a:real))))) (((#euclid_continuous:fun(fun(real,'A),fun(fun(fun(real,bool),bool),fun(fun(fun('A,bool),bool),bool))) (((#euclid_joinf:fun(fun(real,'A),fun(fun(real,'A),fun(real,fun(real,'A)))) f:fun(real,'A)) g:fun(real,'A)) a:real)) (#euclid_top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid_d_real:fun(real,fun(real,real))))) U:fun(fun('A,bool),bool)))))))))))
      #|neg_cont =  |- (((#euclid_continuous:fun(fun(real,real),fun(fun(fun(real,bool),bool),fun(fun(fun(real,bool),bool),bool))) #real_neg:fun(real,real)) (#euclid_top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid_d_real:fun(real,fun(real,real))))) (#euclid_top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid_d_real:fun(real,fun(real,real)))))
      #|add_cont =  |- (#forall:fun(fun(real,bool),bool) (\u:real. (((#euclid_continuous:fun(fun(real,real),fun(fun(fun(real,bool),bool),fun(fun(fun(real,bool),bool),bool))) (#real_add:fun(real,fun(real,real)) u:real)) (#euclid_top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid_d_real:fun(real,fun(real,real))))) (#euclid_top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid_d_real:fun(real,fun(real,real)))))))
      #|continuous_scale =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) x:fun(num,real))) (((#euclid_continuous:fun(fun(real,fun(num,real)),fun(fun(fun(real,bool),bool),fun(fun(fun(fun(num,real),bool),bool),bool))) (\t:real. ((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) t:real) x:fun(num,real)))) (#euclid_top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid_d_real:fun(real,fun(real,real))))) (#euclid_top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real))))))))))
      #|continuous_lin_combo =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) x:fun(num,real))) ((#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num) y:fun(num,real)))) (((#euclid_continuous:fun(fun(real,fun(num,real)),fun(fun(fun(real,bool),bool),fun(fun(fun(fun(num,real),bool),bool),bool))) (\t:real. ((#euclid_euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) ((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) t:real) x:fun(num,real))) ((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) t:real)) y:fun(num,real))))) (#euclid_top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid_d_real:fun(real,fun(real,real))))) (#euclid_top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real))))))))))))
      #|connected =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\Z:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#euclid_connected:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) Z:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\B:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (U:fun(fun('A,bool),bool) A:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (U:fun(fun('A,bool),bool) B:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) A:fun('A,bool)) B:fun('A,bool))) #EMPTY:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) A:fun('A,bool)) B:fun('A,bool))))))) ((#\/:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) A:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Z:fun('A,bool)) B:fun('A,bool))))))))))))))
      #|connected_unions =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\Z1:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\Z2:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_connected:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) Z1:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#euclid_connected:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) Z2:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#INTER:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) Z1:fun('A,bool)) Z2:fun('A,bool))) #EMPTY:fun('A,bool)))))) ((#euclid_connected:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) ((#UNION:fun(fun('A,bool),fun(fun('A,bool),fun('A,bool))) Z1:fun('A,bool)) Z2:fun('A,bool))))))))))
      #|component_DEF =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#=:fun(bool,fun(bool,bool)) (((#euclid_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A) y:'A)) (#?:fun(fun(fun('A,bool),bool),bool) (\Z:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#euclid_connected:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) Z:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (Z:fun('A,bool) x:'A)) (Z:fun('A,bool) y:'A))))))))))))
      #|connected_sing =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)) x:'A)) ((#euclid_connected:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) ((#INSERT:fun('A,fun(fun('A,bool),fun('A,bool))) x:'A) #EMPTY:fun('A,bool))))))))
      #|component_refl =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)) x:'A)) (((#euclid_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A) x:'A))))))
      #|component_symm =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) (((#euclid_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A) y:'A)) (((#euclid_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) y:'A) x:'A))))))))
      #|component_trans =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#euclid_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A) y:'A)) (((#euclid_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) y:'A) z:'A))) (((#euclid_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A) z:'A))))))))))
      #|connect_real =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#euclid_connected:fun(fun(fun(real,bool),bool),fun(fun(real,bool),bool)) (#euclid_top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid_d_real:fun(real,fun(real,real))))) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%28:real. (#?:fun(fun(real,bool),bool) (\x:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%28:real) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) b:real))) x:real))))))))))
      #|connect_image =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('B,bool),bool),bool),bool) (\V:fun(fun('B,bool),bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\Z:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#euclid_continuous:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) f:fun('A,'B)) U:fun(fun('A,bool),bool)) V:fun(fun('B,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('B,bool),fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) Z:fun('A,bool))) (#UNIONS:fun(fun(fun('B,bool),bool),fun('B,bool)) V:fun(fun('B,bool),bool)))) ((#euclid_connected:fun(fun(fun('A,bool),bool),fun(fun('A,bool),bool)) U:fun(fun('A,bool),bool)) Z:fun('A,bool))))) ((#euclid_connected:fun(fun(fun('B,bool),bool),fun(fun('B,bool),bool)) V:fun(fun('B,bool),bool)) ((#IMAGE:fun(fun('A,'B),fun(fun('A,bool),fun('B,bool))) f:fun('A,'B)) Z:fun('A,bool))))))))))))
      #|path =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#=:fun(bool,fun(bool,bool)) (((#euclid_path:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A) y:'A)) (#?:fun(fun(fun(real,'A),bool),bool) (\f:fun(real,'A). (#?:fun(fun(real,bool),bool) (\a:real. (#?:fun(fun(real,bool),bool) (\b:real. ((#/\:fun(bool,fun(bool,bool)) (((#euclid_continuous:fun(fun(real,'A),fun(fun(fun(real,bool),bool),fun(fun(fun('A,bool),bool),bool))) f:fun(real,'A)) (#euclid_top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid_d_real:fun(real,fun(real,real))))) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (f:fun(real,'A) a:real)) x:'A)) ((#=:fun('A,fun('A,bool)) (f:fun(real,'A) b:real)) y:'A))))))))))))))))
      #|const_continuous =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun(fun(fun('B,bool),bool),bool),bool) (\V:fun(fun('B,bool),bool). (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) (((#euclid_continuous:fun(fun('A,'B),fun(fun(fun('A,bool),bool),fun(fun(fun('B,bool),bool),bool))) (\x:'A. y:'B)) U:fun(fun('A,bool),bool)) V:fun(fun('B,bool),bool)))))))))
      #|path_component =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) (((#euclid_path_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A) y:'A)) (#?:fun(fun(fun(real,'A),bool),bool) (\f:fun(real,'A). (#?:fun(fun(real,bool),bool) (\a:real. (#?:fun(fun(real,bool),bool) (\b:real. ((#/\:fun(bool,fun(bool,bool)) (((#euclid_continuous:fun(fun(real,'A),fun(fun(fun(real,bool),bool),fun(fun(fun('A,bool),bool),bool))) f:fun(real,'A)) (#euclid_top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid_d_real:fun(real,fun(real,real))))) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (f:fun(real,'A) a:real)) x:'A)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (f:fun(real,'A) b:real)) y:'A)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#IMAGE:fun(fun(real,'A),fun(fun(real,bool),fun('A,bool))) f:fun(real,'A)) (#GSPEC:fun(fun(real,bool),fun(real,bool)) (\GEN%PVAR%29:real. (#?:fun(fun(real,bool),bool) (\t:real. (((#SETSPEC:fun(real,fun(bool,fun(real,bool))) GEN%PVAR%29:real) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) t:real)) ((#real_le:fun(real,fun(real,bool)) t:real) b:real))) t:real))))))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))))))))))))))))))))
      #|path_refl =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)) x:'A)) (((#euclid_path_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A) x:'A))))))
      #|path_symm =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) (((#euclid_path_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A) y:'A)) (((#euclid_path_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) y:'A) x:'A))))))))
      #|path_symm_eq =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#=:fun(bool,fun(bool,bool)) (((#euclid_path_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A) y:'A)) (((#euclid_path_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) y:'A) x:'A))))))))
      #|path_trans =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#euclid_path_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A) y:'A)) (((#euclid_path_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) y:'A) z:'A))) (((#euclid_path_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A) z:'A))))))))))
      #|loc_path_conn =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). ((#=:fun(bool,fun(bool,bool)) (#euclid_loc_path_conn:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\A:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (U:fun(fun('A,bool),bool) A:fun('A,bool))) (A:fun('A,bool) x:'A))) (U:fun(fun('A,bool),bool) ((#euclid_path_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) ((#euclid_induced_top:fun(fun(fun('A,bool),bool),fun(fun('A,bool),fun(fun('A,bool),bool))) U:fun(fun('A,bool),bool)) A:fun('A,bool))) x:'A))))))))))
      #|path_eq_conn =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#euclid_loc_path_conn:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool))) (#euclid_topology_:fun(fun(fun('A,bool),bool),bool) U:fun(fun('A,bool),bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#euclid_path_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A)) ((#euclid_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A)))))))
      #|open_ball_star =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(real,bool),bool) (\r:real. (#forall:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). (#forall:fun(fun(real,bool),bool) (\t:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((((#euclid_open_ball:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(num,real),fun(real,fun(fun(num,real),bool)))) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)))) x:fun(num,real)) r:real) y:fun(num,real))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) t:real)) ((#real_le:fun(real,fun(real,bool)) t:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((((#euclid_open_ball:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(num,real),fun(real,fun(fun(num,real),bool)))) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)))) x:fun(num,real)) r:real) ((#euclid_euclid_plus:fun(fun(num,real),fun(fun(num,real),fun(num,real))) ((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) t:real) x:fun(num,real))) ((#euclid_euclid_scale:fun(real,fun(fun(num,real),fun(num,real))) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) t:real)) y:fun(num,real)))))))))))))))
      #|open_ball_path =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\x:fun(num,real). (#forall:fun(fun(real,bool),bool) (\r:real. (#forall:fun(fun(fun(num,real),bool),bool) (\y:fun(num,real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((((#euclid_open_ball:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(num,real),fun(real,fun(fun(num,real),bool)))) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)))) x:fun(num,real)) r:real) y:fun(num,real))) (((#euclid_path_component:fun(fun(fun(fun(num,real),bool),bool),fun(fun(num,real),fun(fun(num,real),bool))) (#euclid_top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (((#euclid_open_ball:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(num,real),fun(real,fun(fun(num,real),bool)))) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)))) x:fun(num,real)) r:real)) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real))))) y:fun(num,real)) x:fun(num,real)))))))))))
      #|path_domain =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#=:fun(bool,fun(bool,bool)) (((#euclid_path_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A) y:'A)) (#?:fun(fun(fun(real,'A),bool),bool) (\f:fun(real,'A). (#?:fun(fun(real,bool),bool) (\a:real. (#?:fun(fun(real,bool),bool) (\b:real. ((#/\:fun(bool,fun(bool,bool)) (((#euclid_continuous:fun(fun(real,'A),fun(fun(fun(real,bool),bool),fun(fun(fun('A,bool),bool),bool))) f:fun(real,'A)) (#euclid_top_of_metric:fun(prod(fun(real,bool),fun(real,fun(real,real))),fun(fun(real,bool),bool)) ((#,:fun(fun(real,bool),fun(fun(real,fun(real,real)),prod(fun(real,bool),fun(real,fun(real,real))))) #UNIV:fun(real,bool)) #euclid_d_real:fun(real,fun(real,real))))) U:fun(fun('A,bool),bool))) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) a:real) b:real)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (f:fun(real,'A) a:real)) x:'A)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (f:fun(real,'A) b:real)) y:'A)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#IMAGE:fun(fun(real,'A),fun(fun(real,bool),fun('A,bool))) f:fun(real,'A)) #UNIV:fun(real,bool))) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool))))))))))))))))))))
      #|path_component_subspace =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\X:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\Y:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,real)),bool),bool) (\d:fun('A,fun('A,real)). (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) Y:fun('A,bool)) X:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#euclid_metric_space:fun(prod(fun('A,bool),fun('A,fun('A,real))),bool) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) (Y:fun('A,bool) y:'A)))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) ((#euclid_path_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) (#euclid_top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) Y:fun('A,bool)) d:fun('A,fun('A,real))))) y:'A)) ((#euclid_path_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) (#euclid_top_of_metric:fun(prod(fun('A,bool),fun('A,fun('A,real))),fun(fun('A,bool),bool)) ((#,:fun(fun('A,bool),fun(fun('A,fun('A,real)),prod(fun('A,bool),fun('A,fun('A,real))))) X:fun('A,bool)) d:fun('A,fun('A,real))))) y:'A)))))))))))
      #|path_component_in =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\U:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (((#euclid_path_component:fun(fun(fun('A,bool),bool),fun('A,fun('A,bool))) U:fun(fun('A,bool),bool)) x:'A) y:'A)) ((#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) U:fun(fun('A,bool),bool)) y:'A))))))))
      #|loc_path_conn_euclid =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(fun(num,real),bool),bool),bool) (\A:fun(fun(num,real),bool). ((#==>:fun(bool,fun(bool,bool)) ((#euclid_top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)))) A:fun(fun(num,real),bool))) (#euclid_loc_path_conn:fun(fun(fun(fun(num,real),bool),bool),bool) (#euclid_top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) A:fun(fun(num,real),bool)) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real))))))))))
      #|loc_path_euclid_cor =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(fun(num,real),bool),bool),bool) (\A:fun(fun(num,real),bool). ((#==>:fun(bool,fun(bool,bool)) ((#euclid_top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) (#euclid_euclid:fun(num,fun(fun(num,real),bool)) n:num)) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)))) A:fun(fun(num,real),bool))) ((#=:fun(fun(fun(num,real),fun(fun(num,real),bool)),fun(fun(fun(num,real),fun(fun(num,real),bool)),bool)) (#euclid_path_component:fun(fun(fun(fun(num,real),bool),bool),fun(fun(num,real),fun(fun(num,real),bool))) (#euclid_top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) A:fun(fun(num,real),bool)) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)))))) (#euclid_component:fun(fun(fun(fun(num,real),bool),bool),fun(fun(num,real),fun(fun(num,real),bool))) (#euclid_top_of_metric:fun(prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))),fun(fun(fun(num,real),bool),bool)) ((#,:fun(fun(fun(num,real),bool),fun(fun(fun(num,real),fun(fun(num,real),real)),prod(fun(fun(num,real),bool),fun(fun(num,real),fun(fun(num,real),real))))) A:fun(fun(num,real),bool)) #euclid_d_euclid:fun(fun(num,real),fun(fun(num,real),real)))))))))))
      #|types = metric/1 topology/1 tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = euclid_loc_path_conn euclid_path_component euclid_path euclid_component euclid_connected euclid_joinf euclid_d_real euclid_homeomorphism euclid_metric_bounded euclid_uniformly_continuous euclid_compact euclid_hausdorff euclid_dense euclid_totally_bounded euclid_complete euclid_cauchy_seq euclid_converge euclid_sequence euclid_metric_continuous euclid_metric_continuous_pt euclid_continuous euclid_gen euclid_top_of_metric euclid_open_balls euclid_closed_ball euclid_open_ball euclid_induced_top euclid_closure euclid_closed_ euclid_open_ euclid_topology_ euclid_proj trig_pi_bound_fun trig_pi_fun euclid_vol euclid_euclid_bounded euclid_outer_vol euclid_inner_vol euclid_outer_cube euclid_inner_cube euclid_mk_cube euclid_one_vec euclid_mk_rectangle euclid_set_scale euclid_set_translate euclid_metric_space euclid_mk_triangular_region euclid_mk_interior_triangle euclid_mk_triangle euclid_triple_product euclid_cross_product3 euclid_saturated_packing euclid_packing euclid_mk_convex_cone euclid_mk_signed_angle euclid_mk_angle euclid_mk_half_set euclid_mk_open_half_set euclid_space euclid_plane euclid_line euclid_coplanar euclid_collinear euclid_affine_dim euclid_affine euclid_mk_line euclid_affine_hull euclid_convex_hull euclid_convex euclid_mk_open_segment euclid_mk_segment sum_vector euclid_d_euclid euclid_norm euclid_dot euclid_coord euclid_euclid0 euclid_euclid_minus euclid_euclidean euclid_euclid euclid_euclid_plus euclid_euclid_neg euclid_euclid_scale part7 part6 part5 part4 part3 part2 part1 part0 drop3 drop2 drop1 drop0 INV compose FUN SUPP partition equivalence_relation transitive symmetric reflexive func supp preimage prod deriv2 deriv min_real max_real min_num dirac_delta mark_term TAGB ssqrt interval float twopow nabs GCD DIVIDE integral integrable defint rsum fine gauge tdiv dsize division atn acs asn tan pi root ln cos sin exp diffs differentiable contl diffl tends_real_real suminf summable sums mono subseq lim cauchy convergent tends_num_real tendsto bounded tends dorder mr1 ball mtop mdist metric ismet limpt closed neigh open topology istopology re_compl re_subset re_universe re_null re_intersect re_union re_Union psum superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 439
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?1
      #|counter_genvar = _200220:bool
      #|
    ),
  )
}
