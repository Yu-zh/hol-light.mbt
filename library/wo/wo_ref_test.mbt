// Load-fidelity test for Library/wo.ml: replays tools/ocaml_ref/Library_wo_ref.ml
// (keep in sync; refresh with tools/ocaml_ref/refresh_ref.py).

///|
using @testkit {stm, sthm}

///|
test "Library/wo matches Library/wo.ml" {
  @wo.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot", "impconv", "pair", "compute", "nums", "recursion",
      "arith", "wf", "calc_num", "normalizer", "grobner", "ind_types", "lists", "realax",
      "calc_int", "realarith", "real", "calc_rat", "int", "sets", "iterate", "cart",
      "define", "Library/wo",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Library/wo")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("SUBSET_PRED", () => sthm(@wo.subset_pred()))
  log.attempt("UNIONS_PRED", () => sthm(@wo.unions_pred()))
  log.attempt("fld", () => sthm(@wo.fld()))
  log.attempt("IN_FLD", () => sthm(@wo.in_fld()))
  log.attempt("FLD_EQ_EMPTY", () => sthm(@wo.fld_eq_empty()))
  log.attempt("FLD_SUBSET", () => sthm(@wo.fld_subset()))
  log.attempt("FINITE_FLD", () => sthm(@wo.finite_fld()))
  log.attempt("qoset", () => sthm(@wo.qoset()))
  log.attempt("poset", () => sthm(@wo.poset()))
  log.attempt("toset", () => sthm(@wo.toset()))
  log.attempt("woset", () => sthm(@wo.woset()))
  log.attempt("wqoset", () => sthm(@wo.wqoset()))
  log.attempt("chain", () => sthm(@wo.chain()))
  log.attempt("antichain", () => sthm(@wo.antichain()))
  log.attempt("CHAIN", () => sthm(@wo.chain_v1()))
  log.attempt("ANTICHAIN", () => sthm(@wo.antichain_v1()))
  log.attempt("CHAIN_SUBSET", () => sthm(@wo.chain_subset()))
  log.attempt("ANTICHAIN_SUBSET", () => sthm(@wo.antichain_subset()))
  log.attempt("QOSET_REFL", () => sthm(@wo.qoset_refl()))
  log.attempt("QOSET_TRANS", () => sthm(@wo.qoset_trans()))
  log.attempt("QOSET_REFL_EQ", () => sthm(@wo.qoset_refl_eq()))
  log.attempt("QOSET_FLDEQ", () => sthm(@wo.qoset_fldeq()))
  log.attempt("QOSET_FLD", () => sthm(@wo.qoset_fld()))
  log.attempt("WOSET_IMP_TOSET", () => sthm(@wo.woset_imp_toset()))
  log.attempt("WOSET_IMP_POSET", () => sthm(@wo.woset_imp_poset()))
  log.attempt("WOSET_IMP_QOSET", () => sthm(@wo.woset_imp_qoset()))
  log.attempt("TOSET_IMP_POSET", () => sthm(@wo.toset_imp_poset()))
  log.attempt("TOSET_IMP_QOSET", () => sthm(@wo.toset_imp_qoset()))
  log.attempt("POSET_IMP_QOSET", () => sthm(@wo.poset_imp_qoset()))
  log.attempt("WQOSET_IMP_QOSET", () => sthm(@wo.wqoset_imp_qoset()))
  log.attempt("strictly", () => sthm(@wo.strictly()))
  log.attempt("properly", () => sthm(@wo.properly()))
  log.attempt("PROPERLY_EQ_STRICTLY", () => sthm(@wo.properly_eq_strictly()))
  log.attempt("STRICTLY_EQ_PROPERLY", () => sthm(@wo.strictly_eq_properly()))
  log.attempt("STRICTLY_IMP_PROPERLY", () => sthm(@wo.strictly_imp_properly()))
  log.attempt("STRICTLY_STRICTLY", () => sthm(@wo.strictly_strictly()))
  log.attempt("PROPERLY_PROPERLY", () => sthm(@wo.properly_properly()))
  log.attempt("STRICTLY_PROPERLY", () => sthm(@wo.strictly_properly()))
  log.attempt("PROPERLY_STRICTLY", () => sthm(@wo.properly_strictly()))
  log.attempt("PROPERLY_MONO", () => sthm(@wo.properly_mono()))
  log.attempt("POSET_QOSET", () => sthm(@wo.poset_qoset()))
  log.attempt("TOSET", () => sthm(@wo.toset_v1()))
  log.attempt("TOSET_POSET", () => sthm(@wo.toset_poset()))
  log.attempt("WOSET_TOSET", () => sthm(@wo.woset_toset()))
  log.attempt("WQOSET", () => sthm(@wo.wqoset_v1()))
  log.attempt("WQOSET_QOSET", () => sthm(@wo.wqoset_qoset()))
  log.attempt("WOSET_POSET", () => sthm(@wo.woset_poset()))
  log.attempt("WOSET", () => sthm(@wo.woset_v1()))
  log.attempt("WOSET_WF", () => sthm(@wo.woset_wf()))
  log.attempt("WOSET_IMP_WQOSET", () => sthm(@wo.woset_imp_wqoset()))
  log.attempt("WQOSET_SUPERSET", () => sthm(@wo.wqoset_superset()))
  log.attempt("WQOSET_NOBAD", () => sthm(@wo.wqoset_nobad()))
  log.attempt("WQOSET_NOBAD_SUBSEQ", () => sthm(@wo.wqoset_nobad_subseq()))
  log.attempt("WQOSET_ANTICHAIN", () => sthm(@wo.wqoset_antichain()))
  log.attempt("WQOSET_IMP_WF", () => sthm(@wo.wqoset_imp_wf()))
  log.attempt("WQOSET_WF_SUPERSET", () => sthm(@wo.wqoset_wf_superset()))
  log.attempt("WQOSET_WF_SUPERSET_EQ", () => sthm(@wo.wqoset_wf_superset_eq()))
  log.attempt("WOSET_WQOSET", () => sthm(@wo.woset_wqoset()))
  log.attempt("FLD_RESTRICT_QOSET", () => sthm(@wo.fld_restrict_qoset()))
  log.attempt("FLD_RESTRICT_POSET", () => sthm(@wo.fld_restrict_poset()))
  log.attempt("FLD_RESTRICT_TOSET", () => sthm(@wo.fld_restrict_toset()))
  log.attempt("FLD_RESTRICT_WOSET", () => sthm(@wo.fld_restrict_woset()))
  log.attempt("FLD_RESTRICT_WQOSET", () => sthm(@wo.fld_restrict_wqoset()))
  log.attempt("QOSET_RESTRICT", () => sthm(@wo.qoset_restrict()))
  log.attempt("POSET_RESTRICT", () => sthm(@wo.poset_restrict()))
  log.attempt("TOSET_RESTRICT", () => sthm(@wo.toset_restrict()))
  log.attempt("WOSET_RESTRICT", () => sthm(@wo.woset_restrict()))
  log.attempt("WQOSET_RESTRICT", () => sthm(@wo.wqoset_restrict()))
  log.attempt("QOSET_MIN", () => sthm(@wo.qoset_min()))
  log.attempt("QOSET_MAX", () => sthm(@wo.qoset_max()))
  log.attempt("POSET_MIN", () => sthm(@wo.poset_min()))
  log.attempt("POSET_MAX", () => sthm(@wo.poset_max()))
  log.attempt("TOSET_MIN", () => sthm(@wo.toset_min()))
  log.attempt("TOSET_MAX", () => sthm(@wo.toset_max()))
  log.attempt("FLD_TRIVIAL", () => sthm(@wo.fld_trivial()))
  log.attempt("WOSET_TRIVIAL", () => sthm(@wo.woset_trivial()))
  log.attempt("WQOSET_TRIVIAL", () => sthm(@wo.wqoset_trivial()))
  log.attempt("TOSET_TRIVIAL", () => sthm(@wo.toset_trivial()))
  log.attempt("POSET_TRIVIAL", () => sthm(@wo.poset_trivial()))
  log.attempt("QOSET_TRIVIAL", () => sthm(@wo.qoset_trivial()))
  log.attempt("FLD_num", () => sthm(@wo.fld_num()))
  log.attempt("WOSET_num", () => sthm(@wo.woset_num()))
  log.attempt("WQOSET_num", () => sthm(@wo.wqoset_num()))
  log.attempt("TOSET_num", () => sthm(@wo.toset_num()))
  log.attempt("POSET_num", () => sthm(@wo.poset_num()))
  log.attempt("QOSET_num", () => sthm(@wo.qoset_num()))
  log.attempt("QOSET_POINTWISE", () => sthm(@wo.qoset_pointwise()))
  log.attempt("FLD_POINTWISE", () => sthm(@wo.fld_pointwise()))
  log.attempt("WQOSET_POINTWISE", () => sthm(@wo.wqoset_pointwise()))
  log.attempt("DICKSON", () => sthm(@wo.dickson()))
  log.attempt("inseg", () => sthm(@wo.inseg()))
  log.attempt("INSEG_ANTISYM", () => sthm(@wo.inseg_antisym()))
  log.attempt("INSEG_REFL", () => sthm(@wo.inseg_refl()))
  log.attempt("INSEG_TRANS", () => sthm(@wo.inseg_trans()))
  log.attempt("linseg", () => sthm(@wo.linseg()))
  log.attempt("ordinal", () => sthm(@wo.ordinal()))
  log.attempt("POSET_REFL", () => sthm(@wo.poset_refl()))
  log.attempt("POSET_TRANS", () => sthm(@wo.poset_trans()))
  log.attempt("POSET_ANTISYM", () => sthm(@wo.poset_antisym()))
  log.attempt("POSET_FLDEQ", () => sthm(@wo.poset_fldeq()))
  log.attempt("WOSET_REFL", () => sthm(@wo.woset_refl()))
  log.attempt("WOSET_TRANS", () => sthm(@wo.woset_trans()))
  log.attempt("WOSET_ANTISYM", () => sthm(@wo.woset_antisym()))
  log.attempt("WOSET_TOTAL", () => sthm(@wo.woset_total()))
  log.attempt("WOSET_WELL", () => sthm(@wo.woset_well()))
  log.attempt("WOSET_FLDEQ", () => sthm(@wo.woset_fldeq()))
  log.attempt("WOSET_TRANS_LESS", () => sthm(@wo.woset_trans_less()))
  log.attempt("PAIRED_EXT", () => sthm(@wo.paired_ext()))
  log.attempt("WOSET_TRANS_LE", () => sthm(@wo.woset_trans_le()))
  log.attempt("WOSET_WELL_CONTRAPOS", () => sthm(@wo.woset_well_contrapos()))
  log.attempt("WOSET_TOTAL_LE", () => sthm(@wo.woset_total_le()))
  log.attempt("WOSET_TOTAL_LT", () => sthm(@wo.woset_total_lt()))
  log.attempt("ORDINAL_IMP_WOSET", () => sthm(@wo.ordinal_imp_woset()))
  log.attempt("WOSET_FINITE_TOSET", () => sthm(@wo.woset_finite_toset()))
  log.attempt("UNION_FLD", () => sthm(@wo.union_fld()))
  log.attempt("UNION_INSEG", () => sthm(@wo.union_inseg()))
  log.attempt("INSEG_SUBSET", () => sthm(@wo.inseg_subset()))
  log.attempt("INSEG_SUBSET_FLD", () => sthm(@wo.inseg_subset_fld()))
  log.attempt("INSEG_FLD_SUBSET", () => sthm(@wo.inseg_fld_subset()))
  log.attempt("INSEG_WOSET", () => sthm(@wo.inseg_woset()))
  log.attempt("INSEG_ORDINAL", () => sthm(@wo.inseg_ordinal()))
  log.attempt("LINSEG_INSEG", () => sthm(@wo.linseg_inseg()))
  log.attempt("LINSEG_WOSET", () => sthm(@wo.linseg_woset()))
  log.attempt("LINSEG_FLD", () => sthm(@wo.linseg_fld()))
  log.attempt("INSEG_PROPER_SUBSET", () => sthm(@wo.inseg_proper_subset()))
  log.attempt("INSEG_PROPER_SUBSET_FLD", () => {
    sthm(@wo.inseg_proper_subset_fld())
  })
  log.attempt("INSEG_LINSEG", () => sthm(@wo.inseg_linseg()))
  log.attempt("EXTEND_FLD", () => sthm(@wo.extend_fld()))
  log.attempt("EXTEND_INSEG", () => sthm(@wo.extend_inseg()))
  log.attempt("EXTEND_LINSEG", () => sthm(@wo.extend_linseg()))
  log.attempt("ORDINAL_CHAINED_LEMMA", () => sthm(@wo.ordinal_chained_lemma()))
  log.attempt("ORDINAL_CHAINED", () => sthm(@wo.ordinal_chained()))
  log.attempt("ORDINAL_FLD_UNIQUE", () => sthm(@wo.ordinal_fld_unique()))
  log.attempt("ORDINAL_FLD_SUBSET", () => sthm(@wo.ordinal_fld_subset()))
  log.attempt("ORDINAL_FLD_SUBSET_EQ", () => sthm(@wo.ordinal_fld_subset_eq()))
  log.attempt("FLD_SUC", () => sthm(@wo.fld_suc()))
  log.attempt("ORDINAL_SUC", () => sthm(@wo.ordinal_suc()))
  log.attempt("ORDINAL_UNION", () => sthm(@wo.ordinal_union()))
  log.attempt("ORDINAL_UNION_LEMMA", () => sthm(@wo.ordinal_union_lemma()))
  log.attempt("ORDINAL_UP", () => sthm(@wo.ordinal_up()))
  log.attempt("WO_ORDINAL", () => sthm(@wo.wo_ordinal()))
  log.attempt("FLD_RESTRICT", () => sthm(@wo.fld_restrict()))
  log.attempt("WO", () => sthm(@wo.wo()))
  log.attempt("WF_INSEG_WOSET", () => sthm(@wo.wf_inseg_woset()))
  log.attempt("WOSET_INSEG_ORDINAL", () => sthm(@wo.woset_inseg_ordinal()))
  log.attempt("SUBWOSET_ISO_INSEG", () => sthm(@wo.subwoset_iso_inseg()))
  log.attempt("HP", () => sthm(@wo.hp()))
  log.attempt("ZL_STRONG", () => sthm(@wo.zl_strong()))
  log.attempt("ZL", () => sthm(@wo.zl()))
  log.attempt("KL_POSET_LEMMA", () => sthm(@wo.kl_poset_lemma()))
  log.attempt("KL", () => sthm(@wo.kl()))
  log.attempt("POSET_RESTRICTED_SUBSET", () => {
    sthm(@wo.poset_restricted_subset())
  })
  log.attempt("FLD_RESTRICTED_SUBSET", () => sthm(@wo.fld_restricted_subset()))
  log.attempt("ZL_SUBSETS", () => sthm(@wo.zl_subsets()))
  log.attempt("ZL_SUBSETS_UNIONS", () => sthm(@wo.zl_subsets_unions()))
  log.attempt("ZL_SUBSETS_UNIONS_NONEMPTY", () => {
    sthm(@wo.zl_subsets_unions_nonempty())
  })
  log.attempt("TUKEY", () => sthm(@wo.tukey()))
  log.attempt("OEP", () => sthm(@wo.oep()))
  log.attempt("TOSET_COFINAL_WOSET", () => sthm(@wo.toset_cofinal_woset()))
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
      #|Library/wo quotations (595):
      #|  \226\136\128 P : (_) -> Bool, \226\136\128 Q : (_) -> Bool, SUBSET(P, Q) == (\226\136\128 x : _, P(x) \226\134\146 Q(x))
      #|  UNIONS((P : ((_) -> Bool) -> Bool)) == ((x : _) => \226\136\131 p : (_) -> Bool, P(p) && p(x))
      #|  (fld : ((A, A) -> Bool, A) -> Bool)((R : (A, A) -> Bool)) == {(x : A) | \226\136\131 y : A, R(x, y) || R(y, x)}
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 x : A, IN(x, fld(l)) == (\226\136\131 y : A, l(x, y) || l(y, x))
      #|  \226\136\128 R : (A, A) -> Bool, (fld(R) == {}) == (R == ((x : A) => (y : A) => false))
      #|  \226\136\128 l : (_, _) -> Bool, \226\136\128 r : (_, _) -> Bool, (\226\136\128 x : _, \226\136\128 y : _, l(x, y) \226\134\146 r(x, y)) \226\134\146 SUBSET(fld(l), fld(r))
      #|  \226\136\128 l : (A, A) -> Bool, FINITE(fld(l)) == FINITE({((x : A), (y : A)) | l(x, y)})
      #|  (SND : ((A, A)) -> A)
      #|  (FST : ((A, A)) -> A)
      #|  (qoset : ((A, A) -> Bool) -> Bool)((l : (A, A) -> Bool)) == ((\226\136\128 x : A, IN(x, fld(l)) \226\134\146 l(x, x)) && (\226\136\128 x : A, \226\136\128 y : A, \226\136\128 z : A, l(x, y) && l(y, z) \226\134\146 l(x, z)))
      #|  (poset : ((A, A) -> Bool) -> Bool)((l : (A, A) -> Bool)) == ((\226\136\128 x : A, IN(x, fld(l)) \226\134\146 l(x, x)) && (\226\136\128 x : A, \226\136\128 y : A, \226\136\128 z : A, l(x, y) && l(y, z) \226\134\146 l(x, z)) && (\226\136\128 x : A, \226\136\128 y : A, l(x, y) && l(y, x) \226\134\146 x == y))
      #|  (toset : ((A, A) -> Bool) -> Bool)((l : (A, A) -> Bool)) == ((\226\136\128 x : A, IN(x, fld(l)) \226\134\146 l(x, x)) && (\226\136\128 x : A, \226\136\128 y : A, \226\136\128 z : A, l(x, y) && l(y, z) \226\134\146 l(x, z)) && (\226\136\128 x : A, \226\136\128 y : A, l(x, y) && l(y, x) \226\134\146 x == y) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, fld(l)) && IN(y, fld(l)) \226\134\146 l(x, y) || l(y, x)))
      #|  (woset : ((A, A) -> Bool) -> Bool)((l : (A, A) -> Bool)) == ((\226\136\128 x : A, IN(x, fld(l)) \226\134\146 l(x, x)) && (\226\136\128 x : A, \226\136\128 y : A, \226\136\128 z : A, l(x, y) && l(y, z) \226\134\146 l(x, z)) && (\226\136\128 x : A, \226\136\128 y : A, l(x, y) && l(y, x) \226\134\146 x == y) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, fld(l)) && IN(y, fld(l)) \226\134\146 l(x, y) || l(y, x)) && (\226\136\128 s : (A) -> Bool, SUBSET(s, fld(l)) && !(s == {}) \226\134\146 (\226\136\131 x : A, IN(x, s) && (\226\136\128 y : A, IN(y, s) \226\134\146 l(x, y)))))
      #|  (wqoset : ((A, A) -> Bool) -> Bool)((l : (A, A) -> Bool)) == ((\226\136\128 x : A, IN(x, fld(l)) \226\134\146 l(x, x)) && (\226\136\128 x : A, \226\136\128 y : A, \226\136\128 z : A, l(x, y) && l(y, z) \226\134\146 l(x, z)) && (\226\136\128 s : (A) -> Bool, SUBSET(s, fld(l)) \226\134\146 (\226\136\131 t : (A) -> Bool, FINITE(t) && SUBSET(t, s) && (\226\136\128 y : A, IN(y, s) \226\134\146 (\226\136\131 x : A, IN(x, t) && l(x, y))))))
      #|  (chain : ((A, A) -> Bool, (A) -> Bool) -> Bool)((l : (A, A) -> Bool), (s : (A) -> Bool)) == (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) \226\134\146 l(x, y) || l(y, x))
      #|  (antichain : ((A, A) -> Bool, (A) -> Bool) -> Bool)((l : (A, A) -> Bool), (s : (A) -> Bool)) == (SUBSET(s, fld(l)) && pairwise((x : A) => (y : A) => !l(x, y), s))
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 s : (A) -> Bool, chain(l, s) == (SUBSET(s, fld(l)) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) \226\134\146 l(x, y) || l(y, x)))
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 s : (A) -> Bool, antichain(l, s) == (SUBSET(s, fld(l)) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) && !(x == y) \226\134\146 !l(x, y)))
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, chain(l, s) && SUBSET(t, s) \226\134\146 chain(l, t)
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 s : (A) -> Bool, \226\136\128 t : (A) -> Bool, antichain(l, s) && SUBSET(t, s) \226\134\146 antichain(l, t)
      #|  \226\136\128 l : (A, A) -> Bool, qoset(l) \226\134\146 (\226\136\128 x : A, fld(l, x) \226\134\146 l(x, x))
      #|  \226\136\128 l : (A, A) -> Bool, qoset(l) \226\134\146 (\226\136\128 x : A, \226\136\128 y : A, \226\136\128 z : A, l(x, y) && l(y, z) \226\134\146 l(x, z))
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 x : A, qoset(l) \226\134\146 l(x, x) == IN(x, fld(l))
      #|  \226\136\128 l : (A, A) -> Bool, qoset(l) \226\134\146 (\226\136\128 x : A, fld(l, x) == l(x, x))
      #|  \226\136\128 l : (A, A) -> Bool, qoset(l) \226\134\146 fld(l) == {(x : A) | l(x, x)}
      #|  \226\136\128 l : (A, A) -> Bool, woset(l) \226\134\146 toset(l)
      #|  \226\136\128 l : (A, A) -> Bool, woset(l) \226\134\146 poset(l)
      #|  \226\136\128 l : (A, A) -> Bool, woset(l) \226\134\146 qoset(l)
      #|  \226\136\128 l : (A, A) -> Bool, toset(l) \226\134\146 poset(l)
      #|  \226\136\128 l : (A, A) -> Bool, toset(l) \226\134\146 qoset(l)
      #|  \226\136\128 l : (A, A) -> Bool, poset(l) \226\134\146 qoset(l)
      #|  \226\136\128 l : (A, A) -> Bool, wqoset(l) \226\134\146 qoset(l)
      #|  (strictly : ((A, A) -> Bool, A, A) -> Bool)((R : (A, A) -> Bool)) == ((x : A) => (y : A) => R(x, y) && !R(y, x))
      #|  (properly : ((A, A) -> Bool, A, A) -> Bool)((R : (A, A) -> Bool)) == ((x : A) => (y : A) => R(x, y) && !(x == y))
      #|  \226\136\128 l : (A, A) -> Bool, poset(l) \226\134\146 properly(l) == strictly(l)
      #|  \226\136\128 l : (A, A) -> Bool, poset(l) \226\134\146 strictly(l) == properly(l)
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 x : A, \226\136\128 y : A, qoset(l) && strictly(l, x, y) \226\134\146 properly(l, x, y)
      #|  \226\136\128 R : (A, A) -> Bool, strictly(strictly(R)) == strictly(R)
      #|  \226\136\128 R : (A, A) -> Bool, properly(properly(R)) == properly(R)
      #|  \226\136\128 R : (A, A) -> Bool, strictly(properly(R)) == strictly(R)
      #|  \226\136\128 R : (A, A) -> Bool, properly(strictly(R)) == strictly(R)
      #|  \226\136\128 R : (_, _) -> Bool, \226\136\128 S : (_, _) -> Bool, (\226\136\128 x : _, \226\136\128 y : _, R(x, y) \226\134\146 S(x, y)) \226\134\146 (\226\136\128 x : _, \226\136\128 y : _, properly(R, x, y) \226\134\146 properly(S, x, y))
      #|  \226\136\128 l : (A, A) -> Bool, poset(l) == (qoset(l) && (\226\136\128 x : A, \226\136\128 y : A, l(x, y) && l(y, x) \226\134\146 x == y))
      #|  \226\136\128 l : (A, A) -> Bool, toset(l) == ((\226\136\128 x : A, \226\136\128 y : A, \226\136\128 z : A, l(x, y) && l(y, z) \226\134\146 l(x, z)) && (\226\136\128 x : A, \226\136\128 y : A, l(x, y) && l(y, x) \226\134\146 x == y) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, fld(l)) && IN(y, fld(l)) \226\134\146 l(x, y) || l(y, x)))
      #|  \226\136\128 l : (A, A) -> Bool, toset(l) == (poset(l) && (\226\136\128 x : A, \226\136\128 y : A, IN(x, fld(l)) && IN(y, fld(l)) \226\134\146 l(x, y) || l(y, x)))
      #|  \226\136\128 l : (A, A) -> Bool, woset(l) == (toset(l) && (\226\136\128 s : (A) -> Bool, SUBSET(s, fld(l)) && !(s == {}) \226\134\146 (\226\136\131 x : A, IN(x, s) && (\226\136\128 y : A, IN(y, s) \226\134\146 l(x, y)))))
      #|  {(x : A)}
      #|  (x : A)
      #|  \226\136\128 l : (A, A) -> Bool, wqoset(l) == ((\226\136\128 x : A, \226\136\128 y : A, \226\136\128 z : A, l(x, y) && l(y, z) \226\134\146 l(x, z)) && (\226\136\128 s : (A) -> Bool, SUBSET(s, fld(l)) \226\134\146 (\226\136\131 t : (A) -> Bool, FINITE(t) && SUBSET(t, s) && (\226\136\128 y : A, IN(y, s) \226\134\146 (\226\136\131 x : A, IN(x, t) && l(x, y))))))
      #|  \226\136\128 l : (A, A) -> Bool, wqoset(l) == (qoset(l) && (\226\136\128 s : (A) -> Bool, SUBSET(s, fld(l)) \226\134\146 (\226\136\131 t : (A) -> Bool, FINITE(t) && SUBSET(t, s) && (\226\136\128 y : A, IN(y, s) \226\134\146 (\226\136\131 x : A, IN(x, t) && l(x, y))))))
      #|  {(x : A), (y : A)}
      #|  (y : A)
      #|  (x : A)
      #|  \226\136\128 l : (A, A) -> Bool, woset(l) == (poset(l) && (\226\136\128 s : (A) -> Bool, SUBSET(s, fld(l)) && !(s == {}) \226\134\146 (\226\136\131 x : A, IN(x, s) && (\226\136\128 y : A, IN(y, s) \226\134\146 l(x, y)))))
      #|  {(x : A), (y : A), (z : A)}
      #|  (z : A)
      #|  (y : A)
      #|  (x : A)
      #|  {(x : A), (y : A)}
      #|  (y : A)
      #|  (x : A)
      #|  ((r : Bool) \226\134\146 (p : Bool)) && r && (q : Bool) \226\134\146 p && q && r
      #|  \226\136\128 l : (A, A) -> Bool, woset(l) == ((\226\136\128 x : A, \226\136\128 y : A, l(x, y) && l(y, x) \226\134\146 x == y) && (\226\136\128 s : (A) -> Bool, SUBSET(s, fld(l)) && !(s == {}) \226\134\146 (\226\136\131 x : A, IN(x, s) && (\226\136\128 y : A, IN(y, s) \226\134\146 l(x, y)))))
      #|  {(x : A) | IN(x, fld((l : (A, A) -> Bool))) && (P : (A) -> Bool)(x)}
      #|  (P : (A) -> Bool)
      #|  (x : A) => IN(x, (s : (A) -> Bool))
      #|  (s : (A) -> Bool)
      #|  ((p : Bool) \226\134\146 (q : Bool)) && (q \226\134\146 p == (r : Bool)) \226\134\146 (q && r) == p
      #|  ((p : Bool) \226\134\146 (q : Bool)) && (q \226\134\146 p == (r : Bool)) \226\134\146 p == (q && r)
      #|  \226\136\128 l : (A, A) -> Bool, woset(l) == ((\226\136\128 x : A, \226\136\128 y : A, IN(x, fld(l)) && IN(y, fld(l)) \226\134\146 l(x, y) || l(y, x)) && WF(properly(l)))
      #|  {(x : A)}
      #|  (x : A)
      #|  (s : (A) -> Bool)
      #|  (s : (A) -> Bool) == {}
      #|  (s : (A) -> Bool)
      #|  \226\136\128 l : (A, A) -> Bool, woset(l) \226\134\146 wqoset(l)
      #|  (s : (A) -> Bool)
      #|  (s : (A) -> Bool)
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 m : (A, A) -> Bool, wqoset(l) && qoset(m) && SUBSET(fld(m), fld(l)) && (\226\136\128 x : A, \226\136\128 y : A, l(x, y) \226\134\146 m(x, y)) \226\134\146 wqoset(m)
      #|  FINITE(IMAGE((x : (Num) -> A), UNIV))
      #|  (x : (Num) -> A)
      #|  (y : A) => IN(y, (s : (A) -> Bool)) && (\226\136\128 m : Num, m < (n : Num) \226\134\146 !(l : (A, A) -> Bool)((x : (Num) -> A)(m), y))
      #|  !((p : Bool) && (q : Bool)) == (p \226\134\146 !q)
      #|  IMAGE((x : (Num) -> A), {(m : Num) | m < (n : Num)})
      #|  (n : Num)
      #|  (x : (Num) -> A)
      #|  \226\136\131 x : (Num) -> A, \226\136\128 n : Num, IN(x(n), DIFF((s : (A) -> Bool), UNIONS({{(y : A) | (l : (A, A) -> Bool)(x((m : Num)), y)} | m < n}))) && (\226\136\128 z : A, IN(z, DIFF(s, UNIONS({{(y : A) | l(x((m : Num)), y)} | m < n}))) \226\134\146 !(l(z, x(n)) && !l(x(n), z)))
      #|  (\226\136\131 x : _, (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x) && (R : (_) -> Bool)(x)) == !(\226\136\128 x : _, P(x) && Q(x) \226\134\146 !R(x))
      #|  (s : (A) -> Bool)
      #|  (x : (Num) -> A)((r : (Num) -> Num)(SUC((n : Num))))
      #|  (x : (Num) -> A)((r : (Num) -> Num)((n : Num)))
      #|  SUC((n : Num))
      #|  (n : Num)
      #|  (r : (Num) -> Num)
      #|  (x : (Num) -> A)
      #|  (x : (Num) -> A)
      #|  (s : (A) -> Bool)
      #|  (n : Num) < SUC(n)
      #|  (x : (Num) -> A)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, m < n \226\134\146 (l : (A, A) -> Bool)((x : (Num) -> A)(n), x(m)) && !l(x(m), x(n))
      #|  (x : (Num) -> A)
      #|  (i : Num) => (t : (Num) -> Num)(i) + ((p : Num) + 1)
      #|  (t : (Num) -> Num)
      #|  ((p : Bool) \226\134\146 (q : Bool)) && (p \226\134\146 (r : Bool) == (s : Bool)) \226\134\146 p && r \226\134\146 q && s
      #|  (q : Num)
      #|  (p : Num)
      #|  \226\136\128 p : Num, (\226\136\128 m : Num, (P : (Num) -> Bool)(m) \226\134\146 (Q : (Num) -> Bool)(m - (p + 1))) \226\134\146 (\226\136\131 m : Num, P(m)) \226\134\146 (\226\136\131 m : Num, Q(m))
      #|  !((n : Num) + ((p : Num) + 1) <= p)
      #|  (n : Num) + ((p : Num) + 1)
      #|  (n : Num)
      #|  \226\136\131 t : (Num) -> Num, (\226\136\128 n : Num, true) && (\226\136\128 n : Num, t(n) < t(SUC(n)) && (l : (A, A) -> Bool)((x : (Num) -> A)(t(n) + ((p : Num) + 1)), x(t(SUC(n)) + (p + 1))))
      #|  (p : Num)
      #|  o((x : (Num) -> A), (r : (Num) -> Num))
      #|  (r : (Num) -> Num)
      #|  !INFINITE({(n : Num) | \226\136\128 p : Num, n < p \226\134\146 !(l : (A, A) -> Bool)((x : (Num) -> A)(n), x(p))})
      #|  (x : (Num) -> A)
      #|  IMAGE((x : (Num) -> A), UNIV)
      #|  (x : (Num) -> A)
      #|  ((p : Bool) \226\134\146 (q : Bool)) && (q \226\134\146 (r : Bool)) && (r \226\134\146 (s : Bool)) && (s \226\134\146 p) \226\134\146 p == q && p == r && p == s
      #|  \226\136\128 x : A, \226\136\128 y : A, \226\136\128 z : A, (l : (A, A) -> Bool)(x, y) && l(y, z) \226\134\146 l(x, z)
      #|  \226\136\128 x : A, IN(x, fld((l : (A, A) -> Bool))) \226\134\146 l(x, x)
      #|  (l : (A, A) -> Bool)
      #|  (\226\136\128 l : (A, A) -> Bool, wqoset(l) == (qoset(l) && (\226\136\128 x : (Num) -> A, (\226\136\128 n : Num, IN(x(n), fld(l))) \226\134\146 (\226\136\131 i : Num, \226\136\131 j : Num, i < j && l(x(i), x(j)))))) && (\226\136\128 l : (A, A) -> Bool, wqoset(l) == (qoset(l) && (\226\136\128 x : (Num) -> A, (\226\136\128 n : Num, IN(x(n), fld(l))) \226\134\146 (\226\136\131 r : (Num) -> Num, (\226\136\128 m : Num, \226\136\128 n : Num, m < n \226\134\146 r(m) < r(n)) && (\226\136\128 i : Num, \226\136\128 j : Num, i <= j \226\134\146 l(x(r(i)), x(r(j)))))))) && (\226\136\128 l : (A, A) -> Bool, wqoset(l) == (qoset(l) && WF(strictly(l)) && (\226\136\128 s : (A) -> Bool, antichain(l, s) \226\134\146 FINITE(s))))
      #|  \226\136\128 l : (A, A) -> Bool, wqoset(l) \226\134\146 WF(strictly(l))
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 m : (A, A) -> Bool, wqoset(l) && qoset(m) && SUBSET(fld(m), fld(l)) && (\226\136\128 x : A, \226\136\128 y : A, l(x, y) \226\134\146 m(x, y)) \226\134\146 WF(strictly(m))
      #|  !((n : Num) < (l : Num)) && !((k : Num) < SUC(n)) \226\134\146 !(k < l)
      #|  (l : Num)
      #|  (k : Num)
      #|  (n : Num) < SUC(n)
      #|  (n : Num) < SUC(n)
      #|  (n : Num)
      #|  (a : (Num) -> A)
      #|  (r : Bool) && (r \226\134\146 (p : Bool) && (q : Bool) && (s : Bool)) \226\134\146 p && q && r && s
      #|  (x : A) => (y : A) => (l : (A, A) -> Bool)(x, y) || (\226\136\131 i : Num, \226\136\131 j : Num, i < j && l(x, (a : (Num) -> A)(j)) && l(a(i), y))
      #|  !(\226\136\128 i : _, \226\136\128 j : _, (P : (_, _) -> Bool)(i, j) \226\134\146 !(Q : (_, _) -> Bool)(i, j)) \226\134\146 (\226\136\131 i : _, \226\136\131 j : _, P(i, j) && Q(i, j))
      #|  (a : (Num) -> A)
      #|  \226\136\128 l : (A, A) -> Bool, wqoset(l) == (qoset(l) && (\226\136\128 m : (A, A) -> Bool, qoset(m) && fld(m) == fld(l) && (\226\136\128 x : A, \226\136\128 y : A, l(x, y) \226\134\146 m(x, y)) \226\134\146 WF(strictly(m))))
      #|  \226\136\128 l : (A, A) -> Bool, woset(l) == (toset(l) && wqoset(l))
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 P : (A) -> Bool, qoset(l) \226\134\146 fld((x : A) => (y : A) => P(x) && P(y) && l(x, y)) == {(x : A) | IN(x, fld(l)) && P(x)}
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 P : (A) -> Bool, poset(l) \226\134\146 fld((x : A) => (y : A) => P(x) && P(y) && l(x, y)) == {(x : A) | IN(x, fld(l)) && P(x)}
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 P : (A) -> Bool, toset(l) \226\134\146 fld((x : A) => (y : A) => P(x) && P(y) && l(x, y)) == {(x : A) | IN(x, fld(l)) && P(x)}
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 P : (A) -> Bool, woset(l) \226\134\146 fld((x : A) => (y : A) => P(x) && P(y) && l(x, y)) == {(x : A) | IN(x, fld(l)) && P(x)}
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 P : (A) -> Bool, wqoset(l) \226\134\146 fld((x : A) => (y : A) => P(x) && P(y) && l(x, y)) == {(x : A) | IN(x, fld(l)) && P(x)}
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 P : (A) -> Bool, qoset(l) \226\134\146 qoset((x : A) => (y : A) => P(x) && P(y) && l(x, y))
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 P : (A) -> Bool, poset(l) \226\134\146 poset((x : A) => (y : A) => P(x) && P(y) && l(x, y))
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 P : (A) -> Bool, toset(l) \226\134\146 toset((x : A) => (y : A) => P(x) && P(y) && l(x, y))
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 P : (A) -> Bool, woset(l) \226\134\146 woset((x : A) => (y : A) => P(x) && P(y) && l(x, y))
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 P : (A) -> Bool, wqoset(l) \226\134\146 wqoset((x : A) => (y : A) => P(x) && P(y) && l(x, y))
      #|  !((p : Bool) && !p)
      #|  (s : (A) -> Bool) == {}
      #|  (s : (A) -> Bool)
      #|  (a : A)
      #|  (\226\136\128 l : (A, A) -> Bool, \226\136\128 s : (A) -> Bool, qoset(l) && FINITE(s) && !(s == {}) && SUBSET(s, fld(l)) \226\134\146 (\226\136\131 a : A, IN(a, s) && (\226\136\128 x : A, IN(x, s) \226\134\146 !strictly(l, x, a)))) && (\226\136\128 l : (A, A) -> Bool, \226\136\128 s : (A) -> Bool, qoset(l) && FINITE(s) && !(s == {}) && SUBSET(s, fld(l)) \226\134\146 (\226\136\131 a : A, IN(a, s) && (\226\136\128 x : A, IN(x, s) \226\134\146 !strictly(l, a, x))))
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  false
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  op_bslash_slash
      #|  false
      #|  (\226\136\128 l : (A, A) -> Bool, \226\136\128 s : (A) -> Bool, poset(l) && FINITE(s) && !(s == {}) && SUBSET(s, fld(l)) \226\134\146 (\226\136\131 a : A, IN(a, s) && (\226\136\128 x : A, IN(x, s) \226\134\146 !properly(l, x, a)))) && (\226\136\128 l : (A, A) -> Bool, \226\136\128 s : (A) -> Bool, poset(l) && FINITE(s) && !(s == {}) && SUBSET(s, fld(l)) \226\134\146 (\226\136\131 a : A, IN(a, s) && (\226\136\128 x : A, IN(x, s) \226\134\146 !properly(l, a, x))))
      #|  (\226\136\128 l : (A, A) -> Bool, \226\136\128 s : (A) -> Bool, toset(l) && FINITE(s) && !(s == {}) && SUBSET(s, fld(l)) \226\134\146 (\226\136\131 a : A, IN(a, s) && (\226\136\128 x : A, IN(x, s) \226\134\146 l(a, x)))) && (\226\136\128 l : (A, A) -> Bool, \226\136\128 s : (A) -> Bool, toset(l) && FINITE(s) && !(s == {}) && SUBSET(s, fld(l)) \226\134\146 (\226\136\131 a : A, IN(a, s) && (\226\136\128 x : A, IN(x, s) \226\134\146 l(x, a))))
      #|  fld((x : A) => (y : A) => false) == {}
      #|  woset((x : A) => (y : A) => false)
      #|  wqoset((x : A) => (y : A) => false)
      #|  toset((x : A) => (y : A) => false)
      #|  poset((x : A) => (y : A) => false)
      #|  qoset((x : A) => (y : A) => false)
      #|  fld(op_lt_eq) == UNIV
      #|  woset(op_lt_eq)
      #|  wqoset(op_lt_eq)
      #|  toset(op_lt_eq)
      #|  poset(op_lt_eq)
      #|  qoset(op_lt_eq)
      #|  (i : K) => (y : A)
      #|  (y : A)
      #|  (\226\136\128 a : _, (P : ((_) -> _) -> Bool)((i : _) => a) \226\134\146 (Q : (_) -> Bool)(a)) \226\134\146 (\226\136\128 a : (_) -> _, P(a)) \226\134\146 (\226\136\128 b : _, Q(b))
      #|  (s : (K) -> Bool) == {}
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 s : (K) -> Bool, qoset((x : (K) -> A) => (y : (K) -> A) => \226\136\128 i : K, IN(i, s) \226\134\146 l(x(i), y(i))) == (s == {} || qoset(l))
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 s : (K) -> Bool, qoset(l) \226\134\146 fld((x : (K) -> A) => (y : (K) -> A) => \226\136\128 i : K, IN(i, s) \226\134\146 l(x(i), y(i))) == {(x : (K) -> A) | \226\136\128 i : K, IN(i, s) \226\134\146 IN(x(i), fld(l))}
      #|  o((l : (Num) -> Num), (r : (Num) -> Num))
      #|  (r : (Num) -> Num)
      #|  (i : Num) => (x : (Num, K) -> A)((l : (Num) -> Num)(i), (a : K))
      #|  (l : (Num) -> Num)
      #|  (s : (K) -> Bool)
      #|  (a : K)
      #|  (n : Num) => n
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 s : (K) -> Bool, wqoset(l) && FINITE(s) \226\134\146 wqoset((x : (K) -> A) => (y : (K) -> A) => \226\136\128 i : K, IN(i, s) \226\134\146 l(x(i), y(i)))
      #|  (x : (Num, K) -> A)
      #|  (x : (Num, K) -> A)
      #|  {(m : Num) | m < (n : Num)}
      #|  op_lt_eq
      #|  \226\136\128 n : Num, \226\136\128 x : (Num, Num) -> Num, \226\136\131 i : Num, \226\136\131 j : Num, i < j && (\226\136\128 k : Num, k < n \226\134\146 x(i, k) <= x(j, k))
      #|  (inseg : ((A, A) -> Bool, (A, A) -> Bool) -> Bool)((l : (A, A) -> Bool), (m : (A, A) -> Bool)) == (\226\136\128 x : A, \226\136\128 y : A, l(x, y) == (m(x, y) && fld(l, y)))
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 m : (A, A) -> Bool, inseg(l, m) && inseg(m, l) \226\134\146 l == m
      #|  \226\136\128 l : (A, A) -> Bool, inseg(l, l)
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 m : (A, A) -> Bool, \226\136\128 n : (A, A) -> Bool, inseg(l, m) && inseg(m, n) \226\134\146 inseg(l, n)
      #|  (linseg : ((A, A) -> Bool, A, A, A) -> Bool)((l : (A, A) -> Bool), (a : A)) == ((x : A) => (y : A) => l(x, y) && properly(l, y, a))
      #|  (ordinal : ((A, A) -> Bool) -> Bool)((l : (A, A) -> Bool)) == (woset(l) && (\226\136\128 x : A, fld(l, x) \226\134\146 x == select((y : A) => !properly(l, y, x))))
      #|  poset((l : (A, A) -> Bool))
      #|  (l : (A, A) -> Bool)
      #|  \226\136\128 l : (A, A) -> Bool, poset(l) \226\134\146 (\226\136\128 x : A, fld(l, x) == l(x, x))
      #|  woset((l : (A, A) -> Bool))
      #|  (l : (A, A) -> Bool)
      #|  \226\136\128 l : (A, A) -> Bool, woset(l) \226\134\146 (\226\136\128 x : A, fld(l, x) == l(x, x))
      #|  \226\136\128 l : (A, A) -> Bool, woset(l) \226\134\146 (\226\136\128 x : A, \226\136\128 y : A, \226\136\128 z : A, properly(l, x, y) && l(y, z) \226\134\146 properly(l, x, z))
      #|  \226\136\128 l : (A, B) -> C, \226\136\128 m : (A, B) -> C, (\226\136\128 x : A, \226\136\128 y : B, l(x, y) == m(x, y)) == (l == m)
      #|  \226\136\128 l : (A, A) -> Bool, woset(l) \226\134\146 (\226\136\128 x : A, \226\136\128 y : A, \226\136\128 z : A, l(x, y) && properly(l, y, z) \226\134\146 properly(l, x, z))
      #|  (P : (A) -> Bool)
      #|  \226\136\128 l : (A, A) -> Bool, woset(l) \226\134\146 (\226\136\128 P : (A) -> Bool, (\226\136\128 x : A, P(x) \226\134\146 fld(l, x)) && (\226\136\131 x : A, P(x)) \226\134\146 (\226\136\131 y : A, P(y) && (\226\136\128 z : A, properly(l, z, y) \226\134\146 !P(z))))
      #|  \226\136\128 l : (A, A) -> Bool, woset(l) \226\134\146 (\226\136\128 x : A, \226\136\128 y : A, fld(l, x) && fld(l, y) \226\134\146 l(x, y) || properly(l, y, x))
      #|  \226\136\128 l : (A, A) -> Bool, woset(l) \226\134\146 (\226\136\128 x : A, \226\136\128 y : A, fld(l, x) && fld(l, y) \226\134\146 x == y || properly(l, x, y) || properly(l, y, x))
      #|  \226\136\128 l : (A, A) -> Bool, ordinal(l) \226\134\146 woset(l)
      #|  (a : A)
      #|  \226\136\128 l : (A, A) -> Bool, toset(l) && FINITE({((x : A), (y : A)) | l(x, y)}) \226\134\146 woset(l)
      #|  \226\136\128 P : ((A, A) -> Bool) -> Bool, fld((x : A) => (y : A) => \226\136\131 l : (A, A) -> Bool, P(l) && l(x, y), (x : A)) == (\226\136\131 l : (A, A) -> Bool, P(l) && fld(l, x))
      #|  \226\136\128 P : ((A, A) -> Bool) -> Bool, \226\136\128 l : (A, A) -> Bool, (\226\136\128 m : (A, A) -> Bool, P(m) \226\134\146 inseg(m, l)) \226\134\146 inseg((x : A) => (y : A) => \226\136\131 l : (A, A) -> Bool, P(l) && l(x, y), l)
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 m : (A, A) -> Bool, inseg(m, l) \226\134\146 (\226\136\128 x : A, \226\136\128 y : A, m(x, y) \226\134\146 l(x, y))
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 m : (A, A) -> Bool, inseg(m, l) \226\134\146 (\226\136\128 x : A, fld(m, x) \226\134\146 fld(l, x))
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 m : (A, A) -> Bool, inseg(l, m) \226\134\146 SUBSET(fld(l), fld(m))
      #|  (P : (A) -> Bool)
      #|  (P : (A) -> Bool)
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 m : (A, A) -> Bool, inseg(m, l) && woset(l) \226\134\146 woset(m)
      #|  (x : A)
      #|  (x : A)
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 m : (A, A) -> Bool, inseg(m, l) && ordinal(l) \226\134\146 ordinal(m)
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 a : A, woset(l) \226\134\146 inseg(linseg(l, a), l)
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 a : A, woset(l) \226\134\146 woset(linseg(l, a))
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 a : A, \226\136\128 x : A, woset(l) \226\134\146 fld(linseg(l, a), x) == properly(l, x, a)
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 m : (A, A) -> Bool, inseg(m, l) && !(l == m) \226\134\146 (\226\136\131 x : A, \226\136\131 y : A, l(x, y) && !m(x, y))
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 m : (A, A) -> Bool, inseg(m, l) && !(l == m) \226\134\146 (\226\136\131 a : A, fld(l, a) && !fld(m, a))
      #|  (a : A)
      #|  (a : A)
      #|  (x : A) => fld((l : (A, A) -> Bool), x) && !fld((m : (A, A) -> Bool), x)
      #|  (m : (A, A) -> Bool) == (l : (A, A) -> Bool)
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 m : (A, A) -> Bool, woset(l) \226\134\146 inseg(m, l) == (m == l || (\226\136\131 a : A, fld(l, a) && m == linseg(l, a)))
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 x : A, woset(l) \226\134\146 fld((x : A) => (y : A) => l(x, y) && l(y, (a : A)), x) == l(x, a)
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 a : A, woset(l) && fld(l, a) \226\134\146 inseg((x : A) => (y : A) => l(x, y) && l(y, a), l)
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 a : A, woset(l) && fld(l, a) \226\134\146 inseg((x : A) => (y : A) => linseg(l, a, x, y) || y == a && (fld(linseg(l, a), x) || x == a), l)
      #|  (k : (A, A) -> Bool) == linseg((m : (A, A) -> Bool), (b : A))
      #|  (a : A) == (b : A)
      #|  (a : A)
      #|  (b : A)
      #|  (a : A)
      #|  (k : (A, A) -> Bool) == (m : (A, A) -> Bool)
      #|  (k : (A, A) -> Bool) == (l : (A, A) -> Bool)
      #|  \226\136\128 k : (A, A) -> Bool, \226\136\128 l : (A, A) -> Bool, \226\136\128 m : (A, A) -> Bool, ordinal(l) && ordinal(m) \226\134\146 inseg(k, l) && inseg(k, m) \226\134\146 k == l || k == m || (\226\136\131 a : A, fld(l, a) && fld(m, a) && k == linseg(l, a) && k == linseg(m, a))
      #|  fld((l : (A, A) -> Bool), (a : A))
      #|  fld((l : (A, A) -> Bool), (a : A))
      #|  fld((l : (A, A) -> Bool), (a : A))
      #|  fld((l : (A, A) -> Bool), (a : A))
      #|  fld((l : (A, A) -> Bool), (a : A))
      #|  fld((l : (A, A) -> Bool), (a : A))
      #|  fld((l : (A, A) -> Bool), (a : A))
      #|  fld((l : (A, A) -> Bool), (a : A))
      #|  fld((l : (A, A) -> Bool), (a : A))
      #|  fld((m : (A, A) -> Bool), (b : A))
      #|  fld((m : (A, A) -> Bool), (b : A))
      #|  fld((m : (A, A) -> Bool), (b : A))
      #|  fld((m : (A, A) -> Bool), (b : A))
      #|  fld((m : (A, A) -> Bool), (b : A))
      #|  fld((m : (A, A) -> Bool), (b : A))
      #|  fld((m : (A, A) -> Bool), (b : A))
      #|  ((x : A) => (y : A) => \226\136\131 k : (A, A) -> Bool, (inseg(k, (l : (A, A) -> Bool)) && inseg(k, (m : (A, A) -> Bool))) && k(x, y)) == linseg(l, (a : A))
      #|  (x : A) => (y : A) => linseg((l : (A, A) -> Bool), (a : A), x, y) || y == a && (fld(linseg(l, a), x) || x == a)
      #|  (a : A)
      #|  (a : A)
      #|  ((x : A) => (y : A) => \226\136\131 k : (A, A) -> Bool, (inseg(k, (l : (A, A) -> Bool)) && inseg(k, (m : (A, A) -> Bool))) && k(x, y)) == linseg(l, (a : A))
      #|  (a : A)
      #|  ((a : Bool) && (b : Bool) \226\134\146 a) && (a && b \226\134\146 b)
      #|  (k : (A, A) -> Bool) => inseg(k, (l : (A, A) -> Bool)) && inseg(k, (m : (A, A) -> Bool))
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 m : (A, A) -> Bool, ordinal(l) && ordinal(m) \226\134\146 inseg(m, l) || inseg(l, m)
      #|  (m : (A, A) -> Bool)
      #|  (l : (A, A) -> Bool)
      #|  (m : (A, A) -> Bool)
      #|  (l : (A, A) -> Bool)
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 m : (A, A) -> Bool, ordinal(l) && ordinal(m) && fld(l) == fld(m) \226\134\146 l == m
      #|  (x : (_, _) -> Bool) == (y : (_, _) -> Bool) \226\134\146 inseg(x, y)
      #|  (m : (A, A) -> Bool)
      #|  (l : (A, A) -> Bool)
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 m : (A, A) -> Bool, ordinal(l) && ordinal(m) && SUBSET(fld(l), fld(m)) \226\134\146 inseg(l, m)
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 m : (A, A) -> Bool, ordinal(l) && ordinal(m) \226\134\146 SUBSET(fld(l), fld(m)) == inseg(l, m)
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 a : A, fld((x : A) => (y : A) => l(x, y) || y == a && (fld(l, x) || x == a), (x : A)) == (fld(l, x) || x == a)
      #|  (a : A)
      #|  (y : A) == (a : A)
      #|  (y : A)
      #|  select((y : A) => !fld((l : (A, A) -> Bool), y)) == (a : A)
      #|  (z : A) == (a : A)
      #|  fld((l : (A, A) -> Bool), (z : A))
      #|  (y : A) == (z : A)
      #|  (y : A)
      #|  \226\136\128 x : A, fld((l : (A, A) -> Bool), x) \226\134\146 x == select((y : A) => !properly(l, y, x))
      #|  (z : A)
      #|  (w : A)
      #|  \226\136\131 x : A, (P : (A) -> Bool)(x) && fld((l : (A, A) -> Bool), x)
      #|  (a : Bool) && (b : Bool) \226\134\146 b
      #|  (x : A) => (P : (A) -> Bool)(x) && fld((l : (A, A) -> Bool), x)
      #|  (w : A)
      #|  (P : (A) -> Bool)
      #|  (x : A)
      #|  (y : A)
      #|  !fld((l : (A, A) -> Bool), (a : A))
      #|  !fld((l : (A, A) -> Bool), (a : A))
      #|  (a : A) == select((y : A) => !fld((l : (A, A) -> Bool), y))
      #|  \226\136\128 l : (A, A) -> Bool, ordinal(l) && (\226\136\131 x : A, !fld(l, x)) \226\134\146 ordinal((x : A) => (y : A) => l(x, y) || y == select((y : A) => !fld(l, y)) && (fld(l, x) || x == select((y : A) => !fld(l, y))))
      #|  ordinal((l : (A, A) -> Bool)) && ordinal((m : (A, A) -> Bool))
      #|  (m : (A, A) -> Bool)
      #|  (l : (A, A) -> Bool)
      #|  (y : A) == (x : A)
      #|  (y : A)
      #|  (x : A)
      #|  \226\136\128 l : (A, A) -> Bool, (P : ((A, A) -> Bool) -> Bool)(l) \226\134\146 ordinal(l)
      #|  (l : (A, A) -> Bool)
      #|  (x : A)
      #|  (b : A)
      #|  (x : A)
      #|  (b : A)
      #|  ordinal((m : (A, A) -> Bool))
      #|  (b : A)
      #|  (b : A)
      #|  (x : A)
      #|  (m : (A, A) -> Bool)
      #|  (l : (A, A) -> Bool)
      #|  (m : (A, A) -> Bool)
      #|  (l : (A, A) -> Bool)
      #|  (P : ((A, A) -> Bool) -> Bool)((m : (A, A) -> Bool))
      #|  (m : (A, A) -> Bool)
      #|  (Q : (A) -> Bool)((x : A))
      #|  (x : A)
      #|  (b : A)
      #|  (b : A)
      #|  (a : A)
      #|  \226\136\131 x : A, fld((l : (A, A) -> Bool), x) && (Q : (A) -> Bool)(x)
      #|  (a : Bool) && (b : Bool) \226\134\146 a
      #|  (x : A) => fld((l : (A, A) -> Bool), x) && (Q : (A) -> Bool)(x)
      #|  ordinal((l : (A, A) -> Bool))
      #|  \226\136\128 l : (A, A) -> Bool, (P : ((A, A) -> Bool) -> Bool)(l) \226\134\146 ordinal(l)
      #|  (l : (A, A) -> Bool)
      #|  \226\136\128 x : A, (Q : (A) -> Bool)(x) \226\134\146 (\226\136\131 l : (A, A) -> Bool, (P : ((A, A) -> Bool) -> Bool)(l) && fld(l, x))
      #|  (a : A)
      #|  (Q : (A) -> Bool)
      #|  (m : (A, A) -> Bool)
      #|  (l : (A, A) -> Bool)
      #|  (m : (A, A) -> Bool)
      #|  (l : (A, A) -> Bool)
      #|  (m : (A, A) -> Bool)
      #|  (l : (A, A) -> Bool)
      #|  (y : A)
      #|  (x : A)
      #|  \226\136\128 P : ((A, A) -> Bool) -> Bool, (\226\136\128 l : (A, A) -> Bool, P(l) \226\134\146 ordinal(l)) \226\134\146 ordinal((x : A) => (y : A) => \226\136\131 l : (A, A) -> Bool, P(l) && l(x, y))
      #|  (l : (A, A) -> Bool)
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 x : A, ordinal(l) \226\134\146 fld(l, x) \226\134\146 fld((a : A) => (b : A) => \226\136\131 l : (A, A) -> Bool, ordinal(l) && l(a, b), x)
      #|  select((y : A) => !fld((l : (A, A) -> Bool), y))
      #|  (x : A) => (y : A) => (l : (A, A) -> Bool)(x, y) || y == select((y : A) => !fld(l, y)) && (fld(l, x) || x == select((y : A) => !fld(l, y)))
      #|  (l : (A, A) -> Bool)
      #|  ((a : Bool) || (b : Bool)) == (!a \226\134\146 b)
      #|  \226\136\128 l : (A, A) -> Bool, ordinal(l) \226\134\146 (\226\136\128 x : A, fld(l, x)) || (\226\136\131 m : (A, A) -> Bool, \226\136\131 x : A, ordinal(m) && fld(m, x) && !fld(l, x))
      #|  (x : A)
      #|  (m : (A, A) -> Bool)
      #|  (a : Bool) && (a \226\134\146 (b : Bool)) \226\134\146 a && b
      #|  (a : A) => (b : A) => \226\136\131 l : (A, A) -> Bool, ordinal(l) && l(a, b)
      #|  \226\136\131 l : (A, A) -> Bool, ordinal(l) && (\226\136\128 x : A, fld(l, x))
      #|  (y : A)
      #|  (x : A)
      #|  (y : A)
      #|  \226\136\128 l : (A, A) -> Bool, woset(l) \226\134\146 (\226\136\128 P : (A) -> Bool, fld((x : A) => (y : A) => P(x) && P(y) && l(x, y), (x : A)) == (P(x) && fld(l, x)))
      #|  (y : A)
      #|  (y : A)
      #|  (Q : (A) -> Bool)
      #|  (Q : (A) -> Bool)
      #|  (x : A) => (y : A) => (P : (A) -> Bool)(x) && P(y) && (l : (A, A) -> Bool)(x, y)
      #|  (l : (A, A) -> Bool)
      #|  \226\136\128 P : (A) -> Bool, \226\136\131 l : (A, A) -> Bool, woset(l) && fld(l) == P
      #|  fld((l : ((A, A) -> Bool, A, A) -> Bool)((w : (A, A) -> Bool)), (a : ((A, A) -> Bool) -> A)(l(w)))
      #|  (l : ((A, A) -> Bool, A, A) -> Bool)((w : (A, A) -> Bool))
      #|  (w : (A, A) -> Bool)
      #|  ((P : Bool) && (x : _) == (y : _)) == (x == y && P)
      #|  {(a : ((A, A) -> Bool) -> A)((x : (A, A) -> Bool)) | (P : ((A, A) -> Bool) -> Bool)(x) && inseg(x, (z : (A, A) -> Bool))}
      #|  woset((z : (A, A) -> Bool))
      #|  (z : (A, A) -> Bool)
      #|  (l : ((A, A) -> Bool, A, A) -> Bool)
      #|  (a : ((A, A) -> Bool) -> A)
      #|  (y : (A, A) -> Bool)
      #|  (P : ((A, A) -> Bool) -> Bool)((y : (A, A) -> Bool))
      #|  (y : (A, A) -> Bool)
      #|  \226\136\128 y : (A, A) -> Bool, \226\136\131 a : A, \226\136\131 z : (A, A) -> Bool, (P : ((A, A) -> Bool) -> Bool)(y) \226\134\146 P(z) && fld(y, a) && linseg(y, a) == z
      #|  \226\136\128 x : (A, A) -> Bool, (P : ((A, A) -> Bool) -> Bool)(x) \226\134\146 woset(x)
      #|  !((p : Bool) && (q : Bool)) == (p \226\134\146 !q)
      #|  (\226\136\131 x : _, (P : (_) -> Bool)(x)) == !(\226\136\128 x : _, !P(x))
      #|  (P : ((A, A) -> Bool) -> Bool)
      #|  WF((x : (A, A) -> Bool) => (y : (A, A) -> Bool) => woset(x) && woset(y) && inseg(x, y) && !(x == y))
      #|  (w : (A, A) -> Bool)
      #|  (w : (A, A) -> Bool)
      #|  (w : (A, A) -> Bool)
      #|  (w : (A, A) -> Bool)
      #|  (w : (A, A) -> Bool)
      #|  (w : (A, A) -> Bool)
      #|  (w : (A, A) -> Bool)
      #|  (w : (A, A) -> Bool)
      #|  (w : (A, A) -> Bool)
      #|  (l : ((A, A) -> Bool, A, A) -> Bool)((w : (A, A) -> Bool))
      #|  woset((x : (A, A) -> Bool) => (y : (A, A) -> Bool) => ordinal(x) && ordinal(y) && inseg(x, y))
      #|  (\226\136\128 x : _, \226\136\128 y : _, (P : (_, _) -> Bool)(x, y) && P(y, x) \226\134\146 (Q : (_, _) -> Bool)(x, y)) \226\134\146 (\226\136\128 x : _, \226\136\128 y : _, P(x, y)) \226\134\146 (\226\136\128 x : _, \226\136\128 y : _, Q(x, y))
      #|  (f : (A) -> A)((y : A))
      #|  (x : A)
      #|  \226\136\128 x : A, \226\136\128 y : A, IN(x, (s : (A) -> Bool)) && IN(y, s) && properly((l : (A, A) -> Bool), x, y) \226\134\146 properly(l, (f : (A) -> A)(x), f(y))
      #|  \226\136\128 x : A, \226\136\128 z : A, IN(x, (s : (A) -> Bool)) && (l : (A, A) -> Bool)(z, (f : (A) -> A)(x)) \226\134\146 (\226\136\131 u : A, IN(u, s) && l(u, x) && f(u) == z)
      #|  \226\136\128 x : A, \226\136\128 z : A, IN(x, (s : (A) -> Bool)) && properly((l : (A, A) -> Bool), z, (f : (A) -> A)(x)) \226\134\146 (\226\136\131 u : A, IN(u, s) && properly(l, u, x) && f(u) == z)
      #|  DIFF(UNIV, IMAGE((f : (A) -> A), {(u : A) | IN(u, (s : (A) -> Bool)) && properly((l : (A, A) -> Bool), u, (x : A))}))
      #|  (x : A)
      #|  DIFF(UNIV, IMAGE((f : (A) -> A), {(u : A) | IN(u, (s : (A) -> Bool)) && properly((l : (A, A) -> Bool), u, (x : A))}))
      #|  (x : A)
      #|  \226\136\128 x : A, IN(x, (s : (A) -> Bool)) \226\134\146 (l : (A, A) -> Bool)((f : (A) -> A)(x), x)
      #|  (f : (A) -> A)
      #|  \226\136\131 f : (A) -> A, \226\136\128 x : A, f(x) == (m : ((A) -> Bool) -> A)(DIFF(UNIV, IMAGE(f, {(u : A) | IN(u, (s : (A) -> Bool)) && properly((l : (A, A) -> Bool), u, x)})))
      #|  (m : ((A) -> Bool) -> A)
      #|  \226\136\128 l : (A, A) -> Bool, \226\136\128 s : (A) -> Bool, woset(l) && fld(l) == UNIV \226\134\146 (\226\136\131 f : (A) -> A, (\226\136\128 x : A, \226\136\128 y : A, IN(x, s) && IN(y, s) \226\134\146 l(f(x), f(y)) == l(x, y)) && (\226\136\128 x : A, \226\136\128 y : A, IN(y, IMAGE(f, s)) && l(x, y) \226\134\146 IN(x, IMAGE(f, s))))
      #|  (z : A)
      #|  (z : A)
      #|  (y : A)
      #|  (f : (A) -> A)((y : A))
      #|  (z : A)
      #|  chain((l : (A, A) -> Bool), (Q : (A) -> Bool))
      #|  (y : A)
      #|  (z : A)
      #|  (z : A)
      #|  (z : A)
      #|  chain((l : (A, A) -> Bool), (Q : (A) -> Bool))
      #|  fld((l : (A, A) -> Bool), (z : A)) && (\226\136\128 y : A, properly((w : (A, A) -> Bool), y, z) \226\134\146 l(z, (f : (A) -> A)(y)) || l(f(y), z))
      #|  (z : A)
      #|  (z : A)
      #|  (z : A)
      #|  (Q : (A) -> Bool)
      #|  chain((l : (A, A) -> Bool), (y : A) => \226\136\131 x : A, y == (f : (A) -> A)(x))
      #|  (y : A) => \226\136\131 x : A, y == (f : (A) -> A)(x)
      #|  (x : A)
      #|  (y : A)
      #|  (y : A)
      #|  (x : A)
      #|  \226\136\128 x : A, \226\136\128 y : A, (l : (A, A) -> Bool)((f : (A) -> A)(x), f(y)) || l(f(y), f(x))
      #|  properly((w : (A, A) -> Bool), (b : A), (x : A))
      #|  (x : A) == (b : A)
      #|  (x : A)
      #|  \226\136\128 x : A, (w : (A, A) -> Bool)((b : A), (f : (A) -> A)(x))
      #|  (x : A)
      #|  \226\136\128 x : A, (l : (A, A) -> Bool)((b : A), (f : (A) -> A)(x)) || l(f(x), b)
      #|  (x : A)
      #|  \226\136\128 x : A, fld((l : (A, A) -> Bool), (f : (A) -> A)(x))
      #|  (b : A)
      #|  (f : (A) -> A)((b : A)) == b
      #|  WF((x : A) => (y : A) => properly((w : (A, A) -> Bool), x, y))
      #|  \226\136\131 f : (A) -> A, \226\136\128 x : A, f(x) == (if fld((l : (A, A) -> Bool), x) && (\226\136\128 y : A, properly((w : (A, A) -> Bool), y, x) \226\134\146 l(x, f(y)) || l(f(y), x)) { x } else { (b : A) })
      #|  (u : A)
      #|  (u : A)
      #|  (u : A)
      #|  (x : A) => false
      #|  (b : A)
      #|  \226\136\131 x : A, fld((l : (A, A) -> Bool), x)
      #|  (x : A) => fld((l : (A, A) -> Bool), x)
      #|  (x : A) => true
      #|  (w : (A, A) -> Bool)
      #|  \226\136\128 l : (A, A) -> Bool, qoset(l) \226\134\146 (\226\136\131 P : (A) -> Bool, chain(l, P) && (\226\136\128 Q : (A) -> Bool, chain(l, Q) && SUBSET(P, Q) \226\134\146 Q == P))
      #|  SUBSET((M : (A) -> Bool), (x : A) => M(x) || x == (z : A))
      #|  (m : A)
      #|  (m : A)
      #|  (m : A)
      #|  chain((l : (A, A) -> Bool), (M : (A) -> Bool))
      #|  chain((l : (A, A) -> Bool), (x : A) => (M : (A) -> Bool)(x) || x == (z : A))
      #|  (z : A)
      #|  (m : A)
      #|  (m : A)
      #|  (M : (A) -> Bool)
      #|  \226\136\128 c : (A) -> Bool, chain((l : (A, A) -> Bool), c) \226\134\146 (\226\136\131 y : A, fld(l, y) && (\226\136\128 x : A, c(x) \226\134\146 l(x, y)))
      #|  (M : (A) -> Bool)
      #|  \226\136\128 l : (A, A) -> Bool, qoset(l) && (\226\136\128 c : (A) -> Bool, chain(l, c) \226\134\146 (\226\136\131 y : A, IN(y, fld(l)) && (\226\136\128 x : A, IN(x, c) \226\134\146 l(x, y)))) \226\134\146 (\226\136\131 y : A, IN(y, fld(l)) && (\226\136\128 x : A, l(y, x) \226\134\146 l(x, y)))
      #|  (l : (A, A) -> Bool)
      #|  \226\136\128 l : (A, A) -> Bool, poset(l) && (\226\136\128 P : (A) -> Bool, chain(l, P) \226\134\146 (\226\136\131 y : A, fld(l, y) && (\226\136\128 x : A, P(x) \226\134\146 l(x, y)))) \226\134\146 (\226\136\131 y : A, fld(l, y) && (\226\136\128 x : A, l(y, x) \226\134\146 y == x))
      #|  (Q : (A) -> Bool)
      #|  (Q : (A) -> Bool)
      #|  (Q : (A) -> Bool)
      #|  (P : (A) -> Bool)
      #|  poset((c1 : (A) -> Bool) => (c2 : (A) -> Bool) => SUBSET((C : (A) -> Bool), c1) && SUBSET(c1, c2) && chain((l : (A, A) -> Bool), c2))
      #|  (D : (A) -> Bool)
      #|  (D : (A) -> Bool)
      #|  (C : (A) -> Bool)
      #|  (X : (A) -> Bool)
      #|  (X : (A) -> Bool)
      #|  (X : (A) -> Bool)
      #|  (X : (A) -> Bool)
      #|  chain((l : (A, A) -> Bool), (A : (A) -> Bool))
      #|  chain((l : (A, A) -> Bool), (B : (A) -> Bool))
      #|  (B : (A) -> Bool)
      #|  (A : (A) -> Bool)
      #|  (B : (A) -> Bool)
      #|  (A : (A) -> Bool)
      #|  (y : A)
      #|  (x : A)
      #|  (D : (A) -> Bool)
      #|  (a : Bool) && (b : Bool) && (a && b \226\134\146 (c : Bool)) \226\134\146 (a && b) && c
      #|  (P : ((A) -> Bool) -> Bool)((D : (A) -> Bool))
      #|  (D : (A) -> Bool)
      #|  (D : (A) -> Bool)
      #|  (D : (A) -> Bool)
      #|  UNIONS((P : ((A) -> Bool) -> Bool))
      #|  \226\136\131 D : (A) -> Bool, (P : ((A) -> Bool) -> Bool)(D)
      #|  (P : ((A) -> Bool) -> Bool)
      #|  (c1 : (A) -> Bool) => (c2 : (A) -> Bool) => SUBSET((C : (A) -> Bool), c1) && SUBSET(c1, c2) && chain((l : (A, A) -> Bool), c2)
      #|  \226\136\128 l : (A, A) -> Bool, poset(l) \226\134\146 (\226\136\128 C : (A) -> Bool, chain(l, C) \226\134\146 (\226\136\131 P : (A) -> Bool, (chain(l, P) && SUBSET(C, P)) && (\226\136\128 R : (A) -> Bool, chain(l, R) && SUBSET(P, R) \226\134\146 R == P)))
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, poset((x : (_) -> Bool) => (y : (_) -> Bool) => P(x) && P(y) && SUBSET(x, y))
      #|  \226\136\128 P : ((_) -> Bool) -> Bool, fld((x : (_) -> Bool) => (y : (_) -> Bool) => P(x) && P(y) && SUBSET(x, y)) == P
      #|  (x : (A) -> Bool) => (y : (A) -> Bool) => (P : ((A) -> Bool) -> Bool)(x) && P(y) && SUBSET(x, y)
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, (\226\136\128 c : ((A) -> Bool) -> Bool, (\226\136\128 x : (A) -> Bool, IN(x, c) \226\134\146 P(x)) && (\226\136\128 x : (A) -> Bool, \226\136\128 y : (A) -> Bool, IN(x, c) && IN(y, c) \226\134\146 SUBSET(x, y) || SUBSET(y, x)) \226\134\146 (\226\136\131 z : (A) -> Bool, P(z) && (\226\136\128 x : (A) -> Bool, IN(x, c) \226\134\146 SUBSET(x, z)))) \226\134\146 (\226\136\131 a : (A) -> Bool, P(a) && (\226\136\128 x : (A) -> Bool, P(x) && SUBSET(a, x) \226\134\146 a == x))
      #|  UNIONS((c : ((A) -> Bool) -> Bool))
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, (\226\136\128 c : ((A) -> Bool) -> Bool, (\226\136\128 x : (A) -> Bool, IN(x, c) \226\134\146 P(x)) && (\226\136\128 x : (A) -> Bool, \226\136\128 y : (A) -> Bool, IN(x, c) && IN(y, c) \226\134\146 SUBSET(x, y) || SUBSET(y, x)) \226\134\146 P(UNIONS(c))) \226\134\146 (\226\136\131 a : (A) -> Bool, P(a) && (\226\136\128 x : (A) -> Bool, P(x) && SUBSET(a, x) \226\134\146 a == x))
      #|  UNIONS((c : ((A) -> Bool) -> Bool))
      #|  \226\136\131 x : (A) -> Bool, IN(x, (c : ((A) -> Bool) -> Bool))
      #|  \226\136\128 P : ((A) -> Bool) -> Bool, (\226\136\131 x : (A) -> Bool, P(x)) && (\226\136\128 c : ((A) -> Bool) -> Bool, (\226\136\131 x : (A) -> Bool, IN(x, c)) && (\226\136\128 x : (A) -> Bool, IN(x, c) \226\134\146 P(x)) && (\226\136\128 x : (A) -> Bool, \226\136\128 y : (A) -> Bool, IN(x, c) && IN(y, c) \226\134\146 SUBSET(x, y) || SUBSET(y, x)) \226\134\146 P(UNIONS(c))) \226\134\146 (\226\136\131 a : (A) -> Bool, P(a) && (\226\136\128 x : (A) -> Bool, P(x) && SUBSET(a, x) \226\134\146 a == x))
      #|  \226\136\128 d : (A) -> Bool, FINITE(d) \226\134\146 SUBSET(d, UNIONS((c : ((A) -> Bool) -> Bool))) \226\134\146 (\226\136\131 e : (A) -> Bool, IN(e, c) && SUBSET(d, e))
      #|  (c : ((A) -> Bool) -> Bool)
      #|  \226\136\128 s : ((A) -> Bool) -> Bool, !(s == {}) && (\226\136\128 t : (A) -> Bool, (\226\136\128 c : (A) -> Bool, FINITE(c) && SUBSET(c, t) \226\134\146 IN(c, s)) == IN(t, s)) \226\134\146 (\226\136\131 u : (A) -> Bool, IN(u, s) && (\226\136\128 v : (A) -> Bool, IN(v, s) && SUBSET(u, v) \226\134\146 u == v))
      #|  (y : A)
      #|  (x : A)
      #|  (y : A) == (x : A)
      #|  (y : A)
      #|  (x : A)
      #|  (n : A)
      #|  (m : A)
      #|  (n : A)
      #|  (m : A)
      #|  fld((p : (A, A) -> Bool), (y : A))
      #|  fld((p : (A, A) -> Bool), (x : A))
      #|  (y : A) == (x : A)
      #|  (y : A)
      #|  (x : A)
      #|  (n : A)
      #|  (m : A)
      #|  (n : A)
      #|  (m : A)
      #|  (n : A)
      #|  (m : A)
      #|  fld((p : (A, A) -> Bool), (z : A))
      #|  fld((p : (A, A) -> Bool), (y : A))
      #|  fld((p : (A, A) -> Bool), (x : A))
      #|  (y : A) == (x : A)
      #|  (y : A) == (z : A)
      #|  (x : A) == (z : A)
      #|  (z : A)
      #|  (y : A)
      #|  (x : A)
      #|  (q : Bool) && (q \226\134\146 (p : Bool)) \226\134\146 p && q
      #|  (y : A)
      #|  (x : A)
      #|  (x : A) == (y : A)
      #|  \226\136\128 x : A, \226\136\128 y : A, (p : (A, A) -> Bool)(x, y) \226\134\146 (t : (A, A) -> Bool)(x, y)
      #|  (i : A)
      #|  (i : A) => fld((p : (A, A) -> Bool), i) && !(p(i, (x : A)) == p(i, (y : A)))
      #|  \226\136\128 x : A, \226\136\128 y : A, fld((p : (A, A) -> Bool), x) && fld(p, y) && !(x == y) \226\134\146 (\226\136\131 i : A, fld(p, i) && (\226\136\128 j : A, (w : (A, A) -> Bool)(j, i) && !(j == i) \226\134\146 p(j, x) == p(j, y)) && !(p(i, x) == p(i, y)))
      #|  (t : (A, A) -> Bool)
      #|  (t : (A, A) -> Bool) == ((x : A) => (y : A) => fld((p : (A, A) -> Bool), x) && fld(p, y) && (x == y || (\226\136\131 i : A, fld(p, i) && (\226\136\128 j : A, (w : (A, A) -> Bool)(j, i) && !(j == i) \226\134\146 p(j, x) == p(j, y)) && !p(i, x) && p(i, y))))
      #|  (w : (A, A) -> Bool)
      #|  fld((p : (A, A) -> Bool))
      #|  \226\136\128 p : (A, A) -> Bool, poset(p) \226\134\146 (\226\136\131 t : (A, A) -> Bool, toset(t) && fld(t) == fld(p) && (\226\136\128 x : A, \226\136\128 y : A, p(x, y) \226\134\146 t(x, y)))
      #|  (y : (A) -> Bool)
      #|  (\226\136\128 z : _, (P : (_) -> Bool)(z) \226\134\146 IN(z, IMAGE((f : (_) -> _), (s : (_) -> Bool)))) \226\134\146 (\226\136\128 x : _, IN(x, s) && P(f(x)) \226\134\146 (Q : (_) -> Bool)(f(x))) \226\134\146 (\226\136\128 y : _, P(y) \226\134\146 Q(y))
      #|  (f : ((A) -> Bool) -> A)((z : (A) -> Bool))
      #|  (z : (A) -> Bool)
      #|  (x : (A) -> Bool) => (P : (A) -> Bool)((f : ((A) -> Bool) -> A)(x))
      #|  (P : (A) -> Bool)
      #|  fld((l : (_, _) -> Bool), (x : _)) == IN(x, fld(l))
      #|  fld((x : A) => (y : A) => IN(x, IMAGE((f : ((A) -> Bool) -> A), {(v : (A) -> Bool) | (r : ((A) -> Bool, (A) -> Bool) -> Bool)(v, (w : (A) -> Bool)) && !(v == w)})) && IN(y, IMAGE(f, {(v : (A) -> Bool) | r(v, w) && !(v == w)})) && (l : (A, A) -> Bool)(x, y)) == IMAGE(f, {(v : (A) -> Bool) | r(v, w) && !(v == w)})
      #|  (x : A) => (y : A) => IN(x, IMAGE((f : ((A) -> Bool) -> A), {(v : (A) -> Bool) | (r : ((A) -> Bool, (A) -> Bool) -> Bool)(v, (w : (A) -> Bool)) && !(v == w)})) && IN(y, IMAGE(f, {(v : (A) -> Bool) | r(v, w) && !(v == w)})) && (l : (A, A) -> Bool)(x, y)
      #|  !((f : (_) -> _)((x : _)) == f((y : _))) \226\134\146 !(x == y)
      #|  ((l : (_, _) -> Bool)((a : _), (b : _)) || l(b, a)) && (!(b == a) \226\134\146 !l(b, a)) \226\134\146 l(a, b)
      #|  \226\136\128 x : (A) -> Bool, \226\136\128 y : (A) -> Bool, (r : ((A) -> Bool, (A) -> Bool) -> Bool)(x, y) && r(y, (w : (A) -> Bool)) && !(y == w) \226\134\146 (l : (A, A) -> Bool)((f : ((A) -> Bool) -> A)(x), f(y))
      #|  (x : A) => !(g : (A, A) -> Bool)(x, x)
      #|  (g : (A, A) -> Bool)
      #|  (y : _) == select((x : _) => (P : (_) -> Bool)(x)) \226\134\146 (\226\136\131 x : _, P(x)) \226\134\146 P(y)
      #|  (\226\136\128 x : _, \226\136\128 y : _, (P : (_, _) -> Bool)(x, y) \226\134\146 P(y, x)) && (\226\136\128 x : _, \226\136\128 y : _, (R : (_, _) -> Bool)(x, y) \226\134\146 P(x, y)) \226\134\146 (\226\136\128 x : _, \226\136\128 y : _, R(x, y) || R(y, x)) \226\134\146 (\226\136\128 x : _, \226\136\128 y : _, P(x, y))
      #|  \226\136\128 v : (A) -> Bool, \226\136\128 w : (A) -> Bool, (f : ((A) -> Bool) -> A)(v) == f(w) \226\134\146 v == w
      #|  !((p : Bool) && (q : Bool) && (r : Bool)) == (p && q \226\134\146 !r)
      #|  (\226\136\131 w : _, (P : (_) -> Bool)(w)) == !(\226\136\128 w : _, !P(w))
      #|  \226\136\131 w : (A) -> Bool, (\226\136\128 x : A, IN(x, fld((l : (A, A) -> Bool))) \226\134\146 (\226\136\131 v : (A) -> Bool, (r : ((A) -> Bool, (A) -> Bool) -> Bool)(v, w) && !(v == w) && l(x, (f : ((A) -> Bool) -> A)(v)))) && (\226\136\128 z : (A) -> Bool, (\226\136\128 x : A, IN(x, fld(l)) \226\134\146 (\226\136\131 v : (A) -> Bool, r(v, z) && !(v == z) && l(x, f(v)))) \226\134\146 r(w, z))
      #|  \226\136\128 w : (A) -> Bool, IN((f : ((A) -> Bool) -> A)(w), fld((l : (A, A) -> Bool)))
      #|  (p : Bool) == (p' : Bool) && (x' : _) == (x : _) \226\134\146 (if p { x } else { (a : _) }) == (if p' { x' } else { a })
      #|  \226\136\131 f : ((A) -> Bool) -> A, \226\136\128 w : (A) -> Bool, f(w) == (if (\226\136\131 x : A, IN(x, fld((l : (A, A) -> Bool))) && (\226\136\128 v : (A) -> Bool, (r : ((A) -> Bool, (A) -> Bool) -> Bool)(v, w) && !(v == w) \226\134\146 !l(x, f(v)))) { select((x : A) => IN(x, fld(l)) && (\226\136\128 v : (A) -> Bool, r(v, w) && !(v == w) \226\134\146 !l(x, f(v)))) } else { select((x : A) => IN(x, fld(l))) })
      #|  \226\136\131 r : ((A) -> Bool, (A) -> Bool) -> Bool, ordinal(r) && fld(r) == UNIV
      #|  (x : A) => (y : A) => false
      #|  fld((l : (A, A) -> Bool)) == {}
      #|  \226\136\128 l : (A, A) -> Bool, toset(l) \226\134\146 (\226\136\131 w : (A, A) -> Bool, (\226\136\128 x : A, \226\136\128 y : A, w(x, y) \226\134\146 l(x, y)) && woset(w) && (\226\136\128 x : A, IN(x, fld(l)) \226\134\146 (\226\136\131 y : A, IN(y, fld(w)) && l(x, y))))
      #|SUBSET_PRED =  |- (#forall:fun(fun(fun('?1,bool),bool),bool) (\P:fun('?1,bool). (#forall:fun(fun(fun('?1,bool),bool),bool) (\Q:fun('?1,bool). ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('?1,bool),fun(fun('?1,bool),bool)) P:fun('?1,bool)) Q:fun('?1,bool))) (#forall:fun(fun('?1,bool),bool) (\x:'?1. ((#==>:fun(bool,fun(bool,bool)) (P:fun('?1,bool) x:'?1)) (Q:fun('?1,bool) x:'?1)))))))))
      #|UNIONS_PRED =  |- ((#=:fun(fun('?2,bool),fun(fun('?2,bool),bool)) (#UNIONS:fun(fun(fun('?2,bool),bool),fun('?2,bool)) P:fun(fun('?2,bool),bool))) (\x:'?2. (#?:fun(fun(fun('?2,bool),bool),bool) (\p:fun('?2,bool). ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('?2,bool),bool) p:fun('?2,bool))) (p:fun('?2,bool) x:'?2))))))
      #|fld =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) R:fun('A,fun('A,bool)))) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%1:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%1:'A) (#?:fun(fun('A,bool),bool) (\y:'A. ((#\/:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) x:'A) y:'A)) ((R:fun('A,fun('A,bool)) y:'A) x:'A))))) x:'A))))))))
      #|IN_FLD =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) (#?:fun(fun('A,bool),bool) (\y:'A. ((#\/:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) y:'A) x:'A)))))))))
      #|FLD_EQ_EMPTY =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) R:fun('A,fun('A,bool)))) #EMPTY:fun('A,bool))) ((#=:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) R:fun('A,fun('A,bool))) (\x:'A. (\y:'A. #F:bool))))))
      #|FLD_SUBSET =  |- (#forall:fun(fun(fun('?3,fun('?3,bool)),bool),bool) (\l:fun('?3,fun('?3,bool)). (#forall:fun(fun(fun('?3,fun('?3,bool)),bool),bool) (\r:fun('?3,fun('?3,bool)). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('?3,bool),bool) (\x:'?3. (#forall:fun(fun('?3,bool),bool) (\y:'?3. ((#==>:fun(bool,fun(bool,bool)) ((l:fun('?3,fun('?3,bool)) x:'?3) y:'?3)) ((r:fun('?3,fun('?3,bool)) x:'?3) y:'?3))))))) ((#SUBSET:fun(fun('?3,bool),fun(fun('?3,bool),bool)) (#fld:fun(fun('?3,fun('?3,bool)),fun('?3,bool)) l:fun('?3,fun('?3,bool)))) (#fld:fun(fun('?3,fun('?3,bool)),fun('?3,bool)) r:fun('?3,fun('?3,bool)))))))))
      #|FINITE_FLD =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) (#FINITE:fun(fun(prod('A,'A),bool),bool) (#GSPEC:fun(fun(prod('A,'A),bool),fun(prod('A,'A),bool)) (\GEN%PVAR%2:prod('A,'A). (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('A,bool),bool) (\y:'A. (((#SETSPEC:fun(prod('A,'A),fun(bool,fun(prod('A,'A),bool))) GEN%PVAR%2:prod('A,'A)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((#,:fun('A,fun('A,prod('A,'A))) x:'A) y:'A))))))))))))
      #|qoset =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) (#qoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) ((l:fun('A,fun('A,bool)) x:'A) x:'A))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) y:'A) z:'A))) ((l:fun('A,fun('A,bool)) x:'A) z:'A))))))))))))
      #|poset =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) (#poset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) ((l:fun('A,fun('A,bool)) x:'A) x:'A))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) y:'A) z:'A))) ((l:fun('A,fun('A,bool)) x:'A) z:'A))))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) y:'A) x:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)))))))))))
      #|toset =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) (#toset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) ((l:fun('A,fun('A,bool)) x:'A) x:'A))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) y:'A) z:'A))) ((l:fun('A,fun('A,bool)) x:'A) z:'A))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) y:'A) x:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool)))))) ((#\/:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) y:'A) x:'A)))))))))))))
      #|woset =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) ((l:fun('A,fun('A,bool)) x:'A) x:'A))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) y:'A) z:'A))) ((l:fun('A,fun('A,bool)) x:'A) z:'A))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) y:'A) x:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool)))))) ((#\/:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) y:'A) x:'A)))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool))))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((l:fun('A,fun('A,bool)) x:'A) y:'A)))))))))))))))))
      #|wqoset =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) (#wqoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) ((l:fun('A,fun('A,bool)) x:'A) x:'A))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) y:'A) z:'A))) ((l:fun('A,fun('A,bool)) x:'A) z:'A))))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))) ((l:fun('A,fun('A,bool)) x:'A) y:'A)))))))))))))))))))
      #|chain =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) ((#chain:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) l:fun('A,fun('A,bool))) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool)))) ((#\/:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) y:'A) x:'A))))))))))))
      #|antichain =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#antichain:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) l:fun('A,fun('A,bool))) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) ((#pairwise:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) (\x:'A. (\y:'A. (#~:fun(bool,bool) ((l:fun('A,fun('A,bool)) x:'A) y:'A))))) s:fun('A,bool))))))))
      #|CHAIN =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#chain:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) l:fun('A,fun('A,bool))) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool)))) ((#\/:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) y:'A) x:'A)))))))))))))
      #|ANTICHAIN =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#antichain:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) l:fun('A,fun('A,bool))) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))) (#~:fun(bool,bool) ((l:fun('A,fun('A,bool)) x:'A) y:'A)))))))))))))
      #|CHAIN_SUBSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#chain:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) l:fun('A,fun('A,bool))) s:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool)))) ((#chain:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) l:fun('A,fun('A,bool))) t:fun('A,bool)))))))))
      #|ANTICHAIN_SUBSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#antichain:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) l:fun('A,fun('A,bool))) s:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool)))) ((#antichain:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) l:fun('A,fun('A,bool))) t:fun('A,bool)))))))))
      #|QOSET_REFL =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#qoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) x:'A)) ((l:fun('A,fun('A,bool)) x:'A) x:'A)))))))
      #|QOSET_TRANS =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#qoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) y:'A) z:'A))) ((l:fun('A,fun('A,bool)) x:'A) z:'A)))))))))))
      #|QOSET_REFL_EQ =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (#qoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#=:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) x:'A)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))))))))
      #|QOSET_FLDEQ =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#qoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) x:'A)) ((l:fun('A,fun('A,bool)) x:'A) x:'A)))))))
      #|QOSET_FLD =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#qoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool)))) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%3:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%3:'A) ((l:fun('A,fun('A,bool)) x:'A) x:'A)) x:'A)))))))))
      #|WOSET_IMP_TOSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#toset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool))))))
      #|WOSET_IMP_POSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#poset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool))))))
      #|WOSET_IMP_QOSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#qoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool))))))
      #|TOSET_IMP_POSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#toset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#poset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool))))))
      #|TOSET_IMP_QOSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#toset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#qoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool))))))
      #|POSET_IMP_QOSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#poset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#qoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool))))))
      #|WQOSET_IMP_QOSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#wqoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#qoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool))))))
      #|strictly =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). ((#=:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) (#strictly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool)))) (\x:'A. (\y:'A. ((#/\:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) x:'A) y:'A)) (#~:fun(bool,bool) ((R:fun('A,fun('A,bool)) y:'A) x:'A))))))))
      #|properly =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). ((#=:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) (#properly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool)))) (\x:'A. (\y:'A. ((#/\:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) x:'A) y:'A)) (#~:fun(bool,bool) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))))
      #|PROPERLY_EQ_STRICTLY =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#poset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#=:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) (#properly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) l:fun('A,fun('A,bool)))) (#strictly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) l:fun('A,fun('A,bool)))))))
      #|STRICTLY_EQ_PROPERLY =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#poset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#=:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) (#strictly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) l:fun('A,fun('A,bool)))) (#properly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) l:fun('A,fun('A,bool)))))))
      #|STRICTLY_IMP_PROPERLY =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#qoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (((#strictly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) l:fun('A,fun('A,bool))) x:'A) y:'A))) (((#properly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) l:fun('A,fun('A,bool))) x:'A) y:'A))))))))
      #|STRICTLY_STRICTLY =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). ((#=:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) (#strictly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) (#strictly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))))) (#strictly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))))))
      #|PROPERLY_PROPERLY =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). ((#=:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) (#properly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) (#properly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))))) (#properly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))))))
      #|STRICTLY_PROPERLY =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). ((#=:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) (#strictly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) (#properly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))))) (#strictly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))))))
      #|PROPERLY_STRICTLY =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). ((#=:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) (#properly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) (#strictly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))))) (#strictly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))))))
      #|PROPERLY_MONO =  |- (#forall:fun(fun(fun('?4,fun('?4,bool)),bool),bool) (\R:fun('?4,fun('?4,bool)). (#forall:fun(fun(fun('?4,fun('?4,bool)),bool),bool) (\S:fun('?4,fun('?4,bool)). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('?4,bool),bool) (\x:'?4. (#forall:fun(fun('?4,bool),bool) (\y:'?4. ((#==>:fun(bool,fun(bool,bool)) ((R:fun('?4,fun('?4,bool)) x:'?4) y:'?4)) ((S:fun('?4,fun('?4,bool)) x:'?4) y:'?4))))))) (#forall:fun(fun('?4,bool),bool) (\x:'?4. (#forall:fun(fun('?4,bool),bool) (\y:'?4. ((#==>:fun(bool,fun(bool,bool)) (((#properly:fun(fun('?4,fun('?4,bool)),fun('?4,fun('?4,bool))) R:fun('?4,fun('?4,bool))) x:'?4) y:'?4)) (((#properly:fun(fun('?4,fun('?4,bool)),fun('?4,fun('?4,bool))) S:fun('?4,fun('?4,bool))) x:'?4) y:'?4)))))))))))
      #|POSET_QOSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) (#poset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#qoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) y:'A) x:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))))))
      #|TOSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) (#toset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) y:'A) z:'A))) ((l:fun('A,fun('A,bool)) x:'A) z:'A))))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) y:'A) x:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool)))))) ((#\/:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) y:'A) x:'A))))))))))))
      #|TOSET_POSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) (#toset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#poset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool)))))) ((#\/:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) y:'A) x:'A)))))))))))
      #|WOSET_TOSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#toset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool))))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((l:fun('A,fun('A,bool)) x:'A) y:'A))))))))))))))
      #|WQOSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) (#wqoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) y:'A) z:'A))) ((l:fun('A,fun('A,bool)) x:'A) z:'A))))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))) ((l:fun('A,fun('A,bool)) x:'A) y:'A))))))))))))))))))
      #|WQOSET_QOSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) (#wqoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#qoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) (#?:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) t:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) t:fun('A,bool)) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) t:fun('A,bool))) ((l:fun('A,fun('A,bool)) x:'A) y:'A))))))))))))))))))
      #|WOSET_POSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#poset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool))))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((l:fun('A,fun('A,bool)) x:'A) y:'A))))))))))))))
      #|WOSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) y:'A) x:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool))))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool))) ((l:fun('A,fun('A,bool)) x:'A) y:'A))))))))))))))
      #|WOSET_WF =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool)))))) ((#\/:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) y:'A) x:'A)))))))) (#WF:fun(fun('A,fun('A,bool)),bool) (#properly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) l:fun('A,fun('A,bool))))))))
      #|WOSET_IMP_WQOSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#wqoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool))))))
      #|WQOSET_SUPERSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\m:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#wqoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#qoset:fun(fun('A,fun('A,bool)),bool) m:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) m:fun('A,fun('A,bool)))) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((m:fun('A,fun('A,bool)) x:'A) y:'A)))))))))) (#wqoset:fun(fun('A,fun('A,bool)),bool) m:fun('A,fun('A,bool))))))))
      #|WQOSET_NOBAD =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) (#wqoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#qoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun(fun(num,'A),bool),bool) (\x:fun(num,'A). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#IN:fun('A,fun(fun('A,bool),bool)) (x:fun(num,'A) n:num)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))))) (#?:fun(fun(num,bool),bool) (\i:num. (#?:fun(fun(num,bool),bool) (\j:num. ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) i:num) j:num)) ((l:fun('A,fun('A,bool)) (x:fun(num,'A) i:num)) (x:fun(num,'A) j:num))))))))))))))
      #|WQOSET_NOBAD_SUBSEQ =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) (#wqoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#qoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun(fun(num,'A),bool),bool) (\x:fun(num,'A). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#IN:fun('A,fun(fun('A,bool),bool)) (x:fun(num,'A) n:num)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))))) (#?:fun(fun(fun(num,num),bool),bool) (\r:fun(num,num). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) m:num) n:num)) ((#<:fun(num,fun(num,bool)) (r:fun(num,num) m:num)) (r:fun(num,num) n:num)))))))) (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(num,bool),bool) (\j:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) i:num) j:num)) ((l:fun('A,fun('A,bool)) (x:fun(num,'A) (r:fun(num,num) i:num))) (x:fun(num,'A) (r:fun(num,num) j:num))))))))))))))))))
      #|WQOSET_ANTICHAIN =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) (#wqoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#qoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#WF:fun(fun('A,fun('A,bool)),bool) (#strictly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) l:fun('A,fun('A,bool))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#antichain:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) l:fun('A,fun('A,bool))) s:fun('A,bool))) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))))))))))
      #|WQOSET_IMP_WF =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#wqoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#WF:fun(fun('A,fun('A,bool)),bool) (#strictly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) l:fun('A,fun('A,bool)))))))
      #|WQOSET_WF_SUPERSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\m:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#wqoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#qoset:fun(fun('A,fun('A,bool)),bool) m:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) m:fun('A,fun('A,bool)))) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((m:fun('A,fun('A,bool)) x:'A) y:'A)))))))))) (#WF:fun(fun('A,fun('A,bool)),bool) (#strictly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) m:fun('A,fun('A,bool)))))))))
      #|WQOSET_WF_SUPERSET_EQ =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) (#wqoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#qoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\m:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#qoset:fun(fun('A,fun('A,bool)),bool) m:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) m:fun('A,fun('A,bool)))) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((m:fun('A,fun('A,bool)) x:'A) y:'A))))))))) (#WF:fun(fun('A,fun('A,bool)),bool) (#strictly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) m:fun('A,fun('A,bool)))))))))))
      #|WOSET_WQOSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#toset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#wqoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))))))
      #|FLD_RESTRICT_QOSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#qoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) (\x:'A. (\y:'A. ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) y:'A)) ((l:fun('A,fun('A,bool)) x:'A) y:'A))))))) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%4:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%4:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) (P:fun('A,bool) x:'A))) x:'A)))))))))))
      #|FLD_RESTRICT_POSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#poset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) (\x:'A. (\y:'A. ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) y:'A)) ((l:fun('A,fun('A,bool)) x:'A) y:'A))))))) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%5:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%5:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) (P:fun('A,bool) x:'A))) x:'A)))))))))))
      #|FLD_RESTRICT_TOSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#toset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) (\x:'A. (\y:'A. ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) y:'A)) ((l:fun('A,fun('A,bool)) x:'A) y:'A))))))) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%6:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%6:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) (P:fun('A,bool) x:'A))) x:'A)))))))))))
      #|FLD_RESTRICT_WOSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) (\x:'A. (\y:'A. ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) y:'A)) ((l:fun('A,fun('A,bool)) x:'A) y:'A))))))) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%7:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%7:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) (P:fun('A,bool) x:'A))) x:'A)))))))))))
      #|FLD_RESTRICT_WQOSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#wqoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) (\x:'A. (\y:'A. ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) y:'A)) ((l:fun('A,fun('A,bool)) x:'A) y:'A))))))) (#GSPEC:fun(fun('A,bool),fun('A,bool)) (\GEN%PVAR%8:'A. (#?:fun(fun('A,bool),bool) (\x:'A. (((#SETSPEC:fun('A,fun(bool,fun('A,bool))) GEN%PVAR%8:'A) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) (P:fun('A,bool) x:'A))) x:'A)))))))))))
      #|QOSET_RESTRICT =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#qoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#qoset:fun(fun('A,fun('A,bool)),bool) (\x:'A. (\y:'A. ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) y:'A)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)))))))))))
      #|POSET_RESTRICT =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#poset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#poset:fun(fun('A,fun('A,bool)),bool) (\x:'A. (\y:'A. ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) y:'A)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)))))))))))
      #|TOSET_RESTRICT =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#toset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#toset:fun(fun('A,fun('A,bool)),bool) (\x:'A. (\y:'A. ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) y:'A)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)))))))))))
      #|WOSET_RESTRICT =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#woset:fun(fun('A,fun('A,bool)),bool) (\x:'A. (\y:'A. ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) y:'A)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)))))))))))
      #|WQOSET_RESTRICT =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#wqoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#wqoset:fun(fun('A,fun('A,bool)),bool) (\x:'A. (\y:'A. ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) y:'A)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)))))))))))
      #|QOSET_MIN =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#qoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool)))))))) (#?:fun(fun('A,bool),bool) (\a:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#~:fun(bool,bool) (((#strictly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) l:fun('A,fun('A,bool))) x:'A) a:'A)))))))))))))
      #|QOSET_MAX =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#qoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool)))))))) (#?:fun(fun('A,bool),bool) (\a:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#~:fun(bool,bool) (((#strictly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) l:fun('A,fun('A,bool))) a:'A) x:'A)))))))))))))
      #|POSET_MIN =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#poset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool)))))))) (#?:fun(fun('A,bool),bool) (\a:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#~:fun(bool,bool) (((#properly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) l:fun('A,fun('A,bool))) x:'A) a:'A)))))))))))))
      #|POSET_MAX =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#poset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool)))))))) (#?:fun(fun('A,bool),bool) (\a:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) (#~:fun(bool,bool) (((#properly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) l:fun('A,fun('A,bool))) a:'A) x:'A)))))))))))))
      #|TOSET_MIN =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#toset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool)))))))) (#?:fun(fun('A,bool),bool) (\a:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((l:fun('A,fun('A,bool)) a:'A) x:'A))))))))))))
      #|TOSET_MAX =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#toset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) s:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) #EMPTY:fun('A,bool)))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) s:fun('A,bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool)))))))) (#?:fun(fun('A,bool),bool) (\a:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) a:'A) s:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((l:fun('A,fun('A,bool)) x:'A) a:'A))))))))))))
      #|FLD_TRIVIAL =  |- ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) (\x:'A. (\y:'A. #F:bool)))) #EMPTY:fun('A,bool))
      #|WOSET_TRIVIAL =  |- (#woset:fun(fun('A,fun('A,bool)),bool) (\x:'A. (\y:'A. #F:bool)))
      #|WQOSET_TRIVIAL =  |- (#wqoset:fun(fun('A,fun('A,bool)),bool) (\x:'A. (\y:'A. #F:bool)))
      #|TOSET_TRIVIAL =  |- (#toset:fun(fun('A,fun('A,bool)),bool) (\x:'A. (\y:'A. #F:bool)))
      #|POSET_TRIVIAL =  |- (#poset:fun(fun('A,fun('A,bool)),bool) (\x:'A. (\y:'A. #F:bool)))
      #|QOSET_TRIVIAL =  |- (#qoset:fun(fun('A,fun('A,bool)),bool) (\x:'A. (\y:'A. #F:bool)))
      #|FLD_num =  |- ((#=:fun(fun(num,bool),fun(fun(num,bool),bool)) (#fld:fun(fun(num,fun(num,bool)),fun(num,bool)) #<=:fun(num,fun(num,bool)))) #UNIV:fun(num,bool))
      #|WOSET_num =  |- (#woset:fun(fun(num,fun(num,bool)),bool) #<=:fun(num,fun(num,bool)))
      #|WQOSET_num =  |- (#wqoset:fun(fun(num,fun(num,bool)),bool) #<=:fun(num,fun(num,bool)))
      #|TOSET_num =  |- (#toset:fun(fun(num,fun(num,bool)),bool) #<=:fun(num,fun(num,bool)))
      #|POSET_num =  |- (#poset:fun(fun(num,fun(num,bool)),bool) #<=:fun(num,fun(num,bool)))
      #|QOSET_num =  |- (#qoset:fun(fun(num,fun(num,bool)),bool) #<=:fun(num,fun(num,bool)))
      #|QOSET_POINTWISE =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('K,bool),bool),bool) (\s:fun('K,bool). ((#=:fun(bool,fun(bool,bool)) (#qoset:fun(fun(fun('K,'A),fun(fun('K,'A),bool)),bool) (\x:fun('K,'A). (\y:fun('K,'A). (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) s:fun('K,bool))) ((l:fun('A,fun('A,bool)) (x:fun('K,'A) i:'K)) (y:fun('K,'A) i:'K))))))))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun('K,bool),fun(fun('K,bool),bool)) s:fun('K,bool)) #EMPTY:fun('K,bool))) (#qoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))))))))
      #|FLD_POINTWISE =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('K,bool),bool),bool) (\s:fun('K,bool). ((#==>:fun(bool,fun(bool,bool)) (#qoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#=:fun(fun(fun('K,'A),bool),fun(fun(fun('K,'A),bool),bool)) (#fld:fun(fun(fun('K,'A),fun(fun('K,'A),bool)),fun(fun('K,'A),bool)) (\x:fun('K,'A). (\y:fun('K,'A). (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) s:fun('K,bool))) ((l:fun('A,fun('A,bool)) (x:fun('K,'A) i:'K)) (y:fun('K,'A) i:'K))))))))) (#GSPEC:fun(fun(fun('K,'A),bool),fun(fun('K,'A),bool)) (\GEN%PVAR%9:fun('K,'A). (#?:fun(fun(fun('K,'A),bool),bool) (\x:fun('K,'A). (((#SETSPEC:fun(fun('K,'A),fun(bool,fun(fun('K,'A),bool))) GEN%PVAR%9:fun('K,'A)) (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) s:fun('K,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) (x:fun('K,'A) i:'K)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool)))))))) x:fun('K,'A))))))))))))
      #|WQOSET_POINTWISE =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('K,bool),bool),bool) (\s:fun('K,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#wqoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#FINITE:fun(fun('K,bool),bool) s:fun('K,bool)))) (#wqoset:fun(fun(fun('K,'A),fun(fun('K,'A),bool)),bool) (\x:fun('K,'A). (\y:fun('K,'A). (#forall:fun(fun('K,bool),bool) (\i:'K. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('K,fun(fun('K,bool),bool)) i:'K) s:fun('K,bool))) ((l:fun('A,fun('A,bool)) (x:fun('K,'A) i:'K)) (y:fun('K,'A) i:'K)))))))))))))
      #|DICKSON =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(num,fun(num,num)),bool),bool) (\x:fun(num,fun(num,num)). (#?:fun(fun(num,bool),bool) (\i:num. (#?:fun(fun(num,bool),bool) (\j:num. ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) i:num) j:num)) (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) k:num) n:num)) ((#<=:fun(num,fun(num,bool)) ((x:fun(num,fun(num,num)) i:num) k:num)) ((x:fun(num,fun(num,num)) j:num) k:num))))))))))))))
      #|inseg =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\m:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) ((#inseg:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) l:fun('A,fun('A,bool))) m:fun('A,fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#=:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((#/\:fun(bool,fun(bool,bool)) ((m:fun('A,fun('A,bool)) x:'A) y:'A)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) y:'A))))))))))))
      #|INSEG_ANTISYM =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\m:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#inseg:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) l:fun('A,fun('A,bool))) m:fun('A,fun('A,bool)))) ((#inseg:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) m:fun('A,fun('A,bool))) l:fun('A,fun('A,bool))))) ((#=:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) l:fun('A,fun('A,bool))) m:fun('A,fun('A,bool))))))))
      #|INSEG_REFL =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#inseg:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) l:fun('A,fun('A,bool))) l:fun('A,fun('A,bool)))))
      #|INSEG_TRANS =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\m:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\n:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#inseg:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) l:fun('A,fun('A,bool))) m:fun('A,fun('A,bool)))) ((#inseg:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) m:fun('A,fun('A,bool))) n:fun('A,fun('A,bool))))) ((#inseg:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) l:fun('A,fun('A,bool))) n:fun('A,fun('A,bool))))))))))
      #|linseg =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun('A,bool),bool) (\a:'A. ((#=:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) ((#linseg:fun(fun('A,fun('A,bool)),fun('A,fun('A,fun('A,bool)))) l:fun('A,fun('A,bool))) a:'A)) (\x:'A. (\y:'A. ((#/\:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) (((#properly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) l:fun('A,fun('A,bool))) y:'A) a:'A)))))))))
      #|ordinal =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#=:fun(bool,fun(bool,bool)) (#ordinal:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) x:'A)) ((#=:fun('A,fun('A,bool)) x:'A) (#@:fun(fun('A,bool),'A) (\y:'A. (#~:fun(bool,bool) (((#properly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) l:fun('A,fun('A,bool))) y:'A) x:'A))))))))))))
      #|POSET_REFL =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#poset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) x:'A)) ((l:fun('A,fun('A,bool)) x:'A) x:'A)))))))
      #|POSET_TRANS =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#poset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) y:'A) z:'A))) ((l:fun('A,fun('A,bool)) x:'A) z:'A)))))))))))
      #|POSET_ANTISYM =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#poset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) y:'A) x:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)))))))))
      #|POSET_FLDEQ =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#poset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) x:'A)) ((l:fun('A,fun('A,bool)) x:'A) x:'A)))))))
      #|WOSET_REFL =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) x:'A)) ((l:fun('A,fun('A,bool)) x:'A) x:'A)))))))
      #|WOSET_TRANS =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) y:'A) z:'A))) ((l:fun('A,fun('A,bool)) x:'A) z:'A)))))))))))
      #|WOSET_ANTISYM =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) y:'A) x:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)))))))))
      #|WOSET_TOTAL =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) x:'A)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) y:'A))) ((#\/:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) y:'A) x:'A))))))))))
      #|WOSET_WELL =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (s:fun('A,bool) x:'A)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) x:'A))))) (#?:fun(fun('A,bool),bool) (\x:'A. (s:fun('A,bool) x:'A))))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) (s:fun('A,bool) x:'A)) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) (s:fun('A,bool) y:'A)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)))))))))))))
      #|WOSET_FLDEQ =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) x:'A)) ((l:fun('A,fun('A,bool)) x:'A) x:'A)))))))
      #|WOSET_TRANS_LESS =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#properly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) l:fun('A,fun('A,bool))) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) y:'A) z:'A))) (((#properly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) l:fun('A,fun('A,bool))) x:'A) z:'A)))))))))))
      #|PAIRED_EXT =  |- (#forall:fun(fun(fun('A,fun('B,'C)),bool),bool) (\l:fun('A,fun('B,'C)). (#forall:fun(fun(fun('A,fun('B,'C)),bool),bool) (\m:fun('A,fun('B,'C)). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('B,bool),bool) (\y:'B. ((#=:fun('C,fun('C,bool)) ((l:fun('A,fun('B,'C)) x:'A) y:'B)) ((m:fun('A,fun('B,'C)) x:'A) y:'B))))))) ((#=:fun(fun('A,fun('B,'C)),fun(fun('A,fun('B,'C)),bool)) l:fun('A,fun('B,'C))) m:fun('A,fun('B,'C))))))))
      #|WOSET_TRANS_LE =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) (((#properly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) l:fun('A,fun('A,bool))) y:'A) z:'A))) (((#properly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) l:fun('A,fun('A,bool))) x:'A) z:'A)))))))))))
      #|WOSET_WELL_CONTRAPOS =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) x:'A))))) (#?:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A))))) (#?:fun(fun('A,bool),bool) (\y:'A. ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) y:'A)) (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) (((#properly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) l:fun('A,fun('A,bool))) z:'A) y:'A)) (#~:fun(bool,bool) (P:fun('A,bool) z:'A))))))))))))))
      #|WOSET_TOTAL_LE =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) x:'A)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) y:'A))) ((#\/:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) (((#properly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) l:fun('A,fun('A,bool))) y:'A) x:'A))))))))))
      #|WOSET_TOTAL_LT =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) x:'A)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) y:'A))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)) ((#\/:fun(bool,fun(bool,bool)) (((#properly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) l:fun('A,fun('A,bool))) x:'A) y:'A)) (((#properly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) l:fun('A,fun('A,bool))) y:'A) x:'A)))))))))))
      #|ORDINAL_IMP_WOSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#ordinal:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool))))))
      #|WOSET_FINITE_TOSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#toset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#FINITE:fun(fun(prod('A,'A),bool),bool) (#GSPEC:fun(fun(prod('A,'A),bool),fun(prod('A,'A),bool)) (\GEN%PVAR%10:prod('A,'A). (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('A,bool),bool) (\y:'A. (((#SETSPEC:fun(prod('A,'A),fun(bool,fun(prod('A,'A),bool))) GEN%PVAR%10:prod('A,'A)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((#,:fun('A,fun('A,prod('A,'A))) x:'A) y:'A))))))))))) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool))))))
      #|UNION_FLD =  |- (#forall:fun(fun(fun(fun('A,fun('A,bool)),bool),bool),bool) (\P:fun(fun('A,fun('A,bool)),bool). ((#=:fun(bool,fun(bool,bool)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) (\x:'A. (\y:'A. (#?:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((l:fun('A,fun('A,bool)) x:'A) y:'A))))))) x:'A)) (#?:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) x:'A)))))))
      #|UNION_INSEG =  |- (#forall:fun(fun(fun(fun('A,fun('A,bool)),bool),bool),bool) (\P:fun(fun('A,fun('A,bool)),bool). (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\m:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (P:fun(fun('A,fun('A,bool)),bool) m:fun('A,fun('A,bool)))) ((#inseg:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) m:fun('A,fun('A,bool))) l:fun('A,fun('A,bool))))))) ((#inseg:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) (\x:'A. (\y:'A. (#?:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((l:fun('A,fun('A,bool)) x:'A) y:'A))))))) l:fun('A,fun('A,bool))))))))
      #|INSEG_SUBSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\m:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#inseg:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) m:fun('A,fun('A,bool))) l:fun('A,fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((m:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)))))))))))
      #|INSEG_SUBSET_FLD =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\m:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#inseg:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) m:fun('A,fun('A,bool))) l:fun('A,fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) m:fun('A,fun('A,bool))) x:'A)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) x:'A)))))))))
      #|INSEG_FLD_SUBSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\m:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#inseg:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) l:fun('A,fun('A,bool))) m:fun('A,fun('A,bool)))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool)))) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) m:fun('A,fun('A,bool)))))))))
      #|INSEG_WOSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\m:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#inseg:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) m:fun('A,fun('A,bool))) l:fun('A,fun('A,bool)))) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool))))) (#woset:fun(fun('A,fun('A,bool)),bool) m:fun('A,fun('A,bool))))))))
      #|INSEG_ORDINAL =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\m:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#inseg:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) m:fun('A,fun('A,bool))) l:fun('A,fun('A,bool)))) (#ordinal:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool))))) (#ordinal:fun(fun('A,fun('A,bool)),bool) m:fun('A,fun('A,bool))))))))
      #|LINSEG_INSEG =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#inseg:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) ((#linseg:fun(fun('A,fun('A,bool)),fun('A,fun('A,fun('A,bool)))) l:fun('A,fun('A,bool))) a:'A)) l:fun('A,fun('A,bool))))))))
      #|LINSEG_WOSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#woset:fun(fun('A,fun('A,bool)),bool) ((#linseg:fun(fun('A,fun('A,bool)),fun('A,fun('A,fun('A,bool)))) l:fun('A,fun('A,bool))) a:'A)))))))
      #|LINSEG_FLD =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) ((#linseg:fun(fun('A,fun('A,bool)),fun('A,fun('A,fun('A,bool)))) l:fun('A,fun('A,bool))) a:'A)) x:'A)) (((#properly:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) l:fun('A,fun('A,bool))) x:'A) a:'A)))))))))
      #|INSEG_PROPER_SUBSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\m:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#inseg:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) m:fun('A,fun('A,bool))) l:fun('A,fun('A,bool)))) (#~:fun(bool,bool) ((#=:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) l:fun('A,fun('A,bool))) m:fun('A,fun('A,bool)))))) (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('A,bool),bool) (\y:'A. ((#/\:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) (#~:fun(bool,bool) ((m:fun('A,fun('A,bool)) x:'A) y:'A))))))))))))
      #|INSEG_PROPER_SUBSET_FLD =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\m:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#inseg:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) m:fun('A,fun('A,bool))) l:fun('A,fun('A,bool)))) (#~:fun(bool,bool) ((#=:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) l:fun('A,fun('A,bool))) m:fun('A,fun('A,bool)))))) (#?:fun(fun('A,bool),bool) (\a:'A. ((#/\:fun(bool,fun(bool,bool)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) a:'A)) (#~:fun(bool,bool) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) m:fun('A,fun('A,bool))) a:'A))))))))))
      #|INSEG_LINSEG =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\m:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#inseg:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) m:fun('A,fun('A,bool))) l:fun('A,fun('A,bool)))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) m:fun('A,fun('A,bool))) l:fun('A,fun('A,bool)))) (#?:fun(fun('A,bool),bool) (\a:'A. ((#/\:fun(bool,fun(bool,bool)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) a:'A)) ((#=:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) m:fun('A,fun('A,bool))) ((#linseg:fun(fun('A,fun('A,bool)),fun('A,fun('A,fun('A,bool)))) l:fun('A,fun('A,bool))) a:'A))))))))))))
      #|EXTEND_FLD =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#=:fun(bool,fun(bool,bool)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) (\x:'A. (\y:'A. ((#/\:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) y:'A) a:'A))))) x:'A)) ((l:fun('A,fun('A,bool)) x:'A) a:'A)))))))
      #|EXTEND_INSEG =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) a:'A))) ((#inseg:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) (\x:'A. (\y:'A. ((#/\:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) y:'A) a:'A))))) l:fun('A,fun('A,bool))))))))
      #|EXTEND_LINSEG =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) a:'A))) ((#inseg:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) (\x:'A. (\y:'A. ((#\/:fun(bool,fun(bool,bool)) ((((#linseg:fun(fun('A,fun('A,bool)),fun('A,fun('A,fun('A,bool)))) l:fun('A,fun('A,bool))) a:'A) x:'A) y:'A)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) y:'A) a:'A)) ((#\/:fun(bool,fun(bool,bool)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) ((#linseg:fun(fun('A,fun('A,bool)),fun('A,fun('A,fun('A,bool)))) l:fun('A,fun('A,bool))) a:'A)) x:'A)) ((#=:fun('A,fun('A,bool)) x:'A) a:'A))))))) l:fun('A,fun('A,bool))))))))
      #|ORDINAL_CHAINED_LEMMA =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\k:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\m:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#ordinal:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#ordinal:fun(fun('A,fun('A,bool)),bool) m:fun('A,fun('A,bool))))) ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#inseg:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) k:fun('A,fun('A,bool))) l:fun('A,fun('A,bool)))) ((#inseg:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) k:fun('A,fun('A,bool))) m:fun('A,fun('A,bool))))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) k:fun('A,fun('A,bool))) l:fun('A,fun('A,bool)))) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) k:fun('A,fun('A,bool))) m:fun('A,fun('A,bool)))) (#?:fun(fun('A,bool),bool) (\a:'A. ((#/\:fun(bool,fun(bool,bool)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) a:'A)) ((#/\:fun(bool,fun(bool,bool)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) m:fun('A,fun('A,bool))) a:'A)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) k:fun('A,fun('A,bool))) ((#linseg:fun(fun('A,fun('A,bool)),fun('A,fun('A,fun('A,bool)))) l:fun('A,fun('A,bool))) a:'A))) ((#=:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) k:fun('A,fun('A,bool))) ((#linseg:fun(fun('A,fun('A,bool)),fun('A,fun('A,fun('A,bool)))) m:fun('A,fun('A,bool))) a:'A)))))))))))))))))
      #|ORDINAL_CHAINED =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\m:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#ordinal:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#ordinal:fun(fun('A,fun('A,bool)),bool) m:fun('A,fun('A,bool))))) ((#\/:fun(bool,fun(bool,bool)) ((#inseg:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) m:fun('A,fun('A,bool))) l:fun('A,fun('A,bool)))) ((#inseg:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) l:fun('A,fun('A,bool))) m:fun('A,fun('A,bool)))))))))
      #|ORDINAL_FLD_UNIQUE =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\m:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#ordinal:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#ordinal:fun(fun('A,fun('A,bool)),bool) m:fun('A,fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool)))) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) m:fun('A,fun('A,bool))))))) ((#=:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) l:fun('A,fun('A,bool))) m:fun('A,fun('A,bool))))))))
      #|ORDINAL_FLD_SUBSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\m:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#ordinal:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#ordinal:fun(fun('A,fun('A,bool)),bool) m:fun('A,fun('A,bool)))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool)))) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) m:fun('A,fun('A,bool))))))) ((#inseg:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) l:fun('A,fun('A,bool))) m:fun('A,fun('A,bool))))))))
      #|ORDINAL_FLD_SUBSET_EQ =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\m:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#ordinal:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#ordinal:fun(fun('A,fun('A,bool)),bool) m:fun('A,fun('A,bool))))) ((#=:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool)))) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) m:fun('A,fun('A,bool))))) ((#inseg:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) l:fun('A,fun('A,bool))) m:fun('A,fun('A,bool)))))))))
      #|FLD_SUC =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun('A,bool),bool) (\a:'A. ((#=:fun(bool,fun(bool,bool)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) (\x:'A. (\y:'A. ((#\/:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) y:'A) a:'A)) ((#\/:fun(bool,fun(bool,bool)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) x:'A)) ((#=:fun('A,fun('A,bool)) x:'A) a:'A))))))) x:'A)) ((#\/:fun(bool,fun(bool,bool)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) x:'A)) ((#=:fun('A,fun('A,bool)) x:'A) a:'A)))))))
      #|ORDINAL_SUC =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#ordinal:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#?:fun(fun('A,bool),bool) (\x:'A. (#~:fun(bool,bool) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) x:'A)))))) (#ordinal:fun(fun('A,fun('A,bool)),bool) (\x:'A. (\y:'A. ((#\/:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) y:'A) (#@:fun(fun('A,bool),'A) (\y:'A. (#~:fun(bool,bool) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) y:'A)))))) ((#\/:fun(bool,fun(bool,bool)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) x:'A)) ((#=:fun('A,fun('A,bool)) x:'A) (#@:fun(fun('A,bool),'A) (\y:'A. (#~:fun(bool,bool) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) y:'A))))))))))))))
      #|ORDINAL_UNION =  |- (#forall:fun(fun(fun(fun('A,fun('A,bool)),bool),bool),bool) (\P:fun(fun('A,fun('A,bool)),bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (P:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#ordinal:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool))))))) (#ordinal:fun(fun('A,fun('A,bool)),bool) (\x:'A. (\y:'A. (#?:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((l:fun('A,fun('A,bool)) x:'A) y:'A))))))))))
      #|ORDINAL_UNION_LEMMA =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (#ordinal:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#==>:fun(bool,fun(bool,bool)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) x:'A)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) (\a:'A. (\b:'A. (#?:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#/\:fun(bool,fun(bool,bool)) (#ordinal:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((l:fun('A,fun('A,bool)) a:'A) b:'A))))))) x:'A)))))))
      #|ORDINAL_UP =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#ordinal:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#\/:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) x:'A)))) (#?:fun(fun(fun('A,fun('A,bool)),bool),bool) (\m:fun('A,fun('A,bool)). (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) (#ordinal:fun(fun('A,fun('A,bool)),bool) m:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) m:fun('A,fun('A,bool))) x:'A)) (#~:fun(bool,bool) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) x:'A))))))))))))
      #|WO_ORDINAL =  |- (#?:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#/\:fun(bool,fun(bool,bool)) (#ordinal:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) x:'A))))))
      #|FLD_RESTRICT =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) (\x:'A. (\y:'A. ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) y:'A)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)))))) x:'A)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) x:'A))))))))
      #|WO =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#?:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#/\:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool)))) P:fun('A,bool)))))))
      #|WF_INSEG_WOSET =  |- (#WF:fun(fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)),bool) (\x:fun('A,fun('A,bool)). (\y:fun('A,fun('A,bool)). ((#/\:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) x:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) y:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#inseg:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) x:fun('A,fun('A,bool))) y:fun('A,fun('A,bool)))) (#~:fun(bool,bool) ((#=:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) x:fun('A,fun('A,bool))) y:fun('A,fun('A,bool))))))))))
      #|WOSET_INSEG_ORDINAL =  |- (#woset:fun(fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)),bool) (\x:fun('A,fun('A,bool)). (\y:fun('A,fun('A,bool)). ((#/\:fun(bool,fun(bool,bool)) (#ordinal:fun(fun('A,fun('A,bool)),bool) x:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) (#ordinal:fun(fun('A,fun('A,bool)),bool) y:fun('A,fun('A,bool)))) ((#inseg:fun(fun('A,fun('A,bool)),fun(fun('A,fun('A,bool)),bool)) x:fun('A,fun('A,bool))) y:fun('A,fun('A,bool))))))))
      #|SUBWOSET_ISO_INSEG =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\s:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool)))) #UNIV:fun('A,bool)))) (#?:fun(fun(fun('A,'A),bool),bool) (\f:fun('A,'A). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) s:fun('A,bool))) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) s:fun('A,bool)))) ((#=:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) (f:fun('A,'A) x:'A)) (f:fun('A,'A) y:'A))) ((l:fun('A,fun('A,bool)) x:'A) y:'A)))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) ((#IMAGE:fun(fun('A,'A),fun(fun('A,bool),fun('A,bool))) f:fun('A,'A)) s:fun('A,bool)))) ((l:fun('A,fun('A,bool)) x:'A) y:'A))) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) ((#IMAGE:fun(fun('A,'A),fun(fun('A,bool),fun('A,bool))) f:fun('A,'A)) s:fun('A,bool))))))))))))))))
      #|HP =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#qoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#?:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#chain:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) l:fun('A,fun('A,bool))) P:fun('A,bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\Q:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#chain:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) l:fun('A,fun('A,bool))) Q:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) P:fun('A,bool)) Q:fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) Q:fun('A,bool)) P:fun('A,bool)))))))))))
      #|ZL_STRONG =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#qoset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\c:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#chain:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) l:fun('A,fun('A,bool))) c:fun('A,bool))) (#?:fun(fun('A,bool),bool) (\y:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) c:fun('A,bool))) ((l:fun('A,fun('A,bool)) x:'A) y:'A)))))))))))) (#?:fun(fun('A,bool),bool) (\y:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) y:'A) x:'A)) ((l:fun('A,fun('A,bool)) x:'A) y:'A))))))))))
      #|ZL =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#poset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#chain:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) l:fun('A,fun('A,bool))) P:fun('A,bool))) (#?:fun(fun('A,bool),bool) (\y:'A. ((#/\:fun(bool,fun(bool,bool)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) y:'A)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((l:fun('A,fun('A,bool)) x:'A) y:'A)))))))))))) (#?:fun(fun('A,bool),bool) (\y:'A. ((#/\:fun(bool,fun(bool,bool)) ((#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))) y:'A)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((l:fun('A,fun('A,bool)) y:'A) x:'A)) ((#=:fun('A,fun('A,bool)) y:'A) x:'A))))))))))
      #|KL_POSET_LEMMA =  |- (#poset:fun(fun(fun('A,bool),fun(fun('A,bool),bool)),bool) (\c1:fun('A,bool). (\c2:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) C:fun('A,bool)) c1:fun('A,bool))) ((#/\:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) c1:fun('A,bool)) c2:fun('A,bool))) ((#chain:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) l:fun('A,fun('A,bool))) c2:fun('A,bool)))))))
      #|KL =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#poset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\C:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#chain:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) l:fun('A,fun('A,bool))) C:fun('A,bool))) (#?:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#chain:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) l:fun('A,fun('A,bool))) P:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) C:fun('A,bool)) P:fun('A,bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\R:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#chain:fun(fun('A,fun('A,bool)),fun(fun('A,bool),bool)) l:fun('A,fun('A,bool))) R:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) P:fun('A,bool)) R:fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) R:fun('A,bool)) P:fun('A,bool))))))))))))))
      #|POSET_RESTRICTED_SUBSET =  |- (#forall:fun(fun(fun(fun('?5,bool),bool),bool),bool) (\P:fun(fun('?5,bool),bool). (#poset:fun(fun(fun('?5,bool),fun(fun('?5,bool),bool)),bool) (\x:fun('?5,bool). (\y:fun('?5,bool). ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('?5,bool),bool) x:fun('?5,bool))) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('?5,bool),bool) y:fun('?5,bool))) ((#SUBSET:fun(fun('?5,bool),fun(fun('?5,bool),bool)) x:fun('?5,bool)) y:fun('?5,bool)))))))))
      #|FLD_RESTRICTED_SUBSET =  |- (#forall:fun(fun(fun(fun('?6,bool),bool),bool),bool) (\P:fun(fun('?6,bool),bool). ((#=:fun(fun(fun('?6,bool),bool),fun(fun(fun('?6,bool),bool),bool)) (#fld:fun(fun(fun('?6,bool),fun(fun('?6,bool),bool)),fun(fun('?6,bool),bool)) (\x:fun('?6,bool). (\y:fun('?6,bool). ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('?6,bool),bool) x:fun('?6,bool))) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('?6,bool),bool) y:fun('?6,bool))) ((#SUBSET:fun(fun('?6,bool),fun(fun('?6,bool),bool)) x:fun('?6,bool)) y:fun('?6,bool)))))))) P:fun(fun('?6,bool),bool))))
      #|ZL_SUBSETS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\c:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\x:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) x:fun('A,bool)) c:fun(fun('A,bool),bool))) (P:fun(fun('A,bool),bool) x:fun('A,bool)))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\x:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\y:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) x:fun('A,bool)) c:fun(fun('A,bool),bool))) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) y:fun('A,bool)) c:fun(fun('A,bool),bool)))) ((#\/:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) x:fun('A,bool)) y:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) y:fun('A,bool)) x:fun('A,bool)))))))))) (#?:fun(fun(fun('A,bool),bool),bool) (\z:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) z:fun('A,bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\x:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) x:fun('A,bool)) c:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) x:fun('A,bool)) z:fun('A,bool)))))))))))) (#?:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) a:fun('A,bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\x:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) x:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) a:fun('A,bool)) x:fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) a:fun('A,bool)) x:fun('A,bool)))))))))))
      #|ZL_SUBSETS_UNIONS =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\c:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\x:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) x:fun('A,bool)) c:fun(fun('A,bool),bool))) (P:fun(fun('A,bool),bool) x:fun('A,bool)))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\x:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\y:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) x:fun('A,bool)) c:fun(fun('A,bool),bool))) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) y:fun('A,bool)) c:fun(fun('A,bool),bool)))) ((#\/:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) x:fun('A,bool)) y:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) y:fun('A,bool)) x:fun('A,bool)))))))))) (P:fun(fun('A,bool),bool) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) c:fun(fun('A,bool),bool))))))) (#?:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) a:fun('A,bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\x:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) x:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) a:fun('A,bool)) x:fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) a:fun('A,bool)) x:fun('A,bool)))))))))))
      #|ZL_SUBSETS_UNIONS_NONEMPTY =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\P:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(fun('A,bool),bool),bool) (\x:fun('A,bool). (P:fun(fun('A,bool),bool) x:fun('A,bool))))) (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\c:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun(fun('A,bool),bool),bool) (\x:fun('A,bool). ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) x:fun('A,bool)) c:fun(fun('A,bool),bool))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\x:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) x:fun('A,bool)) c:fun(fun('A,bool),bool))) (P:fun(fun('A,bool),bool) x:fun('A,bool)))))) (#forall:fun(fun(fun('A,bool),bool),bool) (\x:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\y:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) x:fun('A,bool)) c:fun(fun('A,bool),bool))) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) y:fun('A,bool)) c:fun(fun('A,bool),bool)))) ((#\/:fun(bool,fun(bool,bool)) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) x:fun('A,bool)) y:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) y:fun('A,bool)) x:fun('A,bool))))))))))) (P:fun(fun('A,bool),bool) (#UNIONS:fun(fun(fun('A,bool),bool),fun('A,bool)) c:fun(fun('A,bool),bool)))))))) (#?:fun(fun(fun('A,bool),bool),bool) (\a:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) a:fun('A,bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\x:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(fun('A,bool),bool) x:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) a:fun('A,bool)) x:fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) a:fun('A,bool)) x:fun('A,bool)))))))))))
      #|TUKEY =  |- (#forall:fun(fun(fun(fun('A,bool),bool),bool),bool) (\s:fun(fun('A,bool),bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) s:fun(fun('A,bool),bool)) #EMPTY:fun(fun('A,bool),bool)))) (#forall:fun(fun(fun('A,bool),bool),bool) (\t:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,bool),bool),bool) (\c:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FINITE:fun(fun('A,bool),bool) c:fun('A,bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) c:fun('A,bool)) t:fun('A,bool)))) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) c:fun('A,bool)) s:fun(fun('A,bool),bool)))))) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) t:fun('A,bool)) s:fun(fun('A,bool),bool))))))) (#?:fun(fun(fun('A,bool),bool),bool) (\u:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) u:fun('A,bool)) s:fun(fun('A,bool),bool))) (#forall:fun(fun(fun('A,bool),bool),bool) (\v:fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun(fun('A,bool),fun(fun(fun('A,bool),bool),bool)) v:fun('A,bool)) s:fun(fun('A,bool),bool))) ((#SUBSET:fun(fun('A,bool),fun(fun('A,bool),bool)) u:fun('A,bool)) v:fun('A,bool)))) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) u:fun('A,bool)) v:fun('A,bool)))))))))))
      #|OEP =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\p:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#poset:fun(fun('A,fun('A,bool)),bool) p:fun('A,fun('A,bool)))) (#?:fun(fun(fun('A,fun('A,bool)),bool),bool) (\t:fun('A,fun('A,bool)). ((#/\:fun(bool,fun(bool,bool)) (#toset:fun(fun('A,fun('A,bool)),bool) t:fun('A,fun('A,bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) t:fun('A,fun('A,bool)))) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) p:fun('A,fun('A,bool))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((p:fun('A,fun('A,bool)) x:'A) y:'A)) ((t:fun('A,fun('A,bool)) x:'A) y:'A)))))))))))))
      #|TOSET_COFINAL_WOSET =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\l:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#toset:fun(fun('A,fun('A,bool)),bool) l:fun('A,fun('A,bool)))) (#?:fun(fun(fun('A,fun('A,bool)),bool),bool) (\w:fun('A,fun('A,bool)). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((w:fun('A,fun('A,bool)) x:'A) y:'A)) ((l:fun('A,fun('A,bool)) x:'A) y:'A))))))) ((#/\:fun(bool,fun(bool,bool)) (#woset:fun(fun('A,fun('A,bool)),bool) w:fun('A,fun('A,bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) x:'A) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) l:fun('A,fun('A,bool))))) (#?:fun(fun('A,bool),bool) (\y:'A. ((#/\:fun(bool,fun(bool,bool)) ((#IN:fun('A,fun(fun('A,bool),bool)) y:'A) (#fld:fun(fun('A,fun('A,bool)),fun('A,bool)) w:fun('A,fun('A,bool))))) ((l:fun('A,fun('A,bool)) x:'A) y:'A))))))))))))))
      #|types = tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = ordinal linseg inseg properly strictly antichain chain wqoset woset toset poset qoset fld superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 276
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?7
      #|counter_genvar = _194359:bool
      #|
    ),
  )
}
