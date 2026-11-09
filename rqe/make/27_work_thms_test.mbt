// Rqe/work_thms.ml in its directory's load order: the test block of
// rqe/work_thms/work_thms_ref_test.mbt (tools/ocaml_ref/chain_test.py), with the same golden
// (tools/ocaml_ref/Rqe_work_thms_ref.expected).

///|
test "Rqe/work_thms matches Rqe/work_thms.ml" {
  @testkit.release_output()
  @work_thms.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot", "impconv", "pair", "compute", "nums", "recursion",
      "arith", "wf", "calc_num", "normalizer", "grobner", "ind_types", "lists", "realax",
      "calc_int", "realarith", "real", "calc_rat", "int", "sets", "iterate", "cart",
      "define", "Library/analysis", "Library/poly", "Rqe/rqe_lib", "Rqe/rqe_tactics_ext",
      "Rqe/util", "Rqe/rewrites", "Rqe/basic", "Rqe/rqe_num", "Rqe/rqe_real", "Rqe/list_rewrites",
      "Rqe/rqe_list", "Rqe/timers", "Rqe/num_calc_simp", "Rqe/asym", "Rqe/rol", "Rqe/poly_ext",
      "Rqe/simplify", "Rqe/lift_qelim", "Rqe/defs", "Rqe/testform_thms", "Rqe/condense_thms",
      "Rqe/inferisign_thms", "Rqe/matinsert_thms", "Rqe/signs_thms", "Rqe/inferpsign_thms",
      "Rqe/dedmatrix_thms", "Rqe/pdivides_thms", "Rqe/main_thms", "Rqe/work_thms",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Rqe/work_thms")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("INTERPSIGNS_CONJ", () => sthm(@work_thms.interpsigns_conj()))
  log.attempt("INTERPMAT_TRIO", () => sthm(@work_thms.interpmat_trio()))
  log.attempt("PARTITION_LINE_NOT_NIL", () => {
    sthm(@work_thms.partition_line_not_nil())
  })
  log.attempt("ALL2_LENGTH", () => sthm(@work_thms.all2_length()))
  log.attempt("LENGTH_TL", () => sthm(@work_thms.length_tl()))
  log.attempt("PARTITION_LINE_LENGTH", () => {
    sthm(@work_thms.partition_line_length())
  })
  log.attempt("PARTITION_LINE_LENGTH_TL", () => {
    sthm(@work_thms.partition_line_length_tl())
  })
  log.attempt("PL_ALL2_LENGTH", () => sthm(@work_thms.pl_all2_length()))
  log.attempt("INTERPMAT_LENGTH", () => sthm(@work_thms.interpmat_length()))
  log.attempt("ALL2_HD", () => sthm(@work_thms.all2_hd()))
  log.attempt("ALL2_TL", () => sthm(@work_thms.all2_tl()))
  log.attempt("ALL2_APPEND_LENGTH", () => sthm(@work_thms.all2_append_length()))
  log.attempt("ALL2_APPEND", () => sthm(@work_thms.all2_append()))
  log.attempt("ALL2_SPLIT", () => sthm(@work_thms.all2_split()))
  log.attempt("BUTLAST_THM", () => sthm(@work_thms.butlast_thm()))
  log.attempt("HD_BUTLAST", () => sthm(@work_thms.hd_butlast()))
  log.attempt("SUBLIST", () => sthm(@work_thms.sublist()))
  log.attempt("SUBLIST_NIL", () => sthm(@work_thms.sublist_nil()))
  log.attempt("SUBLIST_CONS", () => sthm(@work_thms.sublist_cons()))
  log.attempt("SUBLIST_TL", () => sthm(@work_thms.sublist_tl()))
  log.attempt("SUBLIST_CONS2", () => sthm(@work_thms.sublist_cons2()))
  log.attempt("SUBLIST_ID", () => sthm(@work_thms.sublist_id()))
  log.attempt("SUBLIST_CONS_CONS", () => sthm(@work_thms.sublist_cons_cons()))
  log.attempt("SUBLIST_NEQ", () => sthm(@work_thms.sublist_neq()))
  log.attempt("SUBLIST_TRANS", () => sthm(@work_thms.sublist_trans()))
  log.attempt("ROL_MEM", () => sthm(@work_thms.rol_mem()))
  log.attempt("SUBLIST_MEM", () => sthm(@work_thms.sublist_mem()))
  log.attempt("ROL_SUBLIST_LT", () => sthm(@work_thms.rol_sublist_lt()))
  log.attempt("SUBLIST_DELETE", () => sthm(@work_thms.sublist_delete()))
  log.attempt("SUBLIST_MATCH", () => sthm(@work_thms.sublist_match()))
  log.attempt("ROL_SUBLIST", () => sthm(@work_thms.rol_sublist()))
  log.attempt("SUBLIST_BUTLAST", () => sthm(@work_thms.sublist_butlast()))
  log.attempt("SUBLIST_APPEND_HD", () => sthm(@work_thms.sublist_append_hd()))
  log.attempt("SUBLIST_ID_CONS", () => sthm(@work_thms.sublist_id_cons()))
  log.attempt("SUBLIST_ID_APPEND", () => sthm(@work_thms.sublist_id_append()))
  log.attempt("SUBLIST_APPEND_TL", () => sthm(@work_thms.sublist_append_tl()))
  log.attempt("SUBLIST_TRANS2", () => sthm(@work_thms.sublist_trans2()))
  log.attempt("APPEND_CONS", () => sthm(@work_thms.append_cons()))
  log.attempt("SUBLIST_APPEND", () => sthm(@work_thms.sublist_append()))
  log.attempt("SUBLIST_APPEND2", () => sthm(@work_thms.sublist_append2()))
  log.attempt("ROL_APPEND2", () => sthm(@work_thms.rol_append2()))
  log.attempt("PL_LEM", () => sthm(@work_thms.pl_lem()))
  log.attempt("HD_APPEND2", () => sthm(@work_thms.hd_append2()))
  log.attempt("BUTLAST_TL", () => sthm(@work_thms.butlast_tl()))
  log.attempt("APPEND_TL", () => sthm(@work_thms.append_tl()))
  log.attempt("APPEND_HD", () => sthm(@work_thms.append_hd()))
  log.attempt("PL_LEM2", () => sthm(@work_thms.pl_lem2()))
  log.attempt("BUTLAST_APPEND", () => sthm(@work_thms.butlast_append()))
  log.attempt("LENGTH_TL1", () => sthm(@work_thms.length_tl1()))
  log.attempt("PL_BUTLAST", () => sthm(@work_thms.pl_butlast()))
  log.attempt("PARTITION_LINE_APPEND", () => {
    sthm(@work_thms.partition_line_append())
  })
  log.attempt("HD_TL", () => sthm(@work_thms.hd_tl()))
  log.attempt("HD_LEM", () => sthm(@work_thms.hd_lem()))
  log.attempt("BUTLAST_LENGTH", () => sthm(@work_thms.butlast_length()))
  log.attempt("ALL2_LEM", () => sthm(@work_thms.all2_lem()))
  log.attempt("INTERPMAT_TRIO_TL", () => sthm(@work_thms.interpmat_trio_tl()))
  log.attempt("LAST_APPEND", () => sthm(@work_thms.last_append()))
  log.attempt("APPEND_APPEND", () => sthm(@work_thms.append_append()))
  log.attempt("ALL2_LEM2", () => sthm(@work_thms.all2_lem2()))
  log.attempt("INTERPMAT_TRIO_INNER", () => {
    sthm(@work_thms.interpmat_trio_inner())
  })
  log.attempt("INTERPMAT_SING", () => sthm(@work_thms.interpmat_sing()))
  log.attempt("INFERISIGN_POS_POS_POS", () => {
    sthm(@work_thms.inferisign_pos_pos_pos())
  })
  log.attempt("INFERISIGN_POS_POS_NEG", () => {
    sthm(@work_thms.inferisign_pos_pos_neg())
  })
  log.attempt("INFERISIGN_NEG_NEG_POS", () => {
    sthm(@work_thms.inferisign_neg_neg_pos())
  })
  log.attempt("INFERISIGN_NEG_NEG_NEG", () => {
    sthm(@work_thms.inferisign_neg_neg_neg())
  })
  log.attempt("ALL2_INTERPSIGN_SUBSET", () => {
    sthm(@work_thms.all2_interpsign_subset())
  })
  log.attempt("HD_APPEND1", () => sthm(@work_thms.hd_append1()))
  log.attempt("ROL_APPEND_INSERT", () => sthm(@work_thms.rol_append_insert()))
  log.attempt("INFERISIGN_POS_NEG_POS", () => {
    sthm(@work_thms.inferisign_pos_neg_pos())
  })
  log.attempt("INFERISIGN_POS_NEG_NEG", () => {
    sthm(@work_thms.inferisign_pos_neg_neg())
  })
  log.attempt("INFERISIGN_NEG_POS_NEG", () => {
    sthm(@work_thms.inferisign_neg_pos_neg())
  })
  log.attempt("INFERISIGN_NEG_POS_POS", () => {
    sthm(@work_thms.inferisign_neg_pos_pos())
  })
  log.attempt("INFERISIGN_ZERO_POS_POS", () => {
    sthm(@work_thms.inferisign_zero_pos_pos())
  })
  log.attempt("INFERISIGN_ZERO_POS_NEG", () => {
    sthm(@work_thms.inferisign_zero_pos_neg())
  })
  log.attempt("INFERISIGN_POS_ZERO_POS", () => {
    sthm(@work_thms.inferisign_pos_zero_pos())
  })
  log.attempt("INFERISIGN_POS_ZERO_NEG", () => {
    sthm(@work_thms.inferisign_pos_zero_neg())
  })
  log.attempt("INFERISIGN_ZERO_NEG_POS", () => {
    sthm(@work_thms.inferisign_zero_neg_pos())
  })
  log.attempt("INFERISIGN_ZERO_NEG_NEG", () => {
    sthm(@work_thms.inferisign_zero_neg_neg())
  })
  log.attempt("INFERISIGN_NEG_ZERO_NEG", () => {
    sthm(@work_thms.inferisign_neg_zero_neg())
  })
  log.attempt("INFERISIGN_NEG_ZERO_POS", () => {
    sthm(@work_thms.inferisign_neg_zero_pos())
  })
  log.attempt("INFERISIGN_ZERO_ZERO_POS", () => {
    sthm(@work_thms.inferisign_zero_zero_pos())
  })
  log.attempt("INFERISIGN_ZERO_ZERO_NEG", () => {
    sthm(@work_thms.inferisign_zero_zero_neg())
  })
  log.attempt("BUTLAST_ID", () => sthm(@work_thms.butlast_id()))
  log.attempt("BUTLAST_NIL", () => sthm(@work_thms.butlast_nil()))
  log.attempt("INFIN_HD_POS_LEM", () => sthm(@work_thms.infin_hd_pos_lem()))
  log.attempt("INFIN_TL_POS_LEM", () => sthm(@work_thms.infin_tl_pos_lem()))
  log.attempt("INFIN_HD_NEG_LEM", () => sthm(@work_thms.infin_hd_neg_lem()))
  log.attempt("INFIN_TL_NEG_LEM", () => sthm(@work_thms.infin_tl_neg_lem()))
  log.attempt("INFIN_POS_POS", () => sthm(@work_thms.infin_pos_pos()))
  log.attempt("INFIN_POS_NEG", () => sthm(@work_thms.infin_pos_neg()))
  log.attempt("INFIN_NEG_POS", () => sthm(@work_thms.infin_neg_pos()))
  log.attempt("INFIN_NEG_NEG", () => sthm(@work_thms.infin_neg_neg()))
  log.attempt("INFIN_NIL_POS", () => sthm(@work_thms.infin_nil_pos()))
  log.attempt("INFIN_NIL_NEG", () => sthm(@work_thms.infin_nil_neg()))
  log.attempt("INFIN_SING_POS_POS", () => sthm(@work_thms.infin_sing_pos_pos()))
  log.attempt("INFIN_SING_POS_NEG", () => sthm(@work_thms.infin_sing_pos_neg()))
  log.attempt("INFIN_SING_NEG_POS", () => sthm(@work_thms.infin_sing_neg_pos()))
  log.attempt("INFIN_SING_NEG_NEG", () => sthm(@work_thms.infin_sing_neg_neg()))
  log.attempt("EL_SUC", () => sthm(@work_thms.el_suc()))
  log.attempt("EL_PRE", () => sthm(@work_thms.el_pre()))
  log.attempt("ALL2_EL_LT_LEM", () => sthm(@work_thms.all2_el_lt_lem()))
  log.attempt("ALL2_EL_LT", () => sthm(@work_thms.all2_el_lt()))
  log.attempt("ALL2_EL_LEM", () => sthm(@work_thms.all2_el_lem()))
  log.attempt("ALL2_EL", () => sthm(@work_thms.all2_el()))
  log.attempt("EL_MAP", () => sthm(@work_thms.el_map()))
  log.attempt("REMOVE_HD_COL", () => sthm(@work_thms.remove_hd_col()))
  log.attempt("REMOVE_COL1", () => sthm(@work_thms.remove_col1()))
  log.attempt("ALL_EL", () => sthm(@work_thms.all_el()))
  log.attempt("INTERPMAT_POL_LENGTH_LEM", () => {
    sthm(@work_thms.interpmat_pol_length_lem())
  })
  log.attempt("INTERPMAT_POL_LENGTH", () => {
    sthm(@work_thms.interpmat_pol_length())
  })
  log.attempt("ALL2_BUTLAST", () => sthm(@work_thms.all2_butlast()))
  log.attempt("REMOVE_LAST", () => sthm(@work_thms.remove_last()))
  log.attempt("INSERTAT", () => sthm(@work_thms.insertat()))
  log.attempt("MAP2_EL_LEM", () => sthm(@work_thms.map2_el_lem()))
  log.attempt("MAP2_EL", () => sthm(@work_thms.map2_el()))
  log.attempt("INSERTAT_LENGTH", () => sthm(@work_thms.insertat_length()))
  log.attempt("INSERTAT_TL", () => sthm(@work_thms.insertat_tl()))
  log.attempt("INSERTAT_EL", () => sthm(@work_thms.insertat_el()))
  log.attempt("MATINSERT_THM", () => sthm(@work_thms.matinsert_thm()))
  log.attempt("INTERP_CONST_POS", () => sthm(@work_thms.interp_const_pos()))
  log.attempt("INTERP_CONST_NEG", () => sthm(@work_thms.interp_const_neg()))
  log.attempt("INTERP_CONST_ZERO", () => sthm(@work_thms.interp_const_zero()))
  log.attempt("EL_REPLICATE", () => sthm(@work_thms.el_replicate()))
  log.attempt("ALL2_UNKNOWN", () => sthm(@work_thms.all2_unknown()))
  log.attempt("MATINSERT_THM2", () => sthm(@work_thms.matinsert_thm2()))
  log.attempt("INSERTAT_0", () => sthm(@work_thms.insertat_0()))
  log.attempt("INFERPSIGN_MATINSERT_THM", () => {
    sthm(@work_thms.inferpsign_matinsert_thm())
  })
  log.attempt("INFERPSIGN_POS", () => sthm(@work_thms.inferpsign_pos()))
  log.attempt("INFERPSIGN_NEG", () => sthm(@work_thms.inferpsign_neg()))
  log.attempt("INFERPSIGN_POS_EVEN_LEM", () => {
    sthm(@work_thms.inferpsign_pos_even_lem())
  })
  log.attempt("SPLIT_LIST_THM", () => sthm(@work_thms.split_list_thm()))
  log.attempt("DIV_EVEN", () => sthm(@work_thms.div_even()))
  log.attempt("PRE_LEM", () => sthm(@work_thms.pre_lem()))
  log.attempt("EVEN_PRE", () => sthm(@work_thms.even_pre()))
  log.attempt("ODD_PRE", () => sthm(@work_thms.odd_pre()))
  log.attempt("INFERPSIGN_POS_EVEN", () => {
    sthm(@work_thms.inferpsign_pos_even())
  })
  log.attempt("INFERPSIGN_NEG_EVEN_LEM", () => {
    sthm(@work_thms.inferpsign_neg_even_lem())
  })
  log.attempt("INFERPSIGN_NEG_EVEN", () => {
    sthm(@work_thms.inferpsign_neg_even())
  })
  log.attempt("INFERPSIGN_ZERO_EVEN_LEM", () => {
    sthm(@work_thms.inferpsign_zero_even_lem())
  })
  log.attempt("INFERPSIGN_ZERO_EVEN", () => {
    sthm(@work_thms.inferpsign_zero_even())
  })
  log.attempt("INFERPSIGN_POS_ODD_POS_LEM", () => {
    sthm(@work_thms.inferpsign_pos_odd_pos_lem())
  })
  log.attempt("INFERPSIGN_POS_ODD_POS", () => {
    sthm(@work_thms.inferpsign_pos_odd_pos())
  })
  log.attempt("INFERPSIGN_NEG_ODD_POS_LEM", () => {
    sthm(@work_thms.inferpsign_neg_odd_pos_lem())
  })
  log.attempt("INFERPSIGN_NEG_ODD_POS", () => {
    sthm(@work_thms.inferpsign_neg_odd_pos())
  })
  log.attempt("INFERPSIGN_ZERO_ODD_POS_LEM", () => {
    sthm(@work_thms.inferpsign_zero_odd_pos_lem())
  })
  log.attempt("INFERPSIGN_ZERO_ODD_POS", () => {
    sthm(@work_thms.inferpsign_zero_odd_pos())
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
      #|Rqe/work_thms quotations (1221):
      #|  (h' : Sign)
      #|  \226\136\128 P : (Real) -> Bool, \226\136\128 Q : (Real) -> Bool, \226\136\128 eqs : List[(Real) -> Real], \226\136\128 l : List[Sign], interpsigns(eqs, (x : Real) => P(x), l) && interpsigns(eqs, (x : Real) => Q(x), l) \226\134\146 interpsigns(eqs, (x : Real) => P(x) || Q(x), l)
      #|  (z : Real) => z < (x : Real) || z == x || x < z && z < (y : Real)
      #|  (z : Real) => z < (x : Real) || z == x || x < z && z < (y : Real)
      #|  (t : List[Real])
      #|  \226\136\128 eqs : List[(Real) -> Real], \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 l : List[Sign], \226\136\128 r : List[List[Sign]], \226\136\128 t : List[Real], interpmat(CONS(x, CONS(y, t)), eqs, CONS(l, CONS(l, CONS(l, r)))) \226\134\146 interpmat(CONS(y, t), eqs, CONS(l, r))
      #|  \226\136\128 l : List[Real], !(partition_line(l) == NIL)
      #|  \226\136\128 P : (_, _) -> Bool, \226\136\128 l1 : List[_], \226\136\128 l2 : List[_], ALL2(P, l1, l2) \226\134\146 LENGTH(l1) == LENGTH(l2)
      #|  \226\136\128 l : List[A], !(l == NIL) \226\134\146 LENGTH(TL(l)) == PRE(LENGTH(l))
      #|  \226\136\128 l : List[Real], LENGTH(partition_line(l)) == 2 * LENGTH(l) + 1
      #|  (l : List[Real])
      #|  \226\136\128 l : List[Real], LENGTH(TL(partition_line(l))) == 2 * LENGTH(l)
      #|  LENGTH((sgns : List[_])) == LENGTH(APPEND([(x : Real) => x < (h : Real), (x : Real) => x == h, (x : Real) => h < x && x < HD((t : List[Real]))], TL(partition_line(t))))
      #|  LENGTH([(x : Real) => x < (h : Real), (x : Real) => x == h, (x : Real) => h < x]) == LENGTH((sgns : List[_]))
      #|  MOD(NUMERAL((m : Num)), NUMERAL((n : Num)))
      #|  DIV(NUMERAL((m : Num)), NUMERAL((n : Num)))
      #|  EXP(NUMERAL((m : Num)), NUMERAL((n : Num)))
      #|  NUMERAL((m : Num)) * NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) - NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) + NUMERAL((n : Num))
      #|  ODD(NUMERAL((n : Num)))
      #|  EVEN(NUMERAL((n : Num)))
      #|  NUMERAL((m : Num)) == NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) >= NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) > NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) <= NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) < NUMERAL((n : Num))
      #|  FACT(NUMERAL((n : Num)))
      #|  PRE(NUMERAL((n : Num)))
      #|  SUC(NUMERAL((n : Num)))
      #|  (t : List[List[Sign]])
      #|  (sgns : List[List[Sign]])
      #|  MOD(NUMERAL((m : Num)), NUMERAL((n : Num)))
      #|  DIV(NUMERAL((m : Num)), NUMERAL((n : Num)))
      #|  EXP(NUMERAL((m : Num)), NUMERAL((n : Num)))
      #|  NUMERAL((m : Num)) * NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) - NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) + NUMERAL((n : Num))
      #|  ODD(NUMERAL((n : Num)))
      #|  EVEN(NUMERAL((n : Num)))
      #|  NUMERAL((m : Num)) == NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) >= NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) > NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) <= NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) < NUMERAL((n : Num))
      #|  FACT(NUMERAL((n : Num)))
      #|  PRE(NUMERAL((n : Num)))
      #|  SUC(NUMERAL((n : Num)))
      #|  (pts : List[Real])
      #|  \226\136\128 eqs : List[(Real) -> Real], \226\136\128 pts : List[Real], \226\136\128 sgns : List[List[Sign]], ALL2(interpsigns(eqs), partition_line(pts), sgns) \226\134\146 LENGTH(sgns) == 2 * LENGTH(pts) + 1
      #|  LENGTH((sgns : List[_])) == LENGTH(APPEND([(x : Real) => x < (h : Real), (x : Real) => x == h, (x : Real) => h < x && x < HD((t : List[Real]))], TL(partition_line(t))))
      #|  LENGTH([(x : Real) => x < (h : Real), (x : Real) => x == h, (x : Real) => h < x]) == LENGTH((sgns : List[_]))
      #|  MOD(NUMERAL((m : Num)), NUMERAL((n : Num)))
      #|  DIV(NUMERAL((m : Num)), NUMERAL((n : Num)))
      #|  EXP(NUMERAL((m : Num)), NUMERAL((n : Num)))
      #|  NUMERAL((m : Num)) * NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) - NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) + NUMERAL((n : Num))
      #|  ODD(NUMERAL((n : Num)))
      #|  EVEN(NUMERAL((n : Num)))
      #|  NUMERAL((m : Num)) == NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) >= NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) > NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) <= NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) < NUMERAL((n : Num))
      #|  FACT(NUMERAL((n : Num)))
      #|  PRE(NUMERAL((n : Num)))
      #|  SUC(NUMERAL((n : Num)))
      #|  (t : List[List[Sign]])
      #|  (sgns : List[List[Sign]])
      #|  MOD(NUMERAL((m : Num)), NUMERAL((n : Num)))
      #|  DIV(NUMERAL((m : Num)), NUMERAL((n : Num)))
      #|  EXP(NUMERAL((m : Num)), NUMERAL((n : Num)))
      #|  NUMERAL((m : Num)) * NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) - NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) + NUMERAL((n : Num))
      #|  ODD(NUMERAL((n : Num)))
      #|  EVEN(NUMERAL((n : Num)))
      #|  NUMERAL((m : Num)) == NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) >= NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) > NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) <= NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) < NUMERAL((n : Num))
      #|  FACT(NUMERAL((n : Num)))
      #|  PRE(NUMERAL((n : Num)))
      #|  SUC(NUMERAL((n : Num)))
      #|  (pts : List[Real])
      #|  \226\136\128 eqs : List[(Real) -> Real], \226\136\128 pts : List[Real], \226\136\128 sgns : List[List[Sign]], interpmat(pts, eqs, sgns) \226\134\146 LENGTH(sgns) == 2 * LENGTH(pts) + 1
      #|  ((x : _) == (y : _)) == (y == x)
      #|  \226\136\128 b : List[_], \226\136\128 d : List[_], \226\136\128 a : List[_], \226\136\128 c : List[_], LENGTH(a) == LENGTH(c) \226\134\146 ALL2((P : (_, _) -> Bool), APPEND(a, b), APPEND(c, d)) \226\134\146 ALL2(P, a, c)
      #|  ((x : _) == (y : _)) == (y == x)
      #|  \226\136\128 b : List[_], \226\136\128 d : List[_], \226\136\128 a : List[_], \226\136\128 c : List[_], LENGTH(a) == LENGTH(c) \226\134\146 ALL2((P : (_, _) -> Bool), APPEND(a, b), APPEND(c, d)) \226\134\146 ALL2(P, b, d)
      #|  \226\136\128 P : (_, _) -> Bool, \226\136\128 a : List[_], \226\136\128 c : List[_], \226\136\128 b : List[_], \226\136\128 d : List[_], LENGTH(a) == LENGTH(c) \226\134\146 ALL2(P, APPEND(a, b), APPEND(c, d)) \226\134\146 ALL2(P, a, c) && ALL2(P, b, d)
      #|  !(0 == SUC((x : Num)))
      #|  \226\136\128 a : List[_], \226\136\128 c : List[_], \226\136\128 b : List[_], \226\136\128 d : List[_], ALL2((P : (_, _) -> Bool), a, c) && ALL2(P, b, d) \226\134\146 ALL2(P, APPEND(a, b), APPEND(c, d))
      #|  \226\136\128 a : List[_], \226\136\128 c : List[_], \226\136\128 b : List[_], \226\136\128 d : List[_], LENGTH(a) == LENGTH(c) \226\134\146 ALL2((P : (_, _) -> Bool), APPEND(a, b), APPEND(c, d)) == (ALL2(P, a, c) && ALL2(P, b, d))
      #|  (BUTLAST : (List[_]) -> List[_])((NIL : List[_])) == (NIL : List[_]) && BUTLAST([(x : _)]) == NIL && BUTLAST(CONS((h1 : _), CONS((h2 : _), (t : List[_])))) == CONS(h1, BUTLAST(CONS(h2, t)))
      #|  \226\136\128 l : List[_], !(l == NIL) \226\134\146 (\226\136\128 x : _, !(l == [x])) \226\134\146 HD(BUTLAST(l)) == HD(l)
      #|  (SUBLIST : (List[_], List[_]) -> Bool)((l : List[_]), NIL) == (l == NIL) && SUBLIST(l, CONS((h : _), (t : List[_]))) == (l == NIL || SUBLIST(l, t) || HD(l) == h && SUBLIST(TL(l), t))
      #|  \226\136\128 l : List[_], SUBLIST(NIL, l)
      #|  \226\136\128 l1 : List[_], \226\136\128 l2 : List[_], \226\136\128 h : _, SUBLIST(l1, l2) \226\134\146 SUBLIST(l1, CONS(h, l2))
      #|  \226\136\128 l1 : List[_], \226\136\128 l2 : List[_], SUBLIST(l1, l2) \226\134\146 !(l1 == NIL) \226\134\146 SUBLIST(TL(l1), l2)
      #|  \226\136\128 h : _, \226\136\128 t : List[_], \226\136\128 l : List[_], SUBLIST(CONS(h, t), l) \226\134\146 SUBLIST(t, l)
      #|  \226\136\128 l : List[_], SUBLIST(l, l)
      #|  \226\136\128 h : _, \226\136\128 t1 : List[_], \226\136\128 t2 : List[_], SUBLIST(CONS(h, t1), CONS(h, t2)) == SUBLIST(t1, t2)
      #|  \226\136\128 h1 : _, \226\136\128 h2 : _, \226\136\128 t1 : List[_], \226\136\128 t2 : List[_], SUBLIST(CONS(h1, t1), CONS(h2, t2)) \226\134\146 !(h1 == h2) \226\134\146 SUBLIST(CONS(h1, t1), t2)
      #|  SUBLIST((t' : List[_]), (t'' : List[_]))
      #|  SUBLIST(CONS((h' : _), (t' : List[_])), (t'' : List[_]))
      #|  SUBLIST(CONS((h : _), (t : List[_])), (t' : List[_]))
      #|  (h : _) == (h' : _)
      #|  SUBLIST(CONS((h : _), (t : List[_])), (t' : List[_]))
      #|  (h' : _) == (h'' : _)
      #|  (h' : _) == (h'' : _)
      #|  (h : _) == (h'' : _)
      #|  \226\136\128 l1 : List[_], \226\136\128 l2 : List[_], \226\136\128 l3 : List[_], SUBLIST(l1, l2) \226\134\146 SUBLIST(l2, l3) \226\134\146 SUBLIST(l1, l3)
      #|  real_ordered_list(CONS((h : Real), (t : List[Real])))
      #|  (x : _) == (h' : _)
      #|  \226\136\128 h : Real, \226\136\128 t : List[Real], real_ordered_list(CONS(h, t)) \226\134\146 (\226\136\128 x : Real, MEM(x, t) \226\134\146 h < x)
      #|  (x : _) == (h' : _)
      #|  (x : _) == (h' : _)
      #|  (h : _) == (h' : _)
      #|  \226\136\128 x : _, \226\136\128 l1 : List[_], \226\136\128 l2 : List[_], SUBLIST(l1, l2) \226\134\146 MEM(x, l1) \226\134\146 MEM(x, l2)
      #|  MEM((x : _), CONS((h'' : _), (t' : List[_])))
      #|  \226\136\128 h : Real, \226\136\128 t1 : List[Real], \226\136\128 t2 : List[Real], real_ordered_list(CONS(h, t2)) \226\134\146 SUBLIST(CONS(h, t1), CONS(h, t2)) \226\134\146 (\226\136\128 x : Real, MEM(x, t1) \226\134\146 h < x)
      #|  SUBLIST(CONS((h1 : _), CONS((h2 : _), CONS((h : _), (t : List[_])))), (t' : List[_]))
      #|  (h1 : _) == (h' : _)
      #|  SUBLIST([(h1 : _), (h2 : _)], (t : List[_]))
      #|  (h1 : _) == (h : _)
      #|  \226\136\128 h1 : _, \226\136\128 h2 : _, \226\136\128 t : List[_], \226\136\128 l : List[_], SUBLIST(CONS(h1, CONS(h2, t)), l) \226\134\146 SUBLIST(CONS(h1, t), l)
      #|  (l2 : _)
      #|  CONS((h'' : _), (l1 : List[_]))
      #|  SUBLIST(CONS((h : _), CONS((h' : _), (t : List[_]))), (t' : List[_]))
      #|  (t' : _)
      #|  (NIL : List[A])
      #|  (h : _) == (h'' : _)
      #|  (l2 : _)
      #|  CONS((h' : _), (l1 : List[_]))
      #|  SUBLIST([(h : _)], (t : List[_]))
      #|  (NIL : List[_])
      #|  (h : _) == (h' : _)
      #|  \226\136\128 h : A, \226\136\128 t : List[A], \226\136\128 l : List[A], SUBLIST(CONS(h, t), l) \226\134\146 (\226\136\131 l1 : List[A], \226\136\131 l2 : List[A], l == APPEND(l1, CONS(h, l2)) && SUBLIST(t, l2))
      #|  MEM((h' : _), (l2' : List[_]))
      #|  real_ordered_list(CONS((h : Real), (l2' : List[Real])))
      #|  (h : _) == (h'' : _)
      #|  (l2 : List[Real])
      #|  (t : List[_]) == NIL
      #|  \226\136\128 l1 : List[Real], \226\136\128 l2 : List[Real], real_ordered_list(l2) \226\134\146 SUBLIST(l1, l2) \226\134\146 real_ordered_list(l1)
      #|  \226\136\128 l : List[_], SUBLIST(BUTLAST(l), l)
      #|  \226\136\128 l2 : List[_], \226\136\128 l3 : List[_], \226\136\128 l1 : List[_], SUBLIST(APPEND(l1, l2), APPEND(l1, l3)) == SUBLIST(l2, l3)
      #|  \226\136\128 h : _, \226\136\128 l : List[_], !SUBLIST(CONS(h, l), l)
      #|  (t : List[_]) == NIL
      #|  \226\136\128 m : List[_], \226\136\128 l : List[_], !(l == NIL) \226\134\146 !SUBLIST(APPEND(l, m), m)
      #|  SUBLIST(CONS((h : _), APPEND((t : List[_]), (l3 : List[_]))), APPEND((t' : List[_]), l3))
      #|  (h : _) == (h' : _)
      #|  \226\136\128 l3 : List[_], \226\136\128 l1 : List[_], \226\136\128 l2 : List[_], SUBLIST(APPEND(l1, l3), APPEND(l2, l3)) == SUBLIST(l1, l2)
      #|  \226\136\128 h : _, \226\136\128 l1 : List[_], \226\136\128 l2 : List[_], APPEND(l1, CONS(h, l2)) == APPEND(APPEND(l1, [h]), l2)
      #|  SUBLIST(CONS((h : _), (t : List[_])), (t' : List[_]))
      #|  (h : _) == (h' : _)
      #|  \226\136\128 l1 : List[_], \226\136\128 l2 : List[_], \226\136\128 m1 : List[_], \226\136\128 m2 : List[_], SUBLIST(l1, l2) \226\134\146 SUBLIST(m1, m2) \226\134\146 SUBLIST(APPEND(l1, m1), APPEND(l2, m2))
      #|  APPEND((l1 : List[_]), (l2 : List[_]))
      #|  \226\136\128 l2 : List[Real], \226\136\128 l1 : List[Real], real_ordered_list(APPEND(l1, l2)) \226\134\146 real_ordered_list(APPEND(l1, BUTLAST(l2)))
      #|  \226\136\128 l : List[Real], !(l == NIL) \226\134\146 !(TL(partition_line(l)) == NIL)
      #|  \226\136\128 l : List[_], \226\136\128 m : List[_], !(l == NIL) \226\134\146 HD(APPEND(l, m)) == HD(l)
      #|  \226\136\128 l : List[_], LENGTH(l) > 1 \226\134\146 BUTLAST(TL(l)) == TL(BUTLAST(l))
      #|  \226\136\128 m : List[_], \226\136\128 l : List[_], !(l == NIL) \226\134\146 APPEND(TL(l), m) == TL(APPEND(l, m))
      #|  \226\136\128 m : List[_], \226\136\128 l : List[_], !(l == NIL) \226\134\146 HD(APPEND(l, m)) == HD(l)
      #|  \226\136\128 l : List[Real], !(l == NIL) \226\134\146 LENGTH(partition_line(l)) > 1
      #|  \226\136\128 l : List[_], \226\136\128 m : List[_], !(m == NIL) \226\134\146 BUTLAST(APPEND(l, m)) == APPEND(l, BUTLAST(m))
      #|  \226\136\128 l : List[_], LENGTH(l) > 1 \226\134\146 !(TL(l) == NIL)
      #|  \226\136\128 l : List[Real], !(l == NIL) \226\134\146 !(BUTLAST(partition_line(l)) == NIL)
      #|  (t' : List[Real])
      #|  (t' : List[Real])
      #|  (t' : List[_]) == NIL
      #|  \226\136\128 h : Real, \226\136\128 t : List[Real], \226\136\128 l : List[Real], !(l == NIL) \226\134\146 partition_line(APPEND(l, CONS(h, t))) == APPEND(BUTLAST(partition_line(l)), CONS((x : Real) => LAST(l) < x && x < h, TL(partition_line(CONS(h, t)))))
      #|  \226\136\128 l : List[_], !(l == NIL) \226\134\146 l == CONS(HD(l), TL(l))
      #|  \226\136\128 l1 : List[_], \226\136\128 l2 : List[_], (TL(l1) == l2) == (CONS(HD(l1), TL(l1)) == CONS(HD(l1), l2))
      #|  !((n : Num) == 0) \226\134\146 SUC(PRE(n)) == PRE(SUC(n))
      #|  \226\136\128 l : List[_], !(l == NIL) \226\134\146 LENGTH(BUTLAST(l)) == PRE(LENGTH(l))
      #|  (z : Real) => (x : Real) < z && z < (y : Real) || z == y || y < z
      #|  !(LENGTH((t : List[_])) == 0)
      #|  ALL2(interpsigns((eqs : List[(Real) -> Real])), BUTLAST(CONS((x : Real) => x < (h : Real), CONS((x : Real) => x == h, CONS((x : Real) => h < x && x < HD((t : List[Real])), TL(partition_line(t)))))), (sgns : List[List[Sign]])) && ALL2(interpsigns(eqs), [(x' : Real) => LAST(t) < x' && x' < (x : Real), (x' : Real) => x' == x, (x' : Real) => x < x' && x' < (y : Real), (x : Real) => x == y, (x : Real) => y < x], [(a : List[Sign]), (b : List[Sign]), (s : List[Sign]), s, s])
      #|  SUC(LENGTH(partition_line((t : List[Real])))) == LENGTH((sgns : List[_]))
      #|  !(PRE(LENGTH(partition_line((t : List[Real])))) == 0)
      #|  !(LENGTH(partition_line((t : List[Real]))) == 0)
      #|  (t : List[Real])
      #|  !(partition_line((t : List[Real])) == NIL)
      #|  MOD(NUMERAL((m : Num)), NUMERAL((n : Num)))
      #|  DIV(NUMERAL((m : Num)), NUMERAL((n : Num)))
      #|  EXP(NUMERAL((m : Num)), NUMERAL((n : Num)))
      #|  NUMERAL((m : Num)) * NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) - NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) + NUMERAL((n : Num))
      #|  ODD(NUMERAL((n : Num)))
      #|  EVEN(NUMERAL((n : Num)))
      #|  NUMERAL((m : Num)) == NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) >= NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) > NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) <= NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) < NUMERAL((n : Num))
      #|  FACT(NUMERAL((n : Num)))
      #|  PRE(NUMERAL((n : Num)))
      #|  SUC(NUMERAL((n : Num)))
      #|  (z : Real) => (x : Real) < z && z < (y : Real) || z == y || y < z
      #|  LENGTH((sgns : List[_])) == 2
      #|  MOD(NUMERAL((m : Num)), NUMERAL((n : Num)))
      #|  DIV(NUMERAL((m : Num)), NUMERAL((n : Num)))
      #|  EXP(NUMERAL((m : Num)), NUMERAL((n : Num)))
      #|  NUMERAL((m : Num)) * NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) - NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) + NUMERAL((n : Num))
      #|  ODD(NUMERAL((n : Num)))
      #|  EVEN(NUMERAL((n : Num)))
      #|  NUMERAL((m : Num)) == NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) >= NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) > NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) <= NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) < NUMERAL((n : Num))
      #|  FACT(NUMERAL((n : Num)))
      #|  PRE(NUMERAL((n : Num)))
      #|  SUC(NUMERAL((n : Num)))
      #|  !(partition_line([(x : Real), (y : Real)]) == NIL)
      #|  LENGTH(APPEND(BUTLAST(partition_line(CONS((h : Real), (t : List[Real])))), CONS((x' : Real) => LAST(CONS(h, t)) < x' && x' < (x : Real), TL(partition_line([x, (y : Real)]))))) == LENGTH(APPEND((sgns : List[List[Sign]]), [(a : List[Sign]), (b : List[Sign]), (s : List[Sign]), s, s]))
      #|  (z : Real) => (x : Real) < z && z < (y : Real) || z == y || y < z
      #|  LENGTH([(x' : Real) => x' < (x : Real), (x' : Real) => x' == x, (x' : Real) => x < x' && x' < (y : Real), (x : Real) => x == y, (x : Real) => y < x]) == LENGTH(APPEND((sgns : List[_]), [(a : _), (b : _), (s : _), s, s]))
      #|  (sgns : List[_]) == NIL
      #|  (pts : List[Real])
      #|  \226\136\128 a : List[Sign], \226\136\128 b : List[Sign], \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 s : List[Sign], \226\136\128 eqs : List[(Real) -> Real], \226\136\128 pts : List[Real], \226\136\128 sgns : List[List[Sign]], ALL2(interpsigns(eqs), partition_line(APPEND(pts, [x, y])), APPEND(sgns, [a, b, s, s, s])) \226\134\146 ALL2(interpsigns(eqs), partition_line(APPEND(pts, [x])), APPEND(sgns, [a, b, s]))
      #|  APPEND((pts : List[_]), [(x : _), (y : _)])
      #|  \226\136\128 a : List[Sign], \226\136\128 b : List[Sign], \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 s : List[Sign], \226\136\128 eqs : List[(Real) -> Real], \226\136\128 pts : List[Real], \226\136\128 sgns : List[List[Sign]], interpmat(APPEND(pts, [x, y]), eqs, APPEND(sgns, [a, b, s, s, s])) \226\134\146 interpmat(APPEND(pts, [x]), eqs, APPEND(sgns, [a, b, s]))
      #|  \226\136\128 l1 : List[_], \226\136\128 l2 : List[_], !(l2 == NIL) \226\134\146 LAST(APPEND(l1, l2)) == LAST(l2)
      #|  \226\136\128 l1 : List[_], \226\136\128 l2 : List[_], \226\136\128 l3 : List[_], APPEND(APPEND(l1, l2), l3) == APPEND(l1, APPEND(l2, l3))
      #|  (z : Real) => (x : Real) < z && z < (y : Real) || z == y || y < z && z < HD((qts : List[Real]))
      #|  (z : Real) => (x : Real) < z && z < (y : Real) || z == y || y < z
      #|  (pts : List[Real])
      #|  LENGTH(BUTLAST(partition_line((pts : List[Real])))) == LENGTH((sgns : List[_]))
      #|  (z : Real) => (x : Real) < z && z < (y : Real) || z == y || y < z && z < HD((qts : List[Real]))
      #|  (z : Real) => (x : Real) < z && z < (y : Real) || z == y || y < z
      #|  2 * 0 == 0
      #|  (sgns : List[_]) == NIL
      #|  (pts : List[_]) == NIL
      #|  LENGTH((rgns : List[_])) == 2 * LENGTH((qts : List[_]))
      #|  LENGTH(partition_line(APPEND((pts : List[Real]), CONS((x : Real), CONS((y : Real), (qts : List[Real])))))) == LENGTH(APPEND((sgns : List[List[Sign]]), CONS((a : List[Sign]), CONS((b : List[Sign]), CONS((s : List[Sign]), CONS(s, CONS(s, (rgns : List[List[Sign]]))))))))
      #|  \226\136\128 a : List[Sign], \226\136\128 b : List[Sign], \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 s : List[Sign], \226\136\128 eqs : List[(Real) -> Real], \226\136\128 pts : List[Real], \226\136\128 sgns : List[List[Sign]], \226\136\128 qts : List[Real], \226\136\128 rgns : List[List[Sign]], ALL2(interpsigns(eqs), partition_line(APPEND(pts, CONS(x, CONS(y, qts)))), APPEND(sgns, CONS(a, CONS(b, CONS(s, CONS(s, CONS(s, rgns))))))) \226\134\146 LENGTH(sgns) == 2 * LENGTH(pts) \226\134\146 ALL2(interpsigns(eqs), partition_line(APPEND(pts, CONS(x, qts))), APPEND(sgns, CONS(a, CONS(b, CONS(s, rgns)))))
      #|  APPEND((pts : List[_]), CONS((x : _), CONS((y : _), (qts : List[_]))))
      #|  \226\136\128 a : List[Sign], \226\136\128 b : List[Sign], \226\136\128 x : Real, \226\136\128 y : Real, \226\136\128 s : List[Sign], \226\136\128 eqs : List[(Real) -> Real], \226\136\128 qts : List[Real], \226\136\128 rgns : List[List[Sign]], \226\136\128 pts : List[Real], \226\136\128 sgns : List[List[Sign]], interpmat(APPEND(pts, CONS(x, CONS(y, qts))), eqs, APPEND(sgns, CONS(a, CONS(b, CONS(s, CONS(s, CONS(s, rgns))))))) \226\134\146 LENGTH(sgns) == 2 * LENGTH(pts) \226\134\146 interpmat(APPEND(pts, CONS(x, qts)), eqs, APPEND(sgns, CONS(a, CONS(b, CONS(s, rgns)))))
      #|  (z : Real) => (x : Real) < z || z == x || z < x
      #|  \226\136\128 x : Real, \226\136\128 l : List[Sign], interpmat([x], (eqs : List[(Real) -> Real]), [l, l, l]) \226\134\146 interpmat(NIL, eqs, [l])
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  real_ordered_list(CONS((y : Real), CONS((z : Real), (qts : List[Real]))))
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  \226\136\128 j : List[(Real) -> Bool], APPEND(BUTLAST(partition_line((pts : List[Real]))), CONS((x : Real) => LAST(pts) < x && x < (y : Real), j)) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), j)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  real_ordered_list([(y : Real), (z : Real)])
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real), (x : Real) => x == y, (x : Real) => y < x && x < (z : Real), (x : Real) => x == z, (x : Real) => z < x]) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), [(x : Real) => x == y, (x : Real) => y < x && x < z, (x : Real) => x == z, (x : Real) => z < x])
      #|  (x : Real) > (y : Real) \226\134\146 !(x == y)
      #|  (x : Real) > (y : Real) \226\134\146 !(x == y)
      #|  LENGTH((sgns : List[_])) == 1
      #|  (pts : List[_]) == NIL
      #|  LENGTH(partition_line(APPEND((pts : List[Real]), CONS((y : Real), CONS((z : Real), (qts : List[Real])))))) == LENGTH(APPEND((sgns : List[List[Sign]]), CONS(CONS(Pos, (r1 : List[Sign])), CONS(CONS(Unknown, CONS(Pos, (r2 : List[Sign]))), CONS(CONS(Pos, (r3 : List[Sign])), (rgns : List[List[Sign]]))))))
      #|  !((sgns : List[_]) == NIL)
      #|  \226\136\128 y : Real, \226\136\128 z : Real, \226\136\128 p : List[Real], \226\136\128 pts : List[Real], \226\136\128 qts : List[Real], \226\136\128 eqs : List[(Real) -> Real], \226\136\128 sgns : List[List[Sign]], \226\136\128 rgns : List[List[Sign]], \226\136\128 r1 : List[Sign], \226\136\128 r2 : List[Sign], \226\136\128 r3 : List[Sign], interpmat(APPEND(pts, CONS(y, CONS(z, qts))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Pos, r1), CONS(CONS(Unknown, CONS(Pos, r2)), CONS(CONS(Pos, r3), rgns))))) \226\134\146 LENGTH(sgns) == 2 * LENGTH(pts) + 1 \226\134\146 interpmat(APPEND(pts, CONS(y, CONS(z, qts))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Pos, r1), CONS(CONS(Pos, CONS(Pos, r2)), CONS(CONS(Pos, r3), rgns)))))
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  real_ordered_list(CONS((y : Real), CONS((z : Real), (qts : List[Real]))))
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  \226\136\128 j : List[(Real) -> Bool], APPEND(BUTLAST(partition_line((pts : List[Real]))), CONS((x : Real) => LAST(pts) < x && x < (y : Real), j)) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), j)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  real_ordered_list([(y : Real), (z : Real)])
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real), (x : Real) => x == y, (x : Real) => y < x && x < (z : Real), (x : Real) => x == z, (x : Real) => z < x]) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), [(x : Real) => x == y, (x : Real) => y < x && x < z, (x : Real) => x == z, (x : Real) => z < x])
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  LENGTH((sgns : List[_])) == 1
      #|  (pts : List[_]) == NIL
      #|  LENGTH(partition_line(APPEND((pts : List[Real]), CONS((y : Real), CONS((z : Real), (qts : List[Real])))))) == LENGTH(APPEND((sgns : List[List[Sign]]), CONS(CONS(Pos, (r1 : List[Sign])), CONS(CONS(Unknown, CONS(Neg, (r2 : List[Sign]))), CONS(CONS(Pos, (r3 : List[Sign])), (rgns : List[List[Sign]]))))))
      #|  !((sgns : List[_]) == NIL)
      #|  \226\136\128 y : Real, \226\136\128 z : Real, \226\136\128 p : List[Real], \226\136\128 pts : List[Real], \226\136\128 qts : List[Real], \226\136\128 eqs : List[(Real) -> Real], \226\136\128 sgns : List[List[Sign]], \226\136\128 rgns : List[List[Sign]], \226\136\128 r1 : List[Sign], \226\136\128 r2 : List[Sign], \226\136\128 r3 : List[Sign], interpmat(APPEND(pts, CONS(y, CONS(z, qts))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Pos, r1), CONS(CONS(Unknown, CONS(Neg, r2)), CONS(CONS(Pos, r3), rgns))))) \226\134\146 LENGTH(sgns) == 2 * LENGTH(pts) + 1 \226\134\146 interpmat(APPEND(pts, CONS(y, CONS(z, qts))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Pos, r1), CONS(CONS(Pos, CONS(Neg, r2)), CONS(CONS(Pos, r3), rgns)))))
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  real_ordered_list(CONS((y : Real), CONS((z : Real), (qts : List[Real]))))
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  \226\136\128 j : List[(Real) -> Bool], APPEND(BUTLAST(partition_line((pts : List[Real]))), CONS((x : Real) => LAST(pts) < x && x < (y : Real), j)) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), j)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  real_ordered_list([(y : Real), (z : Real)])
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real), (x : Real) => x == y, (x : Real) => y < x && x < (z : Real), (x : Real) => x == z, (x : Real) => z < x]) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), [(x : Real) => x == y, (x : Real) => y < x && x < z, (x : Real) => x == z, (x : Real) => z < x])
      #|  (x : Real) > (y : Real) \226\134\146 !(x == y)
      #|  (x : Real) > (y : Real) \226\134\146 !(x == y)
      #|  LENGTH((sgns : List[_])) == 1
      #|  (pts : List[_]) == NIL
      #|  LENGTH(partition_line(APPEND((pts : List[Real]), CONS((y : Real), CONS((z : Real), (qts : List[Real])))))) == LENGTH(APPEND((sgns : List[List[Sign]]), CONS(CONS(Neg, (r1 : List[Sign])), CONS(CONS(Unknown, CONS(Pos, (r2 : List[Sign]))), CONS(CONS(Neg, (r3 : List[Sign])), (rgns : List[List[Sign]]))))))
      #|  !((sgns : List[_]) == NIL)
      #|  \226\136\128 y : Real, \226\136\128 z : Real, \226\136\128 p : List[Real], \226\136\128 pts : List[Real], \226\136\128 qts : List[Real], \226\136\128 eqs : List[(Real) -> Real], \226\136\128 sgns : List[List[Sign]], \226\136\128 rgns : List[List[Sign]], \226\136\128 r1 : List[Sign], \226\136\128 r2 : List[Sign], \226\136\128 r3 : List[Sign], interpmat(APPEND(pts, CONS(y, CONS(z, qts))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Neg, r1), CONS(CONS(Unknown, CONS(Pos, r2)), CONS(CONS(Neg, r3), rgns))))) \226\134\146 LENGTH(sgns) == 2 * LENGTH(pts) + 1 \226\134\146 interpmat(APPEND(pts, CONS(y, CONS(z, qts))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Neg, r1), CONS(CONS(Neg, CONS(Pos, r2)), CONS(CONS(Neg, r3), rgns)))))
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  real_ordered_list(CONS((y : Real), CONS((z : Real), (qts : List[Real]))))
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  \226\136\128 j : List[(Real) -> Bool], APPEND(BUTLAST(partition_line((pts : List[Real]))), CONS((x : Real) => LAST(pts) < x && x < (y : Real), j)) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), j)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  real_ordered_list([(y : Real), (z : Real)])
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real), (x : Real) => x == y, (x : Real) => y < x && x < (z : Real), (x : Real) => x == z, (x : Real) => z < x]) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), [(x : Real) => x == y, (x : Real) => y < x && x < z, (x : Real) => x == z, (x : Real) => z < x])
      #|  (x : Real) > (y : Real) \226\134\146 !(x == y)
      #|  (x : Real) > (y : Real) \226\134\146 !(x == y)
      #|  LENGTH((sgns : List[_])) == 1
      #|  (pts : List[_]) == NIL
      #|  LENGTH(partition_line(APPEND((pts : List[Real]), CONS((y : Real), CONS((z : Real), (qts : List[Real])))))) == LENGTH(APPEND((sgns : List[List[Sign]]), CONS(CONS(Neg, (r1 : List[Sign])), CONS(CONS(Unknown, CONS(Neg, (r2 : List[Sign]))), CONS(CONS(Neg, (r3 : List[Sign])), (rgns : List[List[Sign]]))))))
      #|  !((sgns : List[_]) == NIL)
      #|  \226\136\128 y : Real, \226\136\128 z : Real, \226\136\128 p : List[Real], \226\136\128 pts : List[Real], \226\136\128 qts : List[Real], \226\136\128 eqs : List[(Real) -> Real], \226\136\128 sgns : List[List[Sign]], \226\136\128 rgns : List[List[Sign]], \226\136\128 r1 : List[Sign], \226\136\128 r2 : List[Sign], \226\136\128 r3 : List[Sign], interpmat(APPEND(pts, CONS(y, CONS(z, qts))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Neg, r1), CONS(CONS(Unknown, CONS(Neg, r2)), CONS(CONS(Neg, r3), rgns))))) \226\134\146 LENGTH(sgns) == 2 * LENGTH(pts) + 1 \226\134\146 interpmat(APPEND(pts, CONS(y, CONS(z, qts))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Neg, r1), CONS(CONS(Neg, CONS(Neg, r2)), CONS(CONS(Neg, r3), rgns)))))
      #|  \226\136\128 P : (Real) -> Bool, \226\136\128 Q : (Real) -> Bool, \226\136\128 l1 : List[(Real) -> Real], \226\136\128 l2 : List[Sign], ALL2(interpsign(P), l1, l2) \226\134\146 SUBSET(Q, P) \226\134\146 ALL2(interpsign(Q), l1, l2)
      #|  \226\136\128 h : _, \226\136\128 i : _, \226\136\128 l1 : List[_], \226\136\128 l2 : List[_], HD(APPEND(l1, CONS(h, l2))) == HD(APPEND(l1, CONS(h, CONS(i, l2))))
      #|  \226\136\128 h : Real, \226\136\128 j : Real, \226\136\128 l1 : List[Real], \226\136\128 l2 : List[Real], real_ordered_list(APPEND(l1, CONS(h, CONS((i : Real), l2)))) \226\134\146 h < j \226\134\146 j < i \226\134\146 real_ordered_list(APPEND(l1, CONS(h, CONS(j, CONS(i, l2)))))
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  (X : _)
      #|  (y : Real) < (x : Real) \226\134\146 !(x == y)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  (p : List[Real])
      #|  (z : Real)
      #|  (y : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  (X : _)
      #|  (y : Real) < (x : Real) \226\134\146 !(x == y)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  (p : List[Real])
      #|  (z : Real)
      #|  (y : Real)
      #|  real_ordered_list(CONS((y : Real), CONS((z : Real), (qts : List[Real]))))
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  \226\136\128 rts : List[(Real) -> Bool], APPEND(BUTLAST(partition_line((pts : List[Real]))), CONS((x : Real) => LAST(pts) < x && x < (y : Real), rts)) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), rts)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (X : _)
      #|  (y : Real) < (x : Real) \226\134\146 !(x == y)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  (p : List[Real])
      #|  (z : Real)
      #|  (y : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (X : _)
      #|  (y : Real) < (x : Real) \226\134\146 !(x == y)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  (p : List[Real])
      #|  (z : Real)
      #|  (y : Real)
      #|  LENGTH((sgns : List[_])) == 1
      #|  (pts : List[_]) == NIL
      #|  LENGTH(partition_line(APPEND((pts : List[Real]), CONS((y : Real), CONS((z : Real), (qts : List[Real])))))) == LENGTH(APPEND((sgns : List[List[Sign]]), CONS(CONS(Pos, (r1 : List[Sign])), CONS(CONS(Unknown, CONS(Pos, (r2 : List[Sign]))), CONS(CONS(Neg, (r3 : List[Sign])), (rgns : List[List[Sign]]))))))
      #|  !((sgns : List[_]) == NIL)
      #|  \226\136\128 y : Real, \226\136\128 z : Real, \226\136\128 p : List[Real], \226\136\128 pts : List[Real], \226\136\128 qts : List[Real], \226\136\128 eqs : List[(Real) -> Real], \226\136\128 sgns : List[List[Sign]], \226\136\128 rgns : List[List[Sign]], \226\136\128 r1 : List[Sign], \226\136\128 r2 : List[Sign], \226\136\128 r3 : List[Sign], interpmat(APPEND(pts, CONS(y, CONS(z, qts))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Pos, r1), CONS(CONS(Unknown, CONS(Pos, r2)), CONS(CONS(Neg, r3), rgns))))) \226\134\146 LENGTH(sgns) == 2 * LENGTH(pts) + 1 \226\134\146 (\226\136\131 w : Real, interpmat(APPEND(pts, CONS(y, CONS(w, CONS(z, qts)))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Pos, r1), CONS(CONS(Pos, CONS(Pos, r2)), CONS(CONS(Zero, CONS(Pos, r2)), CONS(CONS(Neg, CONS(Pos, r2)), CONS(CONS(Neg, r3), rgns))))))))
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  (X : _)
      #|  (y : Real) < (x : Real) \226\134\146 !(x == y)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  (p : List[Real])
      #|  (z : Real)
      #|  (y : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  (X : _)
      #|  (y : Real) < (x : Real) \226\134\146 !(x == y)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  (p : List[Real])
      #|  (z : Real)
      #|  (y : Real)
      #|  real_ordered_list(CONS((y : Real), CONS((z : Real), (qts : List[Real]))))
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  \226\136\128 rts : List[(Real) -> Bool], APPEND(BUTLAST(partition_line((pts : List[Real]))), CONS((x : Real) => LAST(pts) < x && x < (y : Real), rts)) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), rts)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (X : _)
      #|  (y : Real) < (x : Real) \226\134\146 !(x == y)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  (p : List[Real])
      #|  (z : Real)
      #|  (y : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (X : _)
      #|  (y : Real) < (x : Real) \226\134\146 !(x == y)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  (p : List[Real])
      #|  (z : Real)
      #|  (y : Real)
      #|  LENGTH((sgns : List[_])) == 1
      #|  (pts : List[_]) == NIL
      #|  LENGTH(partition_line(APPEND((pts : List[Real]), CONS((y : Real), CONS((z : Real), (qts : List[Real])))))) == LENGTH(APPEND((sgns : List[List[Sign]]), CONS(CONS(Pos, (r1 : List[Sign])), CONS(CONS(Unknown, CONS(Neg, (r2 : List[Sign]))), CONS(CONS(Neg, (r3 : List[Sign])), (rgns : List[List[Sign]]))))))
      #|  !((sgns : List[_]) == NIL)
      #|  \226\136\128 y : Real, \226\136\128 z : Real, \226\136\128 p : List[Real], \226\136\128 pts : List[Real], \226\136\128 qts : List[Real], \226\136\128 eqs : List[(Real) -> Real], \226\136\128 sgns : List[List[Sign]], \226\136\128 rgns : List[List[Sign]], \226\136\128 r1 : List[Sign], \226\136\128 r2 : List[Sign], \226\136\128 r3 : List[Sign], interpmat(APPEND(pts, CONS(y, CONS(z, qts))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Pos, r1), CONS(CONS(Unknown, CONS(Neg, r2)), CONS(CONS(Neg, r3), rgns))))) \226\134\146 LENGTH(sgns) == 2 * LENGTH(pts) + 1 \226\134\146 (\226\136\131 w : Real, interpmat(APPEND(pts, CONS(y, CONS(w, CONS(z, qts)))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Pos, r1), CONS(CONS(Pos, CONS(Neg, r2)), CONS(CONS(Zero, CONS(Neg, r2)), CONS(CONS(Neg, CONS(Neg, r2)), CONS(CONS(Neg, r3), rgns))))))))
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  (X : _)
      #|  (y : Real) < (x : Real) \226\134\146 !(x == y)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  (p : List[Real])
      #|  (z : Real)
      #|  (y : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  (X : _)
      #|  (y : Real) < (x : Real) \226\134\146 !(x == y)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  (p : List[Real])
      #|  (z : Real)
      #|  (y : Real)
      #|  real_ordered_list(CONS((y : Real), CONS((z : Real), (qts : List[Real]))))
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  \226\136\128 rts : List[(Real) -> Bool], APPEND(BUTLAST(partition_line((pts : List[Real]))), CONS((x : Real) => LAST(pts) < x && x < (y : Real), rts)) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), rts)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (X : _)
      #|  (y : Real) < (x : Real) \226\134\146 !(x == y)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  (p : List[Real])
      #|  (z : Real)
      #|  (y : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (X : _)
      #|  (y : Real) < (x : Real) \226\134\146 !(x == y)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  (p : List[Real])
      #|  (z : Real)
      #|  (y : Real)
      #|  LENGTH((sgns : List[_])) == 1
      #|  (pts : List[_]) == NIL
      #|  LENGTH(partition_line(APPEND((pts : List[Real]), CONS((y : Real), CONS((z : Real), (qts : List[Real])))))) == LENGTH(APPEND((sgns : List[List[Sign]]), CONS(CONS(Neg, (r1 : List[Sign])), CONS(CONS(Unknown, CONS(Neg, (r2 : List[Sign]))), CONS(CONS(Pos, (r3 : List[Sign])), (rgns : List[List[Sign]]))))))
      #|  !((sgns : List[_]) == NIL)
      #|  \226\136\128 y : Real, \226\136\128 z : Real, \226\136\128 p : List[Real], \226\136\128 pts : List[Real], \226\136\128 qts : List[Real], \226\136\128 eqs : List[(Real) -> Real], \226\136\128 sgns : List[List[Sign]], \226\136\128 rgns : List[List[Sign]], \226\136\128 r1 : List[Sign], \226\136\128 r2 : List[Sign], \226\136\128 r3 : List[Sign], interpmat(APPEND(pts, CONS(y, CONS(z, qts))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Neg, r1), CONS(CONS(Unknown, CONS(Neg, r2)), CONS(CONS(Pos, r3), rgns))))) \226\134\146 LENGTH(sgns) == 2 * LENGTH(pts) + 1 \226\134\146 (\226\136\131 w : Real, interpmat(APPEND(pts, CONS(y, CONS(w, CONS(z, qts)))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Neg, r1), CONS(CONS(Neg, CONS(Neg, r2)), CONS(CONS(Zero, CONS(Neg, r2)), CONS(CONS(Pos, CONS(Neg, r2)), CONS(CONS(Pos, r3), rgns))))))))
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  (X : _)
      #|  (y : Real) < (x : Real) \226\134\146 !(x == y)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  (p : List[Real])
      #|  (z : Real)
      #|  (y : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  (X : _)
      #|  (y : Real) < (x : Real) \226\134\146 !(x == y)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  (p : List[Real])
      #|  (z : Real)
      #|  (y : Real)
      #|  real_ordered_list(CONS((y : Real), CONS((z : Real), (qts : List[Real]))))
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  \226\136\128 rts : List[(Real) -> Bool], APPEND(BUTLAST(partition_line((pts : List[Real]))), CONS((x : Real) => LAST(pts) < x && x < (y : Real), rts)) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), rts)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (X : _)
      #|  (y : Real) < (x : Real) \226\134\146 !(x == y)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  (p : List[Real])
      #|  (z : Real)
      #|  (y : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (x : Real) => (y : Real) < x && x < (z : Real)
      #|  (X : _)
      #|  (y : Real) < (x : Real) \226\134\146 !(x == y)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  (p : List[Real])
      #|  (z : Real)
      #|  (y : Real)
      #|  LENGTH((sgns : List[_])) == 1
      #|  (pts : List[_]) == NIL
      #|  LENGTH(partition_line(APPEND((pts : List[Real]), CONS((y : Real), CONS((z : Real), (qts : List[Real])))))) == LENGTH(APPEND((sgns : List[List[Sign]]), CONS(CONS(Neg, (r1 : List[Sign])), CONS(CONS(Unknown, CONS(Pos, (r2 : List[Sign]))), CONS(CONS(Pos, (r3 : List[Sign])), (rgns : List[List[Sign]]))))))
      #|  !((sgns : List[_]) == NIL)
      #|  \226\136\128 y : Real, \226\136\128 z : Real, \226\136\128 p : List[Real], \226\136\128 pts : List[Real], \226\136\128 qts : List[Real], \226\136\128 eqs : List[(Real) -> Real], \226\136\128 sgns : List[List[Sign]], \226\136\128 rgns : List[List[Sign]], \226\136\128 r1 : List[Sign], \226\136\128 r2 : List[Sign], \226\136\128 r3 : List[Sign], interpmat(APPEND(pts, CONS(y, CONS(z, qts))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Neg, r1), CONS(CONS(Unknown, CONS(Pos, r2)), CONS(CONS(Pos, r3), rgns))))) \226\134\146 LENGTH(sgns) == 2 * LENGTH(pts) + 1 \226\134\146 (\226\136\131 w : Real, interpmat(APPEND(pts, CONS(y, CONS(w, CONS(z, qts)))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Neg, r1), CONS(CONS(Neg, CONS(Pos, r2)), CONS(CONS(Zero, CONS(Pos, r2)), CONS(CONS(Pos, CONS(Pos, r2)), CONS(CONS(Pos, r3), rgns))))))))
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  real_ordered_list(CONS((y : Real), CONS((z : Real), (qts : List[Real]))))
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  \226\136\128 j : List[(Real) -> Bool], APPEND(BUTLAST(partition_line((pts : List[Real]))), CONS((x : Real) => LAST(pts) < x && x < (y : Real), j)) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), j)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  real_ordered_list([(y : Real), (z : Real)])
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real), (x : Real) => x == y, (x : Real) => y < x && x < (z : Real), (x : Real) => x == z, (x : Real) => z < x]) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), [(x : Real) => x == y, (x : Real) => y < x && x < z, (x : Real) => x == z, (x : Real) => z < x])
      #|  (x : Real) > (y : Real) \226\134\146 !(x == y)
      #|  (x : Real) > (y : Real) \226\134\146 !(x == y)
      #|  LENGTH((sgns : List[_])) == 1
      #|  (pts : List[_]) == NIL
      #|  LENGTH(partition_line(APPEND((pts : List[Real]), CONS((y : Real), CONS((z : Real), (qts : List[Real])))))) == LENGTH(APPEND((sgns : List[List[Sign]]), CONS(CONS(Zero, (r1 : List[Sign])), CONS(CONS(Unknown, CONS(Pos, (r2 : List[Sign]))), CONS(CONS(Pos, (r3 : List[Sign])), (rgns : List[List[Sign]]))))))
      #|  !((sgns : List[_]) == NIL)
      #|  \226\136\128 y : Real, \226\136\128 z : Real, \226\136\128 p : List[Real], \226\136\128 pts : List[Real], \226\136\128 qts : List[Real], \226\136\128 eqs : List[(Real) -> Real], \226\136\128 sgns : List[List[Sign]], \226\136\128 rgns : List[List[Sign]], \226\136\128 r1 : List[Sign], \226\136\128 r2 : List[Sign], \226\136\128 r3 : List[Sign], interpmat(APPEND(pts, CONS(y, CONS(z, qts))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Zero, r1), CONS(CONS(Unknown, CONS(Pos, r2)), CONS(CONS(Pos, r3), rgns))))) \226\134\146 LENGTH(sgns) == 2 * LENGTH(pts) + 1 \226\134\146 interpmat(APPEND(pts, CONS(y, CONS(z, qts))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Zero, r1), CONS(CONS(Pos, CONS(Pos, r2)), CONS(CONS(Pos, r3), rgns)))))
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  real_ordered_list(CONS((y : Real), CONS((z : Real), (qts : List[Real]))))
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  \226\136\128 j : List[(Real) -> Bool], APPEND(BUTLAST(partition_line((pts : List[Real]))), CONS((x : Real) => LAST(pts) < x && x < (y : Real), j)) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), j)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  real_ordered_list([(y : Real), (z : Real)])
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real), (x : Real) => x == y, (x : Real) => y < x && x < (z : Real), (x : Real) => x == z, (x : Real) => z < x]) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), [(x : Real) => x == y, (x : Real) => y < x && x < z, (x : Real) => x == z, (x : Real) => z < x])
      #|  (x : Real) > (y : Real) \226\134\146 !(x == y)
      #|  (x : Real) > (y : Real) \226\134\146 !(x == y)
      #|  LENGTH((sgns : List[_])) == 1
      #|  (pts : List[_]) == NIL
      #|  LENGTH(partition_line(APPEND((pts : List[Real]), CONS((y : Real), CONS((z : Real), (qts : List[Real])))))) == LENGTH(APPEND((sgns : List[List[Sign]]), CONS(CONS(Zero, (r1 : List[Sign])), CONS(CONS(Unknown, CONS(Neg, (r2 : List[Sign]))), CONS(CONS(Pos, (r3 : List[Sign])), (rgns : List[List[Sign]]))))))
      #|  !((sgns : List[_]) == NIL)
      #|  \226\136\128 y : Real, \226\136\128 z : Real, \226\136\128 p : List[Real], \226\136\128 pts : List[Real], \226\136\128 qts : List[Real], \226\136\128 eqs : List[(Real) -> Real], \226\136\128 sgns : List[List[Sign]], \226\136\128 rgns : List[List[Sign]], \226\136\128 r1 : List[Sign], \226\136\128 r2 : List[Sign], \226\136\128 r3 : List[Sign], interpmat(APPEND(pts, CONS(y, CONS(z, qts))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Zero, r1), CONS(CONS(Unknown, CONS(Neg, r2)), CONS(CONS(Pos, r3), rgns))))) \226\134\146 LENGTH(sgns) == 2 * LENGTH(pts) + 1 \226\134\146 interpmat(APPEND(pts, CONS(y, CONS(z, qts))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Zero, r1), CONS(CONS(Pos, CONS(Neg, r2)), CONS(CONS(Pos, r3), rgns)))))
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  real_ordered_list(CONS((y : Real), CONS((z : Real), (qts : List[Real]))))
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  \226\136\128 j : List[(Real) -> Bool], APPEND(BUTLAST(partition_line((pts : List[Real]))), CONS((x : Real) => LAST(pts) < x && x < (y : Real), j)) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), j)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  real_ordered_list([(y : Real), (z : Real)])
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real), (x : Real) => x == y, (x : Real) => y < x && x < (z : Real), (x : Real) => x == z, (x : Real) => z < x]) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), [(x : Real) => x == y, (x : Real) => y < x && x < z, (x : Real) => x == z, (x : Real) => z < x])
      #|  (x : Real) > (y : Real) \226\134\146 !(x == y)
      #|  (x : Real) > (y : Real) \226\134\146 !(x == y)
      #|  LENGTH((sgns : List[_])) == 1
      #|  (pts : List[_]) == NIL
      #|  LENGTH(partition_line(APPEND((pts : List[Real]), CONS((y : Real), CONS((z : Real), (qts : List[Real])))))) == LENGTH(APPEND((sgns : List[List[Sign]]), CONS(CONS(Pos, (r1 : List[Sign])), CONS(CONS(Unknown, CONS(Pos, (r2 : List[Sign]))), CONS(CONS(Zero, (r3 : List[Sign])), (rgns : List[List[Sign]]))))))
      #|  !((sgns : List[_]) == NIL)
      #|  \226\136\128 y : Real, \226\136\128 z : Real, \226\136\128 p : List[Real], \226\136\128 pts : List[Real], \226\136\128 qts : List[Real], \226\136\128 eqs : List[(Real) -> Real], \226\136\128 sgns : List[List[Sign]], \226\136\128 rgns : List[List[Sign]], \226\136\128 r1 : List[Sign], \226\136\128 r2 : List[Sign], \226\136\128 r3 : List[Sign], interpmat(APPEND(pts, CONS(y, CONS(z, qts))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Pos, r1), CONS(CONS(Unknown, CONS(Pos, r2)), CONS(CONS(Zero, r3), rgns))))) \226\134\146 LENGTH(sgns) == 2 * LENGTH(pts) + 1 \226\134\146 interpmat(APPEND(pts, CONS(y, CONS(z, qts))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Pos, r1), CONS(CONS(Pos, CONS(Pos, r2)), CONS(CONS(Zero, r3), rgns)))))
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  real_ordered_list(CONS((y : Real), CONS((z : Real), (qts : List[Real]))))
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  \226\136\128 j : List[(Real) -> Bool], APPEND(BUTLAST(partition_line((pts : List[Real]))), CONS((x : Real) => LAST(pts) < x && x < (y : Real), j)) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), j)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  real_ordered_list([(y : Real), (z : Real)])
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real), (x : Real) => x == y, (x : Real) => y < x && x < (z : Real), (x : Real) => x == z, (x : Real) => z < x]) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), [(x : Real) => x == y, (x : Real) => y < x && x < z, (x : Real) => x == z, (x : Real) => z < x])
      #|  (x : Real) > (y : Real) \226\134\146 !(x == y)
      #|  (x : Real) > (y : Real) \226\134\146 !(x == y)
      #|  LENGTH((sgns : List[_])) == 1
      #|  (pts : List[_]) == NIL
      #|  LENGTH(partition_line(APPEND((pts : List[Real]), CONS((y : Real), CONS((z : Real), (qts : List[Real])))))) == LENGTH(APPEND((sgns : List[List[Sign]]), CONS(CONS(Pos, (r1 : List[Sign])), CONS(CONS(Unknown, CONS(Neg, (r2 : List[Sign]))), CONS(CONS(Zero, (r3 : List[Sign])), (rgns : List[List[Sign]]))))))
      #|  !((sgns : List[_]) == NIL)
      #|  \226\136\128 y : Real, \226\136\128 z : Real, \226\136\128 p : List[Real], \226\136\128 pts : List[Real], \226\136\128 qts : List[Real], \226\136\128 eqs : List[(Real) -> Real], \226\136\128 sgns : List[List[Sign]], \226\136\128 rgns : List[List[Sign]], \226\136\128 r1 : List[Sign], \226\136\128 r2 : List[Sign], \226\136\128 r3 : List[Sign], interpmat(APPEND(pts, CONS(y, CONS(z, qts))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Pos, r1), CONS(CONS(Unknown, CONS(Neg, r2)), CONS(CONS(Zero, r3), rgns))))) \226\134\146 LENGTH(sgns) == 2 * LENGTH(pts) + 1 \226\134\146 interpmat(APPEND(pts, CONS(y, CONS(z, qts))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Pos, r1), CONS(CONS(Pos, CONS(Neg, r2)), CONS(CONS(Zero, r3), rgns)))))
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  real_ordered_list(CONS((y : Real), CONS((z : Real), (qts : List[Real]))))
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  \226\136\128 j : List[(Real) -> Bool], APPEND(BUTLAST(partition_line((pts : List[Real]))), CONS((x : Real) => LAST(pts) < x && x < (y : Real), j)) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), j)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  real_ordered_list([(y : Real), (z : Real)])
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real), (x : Real) => x == y, (x : Real) => y < x && x < (z : Real), (x : Real) => x == z, (x : Real) => z < x]) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), [(x : Real) => x == y, (x : Real) => y < x && x < z, (x : Real) => x == z, (x : Real) => z < x])
      #|  (x : Real) > (y : Real) \226\134\146 !(x == y)
      #|  (x : Real) > (y : Real) \226\134\146 !(x == y)
      #|  LENGTH((sgns : List[_])) == 1
      #|  (pts : List[_]) == NIL
      #|  LENGTH(partition_line(APPEND((pts : List[Real]), CONS((y : Real), CONS((z : Real), (qts : List[Real])))))) == LENGTH(APPEND((sgns : List[List[Sign]]), CONS(CONS(Zero, (r1 : List[Sign])), CONS(CONS(Unknown, CONS(Pos, (r2 : List[Sign]))), CONS(CONS(Neg, (r3 : List[Sign])), (rgns : List[List[Sign]]))))))
      #|  !((sgns : List[_]) == NIL)
      #|  \226\136\128 y : Real, \226\136\128 z : Real, \226\136\128 p : List[Real], \226\136\128 pts : List[Real], \226\136\128 qts : List[Real], \226\136\128 eqs : List[(Real) -> Real], \226\136\128 sgns : List[List[Sign]], \226\136\128 rgns : List[List[Sign]], \226\136\128 r1 : List[Sign], \226\136\128 r2 : List[Sign], \226\136\128 r3 : List[Sign], interpmat(APPEND(pts, CONS(y, CONS(z, qts))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Zero, r1), CONS(CONS(Unknown, CONS(Pos, r2)), CONS(CONS(Neg, r3), rgns))))) \226\134\146 LENGTH(sgns) == 2 * LENGTH(pts) + 1 \226\134\146 interpmat(APPEND(pts, CONS(y, CONS(z, qts))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Zero, r1), CONS(CONS(Neg, CONS(Pos, r2)), CONS(CONS(Neg, r3), rgns)))))
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  real_ordered_list(CONS((y : Real), CONS((z : Real), (qts : List[Real]))))
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  \226\136\128 j : List[(Real) -> Bool], APPEND(BUTLAST(partition_line((pts : List[Real]))), CONS((x : Real) => LAST(pts) < x && x < (y : Real), j)) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), j)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  real_ordered_list([(y : Real), (z : Real)])
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real), (x : Real) => x == y, (x : Real) => y < x && x < (z : Real), (x : Real) => x == z, (x : Real) => z < x]) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), [(x : Real) => x == y, (x : Real) => y < x && x < z, (x : Real) => x == z, (x : Real) => z < x])
      #|  (x : Real) > (y : Real) \226\134\146 !(x == y)
      #|  (x : Real) > (y : Real) \226\134\146 !(x == y)
      #|  LENGTH((sgns : List[_])) == 1
      #|  (pts : List[_]) == NIL
      #|  LENGTH(partition_line(APPEND((pts : List[Real]), CONS((y : Real), CONS((z : Real), (qts : List[Real])))))) == LENGTH(APPEND((sgns : List[List[Sign]]), CONS(CONS(Zero, (r1 : List[Sign])), CONS(CONS(Unknown, CONS(Neg, (r2 : List[Sign]))), CONS(CONS(Neg, (r3 : List[Sign])), (rgns : List[List[Sign]]))))))
      #|  !((sgns : List[_]) == NIL)
      #|  \226\136\128 y : Real, \226\136\128 z : Real, \226\136\128 p : List[Real], \226\136\128 pts : List[Real], \226\136\128 qts : List[Real], \226\136\128 eqs : List[(Real) -> Real], \226\136\128 sgns : List[List[Sign]], \226\136\128 rgns : List[List[Sign]], \226\136\128 r1 : List[Sign], \226\136\128 r2 : List[Sign], \226\136\128 r3 : List[Sign], interpmat(APPEND(pts, CONS(y, CONS(z, qts))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Zero, r1), CONS(CONS(Unknown, CONS(Neg, r2)), CONS(CONS(Neg, r3), rgns))))) \226\134\146 LENGTH(sgns) == 2 * LENGTH(pts) + 1 \226\134\146 interpmat(APPEND(pts, CONS(y, CONS(z, qts))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Zero, r1), CONS(CONS(Neg, CONS(Neg, r2)), CONS(CONS(Neg, r3), rgns)))))
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  real_ordered_list(CONS((y : Real), CONS((z : Real), (qts : List[Real]))))
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  \226\136\128 j : List[(Real) -> Bool], APPEND(BUTLAST(partition_line((pts : List[Real]))), CONS((x : Real) => LAST(pts) < x && x < (y : Real), j)) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), j)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  real_ordered_list([(y : Real), (z : Real)])
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real), (x : Real) => x == y, (x : Real) => y < x && x < (z : Real), (x : Real) => x == z, (x : Real) => z < x]) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), [(x : Real) => x == y, (x : Real) => y < x && x < z, (x : Real) => x == z, (x : Real) => z < x])
      #|  (x : Real) > (y : Real) \226\134\146 !(x == y)
      #|  (x : Real) > (y : Real) \226\134\146 !(x == y)
      #|  LENGTH((sgns : List[_])) == 1
      #|  (pts : List[_]) == NIL
      #|  LENGTH(partition_line(APPEND((pts : List[Real]), CONS((y : Real), CONS((z : Real), (qts : List[Real])))))) == LENGTH(APPEND((sgns : List[List[Sign]]), CONS(CONS(Neg, (r1 : List[Sign])), CONS(CONS(Unknown, CONS(Neg, (r2 : List[Sign]))), CONS(CONS(Zero, (r3 : List[Sign])), (rgns : List[List[Sign]]))))))
      #|  !((sgns : List[_]) == NIL)
      #|  \226\136\128 y : Real, \226\136\128 z : Real, \226\136\128 p : List[Real], \226\136\128 pts : List[Real], \226\136\128 qts : List[Real], \226\136\128 eqs : List[(Real) -> Real], \226\136\128 sgns : List[List[Sign]], \226\136\128 rgns : List[List[Sign]], \226\136\128 r1 : List[Sign], \226\136\128 r2 : List[Sign], \226\136\128 r3 : List[Sign], interpmat(APPEND(pts, CONS(y, CONS(z, qts))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Neg, r1), CONS(CONS(Unknown, CONS(Neg, r2)), CONS(CONS(Zero, r3), rgns))))) \226\134\146 LENGTH(sgns) == 2 * LENGTH(pts) + 1 \226\134\146 interpmat(APPEND(pts, CONS(y, CONS(z, qts))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Neg, r1), CONS(CONS(Neg, CONS(Neg, r2)), CONS(CONS(Zero, r3), rgns)))))
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  real_ordered_list(CONS((y : Real), CONS((z : Real), (qts : List[Real]))))
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  \226\136\128 j : List[(Real) -> Bool], APPEND(BUTLAST(partition_line((pts : List[Real]))), CONS((x : Real) => LAST(pts) < x && x < (y : Real), j)) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), j)
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  real_ordered_list([(y : Real), (z : Real)])
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[_]))
      #|  APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real), (x : Real) => x == y, (x : Real) => y < x && x < (z : Real), (x : Real) => x == z, (x : Real) => z < x]) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), [(x : Real) => x == y, (x : Real) => y < x && x < z, (x : Real) => x == z, (x : Real) => z < x])
      #|  (x : Real) > (y : Real) \226\134\146 !(x == y)
      #|  (x : Real) > (y : Real) \226\134\146 !(x == y)
      #|  LENGTH((sgns : List[_])) == 1
      #|  (pts : List[_]) == NIL
      #|  LENGTH(partition_line(APPEND((pts : List[Real]), CONS((y : Real), CONS((z : Real), (qts : List[Real])))))) == LENGTH(APPEND((sgns : List[List[Sign]]), CONS(CONS(Neg, (r1 : List[Sign])), CONS(CONS(Unknown, CONS(Pos, (r2 : List[Sign]))), CONS(CONS(Zero, (r3 : List[Sign])), (rgns : List[List[Sign]]))))))
      #|  !((sgns : List[_]) == NIL)
      #|  \226\136\128 y : Real, \226\136\128 z : Real, \226\136\128 p : List[Real], \226\136\128 pts : List[Real], \226\136\128 qts : List[Real], \226\136\128 eqs : List[(Real) -> Real], \226\136\128 sgns : List[List[Sign]], \226\136\128 rgns : List[List[Sign]], \226\136\128 r1 : List[Sign], \226\136\128 r2 : List[Sign], \226\136\128 r3 : List[Sign], interpmat(APPEND(pts, CONS(y, CONS(z, qts))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Neg, r1), CONS(CONS(Unknown, CONS(Pos, r2)), CONS(CONS(Zero, r3), rgns))))) \226\134\146 LENGTH(sgns) == 2 * LENGTH(pts) + 1 \226\134\146 interpmat(APPEND(pts, CONS(y, CONS(z, qts))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Neg, r1), CONS(CONS(Neg, CONS(Pos, r2)), CONS(CONS(Zero, r3), rgns)))))
      #|  (x : Real) > (y : Real) \226\134\146 !(x == y)
      #|  real_ordered_list(CONS((y : Real), CONS((z : Real), (qts : List[Real]))))
      #|  (p : _)
      #|  (z : _)
      #|  (y : _)
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[List[Sign]]))
      #|  \226\136\128 j : List[(Real) -> Bool], APPEND(BUTLAST(partition_line((pts : List[Real]))), CONS((x : Real) => LAST(pts) < x && x < (y : Real), j)) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), j)
      #|  (x : Real) > (y : Real) \226\134\146 !(x == y)
      #|  real_ordered_list([(y : Real), (z : Real)])
      #|  (p : _)
      #|  (z : _)
      #|  (y : _)
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[List[Sign]]))
      #|  APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real), (x : Real) => x == y, (x : Real) => y < x && x < (z : Real), (x : Real) => x == z, (x : Real) => z < x]) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), [(x : Real) => x == y, (x : Real) => y < x && x < z, (x : Real) => x == z, (x : Real) => z < x])
      #|  (x : Real) > (y : Real) \226\134\146 !(x == y)
      #|  (p : _)
      #|  (z : _)
      #|  (y : _)
      #|  (x : Real) > (y : Real) \226\134\146 !(x == y)
      #|  (p : _)
      #|  (z : _)
      #|  (y : _)
      #|  LENGTH((sgns : List[List[Sign]])) == 1
      #|  (pts : List[_]) == NIL
      #|  LENGTH(partition_line(APPEND((pts : List[Real]), CONS((y : Real), CONS((z : Real), (qts : List[Real])))))) == LENGTH(APPEND((sgns : List[List[Sign]]), CONS(CONS(Zero, (r1 : List[Sign])), CONS(CONS(Unknown, CONS(Pos, (r2 : List[Sign]))), CONS(CONS(Zero, (r3 : List[Sign])), (rgns : List[List[Sign]]))))))
      #|  !((sgns : List[List[Sign]]) == NIL)
      #|  \226\136\128 y : Real, \226\136\128 z : Real, \226\136\128 p : List[Real], \226\136\128 pts : List[Real], \226\136\128 qts : List[Real], \226\136\128 eqs : List[(Real) -> Real], \226\136\128 sgns : List[List[Sign]], \226\136\128 rgns : List[List[Sign]], \226\136\128 r1 : List[Sign], \226\136\128 r2 : List[Sign], \226\136\128 r3 : List[Sign], interpmat(APPEND(pts, CONS(y, CONS(z, qts))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Zero, r1), CONS(CONS(Unknown, CONS(Pos, r2)), CONS(CONS(Zero, r3), rgns))))) \226\134\146 LENGTH(sgns) == 2 * LENGTH(pts) + 1 \226\134\146 false
      #|  (x : Real) > (y : Real) \226\134\146 !(x == y)
      #|  real_ordered_list(CONS((y : Real), CONS((z : Real), (qts : List[Real]))))
      #|  (p : _)
      #|  (z : _)
      #|  (y : _)
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[List[Sign]]))
      #|  \226\136\128 j : List[(Real) -> Bool], APPEND(BUTLAST(partition_line((pts : List[Real]))), CONS((x : Real) => LAST(pts) < x && x < (y : Real), j)) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), j)
      #|  (x : Real) > (y : Real) \226\134\146 !(x == y)
      #|  real_ordered_list([(y : Real), (z : Real)])
      #|  (p : _)
      #|  (z : _)
      #|  (y : _)
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real)])) == LENGTH((sgns : List[List[Sign]]))
      #|  APPEND(BUTLAST(partition_line((pts : List[Real]))), [(x : Real) => LAST(pts) < x && x < (y : Real), (x : Real) => x == y, (x : Real) => y < x && x < (z : Real), (x : Real) => x == z, (x : Real) => z < x]) == APPEND(APPEND(BUTLAST(partition_line(pts)), [(x : Real) => LAST(pts) < x && x < y]), [(x : Real) => x == y, (x : Real) => y < x && x < z, (x : Real) => x == z, (x : Real) => z < x])
      #|  (x : Real) > (y : Real) \226\134\146 !(x == y)
      #|  (p : _)
      #|  (z : _)
      #|  (y : _)
      #|  (x : Real) > (y : Real) \226\134\146 !(x == y)
      #|  (p : _)
      #|  (z : _)
      #|  (y : _)
      #|  LENGTH((sgns : List[List[Sign]])) == 1
      #|  (pts : List[_]) == NIL
      #|  LENGTH(partition_line(APPEND((pts : List[Real]), CONS((y : Real), CONS((z : Real), (qts : List[Real])))))) == LENGTH(APPEND((sgns : List[List[Sign]]), CONS(CONS(Zero, (r1 : List[Sign])), CONS(CONS(Unknown, CONS(Neg, (r2 : List[Sign]))), CONS(CONS(Zero, (r3 : List[Sign])), (rgns : List[List[Sign]]))))))
      #|  !((sgns : List[List[Sign]]) == NIL)
      #|  \226\136\128 y : Real, \226\136\128 z : Real, \226\136\128 p : List[Real], \226\136\128 pts : List[Real], \226\136\128 qts : List[Real], \226\136\128 eqs : List[(Real) -> Real], \226\136\128 sgns : List[List[Sign]], \226\136\128 rgns : List[List[Sign]], \226\136\128 r1 : List[Sign], \226\136\128 r2 : List[Sign], \226\136\128 r3 : List[Sign], interpmat(APPEND(pts, CONS(y, CONS(z, qts))), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), eqs)), APPEND(sgns, CONS(CONS(Zero, r1), CONS(CONS(Unknown, CONS(Neg, r2)), CONS(CONS(Zero, r3), rgns))))) \226\134\146 LENGTH(sgns) == 2 * LENGTH(pts) + 1 \226\134\146 false
      #|  \226\136\128 l : List[_], !(l == NIL) \226\134\146 APPEND(BUTLAST(l), [LAST(l)]) == l
      #|  \226\136\128 l : List[_], !(l == NIL) \226\134\146 l == APPEND(BUTLAST(l), [LAST(l)])
      #|  \226\136\128 l : List[_], (BUTLAST(l) == NIL) == (l == NIL || (\226\136\131 x : _, l == [x]))
      #|  (x : Real) => x < (h : Real)
      #|  (x : Real) => x < (h : Real)
      #|  (x : Real) => x < (h : Real)
      #|  (Y : _)
      #|  (h : Real)
      #|  poly_diff((p : List[Real]))
      #|  (p : List[Real])
      #|  (x : Real) => x < (h : Real)
      #|  (x : Real) => x < (h : Real)
      #|  (x : Real) => x < (h : Real)
      #|  (Y : _)
      #|  (h : Real)
      #|  poly_diff((p : List[Real]))
      #|  (p : List[Real])
      #|  (x : _) => true
      #|  (x : _) => true
      #|  (x : _) => true
      #|  (Y : _)
      #|  real_of_num(0)
      #|  poly_diff((p : List[Real]))
      #|  (p : List[Real])
      #|  (pts : List[Real])
      #|  \226\136\128 pts : List[Real], \226\136\128 p : List[Real], \226\136\128 ps : List[(Real) -> Real], \226\136\128 r1 : List[Sign], \226\136\128 sgns : List[List[Sign]], interpmat(pts, CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), ps)), CONS(CONS(Unknown, CONS(Pos, r1)), sgns)) \226\134\146 nonconstant(p) \226\134\146 (\226\136\131 xminf : Real, interpmat(CONS(xminf, pts), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), ps)), CONS(CONS(Neg, CONS(Pos, r1)), CONS(CONS(Neg, CONS(Pos, r1)), CONS(CONS(Unknown, CONS(Pos, r1)), sgns)))))
      #|  (x : Real) => LAST((pts : List[Real])) < x
      #|  (x : Real) => LAST((pts : List[Real])) < x
      #|  (x : Real) => LAST((pts : List[Real])) < x
      #|  (Y : _)
      #|  LAST((pts : List[Real]))
      #|  poly_diff((p : List[Real]))
      #|  (p : List[Real])
      #|  (pts : List[Real])
      #|  LENGTH(BUTLAST(partition_line(BUTLAST((pts : List[Real]))))) == LENGTH((sgns : List[_]))
      #|  (x : Real) => (w : Real) < x
      #|  (x : Real) => (w : Real) < x
      #|  (x : Real) => (w : Real) < x
      #|  (Y : _)
      #|  (w : Real)
      #|  poly_diff((p : List[Real]))
      #|  (p : List[Real])
      #|  (sgns : List[_]) == NIL
      #|  \226\136\131 w : Real, (pts : List[Real]) == [w]
      #|  BUTLAST((pts : List[Real])) == NIL
      #|  ALL2(interpsigns(CONS((x : Real) => poly((p : List[Real]), x), CONS((x : Real) => poly(poly_diff(p), x), (ps : List[(Real) -> Real])))), partition_line(APPEND(BUTLAST((pts : List[Real])), [LAST(pts)])), APPEND((sgns : List[List[Sign]]), [(a : List[Sign]), (b : List[Sign]), CONS(Unknown, CONS(Pos, (r2 : List[Sign])))]))
      #|  (pts : List[Real]) == APPEND(BUTLAST(pts), [LAST(pts)])
      #|  (pts : List[_]) == NIL
      #|  LENGTH((sgns : List[_])) == LENGTH(partition_line((pts : List[Real]))) - 3
      #|  LENGTH(partition_line((pts : List[Real]))) == LENGTH(APPEND((sgns : List[List[Sign]]), [(a : List[Sign]), (b : List[Sign]), CONS(Unknown, CONS(Pos, (r2 : List[Sign])))]))
      #|  \226\136\128 pts : List[Real], \226\136\128 p : List[Real], \226\136\128 ps : List[(Real) -> Real], \226\136\128 r1 : _, \226\136\128 sgns : List[List[Sign]], \226\136\128 r2 : List[Sign], interpmat(pts, CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), ps)), APPEND(sgns, [(a : List[Sign]), (b : List[Sign]), CONS(Unknown, CONS(Pos, r2))])) \226\134\146 nonconstant(p) \226\134\146 (\226\136\131 xinf : Real, interpmat(APPEND(pts, [xinf]), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), ps)), APPEND(sgns, [a, b, CONS(Unknown, CONS(Pos, r2)), CONS(Pos, CONS(Pos, r2)), CONS(Pos, CONS(Pos, r2))])))
      #|  (x : Real) => x < (h : Real)
      #|  (x : Real) => x < (h : Real)
      #|  (x : Real) => x < (h : Real)
      #|  (Y : _)
      #|  (h : Real)
      #|  poly_diff((p : List[Real]))
      #|  (p : List[Real])
      #|  (x : Real) => x < (h : Real)
      #|  (x : Real) => x < (h : Real)
      #|  (x : Real) => x < (h : Real)
      #|  (Y : _)
      #|  (h : Real)
      #|  poly_diff((p : List[Real]))
      #|  (p : List[Real])
      #|  (x : _) => true
      #|  (x : _) => true
      #|  (x : _) => true
      #|  (Y : _)
      #|  real_of_num(0)
      #|  poly_diff((p : List[Real]))
      #|  (p : List[Real])
      #|  (pts : List[Real])
      #|  \226\136\128 pts : List[Real], \226\136\128 p : List[Real], \226\136\128 ps : List[(Real) -> Real], \226\136\128 r1 : List[Sign], \226\136\128 sgns : List[List[Sign]], interpmat(pts, CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), ps)), CONS(CONS(Unknown, CONS(Neg, r1)), sgns)) \226\134\146 nonconstant(p) \226\134\146 (\226\136\131 xminf : Real, interpmat(CONS(xminf, pts), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), ps)), CONS(CONS(Pos, CONS(Neg, r1)), CONS(CONS(Pos, CONS(Neg, r1)), CONS(CONS(Unknown, CONS(Neg, r1)), sgns)))))
      #|  (x : Real) => LAST((pts : List[Real])) < x
      #|  (x : Real) => LAST((pts : List[Real])) < x
      #|  (x : Real) => LAST((pts : List[Real])) < x
      #|  (Y : _)
      #|  LAST((pts : List[Real]))
      #|  poly_diff((p : List[Real]))
      #|  (p : List[Real])
      #|  (pts : List[Real])
      #|  LENGTH(BUTLAST(partition_line(BUTLAST((pts : List[Real]))))) == LENGTH((sgns : List[_]))
      #|  (x : Real) => (w : Real) < x
      #|  (x : Real) => (w : Real) < x
      #|  (x : Real) => (w : Real) < x
      #|  (Y : _)
      #|  (w : Real)
      #|  poly_diff((p : List[Real]))
      #|  (p : List[Real])
      #|  (sgns : List[_]) == NIL
      #|  \226\136\131 w : Real, (pts : List[Real]) == [w]
      #|  BUTLAST((pts : List[Real])) == NIL
      #|  ALL2(interpsigns(CONS((x : Real) => poly((p : List[Real]), x), CONS((x : Real) => poly(poly_diff(p), x), (ps : List[(Real) -> Real])))), partition_line(APPEND(BUTLAST((pts : List[Real])), [LAST(pts)])), APPEND((sgns : List[List[Sign]]), [(a : List[Sign]), (b : List[Sign]), CONS(Unknown, CONS(Neg, (r2 : List[Sign])))]))
      #|  (pts : List[Real]) == APPEND(BUTLAST(pts), [LAST(pts)])
      #|  (pts : List[_]) == NIL
      #|  LENGTH((sgns : List[_])) == LENGTH(partition_line((pts : List[Real]))) - 3
      #|  LENGTH(partition_line((pts : List[Real]))) == LENGTH(APPEND((sgns : List[List[Sign]]), [(a : List[Sign]), (b : List[Sign]), CONS(Unknown, CONS(Neg, (r2 : List[Sign])))]))
      #|  \226\136\128 pts : List[Real], \226\136\128 p : List[Real], \226\136\128 ps : List[(Real) -> Real], \226\136\128 r1 : _, \226\136\128 sgns : List[List[Sign]], \226\136\128 r2 : List[Sign], interpmat(pts, CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), ps)), APPEND(sgns, [(a : List[Sign]), (b : List[Sign]), CONS(Unknown, CONS(Neg, r2))])) \226\134\146 nonconstant(p) \226\134\146 (\226\136\131 xinf : Real, interpmat(APPEND(pts, [xinf]), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), ps)), APPEND(sgns, [a, b, CONS(Unknown, CONS(Neg, r2)), CONS(Neg, CONS(Neg, r2)), CONS(Neg, CONS(Neg, r2))])))
      #|  (xminf : _)
      #|  \226\136\128 pts : List[Real], \226\136\128 p : List[Real], \226\136\128 ps : List[(Real) -> Real], \226\136\128 r1 : List[Sign], \226\136\128 sgns : List[List[Sign]], \226\136\128 r2 : List[Sign], interpmat(pts, CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), ps)), APPEND(CONS(CONS(Unknown, CONS(Pos, r1)), sgns), [(a : List[Sign]), (b : List[Sign]), CONS(Unknown, CONS(Pos, r2))])) \226\134\146 nonconstant(p) \226\134\146 (\226\136\131 xminf : Real, \226\136\131 xinf : Real, interpmat(APPEND(CONS(xminf, pts), [xinf]), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), ps)), APPEND(CONS(CONS(Neg, CONS(Pos, r1)), CONS(CONS(Neg, CONS(Pos, r1)), CONS(CONS(Unknown, CONS(Pos, r1)), sgns))), [a, b, CONS(Unknown, CONS(Pos, r2)), CONS(Pos, CONS(Pos, r2)), CONS(Pos, CONS(Pos, r2))])))
      #|  (xminf : _)
      #|  \226\136\128 pts : List[Real], \226\136\128 p : List[Real], \226\136\128 ps : List[(Real) -> Real], \226\136\128 r1 : List[Sign], \226\136\128 sgns : List[List[Sign]], \226\136\128 r2 : List[Sign], interpmat(pts, CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), ps)), APPEND(CONS(CONS(Unknown, CONS(Pos, r1)), sgns), [(a : List[Sign]), (b : List[Sign]), CONS(Unknown, CONS(Neg, r2))])) \226\134\146 nonconstant(p) \226\134\146 (\226\136\131 xminf : Real, \226\136\131 xinf : Real, interpmat(APPEND(CONS(xminf, pts), [xinf]), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), ps)), APPEND(CONS(CONS(Neg, CONS(Pos, r1)), CONS(CONS(Neg, CONS(Pos, r1)), CONS(CONS(Unknown, CONS(Pos, r1)), sgns))), [a, b, CONS(Unknown, CONS(Neg, r2)), CONS(Neg, CONS(Neg, r2)), CONS(Neg, CONS(Neg, r2))])))
      #|  (xminf : _)
      #|  \226\136\128 pts : List[Real], \226\136\128 p : List[Real], \226\136\128 ps : List[(Real) -> Real], \226\136\128 r1 : List[Sign], \226\136\128 sgns : List[List[Sign]], \226\136\128 r2 : List[Sign], interpmat(pts, CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), ps)), APPEND(CONS(CONS(Unknown, CONS(Neg, r1)), sgns), [(a : List[Sign]), (b : List[Sign]), CONS(Unknown, CONS(Pos, r2))])) \226\134\146 nonconstant(p) \226\134\146 (\226\136\131 xminf : Real, \226\136\131 xinf : Real, interpmat(APPEND(CONS(xminf, pts), [xinf]), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), ps)), APPEND(CONS(CONS(Pos, CONS(Neg, r1)), CONS(CONS(Pos, CONS(Neg, r1)), CONS(CONS(Unknown, CONS(Neg, r1)), sgns))), [a, b, CONS(Unknown, CONS(Pos, r2)), CONS(Pos, CONS(Pos, r2)), CONS(Pos, CONS(Pos, r2))])))
      #|  (xminf : _)
      #|  \226\136\128 pts : List[Real], \226\136\128 p : List[Real], \226\136\128 ps : List[(Real) -> Real], \226\136\128 r1 : List[Sign], \226\136\128 sgns : List[List[Sign]], \226\136\128 r2 : List[Sign], interpmat(pts, CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), ps)), APPEND(CONS(CONS(Unknown, CONS(Neg, r1)), sgns), [(a : List[Sign]), (b : List[Sign]), CONS(Unknown, CONS(Neg, r2))])) \226\134\146 nonconstant(p) \226\134\146 (\226\136\131 xminf : Real, \226\136\131 xinf : Real, interpmat(APPEND(CONS(xminf, pts), [xinf]), CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), ps)), APPEND(CONS(CONS(Pos, CONS(Neg, r1)), CONS(CONS(Pos, CONS(Neg, r1)), CONS(CONS(Unknown, CONS(Neg, r1)), sgns))), [a, b, CONS(Unknown, CONS(Neg, r2)), CONS(Neg, CONS(Neg, r2)), CONS(Neg, CONS(Neg, r2))])))
      #|  (x : _) => true
      #|  (x : _) => true
      #|  (x : _) => true
      #|  (x : _) => true
      #|  (x : _) => true
      #|  (Y : _)
      #|  (Y' : _)
      #|  real_of_num(0)
      #|  poly_diff((p : List[Real]))
      #|  (p : List[Real])
      #|  real_of_num(0)
      #|  poly_diff((p : List[Real]))
      #|  (p : List[Real])
      #|  \226\136\128 p : List[Real], \226\136\128 ps : List[(Real) -> Real], \226\136\128 r1 : List[Sign], interpmat(NIL, CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), ps)), [CONS(Unknown, CONS(Pos, r1))]) \226\134\146 nonconstant(p) \226\134\146 (\226\136\131 xminf : Real, \226\136\131 xinf : Real, interpmat([xminf, xinf], CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), ps)), [CONS(Neg, CONS(Pos, r1)), CONS(Neg, CONS(Pos, r1)), CONS(Unknown, CONS(Pos, r1)), CONS(Pos, CONS(Pos, r1)), CONS(Pos, CONS(Pos, r1))]))
      #|  (x : _) => true
      #|  (x : _) => true
      #|  (x : _) => true
      #|  (x : _) => true
      #|  (x : _) => true
      #|  (Y : _)
      #|  (Y' : _)
      #|  real_of_num(0)
      #|  poly_diff((p : List[Real]))
      #|  (p : List[Real])
      #|  real_of_num(0)
      #|  poly_diff((p : List[Real]))
      #|  (p : List[Real])
      #|  \226\136\128 p : List[Real], \226\136\128 ps : List[(Real) -> Real], \226\136\128 r1 : List[Sign], interpmat(NIL, CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), ps)), [CONS(Unknown, CONS(Neg, r1))]) \226\134\146 nonconstant(p) \226\134\146 (\226\136\131 xminf : Real, \226\136\131 xinf : Real, interpmat([xminf, xinf], CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), ps)), [CONS(Pos, CONS(Neg, r1)), CONS(Pos, CONS(Neg, r1)), CONS(Unknown, CONS(Neg, r1)), CONS(Neg, CONS(Neg, r1)), CONS(Neg, CONS(Neg, r1))]))
      #|  (xinf : _)
      #|  (\226\136\131 y : _, \226\136\131 x : _, (P : (_, _) -> Bool)(x, y)) \226\134\146 (\226\136\131 x : _, \226\136\131 y : _, P(x, y))
      #|  [(x : _), (y : _), (z : _)] == APPEND(NIL, [x, y, z])
      #|  \226\136\128 p : List[Real], \226\136\128 ps : List[(Real) -> Real], \226\136\128 r1 : List[Sign], \226\136\128 x : Real, \226\136\128 s2 : Sign, \226\136\128 r2 : List[Sign], \226\136\128 r3 : List[Sign], interpmat([x], CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), ps)), [CONS(Unknown, CONS(Pos, r1)), CONS(s2, r2), CONS(Unknown, CONS(Pos, r3))]) \226\134\146 nonconstant(p) \226\134\146 (\226\136\131 xminf : Real, \226\136\131 xinf : Real, interpmat([xminf, x, xinf], CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), ps)), [CONS(Neg, CONS(Pos, r1)), CONS(Neg, CONS(Pos, r1)), CONS(Unknown, CONS(Pos, r1)), CONS(s2, r2), CONS(Unknown, CONS(Pos, r3)), CONS(Pos, CONS(Pos, r3)), CONS(Pos, CONS(Pos, r3))]))
      #|  (xinf : _)
      #|  (\226\136\131 y : _, \226\136\131 x : _, (P : (_, _) -> Bool)(x, y)) \226\134\146 (\226\136\131 x : _, \226\136\131 y : _, P(x, y))
      #|  [(x : _), (y : _), (z : _)] == APPEND(NIL, [x, y, z])
      #|  \226\136\128 p : List[Real], \226\136\128 ps : List[(Real) -> Real], \226\136\128 r1 : List[Sign], \226\136\128 x : Real, \226\136\128 s2 : Sign, \226\136\128 r2 : List[Sign], \226\136\128 r3 : List[Sign], interpmat([x], CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), ps)), [CONS(Unknown, CONS(Pos, r1)), CONS(s2, r2), CONS(Unknown, CONS(Neg, r3))]) \226\134\146 nonconstant(p) \226\134\146 (\226\136\131 xminf : Real, \226\136\131 xinf : Real, interpmat([xminf, x, xinf], CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), ps)), [CONS(Neg, CONS(Pos, r1)), CONS(Neg, CONS(Pos, r1)), CONS(Unknown, CONS(Pos, r1)), CONS(s2, r2), CONS(Unknown, CONS(Neg, r3)), CONS(Neg, CONS(Neg, r3)), CONS(Neg, CONS(Neg, r3))]))
      #|  (xinf : _)
      #|  (\226\136\131 y : _, \226\136\131 x : _, (P : (_, _) -> Bool)(x, y)) \226\134\146 (\226\136\131 x : _, \226\136\131 y : _, P(x, y))
      #|  [(x : _), (y : _), (z : _)] == APPEND(NIL, [x, y, z])
      #|  \226\136\128 p : List[Real], \226\136\128 ps : List[(Real) -> Real], \226\136\128 r1 : List[Sign], \226\136\128 x : Real, \226\136\128 s2 : Sign, \226\136\128 r2 : List[Sign], \226\136\128 r3 : List[Sign], interpmat([x], CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), ps)), [CONS(Unknown, CONS(Neg, r1)), CONS(s2, r2), CONS(Unknown, CONS(Pos, r3))]) \226\134\146 nonconstant(p) \226\134\146 (\226\136\131 xminf : Real, \226\136\131 xinf : Real, interpmat([xminf, x, xinf], CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), ps)), [CONS(Pos, CONS(Neg, r1)), CONS(Pos, CONS(Neg, r1)), CONS(Unknown, CONS(Neg, r1)), CONS(s2, r2), CONS(Unknown, CONS(Pos, r3)), CONS(Pos, CONS(Pos, r3)), CONS(Pos, CONS(Pos, r3))]))
      #|  (xinf : _)
      #|  (\226\136\131 y : _, \226\136\131 x : _, (P : (_, _) -> Bool)(x, y)) \226\134\146 (\226\136\131 x : _, \226\136\131 y : _, P(x, y))
      #|  [(x : _), (y : _), (z : _)] == APPEND(NIL, [x, y, z])
      #|  \226\136\128 p : List[Real], \226\136\128 ps : List[(Real) -> Real], \226\136\128 r1 : List[Sign], \226\136\128 x : Real, \226\136\128 s2 : Sign, \226\136\128 r2 : List[Sign], \226\136\128 r3 : List[Sign], interpmat([x], CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), ps)), [CONS(Unknown, CONS(Neg, r1)), CONS(s2, r2), CONS(Unknown, CONS(Neg, r3))]) \226\134\146 nonconstant(p) \226\134\146 (\226\136\131 xminf : Real, \226\136\131 xinf : Real, interpmat([xminf, x, xinf], CONS((x : Real) => poly(p, x), CONS((x : Real) => poly(poly_diff(p), x), ps)), [CONS(Pos, CONS(Neg, r1)), CONS(Pos, CONS(Neg, r1)), CONS(Unknown, CONS(Neg, r1)), CONS(s2, r2), CONS(Unknown, CONS(Neg, r3)), CONS(Neg, CONS(Neg, r3)), CONS(Neg, CONS(Neg, r3))]))
      #|  \226\136\128 i : Num, \226\136\128 h : _, \226\136\128 t : List[_], EL(SUC(i), CONS(h, t)) == EL(i, t)
      #|  \226\136\128 i : Num, \226\136\128 h : _, \226\136\128 t : List[_], !(i == 0) \226\134\146 EL(i, CONS(h, t)) == EL(PRE(i), t)
      #|  (n : Num)
      #|  !((l2 : List[_]) == NIL)
      #|  !((l1 : List[_]) == NIL)
      #|  \226\136\128 k : Num, \226\136\128 P : (_, _) -> Bool, \226\136\128 l1 : List[_], \226\136\128 l2 : List[_], \226\136\128 n : Num, k == LENGTH(l1) && ALL2(P, l1, l2) && n < k \226\134\146 P(EL(n, l1), EL(n, l2))
      #|  \226\136\128 P : (_, _) -> Bool, \226\136\128 l1 : List[_], \226\136\128 l2 : List[_], \226\136\128 n : Num, ALL2(P, l1, l2) && n < LENGTH(l1) \226\134\146 P(EL(n, l1), EL(n, l2))
      #|  SUC((i : Num))
      #|  SUC((i : Num)) < SUC(LENGTH((t : List[_])))
      #|  !((l2 : List[_]) == NIL)
      #|  !((l1 : List[_]) == NIL)
      #|  \226\136\128 k : Num, \226\136\128 P : (A, B) -> Bool, \226\136\128 l1 : List[A], \226\136\128 l2 : List[B], k == LENGTH(l1) && k == LENGTH(l2) && !(\226\136\131 i : Num, i < LENGTH(l1) && !P(EL(i, l1), EL(i, l2))) \226\134\146 ALL2(P, l1, l2)
      #|  \226\136\128 P : (A, B) -> Bool, \226\136\128 l1 : List[A], \226\136\128 l2 : List[B], ALL2(P, l1, l2) == (LENGTH(l1) == LENGTH(l2) && !(\226\136\131 i : Num, i < LENGTH(l1) && !P(EL(i, l1), EL(i, l2))))
      #|  \226\136\128 f : (_) -> _, \226\136\128 l : List[_], \226\136\128 n : Num, n < LENGTH(l) \226\134\146 EL(n, MAP(f, l)) == f(EL(n, l))
      #|  !(EL((i : Num), (sgns : List[List[_]])) == NIL)
      #|  (i : Num) < LENGTH((sgns : List[_]))
      #|  (i : Num)
      #|  \226\136\128 p : (Real) -> Real, \226\136\128 ps : List[(Real) -> Real], \226\136\128 sgns : List[List[Sign]], \226\136\128 pts : List[Real], interpmat(pts, CONS(p, ps), sgns) \226\134\146 interpmat(pts, ps, MAP(TL, sgns))
      #|  !(TL(EL((i : Num), (sgns : List[List[_]]))) == NIL)
      #|  !(EL((i : Num), (sgns : List[List[_]])) == NIL)
      #|  (i : Num) < LENGTH((sgns : List[_]))
      #|  (i : Num)
      #|  \226\136\128 sgns : List[List[Sign]], \226\136\128 pts : List[Real], \226\136\128 p1 : (Real) -> Real, \226\136\128 p2 : (Real) -> Real, \226\136\128 ps : List[(Real) -> Real], interpmat(pts, CONS(p1, CONS(p2, ps)), sgns) \226\134\146 interpmat(pts, CONS(p1, ps), MAP((x : List[Sign]) => CONS(HD(x), TL(TL(x))), sgns))
      #|  SUC((n : Num)) < SUC(LENGTH((t : List[_])))
      #|  0
      #|  PRE((n : Num)) < LENGTH((t : List[_]))
      #|  (n : Num) == 0
      #|  \226\136\128 P : (_) -> Bool, \226\136\128 l : List[_], ALL(P, l) == (\226\136\128 n : Num, n < LENGTH(l) \226\134\146 P(EL(n, l)))
      #|  (t' : _)
      #|  !((l1 : List[_]) == NIL)
      #|  !((l2 : List[_]) == NIL)
      #|  (l2 : List[_]) == NIL
      #|  \226\136\128 k : Num, \226\136\128 pols : List[(Real) -> Real], \226\136\128 l1 : List[(Real) -> Bool], \226\136\128 l2 : List[List[Sign]], ALL2(interpsigns(pols), l1, l2) && k == LENGTH(l2) \226\134\146 ALL((x : List[Sign]) => LENGTH(x) == LENGTH(pols), l2)
      #|  \226\136\128 pts : List[Real], \226\136\128 pols : List[(Real) -> Real], \226\136\128 sgns : List[List[Sign]], interpmat(pts, pols, sgns) \226\134\146 ALL((x : List[Sign]) => LENGTH(x) == LENGTH(pols), sgns)
      #|  \226\136\128 P : (_, _) -> Bool, \226\136\128 l1 : List[_], \226\136\128 l2 : List[_], ALL2(P, l1, l2) \226\134\146 ALL2(P, BUTLAST(l1), BUTLAST(l2))
      #|  (i : Num) < LENGTH((sgns : List[_]))
      #|  (i : Num)
      #|  \226\136\128 pts : List[Real], \226\136\128 pols : List[(Real) -> Real], \226\136\128 sgns : List[List[Sign]], interpmat(pts, pols, sgns) \226\134\146 interpmat(pts, BUTLAST(pols), MAP(BUTLAST, sgns))
      #|  (INSERTAT : (Num, _, List[_]) -> List[_])(0, (x : _), (l : List[_])) == CONS(x, l) && INSERTAT(SUC((n : Num)), x, l) == CONS(HD(l), INSERTAT(n, x, TL(l)))
      #|  (i : Num)
      #|  !((l2 : List[_]) == NIL)
      #|  !((l1 : List[_]) == NIL)
      #|  \226\136\128 f : (_, _) -> _, \226\136\128 k : Num, \226\136\128 l1 : List[_], \226\136\128 l2 : List[_], \226\136\128 i : Num, LENGTH(l1) == LENGTH(l2) \226\134\146 i < LENGTH(l1) \226\134\146 k == LENGTH(l1) \226\134\146 EL(i, MAP2(f, l1, l2)) == f(EL(i, l1), EL(i, l2))
      #|  \226\136\128 f : (_, _) -> _, \226\136\128 i : Num, \226\136\128 l1 : List[_], \226\136\128 l2 : List[_], LENGTH(l1) == LENGTH(l2) \226\134\146 i < LENGTH(l1) \226\134\146 EL(i, MAP2(f, l1, l2)) == f(EL(i, l1), EL(i, l2))
      #|  !(SUC((n : Num)) <= 0)
      #|  !((l : List[_]) == NIL)
      #|  \226\136\128 x : _, \226\136\128 n : Num, \226\136\128 l : List[_], n <= LENGTH(l) \226\134\146 LENGTH(INSERTAT(n, x, l)) == SUC(LENGTH(l))
      #|  (n : Num) < LENGTH((l : List[_])) || n == LENGTH(l)
      #|  \226\136\128 x : _, \226\136\128 n : Num, \226\136\128 l : List[_], n < LENGTH(l) \226\134\146 INSERTAT(n, x, TL(l)) == TL(INSERTAT(SUC(n), x, l))
      #|  (x : Num) < (y : Num) \226\134\146 !(y == 0)
      #|  (n' : _)
      #|  TL((l : List[A]))
      #|  (n' : Num)
      #|  (x : A)
      #|  (n' : Num) <= LENGTH(TL((l : List[_])))
      #|  (i : _)
      #|  (n' : Num) <= LENGTH(TL((l : List[_])))
      #|  (i : _)
      #|  (n : Num) <= LENGTH(TL((l : List[_])))
      #|  !(SUC((n : Num)) <= 0)
      #|  !((l : List[_]) == NIL)
      #|  (i : Num)
      #|  \226\136\128 n : Num, \226\136\128 x : A, \226\136\128 i : Num, \226\136\128 l : List[A], n <= LENGTH(l) \226\134\146 i <= LENGTH(l) \226\134\146 (i < n \226\134\146 EL(i, INSERTAT(n, x, l)) == EL(i, l)) && (i == n \226\134\146 EL(i, INSERTAT(n, x, l)) == x) && (i > n \226\134\146 EL(i, INSERTAT(n, x, l)) == EL(PRE(i), l))
      #|  !((i' : Num) == 0)
      #|  PRE((i' : Num))
      #|  (i : Num)
      #|  (i' : Num) <= LENGTH((pols : List[_]))
      #|  (p : _)
      #|  (i' : Num) <= LENGTH(EL((i : Num), (sgns : List[List[_]])))
      #|  (n : Num) <= LENGTH(EL((i : Num), (sgns : List[List[_]])))
      #|  LENGTH(EL((i : Num), (sgns : List[List[_]]))) == LENGTH((pols : List[_]))
      #|  (n : Num) <= LENGTH(EL((i : Num), (sgns : List[List[_]])))
      #|  LENGTH(EL((i : Num), (sgns : List[List[_]]))) == LENGTH((pols : List[_]))
      #|  (x : Num) <= (y : Num) && (z : Num) < x \226\134\146 z < y
      #|  (i' : Num)
      #|  (i : Num)
      #|  (i' : Num) <= LENGTH((pols : List[_]))
      #|  (i' : Num) <= LENGTH(EL((i : Num), (sgns : List[List[_]])))
      #|  (n : Num) <= LENGTH(EL((i : Num), (sgns : List[List[_]])))
      #|  LENGTH(EL((i : Num), (sgns : List[List[_]]))) == LENGTH((pols : List[_]))
      #|  (i' : Num) < (n : Num) || i' == n || i' > n
      #|  LENGTH(EL((i : Num), (sgns : List[List[Sign]]))) == LENGTH((pols : List[_]))
      #|  (i : Num) < LENGTH((psgns : List[_]))
      #|  LENGTH((psgns : List[_])) == LENGTH((sgns : List[_]))
      #|  LENGTH((psgns : List[Sign])) == LENGTH((sgns : List[_]))
      #|  \226\136\128 pts : List[Real], \226\136\128 p : (Real) -> Real, \226\136\128 pols : List[(Real) -> Real], \226\136\128 n : Num, \226\136\128 psgns : List[Sign], \226\136\128 sgns : List[List[Sign]], interpmat(pts, pols, sgns) \226\134\146 ALL2((x : (Real) -> Bool) => (y : Sign) => interpsign(x, p, y), partition_line(pts), psgns) \226\134\146 n <= LENGTH(pols) \226\134\146 interpmat(pts, INSERTAT(n, p, pols), MAP2(INSERTAT(n), psgns, sgns))
      #|  \226\136\128 c : Real, \226\136\128 l : List[(Real) -> Bool], c > real_of_num(0) \226\134\146 ALL2((x : (Real) -> Bool) => (y : Sign) => interpsign(x, (x : Real) => c, y), l, REPLICATE(LENGTH(l), Pos))
      #|  \226\136\128 c : Real, \226\136\128 l : List[(Real) -> Bool], c < real_of_num(0) \226\134\146 ALL2((x : (Real) -> Bool) => (y : Sign) => interpsign(x, (x : Real) => c, y), l, REPLICATE(LENGTH(l), Neg))
      #|  \226\136\128 c : Real, \226\136\128 l : List[(Real) -> Bool], c == real_of_num(0) \226\134\146 ALL2((x : (Real) -> Bool) => (y : Sign) => interpsign(x, (x : Real) => c, y), l, REPLICATE(LENGTH(l), Zero))
      #|  (i : _)
      #|  \226\136\128 n : Num, \226\136\128 x : _, \226\136\128 i : Num, i < n \226\134\146 EL(i, REPLICATE(n, x)) == x
      #|  \226\136\128 p : (Real) -> Real, \226\136\128 pts : List[Real], ALL2((x : (Real) -> Bool) => (y : Sign) => interpsign(x, p, y), partition_line(pts), REPLICATE(LENGTH(partition_line(pts)), Unknown))
      #|  \226\136\128 pts : List[Real], \226\136\128 p : (Real) -> Real, \226\136\128 pols : List[(Real) -> Real], \226\136\128 n : Num, \226\136\128 psgns : List[Sign], \226\136\128 sgns : List[List[Sign]], ALL2((x : (Real) -> Bool) => (y : Sign) => interpsign(x, p, y), partition_line(pts), psgns) \226\134\146 n <= LENGTH(pols) \226\134\146 interpmat(pts, pols, sgns) \226\134\146 interpmat(pts, INSERTAT(n, p, pols), MAP2(INSERTAT(n), psgns, sgns))
      #|  (INSERTAT : (Num, _, List[_]) -> List[_])(0) == (CONS : (_, List[_]) -> List[_])
      #|  0 <= (x : Num)
      #|  (sgns : _)
      #|  REPLICATE(LENGTH(partition_line((pts : List[Real]))), Unknown)
      #|  0
      #|  (pols : _)
      #|  (p : _)
      #|  (pts : _)
      #|  \226\136\128 pts : List[Real], \226\136\128 p : (Real) -> Real, \226\136\128 pols : List[(Real) -> Real], \226\136\128 sgns : List[List[Sign]], interpmat(pts, pols, sgns) \226\134\146 interpmat(pts, CONS(p, pols), MAP2(CONS, REPLICATE(2 * LENGTH(pts) + 1, Unknown), sgns))
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts1 : List[Real]))), [(x' : Real) => LAST(pts1) < x' && x' < (x : Real)])) == LENGTH((sgns : List[_]))
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts1 : List[Real]))), [(x' : Real) => LAST(pts1) < x' && x' < (x : Real)])) == LENGTH((sgns : List[_]))
      #|  APPEND(BUTLAST(partition_line((pts1 : List[Real]))), CONS((x' : Real) => LAST(pts1) < x' && x' < (x : Real), TL(partition_line(CONS(x, (pts2 : List[Real])))))) == APPEND(APPEND(BUTLAST(partition_line(pts1)), [(x' : Real) => LAST(pts1) < x' && x' < x]), TL(partition_line(CONS(x, pts2))))
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  \226\136\131 k : _, (sgns : List[_]) == [k]
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  \226\136\131 k : _, (sgns : List[_]) == [k]
      #|  (pts1 : List[_]) == NIL
      #|  \226\136\128 p : (Real) -> Real, \226\136\128 ps : List[(Real) -> Real], \226\136\128 q : (Real) -> Real, \226\136\128 qs : List[(Real) -> Real], \226\136\128 r : (Real) -> Real, \226\136\128 rs : List[(Real) -> Real], \226\136\128 s : (Real) -> Real, \226\136\128 x : Real, \226\136\128 pts1 : List[Real], \226\136\128 pts2 : List[Real], \226\136\128 s1 : List[Sign], \226\136\128 s2 : List[Sign], \226\136\128 s3 : List[Sign], \226\136\128 rest : List[List[Sign]], \226\136\128 sgns : List[List[Sign]], interpmat(APPEND(pts1, CONS(x, pts2)), APPEND(CONS(p, ps), APPEND(CONS(q, qs), CONS(r, rs))), APPEND(sgns, CONS(APPEND(CONS(Unknown, s1), APPEND(CONS(Zero, s2), CONS(Pos, s3))), rest))) \226\134\146 LENGTH(ps) == LENGTH(s1) \226\134\146 LENGTH(qs) == LENGTH(s2) \226\134\146 ODD(LENGTH(sgns)) \226\134\146 LENGTH(sgns) == 2 * LENGTH(pts1) + 1 \226\134\146 (\226\136\128 x : Real, p(x) == s(x) * q(x) + r(x)) \226\134\146 interpmat(APPEND(pts1, CONS(x, pts2)), APPEND(CONS(p, ps), APPEND(CONS(q, qs), CONS(r, rs))), APPEND(sgns, CONS(APPEND(CONS(Pos, s1), APPEND(CONS(Zero, s2), CONS(Pos, s3))), rest)))
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts1 : List[Real]))), [(x' : Real) => LAST(pts1) < x' && x' < (x : Real)])) == LENGTH((sgns : List[_]))
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts1 : List[Real]))), [(x' : Real) => LAST(pts1) < x' && x' < (x : Real)])) == LENGTH((sgns : List[_]))
      #|  APPEND(BUTLAST(partition_line((pts1 : List[Real]))), CONS((x' : Real) => LAST(pts1) < x' && x' < (x : Real), TL(partition_line(CONS(x, (pts2 : List[Real])))))) == APPEND(APPEND(BUTLAST(partition_line(pts1)), [(x' : Real) => LAST(pts1) < x' && x' < x]), TL(partition_line(CONS(x, pts2))))
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  \226\136\131 k : _, (sgns : List[_]) == [k]
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  \226\136\131 k : _, (sgns : List[_]) == [k]
      #|  (pts1 : List[_]) == NIL
      #|  \226\136\128 p : (Real) -> Real, \226\136\128 ps : List[(Real) -> Real], \226\136\128 q : (Real) -> Real, \226\136\128 qs : List[(Real) -> Real], \226\136\128 r : (Real) -> Real, \226\136\128 rs : List[(Real) -> Real], \226\136\128 s : (Real) -> Real, \226\136\128 x : Real, \226\136\128 pts1 : List[Real], \226\136\128 pts2 : List[Real], \226\136\128 s1 : List[Sign], \226\136\128 s2 : List[Sign], \226\136\128 s3 : List[Sign], \226\136\128 rest : List[List[Sign]], \226\136\128 sgns : List[List[Sign]], interpmat(APPEND(pts1, CONS(x, pts2)), APPEND(CONS(p, ps), APPEND(CONS(q, qs), CONS(r, rs))), APPEND(sgns, CONS(APPEND(CONS(Unknown, s1), APPEND(CONS(Zero, s2), CONS(Neg, s3))), rest))) \226\134\146 LENGTH(ps) == LENGTH(s1) \226\134\146 LENGTH(qs) == LENGTH(s2) \226\134\146 ODD(LENGTH(sgns)) \226\134\146 LENGTH(sgns) == 2 * LENGTH(pts1) + 1 \226\134\146 (\226\136\128 x : Real, p(x) == s(x) * q(x) + r(x)) \226\134\146 interpmat(APPEND(pts1, CONS(x, pts2)), APPEND(CONS(p, ps), APPEND(CONS(q, qs), CONS(r, rs))), APPEND(sgns, CONS(APPEND(CONS(Neg, s1), APPEND(CONS(Zero, s2), CONS(Neg, s3))), rest)))
      #|  !((x : Real) < (y : Real) && y < x)
      #|  (x : Real)
      #|  (r : (_) -> Real)((x : _)) > real_of_num(0)
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts1 : List[Real]))), [(x' : Real) => LAST(pts1) < x' && x' < (x : Real)])) == LENGTH((sgns : List[_]))
      #|  !((x : Real) < (y : Real) && y < x)
      #|  (x : Real)
      #|  (r : (_) -> Real)((x : _)) > real_of_num(0)
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts1 : List[Real]))), [(x' : Real) => LAST(pts1) < x' && x' < (x : Real)])) == LENGTH((sgns : List[_]))
      #|  APPEND(BUTLAST(partition_line((pts1 : List[Real]))), CONS((x' : Real) => LAST(pts1) < x' && x' < (x : Real), TL(partition_line(CONS(x, (pts2 : List[Real])))))) == APPEND(APPEND(BUTLAST(partition_line(pts1)), [(x' : Real) => LAST(pts1) < x' && x' < x]), TL(partition_line(CONS(x, pts2))))
      #|  !((x : Real) < (y : Real) && y < x)
      #|  (x : Real)
      #|  (r : (_) -> Real)((x : _)) > real_of_num(0)
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  \226\136\131 k : _, (sgns : List[_]) == [k]
      #|  !((x : Real) < (y : Real) && y < x)
      #|  (x : Real)
      #|  (r : (_) -> Real)((x : _)) > real_of_num(0)
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  \226\136\131 k : _, (sgns : List[_]) == [k]
      #|  (pts1 : List[_]) == NIL
      #|  pow((a : Real), (n : Num)) > real_of_num(0)
      #|  \226\136\128 a : Real, \226\136\128 n : Num, \226\136\128 p : (Real) -> Real, \226\136\128 ps : List[(Real) -> Real], \226\136\128 q : (Real) -> Real, \226\136\128 qs : List[(Real) -> Real], \226\136\128 r : (Real) -> Real, \226\136\128 rs : List[(Real) -> Real], \226\136\128 s : (Real) -> Real, \226\136\128 x : Real, \226\136\128 pts1 : List[Real], \226\136\128 pts2 : List[Real], \226\136\128 s1 : List[Sign], \226\136\128 s2 : List[Sign], \226\136\128 s3 : List[Sign], \226\136\128 rest : List[List[Sign]], \226\136\128 sgns : List[List[Sign]], interpmat(APPEND(pts1, CONS(x, pts2)), APPEND(CONS(p, ps), APPEND(CONS(q, qs), CONS(r, rs))), APPEND(sgns, CONS(APPEND(CONS(Unknown, s1), APPEND(CONS(Zero, s2), CONS(Pos, s3))), rest))) \226\134\146 LENGTH(ps) == LENGTH(s1) \226\134\146 LENGTH(qs) == LENGTH(s2) \226\134\146 ODD(LENGTH(sgns)) \226\134\146 LENGTH(sgns) == 2 * LENGTH(pts1) + 1 \226\134\146 (\226\136\128 x : Real, pow(a, n) * p(x) == s(x) * q(x) + r(x)) \226\134\146 op_lt_gt(a, real_of_num(0)) \226\134\146 EVEN(n) \226\134\146 interpmat(APPEND(pts1, CONS(x, pts2)), APPEND(CONS(p, ps), APPEND(CONS(q, qs), CONS(r, rs))), APPEND(sgns, CONS(APPEND(CONS(Pos, s1), APPEND(CONS(Zero, s2), CONS(Pos, s3))), rest)))
      #|  (LENGTH : (List[A]) -> Num)
      #|  !((l2 : List[A]) == NIL)
      #|  TL((l2 : List[A]))
      #|  APPEND((l1 : List[_]), [HD((l2 : List[_]))])
      #|  (n : Num) < LENGTH((l : List[_]))
      #|  (l : _)
      #|  (NIL : List[A])
      #|  \226\136\128 n : Num, \226\136\128 l : List[A], n < LENGTH(l) \226\134\146 (\226\136\131 l1 : List[A], \226\136\131 l2 : List[A], l == APPEND(l1, l2) && LENGTH(l1) == n)
      #|  (x : Num) * (y : Num) == y * x
      #|  (x : Num) + 0 == x
      #|  MOD(NUMERAL((m : Num)), NUMERAL((n : Num)))
      #|  DIV(NUMERAL((m : Num)), NUMERAL((n : Num)))
      #|  EXP(NUMERAL((m : Num)), NUMERAL((n : Num)))
      #|  NUMERAL((m : Num)) * NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) - NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) + NUMERAL((n : Num))
      #|  ODD(NUMERAL((n : Num)))
      #|  EVEN(NUMERAL((n : Num)))
      #|  NUMERAL((m : Num)) == NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) >= NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) > NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) <= NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) < NUMERAL((n : Num))
      #|  FACT(NUMERAL((n : Num)))
      #|  PRE(NUMERAL((n : Num)))
      #|  SUC(NUMERAL((n : Num)))
      #|  MOD(NUMERAL((m : Num)), NUMERAL((n : Num)))
      #|  DIV(NUMERAL((m : Num)), NUMERAL((n : Num)))
      #|  EXP(NUMERAL((m : Num)), NUMERAL((n : Num)))
      #|  NUMERAL((m : Num)) * NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) - NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) + NUMERAL((n : Num))
      #|  ODD(NUMERAL((n : Num)))
      #|  EVEN(NUMERAL((n : Num)))
      #|  NUMERAL((m : Num)) == NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) >= NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) > NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) <= NUMERAL((n : Num))
      #|  NUMERAL((m : Num)) < NUMERAL((n : Num))
      #|  FACT(NUMERAL((n : Num)))
      #|  PRE(NUMERAL((n : Num)))
      #|  SUC(NUMERAL((n : Num)))
      #|  2
      #|  (x : _)
      #|  \226\136\128 x : Num, EVEN(x) \226\134\146 2 * DIV(x, 2) == x
      #|  \226\136\128 n : Num, (ODD(n) \226\134\146 EVEN(PRE(n))) && (!(n == 0) \226\134\146 EVEN(n) \226\134\146 ODD(PRE(n)))
      #|  (x : Num) - 1 == PRE(x)
      #|  EVEN(LENGTH((sgns : List[_])) - 1)
      #|  (s : _)
      #|  (n : _)
      #|  (a : _)
      #|  !((l2 : List[_]) == NIL)
      #|  (pts : _)
      #|  DIV(LENGTH((sgns : List[_])) - 1, 2)
      #|  LENGTH(APPEND((sgns : List[List[Sign]]), CONS(APPEND(CONS(Unknown, (s1 : List[Sign])), APPEND(CONS(Zero, (s2 : List[Sign])), CONS(Pos, (s3 : List[Sign])))), (rest : List[List[Sign]])))) == LENGTH(partition_line((pts : List[Real])))
      #|  \226\136\128 a : Real, \226\136\128 n : Num, \226\136\128 p : (Real) -> Real, \226\136\128 ps : List[(Real) -> Real], \226\136\128 q : (Real) -> Real, \226\136\128 qs : List[(Real) -> Real], \226\136\128 pts : List[Real], \226\136\128 r : (Real) -> Real, \226\136\128 rs : List[(Real) -> Real], \226\136\128 s : (Real) -> Real, \226\136\128 s1 : List[Sign], \226\136\128 s2 : List[Sign], \226\136\128 s3 : List[Sign], \226\136\128 rest : List[List[Sign]], \226\136\128 sgns : List[List[Sign]], interpmat(pts, APPEND(CONS(p, ps), APPEND(CONS(q, qs), CONS(r, rs))), APPEND(sgns, CONS(APPEND(CONS(Unknown, s1), APPEND(CONS(Zero, s2), CONS(Pos, s3))), rest))) \226\134\146 LENGTH(ps) == LENGTH(s1) \226\134\146 LENGTH(qs) == LENGTH(s2) \226\134\146 ODD(LENGTH(sgns)) \226\134\146 (\226\136\128 x : Real, pow(a, n) * p(x) == s(x) * q(x) + r(x)) \226\134\146 op_lt_gt(a, real_of_num(0)) \226\134\146 EVEN(n) \226\134\146 interpmat(pts, APPEND(CONS(p, ps), APPEND(CONS(q, qs), CONS(r, rs))), APPEND(sgns, CONS(APPEND(CONS(Pos, s1), APPEND(CONS(Zero, s2), CONS(Pos, s3))), rest)))
      #|  !((x : Real) < (y : Real) && y < x)
      #|  (x : Real)
      #|  (r : (_) -> Real)((x : _)) < real_of_num(0)
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts1 : List[Real]))), [(x' : Real) => LAST(pts1) < x' && x' < (x : Real)])) == LENGTH((sgns : List[_]))
      #|  !((x : Real) < (y : Real) && y < x)
      #|  (x : Real)
      #|  (r : (_) -> Real)((x : _)) < real_of_num(0)
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts1 : List[Real]))), [(x' : Real) => LAST(pts1) < x' && x' < (x : Real)])) == LENGTH((sgns : List[_]))
      #|  APPEND(BUTLAST(partition_line((pts1 : List[Real]))), CONS((x' : Real) => LAST(pts1) < x' && x' < (x : Real), TL(partition_line(CONS(x, (pts2 : List[Real])))))) == APPEND(APPEND(BUTLAST(partition_line(pts1)), [(x' : Real) => LAST(pts1) < x' && x' < x]), TL(partition_line(CONS(x, pts2))))
      #|  !((x : Real) < (y : Real) && y < x)
      #|  (x : Real)
      #|  (r : (_) -> Real)((x : _)) < real_of_num(0)
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  \226\136\131 k : _, (sgns : List[_]) == [k]
      #|  !((x : Real) < (y : Real) && y < x)
      #|  (x : Real)
      #|  (r : (_) -> Real)((x : _)) < real_of_num(0)
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  \226\136\131 k : _, (sgns : List[_]) == [k]
      #|  (pts1 : List[_]) == NIL
      #|  pow((a : Real), (n : Num)) > real_of_num(0)
      #|  \226\136\128 a : Real, \226\136\128 n : Num, \226\136\128 p : (Real) -> Real, \226\136\128 ps : List[(Real) -> Real], \226\136\128 q : (Real) -> Real, \226\136\128 qs : List[(Real) -> Real], \226\136\128 r : (Real) -> Real, \226\136\128 rs : List[(Real) -> Real], \226\136\128 s : (Real) -> Real, \226\136\128 x : Real, \226\136\128 pts1 : List[Real], \226\136\128 pts2 : List[Real], \226\136\128 s1 : List[Sign], \226\136\128 s2 : List[Sign], \226\136\128 s3 : List[Sign], \226\136\128 rest : List[List[Sign]], \226\136\128 sgns : List[List[Sign]], interpmat(APPEND(pts1, CONS(x, pts2)), APPEND(CONS(p, ps), APPEND(CONS(q, qs), CONS(r, rs))), APPEND(sgns, CONS(APPEND(CONS(Unknown, s1), APPEND(CONS(Zero, s2), CONS(Neg, s3))), rest))) \226\134\146 LENGTH(ps) == LENGTH(s1) \226\134\146 LENGTH(qs) == LENGTH(s2) \226\134\146 ODD(LENGTH(sgns)) \226\134\146 LENGTH(sgns) == 2 * LENGTH(pts1) + 1 \226\134\146 (\226\136\128 x : Real, pow(a, n) * p(x) == s(x) * q(x) + r(x)) \226\134\146 op_lt_gt(a, real_of_num(0)) \226\134\146 EVEN(n) \226\134\146 interpmat(APPEND(pts1, CONS(x, pts2)), APPEND(CONS(p, ps), APPEND(CONS(q, qs), CONS(r, rs))), APPEND(sgns, CONS(APPEND(CONS(Neg, s1), APPEND(CONS(Zero, s2), CONS(Neg, s3))), rest)))
      #|  (x : Num) - 1 == PRE(x)
      #|  EVEN(LENGTH((sgns : List[_])) - 1)
      #|  (s : _)
      #|  (n : _)
      #|  (a : _)
      #|  !((l2 : List[_]) == NIL)
      #|  (pts : _)
      #|  DIV(LENGTH((sgns : List[_])) - 1, 2)
      #|  LENGTH(APPEND((sgns : List[List[Sign]]), CONS(APPEND(CONS(Unknown, (s1 : List[Sign])), APPEND(CONS(Zero, (s2 : List[Sign])), CONS(Neg, (s3 : List[Sign])))), (rest : List[List[Sign]])))) == LENGTH(partition_line((pts : List[Real])))
      #|  \226\136\128 a : Real, \226\136\128 n : Num, \226\136\128 p : (Real) -> Real, \226\136\128 ps : List[(Real) -> Real], \226\136\128 q : (Real) -> Real, \226\136\128 qs : List[(Real) -> Real], \226\136\128 pts : List[Real], \226\136\128 r : (Real) -> Real, \226\136\128 rs : List[(Real) -> Real], \226\136\128 s : (Real) -> Real, \226\136\128 s1 : List[Sign], \226\136\128 s2 : List[Sign], \226\136\128 s3 : List[Sign], \226\136\128 rest : List[List[Sign]], \226\136\128 sgns : List[List[Sign]], interpmat(pts, APPEND(CONS(p, ps), APPEND(CONS(q, qs), CONS(r, rs))), APPEND(sgns, CONS(APPEND(CONS(Unknown, s1), APPEND(CONS(Zero, s2), CONS(Neg, s3))), rest))) \226\134\146 LENGTH(ps) == LENGTH(s1) \226\134\146 LENGTH(qs) == LENGTH(s2) \226\134\146 ODD(LENGTH(sgns)) \226\134\146 (\226\136\128 x : Real, pow(a, n) * p(x) == s(x) * q(x) + r(x)) \226\134\146 op_lt_gt(a, real_of_num(0)) \226\134\146 EVEN(n) \226\134\146 interpmat(pts, APPEND(CONS(p, ps), APPEND(CONS(q, qs), CONS(r, rs))), APPEND(sgns, CONS(APPEND(CONS(Neg, s1), APPEND(CONS(Zero, s2), CONS(Neg, s3))), rest)))
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  !((x : Real) < (y : Real) && y < x)
      #|  (x : Real)
      #|  (r : (_) -> Real)((x : _)) == real_of_num(0)
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts1 : List[Real]))), [(x' : Real) => LAST(pts1) < x' && x' < (x : Real)])) == LENGTH((sgns : List[_]))
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  !((x : Real) < (y : Real) && y < x)
      #|  (x : Real)
      #|  (r : (_) -> Real)((x : _)) == real_of_num(0)
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts1 : List[Real]))), [(x' : Real) => LAST(pts1) < x' && x' < (x : Real)])) == LENGTH((sgns : List[_]))
      #|  APPEND(BUTLAST(partition_line((pts1 : List[Real]))), CONS((x' : Real) => LAST(pts1) < x' && x' < (x : Real), TL(partition_line(CONS(x, (pts2 : List[Real])))))) == APPEND(APPEND(BUTLAST(partition_line(pts1)), [(x' : Real) => LAST(pts1) < x' && x' < x]), TL(partition_line(CONS(x, pts2))))
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  !((x : Real) < (y : Real) && y < x)
      #|  (x : Real)
      #|  (r : (_) -> Real)((x : _)) == real_of_num(0)
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  \226\136\131 k : _, (sgns : List[_]) == [k]
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  !((x : Real) < (y : Real) && y < x)
      #|  (x : Real)
      #|  (r : (_) -> Real)((x : _)) == real_of_num(0)
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  \226\136\131 k : _, (sgns : List[_]) == [k]
      #|  (pts1 : List[_]) == NIL
      #|  pow((a : Real), (n : Num)) > real_of_num(0)
      #|  \226\136\128 a : Real, \226\136\128 n : Num, \226\136\128 p : (Real) -> Real, \226\136\128 ps : List[(Real) -> Real], \226\136\128 q : (Real) -> Real, \226\136\128 qs : List[(Real) -> Real], \226\136\128 r : (Real) -> Real, \226\136\128 rs : List[(Real) -> Real], \226\136\128 s : (Real) -> Real, \226\136\128 x : Real, \226\136\128 pts1 : List[Real], \226\136\128 pts2 : List[Real], \226\136\128 s1 : List[Sign], \226\136\128 s2 : List[Sign], \226\136\128 s3 : List[Sign], \226\136\128 rest : List[List[Sign]], \226\136\128 sgns : List[List[Sign]], interpmat(APPEND(pts1, CONS(x, pts2)), APPEND(CONS(p, ps), APPEND(CONS(q, qs), CONS(r, rs))), APPEND(sgns, CONS(APPEND(CONS(Unknown, s1), APPEND(CONS(Zero, s2), CONS(Zero, s3))), rest))) \226\134\146 LENGTH(ps) == LENGTH(s1) \226\134\146 LENGTH(qs) == LENGTH(s2) \226\134\146 ODD(LENGTH(sgns)) \226\134\146 LENGTH(sgns) == 2 * LENGTH(pts1) + 1 \226\134\146 (\226\136\128 x : Real, pow(a, n) * p(x) == s(x) * q(x) + r(x)) \226\134\146 op_lt_gt(a, real_of_num(0)) \226\134\146 EVEN(n) \226\134\146 interpmat(APPEND(pts1, CONS(x, pts2)), APPEND(CONS(p, ps), APPEND(CONS(q, qs), CONS(r, rs))), APPEND(sgns, CONS(APPEND(CONS(Zero, s1), APPEND(CONS(Zero, s2), CONS(Zero, s3))), rest)))
      #|  (x : Num) - 1 == PRE(x)
      #|  EVEN(LENGTH((sgns : List[_])) - 1)
      #|  (s : _)
      #|  (n : _)
      #|  (a : _)
      #|  !((l2 : List[_]) == NIL)
      #|  (pts : _)
      #|  DIV(LENGTH((sgns : List[_])) - 1, 2)
      #|  LENGTH(APPEND((sgns : List[List[Sign]]), CONS(APPEND(CONS(Unknown, (s1 : List[Sign])), APPEND(CONS(Zero, (s2 : List[Sign])), CONS(Zero, (s3 : List[Sign])))), (rest : List[List[Sign]])))) == LENGTH(partition_line((pts : List[Real])))
      #|  \226\136\128 a : Real, \226\136\128 n : Num, \226\136\128 p : (Real) -> Real, \226\136\128 ps : List[(Real) -> Real], \226\136\128 q : (Real) -> Real, \226\136\128 qs : List[(Real) -> Real], \226\136\128 pts : List[Real], \226\136\128 r : (Real) -> Real, \226\136\128 rs : List[(Real) -> Real], \226\136\128 s : (Real) -> Real, \226\136\128 s1 : List[Sign], \226\136\128 s2 : List[Sign], \226\136\128 s3 : List[Sign], \226\136\128 rest : List[List[Sign]], \226\136\128 sgns : List[List[Sign]], interpmat(pts, APPEND(CONS(p, ps), APPEND(CONS(q, qs), CONS(r, rs))), APPEND(sgns, CONS(APPEND(CONS(Unknown, s1), APPEND(CONS(Zero, s2), CONS(Zero, s3))), rest))) \226\134\146 LENGTH(ps) == LENGTH(s1) \226\134\146 LENGTH(qs) == LENGTH(s2) \226\134\146 ODD(LENGTH(sgns)) \226\134\146 (\226\136\128 x : Real, pow(a, n) * p(x) == s(x) * q(x) + r(x)) \226\134\146 op_lt_gt(a, real_of_num(0)) \226\134\146 EVEN(n) \226\134\146 interpmat(pts, APPEND(CONS(p, ps), APPEND(CONS(q, qs), CONS(r, rs))), APPEND(sgns, CONS(APPEND(CONS(Zero, s1), APPEND(CONS(Zero, s2), CONS(Zero, s3))), rest)))
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  !((x : Real) < (y : Real) && y < x)
      #|  (x : Real)
      #|  (r : (_) -> Real)((x : _)) > real_of_num(0)
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts1 : List[Real]))), [(x' : Real) => LAST(pts1) < x' && x' < (x : Real)])) == LENGTH((sgns : List[_]))
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  !((x : Real) < (y : Real) && y < x)
      #|  (x : Real)
      #|  (r : (_) -> Real)((x : _)) > real_of_num(0)
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts1 : List[Real]))), [(x' : Real) => LAST(pts1) < x' && x' < (x : Real)])) == LENGTH((sgns : List[_]))
      #|  APPEND(BUTLAST(partition_line((pts1 : List[Real]))), CONS((x' : Real) => LAST(pts1) < x' && x' < (x : Real), TL(partition_line(CONS(x, (pts2 : List[Real])))))) == APPEND(APPEND(BUTLAST(partition_line(pts1)), [(x' : Real) => LAST(pts1) < x' && x' < x]), TL(partition_line(CONS(x, pts2))))
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  !((x : Real) < (y : Real) && y < x)
      #|  (x : Real)
      #|  (r : (_) -> Real)((x : _)) > real_of_num(0)
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  \226\136\131 k : _, (sgns : List[_]) == [k]
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  !((x : Real) < (y : Real) && y < x)
      #|  (x : Real)
      #|  (r : (_) -> Real)((x : _)) > real_of_num(0)
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  \226\136\131 k : _, (sgns : List[_]) == [k]
      #|  (pts1 : List[_]) == NIL
      #|  pow((a : Real), (n : Num)) > real_of_num(0)
      #|  \226\136\128 a : Real, \226\136\128 n : Num, \226\136\128 p : (Real) -> Real, \226\136\128 ps : List[(Real) -> Real], \226\136\128 q : (Real) -> Real, \226\136\128 qs : List[(Real) -> Real], \226\136\128 r : (Real) -> Real, \226\136\128 rs : List[(Real) -> Real], \226\136\128 s : (Real) -> Real, \226\136\128 x : Real, \226\136\128 pts1 : List[Real], \226\136\128 pts2 : List[Real], \226\136\128 s1 : List[Sign], \226\136\128 s2 : List[Sign], \226\136\128 s3 : List[Sign], \226\136\128 rest : List[List[Sign]], \226\136\128 sgns : List[List[Sign]], interpmat(APPEND(pts1, CONS(x, pts2)), APPEND(CONS(p, ps), APPEND(CONS(q, qs), CONS(r, rs))), APPEND(sgns, CONS(APPEND(CONS(Unknown, s1), APPEND(CONS(Zero, s2), CONS(Pos, s3))), rest))) \226\134\146 LENGTH(ps) == LENGTH(s1) \226\134\146 LENGTH(qs) == LENGTH(s2) \226\134\146 ODD(LENGTH(sgns)) \226\134\146 LENGTH(sgns) == 2 * LENGTH(pts1) + 1 \226\134\146 (\226\136\128 x : Real, pow(a, n) * p(x) == s(x) * q(x) + r(x)) \226\134\146 a > real_of_num(0) \226\134\146 interpmat(APPEND(pts1, CONS(x, pts2)), APPEND(CONS(p, ps), APPEND(CONS(q, qs), CONS(r, rs))), APPEND(sgns, CONS(APPEND(CONS(Pos, s1), APPEND(CONS(Zero, s2), CONS(Pos, s3))), rest)))
      #|  (x : Num) - 1 == PRE(x)
      #|  EVEN(LENGTH((sgns : List[_])) - 1)
      #|  (s : _)
      #|  (n : _)
      #|  (a : _)
      #|  !((l2 : List[_]) == NIL)
      #|  (pts : _)
      #|  DIV(LENGTH((sgns : List[_])) - 1, 2)
      #|  LENGTH(APPEND((sgns : List[List[Sign]]), CONS(APPEND(CONS(Unknown, (s1 : List[Sign])), APPEND(CONS(Zero, (s2 : List[Sign])), CONS(Pos, (s3 : List[Sign])))), (rest : List[List[Sign]])))) == LENGTH(partition_line((pts : List[Real])))
      #|  \226\136\128 a : Real, \226\136\128 n : Num, \226\136\128 p : (Real) -> Real, \226\136\128 ps : List[(Real) -> Real], \226\136\128 q : (Real) -> Real, \226\136\128 qs : List[(Real) -> Real], \226\136\128 pts : List[Real], \226\136\128 r : (Real) -> Real, \226\136\128 rs : List[(Real) -> Real], \226\136\128 s : (Real) -> Real, \226\136\128 s1 : List[Sign], \226\136\128 s2 : List[Sign], \226\136\128 s3 : List[Sign], \226\136\128 rest : List[List[Sign]], \226\136\128 sgns : List[List[Sign]], interpmat(pts, APPEND(CONS(p, ps), APPEND(CONS(q, qs), CONS(r, rs))), APPEND(sgns, CONS(APPEND(CONS(Unknown, s1), APPEND(CONS(Zero, s2), CONS(Pos, s3))), rest))) \226\134\146 LENGTH(ps) == LENGTH(s1) \226\134\146 LENGTH(qs) == LENGTH(s2) \226\134\146 ODD(LENGTH(sgns)) \226\134\146 (\226\136\128 x : Real, pow(a, n) * p(x) == s(x) * q(x) + r(x)) \226\134\146 a > real_of_num(0) \226\134\146 interpmat(pts, APPEND(CONS(p, ps), APPEND(CONS(q, qs), CONS(r, rs))), APPEND(sgns, CONS(APPEND(CONS(Pos, s1), APPEND(CONS(Zero, s2), CONS(Pos, s3))), rest)))
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  !((x : Real) < (y : Real) && y < x)
      #|  (x : Real)
      #|  (r : (_) -> Real)((x : _)) < real_of_num(0)
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts1 : List[Real]))), [(x' : Real) => LAST(pts1) < x' && x' < (x : Real)])) == LENGTH((sgns : List[_]))
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  !((x : Real) < (y : Real) && y < x)
      #|  (x : Real)
      #|  (r : (_) -> Real)((x : _)) < real_of_num(0)
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts1 : List[Real]))), [(x' : Real) => LAST(pts1) < x' && x' < (x : Real)])) == LENGTH((sgns : List[_]))
      #|  APPEND(BUTLAST(partition_line((pts1 : List[Real]))), CONS((x' : Real) => LAST(pts1) < x' && x' < (x : Real), TL(partition_line(CONS(x, (pts2 : List[Real])))))) == APPEND(APPEND(BUTLAST(partition_line(pts1)), [(x' : Real) => LAST(pts1) < x' && x' < x]), TL(partition_line(CONS(x, pts2))))
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  !((x : Real) < (y : Real) && y < x)
      #|  (x : Real)
      #|  (r : (_) -> Real)((x : _)) < real_of_num(0)
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  \226\136\131 k : _, (sgns : List[_]) == [k]
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  !((x : Real) < (y : Real) && y < x)
      #|  (x : Real)
      #|  (r : (_) -> Real)((x : _)) < real_of_num(0)
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  \226\136\131 k : _, (sgns : List[_]) == [k]
      #|  (pts1 : List[_]) == NIL
      #|  pow((a : Real), (n : Num)) > real_of_num(0)
      #|  \226\136\128 a : Real, \226\136\128 n : Num, \226\136\128 p : (Real) -> Real, \226\136\128 ps : List[(Real) -> Real], \226\136\128 q : (Real) -> Real, \226\136\128 qs : List[(Real) -> Real], \226\136\128 r : (Real) -> Real, \226\136\128 rs : List[(Real) -> Real], \226\136\128 s : (Real) -> Real, \226\136\128 x : Real, \226\136\128 pts1 : List[Real], \226\136\128 pts2 : List[Real], \226\136\128 s1 : List[Sign], \226\136\128 s2 : List[Sign], \226\136\128 s3 : List[Sign], \226\136\128 rest : List[List[Sign]], \226\136\128 sgns : List[List[Sign]], interpmat(APPEND(pts1, CONS(x, pts2)), APPEND(CONS(p, ps), APPEND(CONS(q, qs), CONS(r, rs))), APPEND(sgns, CONS(APPEND(CONS(Unknown, s1), APPEND(CONS(Zero, s2), CONS(Neg, s3))), rest))) \226\134\146 LENGTH(ps) == LENGTH(s1) \226\134\146 LENGTH(qs) == LENGTH(s2) \226\134\146 ODD(LENGTH(sgns)) \226\134\146 LENGTH(sgns) == 2 * LENGTH(pts1) + 1 \226\134\146 (\226\136\128 x : Real, pow(a, n) * p(x) == s(x) * q(x) + r(x)) \226\134\146 a > real_of_num(0) \226\134\146 interpmat(APPEND(pts1, CONS(x, pts2)), APPEND(CONS(p, ps), APPEND(CONS(q, qs), CONS(r, rs))), APPEND(sgns, CONS(APPEND(CONS(Neg, s1), APPEND(CONS(Zero, s2), CONS(Neg, s3))), rest)))
      #|  (x : Num) - 1 == PRE(x)
      #|  EVEN(LENGTH((sgns : List[_])) - 1)
      #|  (s : _)
      #|  (n : _)
      #|  (a : _)
      #|  !((l2 : List[_]) == NIL)
      #|  (pts : _)
      #|  DIV(LENGTH((sgns : List[_])) - 1, 2)
      #|  LENGTH(APPEND((sgns : List[List[Sign]]), CONS(APPEND(CONS(Unknown, (s1 : List[Sign])), APPEND(CONS(Zero, (s2 : List[Sign])), CONS(Neg, (s3 : List[Sign])))), (rest : List[List[Sign]])))) == LENGTH(partition_line((pts : List[Real])))
      #|  \226\136\128 a : Real, \226\136\128 n : Num, \226\136\128 p : (Real) -> Real, \226\136\128 ps : List[(Real) -> Real], \226\136\128 q : (Real) -> Real, \226\136\128 qs : List[(Real) -> Real], \226\136\128 pts : List[Real], \226\136\128 r : (Real) -> Real, \226\136\128 rs : List[(Real) -> Real], \226\136\128 s : (Real) -> Real, \226\136\128 s1 : List[Sign], \226\136\128 s2 : List[Sign], \226\136\128 s3 : List[Sign], \226\136\128 rest : List[List[Sign]], \226\136\128 sgns : List[List[Sign]], interpmat(pts, APPEND(CONS(p, ps), APPEND(CONS(q, qs), CONS(r, rs))), APPEND(sgns, CONS(APPEND(CONS(Unknown, s1), APPEND(CONS(Zero, s2), CONS(Neg, s3))), rest))) \226\134\146 LENGTH(ps) == LENGTH(s1) \226\134\146 LENGTH(qs) == LENGTH(s2) \226\134\146 ODD(LENGTH(sgns)) \226\134\146 (\226\136\128 x : Real, pow(a, n) * p(x) == s(x) * q(x) + r(x)) \226\134\146 a > real_of_num(0) \226\134\146 interpmat(pts, APPEND(CONS(p, ps), APPEND(CONS(q, qs), CONS(r, rs))), APPEND(sgns, CONS(APPEND(CONS(Neg, s1), APPEND(CONS(Zero, s2), CONS(Neg, s3))), rest)))
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  !((x : Real) < (y : Real) && y < x)
      #|  (x : Real)
      #|  (r : (_) -> Real)((x : _)) == real_of_num(0)
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts1 : List[Real]))), [(x' : Real) => LAST(pts1) < x' && x' < (x : Real)])) == LENGTH((sgns : List[_]))
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  !((x : Real) < (y : Real) && y < x)
      #|  (x : Real)
      #|  (r : (_) -> Real)((x : _)) == real_of_num(0)
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  LENGTH(APPEND(BUTLAST(partition_line((pts1 : List[Real]))), [(x' : Real) => LAST(pts1) < x' && x' < (x : Real)])) == LENGTH((sgns : List[_]))
      #|  APPEND(BUTLAST(partition_line((pts1 : List[Real]))), CONS((x' : Real) => LAST(pts1) < x' && x' < (x : Real), TL(partition_line(CONS(x, (pts2 : List[Real])))))) == APPEND(APPEND(BUTLAST(partition_line(pts1)), [(x' : Real) => LAST(pts1) < x' && x' < x]), TL(partition_line(CONS(x, pts2))))
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  !((x : Real) < (y : Real) && y < x)
      #|  (x : Real)
      #|  (r : (_) -> Real)((x : _)) == real_of_num(0)
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  \226\136\131 k : _, (sgns : List[_]) == [k]
      #|  (x : Real) < (y : Real) \226\134\146 !(x == y)
      #|  !((x : Real) < (y : Real) && y < x)
      #|  (x : Real)
      #|  (r : (_) -> Real)((x : _)) == real_of_num(0)
      #|  (q : (_) -> Real)((x : _)) == real_of_num(0)
      #|  \226\136\131 k : _, (sgns : List[_]) == [k]
      #|  (pts1 : List[_]) == NIL
      #|  pow((a : Real), (n : Num)) > real_of_num(0)
      #|  \226\136\128 a : Real, \226\136\128 n : Num, \226\136\128 p : (Real) -> Real, \226\136\128 ps : List[(Real) -> Real], \226\136\128 q : (Real) -> Real, \226\136\128 qs : List[(Real) -> Real], \226\136\128 r : (Real) -> Real, \226\136\128 rs : List[(Real) -> Real], \226\136\128 s : (Real) -> Real, \226\136\128 x : Real, \226\136\128 pts1 : List[Real], \226\136\128 pts2 : List[Real], \226\136\128 s1 : List[Sign], \226\136\128 s2 : List[Sign], \226\136\128 s3 : List[Sign], \226\136\128 rest : List[List[Sign]], \226\136\128 sgns : List[List[Sign]], interpmat(APPEND(pts1, CONS(x, pts2)), APPEND(CONS(p, ps), APPEND(CONS(q, qs), CONS(r, rs))), APPEND(sgns, CONS(APPEND(CONS(Unknown, s1), APPEND(CONS(Zero, s2), CONS(Zero, s3))), rest))) \226\134\146 LENGTH(ps) == LENGTH(s1) \226\134\146 LENGTH(qs) == LENGTH(s2) \226\134\146 ODD(LENGTH(sgns)) \226\134\146 LENGTH(sgns) == 2 * LENGTH(pts1) + 1 \226\134\146 (\226\136\128 x : Real, pow(a, n) * p(x) == s(x) * q(x) + r(x)) \226\134\146 a > real_of_num(0) \226\134\146 interpmat(APPEND(pts1, CONS(x, pts2)), APPEND(CONS(p, ps), APPEND(CONS(q, qs), CONS(r, rs))), APPEND(sgns, CONS(APPEND(CONS(Zero, s1), APPEND(CONS(Zero, s2), CONS(Zero, s3))), rest)))
      #|  (x : Num) - 1 == PRE(x)
      #|  EVEN(LENGTH((sgns : List[_])) - 1)
      #|  (s : _)
      #|  (n : _)
      #|  (a : _)
      #|  !((l2 : List[_]) == NIL)
      #|  (pts : _)
      #|  DIV(LENGTH((sgns : List[_])) - 1, 2)
      #|  LENGTH(APPEND((sgns : List[List[Sign]]), CONS(APPEND(CONS(Unknown, (s1 : List[Sign])), APPEND(CONS(Zero, (s2 : List[Sign])), CONS(Zero, (s3 : List[Sign])))), (rest : List[List[Sign]])))) == LENGTH(partition_line((pts : List[Real])))
      #|  \226\136\128 a : Real, \226\136\128 n : Num, \226\136\128 p : (Real) -> Real, \226\136\128 ps : List[(Real) -> Real], \226\136\128 q : (Real) -> Real, \226\136\128 qs : List[(Real) -> Real], \226\136\128 pts : List[Real], \226\136\128 r : (Real) -> Real, \226\136\128 rs : List[(Real) -> Real], \226\136\128 s : (Real) -> Real, \226\136\128 s1 : List[Sign], \226\136\128 s2 : List[Sign], \226\136\128 s3 : List[Sign], \226\136\128 rest : List[List[Sign]], \226\136\128 sgns : List[List[Sign]], interpmat(pts, APPEND(CONS(p, ps), APPEND(CONS(q, qs), CONS(r, rs))), APPEND(sgns, CONS(APPEND(CONS(Unknown, s1), APPEND(CONS(Zero, s2), CONS(Zero, s3))), rest))) \226\134\146 LENGTH(ps) == LENGTH(s1) \226\134\146 LENGTH(qs) == LENGTH(s2) \226\134\146 ODD(LENGTH(sgns)) \226\134\146 (\226\136\128 x : Real, pow(a, n) * p(x) == s(x) * q(x) + r(x)) \226\134\146 a > real_of_num(0) \226\134\146 interpmat(pts, APPEND(CONS(p, ps), APPEND(CONS(q, qs), CONS(r, rs))), APPEND(sgns, CONS(APPEND(CONS(Zero, s1), APPEND(CONS(Zero, s2), CONS(Zero, s3))), rest)))
      #|INTERPSIGNS_CONJ =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\P:fun(real,bool). (#forall:fun(fun(fun(real,bool),bool),bool) (\Q:fun(real,bool). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\eqs:list(fun(real,real)). (#forall:fun(fun(list(sign),bool),bool) (\l:list(sign). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#interpsigns:fun(list(fun(real,real)),fun(fun(real,bool),fun(list(sign),bool))) eqs:list(fun(real,real))) (\x:real. (P:fun(real,bool) x:real))) l:list(sign))) (((#interpsigns:fun(list(fun(real,real)),fun(fun(real,bool),fun(list(sign),bool))) eqs:list(fun(real,real))) (\x:real. (Q:fun(real,bool) x:real))) l:list(sign)))) (((#interpsigns:fun(list(fun(real,real)),fun(fun(real,bool),fun(list(sign),bool))) eqs:list(fun(real,real))) (\x:real. ((#\/:fun(bool,fun(bool,bool)) (P:fun(real,bool) x:real)) (Q:fun(real,bool) x:real)))) l:list(sign)))))))))))
      #|INTERPMAT_TRIO =  |- (#forall:fun(fun(list(fun(real,real)),bool),bool) (\eqs:list(fun(real,real)). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(list(sign),bool),bool) (\l:list(sign). (#forall:fun(fun(list(list(sign)),bool),bool) (\r:list(list(sign)). (#forall:fun(fun(list(real),bool),bool) (\t:list(real). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#CONS:fun(real,fun(list(real),list(real))) x:real) ((#CONS:fun(real,fun(list(real),list(real))) y:real) t:list(real)))) eqs:list(fun(real,real))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) l:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) l:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) l:list(sign)) r:list(list(sign))))))) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#CONS:fun(real,fun(list(real),list(real))) y:real) t:list(real))) eqs:list(fun(real,real))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) l:list(sign)) r:list(list(sign)))))))))))))))))
      #|PARTITION_LINE_NOT_NIL =  |- (#forall:fun(fun(list(real),bool),bool) (\l:list(real). (#~:fun(bool,bool) ((#=:fun(list(fun(real,bool)),fun(list(fun(real,bool)),bool)) (#partition_line:fun(list(real),list(fun(real,bool))) l:list(real))) #NIL:list(fun(real,bool))))))
      #|ALL2_LENGTH =  |- (#forall:fun(fun(fun('?1,fun('?2,bool)),bool),bool) (\P:fun('?1,fun('?2,bool)). (#forall:fun(fun(list('?1),bool),bool) (\l1:list('?1). (#forall:fun(fun(list('?2),bool),bool) (\l2:list('?2). ((#==>:fun(bool,fun(bool,bool)) (((#ALL2:fun(fun('?1,fun('?2,bool)),fun(list('?1),fun(list('?2),bool))) P:fun('?1,fun('?2,bool))) l1:list('?1)) l2:list('?2))) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list('?1),num) l1:list('?1))) (#LENGTH:fun(list('?2),num) l2:list('?2))))))))))
      #|LENGTH_TL =  |- (#forall:fun(fun(list('A),bool),bool) (\l:list('A). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(list('A),fun(list('A),bool)) l:list('A)) #NIL:list('A)))) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list('A),num) (#TL:fun(list('A),list('A)) l:list('A)))) (#PRE:fun(num,num) (#LENGTH:fun(list('A),num) l:list('A)))))))
      #|PARTITION_LINE_LENGTH =  |- (#forall:fun(fun(list(real),bool),bool) (\l:list(real). ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,bool)),num) (#partition_line:fun(list(real),list(fun(real,bool))) l:list(real)))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) l:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|PARTITION_LINE_LENGTH_TL =  |- (#forall:fun(fun(list(real),bool),bool) (\l:list(real). ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,bool)),num) (#TL:fun(list(fun(real,bool)),list(fun(real,bool))) (#partition_line:fun(list(real),list(fun(real,bool))) l:list(real))))) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) l:list(real))))))
      #|PL_ALL2_LENGTH =  |- (#forall:fun(fun(list(fun(real,real)),bool),bool) (\eqs:list(fun(real,real)). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). ((#==>:fun(bool,fun(bool,bool)) (((#ALL2:fun(fun(fun(real,bool),fun(list(sign),bool)),fun(list(fun(real,bool)),fun(list(list(sign)),bool))) (#interpsigns:fun(list(fun(real,real)),fun(fun(real,bool),fun(list(sign),bool))) eqs:list(fun(real,real)))) (#partition_line:fun(list(real),list(fun(real,bool))) pts:list(real))) sgns:list(list(sign)))) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign)))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))
      #|INTERPMAT_LENGTH =  |- (#forall:fun(fun(list(fun(real,real)),bool),bool) (\eqs:list(fun(real,real)). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) eqs:list(fun(real,real))) sgns:list(list(sign)))) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign)))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))
      #|ALL2_HD =  |- (#forall:fun(fun(list('?3),bool),bool) (\b:list('?3). (#forall:fun(fun(list('?4),bool),bool) (\d:list('?4). (#forall:fun(fun(list('?3),bool),bool) (\a:list('?3). (#forall:fun(fun(list('?4),bool),bool) (\c:list('?4). ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list('?3),num) a:list('?3))) (#LENGTH:fun(list('?4),num) c:list('?4)))) ((#==>:fun(bool,fun(bool,bool)) (((#ALL2:fun(fun('?3,fun('?4,bool)),fun(list('?3),fun(list('?4),bool))) P:fun('?3,fun('?4,bool))) ((#APPEND:fun(list('?3),fun(list('?3),list('?3))) a:list('?3)) b:list('?3))) ((#APPEND:fun(list('?4),fun(list('?4),list('?4))) c:list('?4)) d:list('?4)))) (((#ALL2:fun(fun('?3,fun('?4,bool)),fun(list('?3),fun(list('?4),bool))) P:fun('?3,fun('?4,bool))) a:list('?3)) c:list('?4))))))))))))
      #|ALL2_TL =  |- (#forall:fun(fun(list('?5),bool),bool) (\b:list('?5). (#forall:fun(fun(list('?6),bool),bool) (\d:list('?6). (#forall:fun(fun(list('?5),bool),bool) (\a:list('?5). (#forall:fun(fun(list('?6),bool),bool) (\c:list('?6). ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list('?5),num) a:list('?5))) (#LENGTH:fun(list('?6),num) c:list('?6)))) ((#==>:fun(bool,fun(bool,bool)) (((#ALL2:fun(fun('?5,fun('?6,bool)),fun(list('?5),fun(list('?6),bool))) P:fun('?5,fun('?6,bool))) ((#APPEND:fun(list('?5),fun(list('?5),list('?5))) a:list('?5)) b:list('?5))) ((#APPEND:fun(list('?6),fun(list('?6),list('?6))) c:list('?6)) d:list('?6)))) (((#ALL2:fun(fun('?5,fun('?6,bool)),fun(list('?5),fun(list('?6),bool))) P:fun('?5,fun('?6,bool))) b:list('?5)) d:list('?6))))))))))))
      #|ALL2_APPEND_LENGTH =  |- (#forall:fun(fun(fun('?7,fun('?8,bool)),bool),bool) (\P:fun('?7,fun('?8,bool)). (#forall:fun(fun(list('?7),bool),bool) (\a:list('?7). (#forall:fun(fun(list('?8),bool),bool) (\c:list('?8). (#forall:fun(fun(list('?7),bool),bool) (\b:list('?7). (#forall:fun(fun(list('?8),bool),bool) (\d:list('?8). ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list('?7),num) a:list('?7))) (#LENGTH:fun(list('?8),num) c:list('?8)))) ((#==>:fun(bool,fun(bool,bool)) (((#ALL2:fun(fun('?7,fun('?8,bool)),fun(list('?7),fun(list('?8),bool))) P:fun('?7,fun('?8,bool))) ((#APPEND:fun(list('?7),fun(list('?7),list('?7))) a:list('?7)) b:list('?7))) ((#APPEND:fun(list('?8),fun(list('?8),list('?8))) c:list('?8)) d:list('?8)))) ((#/\:fun(bool,fun(bool,bool)) (((#ALL2:fun(fun('?7,fun('?8,bool)),fun(list('?7),fun(list('?8),bool))) P:fun('?7,fun('?8,bool))) a:list('?7)) c:list('?8))) (((#ALL2:fun(fun('?7,fun('?8,bool)),fun(list('?7),fun(list('?8),bool))) P:fun('?7,fun('?8,bool))) b:list('?7)) d:list('?8)))))))))))))))
      #|ALL2_APPEND =  |- (#forall:fun(fun(list('?9),bool),bool) (\a:list('?9). (#forall:fun(fun(list('?10),bool),bool) (\c:list('?10). (#forall:fun(fun(list('?9),bool),bool) (\b:list('?9). (#forall:fun(fun(list('?10),bool),bool) (\d:list('?10). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#ALL2:fun(fun('?9,fun('?10,bool)),fun(list('?9),fun(list('?10),bool))) P:fun('?9,fun('?10,bool))) a:list('?9)) c:list('?10))) (((#ALL2:fun(fun('?9,fun('?10,bool)),fun(list('?9),fun(list('?10),bool))) P:fun('?9,fun('?10,bool))) b:list('?9)) d:list('?10)))) (((#ALL2:fun(fun('?9,fun('?10,bool)),fun(list('?9),fun(list('?10),bool))) P:fun('?9,fun('?10,bool))) ((#APPEND:fun(list('?9),fun(list('?9),list('?9))) a:list('?9)) b:list('?9))) ((#APPEND:fun(list('?10),fun(list('?10),list('?10))) c:list('?10)) d:list('?10))))))))))))
      #|ALL2_SPLIT =  |- (#forall:fun(fun(list('?11),bool),bool) (\a:list('?11). (#forall:fun(fun(list('?12),bool),bool) (\c:list('?12). (#forall:fun(fun(list('?11),bool),bool) (\b:list('?11). (#forall:fun(fun(list('?12),bool),bool) (\d:list('?12). ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list('?11),num) a:list('?11))) (#LENGTH:fun(list('?12),num) c:list('?12)))) ((#=:fun(bool,fun(bool,bool)) (((#ALL2:fun(fun('?11,fun('?12,bool)),fun(list('?11),fun(list('?12),bool))) P:fun('?11,fun('?12,bool))) ((#APPEND:fun(list('?11),fun(list('?11),list('?11))) a:list('?11)) b:list('?11))) ((#APPEND:fun(list('?12),fun(list('?12),list('?12))) c:list('?12)) d:list('?12)))) ((#/\:fun(bool,fun(bool,bool)) (((#ALL2:fun(fun('?11,fun('?12,bool)),fun(list('?11),fun(list('?12),bool))) P:fun('?11,fun('?12,bool))) a:list('?11)) c:list('?12))) (((#ALL2:fun(fun('?11,fun('?12,bool)),fun(list('?11),fun(list('?12),bool))) P:fun('?11,fun('?12,bool))) b:list('?11)) d:list('?12)))))))))))))
      #|BUTLAST_THM =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(list('?13),fun(list('?13),bool)) (#BUTLAST:fun(list('?13),list('?13)) #NIL:list('?13))) #NIL:list('?13))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(list('?14),fun(list('?14),bool)) (#BUTLAST:fun(list('?14),list('?14)) ((#CONS:fun('?14,fun(list('?14),list('?14))) x:'?14) #NIL:list('?14)))) #NIL:list('?14))) ((#=:fun(list('?15),fun(list('?15),bool)) (#BUTLAST:fun(list('?15),list('?15)) ((#CONS:fun('?15,fun(list('?15),list('?15))) h1:'?15) ((#CONS:fun('?15,fun(list('?15),list('?15))) h2:'?15) t:list('?15))))) ((#CONS:fun('?15,fun(list('?15),list('?15))) h1:'?15) (#BUTLAST:fun(list('?15),list('?15)) ((#CONS:fun('?15,fun(list('?15),list('?15))) h2:'?15) t:list('?15)))))))
      #|HD_BUTLAST =  |- (#forall:fun(fun(list('?16),bool),bool) (\l:list('?16). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(list('?16),fun(list('?16),bool)) l:list('?16)) #NIL:list('?16)))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('?16,bool),bool) (\x:'?16. (#~:fun(bool,bool) ((#=:fun(list('?16),fun(list('?16),bool)) l:list('?16)) ((#CONS:fun('?16,fun(list('?16),list('?16))) x:'?16) #NIL:list('?16))))))) ((#=:fun('?16,fun('?16,bool)) (#HD:fun(list('?16),'?16) (#BUTLAST:fun(list('?16),list('?16)) l:list('?16)))) (#HD:fun(list('?16),'?16) l:list('?16)))))))
      #|SUBLIST =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#SUBLIST:fun(list('?17),fun(list('?17),bool)) l:list('?17)) #NIL:list('?17))) ((#=:fun(list('?17),fun(list('?17),bool)) l:list('?17)) #NIL:list('?17)))) ((#=:fun(bool,fun(bool,bool)) ((#SUBLIST:fun(list('?17),fun(list('?17),bool)) l:list('?17)) ((#CONS:fun('?17,fun(list('?17),list('?17))) h:'?17) t:list('?17)))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(list('?17),fun(list('?17),bool)) l:list('?17)) #NIL:list('?17))) ((#\/:fun(bool,fun(bool,bool)) ((#SUBLIST:fun(list('?17),fun(list('?17),bool)) l:list('?17)) t:list('?17))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('?17,fun('?17,bool)) (#HD:fun(list('?17),'?17) l:list('?17))) h:'?17)) ((#SUBLIST:fun(list('?17),fun(list('?17),bool)) (#TL:fun(list('?17),list('?17)) l:list('?17))) t:list('?17)))))))
      #|SUBLIST_NIL =  |- (#forall:fun(fun(list('?18),bool),bool) (\l:list('?18). ((#SUBLIST:fun(list('?18),fun(list('?18),bool)) #NIL:list('?18)) l:list('?18))))
      #|SUBLIST_CONS =  |- (#forall:fun(fun(list('?19),bool),bool) (\l1:list('?19). (#forall:fun(fun(list('?19),bool),bool) (\l2:list('?19). (#forall:fun(fun('?19,bool),bool) (\h:'?19. ((#==>:fun(bool,fun(bool,bool)) ((#SUBLIST:fun(list('?19),fun(list('?19),bool)) l1:list('?19)) l2:list('?19))) ((#SUBLIST:fun(list('?19),fun(list('?19),bool)) l1:list('?19)) ((#CONS:fun('?19,fun(list('?19),list('?19))) h:'?19) l2:list('?19))))))))))
      #|SUBLIST_TL =  |- (#forall:fun(fun(list('?20),bool),bool) (\l1:list('?20). (#forall:fun(fun(list('?20),bool),bool) (\l2:list('?20). ((#==>:fun(bool,fun(bool,bool)) ((#SUBLIST:fun(list('?20),fun(list('?20),bool)) l1:list('?20)) l2:list('?20))) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(list('?20),fun(list('?20),bool)) l1:list('?20)) #NIL:list('?20)))) ((#SUBLIST:fun(list('?20),fun(list('?20),bool)) (#TL:fun(list('?20),list('?20)) l1:list('?20))) l2:list('?20))))))))
      #|SUBLIST_CONS2 =  |- (#forall:fun(fun('?21,bool),bool) (\h:'?21. (#forall:fun(fun(list('?21),bool),bool) (\t:list('?21). (#forall:fun(fun(list('?21),bool),bool) (\l:list('?21). ((#==>:fun(bool,fun(bool,bool)) ((#SUBLIST:fun(list('?21),fun(list('?21),bool)) ((#CONS:fun('?21,fun(list('?21),list('?21))) h:'?21) t:list('?21))) l:list('?21))) ((#SUBLIST:fun(list('?21),fun(list('?21),bool)) t:list('?21)) l:list('?21)))))))))
      #|SUBLIST_ID =  |- (#forall:fun(fun(list('?22),bool),bool) (\l:list('?22). ((#SUBLIST:fun(list('?22),fun(list('?22),bool)) l:list('?22)) l:list('?22))))
      #|SUBLIST_CONS_CONS =  |- (#forall:fun(fun('?23,bool),bool) (\h:'?23. (#forall:fun(fun(list('?23),bool),bool) (\t1:list('?23). (#forall:fun(fun(list('?23),bool),bool) (\t2:list('?23). ((#=:fun(bool,fun(bool,bool)) ((#SUBLIST:fun(list('?23),fun(list('?23),bool)) ((#CONS:fun('?23,fun(list('?23),list('?23))) h:'?23) t1:list('?23))) ((#CONS:fun('?23,fun(list('?23),list('?23))) h:'?23) t2:list('?23)))) ((#SUBLIST:fun(list('?23),fun(list('?23),bool)) t1:list('?23)) t2:list('?23)))))))))
      #|SUBLIST_NEQ =  |- (#forall:fun(fun('?24,bool),bool) (\h1:'?24. (#forall:fun(fun('?24,bool),bool) (\h2:'?24. (#forall:fun(fun(list('?24),bool),bool) (\t1:list('?24). (#forall:fun(fun(list('?24),bool),bool) (\t2:list('?24). ((#==>:fun(bool,fun(bool,bool)) ((#SUBLIST:fun(list('?24),fun(list('?24),bool)) ((#CONS:fun('?24,fun(list('?24),list('?24))) h1:'?24) t1:list('?24))) ((#CONS:fun('?24,fun(list('?24),list('?24))) h2:'?24) t2:list('?24)))) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('?24,fun('?24,bool)) h1:'?24) h2:'?24))) ((#SUBLIST:fun(list('?24),fun(list('?24),bool)) ((#CONS:fun('?24,fun(list('?24),list('?24))) h1:'?24) t1:list('?24))) t2:list('?24))))))))))))
      #|SUBLIST_TRANS =  |- (#forall:fun(fun(list('?25),bool),bool) (\l1:list('?25). (#forall:fun(fun(list('?25),bool),bool) (\l2:list('?25). (#forall:fun(fun(list('?25),bool),bool) (\l3:list('?25). ((#==>:fun(bool,fun(bool,bool)) ((#SUBLIST:fun(list('?25),fun(list('?25),bool)) l1:list('?25)) l2:list('?25))) ((#==>:fun(bool,fun(bool,bool)) ((#SUBLIST:fun(list('?25),fun(list('?25),bool)) l2:list('?25)) l3:list('?25))) ((#SUBLIST:fun(list('?25),fun(list('?25),bool)) l1:list('?25)) l3:list('?25))))))))))
      #|ROL_MEM =  |- (#forall:fun(fun(real,bool),bool) (\h:real. (#forall:fun(fun(list(real),bool),bool) (\t:list(real). ((#==>:fun(bool,fun(bool,bool)) (#real_ordered_list:fun(list(real),bool) ((#CONS:fun(real,fun(list(real),list(real))) h:real) t:list(real)))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#MEM:fun(real,fun(list(real),bool)) x:real) t:list(real))) ((#real_lt:fun(real,fun(real,bool)) h:real) x:real)))))))))
      #|SUBLIST_MEM =  |- (#forall:fun(fun('?26,bool),bool) (\x:'?26. (#forall:fun(fun(list('?26),bool),bool) (\l1:list('?26). (#forall:fun(fun(list('?26),bool),bool) (\l2:list('?26). ((#==>:fun(bool,fun(bool,bool)) ((#SUBLIST:fun(list('?26),fun(list('?26),bool)) l1:list('?26)) l2:list('?26))) ((#==>:fun(bool,fun(bool,bool)) ((#MEM:fun('?26,fun(list('?26),bool)) x:'?26) l1:list('?26))) ((#MEM:fun('?26,fun(list('?26),bool)) x:'?26) l2:list('?26))))))))))
      #|ROL_SUBLIST_LT =  |- (#forall:fun(fun(real,bool),bool) (\h:real. (#forall:fun(fun(list(real),bool),bool) (\t1:list(real). (#forall:fun(fun(list(real),bool),bool) (\t2:list(real). ((#==>:fun(bool,fun(bool,bool)) (#real_ordered_list:fun(list(real),bool) ((#CONS:fun(real,fun(list(real),list(real))) h:real) t2:list(real)))) ((#==>:fun(bool,fun(bool,bool)) ((#SUBLIST:fun(list(real),fun(list(real),bool)) ((#CONS:fun(real,fun(list(real),list(real))) h:real) t1:list(real))) ((#CONS:fun(real,fun(list(real),list(real))) h:real) t2:list(real)))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#MEM:fun(real,fun(list(real),bool)) x:real) t1:list(real))) ((#real_lt:fun(real,fun(real,bool)) h:real) x:real))))))))))))
      #|SUBLIST_DELETE =  |- (#forall:fun(fun('?27,bool),bool) (\h1:'?27. (#forall:fun(fun('?27,bool),bool) (\h2:'?27. (#forall:fun(fun(list('?27),bool),bool) (\t:list('?27). (#forall:fun(fun(list('?27),bool),bool) (\l:list('?27). ((#==>:fun(bool,fun(bool,bool)) ((#SUBLIST:fun(list('?27),fun(list('?27),bool)) ((#CONS:fun('?27,fun(list('?27),list('?27))) h1:'?27) ((#CONS:fun('?27,fun(list('?27),list('?27))) h2:'?27) t:list('?27)))) l:list('?27))) ((#SUBLIST:fun(list('?27),fun(list('?27),bool)) ((#CONS:fun('?27,fun(list('?27),list('?27))) h1:'?27) t:list('?27))) l:list('?27)))))))))))
      #|SUBLIST_MATCH =  |- (#forall:fun(fun('A,bool),bool) (\h:'A. (#forall:fun(fun(list('A),bool),bool) (\t:list('A). (#forall:fun(fun(list('A),bool),bool) (\l:list('A). ((#==>:fun(bool,fun(bool,bool)) ((#SUBLIST:fun(list('A),fun(list('A),bool)) ((#CONS:fun('A,fun(list('A),list('A))) h:'A) t:list('A))) l:list('A))) (#?:fun(fun(list('A),bool),bool) (\l1:list('A). (#?:fun(fun(list('A),bool),bool) (\l2:list('A). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(list('A),fun(list('A),bool)) l:list('A)) ((#APPEND:fun(list('A),fun(list('A),list('A))) l1:list('A)) ((#CONS:fun('A,fun(list('A),list('A))) h:'A) l2:list('A))))) ((#SUBLIST:fun(list('A),fun(list('A),bool)) t:list('A)) l2:list('A))))))))))))))
      #|ROL_SUBLIST =  |- (#forall:fun(fun(list(real),bool),bool) (\l1:list(real). (#forall:fun(fun(list(real),bool),bool) (\l2:list(real). ((#==>:fun(bool,fun(bool,bool)) (#real_ordered_list:fun(list(real),bool) l2:list(real))) ((#==>:fun(bool,fun(bool,bool)) ((#SUBLIST:fun(list(real),fun(list(real),bool)) l1:list(real)) l2:list(real))) (#real_ordered_list:fun(list(real),bool) l1:list(real))))))))
      #|SUBLIST_BUTLAST =  |- (#forall:fun(fun(list('?28),bool),bool) (\l:list('?28). ((#SUBLIST:fun(list('?28),fun(list('?28),bool)) (#BUTLAST:fun(list('?28),list('?28)) l:list('?28))) l:list('?28))))
      #|SUBLIST_APPEND_HD =  |- (#forall:fun(fun(list('?29),bool),bool) (\l2:list('?29). (#forall:fun(fun(list('?29),bool),bool) (\l3:list('?29). (#forall:fun(fun(list('?29),bool),bool) (\l1:list('?29). ((#=:fun(bool,fun(bool,bool)) ((#SUBLIST:fun(list('?29),fun(list('?29),bool)) ((#APPEND:fun(list('?29),fun(list('?29),list('?29))) l1:list('?29)) l2:list('?29))) ((#APPEND:fun(list('?29),fun(list('?29),list('?29))) l1:list('?29)) l3:list('?29)))) ((#SUBLIST:fun(list('?29),fun(list('?29),bool)) l2:list('?29)) l3:list('?29)))))))))
      #|SUBLIST_ID_CONS =  |- (#forall:fun(fun('?30,bool),bool) (\h:'?30. (#forall:fun(fun(list('?30),bool),bool) (\l:list('?30). (#~:fun(bool,bool) ((#SUBLIST:fun(list('?30),fun(list('?30),bool)) ((#CONS:fun('?30,fun(list('?30),list('?30))) h:'?30) l:list('?30))) l:list('?30)))))))
      #|SUBLIST_ID_APPEND =  |- (#forall:fun(fun(list('?31),bool),bool) (\m:list('?31). (#forall:fun(fun(list('?31),bool),bool) (\l:list('?31). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(list('?31),fun(list('?31),bool)) l:list('?31)) #NIL:list('?31)))) (#~:fun(bool,bool) ((#SUBLIST:fun(list('?31),fun(list('?31),bool)) ((#APPEND:fun(list('?31),fun(list('?31),list('?31))) l:list('?31)) m:list('?31))) m:list('?31))))))))
      #|SUBLIST_APPEND_TL =  |- (#forall:fun(fun(list('?32),bool),bool) (\l3:list('?32). (#forall:fun(fun(list('?32),bool),bool) (\l1:list('?32). (#forall:fun(fun(list('?32),bool),bool) (\l2:list('?32). ((#=:fun(bool,fun(bool,bool)) ((#SUBLIST:fun(list('?32),fun(list('?32),bool)) ((#APPEND:fun(list('?32),fun(list('?32),list('?32))) l1:list('?32)) l3:list('?32))) ((#APPEND:fun(list('?32),fun(list('?32),list('?32))) l2:list('?32)) l3:list('?32)))) ((#SUBLIST:fun(list('?32),fun(list('?32),bool)) l1:list('?32)) l2:list('?32)))))))))
      #|SUBLIST_TRANS2 =  |- (#forall:fun(fun(list('?25),bool),bool) (\l1:list('?25). (#forall:fun(fun(list('?25),bool),bool) (\l2:list('?25). (#forall:fun(fun(list('?25),bool),bool) (\l3:list('?25). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBLIST:fun(list('?25),fun(list('?25),bool)) l1:list('?25)) l2:list('?25))) ((#SUBLIST:fun(list('?25),fun(list('?25),bool)) l2:list('?25)) l3:list('?25)))) ((#SUBLIST:fun(list('?25),fun(list('?25),bool)) l1:list('?25)) l3:list('?25)))))))))
      #|APPEND_CONS =  |- (#forall:fun(fun('?33,bool),bool) (\h:'?33. (#forall:fun(fun(list('?33),bool),bool) (\l1:list('?33). (#forall:fun(fun(list('?33),bool),bool) (\l2:list('?33). ((#=:fun(list('?33),fun(list('?33),bool)) ((#APPEND:fun(list('?33),fun(list('?33),list('?33))) l1:list('?33)) ((#CONS:fun('?33,fun(list('?33),list('?33))) h:'?33) l2:list('?33)))) ((#APPEND:fun(list('?33),fun(list('?33),list('?33))) ((#APPEND:fun(list('?33),fun(list('?33),list('?33))) l1:list('?33)) ((#CONS:fun('?33,fun(list('?33),list('?33))) h:'?33) #NIL:list('?33)))) l2:list('?33)))))))))
      #|SUBLIST_APPEND =  |- (#forall:fun(fun(list('?34),bool),bool) (\l1:list('?34). (#forall:fun(fun(list('?34),bool),bool) (\l2:list('?34). (#forall:fun(fun(list('?34),bool),bool) (\m1:list('?34). (#forall:fun(fun(list('?34),bool),bool) (\m2:list('?34). ((#==>:fun(bool,fun(bool,bool)) ((#SUBLIST:fun(list('?34),fun(list('?34),bool)) l1:list('?34)) l2:list('?34))) ((#==>:fun(bool,fun(bool,bool)) ((#SUBLIST:fun(list('?34),fun(list('?34),bool)) m1:list('?34)) m2:list('?34))) ((#SUBLIST:fun(list('?34),fun(list('?34),bool)) ((#APPEND:fun(list('?34),fun(list('?34),list('?34))) l1:list('?34)) m1:list('?34))) ((#APPEND:fun(list('?34),fun(list('?34),list('?34))) l2:list('?34)) m2:list('?34)))))))))))))
      #|SUBLIST_APPEND2 =  |- (#forall:fun(fun(list('?34),bool),bool) (\l1:list('?34). (#forall:fun(fun(list('?34),bool),bool) (\l2:list('?34). (#forall:fun(fun(list('?34),bool),bool) (\m1:list('?34). (#forall:fun(fun(list('?34),bool),bool) (\m2:list('?34). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBLIST:fun(list('?34),fun(list('?34),bool)) l1:list('?34)) l2:list('?34))) ((#SUBLIST:fun(list('?34),fun(list('?34),bool)) m1:list('?34)) m2:list('?34)))) ((#SUBLIST:fun(list('?34),fun(list('?34),bool)) ((#APPEND:fun(list('?34),fun(list('?34),list('?34))) l1:list('?34)) m1:list('?34))) ((#APPEND:fun(list('?34),fun(list('?34),list('?34))) l2:list('?34)) m2:list('?34))))))))))))
      #|ROL_APPEND2 =  |- (#forall:fun(fun(list(real),bool),bool) (\l2:list(real). (#forall:fun(fun(list(real),bool),bool) (\l1:list(real). ((#==>:fun(bool,fun(bool,bool)) (#real_ordered_list:fun(list(real),bool) ((#APPEND:fun(list(real),fun(list(real),list(real))) l1:list(real)) l2:list(real)))) (#real_ordered_list:fun(list(real),bool) ((#APPEND:fun(list(real),fun(list(real),list(real))) l1:list(real)) (#BUTLAST:fun(list(real),list(real)) l2:list(real)))))))))
      #|PL_LEM =  |- (#forall:fun(fun(list(real),bool),bool) (\l:list(real). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(list(real),fun(list(real),bool)) l:list(real)) #NIL:list(real)))) (#~:fun(bool,bool) ((#=:fun(list(fun(real,bool)),fun(list(fun(real,bool)),bool)) (#TL:fun(list(fun(real,bool)),list(fun(real,bool))) (#partition_line:fun(list(real),list(fun(real,bool))) l:list(real)))) #NIL:list(fun(real,bool)))))))
      #|HD_APPEND2 =  |- (#forall:fun(fun(list('?35),bool),bool) (\l:list('?35). (#forall:fun(fun(list('?35),bool),bool) (\m:list('?35). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(list('?35),fun(list('?35),bool)) l:list('?35)) #NIL:list('?35)))) ((#=:fun('?35,fun('?35,bool)) (#HD:fun(list('?35),'?35) ((#APPEND:fun(list('?35),fun(list('?35),list('?35))) l:list('?35)) m:list('?35)))) (#HD:fun(list('?35),'?35) l:list('?35))))))))
      #|BUTLAST_TL =  |- (#forall:fun(fun(list('?36),bool),bool) (\l:list('?36). ((#==>:fun(bool,fun(bool,bool)) ((#>:fun(num,fun(num,bool)) (#LENGTH:fun(list('?36),num) l:list('?36))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#=:fun(list('?36),fun(list('?36),bool)) (#BUTLAST:fun(list('?36),list('?36)) (#TL:fun(list('?36),list('?36)) l:list('?36)))) (#TL:fun(list('?36),list('?36)) (#BUTLAST:fun(list('?36),list('?36)) l:list('?36)))))))
      #|APPEND_TL =  |- (#forall:fun(fun(list('?37),bool),bool) (\m:list('?37). (#forall:fun(fun(list('?37),bool),bool) (\l:list('?37). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(list('?37),fun(list('?37),bool)) l:list('?37)) #NIL:list('?37)))) ((#=:fun(list('?37),fun(list('?37),bool)) ((#APPEND:fun(list('?37),fun(list('?37),list('?37))) (#TL:fun(list('?37),list('?37)) l:list('?37))) m:list('?37))) (#TL:fun(list('?37),list('?37)) ((#APPEND:fun(list('?37),fun(list('?37),list('?37))) l:list('?37)) m:list('?37)))))))))
      #|APPEND_HD =  |- (#forall:fun(fun(list('?38),bool),bool) (\m:list('?38). (#forall:fun(fun(list('?38),bool),bool) (\l:list('?38). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(list('?38),fun(list('?38),bool)) l:list('?38)) #NIL:list('?38)))) ((#=:fun('?38,fun('?38,bool)) (#HD:fun(list('?38),'?38) ((#APPEND:fun(list('?38),fun(list('?38),list('?38))) l:list('?38)) m:list('?38)))) (#HD:fun(list('?38),'?38) l:list('?38))))))))
      #|PL_LEM2 =  |- (#forall:fun(fun(list(real),bool),bool) (\l:list(real). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(list(real),fun(list(real),bool)) l:list(real)) #NIL:list(real)))) ((#>:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,bool)),num) (#partition_line:fun(list(real),list(fun(real,bool))) l:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|BUTLAST_APPEND =  |- (#forall:fun(fun(list('?39),bool),bool) (\l:list('?39). (#forall:fun(fun(list('?39),bool),bool) (\m:list('?39). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(list('?39),fun(list('?39),bool)) m:list('?39)) #NIL:list('?39)))) ((#=:fun(list('?39),fun(list('?39),bool)) (#BUTLAST:fun(list('?39),list('?39)) ((#APPEND:fun(list('?39),fun(list('?39),list('?39))) l:list('?39)) m:list('?39)))) ((#APPEND:fun(list('?39),fun(list('?39),list('?39))) l:list('?39)) (#BUTLAST:fun(list('?39),list('?39)) m:list('?39)))))))))
      #|LENGTH_TL1 =  |- (#forall:fun(fun(list('?40),bool),bool) (\l:list('?40). ((#==>:fun(bool,fun(bool,bool)) ((#>:fun(num,fun(num,bool)) (#LENGTH:fun(list('?40),num) l:list('?40))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#~:fun(bool,bool) ((#=:fun(list('?40),fun(list('?40),bool)) (#TL:fun(list('?40),list('?40)) l:list('?40))) #NIL:list('?40))))))
      #|PL_BUTLAST =  |- (#forall:fun(fun(list(real),bool),bool) (\l:list(real). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(list(real),fun(list(real),bool)) l:list(real)) #NIL:list(real)))) (#~:fun(bool,bool) ((#=:fun(list(fun(real,bool)),fun(list(fun(real,bool)),bool)) (#BUTLAST:fun(list(fun(real,bool)),list(fun(real,bool))) (#partition_line:fun(list(real),list(fun(real,bool))) l:list(real)))) #NIL:list(fun(real,bool)))))))
      #|PARTITION_LINE_APPEND =  |- (#forall:fun(fun(real,bool),bool) (\h:real. (#forall:fun(fun(list(real),bool),bool) (\t:list(real). (#forall:fun(fun(list(real),bool),bool) (\l:list(real). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(list(real),fun(list(real),bool)) l:list(real)) #NIL:list(real)))) ((#=:fun(list(fun(real,bool)),fun(list(fun(real,bool)),bool)) (#partition_line:fun(list(real),list(fun(real,bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) l:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) h:real) t:list(real))))) ((#APPEND:fun(list(fun(real,bool)),fun(list(fun(real,bool)),list(fun(real,bool)))) (#BUTLAST:fun(list(fun(real,bool)),list(fun(real,bool))) (#partition_line:fun(list(real),list(fun(real,bool))) l:list(real)))) ((#CONS:fun(fun(real,bool),fun(list(fun(real,bool)),list(fun(real,bool)))) (\x:real. ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#LAST:fun(list(real),real) l:list(real))) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) h:real)))) (#TL:fun(list(fun(real,bool)),list(fun(real,bool))) (#partition_line:fun(list(real),list(fun(real,bool))) ((#CONS:fun(real,fun(list(real),list(real))) h:real) t:list(real))))))))))))))
      #|HD_TL =  |- (#forall:fun(fun(list('?41),bool),bool) (\l:list('?41). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(list('?41),fun(list('?41),bool)) l:list('?41)) #NIL:list('?41)))) ((#=:fun(list('?41),fun(list('?41),bool)) l:list('?41)) ((#CONS:fun('?41,fun(list('?41),list('?41))) (#HD:fun(list('?41),'?41) l:list('?41))) (#TL:fun(list('?41),list('?41)) l:list('?41)))))))
      #|HD_LEM =  |- (#forall:fun(fun(list('?42),bool),bool) (\l1:list('?42). (#forall:fun(fun(list('?42),bool),bool) (\l2:list('?42). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(list('?42),fun(list('?42),bool)) (#TL:fun(list('?42),list('?42)) l1:list('?42))) l2:list('?42))) ((#=:fun(list('?42),fun(list('?42),bool)) ((#CONS:fun('?42,fun(list('?42),list('?42))) (#HD:fun(list('?42),'?42) l1:list('?42))) (#TL:fun(list('?42),list('?42)) l1:list('?42)))) ((#CONS:fun('?42,fun(list('?42),list('?42))) (#HD:fun(list('?42),'?42) l1:list('?42))) l2:list('?42))))))))
      #|BUTLAST_LENGTH =  |- (#forall:fun(fun(list('?43),bool),bool) (\l:list('?43). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(list('?43),fun(list('?43),bool)) l:list('?43)) #NIL:list('?43)))) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list('?43),num) (#BUTLAST:fun(list('?43),list('?43)) l:list('?43)))) (#PRE:fun(num,num) (#LENGTH:fun(list('?43),num) l:list('?43)))))))
      #|ALL2_LEM =  |- (#forall:fun(fun(list(sign),bool),bool) (\a:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\b:list(sign). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(list(sign),bool),bool) (\s:list(sign). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\eqs:list(fun(real,real)). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). ((#==>:fun(bool,fun(bool,bool)) (((#ALL2:fun(fun(fun(real,bool),fun(list(sign),bool)),fun(list(fun(real,bool)),fun(list(list(sign)),bool))) (#interpsigns:fun(list(fun(real,real)),fun(fun(real,bool),fun(list(sign),bool))) eqs:list(fun(real,real)))) (#partition_line:fun(list(real),list(fun(real,bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) x:real) ((#CONS:fun(real,fun(list(real),list(real))) y:real) #NIL:list(real)))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) a:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) b:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) s:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) s:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) s:list(sign)) #NIL:list(list(sign)))))))))) (((#ALL2:fun(fun(fun(real,bool),fun(list(sign),bool)),fun(list(fun(real,bool)),fun(list(list(sign)),bool))) (#interpsigns:fun(list(fun(real,real)),fun(fun(real,bool),fun(list(sign),bool))) eqs:list(fun(real,real)))) (#partition_line:fun(list(real),list(fun(real,bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) x:real) #NIL:list(real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) a:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) b:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) s:list(sign)) #NIL:list(list(sign))))))))))))))))))))))))
      #|INTERPMAT_TRIO_TL =  |- (#forall:fun(fun(list(sign),bool),bool) (\a:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\b:list(sign). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(list(sign),bool),bool) (\s:list(sign). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\eqs:list(fun(real,real)). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) x:real) ((#CONS:fun(real,fun(list(real),list(real))) y:real) #NIL:list(real))))) eqs:list(fun(real,real))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) a:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) b:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) s:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) s:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) s:list(sign)) #NIL:list(list(sign)))))))))) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) x:real) #NIL:list(real)))) eqs:list(fun(real,real))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) a:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) b:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) s:list(sign)) #NIL:list(list(sign))))))))))))))))))))))))
      #|LAST_APPEND =  |- (#forall:fun(fun(list('?44),bool),bool) (\l1:list('?44). (#forall:fun(fun(list('?44),bool),bool) (\l2:list('?44). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(list('?44),fun(list('?44),bool)) l2:list('?44)) #NIL:list('?44)))) ((#=:fun('?44,fun('?44,bool)) (#LAST:fun(list('?44),'?44) ((#APPEND:fun(list('?44),fun(list('?44),list('?44))) l1:list('?44)) l2:list('?44)))) (#LAST:fun(list('?44),'?44) l2:list('?44))))))))
      #|APPEND_APPEND =  |- (#forall:fun(fun(list('?45),bool),bool) (\l1:list('?45). (#forall:fun(fun(list('?45),bool),bool) (\l2:list('?45). (#forall:fun(fun(list('?45),bool),bool) (\l3:list('?45). ((#=:fun(list('?45),fun(list('?45),bool)) ((#APPEND:fun(list('?45),fun(list('?45),list('?45))) ((#APPEND:fun(list('?45),fun(list('?45),list('?45))) l1:list('?45)) l2:list('?45))) l3:list('?45))) ((#APPEND:fun(list('?45),fun(list('?45),list('?45))) l1:list('?45)) ((#APPEND:fun(list('?45),fun(list('?45),list('?45))) l2:list('?45)) l3:list('?45))))))))))
      #|ALL2_LEM2 =  |- (#forall:fun(fun(list(sign),bool),bool) (\a:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\b:list(sign). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(list(sign),bool),bool) (\s:list(sign). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\eqs:list(fun(real,real)). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). (#forall:fun(fun(list(real),bool),bool) (\qts:list(real). (#forall:fun(fun(list(list(sign)),bool),bool) (\rgns:list(list(sign)). ((#==>:fun(bool,fun(bool,bool)) (((#ALL2:fun(fun(fun(real,bool),fun(list(sign),bool)),fun(list(fun(real,bool)),fun(list(list(sign)),bool))) (#interpsigns:fun(list(fun(real,real)),fun(fun(real,bool),fun(list(sign),bool))) eqs:list(fun(real,real)))) (#partition_line:fun(list(real),list(fun(real,bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) x:real) ((#CONS:fun(real,fun(list(real),list(real))) y:real) qts:list(real)))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) a:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) b:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) s:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) s:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) s:list(sign)) rgns:list(list(sign)))))))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign)))) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts:list(real))))) (((#ALL2:fun(fun(fun(real,bool),fun(list(sign),bool)),fun(list(fun(real,bool)),fun(list(list(sign)),bool))) (#interpsigns:fun(list(fun(real,real)),fun(fun(real,bool),fun(list(sign),bool))) eqs:list(fun(real,real)))) (#partition_line:fun(list(real),list(fun(real,bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) x:real) qts:list(real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) a:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) b:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) s:list(sign)) rgns:list(list(sign)))))))))))))))))))))))))))))
      #|INTERPMAT_TRIO_INNER =  |- (#forall:fun(fun(list(sign),bool),bool) (\a:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\b:list(sign). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(list(sign),bool),bool) (\s:list(sign). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\eqs:list(fun(real,real)). (#forall:fun(fun(list(real),bool),bool) (\qts:list(real). (#forall:fun(fun(list(list(sign)),bool),bool) (\rgns:list(list(sign)). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) x:real) ((#CONS:fun(real,fun(list(real),list(real))) y:real) qts:list(real))))) eqs:list(fun(real,real))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) a:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) b:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) s:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) s:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) s:list(sign)) rgns:list(list(sign)))))))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign)))) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts:list(real))))) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) x:real) qts:list(real)))) eqs:list(fun(real,real))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) a:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) b:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) s:list(sign)) rgns:list(list(sign)))))))))))))))))))))))))))))
      #|INTERPMAT_SING =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(list(sign),bool),bool) (\l:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#CONS:fun(real,fun(list(real),list(real))) x:real) #NIL:list(real))) eqs:list(fun(real,real))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) l:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) l:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) l:list(sign)) #NIL:list(list(sign))))))) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) #NIL:list(real)) eqs:list(fun(real,real))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) l:list(sign)) #NIL:list(list(sign)))))))))
      #|INFERISIGN_POS_POS_POS =  |- (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(real),bool),bool) (\qts:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\eqs:list(fun(real,real)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\rgns:list(list(sign)). (#forall:fun(fun(list(sign),bool),bool) (\r1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r3:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r3:list(sign))) rgns:list(list(sign)))))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign)))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r3:list(sign))) rgns:list(list(sign)))))))))))))))))))))))))))))))
      #|INFERISIGN_POS_POS_NEG =  |- (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(real),bool),bool) (\qts:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\eqs:list(fun(real,real)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\rgns:list(list(sign)). (#forall:fun(fun(list(sign),bool),bool) (\r1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r3:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r3:list(sign))) rgns:list(list(sign)))))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign)))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r3:list(sign))) rgns:list(list(sign)))))))))))))))))))))))))))))))
      #|INFERISIGN_NEG_NEG_POS =  |- (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(real),bool),bool) (\qts:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\eqs:list(fun(real,real)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\rgns:list(list(sign)). (#forall:fun(fun(list(sign),bool),bool) (\r1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r3:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r3:list(sign))) rgns:list(list(sign)))))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign)))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r3:list(sign))) rgns:list(list(sign)))))))))))))))))))))))))))))))
      #|INFERISIGN_NEG_NEG_NEG =  |- (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(real),bool),bool) (\qts:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\eqs:list(fun(real,real)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\rgns:list(list(sign)). (#forall:fun(fun(list(sign),bool),bool) (\r1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r3:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r3:list(sign))) rgns:list(list(sign)))))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign)))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r3:list(sign))) rgns:list(list(sign)))))))))))))))))))))))))))))))
      #|ALL2_INTERPSIGN_SUBSET =  |- (#forall:fun(fun(fun(real,bool),bool),bool) (\P:fun(real,bool). (#forall:fun(fun(fun(real,bool),bool),bool) (\Q:fun(real,bool). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\l1:list(fun(real,real)). (#forall:fun(fun(list(sign),bool),bool) (\l2:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#ALL2:fun(fun(fun(real,real),fun(sign,bool)),fun(list(fun(real,real)),fun(list(sign),bool))) (#interpsign:fun(fun(real,bool),fun(fun(real,real),fun(sign,bool))) P:fun(real,bool))) l1:list(fun(real,real))) l2:list(sign))) ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun(real,bool),fun(fun(real,bool),bool)) Q:fun(real,bool)) P:fun(real,bool))) (((#ALL2:fun(fun(fun(real,real),fun(sign,bool)),fun(list(fun(real,real)),fun(list(sign),bool))) (#interpsign:fun(fun(real,bool),fun(fun(real,real),fun(sign,bool))) Q:fun(real,bool))) l1:list(fun(real,real))) l2:list(sign))))))))))))
      #|HD_APPEND1 =  |- (#forall:fun(fun('?46,bool),bool) (\h:'?46. (#forall:fun(fun('?46,bool),bool) (\i:'?46. (#forall:fun(fun(list('?46),bool),bool) (\l1:list('?46). (#forall:fun(fun(list('?46),bool),bool) (\l2:list('?46). ((#=:fun('?46,fun('?46,bool)) (#HD:fun(list('?46),'?46) ((#APPEND:fun(list('?46),fun(list('?46),list('?46))) l1:list('?46)) ((#CONS:fun('?46,fun(list('?46),list('?46))) h:'?46) l2:list('?46))))) (#HD:fun(list('?46),'?46) ((#APPEND:fun(list('?46),fun(list('?46),list('?46))) l1:list('?46)) ((#CONS:fun('?46,fun(list('?46),list('?46))) h:'?46) ((#CONS:fun('?46,fun(list('?46),list('?46))) i:'?46) l2:list('?46))))))))))))))
      #|ROL_APPEND_INSERT =  |- (#forall:fun(fun(real,bool),bool) (\h:real. (#forall:fun(fun(real,bool),bool) (\j:real. (#forall:fun(fun(list(real),bool),bool) (\l1:list(real). (#forall:fun(fun(list(real),bool),bool) (\l2:list(real). ((#==>:fun(bool,fun(bool,bool)) (#real_ordered_list:fun(list(real),bool) ((#APPEND:fun(list(real),fun(list(real),list(real))) l1:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) h:real) ((#CONS:fun(real,fun(list(real),list(real))) i:real) l2:list(real)))))) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) h:real) j:real)) ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) j:real) i:real)) (#real_ordered_list:fun(list(real),bool) ((#APPEND:fun(list(real),fun(list(real),list(real))) l1:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) h:real) ((#CONS:fun(real,fun(list(real),list(real))) j:real) ((#CONS:fun(real,fun(list(real),list(real))) i:real) l2:list(real)))))))))))))))))
      #|INFERISIGN_POS_NEG_POS =  |- (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(real),bool),bool) (\qts:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\eqs:list(fun(real,real)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\rgns:list(list(sign)). (#forall:fun(fun(list(sign),bool),bool) (\r1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r3:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r3:list(sign))) rgns:list(list(sign)))))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign)))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#?:fun(fun(real,bool),bool) (\w:real. (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) w:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real)))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r3:list(sign))) rgns:list(list(sign)))))))))))))))))))))))))))))))))))
      #|INFERISIGN_POS_NEG_NEG =  |- (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(real),bool),bool) (\qts:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\eqs:list(fun(real,real)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\rgns:list(list(sign)). (#forall:fun(fun(list(sign),bool),bool) (\r1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r3:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r3:list(sign))) rgns:list(list(sign)))))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign)))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#?:fun(fun(real,bool),bool) (\w:real. (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) w:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real)))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r3:list(sign))) rgns:list(list(sign)))))))))))))))))))))))))))))))))))
      #|INFERISIGN_NEG_POS_NEG =  |- (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(real),bool),bool) (\qts:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\eqs:list(fun(real,real)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\rgns:list(list(sign)). (#forall:fun(fun(list(sign),bool),bool) (\r1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r3:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r3:list(sign))) rgns:list(list(sign)))))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign)))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#?:fun(fun(real,bool),bool) (\w:real. (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) w:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real)))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r3:list(sign))) rgns:list(list(sign)))))))))))))))))))))))))))))))))))
      #|INFERISIGN_NEG_POS_POS =  |- (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(real),bool),bool) (\qts:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\eqs:list(fun(real,real)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\rgns:list(list(sign)). (#forall:fun(fun(list(sign),bool),bool) (\r1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r3:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r3:list(sign))) rgns:list(list(sign)))))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign)))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#?:fun(fun(real,bool),bool) (\w:real. (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) w:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real)))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r3:list(sign))) rgns:list(list(sign)))))))))))))))))))))))))))))))))))
      #|INFERISIGN_ZERO_POS_POS =  |- (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(real),bool),bool) (\qts:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\eqs:list(fun(real,real)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\rgns:list(list(sign)). (#forall:fun(fun(list(sign),bool),bool) (\r1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r3:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r3:list(sign))) rgns:list(list(sign)))))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign)))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r3:list(sign))) rgns:list(list(sign)))))))))))))))))))))))))))))))
      #|INFERISIGN_ZERO_POS_NEG =  |- (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(real),bool),bool) (\qts:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\eqs:list(fun(real,real)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\rgns:list(list(sign)). (#forall:fun(fun(list(sign),bool),bool) (\r1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r3:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r3:list(sign))) rgns:list(list(sign)))))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign)))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r3:list(sign))) rgns:list(list(sign)))))))))))))))))))))))))))))))
      #|INFERISIGN_POS_ZERO_POS =  |- (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(real),bool),bool) (\qts:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\eqs:list(fun(real,real)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\rgns:list(list(sign)). (#forall:fun(fun(list(sign),bool),bool) (\r1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r3:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) r3:list(sign))) rgns:list(list(sign)))))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign)))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) r3:list(sign))) rgns:list(list(sign)))))))))))))))))))))))))))))))
      #|INFERISIGN_POS_ZERO_NEG =  |- (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(real),bool),bool) (\qts:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\eqs:list(fun(real,real)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\rgns:list(list(sign)). (#forall:fun(fun(list(sign),bool),bool) (\r1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r3:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) r3:list(sign))) rgns:list(list(sign)))))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign)))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) r3:list(sign))) rgns:list(list(sign)))))))))))))))))))))))))))))))
      #|INFERISIGN_ZERO_NEG_POS =  |- (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(real),bool),bool) (\qts:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\eqs:list(fun(real,real)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\rgns:list(list(sign)). (#forall:fun(fun(list(sign),bool),bool) (\r1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r3:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r3:list(sign))) rgns:list(list(sign)))))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign)))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r3:list(sign))) rgns:list(list(sign)))))))))))))))))))))))))))))))
      #|INFERISIGN_ZERO_NEG_NEG =  |- (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(real),bool),bool) (\qts:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\eqs:list(fun(real,real)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\rgns:list(list(sign)). (#forall:fun(fun(list(sign),bool),bool) (\r1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r3:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r3:list(sign))) rgns:list(list(sign)))))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign)))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r3:list(sign))) rgns:list(list(sign)))))))))))))))))))))))))))))))
      #|INFERISIGN_NEG_ZERO_NEG =  |- (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(real),bool),bool) (\qts:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\eqs:list(fun(real,real)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\rgns:list(list(sign)). (#forall:fun(fun(list(sign),bool),bool) (\r1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r3:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) r3:list(sign))) rgns:list(list(sign)))))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign)))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) r3:list(sign))) rgns:list(list(sign)))))))))))))))))))))))))))))))
      #|INFERISIGN_NEG_ZERO_POS =  |- (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(real),bool),bool) (\qts:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\eqs:list(fun(real,real)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\rgns:list(list(sign)). (#forall:fun(fun(list(sign),bool),bool) (\r1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r3:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) r3:list(sign))) rgns:list(list(sign)))))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign)))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) r3:list(sign))) rgns:list(list(sign)))))))))))))))))))))))))))))))
      #|INFERISIGN_ZERO_ZERO_POS =  |- (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(real),bool),bool) (\qts:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\eqs:list(fun(real,real)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\rgns:list(list(sign)). (#forall:fun(fun(list(sign),bool),bool) (\r1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r3:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) r3:list(sign))) rgns:list(list(sign)))))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign)))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) #F:bool))))))))))))))))))))))))
      #|INFERISIGN_ZERO_ZERO_NEG =  |- (#forall:fun(fun(real,bool),bool) (\y:real. (#forall:fun(fun(real,bool),bool) (\z:real. (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(real),bool),bool) (\qts:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\eqs:list(fun(real,real)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\rgns:list(list(sign)). (#forall:fun(fun(list(sign),bool),bool) (\r1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r3:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) y:real) ((#CONS:fun(real,fun(list(real),list(real))) z:real) qts:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) eqs:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) r1:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) r3:list(sign))) rgns:list(list(sign)))))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign)))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) #F:bool))))))))))))))))))))))))
      #|BUTLAST_ID =  |- (#forall:fun(fun(list('?47),bool),bool) (\l:list('?47). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(list('?47),fun(list('?47),bool)) l:list('?47)) #NIL:list('?47)))) ((#=:fun(list('?47),fun(list('?47),bool)) l:list('?47)) ((#APPEND:fun(list('?47),fun(list('?47),list('?47))) (#BUTLAST:fun(list('?47),list('?47)) l:list('?47))) ((#CONS:fun('?47,fun(list('?47),list('?47))) (#LAST:fun(list('?47),'?47) l:list('?47))) #NIL:list('?47)))))))
      #|BUTLAST_NIL =  |- (#forall:fun(fun(list('?48),bool),bool) (\l:list('?48). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(list('?48),fun(list('?48),bool)) (#BUTLAST:fun(list('?48),list('?48)) l:list('?48))) #NIL:list('?48))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(list('?48),fun(list('?48),bool)) l:list('?48)) #NIL:list('?48))) (#?:fun(fun('?48,bool),bool) (\x:'?48. ((#=:fun(list('?48),fun(list('?48),bool)) l:list('?48)) ((#CONS:fun('?48,fun(list('?48),list('?48))) x:'?48) #NIL:list('?48)))))))))
      #|INFIN_HD_POS_LEM =  |- (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\ps:list(fun(real,real)). (#forall:fun(fun(list(sign),bool),bool) (\r1:list(sign). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) ps:list(fun(real,real))))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign)))) sgns:list(list(sign))))) ((#==>:fun(bool,fun(bool,bool)) (#nonconstant:fun(list(real),bool) p:list(real))) (#?:fun(fun(real,bool),bool) (\xminf:real. (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#CONS:fun(real,fun(list(real),list(real))) xminf:real) pts:list(real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) ps:list(fun(real,real))))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign)))) sgns:list(list(sign))))))))))))))))))))
      #|INFIN_TL_POS_LEM =  |- (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\ps:list(fun(real,real)). (#forall:fun(fun('?49,bool),bool) (\r1:'?49. (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). (#forall:fun(fun(list(sign),bool),bool) (\r2:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) ps:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) a:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) b:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) #NIL:list(list(sign)))))))) ((#==>:fun(bool,fun(bool,bool)) (#nonconstant:fun(list(real),bool) p:list(real))) (#?:fun(fun(real,bool),bool) (\xinf:real. (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) xinf:real) #NIL:list(real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) ps:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) a:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) b:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) #NIL:list(list(sign)))))))))))))))))))))))))
      #|INFIN_HD_NEG_LEM =  |- (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\ps:list(fun(real,real)). (#forall:fun(fun(list(sign),bool),bool) (\r1:list(sign). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) ps:list(fun(real,real))))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign)))) sgns:list(list(sign))))) ((#==>:fun(bool,fun(bool,bool)) (#nonconstant:fun(list(real),bool) p:list(real))) (#?:fun(fun(real,bool),bool) (\xminf:real. (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#CONS:fun(real,fun(list(real),list(real))) xminf:real) pts:list(real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) ps:list(fun(real,real))))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign)))) sgns:list(list(sign))))))))))))))))))))
      #|INFIN_TL_NEG_LEM =  |- (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\ps:list(fun(real,real)). (#forall:fun(fun('?50,bool),bool) (\r1:'?50. (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). (#forall:fun(fun(list(sign),bool),bool) (\r2:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) ps:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) a:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) b:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) #NIL:list(list(sign)))))))) ((#==>:fun(bool,fun(bool,bool)) (#nonconstant:fun(list(real),bool) p:list(real))) (#?:fun(fun(real,bool),bool) (\xinf:real. (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) xinf:real) #NIL:list(real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) ps:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) a:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) b:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) #NIL:list(list(sign)))))))))))))))))))))))))
      #|INFIN_POS_POS =  |- (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\ps:list(fun(real,real)). (#forall:fun(fun(list(sign),bool),bool) (\r1:list(sign). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). (#forall:fun(fun(list(sign),bool),bool) (\r2:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) ps:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign)))) sgns:list(list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) a:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) b:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) #NIL:list(list(sign)))))))) ((#==>:fun(bool,fun(bool,bool)) (#nonconstant:fun(list(real),bool) p:list(real))) (#?:fun(fun(real,bool),bool) (\xminf:real. (#?:fun(fun(real,bool),bool) (\xinf:real. (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) ((#CONS:fun(real,fun(list(real),list(real))) xminf:real) pts:list(real))) ((#CONS:fun(real,fun(list(real),list(real))) xinf:real) #NIL:list(real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) ps:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign)))) sgns:list(list(sign)))))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) a:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) b:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) #NIL:list(list(sign)))))))))))))))))))))))))))
      #|INFIN_POS_NEG =  |- (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\ps:list(fun(real,real)). (#forall:fun(fun(list(sign),bool),bool) (\r1:list(sign). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). (#forall:fun(fun(list(sign),bool),bool) (\r2:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) ps:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign)))) sgns:list(list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) a:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) b:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) #NIL:list(list(sign)))))))) ((#==>:fun(bool,fun(bool,bool)) (#nonconstant:fun(list(real),bool) p:list(real))) (#?:fun(fun(real,bool),bool) (\xminf:real. (#?:fun(fun(real,bool),bool) (\xinf:real. (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) ((#CONS:fun(real,fun(list(real),list(real))) xminf:real) pts:list(real))) ((#CONS:fun(real,fun(list(real),list(real))) xinf:real) #NIL:list(real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) ps:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign)))) sgns:list(list(sign)))))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) a:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) b:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) #NIL:list(list(sign)))))))))))))))))))))))))))
      #|INFIN_NEG_POS =  |- (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\ps:list(fun(real,real)). (#forall:fun(fun(list(sign),bool),bool) (\r1:list(sign). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). (#forall:fun(fun(list(sign),bool),bool) (\r2:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) ps:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign)))) sgns:list(list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) a:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) b:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) #NIL:list(list(sign)))))))) ((#==>:fun(bool,fun(bool,bool)) (#nonconstant:fun(list(real),bool) p:list(real))) (#?:fun(fun(real,bool),bool) (\xminf:real. (#?:fun(fun(real,bool),bool) (\xinf:real. (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) ((#CONS:fun(real,fun(list(real),list(real))) xminf:real) pts:list(real))) ((#CONS:fun(real,fun(list(real),list(real))) xinf:real) #NIL:list(real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) ps:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign)))) sgns:list(list(sign)))))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) a:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) b:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r2:list(sign)))) #NIL:list(list(sign)))))))))))))))))))))))))))
      #|INFIN_NEG_NEG =  |- (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\ps:list(fun(real,real)). (#forall:fun(fun(list(sign),bool),bool) (\r1:list(sign). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). (#forall:fun(fun(list(sign),bool),bool) (\r2:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) ps:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign)))) sgns:list(list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) a:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) b:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) #NIL:list(list(sign)))))))) ((#==>:fun(bool,fun(bool,bool)) (#nonconstant:fun(list(real),bool) p:list(real))) (#?:fun(fun(real,bool),bool) (\xminf:real. (#?:fun(fun(real,bool),bool) (\xinf:real. (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) ((#CONS:fun(real,fun(list(real),list(real))) xminf:real) pts:list(real))) ((#CONS:fun(real,fun(list(real),list(real))) xinf:real) #NIL:list(real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) ps:list(fun(real,real))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign)))) sgns:list(list(sign)))))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) a:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) b:list(sign)) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r2:list(sign)))) #NIL:list(list(sign)))))))))))))))))))))))))))
      #|INFIN_NIL_POS =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\ps:list(fun(real,real)). (#forall:fun(fun(list(sign),bool),bool) (\r1:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) #NIL:list(real)) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) ps:list(fun(real,real))))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign)))) #NIL:list(list(sign))))) ((#==>:fun(bool,fun(bool,bool)) (#nonconstant:fun(list(real),bool) p:list(real))) (#?:fun(fun(real,bool),bool) (\xminf:real. (#?:fun(fun(real,bool),bool) (\xinf:real. (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#CONS:fun(real,fun(list(real),list(real))) xminf:real) ((#CONS:fun(real,fun(list(real),list(real))) xinf:real) #NIL:list(real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) ps:list(fun(real,real))))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign)))) #NIL:list(list(sign))))))))))))))))))))
      #|INFIN_NIL_NEG =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\ps:list(fun(real,real)). (#forall:fun(fun(list(sign),bool),bool) (\r1:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) #NIL:list(real)) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) ps:list(fun(real,real))))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign)))) #NIL:list(list(sign))))) ((#==>:fun(bool,fun(bool,bool)) (#nonconstant:fun(list(real),bool) p:list(real))) (#?:fun(fun(real,bool),bool) (\xminf:real. (#?:fun(fun(real,bool),bool) (\xinf:real. (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#CONS:fun(real,fun(list(real),list(real))) xminf:real) ((#CONS:fun(real,fun(list(real),list(real))) xinf:real) #NIL:list(real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) ps:list(fun(real,real))))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign)))) #NIL:list(list(sign))))))))))))))))))))
      #|INFIN_SING_POS_POS =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\ps:list(fun(real,real)). (#forall:fun(fun(list(sign),bool),bool) (\r1:list(sign). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(sign,bool),bool) (\s2:sign. (#forall:fun(fun(list(sign),bool),bool) (\r2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r3:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#CONS:fun(real,fun(list(real),list(real))) x:real) #NIL:list(real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) ps:list(fun(real,real))))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) s2:sign) r2:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r3:list(sign)))) #NIL:list(list(sign))))))) ((#==>:fun(bool,fun(bool,bool)) (#nonconstant:fun(list(real),bool) p:list(real))) (#?:fun(fun(real,bool),bool) (\xminf:real. (#?:fun(fun(real,bool),bool) (\xinf:real. (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#CONS:fun(real,fun(list(real),list(real))) xminf:real) ((#CONS:fun(real,fun(list(real),list(real))) x:real) ((#CONS:fun(real,fun(list(real),list(real))) xinf:real) #NIL:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) ps:list(fun(real,real))))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) s2:sign) r2:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r3:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r3:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r3:list(sign)))) #NIL:list(list(sign))))))))))))))))))))))))))))))
      #|INFIN_SING_POS_NEG =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\ps:list(fun(real,real)). (#forall:fun(fun(list(sign),bool),bool) (\r1:list(sign). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(sign,bool),bool) (\s2:sign. (#forall:fun(fun(list(sign),bool),bool) (\r2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r3:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#CONS:fun(real,fun(list(real),list(real))) x:real) #NIL:list(real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) ps:list(fun(real,real))))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) s2:sign) r2:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r3:list(sign)))) #NIL:list(list(sign))))))) ((#==>:fun(bool,fun(bool,bool)) (#nonconstant:fun(list(real),bool) p:list(real))) (#?:fun(fun(real,bool),bool) (\xminf:real. (#?:fun(fun(real,bool),bool) (\xinf:real. (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#CONS:fun(real,fun(list(real),list(real))) xminf:real) ((#CONS:fun(real,fun(list(real),list(real))) x:real) ((#CONS:fun(real,fun(list(real),list(real))) xinf:real) #NIL:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) ps:list(fun(real,real))))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) s2:sign) r2:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r3:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r3:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r3:list(sign)))) #NIL:list(list(sign))))))))))))))))))))))))))))))
      #|INFIN_SING_NEG_POS =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\ps:list(fun(real,real)). (#forall:fun(fun(list(sign),bool),bool) (\r1:list(sign). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(sign,bool),bool) (\s2:sign. (#forall:fun(fun(list(sign),bool),bool) (\r2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r3:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#CONS:fun(real,fun(list(real),list(real))) x:real) #NIL:list(real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) ps:list(fun(real,real))))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) s2:sign) r2:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r3:list(sign)))) #NIL:list(list(sign))))))) ((#==>:fun(bool,fun(bool,bool)) (#nonconstant:fun(list(real),bool) p:list(real))) (#?:fun(fun(real,bool),bool) (\xminf:real. (#?:fun(fun(real,bool),bool) (\xinf:real. (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#CONS:fun(real,fun(list(real),list(real))) xminf:real) ((#CONS:fun(real,fun(list(real),list(real))) x:real) ((#CONS:fun(real,fun(list(real),list(real))) xinf:real) #NIL:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) ps:list(fun(real,real))))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) s2:sign) r2:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r3:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r3:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) r3:list(sign)))) #NIL:list(list(sign))))))))))))))))))))))))))))))
      #|INFIN_SING_NEG_NEG =  |- (#forall:fun(fun(list(real),bool),bool) (\p:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\ps:list(fun(real,real)). (#forall:fun(fun(list(sign),bool),bool) (\r1:list(sign). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(sign,bool),bool) (\s2:sign. (#forall:fun(fun(list(sign),bool),bool) (\r2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\r3:list(sign). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#CONS:fun(real,fun(list(real),list(real))) x:real) #NIL:list(real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) ps:list(fun(real,real))))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) s2:sign) r2:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r3:list(sign)))) #NIL:list(list(sign))))))) ((#==>:fun(bool,fun(bool,bool)) (#nonconstant:fun(list(real),bool) p:list(real))) (#?:fun(fun(real,bool),bool) (\xminf:real. (#?:fun(fun(real,bool),bool) (\xinf:real. (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#CONS:fun(real,fun(list(real),list(real))) xminf:real) ((#CONS:fun(real,fun(list(real),list(real))) x:real) ((#CONS:fun(real,fun(list(real),list(real))) xinf:real) #NIL:list(real))))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) p:list(real)) x:real))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) (\x:real. ((#poly:fun(list(real),fun(real,real)) (#poly_diff:fun(list(real),list(real)) p:list(real))) x:real))) ps:list(fun(real,real))))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r1:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) s2:sign) r2:list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r3:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r3:list(sign)))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) r3:list(sign)))) #NIL:list(list(sign))))))))))))))))))))))))))))))
      #|EL_SUC =  |- (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun('?51,bool),bool) (\h:'?51. (#forall:fun(fun(list('?51),bool),bool) (\t:list('?51). ((#=:fun('?51,fun('?51,bool)) ((#EL:fun(num,fun(list('?51),'?51)) (#SUC:fun(num,num) i:num)) ((#CONS:fun('?51,fun(list('?51),list('?51))) h:'?51) t:list('?51)))) ((#EL:fun(num,fun(list('?51),'?51)) i:num) t:list('?51)))))))))
      #|EL_PRE =  |- (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun('?52,bool),bool) (\h:'?52. (#forall:fun(fun(list('?52),bool),bool) (\t:list('?52). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) i:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun('?52,fun('?52,bool)) ((#EL:fun(num,fun(list('?52),'?52)) i:num) ((#CONS:fun('?52,fun(list('?52),list('?52))) h:'?52) t:list('?52)))) ((#EL:fun(num,fun(list('?52),'?52)) (#PRE:fun(num,num) i:num)) t:list('?52))))))))))
      #|ALL2_EL_LT_LEM =  |- (#forall:fun(fun(num,bool),bool) (\k:num. (#forall:fun(fun(fun('?53,fun('?54,bool)),bool),bool) (\P:fun('?53,fun('?54,bool)). (#forall:fun(fun(list('?53),bool),bool) (\l1:list('?53). (#forall:fun(fun(list('?54),bool),bool) (\l2:list('?54). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) k:num) (#LENGTH:fun(list('?53),num) l1:list('?53)))) ((#/\:fun(bool,fun(bool,bool)) (((#ALL2:fun(fun('?53,fun('?54,bool)),fun(list('?53),fun(list('?54),bool))) P:fun('?53,fun('?54,bool))) l1:list('?53)) l2:list('?54))) ((#<:fun(num,fun(num,bool)) n:num) k:num)))) ((P:fun('?53,fun('?54,bool)) ((#EL:fun(num,fun(list('?53),'?53)) n:num) l1:list('?53))) ((#EL:fun(num,fun(list('?54),'?54)) n:num) l2:list('?54))))))))))))))
      #|ALL2_EL_LT =  |- (#forall:fun(fun(fun('?55,fun('?56,bool)),bool),bool) (\P:fun('?55,fun('?56,bool)). (#forall:fun(fun(list('?55),bool),bool) (\l1:list('?55). (#forall:fun(fun(list('?56),bool),bool) (\l2:list('?56). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#ALL2:fun(fun('?55,fun('?56,bool)),fun(list('?55),fun(list('?56),bool))) P:fun('?55,fun('?56,bool))) l1:list('?55)) l2:list('?56))) ((#<:fun(num,fun(num,bool)) n:num) (#LENGTH:fun(list('?55),num) l1:list('?55))))) ((P:fun('?55,fun('?56,bool)) ((#EL:fun(num,fun(list('?55),'?55)) n:num) l1:list('?55))) ((#EL:fun(num,fun(list('?56),'?56)) n:num) l2:list('?56))))))))))))
      #|ALL2_EL_LEM =  |- (#forall:fun(fun(num,bool),bool) (\k:num. (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\P:fun('A,fun('B,bool)). (#forall:fun(fun(list('A),bool),bool) (\l1:list('A). (#forall:fun(fun(list('B),bool),bool) (\l2:list('B). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) k:num) (#LENGTH:fun(list('A),num) l1:list('A)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) k:num) (#LENGTH:fun(list('B),num) l2:list('B)))) (#~:fun(bool,bool) (#?:fun(fun(num,bool),bool) (\i:num. ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) i:num) (#LENGTH:fun(list('A),num) l1:list('A)))) (#~:fun(bool,bool) ((P:fun('A,fun('B,bool)) ((#EL:fun(num,fun(list('A),'A)) i:num) l1:list('A))) ((#EL:fun(num,fun(list('B),'B)) i:num) l2:list('B))))))))))) (((#ALL2:fun(fun('A,fun('B,bool)),fun(list('A),fun(list('B),bool))) P:fun('A,fun('B,bool))) l1:list('A)) l2:list('B)))))))))))
      #|ALL2_EL =  |- (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\P:fun('A,fun('B,bool)). (#forall:fun(fun(list('A),bool),bool) (\l1:list('A). (#forall:fun(fun(list('B),bool),bool) (\l2:list('B). ((#=:fun(bool,fun(bool,bool)) (((#ALL2:fun(fun('A,fun('B,bool)),fun(list('A),fun(list('B),bool))) P:fun('A,fun('B,bool))) l1:list('A)) l2:list('B))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list('A),num) l1:list('A))) (#LENGTH:fun(list('B),num) l2:list('B)))) (#~:fun(bool,bool) (#?:fun(fun(num,bool),bool) (\i:num. ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) i:num) (#LENGTH:fun(list('A),num) l1:list('A)))) (#~:fun(bool,bool) ((P:fun('A,fun('B,bool)) ((#EL:fun(num,fun(list('A),'A)) i:num) l1:list('A))) ((#EL:fun(num,fun(list('B),'B)) i:num) l2:list('B))))))))))))))))
      #|EL_MAP =  |- (#forall:fun(fun(fun('?57,'?58),bool),bool) (\f:fun('?57,'?58). (#forall:fun(fun(list('?57),bool),bool) (\l:list('?57). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) (#LENGTH:fun(list('?57),num) l:list('?57)))) ((#=:fun('?58,fun('?58,bool)) ((#EL:fun(num,fun(list('?58),'?58)) n:num) ((#MAP:fun(fun('?57,'?58),fun(list('?57),list('?58))) f:fun('?57,'?58)) l:list('?57)))) (f:fun('?57,'?58) ((#EL:fun(num,fun(list('?57),'?57)) n:num) l:list('?57)))))))))))
      #|REMOVE_HD_COL =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\ps:list(fun(real,real)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p:fun(real,real)) ps:list(fun(real,real)))) sgns:list(list(sign)))) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) ps:list(fun(real,real))) ((#MAP:fun(fun(list(sign),list(sign)),fun(list(list(sign)),list(list(sign)))) #TL:fun(list(sign),list(sign))) sgns:list(list(sign)))))))))))))
      #|REMOVE_COL1 =  |- (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(fun(real,real),bool),bool) (\p1:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\p2:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\ps:list(fun(real,real)). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p1:fun(real,real)) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p2:fun(real,real)) ps:list(fun(real,real))))) sgns:list(list(sign)))) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p1:fun(real,real)) ps:list(fun(real,real)))) ((#MAP:fun(fun(list(sign),list(sign)),fun(list(list(sign)),list(list(sign)))) (\x:list(sign). ((#CONS:fun(sign,fun(list(sign),list(sign))) (#HD:fun(list(sign),sign) x:list(sign))) (#TL:fun(list(sign),list(sign)) (#TL:fun(list(sign),list(sign)) x:list(sign)))))) sgns:list(list(sign)))))))))))))))
      #|ALL_EL =  |- (#forall:fun(fun(fun('?59,bool),bool),bool) (\P:fun('?59,bool). (#forall:fun(fun(list('?59),bool),bool) (\l:list('?59). ((#=:fun(bool,fun(bool,bool)) ((#ALL:fun(fun('?59,bool),fun(list('?59),bool)) P:fun('?59,bool)) l:list('?59))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) (#LENGTH:fun(list('?59),num) l:list('?59)))) (P:fun('?59,bool) ((#EL:fun(num,fun(list('?59),'?59)) n:num) l:list('?59)))))))))))
      #|INTERPMAT_POL_LENGTH_LEM =  |- (#forall:fun(fun(num,bool),bool) (\k:num. (#forall:fun(fun(list(fun(real,real)),bool),bool) (\pols:list(fun(real,real)). (#forall:fun(fun(list(fun(real,bool)),bool),bool) (\l1:list(fun(real,bool)). (#forall:fun(fun(list(list(sign)),bool),bool) (\l2:list(list(sign)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#ALL2:fun(fun(fun(real,bool),fun(list(sign),bool)),fun(list(fun(real,bool)),fun(list(list(sign)),bool))) (#interpsigns:fun(list(fun(real,real)),fun(fun(real,bool),fun(list(sign),bool))) pols:list(fun(real,real)))) l1:list(fun(real,bool))) l2:list(list(sign)))) ((#=:fun(num,fun(num,bool)) k:num) (#LENGTH:fun(list(list(sign)),num) l2:list(list(sign)))))) ((#ALL:fun(fun(list(sign),bool),fun(list(list(sign)),bool)) (\x:list(sign). ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(sign),num) x:list(sign))) (#LENGTH:fun(list(fun(real,real)),num) pols:list(fun(real,real)))))) l2:list(list(sign))))))))))))
      #|INTERPMAT_POL_LENGTH =  |- (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\pols:list(fun(real,real)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) pols:list(fun(real,real))) sgns:list(list(sign)))) ((#ALL:fun(fun(list(sign),bool),fun(list(list(sign)),bool)) (\x:list(sign). ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(sign),num) x:list(sign))) (#LENGTH:fun(list(fun(real,real)),num) pols:list(fun(real,real)))))) sgns:list(list(sign))))))))))
      #|ALL2_BUTLAST =  |- (#forall:fun(fun(fun('?60,fun('?61,bool)),bool),bool) (\P:fun('?60,fun('?61,bool)). (#forall:fun(fun(list('?60),bool),bool) (\l1:list('?60). (#forall:fun(fun(list('?61),bool),bool) (\l2:list('?61). ((#==>:fun(bool,fun(bool,bool)) (((#ALL2:fun(fun('?60,fun('?61,bool)),fun(list('?60),fun(list('?61),bool))) P:fun('?60,fun('?61,bool))) l1:list('?60)) l2:list('?61))) (((#ALL2:fun(fun('?60,fun('?61,bool)),fun(list('?60),fun(list('?61),bool))) P:fun('?60,fun('?61,bool))) (#BUTLAST:fun(list('?60),list('?60)) l1:list('?60))) (#BUTLAST:fun(list('?61),list('?61)) l2:list('?61))))))))))
      #|REMOVE_LAST =  |- (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\pols:list(fun(real,real)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) pols:list(fun(real,real))) sgns:list(list(sign)))) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) (#BUTLAST:fun(list(fun(real,real)),list(fun(real,real))) pols:list(fun(real,real)))) ((#MAP:fun(fun(list(sign),list(sign)),fun(list(list(sign)),list(list(sign)))) #BUTLAST:fun(list(sign),list(sign))) sgns:list(list(sign)))))))))))
      #|INSERTAT =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(list('?62),fun(list('?62),bool)) (((#INSERTAT:fun(num,fun('?62,fun(list('?62),list('?62)))) (#NUMERAL:fun(num,num) #_0:num)) x:'?62) l:list('?62))) ((#CONS:fun('?62,fun(list('?62),list('?62))) x:'?62) l:list('?62)))) ((#=:fun(list('?62),fun(list('?62),bool)) (((#INSERTAT:fun(num,fun('?62,fun(list('?62),list('?62)))) (#SUC:fun(num,num) n:num)) x:'?62) l:list('?62))) ((#CONS:fun('?62,fun(list('?62),list('?62))) (#HD:fun(list('?62),'?62) l:list('?62))) (((#INSERTAT:fun(num,fun('?62,fun(list('?62),list('?62)))) n:num) x:'?62) (#TL:fun(list('?62),list('?62)) l:list('?62))))))
      #|MAP2_EL_LEM =  |- (#forall:fun(fun(fun('?63,fun('?64,'?65)),bool),bool) (\f:fun('?63,fun('?64,'?65)). (#forall:fun(fun(num,bool),bool) (\k:num. (#forall:fun(fun(list('?63),bool),bool) (\l1:list('?63). (#forall:fun(fun(list('?64),bool),bool) (\l2:list('?64). (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list('?63),num) l1:list('?63))) (#LENGTH:fun(list('?64),num) l2:list('?64)))) ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) i:num) (#LENGTH:fun(list('?63),num) l1:list('?63)))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) k:num) (#LENGTH:fun(list('?63),num) l1:list('?63)))) ((#=:fun('?65,fun('?65,bool)) ((#EL:fun(num,fun(list('?65),'?65)) i:num) (((#MAP2:fun(fun('?63,fun('?64,'?65)),fun(list('?63),fun(list('?64),list('?65)))) f:fun('?63,fun('?64,'?65))) l1:list('?63)) l2:list('?64)))) ((f:fun('?63,fun('?64,'?65)) ((#EL:fun(num,fun(list('?63),'?63)) i:num) l1:list('?63))) ((#EL:fun(num,fun(list('?64),'?64)) i:num) l2:list('?64)))))))))))))))))
      #|MAP2_EL =  |- (#forall:fun(fun(fun('?66,fun('?67,'?68)),bool),bool) (\f:fun('?66,fun('?67,'?68)). (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(list('?66),bool),bool) (\l1:list('?66). (#forall:fun(fun(list('?67),bool),bool) (\l2:list('?67). ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list('?66),num) l1:list('?66))) (#LENGTH:fun(list('?67),num) l2:list('?67)))) ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) i:num) (#LENGTH:fun(list('?66),num) l1:list('?66)))) ((#=:fun('?68,fun('?68,bool)) ((#EL:fun(num,fun(list('?68),'?68)) i:num) (((#MAP2:fun(fun('?66,fun('?67,'?68)),fun(list('?66),fun(list('?67),list('?68)))) f:fun('?66,fun('?67,'?68))) l1:list('?66)) l2:list('?67)))) ((f:fun('?66,fun('?67,'?68)) ((#EL:fun(num,fun(list('?66),'?66)) i:num) l1:list('?66))) ((#EL:fun(num,fun(list('?67),'?67)) i:num) l2:list('?67))))))))))))))
      #|INSERTAT_LENGTH =  |- (#forall:fun(fun('?69,bool),bool) (\x:'?69. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(list('?69),bool),bool) (\l:list('?69). ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) n:num) (#LENGTH:fun(list('?69),num) l:list('?69)))) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list('?69),num) (((#INSERTAT:fun(num,fun('?69,fun(list('?69),list('?69)))) n:num) x:'?69) l:list('?69)))) (#SUC:fun(num,num) (#LENGTH:fun(list('?69),num) l:list('?69)))))))))))
      #|INSERTAT_TL =  |- (#forall:fun(fun('?70,bool),bool) (\x:'?70. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(list('?70),bool),bool) (\l:list('?70). ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) (#LENGTH:fun(list('?70),num) l:list('?70)))) ((#=:fun(list('?70),fun(list('?70),bool)) (((#INSERTAT:fun(num,fun('?70,fun(list('?70),list('?70)))) n:num) x:'?70) (#TL:fun(list('?70),list('?70)) l:list('?70)))) (#TL:fun(list('?70),list('?70)) (((#INSERTAT:fun(num,fun('?70,fun(list('?70),list('?70)))) (#SUC:fun(num,num) n:num)) x:'?70) l:list('?70)))))))))))
      #|INSERTAT_EL =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(list('A),bool),bool) (\l:list('A). ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) n:num) (#LENGTH:fun(list('A),num) l:list('A)))) ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) i:num) (#LENGTH:fun(list('A),num) l:list('A)))) ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) i:num) n:num)) ((#=:fun('A,fun('A,bool)) ((#EL:fun(num,fun(list('A),'A)) i:num) (((#INSERTAT:fun(num,fun('A,fun(list('A),list('A)))) n:num) x:'A) l:list('A)))) ((#EL:fun(num,fun(list('A),'A)) i:num) l:list('A))))) ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) i:num) n:num)) ((#=:fun('A,fun('A,bool)) ((#EL:fun(num,fun(list('A),'A)) i:num) (((#INSERTAT:fun(num,fun('A,fun(list('A),list('A)))) n:num) x:'A) l:list('A)))) x:'A))) ((#==>:fun(bool,fun(bool,bool)) ((#>:fun(num,fun(num,bool)) i:num) n:num)) ((#=:fun('A,fun('A,bool)) ((#EL:fun(num,fun(list('A),'A)) i:num) (((#INSERTAT:fun(num,fun('A,fun(list('A),list('A)))) n:num) x:'A) l:list('A)))) ((#EL:fun(num,fun(list('A),'A)) (#PRE:fun(num,num) i:num)) l:list('A))))))))))))))))
      #|MATINSERT_THM =  |- (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\pols:list(fun(real,real)). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(list(sign),bool),bool) (\psgns:list(sign). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) pols:list(fun(real,real))) sgns:list(list(sign)))) ((#==>:fun(bool,fun(bool,bool)) (((#ALL2:fun(fun(fun(real,bool),fun(sign,bool)),fun(list(fun(real,bool)),fun(list(sign),bool))) (\x:fun(real,bool). (\y:sign. (((#interpsign:fun(fun(real,bool),fun(fun(real,real),fun(sign,bool))) x:fun(real,bool)) p:fun(real,real)) y:sign)))) (#partition_line:fun(list(real),list(fun(real,bool))) pts:list(real))) psgns:list(sign))) ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) n:num) (#LENGTH:fun(list(fun(real,real)),num) pols:list(fun(real,real))))) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) (((#INSERTAT:fun(num,fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real))))) n:num) p:fun(real,real)) pols:list(fun(real,real)))) (((#MAP2:fun(fun(sign,fun(list(sign),list(sign))),fun(list(sign),fun(list(list(sign)),list(list(sign))))) (#INSERTAT:fun(num,fun(sign,fun(list(sign),list(sign)))) n:num)) psgns:list(sign)) sgns:list(list(sign)))))))))))))))))))
      #|INTERP_CONST_POS =  |- (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(list(fun(real,bool)),bool),bool) (\l:list(fun(real,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#real_gt:fun(real,fun(real,bool)) c:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (((#ALL2:fun(fun(fun(real,bool),fun(sign,bool)),fun(list(fun(real,bool)),fun(list(sign),bool))) (\x:fun(real,bool). (\y:sign. (((#interpsign:fun(fun(real,bool),fun(fun(real,real),fun(sign,bool))) x:fun(real,bool)) (\x:real. c:real)) y:sign)))) l:list(fun(real,bool))) ((#REPLICATE:fun(num,fun(sign,list(sign))) (#LENGTH:fun(list(fun(real,bool)),num) l:list(fun(real,bool)))) #Pos:sign)))))))
      #|INTERP_CONST_NEG =  |- (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(list(fun(real,bool)),bool),bool) (\l:list(fun(real,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) c:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (((#ALL2:fun(fun(fun(real,bool),fun(sign,bool)),fun(list(fun(real,bool)),fun(list(sign),bool))) (\x:fun(real,bool). (\y:sign. (((#interpsign:fun(fun(real,bool),fun(fun(real,real),fun(sign,bool))) x:fun(real,bool)) (\x:real. c:real)) y:sign)))) l:list(fun(real,bool))) ((#REPLICATE:fun(num,fun(sign,list(sign))) (#LENGTH:fun(list(fun(real,bool)),num) l:list(fun(real,bool)))) #Neg:sign)))))))
      #|INTERP_CONST_ZERO =  |- (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(list(fun(real,bool)),bool),bool) (\l:list(fun(real,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) c:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (((#ALL2:fun(fun(fun(real,bool),fun(sign,bool)),fun(list(fun(real,bool)),fun(list(sign),bool))) (\x:fun(real,bool). (\y:sign. (((#interpsign:fun(fun(real,bool),fun(fun(real,real),fun(sign,bool))) x:fun(real,bool)) (\x:real. c:real)) y:sign)))) l:list(fun(real,bool))) ((#REPLICATE:fun(num,fun(sign,list(sign))) (#LENGTH:fun(list(fun(real,bool)),num) l:list(fun(real,bool)))) #Zero:sign)))))))
      #|EL_REPLICATE =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun('?71,bool),bool) (\x:'?71. (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) i:num) n:num)) ((#=:fun('?71,fun('?71,bool)) ((#EL:fun(num,fun(list('?71),'?71)) i:num) ((#REPLICATE:fun(num,fun('?71,list('?71))) n:num) x:'?71))) x:'?71))))))))
      #|ALL2_UNKNOWN =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (((#ALL2:fun(fun(fun(real,bool),fun(sign,bool)),fun(list(fun(real,bool)),fun(list(sign),bool))) (\x:fun(real,bool). (\y:sign. (((#interpsign:fun(fun(real,bool),fun(fun(real,real),fun(sign,bool))) x:fun(real,bool)) p:fun(real,real)) y:sign)))) (#partition_line:fun(list(real),list(fun(real,bool))) pts:list(real))) ((#REPLICATE:fun(num,fun(sign,list(sign))) (#LENGTH:fun(list(fun(real,bool)),num) (#partition_line:fun(list(real),list(fun(real,bool))) pts:list(real)))) #Unknown:sign))))))
      #|MATINSERT_THM2 =  |- (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\pols:list(fun(real,real)). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(list(sign),bool),bool) (\psgns:list(sign). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). ((#==>:fun(bool,fun(bool,bool)) (((#ALL2:fun(fun(fun(real,bool),fun(sign,bool)),fun(list(fun(real,bool)),fun(list(sign),bool))) (\x:fun(real,bool). (\y:sign. (((#interpsign:fun(fun(real,bool),fun(fun(real,real),fun(sign,bool))) x:fun(real,bool)) p:fun(real,real)) y:sign)))) (#partition_line:fun(list(real),list(fun(real,bool))) pts:list(real))) psgns:list(sign))) ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) n:num) (#LENGTH:fun(list(fun(real,real)),num) pols:list(fun(real,real))))) ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) pols:list(fun(real,real))) sgns:list(list(sign)))) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) (((#INSERTAT:fun(num,fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real))))) n:num) p:fun(real,real)) pols:list(fun(real,real)))) (((#MAP2:fun(fun(sign,fun(list(sign),list(sign))),fun(list(sign),fun(list(list(sign)),list(list(sign))))) (#INSERTAT:fun(num,fun(sign,fun(list(sign),list(sign)))) n:num)) psgns:list(sign)) sgns:list(list(sign)))))))))))))))))))
      #|INSERTAT_0 =  |- ((#=:fun(fun('?72,fun(list('?72),list('?72))),fun(fun('?72,fun(list('?72),list('?72))),bool)) (#INSERTAT:fun(num,fun('?72,fun(list('?72),list('?72)))) (#NUMERAL:fun(num,num) #_0:num))) #CONS:fun('?72,fun(list('?72),list('?72))))
      #|INFERPSIGN_MATINSERT_THM =  |- (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\pols:list(fun(real,real)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) pols:list(fun(real,real))) sgns:list(list(sign)))) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p:fun(real,real)) pols:list(fun(real,real)))) (((#MAP2:fun(fun(sign,fun(list(sign),list(sign))),fun(list(sign),fun(list(list(sign)),list(list(sign))))) #CONS:fun(sign,fun(list(sign),list(sign)))) ((#REPLICATE:fun(num,fun(sign,list(sign))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #Unknown:sign)) sgns:list(list(sign)))))))))))))
      #|INFERPSIGN_POS =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\ps:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\q:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\qs:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\r:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\rs:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\s:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(list(real),bool),bool) (\pts1:list(real). (#forall:fun(fun(list(real),bool),bool) (\pts2:list(real). (#forall:fun(fun(list(sign),bool),bool) (\s1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\s2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\s3:list(sign). (#forall:fun(fun(list(list(sign)),bool),bool) (\rest:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts1:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) x:real) pts2:list(real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p:fun(real,real)) ps:list(fun(real,real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) q:fun(real,real)) qs:list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) r:fun(real,real)) rs:list(fun(real,real)))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) s1:list(sign))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s2:list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) s3:list(sign))))) rest:list(list(sign)))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,real)),num) ps:list(fun(real,real)))) (#LENGTH:fun(list(sign),num) s1:list(sign)))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,real)),num) qs:list(fun(real,real)))) (#LENGTH:fun(list(sign),num) s2:list(sign)))) ((#==>:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign)))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts1:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (p:fun(real,real) x:real)) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (s:fun(real,real) x:real)) (q:fun(real,real) x:real))) (r:fun(real,real) x:real)))))) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts1:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) x:real) pts2:list(real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p:fun(real,real)) ps:list(fun(real,real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) q:fun(real,real)) qs:list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) r:fun(real,real)) rs:list(fun(real,real)))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) s1:list(sign))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s2:list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) s3:list(sign))))) rest:list(list(sign)))))))))))))))))))))))))))))))))))))))))
      #|INFERPSIGN_NEG =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\ps:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\q:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\qs:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\r:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\rs:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\s:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(list(real),bool),bool) (\pts1:list(real). (#forall:fun(fun(list(real),bool),bool) (\pts2:list(real). (#forall:fun(fun(list(sign),bool),bool) (\s1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\s2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\s3:list(sign). (#forall:fun(fun(list(list(sign)),bool),bool) (\rest:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts1:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) x:real) pts2:list(real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p:fun(real,real)) ps:list(fun(real,real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) q:fun(real,real)) qs:list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) r:fun(real,real)) rs:list(fun(real,real)))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) s1:list(sign))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s2:list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) s3:list(sign))))) rest:list(list(sign)))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,real)),num) ps:list(fun(real,real)))) (#LENGTH:fun(list(sign),num) s1:list(sign)))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,real)),num) qs:list(fun(real,real)))) (#LENGTH:fun(list(sign),num) s2:list(sign)))) ((#==>:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign)))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts1:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (p:fun(real,real) x:real)) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (s:fun(real,real) x:real)) (q:fun(real,real) x:real))) (r:fun(real,real) x:real)))))) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts1:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) x:real) pts2:list(real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p:fun(real,real)) ps:list(fun(real,real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) q:fun(real,real)) qs:list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) r:fun(real,real)) rs:list(fun(real,real)))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) s1:list(sign))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s2:list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) s3:list(sign))))) rest:list(list(sign)))))))))))))))))))))))))))))))))))))))))
      #|INFERPSIGN_POS_EVEN_LEM =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\ps:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\q:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\qs:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\r:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\rs:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\s:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(list(real),bool),bool) (\pts1:list(real). (#forall:fun(fun(list(real),bool),bool) (\pts2:list(real). (#forall:fun(fun(list(sign),bool),bool) (\s1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\s2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\s3:list(sign). (#forall:fun(fun(list(list(sign)),bool),bool) (\rest:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts1:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) x:real) pts2:list(real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p:fun(real,real)) ps:list(fun(real,real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) q:fun(real,real)) qs:list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) r:fun(real,real)) rs:list(fun(real,real)))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) s1:list(sign))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s2:list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) s3:list(sign))))) rest:list(list(sign)))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,real)),num) ps:list(fun(real,real)))) (#LENGTH:fun(list(sign),num) s1:list(sign)))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,real)),num) qs:list(fun(real,real)))) (#LENGTH:fun(list(sign),num) s2:list(sign)))) ((#==>:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign)))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts1:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) a:real) n:num)) (p:fun(real,real) x:real))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (s:fun(real,real) x:real)) (q:fun(real,real) x:real))) (r:fun(real,real) x:real)))))) ((#==>:fun(bool,fun(bool,bool)) ((#<>:fun(real,fun(real,bool)) a:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#==>:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) n:num)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts1:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) x:real) pts2:list(real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p:fun(real,real)) ps:list(fun(real,real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) q:fun(real,real)) qs:list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) r:fun(real,real)) rs:list(fun(real,real)))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) s1:list(sign))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s2:list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) s3:list(sign))))) rest:list(list(sign)))))))))))))))))))))))))))))))))))))))))))))))
      #|SPLIT_LIST_THM =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(list('A),bool),bool) (\l:list('A). ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) (#LENGTH:fun(list('A),num) l:list('A)))) (#?:fun(fun(list('A),bool),bool) (\l1:list('A). (#?:fun(fun(list('A),bool),bool) (\l2:list('A). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(list('A),fun(list('A),bool)) l:list('A)) ((#APPEND:fun(list('A),fun(list('A),list('A))) l1:list('A)) l2:list('A)))) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list('A),num) l1:list('A))) n:num)))))))))))
      #|DIV_EVEN =  |- (#forall:fun(fun(num,bool),bool) (\x:num. ((#==>:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) x:num)) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#DIV:fun(num,fun(num,num)) x:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) x:num))))
      #|PRE_LEM =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) n:num)) (#EVEN:fun(num,bool) (#PRE:fun(num,num) n:num)))) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#==>:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) n:num)) (#ODD:fun(num,bool) (#PRE:fun(num,num) n:num)))))))
      #|EVEN_PRE =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) n:num)) (#EVEN:fun(num,bool) (#PRE:fun(num,num) n:num)))))
      #|ODD_PRE =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) #_0:num)))) ((#==>:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) n:num)) (#ODD:fun(num,bool) (#PRE:fun(num,num) n:num))))))
      #|INFERPSIGN_POS_EVEN =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\ps:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\q:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\qs:list(fun(real,real)). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(fun(real,real),bool),bool) (\r:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\rs:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\s:fun(real,real). (#forall:fun(fun(list(sign),bool),bool) (\s1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\s2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\s3:list(sign). (#forall:fun(fun(list(list(sign)),bool),bool) (\rest:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p:fun(real,real)) ps:list(fun(real,real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) q:fun(real,real)) qs:list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) r:fun(real,real)) rs:list(fun(real,real)))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) s1:list(sign))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s2:list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) s3:list(sign))))) rest:list(list(sign)))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,real)),num) ps:list(fun(real,real)))) (#LENGTH:fun(list(sign),num) s1:list(sign)))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,real)),num) qs:list(fun(real,real)))) (#LENGTH:fun(list(sign),num) s2:list(sign)))) ((#==>:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign))))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) a:real) n:num)) (p:fun(real,real) x:real))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (s:fun(real,real) x:real)) (q:fun(real,real) x:real))) (r:fun(real,real) x:real)))))) ((#==>:fun(bool,fun(bool,bool)) ((#<>:fun(real,fun(real,bool)) a:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#==>:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) n:num)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p:fun(real,real)) ps:list(fun(real,real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) q:fun(real,real)) qs:list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) r:fun(real,real)) rs:list(fun(real,real)))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) s1:list(sign))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s2:list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) s3:list(sign))))) rest:list(list(sign))))))))))))))))))))))))))))))))))))))))))
      #|INFERPSIGN_NEG_EVEN_LEM =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\ps:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\q:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\qs:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\r:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\rs:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\s:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(list(real),bool),bool) (\pts1:list(real). (#forall:fun(fun(list(real),bool),bool) (\pts2:list(real). (#forall:fun(fun(list(sign),bool),bool) (\s1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\s2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\s3:list(sign). (#forall:fun(fun(list(list(sign)),bool),bool) (\rest:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts1:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) x:real) pts2:list(real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p:fun(real,real)) ps:list(fun(real,real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) q:fun(real,real)) qs:list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) r:fun(real,real)) rs:list(fun(real,real)))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) s1:list(sign))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s2:list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) s3:list(sign))))) rest:list(list(sign)))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,real)),num) ps:list(fun(real,real)))) (#LENGTH:fun(list(sign),num) s1:list(sign)))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,real)),num) qs:list(fun(real,real)))) (#LENGTH:fun(list(sign),num) s2:list(sign)))) ((#==>:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign)))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts1:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) a:real) n:num)) (p:fun(real,real) x:real))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (s:fun(real,real) x:real)) (q:fun(real,real) x:real))) (r:fun(real,real) x:real)))))) ((#==>:fun(bool,fun(bool,bool)) ((#<>:fun(real,fun(real,bool)) a:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#==>:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) n:num)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts1:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) x:real) pts2:list(real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p:fun(real,real)) ps:list(fun(real,real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) q:fun(real,real)) qs:list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) r:fun(real,real)) rs:list(fun(real,real)))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) s1:list(sign))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s2:list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) s3:list(sign))))) rest:list(list(sign)))))))))))))))))))))))))))))))))))))))))))))))
      #|INFERPSIGN_NEG_EVEN =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\ps:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\q:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\qs:list(fun(real,real)). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(fun(real,real),bool),bool) (\r:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\rs:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\s:fun(real,real). (#forall:fun(fun(list(sign),bool),bool) (\s1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\s2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\s3:list(sign). (#forall:fun(fun(list(list(sign)),bool),bool) (\rest:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p:fun(real,real)) ps:list(fun(real,real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) q:fun(real,real)) qs:list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) r:fun(real,real)) rs:list(fun(real,real)))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) s1:list(sign))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s2:list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) s3:list(sign))))) rest:list(list(sign)))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,real)),num) ps:list(fun(real,real)))) (#LENGTH:fun(list(sign),num) s1:list(sign)))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,real)),num) qs:list(fun(real,real)))) (#LENGTH:fun(list(sign),num) s2:list(sign)))) ((#==>:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign))))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) a:real) n:num)) (p:fun(real,real) x:real))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (s:fun(real,real) x:real)) (q:fun(real,real) x:real))) (r:fun(real,real) x:real)))))) ((#==>:fun(bool,fun(bool,bool)) ((#<>:fun(real,fun(real,bool)) a:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#==>:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) n:num)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p:fun(real,real)) ps:list(fun(real,real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) q:fun(real,real)) qs:list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) r:fun(real,real)) rs:list(fun(real,real)))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) s1:list(sign))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s2:list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) s3:list(sign))))) rest:list(list(sign))))))))))))))))))))))))))))))))))))))))))
      #|INFERPSIGN_ZERO_EVEN_LEM =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\ps:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\q:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\qs:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\r:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\rs:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\s:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(list(real),bool),bool) (\pts1:list(real). (#forall:fun(fun(list(real),bool),bool) (\pts2:list(real). (#forall:fun(fun(list(sign),bool),bool) (\s1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\s2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\s3:list(sign). (#forall:fun(fun(list(list(sign)),bool),bool) (\rest:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts1:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) x:real) pts2:list(real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p:fun(real,real)) ps:list(fun(real,real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) q:fun(real,real)) qs:list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) r:fun(real,real)) rs:list(fun(real,real)))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) s1:list(sign))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s2:list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s3:list(sign))))) rest:list(list(sign)))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,real)),num) ps:list(fun(real,real)))) (#LENGTH:fun(list(sign),num) s1:list(sign)))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,real)),num) qs:list(fun(real,real)))) (#LENGTH:fun(list(sign),num) s2:list(sign)))) ((#==>:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign)))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts1:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) a:real) n:num)) (p:fun(real,real) x:real))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (s:fun(real,real) x:real)) (q:fun(real,real) x:real))) (r:fun(real,real) x:real)))))) ((#==>:fun(bool,fun(bool,bool)) ((#<>:fun(real,fun(real,bool)) a:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#==>:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) n:num)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts1:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) x:real) pts2:list(real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p:fun(real,real)) ps:list(fun(real,real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) q:fun(real,real)) qs:list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) r:fun(real,real)) rs:list(fun(real,real)))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s1:list(sign))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s2:list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s3:list(sign))))) rest:list(list(sign)))))))))))))))))))))))))))))))))))))))))))))))
      #|INFERPSIGN_ZERO_EVEN =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\ps:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\q:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\qs:list(fun(real,real)). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(fun(real,real),bool),bool) (\r:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\rs:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\s:fun(real,real). (#forall:fun(fun(list(sign),bool),bool) (\s1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\s2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\s3:list(sign). (#forall:fun(fun(list(list(sign)),bool),bool) (\rest:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p:fun(real,real)) ps:list(fun(real,real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) q:fun(real,real)) qs:list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) r:fun(real,real)) rs:list(fun(real,real)))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) s1:list(sign))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s2:list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s3:list(sign))))) rest:list(list(sign)))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,real)),num) ps:list(fun(real,real)))) (#LENGTH:fun(list(sign),num) s1:list(sign)))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,real)),num) qs:list(fun(real,real)))) (#LENGTH:fun(list(sign),num) s2:list(sign)))) ((#==>:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign))))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) a:real) n:num)) (p:fun(real,real) x:real))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (s:fun(real,real) x:real)) (q:fun(real,real) x:real))) (r:fun(real,real) x:real)))))) ((#==>:fun(bool,fun(bool,bool)) ((#<>:fun(real,fun(real,bool)) a:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#==>:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) n:num)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p:fun(real,real)) ps:list(fun(real,real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) q:fun(real,real)) qs:list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) r:fun(real,real)) rs:list(fun(real,real)))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s1:list(sign))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s2:list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s3:list(sign))))) rest:list(list(sign))))))))))))))))))))))))))))))))))))))))))
      #|INFERPSIGN_POS_ODD_POS_LEM =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\ps:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\q:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\qs:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\r:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\rs:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\s:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(list(real),bool),bool) (\pts1:list(real). (#forall:fun(fun(list(real),bool),bool) (\pts2:list(real). (#forall:fun(fun(list(sign),bool),bool) (\s1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\s2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\s3:list(sign). (#forall:fun(fun(list(list(sign)),bool),bool) (\rest:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts1:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) x:real) pts2:list(real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p:fun(real,real)) ps:list(fun(real,real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) q:fun(real,real)) qs:list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) r:fun(real,real)) rs:list(fun(real,real)))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) s1:list(sign))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s2:list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) s3:list(sign))))) rest:list(list(sign)))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,real)),num) ps:list(fun(real,real)))) (#LENGTH:fun(list(sign),num) s1:list(sign)))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,real)),num) qs:list(fun(real,real)))) (#LENGTH:fun(list(sign),num) s2:list(sign)))) ((#==>:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign)))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts1:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) a:real) n:num)) (p:fun(real,real) x:real))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (s:fun(real,real) x:real)) (q:fun(real,real) x:real))) (r:fun(real,real) x:real)))))) ((#==>:fun(bool,fun(bool,bool)) ((#real_gt:fun(real,fun(real,bool)) a:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts1:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) x:real) pts2:list(real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p:fun(real,real)) ps:list(fun(real,real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) q:fun(real,real)) qs:list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) r:fun(real,real)) rs:list(fun(real,real)))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) s1:list(sign))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s2:list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) s3:list(sign))))) rest:list(list(sign))))))))))))))))))))))))))))))))))))))))))))))
      #|INFERPSIGN_POS_ODD_POS =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\ps:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\q:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\qs:list(fun(real,real)). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(fun(real,real),bool),bool) (\r:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\rs:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\s:fun(real,real). (#forall:fun(fun(list(sign),bool),bool) (\s1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\s2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\s3:list(sign). (#forall:fun(fun(list(list(sign)),bool),bool) (\rest:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p:fun(real,real)) ps:list(fun(real,real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) q:fun(real,real)) qs:list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) r:fun(real,real)) rs:list(fun(real,real)))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) s1:list(sign))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s2:list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) s3:list(sign))))) rest:list(list(sign)))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,real)),num) ps:list(fun(real,real)))) (#LENGTH:fun(list(sign),num) s1:list(sign)))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,real)),num) qs:list(fun(real,real)))) (#LENGTH:fun(list(sign),num) s2:list(sign)))) ((#==>:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign))))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) a:real) n:num)) (p:fun(real,real) x:real))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (s:fun(real,real) x:real)) (q:fun(real,real) x:real))) (r:fun(real,real) x:real)))))) ((#==>:fun(bool,fun(bool,bool)) ((#real_gt:fun(real,fun(real,bool)) a:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p:fun(real,real)) ps:list(fun(real,real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) q:fun(real,real)) qs:list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) r:fun(real,real)) rs:list(fun(real,real)))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) s1:list(sign))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s2:list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Pos:sign) s3:list(sign))))) rest:list(list(sign)))))))))))))))))))))))))))))))))))))))))
      #|INFERPSIGN_NEG_ODD_POS_LEM =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\ps:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\q:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\qs:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\r:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\rs:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\s:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(list(real),bool),bool) (\pts1:list(real). (#forall:fun(fun(list(real),bool),bool) (\pts2:list(real). (#forall:fun(fun(list(sign),bool),bool) (\s1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\s2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\s3:list(sign). (#forall:fun(fun(list(list(sign)),bool),bool) (\rest:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts1:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) x:real) pts2:list(real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p:fun(real,real)) ps:list(fun(real,real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) q:fun(real,real)) qs:list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) r:fun(real,real)) rs:list(fun(real,real)))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) s1:list(sign))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s2:list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) s3:list(sign))))) rest:list(list(sign)))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,real)),num) ps:list(fun(real,real)))) (#LENGTH:fun(list(sign),num) s1:list(sign)))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,real)),num) qs:list(fun(real,real)))) (#LENGTH:fun(list(sign),num) s2:list(sign)))) ((#==>:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign)))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts1:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) a:real) n:num)) (p:fun(real,real) x:real))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (s:fun(real,real) x:real)) (q:fun(real,real) x:real))) (r:fun(real,real) x:real)))))) ((#==>:fun(bool,fun(bool,bool)) ((#real_gt:fun(real,fun(real,bool)) a:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts1:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) x:real) pts2:list(real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p:fun(real,real)) ps:list(fun(real,real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) q:fun(real,real)) qs:list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) r:fun(real,real)) rs:list(fun(real,real)))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) s1:list(sign))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s2:list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) s3:list(sign))))) rest:list(list(sign))))))))))))))))))))))))))))))))))))))))))))))
      #|INFERPSIGN_NEG_ODD_POS =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\ps:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\q:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\qs:list(fun(real,real)). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(fun(real,real),bool),bool) (\r:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\rs:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\s:fun(real,real). (#forall:fun(fun(list(sign),bool),bool) (\s1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\s2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\s3:list(sign). (#forall:fun(fun(list(list(sign)),bool),bool) (\rest:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p:fun(real,real)) ps:list(fun(real,real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) q:fun(real,real)) qs:list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) r:fun(real,real)) rs:list(fun(real,real)))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) s1:list(sign))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s2:list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) s3:list(sign))))) rest:list(list(sign)))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,real)),num) ps:list(fun(real,real)))) (#LENGTH:fun(list(sign),num) s1:list(sign)))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,real)),num) qs:list(fun(real,real)))) (#LENGTH:fun(list(sign),num) s2:list(sign)))) ((#==>:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign))))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) a:real) n:num)) (p:fun(real,real) x:real))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (s:fun(real,real) x:real)) (q:fun(real,real) x:real))) (r:fun(real,real) x:real)))))) ((#==>:fun(bool,fun(bool,bool)) ((#real_gt:fun(real,fun(real,bool)) a:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p:fun(real,real)) ps:list(fun(real,real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) q:fun(real,real)) qs:list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) r:fun(real,real)) rs:list(fun(real,real)))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) s1:list(sign))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s2:list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Neg:sign) s3:list(sign))))) rest:list(list(sign)))))))))))))))))))))))))))))))))))))))))
      #|INFERPSIGN_ZERO_ODD_POS_LEM =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\ps:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\q:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\qs:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\r:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\rs:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\s:fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(list(real),bool),bool) (\pts1:list(real). (#forall:fun(fun(list(real),bool),bool) (\pts2:list(real). (#forall:fun(fun(list(sign),bool),bool) (\s1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\s2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\s3:list(sign). (#forall:fun(fun(list(list(sign)),bool),bool) (\rest:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts1:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) x:real) pts2:list(real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p:fun(real,real)) ps:list(fun(real,real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) q:fun(real,real)) qs:list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) r:fun(real,real)) rs:list(fun(real,real)))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) s1:list(sign))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s2:list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s3:list(sign))))) rest:list(list(sign)))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,real)),num) ps:list(fun(real,real)))) (#LENGTH:fun(list(sign),num) s1:list(sign)))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,real)),num) qs:list(fun(real,real)))) (#LENGTH:fun(list(sign),num) s2:list(sign)))) ((#==>:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign)))) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#LENGTH:fun(list(real),num) pts1:list(real)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) a:real) n:num)) (p:fun(real,real) x:real))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (s:fun(real,real) x:real)) (q:fun(real,real) x:real))) (r:fun(real,real) x:real)))))) ((#==>:fun(bool,fun(bool,bool)) ((#real_gt:fun(real,fun(real,bool)) a:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) ((#APPEND:fun(list(real),fun(list(real),list(real))) pts1:list(real)) ((#CONS:fun(real,fun(list(real),list(real))) x:real) pts2:list(real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p:fun(real,real)) ps:list(fun(real,real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) q:fun(real,real)) qs:list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) r:fun(real,real)) rs:list(fun(real,real)))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s1:list(sign))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s2:list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s3:list(sign))))) rest:list(list(sign))))))))))))))))))))))))))))))))))))))))))))))
      #|INFERPSIGN_ZERO_ODD_POS =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(real,real),bool),bool) (\p:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\ps:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\q:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\qs:list(fun(real,real)). (#forall:fun(fun(list(real),bool),bool) (\pts:list(real). (#forall:fun(fun(fun(real,real),bool),bool) (\r:fun(real,real). (#forall:fun(fun(list(fun(real,real)),bool),bool) (\rs:list(fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\s:fun(real,real). (#forall:fun(fun(list(sign),bool),bool) (\s1:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\s2:list(sign). (#forall:fun(fun(list(sign),bool),bool) (\s3:list(sign). (#forall:fun(fun(list(list(sign)),bool),bool) (\rest:list(list(sign)). (#forall:fun(fun(list(list(sign)),bool),bool) (\sgns:list(list(sign)). ((#==>:fun(bool,fun(bool,bool)) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p:fun(real,real)) ps:list(fun(real,real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) q:fun(real,real)) qs:list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) r:fun(real,real)) rs:list(fun(real,real)))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Unknown:sign) s1:list(sign))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s2:list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s3:list(sign))))) rest:list(list(sign)))))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,real)),num) ps:list(fun(real,real)))) (#LENGTH:fun(list(sign),num) s1:list(sign)))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(fun(real,real)),num) qs:list(fun(real,real)))) (#LENGTH:fun(list(sign),num) s2:list(sign)))) ((#==>:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) (#LENGTH:fun(list(list(sign)),num) sgns:list(list(sign))))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) a:real) n:num)) (p:fun(real,real) x:real))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (s:fun(real,real) x:real)) (q:fun(real,real) x:real))) (r:fun(real,real) x:real)))))) ((#==>:fun(bool,fun(bool,bool)) ((#real_gt:fun(real,fun(real,bool)) a:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (((#interpmat:fun(list(real),fun(list(fun(real,real)),fun(list(list(sign)),bool))) pts:list(real)) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) p:fun(real,real)) ps:list(fun(real,real)))) ((#APPEND:fun(list(fun(real,real)),fun(list(fun(real,real)),list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) q:fun(real,real)) qs:list(fun(real,real)))) ((#CONS:fun(fun(real,real),fun(list(fun(real,real)),list(fun(real,real)))) r:fun(real,real)) rs:list(fun(real,real)))))) ((#APPEND:fun(list(list(sign)),fun(list(list(sign)),list(list(sign)))) sgns:list(list(sign))) ((#CONS:fun(list(sign),fun(list(list(sign)),list(list(sign)))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s1:list(sign))) ((#APPEND:fun(list(sign),fun(list(sign),list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s2:list(sign))) ((#CONS:fun(sign,fun(list(sign),list(sign))) #Zero:sign) s3:list(sign))))) rest:list(list(sign)))))))))))))))))))))))))))))))))))))))))
      #|types = sign/0 metric/1 topology/1 tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = INSERTAT SUBLIST interpmat partition_line interpsigns interpsign Unknown Nonzero Neg Pos Zero _162040 _162039 _162038 _162037 _162036 _dest_sign _mk_sign real_ordered_list pneg pneg_aux mono_unbounded nonconstant normal mono_unbounded_below mono_unbounded_above mono_dec mono_inc CHOP_LIST REMOVE nmax <> degree normalize rsquarefree order poly_divides poly_diff poly_diff_aux poly_exp poly_mul poly_neg poly_cmul poly_add poly differentiable contl diffl tends_real_real suminf summable sums mono subseq lim cauchy convergent tends_num_real tendsto bounded tends dorder mr1 ball mtop mdist metric ismet limpt closed neigh open topology istopology re_compl re_subset re_universe re_null re_intersect re_union re_Union psum superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 339
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?73
      #|counter_genvar = _580307:bool
      #|
    ),
  )
}
