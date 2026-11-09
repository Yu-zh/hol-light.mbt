// Load-fidelity test for realax.ml: replays tools/ocaml_ref/realax_ref.ml
// (keep in sync; refresh with tools/ocaml_ref/refresh_ref.py).

///|
using @testkit {stm, sthm}

///|
test "realax matches realax.ml" {
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot", "impconv", "pair", "compute", "nums", "recursion",
      "arith", "wf", "calc_num", "normalizer", "grobner", "ind_types", "lists", "realax",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("realax")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("dist", () => sthm(@realax.dist()))
  log.attempt("DIST_REFL", () => sthm(@realax.dist_refl()))
  log.attempt("DIST_LZERO", () => sthm(@realax.dist_lzero()))
  log.attempt("DIST_RZERO", () => sthm(@realax.dist_rzero()))
  log.attempt("DIST_SYM", () => sthm(@realax.dist_sym()))
  log.attempt("DIST_LADD", () => sthm(@realax.dist_ladd()))
  log.attempt("DIST_RADD", () => sthm(@realax.dist_radd()))
  log.attempt("DIST_LADD_0", () => sthm(@realax.dist_ladd_0()))
  log.attempt("DIST_RADD_0", () => sthm(@realax.dist_radd_0()))
  log.attempt("DIST_LMUL", () => sthm(@realax.dist_lmul()))
  log.attempt("DIST_RMUL", () => sthm(@realax.dist_rmul()))
  log.attempt("DIST_EQ_0", () => sthm(@realax.dist_eq_0()))
  log.attempt("DIST_ELIM_THM", () => sthm(@realax.dist_elim_thm()))
  log.attempt("DIST_LE_CASES", () => sthm(@realax.dist_le_cases()))
  log.attempt("DIST_ADDBOUND", () => sthm(@realax.dist_addbound()))
  log.attempt("DIST_TRIANGLE", () => sthm(@realax.dist_triangle()))
  log.attempt("DIST_ADD2", () => sthm(@realax.dist_add2()))
  log.attempt("DIST_ADD2_REV", () => sthm(@realax.dist_add2_rev()))
  log.attempt("DIST_TRIANGLE_LE", () => sthm(@realax.dist_triangle_le()))
  log.attempt("DIST_TRIANGLES_LE", () => sthm(@realax.dist_triangles_le()))
  log.attempt("BOUNDS_LINEAR", () => sthm(@realax.bounds_linear()))
  log.attempt("BOUNDS_LINEAR_0", () => sthm(@realax.bounds_linear_0()))
  log.attempt("BOUNDS_DIVIDED", () => sthm(@realax.bounds_divided()))
  log.attempt("BOUNDS_NOTZERO", () => sthm(@realax.bounds_notzero()))
  log.attempt("BOUNDS_IGNORE", () => sthm(@realax.bounds_ignore()))
  log.attempt("is_nadd", () => sthm(@realax.is_nadd()))
  log.attempt("is_nadd_0", () => sthm(@realax.is_nadd_0()))
  log.attempt("nadd_abs", () => sthm(@realax.nadd_abs()))
  log.attempt("nadd_rep", () => sthm(@realax.nadd_rep()))
  log.attempt("NADD_CAUCHY", () => sthm(@realax.nadd_cauchy()))
  log.attempt("NADD_BOUND", () => sthm(@realax.nadd_bound()))
  log.attempt("NADD_MULTIPLICATIVE", () => sthm(@realax.nadd_multiplicative()))
  log.attempt("NADD_ADDITIVE", () => sthm(@realax.nadd_additive()))
  log.attempt("NADD_SUC", () => sthm(@realax.nadd_suc()))
  log.attempt("NADD_DIST_LEMMA", () => sthm(@realax.nadd_dist_lemma()))
  log.attempt("NADD_DIST", () => sthm(@realax.nadd_dist()))
  log.attempt("NADD_ALTMUL", () => sthm(@realax.nadd_altmul()))
  log.attempt("nadd_eq", () => sthm(@realax.nadd_eq()))
  log.attempt("NADD_EQ_REFL", () => sthm(@realax.nadd_eq_refl()))
  log.attempt("NADD_EQ_SYM", () => sthm(@realax.nadd_eq_sym()))
  log.attempt("NADD_EQ_TRANS", () => sthm(@realax.nadd_eq_trans()))
  log.attempt("nadd_of_num", () => sthm(@realax.nadd_of_num()))
  log.attempt("NADD_OF_NUM", () => sthm(@realax.nadd_of_num_v1()))
  log.attempt("NADD_OF_NUM_WELLDEF", () => sthm(@realax.nadd_of_num_welldef()))
  log.attempt("NADD_OF_NUM_EQ", () => sthm(@realax.nadd_of_num_eq()))
  log.attempt("nadd_le", () => sthm(@realax.nadd_le()))
  log.attempt("NADD_LE_WELLDEF_LEMMA", () => {
    sthm(@realax.nadd_le_welldef_lemma())
  })
  log.attempt("NADD_LE_WELLDEF", () => sthm(@realax.nadd_le_welldef()))
  log.attempt("NADD_LE_REFL", () => sthm(@realax.nadd_le_refl()))
  log.attempt("NADD_LE_TRANS", () => sthm(@realax.nadd_le_trans()))
  log.attempt("NADD_LE_ANTISYM", () => sthm(@realax.nadd_le_antisym()))
  log.attempt("NADD_LE_TOTAL_LEMMA", () => sthm(@realax.nadd_le_total_lemma()))
  log.attempt("NADD_LE_TOTAL", () => sthm(@realax.nadd_le_total()))
  log.attempt("NADD_ARCH", () => sthm(@realax.nadd_arch()))
  log.attempt("NADD_OF_NUM_LE", () => sthm(@realax.nadd_of_num_le()))
  log.attempt("nadd_add", () => sthm(@realax.nadd_add()))
  log.attempt("NADD_ADD", () => sthm(@realax.nadd_add_v1()))
  log.attempt("NADD_ADD_WELLDEF", () => sthm(@realax.nadd_add_welldef()))
  log.attempt("NADD_ADD_SYM", () => sthm(@realax.nadd_add_sym()))
  log.attempt("NADD_ADD_ASSOC", () => sthm(@realax.nadd_add_assoc()))
  log.attempt("NADD_ADD_LID", () => sthm(@realax.nadd_add_lid()))
  log.attempt("NADD_ADD_LCANCEL", () => sthm(@realax.nadd_add_lcancel()))
  log.attempt("NADD_LE_ADD", () => sthm(@realax.nadd_le_add()))
  log.attempt("NADD_LE_EXISTS", () => sthm(@realax.nadd_le_exists()))
  log.attempt("NADD_OF_NUM_ADD", () => sthm(@realax.nadd_of_num_add()))
  log.attempt("nadd_mul", () => sthm(@realax.nadd_mul()))
  log.attempt("NADD_MUL", () => sthm(@realax.nadd_mul_v1()))
  log.attempt("NADD_MUL_SYM", () => sthm(@realax.nadd_mul_sym()))
  log.attempt("NADD_MUL_ASSOC", () => sthm(@realax.nadd_mul_assoc()))
  log.attempt("NADD_MUL_LID", () => sthm(@realax.nadd_mul_lid()))
  log.attempt("NADD_LDISTRIB", () => sthm(@realax.nadd_ldistrib()))
  log.attempt("NADD_MUL_WELLDEF_LEMMA", () => {
    sthm(@realax.nadd_mul_welldef_lemma())
  })
  log.attempt("NADD_MUL_WELLDEF", () => sthm(@realax.nadd_mul_welldef()))
  log.attempt("NADD_OF_NUM_MUL", () => sthm(@realax.nadd_of_num_mul()))
  log.attempt("NADD_LE_0", () => sthm(@realax.nadd_le_0()))
  log.attempt("NADD_EQ_IMP_LE", () => sthm(@realax.nadd_eq_imp_le()))
  log.attempt("NADD_LE_LMUL", () => sthm(@realax.nadd_le_lmul()))
  log.attempt("NADD_LE_RMUL", () => sthm(@realax.nadd_le_rmul()))
  log.attempt("NADD_LE_RADD", () => sthm(@realax.nadd_le_radd()))
  log.attempt("NADD_LE_LADD", () => sthm(@realax.nadd_le_ladd()))
  log.attempt("NADD_RDISTRIB", () => sthm(@realax.nadd_rdistrib()))
  log.attempt("NADD_ARCH_MULT", () => sthm(@realax.nadd_arch_mult()))
  log.attempt("NADD_ARCH_ZERO", () => sthm(@realax.nadd_arch_zero()))
  log.attempt("NADD_ARCH_LEMMA", () => sthm(@realax.nadd_arch_lemma()))
  log.attempt("NADD_COMPLETE", () => sthm(@realax.nadd_complete()))
  log.attempt("NADD_UBOUND", () => sthm(@realax.nadd_ubound()))
  log.attempt("NADD_NONZERO", () => sthm(@realax.nadd_nonzero()))
  log.attempt("NADD_LBOUND", () => sthm(@realax.nadd_lbound()))
  log.attempt("nadd_rinv", () => sthm(@realax.nadd_rinv()))
  log.attempt("NADD_MUL_LINV_LEMMA0", () => sthm(@realax.nadd_mul_linv_lemma0()))
  log.attempt("NADD_MUL_LINV_LEMMA1", () => sthm(@realax.nadd_mul_linv_lemma1()))
  log.attempt("NADD_MUL_LINV_LEMMA2", () => sthm(@realax.nadd_mul_linv_lemma2()))
  log.attempt("NADD_MUL_LINV_LEMMA3", () => sthm(@realax.nadd_mul_linv_lemma3()))
  log.attempt("NADD_MUL_LINV_LEMMA4", () => sthm(@realax.nadd_mul_linv_lemma4()))
  log.attempt("NADD_MUL_LINV_LEMMA5", () => sthm(@realax.nadd_mul_linv_lemma5()))
  log.attempt("NADD_MUL_LINV_LEMMA6", () => sthm(@realax.nadd_mul_linv_lemma6()))
  log.attempt("NADD_MUL_LINV_LEMMA7", () => sthm(@realax.nadd_mul_linv_lemma7()))
  log.attempt("NADD_MUL_LINV_LEMMA7a", () => {
    sthm(@realax.nadd_mul_linv_lemma7a())
  })
  log.attempt("NADD_MUL_LINV_LEMMA8", () => sthm(@realax.nadd_mul_linv_lemma8()))
  log.attempt("nadd_inv", () => sthm(@realax.nadd_inv()))
  log.attempt("NADD_INV", () => sthm(@realax.nadd_inv_v1()))
  log.attempt("NADD_MUL_LINV", () => sthm(@realax.nadd_mul_linv()))
  log.attempt("NADD_INV_0", () => sthm(@realax.nadd_inv_0()))
  log.attempt("NADD_INV_WELLDEF", () => sthm(@realax.nadd_inv_welldef()))
  log.attempt("hreal_of_num", () => sthm(@realax.hreal_of_num()))
  log.attempt("hreal_of_num_th", () => sthm(@realax.hreal_of_num_th()))
  log.attempt("hreal_add", () => sthm(@realax.hreal_add()))
  log.attempt("hreal_add_th", () => sthm(@realax.hreal_add_th()))
  log.attempt("hreal_mul", () => sthm(@realax.hreal_mul()))
  log.attempt("hreal_mul_th", () => sthm(@realax.hreal_mul_th()))
  log.attempt("hreal_le", () => sthm(@realax.hreal_le()))
  log.attempt("hreal_le_th", () => sthm(@realax.hreal_le_th()))
  log.attempt("hreal_inv", () => sthm(@realax.hreal_inv()))
  log.attempt("hreal_inv_th", () => sthm(@realax.hreal_inv_th()))
  log.attempt("HREAL_COMPLETE", () => sthm(@realax.hreal_complete()))
  log.attempt("HREAL_OF_NUM_EQ", () => sthm(@realax.hreal_of_num_eq()))
  log.attempt("HREAL_OF_NUM_LE", () => sthm(@realax.hreal_of_num_le()))
  log.attempt("HREAL_OF_NUM_ADD", () => sthm(@realax.hreal_of_num_add()))
  log.attempt("HREAL_OF_NUM_MUL", () => sthm(@realax.hreal_of_num_mul()))
  log.attempt("HREAL_LE_REFL", () => sthm(@realax.hreal_le_refl()))
  log.attempt("HREAL_LE_TRANS", () => sthm(@realax.hreal_le_trans()))
  log.attempt("HREAL_LE_ANTISYM", () => sthm(@realax.hreal_le_antisym()))
  log.attempt("HREAL_LE_TOTAL", () => sthm(@realax.hreal_le_total()))
  log.attempt("HREAL_LE_ADD", () => sthm(@realax.hreal_le_add()))
  log.attempt("HREAL_LE_EXISTS", () => sthm(@realax.hreal_le_exists()))
  log.attempt("HREAL_ARCH", () => sthm(@realax.hreal_arch()))
  log.attempt("HREAL_ADD_SYM", () => sthm(@realax.hreal_add_sym()))
  log.attempt("HREAL_ADD_ASSOC", () => sthm(@realax.hreal_add_assoc()))
  log.attempt("HREAL_ADD_LID", () => sthm(@realax.hreal_add_lid()))
  log.attempt("HREAL_ADD_LCANCEL", () => sthm(@realax.hreal_add_lcancel()))
  log.attempt("HREAL_MUL_SYM", () => sthm(@realax.hreal_mul_sym()))
  log.attempt("HREAL_MUL_ASSOC", () => sthm(@realax.hreal_mul_assoc()))
  log.attempt("HREAL_MUL_LID", () => sthm(@realax.hreal_mul_lid()))
  log.attempt("HREAL_ADD_LDISTRIB", () => sthm(@realax.hreal_add_ldistrib()))
  log.attempt("HREAL_MUL_LINV", () => sthm(@realax.hreal_mul_linv()))
  log.attempt("HREAL_INV_0", () => sthm(@realax.hreal_inv_0()))
  log.attempt("HREAL_LE_EXISTS_DEF", () => sthm(@realax.hreal_le_exists_def()))
  log.attempt("HREAL_EQ_ADD_LCANCEL", () => sthm(@realax.hreal_eq_add_lcancel()))
  log.attempt("HREAL_EQ_ADD_RCANCEL", () => sthm(@realax.hreal_eq_add_rcancel()))
  log.attempt("HREAL_LE_ADD_LCANCEL", () => sthm(@realax.hreal_le_add_lcancel()))
  log.attempt("HREAL_LE_ADD_RCANCEL", () => sthm(@realax.hreal_le_add_rcancel()))
  log.attempt("HREAL_ADD_RID", () => sthm(@realax.hreal_add_rid()))
  log.attempt("HREAL_ADD_RDISTRIB", () => sthm(@realax.hreal_add_rdistrib()))
  log.attempt("HREAL_MUL_LZERO", () => sthm(@realax.hreal_mul_lzero()))
  log.attempt("HREAL_MUL_RZERO", () => sthm(@realax.hreal_mul_rzero()))
  log.attempt("HREAL_ADD_AC", () => sthm(@realax.hreal_add_ac()))
  log.attempt("HREAL_LE_ADD2", () => sthm(@realax.hreal_le_add2()))
  log.attempt("HREAL_LE_MUL_RCANCEL_IMP", () => {
    sthm(@realax.hreal_le_mul_rcancel_imp())
  })
  log.attempt("treal_of_num", () => sthm(@realax.treal_of_num()))
  log.attempt("treal_neg", () => sthm(@realax.treal_neg()))
  log.attempt("treal_add", () => sthm(@realax.treal_add()))
  log.attempt("treal_mul", () => sthm(@realax.treal_mul()))
  log.attempt("treal_le", () => sthm(@realax.treal_le()))
  log.attempt("treal_inv", () => sthm(@realax.treal_inv()))
  log.attempt("treal_eq", () => sthm(@realax.treal_eq()))
  log.attempt("TREAL_EQ_REFL", () => sthm(@realax.treal_eq_refl()))
  log.attempt("TREAL_EQ_SYM", () => sthm(@realax.treal_eq_sym()))
  log.attempt("TREAL_EQ_TRANS", () => sthm(@realax.treal_eq_trans()))
  log.attempt("TREAL_EQ_AP", () => sthm(@realax.treal_eq_ap()))
  log.attempt("TREAL_OF_NUM_EQ", () => sthm(@realax.treal_of_num_eq()))
  log.attempt("TREAL_OF_NUM_LE", () => sthm(@realax.treal_of_num_le()))
  log.attempt("TREAL_OF_NUM_ADD", () => sthm(@realax.treal_of_num_add()))
  log.attempt("TREAL_OF_NUM_MUL", () => sthm(@realax.treal_of_num_mul()))
  log.attempt("TREAL_ADD_SYM_EQ", () => sthm(@realax.treal_add_sym_eq()))
  log.attempt("TREAL_MUL_SYM_EQ", () => sthm(@realax.treal_mul_sym_eq()))
  log.attempt("TREAL_ADD_SYM", () => sthm(@realax.treal_add_sym()))
  log.attempt("TREAL_ADD_ASSOC", () => sthm(@realax.treal_add_assoc()))
  log.attempt("TREAL_ADD_LID", () => sthm(@realax.treal_add_lid()))
  log.attempt("TREAL_ADD_LINV", () => sthm(@realax.treal_add_linv()))
  log.attempt("TREAL_MUL_SYM", () => sthm(@realax.treal_mul_sym()))
  log.attempt("TREAL_MUL_ASSOC", () => sthm(@realax.treal_mul_assoc()))
  log.attempt("TREAL_MUL_LID", () => sthm(@realax.treal_mul_lid()))
  log.attempt("TREAL_ADD_LDISTRIB", () => sthm(@realax.treal_add_ldistrib()))
  log.attempt("TREAL_LE_REFL", () => sthm(@realax.treal_le_refl()))
  log.attempt("TREAL_LE_ANTISYM", () => sthm(@realax.treal_le_antisym()))
  log.attempt("TREAL_LE_TRANS", () => sthm(@realax.treal_le_trans()))
  log.attempt("TREAL_LE_TOTAL", () => sthm(@realax.treal_le_total()))
  log.attempt("TREAL_LE_LADD_IMP", () => sthm(@realax.treal_le_ladd_imp()))
  log.attempt("TREAL_LE_MUL", () => sthm(@realax.treal_le_mul()))
  log.attempt("TREAL_INV_0", () => sthm(@realax.treal_inv_0()))
  log.attempt("TREAL_MUL_LINV", () => sthm(@realax.treal_mul_linv()))
  log.attempt("TREAL_OF_NUM_WELLDEF", () => sthm(@realax.treal_of_num_welldef()))
  log.attempt("TREAL_NEG_WELLDEF", () => sthm(@realax.treal_neg_welldef()))
  log.attempt("TREAL_ADD_WELLDEFR", () => sthm(@realax.treal_add_welldefr()))
  log.attempt("TREAL_ADD_WELLDEF", () => sthm(@realax.treal_add_welldef()))
  log.attempt("TREAL_MUL_WELLDEFR", () => sthm(@realax.treal_mul_welldefr()))
  log.attempt("TREAL_MUL_WELLDEF", () => sthm(@realax.treal_mul_welldef()))
  log.attempt("TREAL_EQ_IMP_LE", () => sthm(@realax.treal_eq_imp_le()))
  log.attempt("TREAL_LE_WELLDEF", () => sthm(@realax.treal_le_welldef()))
  log.attempt("TREAL_INV_WELLDEF", () => sthm(@realax.treal_inv_welldef()))
  log.attempt("real_of_num", () => sthm(@realax.real_of_num()))
  log.attempt("real_of_num_th", () => sthm(@realax.real_of_num_th()))
  log.attempt("real_neg", () => sthm(@realax.real_neg()))
  log.attempt("real_neg_th", () => sthm(@realax.real_neg_th()))
  log.attempt("real_add", () => sthm(@realax.real_add()))
  log.attempt("real_add_th", () => sthm(@realax.real_add_th()))
  log.attempt("real_mul", () => sthm(@realax.real_mul()))
  log.attempt("real_mul_th", () => sthm(@realax.real_mul_th()))
  log.attempt("real_le", () => sthm(@realax.real_le()))
  log.attempt("real_le_th", () => sthm(@realax.real_le_th()))
  log.attempt("real_inv", () => sthm(@realax.real_inv()))
  log.attempt("real_inv_th", () => sthm(@realax.real_inv_th()))
  log.attempt("REAL_ADD_SYM", () => sthm(@realax.real_add_sym()))
  log.attempt("REAL_ADD_ASSOC", () => sthm(@realax.real_add_assoc()))
  log.attempt("REAL_ADD_LID", () => sthm(@realax.real_add_lid()))
  log.attempt("REAL_ADD_LINV", () => sthm(@realax.real_add_linv()))
  log.attempt("REAL_MUL_SYM", () => sthm(@realax.real_mul_sym()))
  log.attempt("REAL_MUL_ASSOC", () => sthm(@realax.real_mul_assoc()))
  log.attempt("REAL_MUL_LID", () => sthm(@realax.real_mul_lid()))
  log.attempt("REAL_ADD_LDISTRIB", () => sthm(@realax.real_add_ldistrib()))
  log.attempt("REAL_LE_REFL", () => sthm(@realax.real_le_refl()))
  log.attempt("REAL_LE_ANTISYM", () => sthm(@realax.real_le_antisym()))
  log.attempt("REAL_LE_TRANS", () => sthm(@realax.real_le_trans()))
  log.attempt("REAL_LE_TOTAL", () => sthm(@realax.real_le_total()))
  log.attempt("REAL_LE_LADD_IMP", () => sthm(@realax.real_le_ladd_imp()))
  log.attempt("REAL_LE_MUL", () => sthm(@realax.real_le_mul()))
  log.attempt("REAL_INV_0", () => sthm(@realax.real_inv_0()))
  log.attempt("REAL_MUL_LINV", () => sthm(@realax.real_mul_linv()))
  log.attempt("REAL_OF_NUM_EQ", () => sthm(@realax.real_of_num_eq()))
  log.attempt("REAL_OF_NUM_LE", () => sthm(@realax.real_of_num_le()))
  log.attempt("REAL_OF_NUM_ADD", () => sthm(@realax.real_of_num_add()))
  log.attempt("REAL_OF_NUM_MUL", () => sthm(@realax.real_of_num_mul()))
  log.attempt("real_sub", () => sthm(@realax.real_sub()))
  log.attempt("real_lt", () => sthm(@realax.real_lt()))
  log.attempt("real_ge", () => sthm(@realax.real_ge()))
  log.attempt("real_gt", () => sthm(@realax.real_gt()))
  log.attempt("real_abs", () => sthm(@realax.real_abs()))
  log.attempt("real_pow", () => sthm(@realax.real_pow()))
  log.attempt("real_div", () => sthm(@realax.real_div()))
  log.attempt("real_max", () => sthm(@realax.real_max()))
  log.attempt("real_min", () => sthm(@realax.real_min()))
  log.attempt("REAL_HREAL_LEMMA1", () => sthm(@realax.real_hreal_lemma1()))
  log.attempt("REAL_HREAL_LEMMA2", () => sthm(@realax.real_hreal_lemma2()))
  log.attempt("REAL_COMPLETE_SOMEPOS", () => {
    sthm(@realax.real_complete_somepos())
  })
  log.attempt("REAL_COMPLETE", () => sthm(@realax.real_complete()))
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
      #|realax quotations (762):
      #|  :(A, A) -> A
      #|  :(A, A) -> A
      #|  :(A, A) -> A
      #|  :(A, A) -> A
      #|  :(A, A) -> Bool
      #|  :(A, A) -> Bool
      #|  :(A, A) -> Bool
      #|  :(A, A) -> Bool
      #|  :(A) -> A
      #|  :(A, Num) -> A
      #|  :(A) -> A
      #|  :(A) -> A
      #|  :(A, A) -> A
      #|  :(A, A) -> A
      #|  :(Num) -> A
      #|  op_gt_eq
      #|  op_gt
      #|  op_lt_eq
      #|  op_lt
      #|  op_star
      #|  op_minus
      #|  op_plus
      #|  (dist : ((Num, Num)) -> Num)(((m : Num), (n : Num))) == m - n + (n - m)
      #|  \226\136\128 n : Num, dist((n, n)) == 0
      #|  \226\136\128 n : Num, dist((0, n)) == n
      #|  \226\136\128 n : Num, dist((n, 0)) == n
      #|  \226\136\128 m : Num, \226\136\128 n : Num, dist((m, n)) == dist((n, m))
      #|  \226\136\128 m : Num, \226\136\128 p : Num, \226\136\128 n : Num, dist((m + n, m + p)) == dist((n, p))
      #|  \226\136\128 m : Num, \226\136\128 p : Num, \226\136\128 n : Num, dist((m + p, n + p)) == dist((m, n))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, dist((m + n, m)) == n
      #|  \226\136\128 m : Num, \226\136\128 n : Num, dist((m, m + n)) == n
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, m * dist((n, p)) == dist((m * n, m * p))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, dist((m, n)) * p == dist((m * p, n * p))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (dist((m, n)) == 0) == (m == n)
      #|  (e : Num) == 0
      #|  (e : Num)
      #|  (y : Num)
      #|  (x : Num)
      #|  (P : (Num) -> Bool)(dist(((x : Num), (y : Num)))) == (\226\136\128 d : Num, (x == y + d \226\134\146 P(d)) && (y == x + d \226\134\146 P(d)))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, (dist((m, n)) <= p) == (m <= n + p && n <= m + p)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, dist((m, n)) <= m + n
      #|  (\226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, dist((m, p)) <= dist((m, n)) + dist((n, p))) && (\226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, \226\136\128 q : Num, dist((m + n, p + q)) <= dist((m, p)) + dist((n, q))) && (\226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, \226\136\128 q : Num, dist((m, p)) <= dist((m + n, p + q)) + dist((n, q)))
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  dist(((m : Num), (n : Num))) + dist((n, (p : Num)))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, \226\136\128 q : Num, dist((m, n)) + dist((n, p)) <= q \226\134\146 dist((m, p)) <= q
      #|  (q : Num)
      #|  (n : Num)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 p : Num, \226\136\128 q : Num, \226\136\128 r : Num, \226\136\128 s : Num, dist((m, n)) <= r && dist((p, q)) <= s \226\134\146 dist((m, p)) <= dist((n, q)) + (r + s)
      #|  SUC((C : Num))
      #|  \226\136\128 A : Num, \226\136\128 B : Num, \226\136\128 C : Num, (\226\136\128 n : Num, A * n <= B * n + C) == (A <= B)
      #|  (B : Num)
      #|  0
      #|  (A : Num)
      #|  \226\136\128 A : Num, \226\136\128 B : Num, (\226\136\128 n : Num, A * n <= B) == (A == 0)
      #|  (n : Num)
      #|  (n : Num)
      #|  !((n : Num) == 0)
      #|  (B : Num) * (n : Num)
      #|  (A : Num) * (n : Num) + (B : Num)
      #|  (n : Num) == 0
      #|  (P : (Num) -> Num)(0) + ((A : Num) + (B : Num))
      #|  (P : (Num) -> Num)((n : Num))
      #|  (n : Num)
      #|  (P : (Num) -> Num)(0) + ((A : Num) + (B : Num))
      #|  0
      #|  (B : Num)
      #|  \226\136\128 P : (Num) -> Num, (\226\136\131 B : Num, \226\136\128 n : Num, P(n) <= B) == (\226\136\131 A : Num, \226\136\131 B : Num, \226\136\128 n : Num, n * P(n) <= A * n + B)
      #|  (p : Num)
      #|  (m : Num) + (n : Num)
      #|  !((m : Num) + (n : Num) == 0)
      #|  (A : Num) * ((m : Num) + (n : Num)) + (B : Num)
      #|  (m : Num) + (n : Num) == 0
      #|  (A : Num) + (B : Num)
      #|  \226\136\128 P : (Num, Num) -> Num, \226\136\128 A : Num, \226\136\128 B : Num, P(0, 0) == 0 && (\226\136\128 m : Num, \226\136\128 n : Num, P(m, n) <= A * (m + n) + B) \226\134\146 (\226\136\131 B : Num, \226\136\128 m : Num, \226\136\128 n : Num, P(m, n) <= B * (m + n))
      #|  !(SUC((N : Num)) <= (i : Num))
      #|  (Q : (Num) -> Num)((i : Num)) + (B : Num)
      #|  SUC((N : Num)) <= (i : Num)
      #|  (i : Num)
      #|  (B : Num) + (P : (Num) -> Num)((N : Num))
      #|  (B : Num)
      #|  (N : Num)
      #|  (N : Num)
      #|  (B : Num)
      #|  (B : Num)
      #|  (B : Num)
      #|  \226\136\128 P : (Num) -> Num, \226\136\128 Q : (Num) -> Num, (\226\136\131 B : Num, \226\136\128 i : Num, P(i) <= Q(i) + B) == (\226\136\131 B : Num, \226\136\131 N : Num, \226\136\128 i : Num, N <= i \226\134\146 P(i) <= Q(i) + B)
      #|  (is_nadd : ((Num) -> Num) -> Bool)((x : (Num) -> Num)) == (\226\136\131 B : Num, \226\136\128 m : Num, \226\136\128 n : Num, dist((m * x(n), n * x(m))) <= B * (m + n))
      #|  is_nadd((n : Num) => 0)
      #|  dest_nadd
      #|  mk_nadd
      #|  \226\136\128 x : Nadd, \226\136\131 B : Num, \226\136\128 m : Num, \226\136\128 n : Num, dist((m * dest_nadd(x, n), n * dest_nadd(x, m))) <= B * (m + n)
      #|  1
      #|  (n : Num)
      #|  (B : Num)
      #|  (B : Num) + dest_nadd((x : Nadd), 1)
      #|  (x : Nadd)
      #|  (B : Num)
      #|  \226\136\128 x : Nadd, \226\136\131 A : Num, \226\136\131 B : Num, \226\136\128 n : Num, dest_nadd(x, n) <= A * n + B
      #|  (!(a : Bool) \226\134\146 (b : Bool)) == (a || b)
      #|  !((n : Num) == 0)
      #|  (n : Num) == 0
      #|  (B : Num) + dest_nadd((x : Nadd), 0)
      #|  (x : Nadd)
      #|  (B : Num)
      #|  \226\136\128 x : Nadd, \226\136\131 B : Num, \226\136\128 m : Num, \226\136\128 n : Num, dist((dest_nadd(x, m * n), m * dest_nadd(x, n))) <= B * m + B
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  op_plus
      #|  1 + (1 + 1)
      #|  ((m : Num) + (n : Num)) * (3 * (B : Num)) == B * (m + (m + n)) + B * (n + (m + n))
      #|  (!(a : Bool) \226\134\146 (b : Bool)) == (a || b)
      #|  !((m : Num) + (n : Num) == 0)
      #|  3 * (B : Num)
      #|  (m : Num) + (n : Num) == 0
      #|  3 * (B : Num) + dest_nadd((x : Nadd), 0)
      #|  (x : Nadd)
      #|  (B : Num)
      #|  \226\136\128 x : Nadd, \226\136\131 B : Num, \226\136\128 m : Num, \226\136\128 n : Num, dist((dest_nadd(x, m + n), dest_nadd(x, m) + dest_nadd(x, n))) <= B
      #|  op_plus
      #|  op_plus
      #|  dest_nadd((x : Nadd), (n : Num)) + dest_nadd(x, 1)
      #|  (B : Num) + dest_nadd((x : Nadd), 1)
      #|  (x : Nadd)
      #|  (B : Num)
      #|  \226\136\128 x : Nadd, \226\136\131 B : Num, \226\136\128 n : Num, dist((dest_nadd(x, SUC(n)), dest_nadd(x, n))) <= B
      #|  dest_nadd((x : Nadd), (m : Num) + (n : Num))
      #|  (B : Num)
      #|  (x : Nadd)
      #|  (B : Num)
      #|  \226\136\128 x : Nadd, \226\136\131 B : Num, \226\136\128 m : Num, \226\136\128 n : Num, dist((dest_nadd(x, m + n), dest_nadd(x, m))) <= B * n
      #|  (n : Num)
      #|  (m : Num)
      #|  (B : Num)
      #|  (x : Nadd)
      #|  (B : Num)
      #|  \226\136\128 x : Nadd, \226\136\131 B : Num, \226\136\128 m : Num, \226\136\128 n : Num, dist((dest_nadd(x, m), dest_nadd(x, n))) <= B * dist((m, n))
      #|  (B : Num) * ((n : Num) + dest_nadd((y : Nadd), n))
      #|  (B : Num) * (L : Num)
      #|  (B : Num) * (1 + (M : Num))
      #|  (L : Num)
      #|  (M : Num)
      #|  (y : Nadd)
      #|  (x : Nadd)
      #|  (B : Num)
      #|  \226\136\128 x : Nadd, \226\136\128 y : Nadd, \226\136\131 A : Num, \226\136\131 B : Num, \226\136\128 n : Num, dist((n * dest_nadd(x, dest_nadd(y, n)), dest_nadd(x, n) * dest_nadd(y, n))) <= A * n + B
      #|  (nadd_eq : (Nadd, Nadd) -> Bool)
      #|  (nadd_eq : (Nadd, Nadd) -> Bool)((x : Nadd), (y : Nadd)) == (\226\136\131 B : Num, \226\136\128 n : Num, dist((dest_nadd(x, n), dest_nadd(y, n))) <= B)
      #|  \226\136\128 x : Nadd, nadd_eq(x, x)
      #|  \226\136\128 x : Nadd, \226\136\128 y : Nadd, nadd_eq(x, y) == nadd_eq(y, x)
      #|  dest_nadd((y : Nadd), (n : Num))
      #|  (n : Num)
      #|  (B1 : Num) + (B2 : Num)
      #|  (B2 : Num)
      #|  (B1 : Num)
      #|  \226\136\128 x : Nadd, \226\136\128 y : Nadd, \226\136\128 z : Nadd, nadd_eq(x, y) && nadd_eq(y, z) \226\134\146 nadd_eq(x, z)
      #|  (nadd_of_num : (Num) -> Nadd)
      #|  (nadd_of_num : (Num) -> Nadd)((k : Num)) == mk_nadd((n : Num) => k * n)
      #|  \226\136\128 k : Num, dest_nadd(nadd_of_num(k)) == ((n : Num) => k * n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m == n \226\134\146 nadd_eq(nadd_of_num(m), nadd_of_num(n))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, nadd_eq(nadd_of_num(m), nadd_of_num(n)) == (m == n)
      #|  (nadd_le : (Nadd, Nadd) -> Bool)
      #|  (nadd_le : (Nadd, Nadd) -> Bool)((x : Nadd), (y : Nadd)) == (\226\136\131 B : Num, \226\136\128 n : Num, dest_nadd(x, n) <= dest_nadd(y, n) + B)
      #|  (n : Num)
      #|  (B2 : Num) + (B : Num) + (B1 : Num)
      #|  (B : Num)
      #|  (B2 : Num)
      #|  (B1 : Num)
      #|  \226\136\128 x : Nadd, \226\136\128 x' : Nadd, \226\136\128 y : Nadd, \226\136\128 y' : Nadd, nadd_eq(x, x') && nadd_eq(y, y') && nadd_le(x, y) \226\134\146 nadd_le(x', y')
      #|  (y' : Nadd)
      #|  (x' : Nadd)
      #|  (y : Nadd)
      #|  (x : Nadd)
      #|  \226\136\128 x : Nadd, \226\136\128 x' : Nadd, \226\136\128 y : Nadd, \226\136\128 y' : Nadd, nadd_eq(x, x') && nadd_eq(y, y') \226\134\146 nadd_le(x, y) == nadd_le(x', y')
      #|  \226\136\128 x : Nadd, nadd_le(x, x)
      #|  (B2 : Num) + (B1 : Num)
      #|  (B2 : Num)
      #|  (B1 : Num)
      #|  \226\136\128 x : Nadd, \226\136\128 y : Nadd, \226\136\128 z : Nadd, nadd_le(x, y) && nadd_le(y, z) \226\134\146 nadd_le(x, z)
      #|  (B : Num)
      #|  (B : Num)
      #|  (B1 : Num) + (B2 : Num)
      #|  (B2 : Num)
      #|  (B1 : Num)
      #|  \226\136\128 x : Nadd, \226\136\128 y : Nadd, (nadd_le(x, y) && nadd_le(y, x)) == nadd_eq(x, y)
      #|  (n : Num) == 0
      #|  (n : Num)
      #|  (B : Num) + dest_nadd((x : Nadd), 0)
      #|  (n : Num)
      #|  \226\136\128 x : Nadd, \226\136\128 y : Nadd, !nadd_le(x, y) \226\134\146 (\226\136\128 B : Num, \226\136\131 n : Num, !(n == 0) && dest_nadd(y, n) + B < dest_nadd(x, n))
      #|  (a : Num) + ((b : Num) + (c : Num)) + ((d : Num) + ((e : Num) + (f : Num))) == d + (b + e) + (a + (c + f))
      #|  (!(a : Bool) && (b : Bool)) && !(c : Bool) && (d : Bool) \226\134\146 !(c || !b) && !(a || !d)
      #|  (n : Num)
      #|  (m : Num)
      #|  (B1 : Num) + (B2 : Num)
      #|  (y : Nadd)
      #|  (B2 : Num)
      #|  (x : Nadd)
      #|  (B1 : Num)
      #|  (a : Bool) == !!a
      #|  \226\136\128 x : Nadd, \226\136\128 y : Nadd, nadd_le(x, y) || nadd_le(y, x)
      #|  \226\136\128 x : Nadd, \226\136\131 n : Num, nadd_le(x, nadd_of_num(n))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, nadd_le(nadd_of_num(m), nadd_of_num(n)) == (m <= n)
      #|  (nadd_add : (Nadd, Nadd) -> Nadd)
      #|  (nadd_add : (Nadd, Nadd) -> Nadd)((x : Nadd), (y : Nadd)) == mk_nadd((n : Num) => dest_nadd(x, n) + dest_nadd(y, n))
      #|  (n : Num)
      #|  (m : Num)
      #|  (B1 : Num) + (B2 : Num)
      #|  (y : Nadd)
      #|  (B2 : Num)
      #|  (x : Nadd)
      #|  (B1 : Num)
      #|  \226\136\128 x : Nadd, \226\136\128 y : Nadd, dest_nadd(nadd_add(x, y)) == ((n : Num) => dest_nadd(x, n) + dest_nadd(y, n))
      #|  (n : Num)
      #|  (B1 : Num) + (B2 : Num)
      #|  (B2 : Num)
      #|  (B1 : Num)
      #|  \226\136\128 x : Nadd, \226\136\128 x' : Nadd, \226\136\128 y : Nadd, \226\136\128 y' : Nadd, nadd_eq(x, x') && nadd_eq(y, y') \226\134\146 nadd_eq(nadd_add(x, y), nadd_add(x', y'))
      #|  \226\136\128 x : Nadd, \226\136\128 y : Nadd, nadd_eq(nadd_add(x, y), nadd_add(y, x))
      #|  \226\136\128 x : Nadd, \226\136\128 y : Nadd, \226\136\128 z : Nadd, nadd_eq(nadd_add(x, nadd_add(y, z)), nadd_add(nadd_add(x, y), z))
      #|  \226\136\128 x : Nadd, nadd_eq(nadd_add(nadd_of_num(0), x), x)
      #|  \226\136\128 x : Nadd, \226\136\128 y : Nadd, \226\136\128 z : Nadd, nadd_eq(nadd_add(x, y), nadd_add(x, z)) \226\134\146 nadd_eq(y, z)
      #|  0
      #|  \226\136\128 x : Nadd, \226\136\128 y : Nadd, nadd_le(x, nadd_add(x, y))
      #|  (n : Num) * dest_nadd((x : Nadd), (m : Num))
      #|  (m : Num) * dest_nadd((x : Nadd), (n : Num))
      #|  (B1 : Num) + ((B2 : Num) + (B : Num))
      #|  (y : Nadd)
      #|  (B2 : Num)
      #|  (x : Nadd)
      #|  (B1 : Num)
      #|  dest_nadd(mk_nadd((d : (Num) -> Num))) == d
      #|  (n : Num)
      #|  (B : Num)
      #|  mk_nadd((d : (Num) -> Num))
      #|  (d : (Num) -> Num)
      #|  (B : Num)
      #|  \226\136\128 x : Nadd, \226\136\128 y : Nadd, nadd_le(x, y) \226\134\146 (\226\136\131 d : Nadd, nadd_eq(y, nadd_add(x, d)))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, nadd_eq(nadd_add(nadd_of_num(m), nadd_of_num(n)), nadd_of_num(m + n))
      #|  (nadd_mul : (Nadd, Nadd) -> Nadd)
      #|  (nadd_mul : (Nadd, Nadd) -> Nadd)((x : Nadd), (y : Nadd)) == mk_nadd((n : Num) => dest_nadd(x, dest_nadd(y, n)))
      #|  (C : Num) * dist(((m : Num) * dest_nadd((y : Nadd), (n : Num)), n * dest_nadd(y, m)))
      #|  dest_nadd((x : Nadd), (n : Num) * dest_nadd((y : Nadd), (m : Num)))
      #|  dest_nadd((x : Nadd), (m : Num) * dest_nadd((y : Nadd), (n : Num)))
      #|  (D : Num) * (m : Num) + D + (D * (n : Num) + D + (C : Num) * ((B : Num) * (m + n)))
      #|  (D : Num) + D
      #|  (D : Num) + (C : Num) * (B : Num)
      #|  (x : Nadd)
      #|  (D : Num)
      #|  (x : Nadd)
      #|  (C : Num)
      #|  (y : Nadd)
      #|  (B : Num)
      #|  \226\136\128 x : Nadd, \226\136\128 y : Nadd, dest_nadd(nadd_mul(x, y)) == ((n : Num) => dest_nadd(x, dest_nadd(y, n)))
      #|  dest_nadd((x : Nadd), (n : Num)) * dest_nadd((y : Nadd), n)
      #|  (a : Num) + (b : Num) + ((c : Num) + (d : Num)) == a + c + (b + d)
      #|  (B1 : Num) + (B2 : Num)
      #|  (A1 : Num) + (A2 : Num)
      #|  (B2 : Num)
      #|  (x : Nadd)
      #|  (y : Nadd)
      #|  (A2 : Num)
      #|  (B1 : Num)
      #|  (y : Nadd)
      #|  (x : Nadd)
      #|  (A1 : Num)
      #|  \226\136\128 x : Nadd, \226\136\128 y : Nadd, nadd_eq(nadd_mul(x, y), nadd_mul(y, x))
      #|  \226\136\128 x : Nadd, \226\136\128 y : Nadd, \226\136\128 z : Nadd, nadd_eq(nadd_mul(x, nadd_mul(y, z)), nadd_mul(nadd_mul(x, y), z))
      #|  \226\136\128 x : Nadd, nadd_eq(nadd_mul(nadd_of_num(1), x), x)
      #|  (B : Num)
      #|  (x : Nadd)
      #|  (B : Num)
      #|  \226\136\128 x : Nadd, \226\136\128 y : Nadd, \226\136\128 z : Nadd, nadd_eq(nadd_mul(x, nadd_add(y, z)), nadd_add(nadd_mul(x, y), nadd_mul(x, z)))
      #|  (B2 : Num) * dist((dest_nadd((y : Nadd), (n : Num)), dest_nadd((y' : Nadd), n)))
      #|  (n : Num)
      #|  (B2 : Num) * (B1 : Num)
      #|  (x : Nadd)
      #|  (B2 : Num)
      #|  (B1 : Num)
      #|  \226\136\128 x : Nadd, \226\136\128 y : Nadd, \226\136\128 y' : Nadd, nadd_eq(y, y') \226\134\146 nadd_eq(nadd_mul(x, y), nadd_mul(x, y'))
      #|  nadd_mul((y : Nadd), (x : Nadd))
      #|  nadd_mul((y : Nadd), (x' : Nadd))
      #|  nadd_mul((x' : Nadd), (y : Nadd))
      #|  \226\136\128 x : Nadd, \226\136\128 x' : Nadd, \226\136\128 y : Nadd, \226\136\128 y' : Nadd, nadd_eq(x, x') && nadd_eq(y, y') \226\134\146 nadd_eq(nadd_mul(x, y), nadd_mul(x', y'))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, nadd_eq(nadd_mul(nadd_of_num(m), nadd_of_num(n)), nadd_of_num(m * n))
      #|  \226\136\128 x : Nadd, nadd_le(nadd_of_num(0), x)
      #|  (B : Num)
      #|  (B : Num)
      #|  \226\136\128 x : Nadd, \226\136\128 y : Nadd, nadd_eq(x, y) \226\134\146 nadd_le(x, y)
      #|  nadd_mul((x : Nadd), nadd_add((y : Nadd), (d : Nadd)))
      #|  nadd_add(nadd_mul((x : Nadd), (y : Nadd)), nadd_mul(x, (d : Nadd)))
      #|  (d : Nadd)
      #|  \226\136\128 x : Nadd, \226\136\128 y : Nadd, \226\136\128 z : Nadd, nadd_le(y, z) \226\134\146 nadd_le(nadd_mul(x, y), nadd_mul(x, z))
      #|  \226\136\128 x : Nadd, \226\136\128 y : Nadd, \226\136\128 z : Nadd, nadd_le(x, y) \226\134\146 nadd_le(nadd_mul(x, z), nadd_mul(y, z))
      #|  \226\136\128 x : Nadd, \226\136\128 y : Nadd, \226\136\128 z : Nadd, nadd_le(nadd_add(x, z), nadd_add(y, z)) == nadd_le(x, y)
      #|  \226\136\128 x : Nadd, \226\136\128 y : Nadd, \226\136\128 z : Nadd, nadd_le(nadd_add(x, y), nadd_add(x, z)) == nadd_le(y, z)
      #|  \226\136\128 x : Nadd, \226\136\128 y : Nadd, \226\136\128 z : Nadd, nadd_eq(nadd_mul(nadd_add(x, y), z), nadd_add(nadd_mul(x, z), nadd_mul(y, z)))
      #|  (i : Num) * dest_nadd((x : Nadd), (N : Num))
      #|  (B : Num) * (i : Num)
      #|  (i : Num)
      #|  (B : Num) * (N : Num)
      #|  (N : Num)
      #|  (N : Num)
      #|  (B : Num) + (k : Num)
      #|  (x : Nadd)
      #|  (B : Num)
      #|  \226\136\128 x : Nadd, \226\136\128 k : Num, !nadd_eq(x, nadd_of_num(0)) \226\134\146 (\226\136\131 N : Num, nadd_le(nadd_of_num(k), nadd_mul(nadd_of_num(N), x)))
      #|  nadd_mul(nadd_add(nadd_of_num(1), nadd_of_num((N : Num))), (x : Nadd))
      #|  nadd_add(nadd_mul(nadd_of_num(1), (x : Nadd)), nadd_mul(nadd_of_num((N : Num)), x))
      #|  nadd_eq(nadd_mul(nadd_of_num((N : Num) + 1), (x : Nadd)), nadd_add(x, nadd_mul(nadd_of_num(N), x)))
      #|  (k : Nadd)
      #|  nadd_mul(nadd_of_num((N : Num)), (x : Nadd))
      #|  !nadd_eq((x : Nadd), nadd_of_num(0))
      #|  (N : Num) + 1
      #|  (p : Num)
      #|  (N : Num)
      #|  (k : Nadd)
      #|  (p : Num)
      #|  \226\136\128 x : Nadd, \226\136\128 k : Nadd, (\226\136\128 n : Num, nadd_le(nadd_mul(nadd_of_num(n), x), k)) \226\134\146 nadd_eq(x, nadd_of_num(0))
      #|  (z : Nadd)
      #|  nadd_add((y : Nadd), nadd_of_num(0))
      #|  nadd_add((y : Nadd), (d : Nadd))
      #|  (d : Nadd)
      #|  (y : Nadd)
      #|  (x : Nadd)
      #|  \226\136\128 x : Nadd, \226\136\128 y : Nadd, \226\136\128 z : Nadd, (\226\136\128 n : Num, nadd_le(nadd_mul(nadd_of_num(n), x), nadd_add(nadd_mul(nadd_of_num(n), y), z))) \226\134\146 nadd_le(x, y)
      #|  nadd_mul(nadd_of_num((n : Num)), (x : Nadd))
      #|  (n : Num)
      #|  (x : Nadd)
      #|  0
      #|  nadd_add(nadd_of_num((r : (Num) -> Num)((n : Num))), nadd_of_num(1))
      #|  (n : Num)
      #|  nadd_of_num(1)
      #|  (z : Nadd)
      #|  (n : Num) * (r : (Num) -> Num)((i : Num)) + n
      #|  (i : Num)
      #|  (n : Num)
      #|  0
      #|  nadd_of_num(SUC((r : (Num) -> Num)((n : Num))))
      #|  (n : Num)
      #|  nadd_of_num(2)
      #|  (x : Nadd)
      #|  (n : Num) * (r : (Num) -> Num)((i : Num)) + n
      #|  (n : Num)
      #|  (i : Num)
      #|  1
      #|  dest_nadd(mk_nadd((r : (Num) -> Num))) == r
      #|  mk_nadd((r : (Num) -> Num))
      #|  nadd_mul(nadd_mul(nadd_of_num((n : Num)), nadd_of_num((i : Num))), (x : Nadd))
      #|  nadd_mul(nadd_mul(nadd_of_num((i : Num)), nadd_of_num((n : Num))), (x : Nadd))
      #|  nadd_mul(nadd_of_num((n : Num)), nadd_mul(nadd_of_num((i : Num)), (x : Nadd)))
      #|  nadd_mul(nadd_of_num((n : Num)), nadd_of_num(SUC((r : (Num) -> Num)((i : Num)))))
      #|  nadd_mul(nadd_of_num((i : Num)), nadd_of_num((r : (Num) -> Num)((n : Num))))
      #|  nadd_mul(nadd_of_num((i : Num)), nadd_mul(nadd_of_num((n : Num)), (x : Nadd)))
      #|  (n : Num)
      #|  (x : Nadd)
      #|  \226\136\128 n : Num, \226\136\128 i : Num, i * (r : (Num) -> Num)(n) <= n * r(i) + n
      #|  nadd_of_num(SUC((r : (Num) -> Num)((n : Num))))
      #|  nadd_mul(nadd_of_num((n : Num)), (x : Nadd))
      #|  ((a : Bool) || (b : Bool)) && !((c : Bool) && b) \226\134\146 c \226\134\146 a
      #|  (x : Nadd)
      #|  (n : Num)
      #|  SUC((r : (Num) -> Num)((n : Num)))
      #|  (n : Num)
      #|  (n : Num)
      #|  (r : (Num) -> Num)
      #|  (m : Nadd)
      #|  nadd_mul(nadd_of_num((n : Num)), nadd_of_num((N : Num)))
      #|  nadd_mul(nadd_of_num((n : Num)), (w : Nadd))
      #|  (w : Nadd)
      #|  (p : Num)
      #|  (n : Num) * (N : Num)
      #|  (m : Nadd)
      #|  (N : Num)
      #|  (a : Nadd)
      #|  0
      #|  \226\136\128 n : Num, \226\136\131 r : Num, (\226\136\131 x : Nadd, (P : (Nadd) -> Bool)(x) && nadd_le(nadd_of_num(r), nadd_mul(nadd_of_num(n), x))) && (\226\136\128 r' : Num, (\226\136\131 x : Nadd, P(x) && nadd_le(nadd_of_num(r'), nadd_mul(nadd_of_num(n), x))) \226\134\146 r' <= r)
      #|  (m : Nadd)
      #|  (a : Nadd)
      #|  \226\136\128 P : (Nadd) -> Bool, (\226\136\131 x : Nadd, P(x)) && (\226\136\131 M : Nadd, \226\136\128 x : Nadd, P(x) \226\134\146 nadd_le(x, M)) \226\134\146 (\226\136\131 M : Nadd, (\226\136\128 x : Nadd, P(x) \226\134\146 nadd_le(x, M)) && (\226\136\128 M' : Nadd, (\226\136\128 x : Nadd, P(x) \226\134\146 nadd_le(x, M')) \226\134\146 nadd_le(M, M')))
      #|  (n : Num)
      #|  (n : Num)
      #|  (A1 : Num) * (n : Num) + (A2 : Num)
      #|  1
      #|  (A1 : Num) + (A2 : Num)
      #|  (x : Nadd)
      #|  (A2 : Num)
      #|  (A1 : Num)
      #|  \226\136\128 x : Nadd, \226\136\131 B : Num, \226\136\131 N : Num, \226\136\128 n : Num, N <= n \226\134\146 dest_nadd(x, n) <= B * n
      #|  (n : Num)
      #|  (n : Num)
      #|  (A2 : Num) + 1
      #|  (A2 : Num)
      #|  (A1 : Num)
      #|  1
      #|  \226\136\128 x : Nadd, !nadd_eq(x, nadd_of_num(0)) \226\134\146 (\226\136\131 N : Num, \226\136\128 n : Num, N <= n \226\134\146 !(dest_nadd(x, n) == 0))
      #|  SUC(0)
      #|  (A1 : Num) * dest_nadd((x : Nadd), (n : Num)) + (A2 : Num)
      #|  (N : Num)
      #|  (A1 : Num) + (A2 : Num)
      #|  (A2 : Num)
      #|  (A1 : Num)
      #|  1
      #|  (N : Num)
      #|  \226\136\128 x : Nadd, !nadd_eq(x, nadd_of_num(0)) \226\134\146 (\226\136\131 A : Num, \226\136\131 N : Num, \226\136\128 n : Num, N <= n \226\134\146 n <= A * dest_nadd(x, n))
      #|  (nadd_rinv : (Nadd, Num) -> Num)((x : Nadd)) == ((n : Num) => DIV(n * n, dest_nadd(x, n)))
      #|  dest_nadd((x : Nadd), (n : Num)) == 0
      #|  SUC((N : Num))
      #|  nadd_rinv((x : Nadd), (n : Num)) * ((A : Num) * dest_nadd(x, n))
      #|  (n : Num) == 0
      #|  SUC((N : Num)) <= (n : Num)
      #|  (n : Num)
      #|  (A : Num) * (n : Num)
      #|  nadd_rinv((x : Nadd), (n : Num))
      #|  SUC((N : Num))
      #|  0
      #|  (A : Num)
      #|  (N : Num)
      #|  (A : Num)
      #|  \226\136\128 x : Nadd, !nadd_eq(x, nadd_of_num(0)) \226\134\146 (\226\136\131 A : Num, \226\136\131 B : Num, \226\136\128 n : Num, nadd_rinv(x, n) <= A * n + B)
      #|  (n : Num) * n
      #|  \226\136\128 x : Nadd, \226\136\128 n : Num, !(dest_nadd(x, n) == 0) \226\134\146 dist((dest_nadd(x, n) * nadd_rinv(x, n), n * n)) <= dest_nadd(x, n)
      #|  (N : Num)
      #|  (N : Num)
      #|  \226\136\128 x : Nadd, !nadd_eq(x, nadd_of_num(0)) \226\134\146 (\226\136\131 N : Num, \226\136\128 n : Num, N <= n \226\134\146 dist((dest_nadd(x, n) * nadd_rinv(x, n), n * n)) <= dest_nadd(x, n))
      #|  (N : Num)
      #|  (N : Num)
      #|  \226\136\128 x : Nadd, !nadd_eq(x, nadd_of_num(0)) \226\134\146 (\226\136\131 N : Num, \226\136\128 m : Num, \226\136\128 n : Num, N <= n \226\134\146 dist((m * (dest_nadd(x, m) * (dest_nadd(x, n) * nadd_rinv(x, n))), m * (dest_nadd(x, m) * (n * n)))) <= m * (dest_nadd(x, m) * dest_nadd(x, n)))
      #|  (N : Num) <= (m : Num)
      #|  (n : Num)
      #|  (N : Num) <= (n : Num)
      #|  (m : Num)
      #|  (N : Num)
      #|  (N : Num)
      #|  \226\136\128 x : Nadd, !nadd_eq(x, nadd_of_num(0)) \226\134\146 (\226\136\131 N : Num, \226\136\128 m : Num, \226\136\128 n : Num, N <= m && N <= n \226\134\146 dest_nadd(x, m) * dest_nadd(x, n) * dist((m * nadd_rinv(x, n), n * nadd_rinv(x, m))) <= m * n * dist((m * dest_nadd(x, n), n * dest_nadd(x, m))) + dest_nadd(x, m) * dest_nadd(x, n) * (m + n))
      #|  (N1 : Num) + (N2 : Num)
      #|  (a : Num) * (b : Num) * ((c : Num) * (d : Num) * (e : Num)) == a * c * (b * d) * e
      #|  (N1 : Num) + (N2 : Num)
      #|  (m : Num) * (n : Num) * dist((m * dest_nadd((x : Nadd), n), n * dest_nadd(x, m))) + dest_nadd(x, m) * dest_nadd(x, n) * (m + n)
      #|  (N1 : Num) + (N2 : Num)
      #|  (B1 : Num) + (B2 : Num) * B2
      #|  (x : Nadd)
      #|  (N2 : Num)
      #|  (B2 : Num)
      #|  (x : Nadd)
      #|  (B1 : Num)
      #|  (N1 : Num)
      #|  \226\136\128 x : Nadd, !nadd_eq(x, nadd_of_num(0)) \226\134\146 (\226\136\131 B : Num, \226\136\131 N : Num, \226\136\128 m : Num, \226\136\128 n : Num, N <= m && N <= n \226\134\146 dest_nadd(x, m) * dest_nadd(x, n) * dist((m * nadd_rinv(x, n), n * nadd_rinv(x, m))) <= B * (m * n * (m + n)))
      #|  (N1 : Num) + (N2 : Num)
      #|  (a : Num) * ((b : Num) * (c : Num)) * ((d : Num) * (e : Num) * (f : Num)) == b * c * (a * (d * e * f))
      #|  (a : Num) * (b : Num) * (c : Num) * (d : Num) == a * c * (b * d)
      #|  (B2 : Num) * B2 * (dest_nadd((x : Nadd), (m : Num)) * dest_nadd(x, (n : Num)) * dist((m * nadd_rinv(x, n), n * nadd_rinv(x, m))))
      #|  (N1 : Num) + (N2 : Num)
      #|  (B1 : Num) * ((B2 : Num) * B2)
      #|  (N2 : Num)
      #|  (B2 : Num)
      #|  (N1 : Num)
      #|  (B1 : Num)
      #|  \226\136\128 x : Nadd, !nadd_eq(x, nadd_of_num(0)) \226\134\146 (\226\136\131 B : Num, \226\136\131 N : Num, \226\136\128 m : Num, \226\136\128 n : Num, N <= m && N <= n \226\134\146 m * n * dist((m * nadd_rinv(x, n), n * nadd_rinv(x, m))) <= B * (m * n * (m + n)))
      #|  (N : Num) + 1
      #|  SUC(0) == 1 * 1
      #|  (a : Num) * ((b : Num) * (c : Num)) == b * (a * c)
      #|  (N : Num) + 1
      #|  (N : Num) <= (m : Num) && N <= (n : Num)
      #|  (n : Num)
      #|  (m : Num)
      #|  (N : Num) + 1
      #|  (B : Num)
      #|  (N : Num)
      #|  (B : Num)
      #|  \226\136\128 x : Nadd, !nadd_eq(x, nadd_of_num(0)) \226\134\146 (\226\136\131 B : Num, \226\136\131 N : Num, \226\136\128 m : Num, \226\136\128 n : Num, N <= m && N <= n \226\134\146 dist((m * nadd_rinv(x, n), n * nadd_rinv(x, m))) <= B * (m + n))
      #|  (A : Num) * (n : Num) + (B : Num)
      #|  (a : Num) + ((b : Num) + (c : Num)) + ((d : Num) + (e : Num)) == c + d + (b + (a + e))
      #|  SUC((N : Num)) * nadd_rinv((x : Nadd), (n : Num)) + n * nadd_rinv(x, SUC(N))
      #|  SUC((N : Num)) * (B0 : Num) + (B : Num)
      #|  (A : Num) + (nadd_rinv((x : Nadd), SUC((N : Num))) + SUC(N) * (A0 : Num))
      #|  (B : Num)
      #|  (A : Num)
      #|  0
      #|  nadd_rinv((x : Nadd), 0)
      #|  (B0 : Num)
      #|  (A0 : Num)
      #|  \226\136\128 x : Nadd, !nadd_eq(x, nadd_of_num(0)) \226\134\146 (\226\136\128 N : Num, \226\136\131 A : Num, \226\136\131 B : Num, \226\136\128 m : Num, \226\136\128 n : Num, m <= N \226\134\146 dist((m * nadd_rinv(x, n), n * nadd_rinv(x, m))) <= A * n + B)
      #|  (A : Num) * (n : Num) + (B : Num)
      #|  (A : Num) * (m : Num) + (B : Num)
      #|  (B0 : Num) * ((m : Num) + (n : Num))
      #|  (n : Num)
      #|  (N : Num)
      #|  (m : Num)
      #|  (N : Num)
      #|  (B : Num)
      #|  (A : Num) + (B0 : Num)
      #|  (B : Num)
      #|  (A : Num)
      #|  (N : Num)
      #|  (N : Num)
      #|  (B0 : Num)
      #|  \226\136\128 x : Nadd, !nadd_eq(x, nadd_of_num(0)) \226\134\146 (\226\136\131 B : Num, \226\136\128 m : Num, \226\136\128 n : Num, dist((m * nadd_rinv(x, n), n * nadd_rinv(x, m))) <= B * (m + n))
      #|  (nadd_inv : (Nadd) -> Nadd)((x : Nadd)) == (if nadd_eq(x, nadd_of_num(0)) { nadd_of_num(0) } else { mk_nadd(nadd_rinv(x)) })
      #|  nadd_inv
      #|  nadd_eq((x : Nadd), nadd_of_num(0))
      #|  \226\136\128 x : Nadd, dest_nadd(inv(x)) == (if nadd_eq(x, nadd_of_num(0)) { (n : Num) => 0 } else { nadd_rinv(x) })
      #|  (a : Num) + (b : Num) + ((c : Num) + (d : Num)) == a + c + (b + d)
      #|  dest_nadd(inv((x : Nadd)), (n : Num)) * dest_nadd(x, n)
      #|  (B1 : Num) + (B2 : Num)
      #|  (A1 : Num) + (A2 : Num)
      #|  dest_nadd((x : Nadd), (n : Num))
      #|  (N : Num)
      #|  (B' : Num)
      #|  (A' : Num)
      #|  \226\136\131 A2 : Num, \226\136\131 B2 : Num, \226\136\128 n : Num, dist((dest_nadd((x : Nadd), n) * nadd_rinv(x, n), n * n)) <= A2 * n + B2
      #|  (x : Nadd)
      #|  (B' : Num)
      #|  (A' : Num)
      #|  (N : Num)
      #|  (x : Nadd)
      #|  inv((x : Nadd))
      #|  (B1 : Num)
      #|  (A1 : Num)
      #|  \226\136\128 x : Nadd, !nadd_eq(x, nadd_of_num(0)) \226\134\146 nadd_eq(nadd_mul(inv(x), x), nadd_of_num(1))
      #|  nadd_eq(inv(nadd_of_num(0)), nadd_of_num(0))
      #|  nadd_mul(nadd_mul(inv((y : Nadd)), y), inv((x : Nadd)))
      #|  nadd_mul(inv((y : Nadd)), nadd_mul(inv((x : Nadd)), y))
      #|  nadd_mul(inv((y : Nadd)), nadd_mul(inv((x : Nadd)), x))
      #|  nadd_mul(inv((y : Nadd)), nadd_of_num(1))
      #|  !nadd_eq((y : Nadd), nadd_of_num(0))
      #|  nadd_eq((y : Nadd), nadd_of_num(0))
      #|  nadd_eq((x : Nadd), nadd_of_num(0))
      #|  \226\136\128 x : Nadd, \226\136\128 y : Nadd, nadd_eq(x, y) \226\134\146 nadd_eq(inv(x), inv(y))
      #|  nadd_eq
      #|  (hreal_le : (Hreal, Hreal) -> Bool)
      #|  (hreal_mul : (Hreal, Hreal) -> Hreal)
      #|  (hreal_add : (Hreal, Hreal) -> Hreal)
      #|  (hreal_inv : (Hreal) -> Hreal)
      #|  (hreal_of_num : (Num) -> Hreal)
      #|  (P : (Nadd) -> Bool) == ((x : Nadd) => (Q : (Hreal) -> Bool)(mk_hreal(nadd_eq(x))))
      #|  (x : Nadd)
      #|  (x : Nadd) => (Q : (Hreal) -> Bool)(mk_hreal(nadd_eq(x)))
      #|  (P : (Hreal) -> Bool)
      #|  \226\136\128 m : Hreal, \226\136\128 n : Hreal, (m <= n) == (\226\136\131 d : Hreal, n == m + d)
      #|  \226\136\128 m : Hreal, \226\136\128 n : Hreal, \226\136\128 p : Hreal, (m + n == m + p) == (n == p)
      #|  \226\136\128 m : Hreal, \226\136\128 n : Hreal, \226\136\128 p : Hreal, (m + p == n + p) == (m == n)
      #|  \226\136\128 m : Hreal, \226\136\128 n : Hreal, \226\136\128 p : Hreal, (m + n <= m + p) == (n <= p)
      #|  \226\136\128 m : Hreal, \226\136\128 n : Hreal, \226\136\128 p : Hreal, (m + p <= n + p) == (m <= n)
      #|  \226\136\128 n : Hreal, n + hreal_of_num(0) == n
      #|  \226\136\128 m : Hreal, \226\136\128 n : Hreal, \226\136\128 p : Hreal, (m + n) * p == m * p + n * p
      #|  (m : Hreal)
      #|  hreal_of_num(1)
      #|  hreal_of_num(0)
      #|  \226\136\128 m : Hreal, hreal_of_num(0) * m == hreal_of_num(0)
      #|  \226\136\128 m : Hreal, m * hreal_of_num(0) == hreal_of_num(0)
      #|  (m : Hreal) + (n : Hreal) == n + m && m + n + (p : Hreal) == m + (n + p) && m + (n + p) == n + (m + p)
      #|  (d1 : Hreal) + (d2 : Hreal)
      #|  (d2 : Hreal)
      #|  (d1 : Hreal)
      #|  \226\136\128 a : Hreal, \226\136\128 b : Hreal, \226\136\128 c : Hreal, \226\136\128 d : Hreal, a <= b && c <= d \226\134\146 a + c <= b + d
      #|  (d : Hreal) * (c : Hreal)
      #|  (d : Hreal)
      #|  \226\136\128 a : Hreal, \226\136\128 b : Hreal, \226\136\128 c : Hreal, a <= b \226\134\146 a * c <= b * c
      #|  (treal_of_num : (Num) -> (Hreal, Hreal))((n : Num)) == (hreal_of_num(n), hreal_of_num(0))
      #|  (treal_neg : ((Hreal, Hreal)) -> (Hreal, Hreal))(((x : Hreal), (y : Hreal))) == (y, x)
      #|  (treal_add : ((Hreal, Hreal), (Hreal, Hreal)) -> (Hreal, Hreal))(((x1 : Hreal), (y1 : Hreal)), ((x2 : Hreal), (y2 : Hreal))) == (x1 + x2, y1 + y2)
      #|  (treal_mul : ((Hreal, Hreal), (Hreal, Hreal)) -> (Hreal, Hreal))(((x1 : Hreal), (y1 : Hreal)), ((x2 : Hreal), (y2 : Hreal))) == (x1 * x2 + y1 * y2, x1 * y2 + y1 * x2)
      #|  (treal_le : ((Hreal, Hreal), (Hreal, Hreal)) -> Bool)(((x1 : Hreal), (y1 : Hreal)), ((x2 : Hreal), (y2 : Hreal))) == (x1 + y2 <= x2 + y1)
      #|  (treal_inv : ((Hreal, Hreal)) -> (Hreal, Hreal))(((x : Hreal), (y : Hreal))) == (if x == y { (hreal_of_num(0), hreal_of_num(0)) } else { if y <= x { (inv(select((d : Hreal) => x == y + d)), hreal_of_num(0)) } else { (hreal_of_num(0), inv(select((d : Hreal) => y == x + d))) } })
      #|  (treal_eq : ((Hreal, Hreal), (Hreal, Hreal)) -> Bool)(((x1 : Hreal), (y1 : Hreal)), ((x2 : Hreal), (y2 : Hreal))) == (x1 + y2 == x2 + y1)
      #|  \226\136\128 x : (Hreal, Hreal), treal_eq(x, x)
      #|  \226\136\128 x : (Hreal, Hreal), \226\136\128 y : (Hreal, Hreal), treal_eq(x, y) == treal_eq(y, x)
      #|  hreal_add
      #|  \226\136\128 x : (Hreal, Hreal), \226\136\128 y : (Hreal, Hreal), \226\136\128 z : (Hreal, Hreal), treal_eq(x, y) && treal_eq(y, z) \226\134\146 treal_eq(x, z)
      #|  \226\136\128 x : (Hreal, Hreal), \226\136\128 y : (Hreal, Hreal), x == y \226\134\146 treal_eq(x, y)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, treal_eq(treal_of_num(m), treal_of_num(n)) == (m == n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, treal_le(treal_of_num(m), treal_of_num(n)) == (m <= n)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, treal_eq(treal_add(treal_of_num(m), treal_of_num(n)), treal_of_num(m + n))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, treal_eq(treal_mul(treal_of_num(m), treal_of_num(n)), treal_of_num(m * n))
      #|  \226\136\128 x : (Hreal, Hreal), \226\136\128 y : (Hreal, Hreal), treal_add(x, y) == treal_add(y, x)
      #|  \226\136\128 x : (Hreal, Hreal), \226\136\128 y : (Hreal, Hreal), treal_mul(x, y) == treal_mul(y, x)
      #|  \226\136\128 x : (Hreal, Hreal), \226\136\128 y : (Hreal, Hreal), treal_eq(treal_add(x, y), treal_add(y, x))
      #|  \226\136\128 x : (Hreal, Hreal), \226\136\128 y : (Hreal, Hreal), \226\136\128 z : (Hreal, Hreal), treal_eq(treal_add(x, treal_add(y, z)), treal_add(treal_add(x, y), z))
      #|  \226\136\128 x : (Hreal, Hreal), treal_eq(treal_add(treal_of_num(0), x), x)
      #|  \226\136\128 x : (Hreal, Hreal), treal_eq(treal_add(treal_neg(x), x), treal_of_num(0))
      #|  \226\136\128 x : (Hreal, Hreal), \226\136\128 y : (Hreal, Hreal), treal_eq(treal_mul(x, y), treal_mul(y, x))
      #|  \226\136\128 x : (Hreal, Hreal), \226\136\128 y : (Hreal, Hreal), \226\136\128 z : (Hreal, Hreal), treal_eq(treal_mul(x, treal_mul(y, z)), treal_mul(treal_mul(x, y), z))
      #|  \226\136\128 x : (Hreal, Hreal), treal_eq(treal_mul(treal_of_num(1), x), x)
      #|  \226\136\128 x : (Hreal, Hreal), \226\136\128 y : (Hreal, Hreal), \226\136\128 z : (Hreal, Hreal), treal_eq(treal_mul(x, treal_add(y, z)), treal_add(treal_mul(x, y), treal_mul(x, z)))
      #|  \226\136\128 x : (Hreal, Hreal), treal_le(x, x)
      #|  \226\136\128 x : (Hreal, Hreal), \226\136\128 y : (Hreal, Hreal), (treal_le(x, y) && treal_le(y, x)) == treal_eq(x, y)
      #|  \226\136\128 x : (Hreal, Hreal), \226\136\128 y : (Hreal, Hreal), \226\136\128 z : (Hreal, Hreal), treal_le(x, y) && treal_le(y, z) \226\134\146 treal_le(x, z)
      #|  \226\136\128 x : (Hreal, Hreal), \226\136\128 y : (Hreal, Hreal), treal_le(x, y) || treal_le(y, x)
      #|  \226\136\128 x : (Hreal, Hreal), \226\136\128 y : (Hreal, Hreal), \226\136\128 z : (Hreal, Hreal), treal_le(y, z) \226\134\146 treal_le(treal_add(x, y), treal_add(x, z))
      #|  \226\136\128 x : (Hreal, Hreal), \226\136\128 y : (Hreal, Hreal), treal_le(treal_of_num(0), x) && treal_le(treal_of_num(0), y) \226\134\146 treal_le(treal_of_num(0), treal_mul(x, y))
      #|  treal_eq(treal_inv(treal_of_num(0)), treal_of_num(0))
      #|  (y : Hreal)
      #|  (x : Hreal)
      #|  (y : Hreal)
      #|  (x : Hreal)
      #|  \226\136\128 x : (Hreal, Hreal), !treal_eq(x, treal_of_num(0)) \226\134\146 treal_eq(treal_mul(treal_inv(x), x), treal_of_num(1))
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m == n \226\134\146 treal_eq(treal_of_num(m), treal_of_num(n))
      #|  \226\136\128 x1 : (Hreal, Hreal), \226\136\128 x2 : (Hreal, Hreal), treal_eq(x1, x2) \226\134\146 treal_eq(treal_neg(x1), treal_neg(x2))
      #|  \226\136\128 x1 : (Hreal, Hreal), \226\136\128 x2 : (Hreal, Hreal), \226\136\128 y : (Hreal, Hreal), treal_eq(x1, x2) \226\134\146 treal_eq(treal_add(x1, y), treal_add(x2, y))
      #|  treal_add((x1 : (Hreal, Hreal)), (y2 : (Hreal, Hreal)))
      #|  \226\136\128 x1 : (Hreal, Hreal), \226\136\128 x2 : (Hreal, Hreal), \226\136\128 y1 : (Hreal, Hreal), \226\136\128 y2 : (Hreal, Hreal), treal_eq(x1, x2) && treal_eq(y1, y2) \226\134\146 treal_eq(treal_add(x1, y1), treal_add(x2, y2))
      #|  (a : Hreal) + (b : Hreal) + ((c : Hreal) + (d : Hreal)) == a + d + (b + c)
      #|  \226\136\128 x1 : (Hreal, Hreal), \226\136\128 x2 : (Hreal, Hreal), \226\136\128 y : (Hreal, Hreal), treal_eq(x1, x2) \226\134\146 treal_eq(treal_mul(x1, y), treal_mul(x2, y))
      #|  treal_mul((x1 : (Hreal, Hreal)), (y2 : (Hreal, Hreal)))
      #|  \226\136\128 x1 : (Hreal, Hreal), \226\136\128 x2 : (Hreal, Hreal), \226\136\128 y1 : (Hreal, Hreal), \226\136\128 y2 : (Hreal, Hreal), treal_eq(x1, x2) && treal_eq(y1, y2) \226\134\146 treal_eq(treal_mul(x1, y1), treal_mul(x2, y2))
      #|  \226\136\128 x : (Hreal, Hreal), \226\136\128 y : (Hreal, Hreal), treal_eq(x, y) \226\134\146 treal_le(x, y)
      #|  (x2 : (Hreal, Hreal))
      #|  (y2 : (Hreal, Hreal))
      #|  (x1 : (Hreal, Hreal))
      #|  (y1 : (Hreal, Hreal))
      #|  \226\136\128 x1 : (Hreal, Hreal), \226\136\128 x2 : (Hreal, Hreal), \226\136\128 y1 : (Hreal, Hreal), \226\136\128 y2 : (Hreal, Hreal), treal_eq(x1, x2) && treal_eq(y1, y2) \226\134\146 treal_le(x1, y1) == treal_le(x2, y2)
      #|  select((d : Hreal) => (x : Hreal) == x + d) == hreal_of_num(0)
      #|  (x1 : Hreal) + hreal_of_num(0) == (x2 : Hreal)
      #|  select((d : Hreal) => (x2 : Hreal) == (x1 : Hreal) + d) == hreal_of_num(0)
      #|  select((d : Hreal) => (x2 : Hreal) == (x1 : Hreal) + d) + (y1 : Hreal) <= y1
      #|  (x1 : Hreal) + (y2 : Hreal) == (x2 : Hreal) + (y1 : Hreal)
      #|  (x2 : Hreal)
      #|  (x1 : Hreal)
      #|  (x1 : Hreal) + (y2 : Hreal) == (x2 : Hreal) + (y1 : Hreal)
      #|  (x2 : Hreal) <= (x1 : Hreal)
      #|  (y1 : Hreal) == (y2 : Hreal)
      #|  (x1 : Hreal) == (x2 : Hreal)
      #|  (y2 : Hreal)
      #|  (y1 : Hreal)
      #|  (x2 : Hreal)
      #|  (x1 : Hreal)
      #|  \226\136\128 x : (Hreal, Hreal), \226\136\128 y : (Hreal, Hreal), treal_eq(x, y) \226\134\146 treal_eq(treal_inv(x), treal_inv(y))
      #|  treal_eq
      #|  real_of_num
      #|  (real_min : (Real, Real) -> Real)
      #|  (real_max : (Real, Real) -> Real)
      #|  (real_abs : (Real) -> Real)
      #|  real_inv
      #|  (real_pow : (Real, Num) -> Real)
      #|  real_neg
      #|  (real_ge : (Real, Real) -> Bool)
      #|  (real_gt : (Real, Real) -> Bool)
      #|  real_le
      #|  (real_lt : (Real, Real) -> Bool)
      #|  (real_div : (Real, Real) -> Real)
      #|  real_mul
      #|  (real_sub : (Real, Real) -> Real)
      #|  real_add
      #|  (real_sub : (Real, Real) -> Real)((x : Real), (y : Real)) == x + -y
      #|  (real_lt : (Real, Real) -> Bool)((x : Real), (y : Real)) == !(y <= x)
      #|  (real_ge : (Real, Real) -> Bool)((x : Real), (y : Real)) == (y <= x)
      #|  (real_gt : (Real, Real) -> Bool)((x : Real), (y : Real)) == real_lt(y, x)
      #|  (real_abs : (Real) -> Real)((x : Real)) == (if real_of_num(0) <= x { x } else { -x })
      #|  (real_pow : (Real, Num) -> Real)((x : Real), 0) == real_of_num(1) && (\226\136\128 n : Num, real_pow(x, SUC(n)) == x * real_pow(x, n))
      #|  (real_div : (Real, Real) -> Real)((x : Real), (y : Real)) == x * inv(y)
      #|  (real_max : (Real, Real) -> Real)((m : Real), (n : Real)) == (if m <= n { n } else { m })
      #|  (real_min : (Real, Real) -> Real)((m : Real), (n : Real)) == (if m <= n { m } else { n })
      #|  (q : (Hreal, Hreal))
      #|  (q : (Hreal, Hreal))
      #|  (d : Hreal)
      #|  (d : Hreal)
      #|  (p : (Hreal, Hreal))
      #|  mk_real
      #|  (p : (Hreal, Hreal))
      #|  (r : ((Hreal, Hreal)) -> Bool)
      #|  dest_real((x : Real))
      #|  (y : Hreal) => mk_real(treal_eq((y, hreal_of_num(0))))
      #|  \226\136\131 r : (Hreal) -> Real, (\226\136\128 x : Real, (real_of_num(0) <= x) == (\226\136\131 y : Hreal, x == r(y))) && (\226\136\128 y : Hreal, \226\136\128 z : Hreal, (y <= z) == (r(y) <= r(z)))
      #|  \226\136\128 y : Hreal, \226\136\128 z : Hreal, ((r : (Hreal) -> Real)(y) == r(z)) == (y == z)
      #|  (r : (Hreal) -> Real)
      #|  (x : Real) => select((y : Hreal) => x == (r : (Hreal) -> Real)(y))
      #|  \226\136\131 h : (Real) -> Hreal, \226\136\131 r : (Hreal) -> Real, (\226\136\128 x : Hreal, h(r(x)) == x) && (\226\136\128 x : Real, real_of_num(0) <= x \226\134\146 r(h(x)) == x) && (\226\136\128 x : Hreal, real_of_num(0) <= r(x)) && (\226\136\128 x : Hreal, \226\136\128 y : Hreal, (x <= y) == (r(x) <= r(y)))
      #|  (x : Real)
      #|  (r : (Hreal) -> Real)((h : (Real) -> Hreal)((C : Real))) == C
      #|  (B : Hreal) <= (h : (Real) -> Hreal)((C : Real))
      #|  (C : Real)
      #|  real_of_num(0)
      #|  (b : Bool) == (a : Bool) \226\134\146 a \226\134\146 b
      #|  (P : (Real) -> Bool)((z : Real))
      #|  real_of_num(0) <= (z : Real)
      #|  (z : Real)
      #|  real_of_num(0)
      #|  (z : Real)
      #|  (r : (Hreal) -> Real)((B : Hreal))
      #|  (B : Hreal)
      #|  ((b : Bool) \226\134\146 (c : Bool)) \226\134\146 (a : Bool) \226\134\146 (a \226\134\146 b) \226\134\146 c
      #|  (x : Real)
      #|  (b : Bool) == (a : Bool) \226\134\146 a \226\134\146 b
      #|  (y : Hreal)
      #|  (h : (Real) -> Hreal)((M : Real))
      #|  (b : Bool) == (a : Bool) \226\134\146 a \226\134\146 b
      #|  (P : (Real) -> Bool)((x : Real))
      #|  (h : (Real) -> Hreal)((x : Real))
      #|  (y : Hreal) => (P : (Real) -> Bool)((r : (Hreal) -> Real)(y))
      #|  \226\136\128 P : (Real) -> Bool, (\226\136\131 x : Real, P(x) && real_of_num(0) <= x) && (\226\136\131 M : Real, \226\136\128 x : Real, P(x) \226\134\146 x <= M) \226\134\146 (\226\136\131 M : Real, (\226\136\128 x : Real, P(x) \226\134\146 x <= M) && (\226\136\128 M' : Real, (\226\136\128 x : Real, P(x) \226\134\146 x <= M') \226\134\146 M <= M'))
      #|  (y : Real) == real_sub(y, (x : Real)) + x
      #|  (x : Real)
      #|  -(x : Real)
      #|  (z : Real) + (x : Real) <= (M' : Real)
      #|  (z : Real)
      #|  (B : Real) <= real_sub((M' : Real), (x : Real))
      #|  (x : Real)
      #|  (B : Real) + (x : Real)
      #|  (B : Real)
      #|  ((b : Bool) \226\134\146 (c : Bool)) \226\134\146 (a : Bool) \226\134\146 (a \226\134\146 b) \226\134\146 c
      #|  -(x : Real)
      #|  (M : Real) + -(x : Real)
      #|  real_of_num(0)
      #|  (y : Real) => (P : (Real) -> Bool)(y + (x : Real))
      #|  -(x : Real)
      #|  (M : Real)
      #|  (x : Real)
      #|  (x : Real)
      #|  real_of_num(0)
      #|  \226\136\128 P : (Real) -> Bool, (\226\136\131 x : Real, P(x)) && (\226\136\131 M : Real, \226\136\128 x : Real, P(x) \226\134\146 x <= M) \226\134\146 (\226\136\131 M : Real, (\226\136\128 x : Real, P(x) \226\134\146 x <= M) && (\226\136\128 M' : Real, (\226\136\128 x : Real, P(x) \226\134\146 x <= M') \226\134\146 M <= M'))
      #|  hreal_inv
      #|  hreal_le
      #|  hreal_mul
      #|  hreal_add
      #|dist =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\m:num. ((#=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) ((#+:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) m:num) n:num)) ((#-:fun(num,fun(num,num)) n:num) m:num)))))))
      #|DIST_REFL =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) n:num) n:num))) (#NUMERAL:fun(num,num) #_0:num))))
      #|DIST_LZERO =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) (#NUMERAL:fun(num,num) #_0:num)) n:num))) n:num)))
      #|DIST_RZERO =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) n:num) (#NUMERAL:fun(num,num) #_0:num)))) n:num)))
      #|DIST_SYM =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) n:num) m:num)))))))
      #|DIST_LADD =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#+:fun(num,fun(num,num)) m:num) n:num)) ((#+:fun(num,fun(num,num)) m:num) p:num)))) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) n:num) p:num)))))))))
      #|DIST_RADD =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#+:fun(num,fun(num,num)) m:num) p:num)) ((#+:fun(num,fun(num,num)) n:num) p:num)))) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num)))))))))
      #|DIST_LADD_0 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#+:fun(num,fun(num,num)) m:num) n:num)) m:num))) n:num)))))
      #|DIST_RADD_0 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) ((#+:fun(num,fun(num,num)) m:num) n:num)))) n:num)))))
      #|DIST_LMUL =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) m:num) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) n:num) p:num)))) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#*:fun(num,fun(num,num)) m:num) n:num)) ((#*:fun(num,fun(num,num)) m:num) p:num))))))))))
      #|DIST_RMUL =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) p:num)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#*:fun(num,fun(num,num)) m:num) p:num)) ((#*:fun(num,fun(num,num)) n:num) p:num))))))))))
      #|DIST_EQ_0 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) (#NUMERAL:fun(num,num) #_0:num))) ((#=:fun(num,fun(num,bool)) m:num) n:num))))))
      #|DIST_ELIM_THM =  |- ((#=:fun(bool,fun(bool,bool)) (P:fun(num,bool) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) x:num) y:num)))) (#forall:fun(fun(num,bool),bool) (\d:num. ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) x:num) ((#+:fun(num,fun(num,num)) y:num) d:num))) (P:fun(num,bool) d:num))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) y:num) ((#+:fun(num,fun(num,num)) x:num) d:num))) (P:fun(num,bool) d:num))))))
      #|DIST_LE_CASES =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#=:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) p:num)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) ((#+:fun(num,fun(num,num)) n:num) p:num))) ((#<=:fun(num,fun(num,bool)) n:num) ((#+:fun(num,fun(num,num)) m:num) p:num))))))))))
      #|DIST_ADDBOUND =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) ((#+:fun(num,fun(num,num)) m:num) n:num))))))
      #|DIST_TRIANGLE =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. ((#<=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) p:num))) ((#+:fun(num,fun(num,num)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) n:num) p:num))))))))))
      #|DIST_ADD2 =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\q:num. ((#<=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#+:fun(num,fun(num,num)) m:num) n:num)) ((#+:fun(num,fun(num,num)) p:num) q:num)))) ((#+:fun(num,fun(num,num)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) p:num))) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) n:num) q:num))))))))))))
      #|DIST_ADD2_REV =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\q:num. ((#<=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) p:num))) ((#+:fun(num,fun(num,num)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#+:fun(num,fun(num,num)) m:num) n:num)) ((#+:fun(num,fun(num,num)) p:num) q:num)))) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) n:num) q:num))))))))))))
      #|DIST_TRIANGLE_LE =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\q:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) n:num) p:num)))) q:num)) ((#<=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) p:num))) q:num))))))))))
      #|DIST_TRIANGLES_LE =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\p:num. (#forall:fun(fun(num,bool),bool) (\q:num. (#forall:fun(fun(num,bool),bool) (\r:num. (#forall:fun(fun(num,bool),bool) (\s:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))) r:num)) ((#<=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) p:num) q:num))) s:num))) ((#<=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) p:num))) ((#+:fun(num,fun(num,num)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) n:num) q:num))) ((#+:fun(num,fun(num,num)) r:num) s:num))))))))))))))))
      #|BOUNDS_LINEAR =  |- (#forall:fun(fun(num,bool),bool) (\A:num. (#forall:fun(fun(num,bool),bool) (\B:num. (#forall:fun(fun(num,bool),bool) (\C:num. ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) A:num) n:num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) B:num) n:num)) C:num))))) ((#<=:fun(num,fun(num,bool)) A:num) B:num))))))))
      #|BOUNDS_LINEAR_0 =  |- (#forall:fun(fun(num,bool),bool) (\A:num. (#forall:fun(fun(num,bool),bool) (\B:num. ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) A:num) n:num)) B:num)))) ((#=:fun(num,fun(num,bool)) A:num) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|BOUNDS_DIVIDED =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\P:fun(num,num). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\B:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) (P:fun(num,num) n:num)) B:num)))))) (#?:fun(fun(num,bool),bool) (\A:num. (#?:fun(fun(num,bool),bool) (\B:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) n:num) (P:fun(num,num) n:num))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) A:num) n:num)) B:num)))))))))))
      #|BOUNDS_NOTZERO =  |- (#forall:fun(fun(fun(num,fun(num,num)),bool),bool) (\P:fun(num,fun(num,num)). (#forall:fun(fun(num,bool),bool) (\A:num. (#forall:fun(fun(num,bool),bool) (\B:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((P:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) #_0:num)) (#NUMERAL:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) #_0:num))) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) ((P:fun(num,fun(num,num)) m:num) n:num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) A:num) ((#+:fun(num,fun(num,num)) m:num) n:num))) B:num)))))))) (#?:fun(fun(num,bool),bool) (\B:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) ((P:fun(num,fun(num,num)) m:num) n:num)) ((#*:fun(num,fun(num,num)) B:num) ((#+:fun(num,fun(num,num)) m:num) n:num))))))))))))))))
      #|BOUNDS_IGNORE =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\P:fun(num,num). (#forall:fun(fun(fun(num,num),bool),bool) (\Q:fun(num,num). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(num,bool),bool) (\B:num. (#forall:fun(fun(num,bool),bool) (\i:num. ((#<=:fun(num,fun(num,bool)) (P:fun(num,num) i:num)) ((#+:fun(num,fun(num,num)) (Q:fun(num,num) i:num)) B:num))))))) (#?:fun(fun(num,bool),bool) (\B:num. (#?:fun(fun(num,bool),bool) (\N:num. (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) N:num) i:num)) ((#<=:fun(num,fun(num,bool)) (P:fun(num,num) i:num)) ((#+:fun(num,fun(num,num)) (Q:fun(num,num) i:num)) B:num))))))))))))))
      #|is_nadd =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\x:fun(num,num). ((#=:fun(bool,fun(bool,bool)) (#is_nadd:fun(fun(num,num),bool) x:fun(num,num))) (#?:fun(fun(num,bool),bool) (\B:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#*:fun(num,fun(num,num)) m:num) (x:fun(num,num) n:num))) ((#*:fun(num,fun(num,num)) n:num) (x:fun(num,num) m:num))))) ((#*:fun(num,fun(num,num)) B:num) ((#+:fun(num,fun(num,num)) m:num) n:num))))))))))))
      #|is_nadd_0 =  |- (#is_nadd:fun(fun(num,num),bool) (\n:num. (#NUMERAL:fun(num,num) #_0:num)))
      #|nadd_abs =  |- ((#=:fun(nadd,fun(nadd,bool)) (#mk_nadd:fun(fun(num,num),nadd) (#dest_nadd:fun(nadd,fun(num,num)) a:nadd))) a:nadd)
      #|nadd_rep =  |- ((#=:fun(bool,fun(bool,bool)) (#is_nadd:fun(fun(num,num),bool) r:fun(num,num))) ((#=:fun(fun(num,num),fun(fun(num,num),bool)) (#dest_nadd:fun(nadd,fun(num,num)) (#mk_nadd:fun(fun(num,num),nadd) r:fun(num,num)))) r:fun(num,num)))
      #|NADD_CAUCHY =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#?:fun(fun(num,bool),bool) (\B:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#*:fun(num,fun(num,num)) m:num) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) n:num))) ((#*:fun(num,fun(num,num)) n:num) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) m:num))))) ((#*:fun(num,fun(num,num)) B:num) ((#+:fun(num,fun(num,num)) m:num) n:num)))))))))))
      #|NADD_BOUND =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#?:fun(fun(num,bool),bool) (\A:num. (#?:fun(fun(num,bool),bool) (\B:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) n:num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) A:num) n:num)) B:num))))))))))
      #|NADD_MULTIPLICATIVE =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#?:fun(fun(num,bool),bool) (\B:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) ((#*:fun(num,fun(num,num)) m:num) n:num))) ((#*:fun(num,fun(num,num)) m:num) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) n:num))))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) B:num) m:num)) B:num))))))))))
      #|NADD_ADDITIVE =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#?:fun(fun(num,bool),bool) (\B:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) ((#+:fun(num,fun(num,num)) m:num) n:num))) ((#+:fun(num,fun(num,num)) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) m:num)) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) n:num))))) B:num)))))))))
      #|NADD_SUC =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#?:fun(fun(num,bool),bool) (\B:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) (#SUC:fun(num,num) n:num))) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) n:num)))) B:num)))))))
      #|NADD_DIST_LEMMA =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#?:fun(fun(num,bool),bool) (\B:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) ((#+:fun(num,fun(num,num)) m:num) n:num))) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) m:num)))) ((#*:fun(num,fun(num,num)) B:num) n:num))))))))))
      #|NADD_DIST =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#?:fun(fun(num,bool),bool) (\B:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) m:num)) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) n:num)))) ((#*:fun(num,fun(num,num)) B:num) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) m:num) n:num))))))))))))
      #|NADD_ALTMUL =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. (#?:fun(fun(num,bool),bool) (\A:num. (#?:fun(fun(num,bool),bool) (\B:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#*:fun(num,fun(num,num)) n:num) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) ((#dest_nadd:fun(nadd,fun(num,num)) y:nadd) n:num)))) ((#*:fun(num,fun(num,num)) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) n:num)) ((#dest_nadd:fun(nadd,fun(num,num)) y:nadd) n:num))))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) A:num) n:num)) B:num))))))))))))
      #|nadd_eq =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. ((#=:fun(bool,fun(bool,bool)) ((#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd) y:nadd)) (#?:fun(fun(num,bool),bool) (\B:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) n:num)) ((#dest_nadd:fun(nadd,fun(num,num)) y:nadd) n:num)))) B:num))))))))))
      #|NADD_EQ_REFL =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. ((#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd) x:nadd)))
      #|NADD_EQ_SYM =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. ((#=:fun(bool,fun(bool,bool)) ((#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd) y:nadd)) ((#nadd_eq:fun(nadd,fun(nadd,bool)) y:nadd) x:nadd))))))
      #|NADD_EQ_TRANS =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. (#forall:fun(fun(nadd,bool),bool) (\z:nadd. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd) y:nadd)) ((#nadd_eq:fun(nadd,fun(nadd,bool)) y:nadd) z:nadd))) ((#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd) z:nadd))))))))
      #|nadd_of_num =  |- (#forall:fun(fun(num,bool),bool) (\k:num. ((#=:fun(nadd,fun(nadd,bool)) (#nadd_of_num:fun(num,nadd) k:num)) (#mk_nadd:fun(fun(num,num),nadd) (\n:num. ((#*:fun(num,fun(num,num)) k:num) n:num))))))
      #|NADD_OF_NUM =  |- (#forall:fun(fun(num,bool),bool) (\k:num. ((#=:fun(fun(num,num),fun(fun(num,num),bool)) (#dest_nadd:fun(nadd,fun(num,num)) (#nadd_of_num:fun(num,nadd) k:num))) (\n:num. ((#*:fun(num,fun(num,num)) k:num) n:num)))))
      #|NADD_OF_NUM_WELLDEF =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) n:num)) ((#nadd_eq:fun(nadd,fun(nadd,bool)) (#nadd_of_num:fun(num,nadd) m:num)) (#nadd_of_num:fun(num,nadd) n:num)))))))
      #|NADD_OF_NUM_EQ =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#nadd_eq:fun(nadd,fun(nadd,bool)) (#nadd_of_num:fun(num,nadd) m:num)) (#nadd_of_num:fun(num,nadd) n:num))) ((#=:fun(num,fun(num,bool)) m:num) n:num))))))
      #|nadd_le =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. ((#=:fun(bool,fun(bool,bool)) ((#nadd_le:fun(nadd,fun(nadd,bool)) x:nadd) y:nadd)) (#?:fun(fun(num,bool),bool) (\B:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) n:num)) ((#+:fun(num,fun(num,num)) ((#dest_nadd:fun(nadd,fun(num,num)) y:nadd) n:num)) B:num)))))))))))
      #|NADD_LE_WELLDEF_LEMMA =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\x':nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. (#forall:fun(fun(nadd,bool),bool) (\y':nadd. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd) x':nadd)) ((#/\:fun(bool,fun(bool,bool)) ((#nadd_eq:fun(nadd,fun(nadd,bool)) y:nadd) y':nadd)) ((#nadd_le:fun(nadd,fun(nadd,bool)) x:nadd) y:nadd)))) ((#nadd_le:fun(nadd,fun(nadd,bool)) x':nadd) y':nadd))))))))))
      #|NADD_LE_WELLDEF =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\x':nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. (#forall:fun(fun(nadd,bool),bool) (\y':nadd. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd) x':nadd)) ((#nadd_eq:fun(nadd,fun(nadd,bool)) y:nadd) y':nadd))) ((#=:fun(bool,fun(bool,bool)) ((#nadd_le:fun(nadd,fun(nadd,bool)) x:nadd) y:nadd)) ((#nadd_le:fun(nadd,fun(nadd,bool)) x':nadd) y':nadd)))))))))))
      #|NADD_LE_REFL =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. ((#nadd_le:fun(nadd,fun(nadd,bool)) x:nadd) x:nadd)))
      #|NADD_LE_TRANS =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. (#forall:fun(fun(nadd,bool),bool) (\z:nadd. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#nadd_le:fun(nadd,fun(nadd,bool)) x:nadd) y:nadd)) ((#nadd_le:fun(nadd,fun(nadd,bool)) y:nadd) z:nadd))) ((#nadd_le:fun(nadd,fun(nadd,bool)) x:nadd) z:nadd))))))))
      #|NADD_LE_ANTISYM =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#nadd_le:fun(nadd,fun(nadd,bool)) x:nadd) y:nadd)) ((#nadd_le:fun(nadd,fun(nadd,bool)) y:nadd) x:nadd))) ((#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd) y:nadd))))))
      #|NADD_LE_TOTAL_LEMMA =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#nadd_le:fun(nadd,fun(nadd,bool)) x:nadd) y:nadd))) (#forall:fun(fun(num,bool),bool) (\B:num. (#?:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#<:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) ((#dest_nadd:fun(nadd,fun(num,num)) y:nadd) n:num)) B:num)) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) n:num))))))))))))
      #|NADD_LE_TOTAL =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. ((#\/:fun(bool,fun(bool,bool)) ((#nadd_le:fun(nadd,fun(nadd,bool)) x:nadd) y:nadd)) ((#nadd_le:fun(nadd,fun(nadd,bool)) y:nadd) x:nadd))))))
      #|NADD_ARCH =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#?:fun(fun(num,bool),bool) (\n:num. ((#nadd_le:fun(nadd,fun(nadd,bool)) x:nadd) (#nadd_of_num:fun(num,nadd) n:num))))))
      #|NADD_OF_NUM_LE =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#nadd_le:fun(nadd,fun(nadd,bool)) (#nadd_of_num:fun(num,nadd) m:num)) (#nadd_of_num:fun(num,nadd) n:num))) ((#<=:fun(num,fun(num,bool)) m:num) n:num))))))
      #|nadd_add =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. ((#=:fun(nadd,fun(nadd,bool)) ((#nadd_add:fun(nadd,fun(nadd,nadd)) x:nadd) y:nadd)) (#mk_nadd:fun(fun(num,num),nadd) (\n:num. ((#+:fun(num,fun(num,num)) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) n:num)) ((#dest_nadd:fun(nadd,fun(num,num)) y:nadd) n:num)))))))))
      #|NADD_ADD =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. ((#=:fun(fun(num,num),fun(fun(num,num),bool)) (#dest_nadd:fun(nadd,fun(num,num)) ((#nadd_add:fun(nadd,fun(nadd,nadd)) x:nadd) y:nadd))) (\n:num. ((#+:fun(num,fun(num,num)) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) n:num)) ((#dest_nadd:fun(nadd,fun(num,num)) y:nadd) n:num))))))))
      #|NADD_ADD_WELLDEF =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\x':nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. (#forall:fun(fun(nadd,bool),bool) (\y':nadd. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd) x':nadd)) ((#nadd_eq:fun(nadd,fun(nadd,bool)) y:nadd) y':nadd))) ((#nadd_eq:fun(nadd,fun(nadd,bool)) ((#nadd_add:fun(nadd,fun(nadd,nadd)) x:nadd) y:nadd)) ((#nadd_add:fun(nadd,fun(nadd,nadd)) x':nadd) y':nadd)))))))))))
      #|NADD_ADD_SYM =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. ((#nadd_eq:fun(nadd,fun(nadd,bool)) ((#nadd_add:fun(nadd,fun(nadd,nadd)) x:nadd) y:nadd)) ((#nadd_add:fun(nadd,fun(nadd,nadd)) y:nadd) x:nadd))))))
      #|NADD_ADD_ASSOC =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. (#forall:fun(fun(nadd,bool),bool) (\z:nadd. ((#nadd_eq:fun(nadd,fun(nadd,bool)) ((#nadd_add:fun(nadd,fun(nadd,nadd)) x:nadd) ((#nadd_add:fun(nadd,fun(nadd,nadd)) y:nadd) z:nadd))) ((#nadd_add:fun(nadd,fun(nadd,nadd)) ((#nadd_add:fun(nadd,fun(nadd,nadd)) x:nadd) y:nadd)) z:nadd))))))))
      #|NADD_ADD_LID =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. ((#nadd_eq:fun(nadd,fun(nadd,bool)) ((#nadd_add:fun(nadd,fun(nadd,nadd)) (#nadd_of_num:fun(num,nadd) (#NUMERAL:fun(num,num) #_0:num))) x:nadd)) x:nadd)))
      #|NADD_ADD_LCANCEL =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. (#forall:fun(fun(nadd,bool),bool) (\z:nadd. ((#==>:fun(bool,fun(bool,bool)) ((#nadd_eq:fun(nadd,fun(nadd,bool)) ((#nadd_add:fun(nadd,fun(nadd,nadd)) x:nadd) y:nadd)) ((#nadd_add:fun(nadd,fun(nadd,nadd)) x:nadd) z:nadd))) ((#nadd_eq:fun(nadd,fun(nadd,bool)) y:nadd) z:nadd))))))))
      #|NADD_LE_ADD =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. ((#nadd_le:fun(nadd,fun(nadd,bool)) x:nadd) ((#nadd_add:fun(nadd,fun(nadd,nadd)) x:nadd) y:nadd))))))
      #|NADD_LE_EXISTS =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. ((#==>:fun(bool,fun(bool,bool)) ((#nadd_le:fun(nadd,fun(nadd,bool)) x:nadd) y:nadd)) (#?:fun(fun(nadd,bool),bool) (\d:nadd. ((#nadd_eq:fun(nadd,fun(nadd,bool)) y:nadd) ((#nadd_add:fun(nadd,fun(nadd,nadd)) x:nadd) d:nadd)))))))))
      #|NADD_OF_NUM_ADD =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#nadd_eq:fun(nadd,fun(nadd,bool)) ((#nadd_add:fun(nadd,fun(nadd,nadd)) (#nadd_of_num:fun(num,nadd) m:num)) (#nadd_of_num:fun(num,nadd) n:num))) (#nadd_of_num:fun(num,nadd) ((#+:fun(num,fun(num,num)) m:num) n:num)))))))
      #|nadd_mul =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. ((#=:fun(nadd,fun(nadd,bool)) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) x:nadd) y:nadd)) (#mk_nadd:fun(fun(num,num),nadd) (\n:num. ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) ((#dest_nadd:fun(nadd,fun(num,num)) y:nadd) n:num)))))))))
      #|NADD_MUL =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. ((#=:fun(fun(num,num),fun(fun(num,num),bool)) (#dest_nadd:fun(nadd,fun(num,num)) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) x:nadd) y:nadd))) (\n:num. ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) ((#dest_nadd:fun(nadd,fun(num,num)) y:nadd) n:num))))))))
      #|NADD_MUL_SYM =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. ((#nadd_eq:fun(nadd,fun(nadd,bool)) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) x:nadd) y:nadd)) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) y:nadd) x:nadd))))))
      #|NADD_MUL_ASSOC =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. (#forall:fun(fun(nadd,bool),bool) (\z:nadd. ((#nadd_eq:fun(nadd,fun(nadd,bool)) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) x:nadd) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) y:nadd) z:nadd))) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) x:nadd) y:nadd)) z:nadd))))))))
      #|NADD_MUL_LID =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. ((#nadd_eq:fun(nadd,fun(nadd,bool)) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) (#nadd_of_num:fun(num,nadd) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:nadd)) x:nadd)))
      #|NADD_LDISTRIB =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. (#forall:fun(fun(nadd,bool),bool) (\z:nadd. ((#nadd_eq:fun(nadd,fun(nadd,bool)) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) x:nadd) ((#nadd_add:fun(nadd,fun(nadd,nadd)) y:nadd) z:nadd))) ((#nadd_add:fun(nadd,fun(nadd,nadd)) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) x:nadd) y:nadd)) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) x:nadd) z:nadd)))))))))
      #|NADD_MUL_WELLDEF_LEMMA =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. (#forall:fun(fun(nadd,bool),bool) (\y':nadd. ((#==>:fun(bool,fun(bool,bool)) ((#nadd_eq:fun(nadd,fun(nadd,bool)) y:nadd) y':nadd)) ((#nadd_eq:fun(nadd,fun(nadd,bool)) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) x:nadd) y:nadd)) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) x:nadd) y':nadd)))))))))
      #|NADD_MUL_WELLDEF =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\x':nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. (#forall:fun(fun(nadd,bool),bool) (\y':nadd. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd) x':nadd)) ((#nadd_eq:fun(nadd,fun(nadd,bool)) y:nadd) y':nadd))) ((#nadd_eq:fun(nadd,fun(nadd,bool)) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) x:nadd) y:nadd)) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) x':nadd) y':nadd)))))))))))
      #|NADD_OF_NUM_MUL =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#nadd_eq:fun(nadd,fun(nadd,bool)) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) (#nadd_of_num:fun(num,nadd) m:num)) (#nadd_of_num:fun(num,nadd) n:num))) (#nadd_of_num:fun(num,nadd) ((#*:fun(num,fun(num,num)) m:num) n:num)))))))
      #|NADD_LE_0 =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. ((#nadd_le:fun(nadd,fun(nadd,bool)) (#nadd_of_num:fun(num,nadd) (#NUMERAL:fun(num,num) #_0:num))) x:nadd)))
      #|NADD_EQ_IMP_LE =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. ((#==>:fun(bool,fun(bool,bool)) ((#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd) y:nadd)) ((#nadd_le:fun(nadd,fun(nadd,bool)) x:nadd) y:nadd))))))
      #|NADD_LE_LMUL =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. (#forall:fun(fun(nadd,bool),bool) (\z:nadd. ((#==>:fun(bool,fun(bool,bool)) ((#nadd_le:fun(nadd,fun(nadd,bool)) y:nadd) z:nadd)) ((#nadd_le:fun(nadd,fun(nadd,bool)) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) x:nadd) y:nadd)) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) x:nadd) z:nadd)))))))))
      #|NADD_LE_RMUL =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. (#forall:fun(fun(nadd,bool),bool) (\z:nadd. ((#==>:fun(bool,fun(bool,bool)) ((#nadd_le:fun(nadd,fun(nadd,bool)) x:nadd) y:nadd)) ((#nadd_le:fun(nadd,fun(nadd,bool)) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) x:nadd) z:nadd)) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) y:nadd) z:nadd)))))))))
      #|NADD_LE_RADD =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. (#forall:fun(fun(nadd,bool),bool) (\z:nadd. ((#=:fun(bool,fun(bool,bool)) ((#nadd_le:fun(nadd,fun(nadd,bool)) ((#nadd_add:fun(nadd,fun(nadd,nadd)) x:nadd) z:nadd)) ((#nadd_add:fun(nadd,fun(nadd,nadd)) y:nadd) z:nadd))) ((#nadd_le:fun(nadd,fun(nadd,bool)) x:nadd) y:nadd))))))))
      #|NADD_LE_LADD =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. (#forall:fun(fun(nadd,bool),bool) (\z:nadd. ((#=:fun(bool,fun(bool,bool)) ((#nadd_le:fun(nadd,fun(nadd,bool)) ((#nadd_add:fun(nadd,fun(nadd,nadd)) x:nadd) y:nadd)) ((#nadd_add:fun(nadd,fun(nadd,nadd)) x:nadd) z:nadd))) ((#nadd_le:fun(nadd,fun(nadd,bool)) y:nadd) z:nadd))))))))
      #|NADD_RDISTRIB =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. (#forall:fun(fun(nadd,bool),bool) (\z:nadd. ((#nadd_eq:fun(nadd,fun(nadd,bool)) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) ((#nadd_add:fun(nadd,fun(nadd,nadd)) x:nadd) y:nadd)) z:nadd)) ((#nadd_add:fun(nadd,fun(nadd,nadd)) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) x:nadd) z:nadd)) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) y:nadd) z:nadd)))))))))
      #|NADD_ARCH_MULT =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd) (#nadd_of_num:fun(num,nadd) (#NUMERAL:fun(num,num) #_0:num))))) (#?:fun(fun(num,bool),bool) (\N:num. ((#nadd_le:fun(nadd,fun(nadd,bool)) (#nadd_of_num:fun(num,nadd) k:num)) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) (#nadd_of_num:fun(num,nadd) N:num)) x:nadd)))))))))
      #|NADD_ARCH_ZERO =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\k:nadd. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#nadd_le:fun(nadd,fun(nadd,bool)) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) (#nadd_of_num:fun(num,nadd) n:num)) x:nadd)) k:nadd)))) ((#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd) (#nadd_of_num:fun(num,nadd) (#NUMERAL:fun(num,num) #_0:num))))))))
      #|NADD_ARCH_LEMMA =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. (#forall:fun(fun(nadd,bool),bool) (\z:nadd. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#nadd_le:fun(nadd,fun(nadd,bool)) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) (#nadd_of_num:fun(num,nadd) n:num)) x:nadd)) ((#nadd_add:fun(nadd,fun(nadd,nadd)) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) (#nadd_of_num:fun(num,nadd) n:num)) y:nadd)) z:nadd))))) ((#nadd_le:fun(nadd,fun(nadd,bool)) x:nadd) y:nadd))))))))
      #|NADD_COMPLETE =  |- (#forall:fun(fun(fun(nadd,bool),bool),bool) (\P:fun(nadd,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(nadd,bool),bool) (\x:nadd. (P:fun(nadd,bool) x:nadd)))) (#?:fun(fun(nadd,bool),bool) (\M:nadd. (#forall:fun(fun(nadd,bool),bool) (\x:nadd. ((#==>:fun(bool,fun(bool,bool)) (P:fun(nadd,bool) x:nadd)) ((#nadd_le:fun(nadd,fun(nadd,bool)) x:nadd) M:nadd)))))))) (#?:fun(fun(nadd,bool),bool) (\M:nadd. ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(nadd,bool),bool) (\x:nadd. ((#==>:fun(bool,fun(bool,bool)) (P:fun(nadd,bool) x:nadd)) ((#nadd_le:fun(nadd,fun(nadd,bool)) x:nadd) M:nadd))))) (#forall:fun(fun(nadd,bool),bool) (\M':nadd. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(nadd,bool),bool) (\x:nadd. ((#==>:fun(bool,fun(bool,bool)) (P:fun(nadd,bool) x:nadd)) ((#nadd_le:fun(nadd,fun(nadd,bool)) x:nadd) M':nadd))))) ((#nadd_le:fun(nadd,fun(nadd,bool)) M:nadd) M':nadd))))))))))
      #|NADD_UBOUND =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#?:fun(fun(num,bool),bool) (\B:num. (#?:fun(fun(num,bool),bool) (\N:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) N:num) n:num)) ((#<=:fun(num,fun(num,bool)) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) n:num)) ((#*:fun(num,fun(num,num)) B:num) n:num)))))))))))
      #|NADD_NONZERO =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd) (#nadd_of_num:fun(num,nadd) (#NUMERAL:fun(num,num) #_0:num))))) (#?:fun(fun(num,bool),bool) (\N:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) N:num) n:num)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) n:num)) (#NUMERAL:fun(num,num) #_0:num)))))))))))
      #|NADD_LBOUND =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd) (#nadd_of_num:fun(num,nadd) (#NUMERAL:fun(num,num) #_0:num))))) (#?:fun(fun(num,bool),bool) (\A:num. (#?:fun(fun(num,bool),bool) (\N:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) N:num) n:num)) ((#<=:fun(num,fun(num,bool)) n:num) ((#*:fun(num,fun(num,num)) A:num) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) n:num)))))))))))))
      #|nadd_rinv =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. ((#=:fun(fun(num,num),fun(fun(num,num),bool)) (#nadd_rinv:fun(nadd,fun(num,num)) x:nadd)) (\n:num. ((#DIV:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) n:num) n:num)) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) n:num))))))
      #|NADD_MUL_LINV_LEMMA0 =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd) (#nadd_of_num:fun(num,nadd) (#NUMERAL:fun(num,num) #_0:num))))) (#?:fun(fun(num,bool),bool) (\A:num. (#?:fun(fun(num,bool),bool) (\B:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) ((#nadd_rinv:fun(nadd,fun(num,num)) x:nadd) n:num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) A:num) n:num)) B:num)))))))))))
      #|NADD_MUL_LINV_LEMMA1 =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) n:num)) (#NUMERAL:fun(num,num) #_0:num)))) ((#<=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#*:fun(num,fun(num,num)) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) n:num)) ((#nadd_rinv:fun(nadd,fun(num,num)) x:nadd) n:num))) ((#*:fun(num,fun(num,num)) n:num) n:num)))) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) n:num)))))))
      #|NADD_MUL_LINV_LEMMA2 =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd) (#nadd_of_num:fun(num,nadd) (#NUMERAL:fun(num,num) #_0:num))))) (#?:fun(fun(num,bool),bool) (\N:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) N:num) n:num)) ((#<=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#*:fun(num,fun(num,num)) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) n:num)) ((#nadd_rinv:fun(nadd,fun(num,num)) x:nadd) n:num))) ((#*:fun(num,fun(num,num)) n:num) n:num)))) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) n:num))))))))))
      #|NADD_MUL_LINV_LEMMA3 =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd) (#nadd_of_num:fun(num,nadd) (#NUMERAL:fun(num,num) #_0:num))))) (#?:fun(fun(num,bool),bool) (\N:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) N:num) n:num)) ((#<=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#*:fun(num,fun(num,num)) m:num) ((#*:fun(num,fun(num,num)) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) m:num)) ((#*:fun(num,fun(num,num)) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) n:num)) ((#nadd_rinv:fun(nadd,fun(num,num)) x:nadd) n:num))))) ((#*:fun(num,fun(num,num)) m:num) ((#*:fun(num,fun(num,num)) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) m:num)) ((#*:fun(num,fun(num,num)) n:num) n:num)))))) ((#*:fun(num,fun(num,num)) m:num) ((#*:fun(num,fun(num,num)) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) m:num)) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) n:num))))))))))))))
      #|NADD_MUL_LINV_LEMMA4 =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd) (#nadd_of_num:fun(num,nadd) (#NUMERAL:fun(num,num) #_0:num))))) (#?:fun(fun(num,bool),bool) (\N:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) N:num) m:num)) ((#<=:fun(num,fun(num,bool)) N:num) n:num))) ((#<=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) m:num)) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) n:num))) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#*:fun(num,fun(num,num)) m:num) ((#nadd_rinv:fun(nadd,fun(num,num)) x:nadd) n:num))) ((#*:fun(num,fun(num,num)) n:num) ((#nadd_rinv:fun(nadd,fun(num,num)) x:nadd) m:num)))))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) n:num)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#*:fun(num,fun(num,num)) m:num) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) n:num))) ((#*:fun(num,fun(num,num)) n:num) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) m:num)))))) ((#*:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) m:num)) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) n:num))) ((#+:fun(num,fun(num,num)) m:num) n:num))))))))))))))
      #|NADD_MUL_LINV_LEMMA5 =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd) (#nadd_of_num:fun(num,nadd) (#NUMERAL:fun(num,num) #_0:num))))) (#?:fun(fun(num,bool),bool) (\B:num. (#?:fun(fun(num,bool),bool) (\N:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) N:num) m:num)) ((#<=:fun(num,fun(num,bool)) N:num) n:num))) ((#<=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) m:num)) ((#dest_nadd:fun(nadd,fun(num,num)) x:nadd) n:num))) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#*:fun(num,fun(num,num)) m:num) ((#nadd_rinv:fun(nadd,fun(num,num)) x:nadd) n:num))) ((#*:fun(num,fun(num,num)) n:num) ((#nadd_rinv:fun(nadd,fun(num,num)) x:nadd) m:num)))))) ((#*:fun(num,fun(num,num)) B:num) ((#*:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) n:num)) ((#+:fun(num,fun(num,num)) m:num) n:num))))))))))))))))
      #|NADD_MUL_LINV_LEMMA6 =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd) (#nadd_of_num:fun(num,nadd) (#NUMERAL:fun(num,num) #_0:num))))) (#?:fun(fun(num,bool),bool) (\B:num. (#?:fun(fun(num,bool),bool) (\N:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) N:num) m:num)) ((#<=:fun(num,fun(num,bool)) N:num) n:num))) ((#<=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) n:num)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#*:fun(num,fun(num,num)) m:num) ((#nadd_rinv:fun(nadd,fun(num,num)) x:nadd) n:num))) ((#*:fun(num,fun(num,num)) n:num) ((#nadd_rinv:fun(nadd,fun(num,num)) x:nadd) m:num)))))) ((#*:fun(num,fun(num,num)) B:num) ((#*:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) m:num) n:num)) ((#+:fun(num,fun(num,num)) m:num) n:num))))))))))))))))
      #|NADD_MUL_LINV_LEMMA7 =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd) (#nadd_of_num:fun(num,nadd) (#NUMERAL:fun(num,num) #_0:num))))) (#?:fun(fun(num,bool),bool) (\B:num. (#?:fun(fun(num,bool),bool) (\N:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) N:num) m:num)) ((#<=:fun(num,fun(num,bool)) N:num) n:num))) ((#<=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#*:fun(num,fun(num,num)) m:num) ((#nadd_rinv:fun(nadd,fun(num,num)) x:nadd) n:num))) ((#*:fun(num,fun(num,num)) n:num) ((#nadd_rinv:fun(nadd,fun(num,num)) x:nadd) m:num))))) ((#*:fun(num,fun(num,num)) B:num) ((#+:fun(num,fun(num,num)) m:num) n:num)))))))))))))))
      #|NADD_MUL_LINV_LEMMA7a =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd) (#nadd_of_num:fun(num,nadd) (#NUMERAL:fun(num,num) #_0:num))))) (#forall:fun(fun(num,bool),bool) (\N:num. (#?:fun(fun(num,bool),bool) (\A:num. (#?:fun(fun(num,bool),bool) (\B:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) N:num)) ((#<=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#*:fun(num,fun(num,num)) m:num) ((#nadd_rinv:fun(nadd,fun(num,num)) x:nadd) n:num))) ((#*:fun(num,fun(num,num)) n:num) ((#nadd_rinv:fun(nadd,fun(num,num)) x:nadd) m:num))))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) A:num) n:num)) B:num))))))))))))))))
      #|NADD_MUL_LINV_LEMMA8 =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd) (#nadd_of_num:fun(num,nadd) (#NUMERAL:fun(num,num) #_0:num))))) (#?:fun(fun(num,bool),bool) (\B:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) (#dist:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) ((#*:fun(num,fun(num,num)) m:num) ((#nadd_rinv:fun(nadd,fun(num,num)) x:nadd) n:num))) ((#*:fun(num,fun(num,num)) n:num) ((#nadd_rinv:fun(nadd,fun(num,num)) x:nadd) m:num))))) ((#*:fun(num,fun(num,num)) B:num) ((#+:fun(num,fun(num,num)) m:num) n:num))))))))))))
      #|nadd_inv =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. ((#=:fun(nadd,fun(nadd,bool)) (#nadd_inv:fun(nadd,nadd) x:nadd)) (((#COND:fun(bool,fun(nadd,fun(nadd,nadd))) ((#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd) (#nadd_of_num:fun(num,nadd) (#NUMERAL:fun(num,num) #_0:num)))) (#nadd_of_num:fun(num,nadd) (#NUMERAL:fun(num,num) #_0:num))) (#mk_nadd:fun(fun(num,num),nadd) (#nadd_rinv:fun(nadd,fun(num,num)) x:nadd))))))
      #|NADD_INV =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. ((#=:fun(fun(num,num),fun(fun(num,num),bool)) (#dest_nadd:fun(nadd,fun(num,num)) (#nadd_inv:fun(nadd,nadd) x:nadd))) (((#COND:fun(bool,fun(fun(num,num),fun(fun(num,num),fun(num,num)))) ((#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd) (#nadd_of_num:fun(num,nadd) (#NUMERAL:fun(num,num) #_0:num)))) (\n:num. (#NUMERAL:fun(num,num) #_0:num))) (#nadd_rinv:fun(nadd,fun(num,num)) x:nadd)))))
      #|NADD_MUL_LINV =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd) (#nadd_of_num:fun(num,nadd) (#NUMERAL:fun(num,num) #_0:num))))) ((#nadd_eq:fun(nadd,fun(nadd,bool)) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) (#nadd_inv:fun(nadd,nadd) x:nadd)) x:nadd)) (#nadd_of_num:fun(num,nadd) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|NADD_INV_0 =  |- ((#nadd_eq:fun(nadd,fun(nadd,bool)) (#nadd_inv:fun(nadd,nadd) (#nadd_of_num:fun(num,nadd) (#NUMERAL:fun(num,num) #_0:num)))) (#nadd_of_num:fun(num,nadd) (#NUMERAL:fun(num,num) #_0:num)))
      #|NADD_INV_WELLDEF =  |- (#forall:fun(fun(nadd,bool),bool) (\x:nadd. (#forall:fun(fun(nadd,bool),bool) (\y:nadd. ((#==>:fun(bool,fun(bool,bool)) ((#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd) y:nadd)) ((#nadd_eq:fun(nadd,fun(nadd,bool)) (#nadd_inv:fun(nadd,nadd) x:nadd)) (#nadd_inv:fun(nadd,nadd) y:nadd)))))))
      #|hreal_of_num =  |- ((#=:fun(hreal,fun(hreal,bool)) (#hreal_of_num:fun(num,hreal) m:num)) (#mk_hreal:fun(fun(nadd,bool),hreal) (\u:nadd. ((#nadd_eq:fun(nadd,fun(nadd,bool)) (#nadd_of_num:fun(num,nadd) m:num)) u:nadd))))
      #|hreal_of_num_th =  |- ((#=:fun(hreal,fun(hreal,bool)) (#mk_hreal:fun(fun(nadd,bool),hreal) (#nadd_eq:fun(nadd,fun(nadd,bool)) (#nadd_of_num:fun(num,nadd) m:num)))) (#hreal_of_num:fun(num,hreal) m:num))
      #|hreal_add =  |- ((#=:fun(hreal,fun(hreal,bool)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) x:hreal) y:hreal)) (#mk_hreal:fun(fun(nadd,bool),hreal) (\u:nadd. (#?:fun(fun(nadd,bool),bool) (\x:nadd. (#?:fun(fun(nadd,bool),bool) (\y:nadd. ((#/\:fun(bool,fun(bool,bool)) ((#nadd_eq:fun(nadd,fun(nadd,bool)) ((#nadd_add:fun(nadd,fun(nadd,nadd)) x:nadd) y:nadd)) u:nadd)) ((#/\:fun(bool,fun(bool,bool)) ((#dest_hreal:fun(hreal,fun(nadd,bool)) x:hreal) x:nadd)) ((#dest_hreal:fun(hreal,fun(nadd,bool)) y:hreal) y:nadd))))))))))
      #|hreal_add_th =  |- ((#=:fun(hreal,fun(hreal,bool)) (#mk_hreal:fun(fun(nadd,bool),hreal) (#nadd_eq:fun(nadd,fun(nadd,bool)) ((#nadd_add:fun(nadd,fun(nadd,nadd)) x:nadd) y:nadd)))) ((#hreal_add:fun(hreal,fun(hreal,hreal)) (#mk_hreal:fun(fun(nadd,bool),hreal) (#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd))) (#mk_hreal:fun(fun(nadd,bool),hreal) (#nadd_eq:fun(nadd,fun(nadd,bool)) y:nadd))))
      #|hreal_mul =  |- ((#=:fun(hreal,fun(hreal,bool)) ((#hreal_mul:fun(hreal,fun(hreal,hreal)) x:hreal) y:hreal)) (#mk_hreal:fun(fun(nadd,bool),hreal) (\u:nadd. (#?:fun(fun(nadd,bool),bool) (\x:nadd. (#?:fun(fun(nadd,bool),bool) (\y:nadd. ((#/\:fun(bool,fun(bool,bool)) ((#nadd_eq:fun(nadd,fun(nadd,bool)) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) x:nadd) y:nadd)) u:nadd)) ((#/\:fun(bool,fun(bool,bool)) ((#dest_hreal:fun(hreal,fun(nadd,bool)) x:hreal) x:nadd)) ((#dest_hreal:fun(hreal,fun(nadd,bool)) y:hreal) y:nadd))))))))))
      #|hreal_mul_th =  |- ((#=:fun(hreal,fun(hreal,bool)) (#mk_hreal:fun(fun(nadd,bool),hreal) (#nadd_eq:fun(nadd,fun(nadd,bool)) ((#nadd_mul:fun(nadd,fun(nadd,nadd)) x:nadd) y:nadd)))) ((#hreal_mul:fun(hreal,fun(hreal,hreal)) (#mk_hreal:fun(fun(nadd,bool),hreal) (#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd))) (#mk_hreal:fun(fun(nadd,bool),hreal) (#nadd_eq:fun(nadd,fun(nadd,bool)) y:nadd))))
      #|hreal_le =  |- ((#=:fun(bool,fun(bool,bool)) ((#hreal_le:fun(hreal,fun(hreal,bool)) x:hreal) y:hreal)) (#@:fun(fun(bool,bool),bool) (\u:bool. (#?:fun(fun(nadd,bool),bool) (\x:nadd. (#?:fun(fun(nadd,bool),bool) (\y:nadd. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#nadd_le:fun(nadd,fun(nadd,bool)) x:nadd) y:nadd)) u:bool)) ((#/\:fun(bool,fun(bool,bool)) ((#dest_hreal:fun(hreal,fun(nadd,bool)) x:hreal) x:nadd)) ((#dest_hreal:fun(hreal,fun(nadd,bool)) y:hreal) y:nadd))))))))))
      #|hreal_le_th =  |- ((#=:fun(bool,fun(bool,bool)) ((#nadd_le:fun(nadd,fun(nadd,bool)) x:nadd) y:nadd)) ((#hreal_le:fun(hreal,fun(hreal,bool)) (#mk_hreal:fun(fun(nadd,bool),hreal) (#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd))) (#mk_hreal:fun(fun(nadd,bool),hreal) (#nadd_eq:fun(nadd,fun(nadd,bool)) y:nadd))))
      #|hreal_inv =  |- ((#=:fun(hreal,fun(hreal,bool)) (#hreal_inv:fun(hreal,hreal) x:hreal)) (#mk_hreal:fun(fun(nadd,bool),hreal) (\u:nadd. (#?:fun(fun(nadd,bool),bool) (\x:nadd. ((#/\:fun(bool,fun(bool,bool)) ((#nadd_eq:fun(nadd,fun(nadd,bool)) (#nadd_inv:fun(nadd,nadd) x:nadd)) u:nadd)) ((#dest_hreal:fun(hreal,fun(nadd,bool)) x:hreal) x:nadd)))))))
      #|hreal_inv_th =  |- ((#=:fun(hreal,fun(hreal,bool)) (#mk_hreal:fun(fun(nadd,bool),hreal) (#nadd_eq:fun(nadd,fun(nadd,bool)) (#nadd_inv:fun(nadd,nadd) x:nadd)))) (#hreal_inv:fun(hreal,hreal) (#mk_hreal:fun(fun(nadd,bool),hreal) (#nadd_eq:fun(nadd,fun(nadd,bool)) x:nadd))))
      #|HREAL_COMPLETE =  |- (#forall:fun(fun(fun(hreal,bool),bool),bool) (\P:fun(hreal,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(hreal,bool),bool) (\x:hreal. (P:fun(hreal,bool) x:hreal)))) (#?:fun(fun(hreal,bool),bool) (\M:hreal. (#forall:fun(fun(hreal,bool),bool) (\x:hreal. ((#==>:fun(bool,fun(bool,bool)) (P:fun(hreal,bool) x:hreal)) ((#hreal_le:fun(hreal,fun(hreal,bool)) x:hreal) M:hreal)))))))) (#?:fun(fun(hreal,bool),bool) (\M:hreal. ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(hreal,bool),bool) (\x:hreal. ((#==>:fun(bool,fun(bool,bool)) (P:fun(hreal,bool) x:hreal)) ((#hreal_le:fun(hreal,fun(hreal,bool)) x:hreal) M:hreal))))) (#forall:fun(fun(hreal,bool),bool) (\M':hreal. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(hreal,bool),bool) (\x:hreal. ((#==>:fun(bool,fun(bool,bool)) (P:fun(hreal,bool) x:hreal)) ((#hreal_le:fun(hreal,fun(hreal,bool)) x:hreal) M':hreal))))) ((#hreal_le:fun(hreal,fun(hreal,bool)) M:hreal) M':hreal))))))))))
      #|HREAL_OF_NUM_EQ =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(hreal,fun(hreal,bool)) (#hreal_of_num:fun(num,hreal) m:num)) (#hreal_of_num:fun(num,hreal) n:num))) ((#=:fun(num,fun(num,bool)) m:num) n:num))))))
      #|HREAL_OF_NUM_LE =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#hreal_le:fun(hreal,fun(hreal,bool)) (#hreal_of_num:fun(num,hreal) m:num)) (#hreal_of_num:fun(num,hreal) n:num))) ((#<=:fun(num,fun(num,bool)) m:num) n:num))))))
      #|HREAL_OF_NUM_ADD =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(hreal,fun(hreal,bool)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) (#hreal_of_num:fun(num,hreal) m:num)) (#hreal_of_num:fun(num,hreal) n:num))) (#hreal_of_num:fun(num,hreal) ((#+:fun(num,fun(num,num)) m:num) n:num)))))))
      #|HREAL_OF_NUM_MUL =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(hreal,fun(hreal,bool)) ((#hreal_mul:fun(hreal,fun(hreal,hreal)) (#hreal_of_num:fun(num,hreal) m:num)) (#hreal_of_num:fun(num,hreal) n:num))) (#hreal_of_num:fun(num,hreal) ((#*:fun(num,fun(num,num)) m:num) n:num)))))))
      #|HREAL_LE_REFL =  |- (#forall:fun(fun(hreal,bool),bool) (\x:hreal. ((#hreal_le:fun(hreal,fun(hreal,bool)) x:hreal) x:hreal)))
      #|HREAL_LE_TRANS =  |- (#forall:fun(fun(hreal,bool),bool) (\x:hreal. (#forall:fun(fun(hreal,bool),bool) (\y:hreal. (#forall:fun(fun(hreal,bool),bool) (\z:hreal. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#hreal_le:fun(hreal,fun(hreal,bool)) x:hreal) y:hreal)) ((#hreal_le:fun(hreal,fun(hreal,bool)) y:hreal) z:hreal))) ((#hreal_le:fun(hreal,fun(hreal,bool)) x:hreal) z:hreal))))))))
      #|HREAL_LE_ANTISYM =  |- (#forall:fun(fun(hreal,bool),bool) (\x:hreal. (#forall:fun(fun(hreal,bool),bool) (\y:hreal. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#hreal_le:fun(hreal,fun(hreal,bool)) x:hreal) y:hreal)) ((#hreal_le:fun(hreal,fun(hreal,bool)) y:hreal) x:hreal))) ((#=:fun(hreal,fun(hreal,bool)) x:hreal) y:hreal))))))
      #|HREAL_LE_TOTAL =  |- (#forall:fun(fun(hreal,bool),bool) (\x:hreal. (#forall:fun(fun(hreal,bool),bool) (\y:hreal. ((#\/:fun(bool,fun(bool,bool)) ((#hreal_le:fun(hreal,fun(hreal,bool)) x:hreal) y:hreal)) ((#hreal_le:fun(hreal,fun(hreal,bool)) y:hreal) x:hreal))))))
      #|HREAL_LE_ADD =  |- (#forall:fun(fun(hreal,bool),bool) (\x:hreal. (#forall:fun(fun(hreal,bool),bool) (\y:hreal. ((#hreal_le:fun(hreal,fun(hreal,bool)) x:hreal) ((#hreal_add:fun(hreal,fun(hreal,hreal)) x:hreal) y:hreal))))))
      #|HREAL_LE_EXISTS =  |- (#forall:fun(fun(hreal,bool),bool) (\x:hreal. (#forall:fun(fun(hreal,bool),bool) (\y:hreal. ((#==>:fun(bool,fun(bool,bool)) ((#hreal_le:fun(hreal,fun(hreal,bool)) x:hreal) y:hreal)) (#?:fun(fun(hreal,bool),bool) (\d:hreal. ((#=:fun(hreal,fun(hreal,bool)) y:hreal) ((#hreal_add:fun(hreal,fun(hreal,hreal)) x:hreal) d:hreal)))))))))
      #|HREAL_ARCH =  |- (#forall:fun(fun(hreal,bool),bool) (\x:hreal. (#?:fun(fun(num,bool),bool) (\n:num. ((#hreal_le:fun(hreal,fun(hreal,bool)) x:hreal) (#hreal_of_num:fun(num,hreal) n:num))))))
      #|HREAL_ADD_SYM =  |- (#forall:fun(fun(hreal,bool),bool) (\x:hreal. (#forall:fun(fun(hreal,bool),bool) (\y:hreal. ((#=:fun(hreal,fun(hreal,bool)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) x:hreal) y:hreal)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) y:hreal) x:hreal))))))
      #|HREAL_ADD_ASSOC =  |- (#forall:fun(fun(hreal,bool),bool) (\x:hreal. (#forall:fun(fun(hreal,bool),bool) (\y:hreal. (#forall:fun(fun(hreal,bool),bool) (\z:hreal. ((#=:fun(hreal,fun(hreal,bool)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) x:hreal) ((#hreal_add:fun(hreal,fun(hreal,hreal)) y:hreal) z:hreal))) ((#hreal_add:fun(hreal,fun(hreal,hreal)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) x:hreal) y:hreal)) z:hreal))))))))
      #|HREAL_ADD_LID =  |- (#forall:fun(fun(hreal,bool),bool) (\x:hreal. ((#=:fun(hreal,fun(hreal,bool)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) (#hreal_of_num:fun(num,hreal) (#NUMERAL:fun(num,num) #_0:num))) x:hreal)) x:hreal)))
      #|HREAL_ADD_LCANCEL =  |- (#forall:fun(fun(hreal,bool),bool) (\x:hreal. (#forall:fun(fun(hreal,bool),bool) (\y:hreal. (#forall:fun(fun(hreal,bool),bool) (\z:hreal. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(hreal,fun(hreal,bool)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) x:hreal) y:hreal)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) x:hreal) z:hreal))) ((#=:fun(hreal,fun(hreal,bool)) y:hreal) z:hreal))))))))
      #|HREAL_MUL_SYM =  |- (#forall:fun(fun(hreal,bool),bool) (\x:hreal. (#forall:fun(fun(hreal,bool),bool) (\y:hreal. ((#=:fun(hreal,fun(hreal,bool)) ((#hreal_mul:fun(hreal,fun(hreal,hreal)) x:hreal) y:hreal)) ((#hreal_mul:fun(hreal,fun(hreal,hreal)) y:hreal) x:hreal))))))
      #|HREAL_MUL_ASSOC =  |- (#forall:fun(fun(hreal,bool),bool) (\x:hreal. (#forall:fun(fun(hreal,bool),bool) (\y:hreal. (#forall:fun(fun(hreal,bool),bool) (\z:hreal. ((#=:fun(hreal,fun(hreal,bool)) ((#hreal_mul:fun(hreal,fun(hreal,hreal)) x:hreal) ((#hreal_mul:fun(hreal,fun(hreal,hreal)) y:hreal) z:hreal))) ((#hreal_mul:fun(hreal,fun(hreal,hreal)) ((#hreal_mul:fun(hreal,fun(hreal,hreal)) x:hreal) y:hreal)) z:hreal))))))))
      #|HREAL_MUL_LID =  |- (#forall:fun(fun(hreal,bool),bool) (\x:hreal. ((#=:fun(hreal,fun(hreal,bool)) ((#hreal_mul:fun(hreal,fun(hreal,hreal)) (#hreal_of_num:fun(num,hreal) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:hreal)) x:hreal)))
      #|HREAL_ADD_LDISTRIB =  |- (#forall:fun(fun(hreal,bool),bool) (\x:hreal. (#forall:fun(fun(hreal,bool),bool) (\y:hreal. (#forall:fun(fun(hreal,bool),bool) (\z:hreal. ((#=:fun(hreal,fun(hreal,bool)) ((#hreal_mul:fun(hreal,fun(hreal,hreal)) x:hreal) ((#hreal_add:fun(hreal,fun(hreal,hreal)) y:hreal) z:hreal))) ((#hreal_add:fun(hreal,fun(hreal,hreal)) ((#hreal_mul:fun(hreal,fun(hreal,hreal)) x:hreal) y:hreal)) ((#hreal_mul:fun(hreal,fun(hreal,hreal)) x:hreal) z:hreal)))))))))
      #|HREAL_MUL_LINV =  |- (#forall:fun(fun(hreal,bool),bool) (\x:hreal. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(hreal,fun(hreal,bool)) x:hreal) (#hreal_of_num:fun(num,hreal) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(hreal,fun(hreal,bool)) ((#hreal_mul:fun(hreal,fun(hreal,hreal)) (#hreal_inv:fun(hreal,hreal) x:hreal)) x:hreal)) (#hreal_of_num:fun(num,hreal) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|HREAL_INV_0 =  |- ((#=:fun(hreal,fun(hreal,bool)) (#hreal_inv:fun(hreal,hreal) (#hreal_of_num:fun(num,hreal) (#NUMERAL:fun(num,num) #_0:num)))) (#hreal_of_num:fun(num,hreal) (#NUMERAL:fun(num,num) #_0:num)))
      #|HREAL_LE_EXISTS_DEF =  |- (#forall:fun(fun(hreal,bool),bool) (\m:hreal. (#forall:fun(fun(hreal,bool),bool) (\n:hreal. ((#=:fun(bool,fun(bool,bool)) ((#hreal_le:fun(hreal,fun(hreal,bool)) m:hreal) n:hreal)) (#?:fun(fun(hreal,bool),bool) (\d:hreal. ((#=:fun(hreal,fun(hreal,bool)) n:hreal) ((#hreal_add:fun(hreal,fun(hreal,hreal)) m:hreal) d:hreal)))))))))
      #|HREAL_EQ_ADD_LCANCEL =  |- (#forall:fun(fun(hreal,bool),bool) (\m:hreal. (#forall:fun(fun(hreal,bool),bool) (\n:hreal. (#forall:fun(fun(hreal,bool),bool) (\p:hreal. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(hreal,fun(hreal,bool)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) m:hreal) n:hreal)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) m:hreal) p:hreal))) ((#=:fun(hreal,fun(hreal,bool)) n:hreal) p:hreal))))))))
      #|HREAL_EQ_ADD_RCANCEL =  |- (#forall:fun(fun(hreal,bool),bool) (\m:hreal. (#forall:fun(fun(hreal,bool),bool) (\n:hreal. (#forall:fun(fun(hreal,bool),bool) (\p:hreal. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(hreal,fun(hreal,bool)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) m:hreal) p:hreal)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) n:hreal) p:hreal))) ((#=:fun(hreal,fun(hreal,bool)) m:hreal) n:hreal))))))))
      #|HREAL_LE_ADD_LCANCEL =  |- (#forall:fun(fun(hreal,bool),bool) (\m:hreal. (#forall:fun(fun(hreal,bool),bool) (\n:hreal. (#forall:fun(fun(hreal,bool),bool) (\p:hreal. ((#=:fun(bool,fun(bool,bool)) ((#hreal_le:fun(hreal,fun(hreal,bool)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) m:hreal) n:hreal)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) m:hreal) p:hreal))) ((#hreal_le:fun(hreal,fun(hreal,bool)) n:hreal) p:hreal))))))))
      #|HREAL_LE_ADD_RCANCEL =  |- (#forall:fun(fun(hreal,bool),bool) (\m:hreal. (#forall:fun(fun(hreal,bool),bool) (\n:hreal. (#forall:fun(fun(hreal,bool),bool) (\p:hreal. ((#=:fun(bool,fun(bool,bool)) ((#hreal_le:fun(hreal,fun(hreal,bool)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) m:hreal) p:hreal)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) n:hreal) p:hreal))) ((#hreal_le:fun(hreal,fun(hreal,bool)) m:hreal) n:hreal))))))))
      #|HREAL_ADD_RID =  |- (#forall:fun(fun(hreal,bool),bool) (\n:hreal. ((#=:fun(hreal,fun(hreal,bool)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) n:hreal) (#hreal_of_num:fun(num,hreal) (#NUMERAL:fun(num,num) #_0:num)))) n:hreal)))
      #|HREAL_ADD_RDISTRIB =  |- (#forall:fun(fun(hreal,bool),bool) (\m:hreal. (#forall:fun(fun(hreal,bool),bool) (\n:hreal. (#forall:fun(fun(hreal,bool),bool) (\p:hreal. ((#=:fun(hreal,fun(hreal,bool)) ((#hreal_mul:fun(hreal,fun(hreal,hreal)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) m:hreal) n:hreal)) p:hreal)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) ((#hreal_mul:fun(hreal,fun(hreal,hreal)) m:hreal) p:hreal)) ((#hreal_mul:fun(hreal,fun(hreal,hreal)) n:hreal) p:hreal)))))))))
      #|HREAL_MUL_LZERO =  |- (#forall:fun(fun(hreal,bool),bool) (\m:hreal. ((#=:fun(hreal,fun(hreal,bool)) ((#hreal_mul:fun(hreal,fun(hreal,hreal)) (#hreal_of_num:fun(num,hreal) (#NUMERAL:fun(num,num) #_0:num))) m:hreal)) (#hreal_of_num:fun(num,hreal) (#NUMERAL:fun(num,num) #_0:num)))))
      #|HREAL_MUL_RZERO =  |- (#forall:fun(fun(hreal,bool),bool) (\m:hreal. ((#=:fun(hreal,fun(hreal,bool)) ((#hreal_mul:fun(hreal,fun(hreal,hreal)) m:hreal) (#hreal_of_num:fun(num,hreal) (#NUMERAL:fun(num,num) #_0:num)))) (#hreal_of_num:fun(num,hreal) (#NUMERAL:fun(num,num) #_0:num)))))
      #|HREAL_ADD_AC =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(hreal,fun(hreal,bool)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) m:hreal) n:hreal)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) n:hreal) m:hreal))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(hreal,fun(hreal,bool)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) m:hreal) n:hreal)) p:hreal)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) m:hreal) ((#hreal_add:fun(hreal,fun(hreal,hreal)) n:hreal) p:hreal)))) ((#=:fun(hreal,fun(hreal,bool)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) m:hreal) ((#hreal_add:fun(hreal,fun(hreal,hreal)) n:hreal) p:hreal))) ((#hreal_add:fun(hreal,fun(hreal,hreal)) n:hreal) ((#hreal_add:fun(hreal,fun(hreal,hreal)) m:hreal) p:hreal)))))
      #|HREAL_LE_ADD2 =  |- (#forall:fun(fun(hreal,bool),bool) (\a:hreal. (#forall:fun(fun(hreal,bool),bool) (\b:hreal. (#forall:fun(fun(hreal,bool),bool) (\c:hreal. (#forall:fun(fun(hreal,bool),bool) (\d:hreal. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#hreal_le:fun(hreal,fun(hreal,bool)) a:hreal) b:hreal)) ((#hreal_le:fun(hreal,fun(hreal,bool)) c:hreal) d:hreal))) ((#hreal_le:fun(hreal,fun(hreal,bool)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) a:hreal) c:hreal)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) b:hreal) d:hreal)))))))))))
      #|HREAL_LE_MUL_RCANCEL_IMP =  |- (#forall:fun(fun(hreal,bool),bool) (\a:hreal. (#forall:fun(fun(hreal,bool),bool) (\b:hreal. (#forall:fun(fun(hreal,bool),bool) (\c:hreal. ((#==>:fun(bool,fun(bool,bool)) ((#hreal_le:fun(hreal,fun(hreal,bool)) a:hreal) b:hreal)) ((#hreal_le:fun(hreal,fun(hreal,bool)) ((#hreal_mul:fun(hreal,fun(hreal,hreal)) a:hreal) c:hreal)) ((#hreal_mul:fun(hreal,fun(hreal,hreal)) b:hreal) c:hreal)))))))))
      #|treal_of_num =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) (#treal_of_num:fun(num,prod(hreal,hreal)) n:num)) ((#,:fun(hreal,fun(hreal,prod(hreal,hreal))) (#hreal_of_num:fun(num,hreal) n:num)) (#hreal_of_num:fun(num,hreal) (#NUMERAL:fun(num,num) #_0:num))))))
      #|treal_neg =  |- (#forall:fun(fun(hreal,bool),bool) (\y:hreal. (#forall:fun(fun(hreal,bool),bool) (\x:hreal. ((#=:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) (#treal_neg:fun(prod(hreal,hreal),prod(hreal,hreal)) ((#,:fun(hreal,fun(hreal,prod(hreal,hreal))) x:hreal) y:hreal))) ((#,:fun(hreal,fun(hreal,prod(hreal,hreal))) y:hreal) x:hreal))))))
      #|treal_add =  |- (#forall:fun(fun(hreal,bool),bool) (\x1:hreal. (#forall:fun(fun(hreal,bool),bool) (\x2:hreal. (#forall:fun(fun(hreal,bool),bool) (\y1:hreal. (#forall:fun(fun(hreal,bool),bool) (\y2:hreal. ((#=:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) ((#treal_add:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) ((#,:fun(hreal,fun(hreal,prod(hreal,hreal))) x1:hreal) y1:hreal)) ((#,:fun(hreal,fun(hreal,prod(hreal,hreal))) x2:hreal) y2:hreal))) ((#,:fun(hreal,fun(hreal,prod(hreal,hreal))) ((#hreal_add:fun(hreal,fun(hreal,hreal)) x1:hreal) x2:hreal)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) y1:hreal) y2:hreal)))))))))))
      #|treal_mul =  |- (#forall:fun(fun(hreal,bool),bool) (\x1:hreal. (#forall:fun(fun(hreal,bool),bool) (\y2:hreal. (#forall:fun(fun(hreal,bool),bool) (\y1:hreal. (#forall:fun(fun(hreal,bool),bool) (\x2:hreal. ((#=:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) ((#treal_mul:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) ((#,:fun(hreal,fun(hreal,prod(hreal,hreal))) x1:hreal) y1:hreal)) ((#,:fun(hreal,fun(hreal,prod(hreal,hreal))) x2:hreal) y2:hreal))) ((#,:fun(hreal,fun(hreal,prod(hreal,hreal))) ((#hreal_add:fun(hreal,fun(hreal,hreal)) ((#hreal_mul:fun(hreal,fun(hreal,hreal)) x1:hreal) x2:hreal)) ((#hreal_mul:fun(hreal,fun(hreal,hreal)) y1:hreal) y2:hreal))) ((#hreal_add:fun(hreal,fun(hreal,hreal)) ((#hreal_mul:fun(hreal,fun(hreal,hreal)) x1:hreal) y2:hreal)) ((#hreal_mul:fun(hreal,fun(hreal,hreal)) y1:hreal) x2:hreal))))))))))))
      #|treal_le =  |- (#forall:fun(fun(hreal,bool),bool) (\x1:hreal. (#forall:fun(fun(hreal,bool),bool) (\y2:hreal. (#forall:fun(fun(hreal,bool),bool) (\x2:hreal. (#forall:fun(fun(hreal,bool),bool) (\y1:hreal. ((#=:fun(bool,fun(bool,bool)) ((#treal_le:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) ((#,:fun(hreal,fun(hreal,prod(hreal,hreal))) x1:hreal) y1:hreal)) ((#,:fun(hreal,fun(hreal,prod(hreal,hreal))) x2:hreal) y2:hreal))) ((#hreal_le:fun(hreal,fun(hreal,bool)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) x1:hreal) y2:hreal)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) x2:hreal) y1:hreal)))))))))))
      #|treal_inv =  |- (#forall:fun(fun(hreal,bool),bool) (\y:hreal. (#forall:fun(fun(hreal,bool),bool) (\x:hreal. ((#=:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) (#treal_inv:fun(prod(hreal,hreal),prod(hreal,hreal)) ((#,:fun(hreal,fun(hreal,prod(hreal,hreal))) x:hreal) y:hreal))) (((#COND:fun(bool,fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal)))) ((#=:fun(hreal,fun(hreal,bool)) x:hreal) y:hreal)) ((#,:fun(hreal,fun(hreal,prod(hreal,hreal))) (#hreal_of_num:fun(num,hreal) (#NUMERAL:fun(num,num) #_0:num))) (#hreal_of_num:fun(num,hreal) (#NUMERAL:fun(num,num) #_0:num)))) (((#COND:fun(bool,fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal)))) ((#hreal_le:fun(hreal,fun(hreal,bool)) y:hreal) x:hreal)) ((#,:fun(hreal,fun(hreal,prod(hreal,hreal))) (#hreal_inv:fun(hreal,hreal) (#@:fun(fun(hreal,bool),hreal) (\d:hreal. ((#=:fun(hreal,fun(hreal,bool)) x:hreal) ((#hreal_add:fun(hreal,fun(hreal,hreal)) y:hreal) d:hreal)))))) (#hreal_of_num:fun(num,hreal) (#NUMERAL:fun(num,num) #_0:num)))) ((#,:fun(hreal,fun(hreal,prod(hreal,hreal))) (#hreal_of_num:fun(num,hreal) (#NUMERAL:fun(num,num) #_0:num))) (#hreal_inv:fun(hreal,hreal) (#@:fun(fun(hreal,bool),hreal) (\d:hreal. ((#=:fun(hreal,fun(hreal,bool)) y:hreal) ((#hreal_add:fun(hreal,fun(hreal,hreal)) x:hreal) d:hreal)))))))))))))
      #|treal_eq =  |- (#forall:fun(fun(hreal,bool),bool) (\x1:hreal. (#forall:fun(fun(hreal,bool),bool) (\y2:hreal. (#forall:fun(fun(hreal,bool),bool) (\x2:hreal. (#forall:fun(fun(hreal,bool),bool) (\y1:hreal. ((#=:fun(bool,fun(bool,bool)) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) ((#,:fun(hreal,fun(hreal,prod(hreal,hreal))) x1:hreal) y1:hreal)) ((#,:fun(hreal,fun(hreal,prod(hreal,hreal))) x2:hreal) y2:hreal))) ((#=:fun(hreal,fun(hreal,bool)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) x1:hreal) y2:hreal)) ((#hreal_add:fun(hreal,fun(hreal,hreal)) x2:hreal) y1:hreal)))))))))))
      #|TREAL_EQ_REFL =  |- (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x:prod(hreal,hreal). ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x:prod(hreal,hreal)) x:prod(hreal,hreal))))
      #|TREAL_EQ_SYM =  |- (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\y:prod(hreal,hreal). ((#=:fun(bool,fun(bool,bool)) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x:prod(hreal,hreal)) y:prod(hreal,hreal))) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) y:prod(hreal,hreal)) x:prod(hreal,hreal)))))))
      #|TREAL_EQ_TRANS =  |- (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\y:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\z:prod(hreal,hreal). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x:prod(hreal,hreal)) y:prod(hreal,hreal))) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) y:prod(hreal,hreal)) z:prod(hreal,hreal)))) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x:prod(hreal,hreal)) z:prod(hreal,hreal)))))))))
      #|TREAL_EQ_AP =  |- (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\y:prod(hreal,hreal). ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x:prod(hreal,hreal)) y:prod(hreal,hreal))) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x:prod(hreal,hreal)) y:prod(hreal,hreal)))))))
      #|TREAL_OF_NUM_EQ =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) (#treal_of_num:fun(num,prod(hreal,hreal)) m:num)) (#treal_of_num:fun(num,prod(hreal,hreal)) n:num))) ((#=:fun(num,fun(num,bool)) m:num) n:num))))))
      #|TREAL_OF_NUM_LE =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#treal_le:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) (#treal_of_num:fun(num,prod(hreal,hreal)) m:num)) (#treal_of_num:fun(num,prod(hreal,hreal)) n:num))) ((#<=:fun(num,fun(num,bool)) m:num) n:num))))))
      #|TREAL_OF_NUM_ADD =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) ((#treal_add:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) (#treal_of_num:fun(num,prod(hreal,hreal)) m:num)) (#treal_of_num:fun(num,prod(hreal,hreal)) n:num))) (#treal_of_num:fun(num,prod(hreal,hreal)) ((#+:fun(num,fun(num,num)) m:num) n:num)))))))
      #|TREAL_OF_NUM_MUL =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) ((#treal_mul:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) (#treal_of_num:fun(num,prod(hreal,hreal)) m:num)) (#treal_of_num:fun(num,prod(hreal,hreal)) n:num))) (#treal_of_num:fun(num,prod(hreal,hreal)) ((#*:fun(num,fun(num,num)) m:num) n:num)))))))
      #|TREAL_ADD_SYM_EQ =  |- (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\y:prod(hreal,hreal). ((#=:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) ((#treal_add:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) x:prod(hreal,hreal)) y:prod(hreal,hreal))) ((#treal_add:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) y:prod(hreal,hreal)) x:prod(hreal,hreal)))))))
      #|TREAL_MUL_SYM_EQ =  |- (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\y:prod(hreal,hreal). ((#=:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) ((#treal_mul:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) x:prod(hreal,hreal)) y:prod(hreal,hreal))) ((#treal_mul:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) y:prod(hreal,hreal)) x:prod(hreal,hreal)))))))
      #|TREAL_ADD_SYM =  |- (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\y:prod(hreal,hreal). ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) ((#treal_add:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) x:prod(hreal,hreal)) y:prod(hreal,hreal))) ((#treal_add:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) y:prod(hreal,hreal)) x:prod(hreal,hreal)))))))
      #|TREAL_ADD_ASSOC =  |- (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\y:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\z:prod(hreal,hreal). ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) ((#treal_add:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) x:prod(hreal,hreal)) ((#treal_add:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) y:prod(hreal,hreal)) z:prod(hreal,hreal)))) ((#treal_add:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) ((#treal_add:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) x:prod(hreal,hreal)) y:prod(hreal,hreal))) z:prod(hreal,hreal)))))))))
      #|TREAL_ADD_LID =  |- (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x:prod(hreal,hreal). ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) ((#treal_add:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) (#treal_of_num:fun(num,prod(hreal,hreal)) (#NUMERAL:fun(num,num) #_0:num))) x:prod(hreal,hreal))) x:prod(hreal,hreal))))
      #|TREAL_ADD_LINV =  |- (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x:prod(hreal,hreal). ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) ((#treal_add:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) (#treal_neg:fun(prod(hreal,hreal),prod(hreal,hreal)) x:prod(hreal,hreal))) x:prod(hreal,hreal))) (#treal_of_num:fun(num,prod(hreal,hreal)) (#NUMERAL:fun(num,num) #_0:num)))))
      #|TREAL_MUL_SYM =  |- (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\y:prod(hreal,hreal). ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) ((#treal_mul:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) x:prod(hreal,hreal)) y:prod(hreal,hreal))) ((#treal_mul:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) y:prod(hreal,hreal)) x:prod(hreal,hreal)))))))
      #|TREAL_MUL_ASSOC =  |- (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\y:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\z:prod(hreal,hreal). ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) ((#treal_mul:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) x:prod(hreal,hreal)) ((#treal_mul:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) y:prod(hreal,hreal)) z:prod(hreal,hreal)))) ((#treal_mul:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) ((#treal_mul:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) x:prod(hreal,hreal)) y:prod(hreal,hreal))) z:prod(hreal,hreal)))))))))
      #|TREAL_MUL_LID =  |- (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x:prod(hreal,hreal). ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) ((#treal_mul:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) (#treal_of_num:fun(num,prod(hreal,hreal)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:prod(hreal,hreal))) x:prod(hreal,hreal))))
      #|TREAL_ADD_LDISTRIB =  |- (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\y:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\z:prod(hreal,hreal). ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) ((#treal_mul:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) x:prod(hreal,hreal)) ((#treal_add:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) y:prod(hreal,hreal)) z:prod(hreal,hreal)))) ((#treal_add:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) ((#treal_mul:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) x:prod(hreal,hreal)) y:prod(hreal,hreal))) ((#treal_mul:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) x:prod(hreal,hreal)) z:prod(hreal,hreal))))))))))
      #|TREAL_LE_REFL =  |- (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x:prod(hreal,hreal). ((#treal_le:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x:prod(hreal,hreal)) x:prod(hreal,hreal))))
      #|TREAL_LE_ANTISYM =  |- (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\y:prod(hreal,hreal). ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#treal_le:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x:prod(hreal,hreal)) y:prod(hreal,hreal))) ((#treal_le:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) y:prod(hreal,hreal)) x:prod(hreal,hreal)))) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x:prod(hreal,hreal)) y:prod(hreal,hreal)))))))
      #|TREAL_LE_TRANS =  |- (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\y:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\z:prod(hreal,hreal). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#treal_le:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x:prod(hreal,hreal)) y:prod(hreal,hreal))) ((#treal_le:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) y:prod(hreal,hreal)) z:prod(hreal,hreal)))) ((#treal_le:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x:prod(hreal,hreal)) z:prod(hreal,hreal)))))))))
      #|TREAL_LE_TOTAL =  |- (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\y:prod(hreal,hreal). ((#\/:fun(bool,fun(bool,bool)) ((#treal_le:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x:prod(hreal,hreal)) y:prod(hreal,hreal))) ((#treal_le:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) y:prod(hreal,hreal)) x:prod(hreal,hreal)))))))
      #|TREAL_LE_LADD_IMP =  |- (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\y:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\z:prod(hreal,hreal). ((#==>:fun(bool,fun(bool,bool)) ((#treal_le:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) y:prod(hreal,hreal)) z:prod(hreal,hreal))) ((#treal_le:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) ((#treal_add:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) x:prod(hreal,hreal)) y:prod(hreal,hreal))) ((#treal_add:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) x:prod(hreal,hreal)) z:prod(hreal,hreal))))))))))
      #|TREAL_LE_MUL =  |- (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\y:prod(hreal,hreal). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#treal_le:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) (#treal_of_num:fun(num,prod(hreal,hreal)) (#NUMERAL:fun(num,num) #_0:num))) x:prod(hreal,hreal))) ((#treal_le:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) (#treal_of_num:fun(num,prod(hreal,hreal)) (#NUMERAL:fun(num,num) #_0:num))) y:prod(hreal,hreal)))) ((#treal_le:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) (#treal_of_num:fun(num,prod(hreal,hreal)) (#NUMERAL:fun(num,num) #_0:num))) ((#treal_mul:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) x:prod(hreal,hreal)) y:prod(hreal,hreal))))))))
      #|TREAL_INV_0 =  |- ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) (#treal_inv:fun(prod(hreal,hreal),prod(hreal,hreal)) (#treal_of_num:fun(num,prod(hreal,hreal)) (#NUMERAL:fun(num,num) #_0:num)))) (#treal_of_num:fun(num,prod(hreal,hreal)) (#NUMERAL:fun(num,num) #_0:num)))
      #|TREAL_MUL_LINV =  |- (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x:prod(hreal,hreal). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x:prod(hreal,hreal)) (#treal_of_num:fun(num,prod(hreal,hreal)) (#NUMERAL:fun(num,num) #_0:num))))) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) ((#treal_mul:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) (#treal_inv:fun(prod(hreal,hreal),prod(hreal,hreal)) x:prod(hreal,hreal))) x:prod(hreal,hreal))) (#treal_of_num:fun(num,prod(hreal,hreal)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|TREAL_OF_NUM_WELLDEF =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) n:num)) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) (#treal_of_num:fun(num,prod(hreal,hreal)) m:num)) (#treal_of_num:fun(num,prod(hreal,hreal)) n:num)))))))
      #|TREAL_NEG_WELLDEF =  |- (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x1:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x2:prod(hreal,hreal). ((#==>:fun(bool,fun(bool,bool)) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x1:prod(hreal,hreal)) x2:prod(hreal,hreal))) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) (#treal_neg:fun(prod(hreal,hreal),prod(hreal,hreal)) x1:prod(hreal,hreal))) (#treal_neg:fun(prod(hreal,hreal),prod(hreal,hreal)) x2:prod(hreal,hreal))))))))
      #|TREAL_ADD_WELLDEFR =  |- (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x1:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x2:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\y:prod(hreal,hreal). ((#==>:fun(bool,fun(bool,bool)) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x1:prod(hreal,hreal)) x2:prod(hreal,hreal))) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) ((#treal_add:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) x1:prod(hreal,hreal)) y:prod(hreal,hreal))) ((#treal_add:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) x2:prod(hreal,hreal)) y:prod(hreal,hreal))))))))))
      #|TREAL_ADD_WELLDEF =  |- (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x1:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x2:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\y1:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\y2:prod(hreal,hreal). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x1:prod(hreal,hreal)) x2:prod(hreal,hreal))) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) y1:prod(hreal,hreal)) y2:prod(hreal,hreal)))) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) ((#treal_add:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) x1:prod(hreal,hreal)) y1:prod(hreal,hreal))) ((#treal_add:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) x2:prod(hreal,hreal)) y2:prod(hreal,hreal))))))))))))
      #|TREAL_MUL_WELLDEFR =  |- (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x1:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x2:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\y:prod(hreal,hreal). ((#==>:fun(bool,fun(bool,bool)) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x1:prod(hreal,hreal)) x2:prod(hreal,hreal))) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) ((#treal_mul:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) x1:prod(hreal,hreal)) y:prod(hreal,hreal))) ((#treal_mul:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) x2:prod(hreal,hreal)) y:prod(hreal,hreal))))))))))
      #|TREAL_MUL_WELLDEF =  |- (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x1:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x2:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\y1:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\y2:prod(hreal,hreal). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x1:prod(hreal,hreal)) x2:prod(hreal,hreal))) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) y1:prod(hreal,hreal)) y2:prod(hreal,hreal)))) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) ((#treal_mul:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) x1:prod(hreal,hreal)) y1:prod(hreal,hreal))) ((#treal_mul:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) x2:prod(hreal,hreal)) y2:prod(hreal,hreal))))))))))))
      #|TREAL_EQ_IMP_LE =  |- (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\y:prod(hreal,hreal). ((#==>:fun(bool,fun(bool,bool)) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x:prod(hreal,hreal)) y:prod(hreal,hreal))) ((#treal_le:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x:prod(hreal,hreal)) y:prod(hreal,hreal)))))))
      #|TREAL_LE_WELLDEF =  |- (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x1:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x2:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\y1:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\y2:prod(hreal,hreal). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x1:prod(hreal,hreal)) x2:prod(hreal,hreal))) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) y1:prod(hreal,hreal)) y2:prod(hreal,hreal)))) ((#=:fun(bool,fun(bool,bool)) ((#treal_le:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x1:prod(hreal,hreal)) y1:prod(hreal,hreal))) ((#treal_le:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x2:prod(hreal,hreal)) y2:prod(hreal,hreal))))))))))))
      #|TREAL_INV_WELLDEF =  |- (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\x:prod(hreal,hreal). (#forall:fun(fun(prod(hreal,hreal),bool),bool) (\y:prod(hreal,hreal). ((#==>:fun(bool,fun(bool,bool)) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x:prod(hreal,hreal)) y:prod(hreal,hreal))) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) (#treal_inv:fun(prod(hreal,hreal),prod(hreal,hreal)) x:prod(hreal,hreal))) (#treal_inv:fun(prod(hreal,hreal),prod(hreal,hreal)) y:prod(hreal,hreal))))))))
      #|real_of_num =  |- ((#=:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) m:num)) (#mk_real:fun(fun(prod(hreal,hreal),bool),real) (\u:prod(hreal,hreal). ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) (#treal_of_num:fun(num,prod(hreal,hreal)) m:num)) u:prod(hreal,hreal)))))
      #|real_of_num_th =  |- ((#=:fun(real,fun(real,bool)) (#mk_real:fun(fun(prod(hreal,hreal),bool),real) (#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) (#treal_of_num:fun(num,prod(hreal,hreal)) m:num)))) (#real_of_num:fun(num,real) m:num))
      #|real_neg =  |- ((#=:fun(real,fun(real,bool)) (#real_neg:fun(real,real) x1:real)) (#mk_real:fun(fun(prod(hreal,hreal),bool),real) (\u:prod(hreal,hreal). (#?:fun(fun(prod(hreal,hreal),bool),bool) (\x1:prod(hreal,hreal). ((#/\:fun(bool,fun(bool,bool)) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) (#treal_neg:fun(prod(hreal,hreal),prod(hreal,hreal)) x1:prod(hreal,hreal))) u:prod(hreal,hreal))) ((#dest_real:fun(real,fun(prod(hreal,hreal),bool)) x1:real) x1:prod(hreal,hreal))))))))
      #|real_neg_th =  |- ((#=:fun(real,fun(real,bool)) (#mk_real:fun(fun(prod(hreal,hreal),bool),real) (#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) (#treal_neg:fun(prod(hreal,hreal),prod(hreal,hreal)) x1:prod(hreal,hreal))))) (#real_neg:fun(real,real) (#mk_real:fun(fun(prod(hreal,hreal),bool),real) (#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x1:prod(hreal,hreal)))))
      #|real_add =  |- ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x1:real) y1:real)) (#mk_real:fun(fun(prod(hreal,hreal),bool),real) (\u:prod(hreal,hreal). (#?:fun(fun(prod(hreal,hreal),bool),bool) (\x1:prod(hreal,hreal). (#?:fun(fun(prod(hreal,hreal),bool),bool) (\y1:prod(hreal,hreal). ((#/\:fun(bool,fun(bool,bool)) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) ((#treal_add:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) x1:prod(hreal,hreal)) y1:prod(hreal,hreal))) u:prod(hreal,hreal))) ((#/\:fun(bool,fun(bool,bool)) ((#dest_real:fun(real,fun(prod(hreal,hreal),bool)) x1:real) x1:prod(hreal,hreal))) ((#dest_real:fun(real,fun(prod(hreal,hreal),bool)) y1:real) y1:prod(hreal,hreal)))))))))))
      #|real_add_th =  |- ((#=:fun(real,fun(real,bool)) (#mk_real:fun(fun(prod(hreal,hreal),bool),real) (#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) ((#treal_add:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) x1:prod(hreal,hreal)) y1:prod(hreal,hreal))))) ((#real_add:fun(real,fun(real,real)) (#mk_real:fun(fun(prod(hreal,hreal),bool),real) (#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x1:prod(hreal,hreal)))) (#mk_real:fun(fun(prod(hreal,hreal),bool),real) (#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) y1:prod(hreal,hreal)))))
      #|real_mul =  |- ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x1:real) y1:real)) (#mk_real:fun(fun(prod(hreal,hreal),bool),real) (\u:prod(hreal,hreal). (#?:fun(fun(prod(hreal,hreal),bool),bool) (\x1:prod(hreal,hreal). (#?:fun(fun(prod(hreal,hreal),bool),bool) (\y1:prod(hreal,hreal). ((#/\:fun(bool,fun(bool,bool)) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) ((#treal_mul:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) x1:prod(hreal,hreal)) y1:prod(hreal,hreal))) u:prod(hreal,hreal))) ((#/\:fun(bool,fun(bool,bool)) ((#dest_real:fun(real,fun(prod(hreal,hreal),bool)) x1:real) x1:prod(hreal,hreal))) ((#dest_real:fun(real,fun(prod(hreal,hreal),bool)) y1:real) y1:prod(hreal,hreal)))))))))))
      #|real_mul_th =  |- ((#=:fun(real,fun(real,bool)) (#mk_real:fun(fun(prod(hreal,hreal),bool),real) (#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) ((#treal_mul:fun(prod(hreal,hreal),fun(prod(hreal,hreal),prod(hreal,hreal))) x1:prod(hreal,hreal)) y1:prod(hreal,hreal))))) ((#real_mul:fun(real,fun(real,real)) (#mk_real:fun(fun(prod(hreal,hreal),bool),real) (#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x1:prod(hreal,hreal)))) (#mk_real:fun(fun(prod(hreal,hreal),bool),real) (#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) y1:prod(hreal,hreal)))))
      #|real_le =  |- ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x1:real) y1:real)) (#@:fun(fun(bool,bool),bool) (\u:bool. (#?:fun(fun(prod(hreal,hreal),bool),bool) (\x1:prod(hreal,hreal). (#?:fun(fun(prod(hreal,hreal),bool),bool) (\y1:prod(hreal,hreal). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#treal_le:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x1:prod(hreal,hreal)) y1:prod(hreal,hreal))) u:bool)) ((#/\:fun(bool,fun(bool,bool)) ((#dest_real:fun(real,fun(prod(hreal,hreal),bool)) x1:real) x1:prod(hreal,hreal))) ((#dest_real:fun(real,fun(prod(hreal,hreal),bool)) y1:real) y1:prod(hreal,hreal)))))))))))
      #|real_le_th =  |- ((#=:fun(bool,fun(bool,bool)) ((#treal_le:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x1:prod(hreal,hreal)) y1:prod(hreal,hreal))) ((#real_le:fun(real,fun(real,bool)) (#mk_real:fun(fun(prod(hreal,hreal),bool),real) (#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x1:prod(hreal,hreal)))) (#mk_real:fun(fun(prod(hreal,hreal),bool),real) (#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) y1:prod(hreal,hreal)))))
      #|real_inv =  |- ((#=:fun(real,fun(real,bool)) (#real_inv:fun(real,real) x:real)) (#mk_real:fun(fun(prod(hreal,hreal),bool),real) (\u:prod(hreal,hreal). (#?:fun(fun(prod(hreal,hreal),bool),bool) (\x:prod(hreal,hreal). ((#/\:fun(bool,fun(bool,bool)) ((#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) (#treal_inv:fun(prod(hreal,hreal),prod(hreal,hreal)) x:prod(hreal,hreal))) u:prod(hreal,hreal))) ((#dest_real:fun(real,fun(prod(hreal,hreal),bool)) x:real) x:prod(hreal,hreal))))))))
      #|real_inv_th =  |- ((#=:fun(real,fun(real,bool)) (#mk_real:fun(fun(prod(hreal,hreal),bool),real) (#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) (#treal_inv:fun(prod(hreal,hreal),prod(hreal,hreal)) x:prod(hreal,hreal))))) (#real_inv:fun(real,real) (#mk_real:fun(fun(prod(hreal,hreal),bool),real) (#treal_eq:fun(prod(hreal,hreal),fun(prod(hreal,hreal),bool)) x:prod(hreal,hreal)))))
      #|REAL_ADD_SYM =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) ((#real_add:fun(real,fun(real,real)) y:real) x:real))))))
      #|REAL_ADD_ASSOC =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) ((#real_add:fun(real,fun(real,real)) y:real) z:real))) ((#real_add:fun(real,fun(real,real)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) z:real))))))))
      #|REAL_ADD_LID =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) x:real)))
      #|REAL_ADD_LINV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) (#real_neg:fun(real,real) x:real)) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))
      #|REAL_MUL_SYM =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) y:real)) ((#real_mul:fun(real,fun(real,real)) y:real) x:real))))))
      #|REAL_MUL_ASSOC =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) ((#real_mul:fun(real,fun(real,real)) y:real) z:real))) ((#real_mul:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) x:real) y:real)) z:real))))))))
      #|REAL_MUL_LID =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)) x:real)))
      #|REAL_ADD_LDISTRIB =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) ((#real_add:fun(real,fun(real,real)) y:real) z:real))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) x:real) y:real)) ((#real_mul:fun(real,fun(real,real)) x:real) z:real)))))))))
      #|REAL_LE_REFL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#real_le:fun(real,fun(real,bool)) x:real) x:real)))
      #|REAL_LE_ANTISYM =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)) ((#real_le:fun(real,fun(real,bool)) y:real) x:real))) ((#=:fun(real,fun(real,bool)) x:real) y:real))))))
      #|REAL_LE_TRANS =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)) ((#real_le:fun(real,fun(real,bool)) y:real) z:real))) ((#real_le:fun(real,fun(real,bool)) x:real) z:real))))))))
      #|REAL_LE_TOTAL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#\/:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) y:real)) ((#real_le:fun(real,fun(real,bool)) y:real) x:real))))))
      #|REAL_LE_LADD_IMP =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) y:real) z:real)) ((#real_le:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) x:real) y:real)) ((#real_add:fun(real,fun(real,real)) x:real) z:real)))))))))
      #|REAL_LE_MUL =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_mul:fun(real,fun(real,real)) x:real) y:real)))))))
      #|REAL_INV_0 =  |- ((#=:fun(real,fun(real,bool)) (#real_inv:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))
      #|REAL_MUL_LINV =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (#real_inv:fun(real,real) x:real)) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|REAL_OF_NUM_EQ =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) m:num)) (#real_of_num:fun(num,real) n:num))) ((#=:fun(num,fun(num,bool)) m:num) n:num))))))
      #|REAL_OF_NUM_LE =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) m:num)) (#real_of_num:fun(num,real) n:num))) ((#<=:fun(num,fun(num,bool)) m:num) n:num))))))
      #|REAL_OF_NUM_ADD =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) m:num)) (#real_of_num:fun(num,real) n:num))) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) m:num) n:num)))))))
      #|REAL_OF_NUM_MUL =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) m:num)) (#real_of_num:fun(num,real) n:num))) (#real_of_num:fun(num,real) ((#*:fun(num,fun(num,num)) m:num) n:num)))))))
      #|real_sub =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) x:real) y:real)) ((#real_add:fun(real,fun(real,real)) x:real) (#real_neg:fun(real,real) y:real)))))))
      #|real_lt =  |- (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) y:real)) (#~:fun(bool,bool) ((#real_le:fun(real,fun(real,bool)) y:real) x:real)))))))
      #|real_ge =  |- (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_ge:fun(real,fun(real,bool)) x:real) y:real)) ((#real_le:fun(real,fun(real,bool)) y:real) x:real))))))
      #|real_gt =  |- (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_gt:fun(real,fun(real,bool)) x:real) y:real)) ((#real_lt:fun(real,fun(real,bool)) y:real) x:real))))))
      #|real_abs =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (((#COND:fun(bool,fun(real,fun(real,real))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) x:real) (#real_neg:fun(real,real) x:real)))))
      #|real_pow =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) #_0:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) x:real) (#SUC:fun(num,num) n:num))) ((#real_mul:fun(real,fun(real,real)) x:real) ((#real_pow:fun(real,fun(num,real)) x:real) n:num))))))
      #|real_div =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#=:fun(real,fun(real,bool)) ((#real_div:fun(real,fun(real,real)) x:real) y:real)) ((#real_mul:fun(real,fun(real,real)) x:real) (#real_inv:fun(real,real) y:real)))))))
      #|real_max =  |- (#forall:fun(fun(real,bool),bool) (\n:real. (#forall:fun(fun(real,bool),bool) (\m:real. ((#=:fun(real,fun(real,bool)) ((#real_max:fun(real,fun(real,real)) m:real) n:real)) (((#COND:fun(bool,fun(real,fun(real,real))) ((#real_le:fun(real,fun(real,bool)) m:real) n:real)) n:real) m:real))))))
      #|real_min =  |- (#forall:fun(fun(real,bool),bool) (\m:real. (#forall:fun(fun(real,bool),bool) (\n:real. ((#=:fun(real,fun(real,bool)) ((#real_min:fun(real,fun(real,real)) m:real) n:real)) (((#COND:fun(bool,fun(real,fun(real,real))) ((#real_le:fun(real,fun(real,bool)) m:real) n:real)) m:real) n:real))))))
      #|REAL_HREAL_LEMMA1 =  |- (#?:fun(fun(fun(hreal,real),bool),bool) (\r:fun(hreal,real). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) (#?:fun(fun(hreal,bool),bool) (\y:hreal. ((#=:fun(real,fun(real,bool)) x:real) (r:fun(hreal,real) y:hreal)))))))) (#forall:fun(fun(hreal,bool),bool) (\y:hreal. (#forall:fun(fun(hreal,bool),bool) (\z:hreal. ((#=:fun(bool,fun(bool,bool)) ((#hreal_le:fun(hreal,fun(hreal,bool)) y:hreal) z:hreal)) ((#real_le:fun(real,fun(real,bool)) (r:fun(hreal,real) y:hreal)) (r:fun(hreal,real) z:hreal))))))))))
      #|REAL_HREAL_LEMMA2 =  |- (#?:fun(fun(fun(real,hreal),bool),bool) (\h:fun(real,hreal). (#?:fun(fun(fun(hreal,real),bool),bool) (\r:fun(hreal,real). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(hreal,bool),bool) (\x:hreal. ((#=:fun(hreal,fun(hreal,bool)) (h:fun(real,hreal) (r:fun(hreal,real) x:hreal))) x:hreal)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#=:fun(real,fun(real,bool)) (r:fun(hreal,real) (h:fun(real,hreal) x:real))) x:real))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(hreal,bool),bool) (\x:hreal. ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) (r:fun(hreal,real) x:hreal))))) (#forall:fun(fun(hreal,bool),bool) (\x:hreal. (#forall:fun(fun(hreal,bool),bool) (\y:hreal. ((#=:fun(bool,fun(bool,bool)) ((#hreal_le:fun(hreal,fun(hreal,bool)) x:hreal) y:hreal)) ((#real_le:fun(real,fun(real,bool)) (r:fun(hreal,real) x:hreal)) (r:fun(hreal,real) y:hreal))))))))))))))
      #|REAL_COMPLETE_SOMEPOS =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\P:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\x:real. ((#/\:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real))))) (#?:fun(fun(real,bool),bool) (\M:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) M:real)))))))) (#?:fun(fun(real,bool),bool) (\M:real. ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) M:real))))) (#forall:fun(fun(real,bool),bool) (\M':real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) M':real))))) ((#real_le:fun(real,fun(real,bool)) M:real) M':real))))))))))
      #|REAL_COMPLETE =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\P:fun(real,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(real,bool),bool) (\x:real. (P:fun(real,bool) x:real)))) (#?:fun(fun(real,bool),bool) (\M:real. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) M:real)))))))) (#?:fun(fun(real,bool),bool) (\M:real. ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) M:real))))) (#forall:fun(fun(real,bool),bool) (\M':real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) M':real))))) ((#real_le:fun(real,fun(real,bool)) M:real) M':real))))))))))
      #|types = real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 148
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?1
      #|counter_genvar = _24256:bool
      #|
    ),
  )
}
