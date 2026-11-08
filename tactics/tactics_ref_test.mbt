// Load-fidelity and behaviour test for tactics.ml: replays
// tools/ocaml_ref/tactics_ref.ml (keep in sync). Terms are parsed with
// explicit lets, in the script's order, before the tactics that use them.

///|
using @testkit {stm, sthm, sty, ocaml_escaped}

///|
using @kernel {type Term}

///|
using @tactics {
  type Goal,
  type Goalstate,
  type Tactic,
  then_tac,
  thenl,
  then1,
  orelse_tac,
  all_tac,
  accept_tac,
  assume_tac,
  label_tac,
  mp_tac,
  first_assum,
  first_x_assum,
  disch_then,
  disch_tac,
  gen_tac,
  conj_tac,
  repeat_tac,
}

///|
fn[T] buf_of(pr : (@pp.Formatter, T) -> Unit raise, x : T) -> String raise {
  let b = StringBuilder()
  let f = @pp.formatter_of_buffer(b)
  pr(f, x)
  f.print_flush()
  ocaml_escaped(b.to_string())
}

///|
fn sgoal(gl : Goal) -> String raise {
  buf_of(@tactics.pp_print_goal, gl)
}

///|
fn sgs(gs : @tactics.Goalstack) -> String raise {
  buf_of(@tactics.pp_print_goalstack, gs)
}

///|
fn sgls(gs : Goalstate) -> String raise {
  "[" + gs.1.map(sgoal).to_array().join("; ") + "]"
}

///|
fn slist(f : (Term) -> String, l : @list.List[Term]) -> String {
  "[" + l.map(f).to_array().join("; ") + "]"
}

///|
test "tactics matches tactics.ml" {
  let log = @testkit.Log::new()
  log.capture_reports()
  log.show_theory_trace("tactics")
  let tm = @parser.parse_term
  let pv = (name : String, f : () -> (Term, Tactic) raise) => {
    log.attempt(name, () => {
      let (w, tac) = f()
      sthm(@tactics.prove(w, tac))
    })
  }
  let st = (name : String, f : () -> (Term, Tactic) raise) => {
    log.attempt(name, () => {
      let (w, tac) = f()
      sgls(tac((@list.List([]), w)))
    })
  }
  let truth = @bool.truth()
  let accept : Tactic = g => first_assum(th => accept_tac(th))(g)
  pv("CONJ_TAC", () => {
    let w = tm("T /\\ T")
    (w, then_tac(conj_tac, accept_tac(truth)))
  })
  pv("DISJ1_TAC", () => {
    let w = tm("T \\/ F")
    (w, then_tac(@tactics.disj1_tac, accept_tac(truth)))
  })
  pv("DISJ2_TAC", () => {
    let w = tm("F \\/ T")
    (w, then_tac(@tactics.disj2_tac, accept_tac(truth)))
  })
  pv("GEN_DISCH", () => {
    let w = tm("forall p:bool. p ==> p")
    (w, then_tac(then_tac(gen_tac, disch_tac), accept))
  })
  pv("STRIP_TAC", () => {
    let w = tm("forall p q. p /\\ q ==> q /\\ p")
    (w, then_tac(then_tac(repeat_tac(@tactics.strip_tac), conj_tac), accept))
  })
  pv("EXISTS_TAC", () => {
    let w = tm("?x:bool. x")
    let t = tm("T")
    (w, then_tac(@tactics.exists_tac(t), accept_tac(truth)))
  })
  pv("X_CHOOSE_TAC", () => {
    let w = tm("(?x:bool. (P:bool->bool) x) ==> (?y. P y)")
    let z = tm("z:bool")
    (
      w,
      then_tac(
        then_tac(
          disch_then(th => @tactics.x_choose_tac(z, th)),
          @tactics.exists_tac(z),
        ),
        accept,
      ),
    )
  })
  pv("STRIP_EXISTS", () => {
    let w = tm("(?x:A. (P:A->bool) x) ==> ?y. P y")
    let x = tm("x:A")
    (w, then_tac(then_tac(@tactics.strip_tac, @tactics.exists_tac(x)), accept))
  })
  pv("DISJ_CASES_THEN", () => {
    let w = tm("p \\/ q ==> q \\/ p")
    (
      w,
      then_tac(
        thenl(
          disch_then(@tactics.disj_cases_then(th => assume_tac(th))),
          @list.List([@tactics.disj2_tac, @tactics.disj1_tac]),
        ),
        accept,
      ),
    )
  })
  pv("CONTR_TAC", () => {
    let w = tm("F ==> p")
    (w, disch_then(th => @tactics.contr_tac(th)))
  })
  pv("MATCH_ACCEPT_TAC", () => {
    let w = tm("forall b:bool. b = b")
    let x = tm("x:A")
    (w, @tactics.match_accept_tac(@bool.gen(x, @kernel.refl(x))))
  })
  pv("MATCH_MP_TAC", () => {
    let w = tm("(forall x:A. P x ==> Q x) ==> P c ==> Q c")
    (
      w,
      then_tac(
        then_tac(
          then_tac(disch_tac, disch_tac),
          first_x_assum(th => @tactics.match_mp_tac(th)),
        ),
        accept,
      ),
    )
  })
  pv("ANTS_TAC", () => {
    let w = tm("(T ==> q) ==> q")
    (
      w,
      thenl(
        @tactics.ants_tac,
        @list.List([accept_tac(truth), then_tac(disch_tac, accept)]),
      ),
    )
  })
  pv("EQ_TAC", () => {
    let w = tm("p <=> p")
    (w, then_tac(then_tac(@tactics.eq_tac, disch_tac), accept))
  })
  pv("MK_COMB_TAC", () => {
    let w = tm("(f:A->B) x = f x")
    (w, then_tac(@tactics.mk_comb_tac, @tactics.refl_tac))
  })
  pv("AP_TERM_TAC", () => {
    let w = tm("~(a /\\ b) <=> ~(a /\\ b)")
    (w, then_tac(@tactics.ap_term_tac, @tactics.refl_tac))
  })
  pv("AP_THM_TAC", () => {
    let w = tm("(f:A->B) x = f x")
    (w, then_tac(@tactics.ap_thm_tac, @tactics.refl_tac))
  })
  pv("BINOP_TAC", () => {
    let w = tm("(a /\\ b) <=> (a /\\ b)")
    (w, then_tac(@tactics.binop_tac, @tactics.refl_tac))
  })
  pv("ABS_TAC", () => {
    let w = tm("(\\x:A. (f:A->B) x) = (\\y. f y)")
    (w, then_tac(@tactics.abs_tac, @tactics.refl_tac))
  })
  pv("BETA_TAC", () => {
    let w = tm("(\\x:bool. x) T")
    (w, then_tac(@tactics.beta_tac, accept_tac(truth)))
  })
  pv("CONV_TAC_eq", () => {
    let w = tm("(\\x:bool. x) T = T")
    (
      w,
      then_tac(
        @tactics.conv_tac(@equal.depth_conv(@equal.beta_conv)),
        @tactics.refl_tac,
      ),
    )
  })
  pv("CONV_TAC_T", () => {
    let w = tm("T")
    (w, @tactics.conv_tac(_ => @bool.eqt_intro(truth)))
  })
  pv("CONV_TAC_bad", () => {
    let w = tm("T")
    let r = tm("F")
    (w, @tactics.conv_tac(_ => @kernel.refl(r)))
  })
  pv("SUBST1_TAC", () => {
    let w = tm("forall a b:bool. (a = b) ==> b ==> a")
    (
      w,
      then_tac(
        then_tac(
          then_tac(
            repeat_tac(gen_tac),
            disch_then(th => @tactics.subst1_tac(th)),
          ),
          disch_tac,
        ),
        accept,
      ),
    )
  })
  pv("SUBST_ALL_TAC", () => {
    let w = tm("(a:bool) = b ==> a ==> b")
    (
      w,
      then_tac(
        then_tac(
          then_tac(disch_tac, disch_tac),
          first_assum(th => @tactics.subst_all_tac(th)),
        ),
        accept,
      ),
    )
  })
  pv("SUBST_VAR_TAC", () => {
    let w = tm("(x:A) = y ==> (P:A->bool) x ==> P y")
    (
      w,
      then_tac(
        then_tac(
          repeat_tac(disch_tac),
          first_x_assum(th => @tactics.subst_var_tac(th)),
        ),
        accept,
      ),
    )
  })
  pv("UNDISCH_TAC", () => {
    let w = tm("p ==> p")
    let p = tm("p:bool")
    (
      w,
      then_tac(
        then_tac(disch_tac, @tactics.undisch_tac(p)),
        disch_then(th => accept_tac(th)),
      ),
    )
  })
  pv("SPEC_TAC", () => {
    let w = tm("(f:A->A) a = f a")
    let a = tm("a:A")
    let z = tm("z:A")
    (w, then_tac(then_tac(@tactics.spec_tac(a, z), gen_tac), @tactics.refl_tac))
  })
  pv("X_GEN_TAC_type", () => {
    let w = tm("forall x:bool. x = x")
    let y = tm("y:A")
    (w, @tactics.x_gen_tac(y))
  })
  pv("X_GEN_TAC_notvar", () => {
    let w = tm("forall x:bool. x = x")
    let t = tm("T")
    (w, @tactics.x_gen_tac(t))
  })
  pv("X_GEN_TAC_invalid", () => {
    let w = tm("forall x:bool. x = y")
    let y = tm("y:bool")
    (w, @tactics.x_gen_tac(y))
  })
  pv("X_GEN_TAC_notforall", () => {
    let w = tm("p:bool")
    let y = tm("y:bool")
    (w, @tactics.x_gen_tac(y))
  })
  st("GEN_TAC_primed", () => {
    let w = tm("forall x:bool. x = x \\/ x'")
    (w, gen_tac)
  })
  pv("SUBGOAL_THEN", () => {
    let w = tm("p ==> p /\\ p")
    let p = tm("p:bool")
    (
      w,
      thenl(
        then_tac(disch_tac, @tactics.subgoal_then(p, th => assume_tac(th))),
        @list.List([accept, then_tac(conj_tac, accept)]),
      ),
    )
  })
  st("SUBGOAL_TAC", () => {
    let w = tm("p:bool")
    let q = tm("q:bool")
    (w, @tactics.subgoal_tac("lab", q, @list.List([all_tac, all_tac])))
  })
  st("SUBGOAL_TAC_none", () => {
    let w = tm("p:bool")
    let q = tm("q:bool")
    (w, @tactics.subgoal_tac("lab", q, @list.List([])))
  })
  pv("FREEZE_THEN", () => {
    let w = tm("p ==> p")
    (w, disch_then(@tactics.freeze_then(th => accept_tac(th))))
  })
  pv("IMP_RES_THEN", () => {
    let w = tm("(p ==> q) ==> p ==> q")
    (
      w,
      then_tac(
        repeat_tac(disch_tac),
        first_assum(@tactics.imp_res_then(th => accept_tac(th))),
      ),
    )
  })
  pv("ANTE_RES_THEN", () => {
    let w = tm("(p ==> q) ==> p ==> q")
    (
      w,
      then_tac(
        repeat_tac(disch_tac),
        first_assum(@tactics.ante_res_then(th => accept_tac(th))),
      ),
    )
  })
  st("IMP_RES_THEN_none", () => {
    let w = tm("p ==> q")
    (
      w,
      then_tac(
        disch_tac,
        first_assum(@tactics.imp_res_then(th => accept_tac(th))),
      ),
    )
  })
  pv("LABEL_USE_THEN", () => {
    let w = tm("p ==> q ==> p")
    (
      w,
      then_tac(
        then_tac(
          disch_then(th => label_tac("hp", th)),
          disch_then(th => label_tac("hq", th)),
        ),
        @tactics.use_then("hp", th => accept_tac(th)),
      ),
    )
  })
  pv("USE_THEN_missing", () => {
    let w = tm("p ==> p")
    (w, then_tac(disch_tac, @tactics.use_then("nope", th => accept_tac(th))))
  })
  st("REMOVE_THEN", () => {
    let w = tm("p ==> q ==> r")
    (
      w,
      then_tac(
        then_tac(
          disch_then(th => label_tac("hp", th)),
          disch_then(th => label_tac("hq", th)),
        ),
        @tactics.remove_then("hp", th => mp_tac(th)),
      ),
    )
  })
  pv("HYP", () => {
    let w = tm("p ==> p")
    let h = @tactics.hyp_tac(ths => accept_tac(@lib.hd(ths)), "h1")(
      @list.List([]),
    )
    (w, then_tac(disch_then(th => label_tac("h1", th)), h))
  })
  pv("HYP_bad", () => {
    let w = tm("p ==> p")
    let h = @tactics.hyp_tac(ths => accept_tac(@lib.hd(ths)), "h1 +")(
      @list.List([]),
    )
    (w, then_tac(disch_then(th => label_tac("h1", th)), h))
  })
  st("NAME_ASSUMS_TAC", () => {
    let w = tm("a ==> b ==> c ==> d")
    (
      w,
      then_tac(
        then_tac(
          then_tac(disch_tac, disch_then(th => label_tac("H0", th))),
          disch_tac,
        ),
        @tactics.name_assums_tac,
      ),
    )
  })
  st("RULE_ASSUM_TAC", () => {
    let w = tm("(\\x:bool. x) a ==> (\\x:bool. x) b ==> c")
    (
      w,
      then_tac(
        repeat_tac(disch_tac),
        @tactics.rule_assum_tac(th => @equal.conv_rule(@equal.beta_conv, th)),
      ),
    )
  })
  st("STRIP_ASSUME_TAC", () => {
    let w = tm("c:bool")
    let a = tm("(a /\\ b) \\/ (?x:A. (P:A->bool) x)")
    (w, @tactics.strip_assume_tac(@kernel.assume_rule(a)))
  })
  st("STRIP_ASSUME_TAC_dup", () => {
    let w = tm("a ==> c")
    let a = tm("a /\\ a")
    (w, then_tac(disch_tac, @tactics.strip_assume_tac(@kernel.assume_rule(a))))
  })
  st("STRUCT_CASES_TAC", () => {
    let w = tm("(P:bool->bool) x")
    let a = tm("(x:bool) = T \\/ x = F")
    (w, @tactics.struct_cases_tac(@kernel.assume_rule(a)))
  })
  st("CONJUNCTS_THEN2", () => {
    let w = tm("a /\\ b ==> c")
    (
      w,
      disch_then(
        @tactics.conjuncts_then2(th => assume_tac(th), th => mp_tac(th)),
      ),
    )
  })
  st("CHANGED_TAC_all", () => {
    let w = tm("p:bool")
    (w, @tactics.changed_tac(all_tac))
  })
  st("CHANGED_TAC_gen", () => {
    let w = tm("forall x:bool. x")
    (w, @tactics.changed_tac(gen_tac))
  })
  st("REPLICATE_TAC", () => {
    let w = tm("forall x y z:bool. x")
    (w, @tactics.replicate_tac(2, gen_tac))
  })
  st("FAIL_TAC", () => {
    let w = tm("p:bool")
    (w, @tactics.fail_tac("boom"))
  })
  st("NO_TAC", () => {
    let w = tm("p:bool")
    (w, @tactics.no_tac)
  })
  st("FIRST_empty", () => {
    let w = tm("p:bool")
    (w, @tactics.first(@list.List([])))
  })
  st("EVERY_empty", () => {
    let w = tm("p:bool")
    (w, @tactics.every(@list.List([])))
  })
  st("FIRST", () => {
    let w = tm("p /\\ q")
    (w, @tactics.first(@list.List([@tactics.disj1_tac, conj_tac])))
  })
  st("MAP_EVERY", () => {
    let w = tm("forall x y:bool. x")
    let a = tm("a:bool")
    let b = tm("b:bool")
    (w, @tactics.map_every(@tactics.x_gen_tac, @list.List([a, b])))
  })
  st("MAP_FIRST", () => {
    let w = tm("p ==> q")
    (w, @tactics.map_first(t => t, @list.List([conj_tac, disch_tac])))
  })
  st("TRY", () => {
    let w = tm("p:bool")
    (w, @tactics.try_tac(conj_tac))
  })
  st("ORELSE", () => {
    let w = tm("p /\\ q")
    (w, orelse_tac(@tactics.disj1_tac, conj_tac))
  })
  st("THEN1", () => {
    let w = tm("(p /\\ q) /\\ r")
    (w, then1(conj_tac, conj_tac))
  })
  st("THENL_mismatch", () => {
    let w = tm("p /\\ q")
    (w, thenl(conj_tac, @list.List([all_tac])))
  })
  st("THENL_empty", () => {
    let w = tm("T")
    (w, thenl(accept_tac(truth), @list.List([all_tac, all_tac])))
  })
  st("POP_ASSUM_empty", () => {
    let w = tm("p:bool")
    (w, @tactics.pop_assum(th => accept_tac(th)))
  })
  st("POP_ASSUM_LIST", () => {
    let w = tm("a ==> b ==> c")
    (
      w,
      then_tac(
        repeat_tac(disch_tac),
        @tactics.pop_assum_list(ths => {
          @tactics.map_every(th => assume_tac(th), ths)
        }),
      ),
    )
  })
  st("EVERY_ASSUM", () => {
    let w = tm("a ==> b ==> c")
    (w, then_tac(repeat_tac(disch_tac), @tactics.every_assum(th => mp_tac(th))))
  })
  st("ASSUM_LIST", () => {
    let w = tm("a ==> b ==> c")
    (
      w,
      then_tac(
        repeat_tac(disch_tac),
        @tactics.assum_list(ths => mp_tac(@lib.end_itlist(@bool.conj, ths))),
      ),
    )
  })
  st("FIND_ASSUM", () => {
    let w = tm("a ==> b ==> c")
    let a = tm("a:bool")
    (
      w,
      then_tac(repeat_tac(disch_tac), @tactics.find_assum(th => mp_tac(th), a)),
    )
  })
  st("ASM", () => {
    let w = tm("a ==> b")
    (
      w,
      then_tac(
        disch_tac,
        @tactics.asm_tac(ths => @tactics.map_every(th => mp_tac(th), ths))(
          @list.List([]),
        ),
      ),
    )
  })
  st("ORELSE_TCL", () => {
    let w = tm("a /\\ b ==> c")
    (
      w,
      disch_then(
        @tactics.orelse_tcl(@tactics.conjuncts_then, @tactics.all_then)(th => {
          assume_tac(th)
        }),
      ),
    )
  })
  st("NO_THEN", () => {
    let w = tm("a ==> c")
    (w, disch_then(@tactics.no_then(th => assume_tac(th))))
  })
  st("EVERY_TCL", () => {
    let w = tm("(a /\\ b) /\\ c ==> d")
    (
      w,
      disch_then(
        @tactics.every_tcl(
          @list.List([@tactics.conjuncts_then, @tactics.conjuncts_then]),
        )(th => assume_tac(th)),
      ),
    )
  })
  st("REPEAT_GTCL", () => {
    let w = tm("(a /\\ b) /\\ c ==> d")
    (
      w,
      disch_then(
        @tactics.repeat_gtcl(@tactics.conjuncts_then)(th => assume_tac(th)),
      ),
    )
  })
  st("FIRST_TCL_empty", () => {
    let w = tm("a ==> c")
    (w, disch_then(@tactics.first_tcl(@list.List([]))(th => assume_tac(th))))
  })
  st("TRANS_TAC", () => {
    let tw = tm("forall x y z:A. x = y /\\ y = z ==> x = z")
    let th = @tactics.prove(
      tw,
      then_tac(
        then_tac(
          repeat_tac(gen_tac),
          disch_then(
            @tactics.conjuncts_then2(th => @tactics.subst1_tac(th), th => {
              @tactics.subst1_tac(th)
            }),
          ),
        ),
        @tactics.refl_tac,
      ),
    )
    let w = tm("(a:bool) = c")
    let b = tm("b:bool")
    (w, @tactics.trans_tac(th)(b))
  })
  st("X_META_EXISTS_TAC", () => {
    let w = tm("?x:bool. x /\\ y")
    let v = tm("v:bool")
    (w, @tactics.x_meta_exists_tac(v))
  })
  st("X_META_EXISTS_TAC_bad", () => {
    let w = tm("?x:bool. x /\\ y")
    let v = tm("T")
    (w, @tactics.x_meta_exists_tac(v))
  })
  st("META_EXISTS_TAC", () => {
    let w = tm("?x:bool. x /\\ x'")
    (w, @tactics.meta_exists_tac)
  })
  st("META_SPEC_TAC", () => {
    let w = tm("q:bool")
    let t = tm("t:bool")
    let a = tm("forall x:bool. P x")
    (w, @tactics.meta_spec_tac(t, @kernel.assume_rule(a)))
  })
  pv("CHEAT_TAC", () => {
    let w = tm("F")
    (w, @tactics.cheat_tac)
  })
  @lib.report_timing.val = false
  pv("RECALL_ACCEPT_TAC", () => {
    let w = tm("T")
    (w, @tactics.recall_accept_tac(t => t, truth))
  })
  @lib.report_timing.val = true
  pv("prove_hyps", () => {
    let w = tm("p:bool")
    let p = tm("p:bool")
    (w, accept_tac(@kernel.assume_rule(p)))
  })
  pv("prove_unsolved", () => {
    let w = tm("p:bool")
    (w, all_tac)
  })
  pv("prove_nonbool", () => {
    let w = tm("x:A")
    (w, all_tac)
  })
  pv("prove_alpha", () => {
    let w = tm("forall x:bool. x ==> x")
    let w2 = tm("forall y:bool. y ==> y")
    (
      w,
      @tactics.match_accept_tac(
        @tactics.prove(w2, then_tac(then_tac(gen_tac, disch_tac), accept)),
      ),
    )
  })
  log.attempt("mk_fthm", () => {
    let a = tm("a:bool")
    let b = tm("b:bool")
    sthm(@tactics.mk_fthm(@list.singleton(a), b))
  })
  log.attempt("equals_goal", () => {
    let a = tm("a:bool")
    let g1 : Goal = (@list.singleton(("x", @kernel.assume_rule(a))), a)
    let g2 : Goal = (@list.singleton(("x", @kernel.assume_rule(a))), a)
    let g3 : Goal = (@list.singleton(("y", @kernel.assume_rule(a))), a)
    @tactics.equals_goal(g1, g2).to_string() +
    " " +
    @tactics.equals_goal(g1, g3).to_string()
  })
  log.attempt("compose_insts", () => {
    let a = tm("a:A")
    let x = tm("x:A")
    let b = tm("b:A")
    let y = tm("y:A")
    let (_, tmin, tyin) = @tactics.compose_insts(
      (@list.List([]), @list.singleton((a, x)), @list.List([])),
      (
        @list.List([]),
        @list.List([(b, y), (a, x)]),
        @list.singleton((@kernel.bool_ty, @kernel.aty)),
      ),
    )
    slist(stm, tmin.map(p => p.0)) +
    " " +
    slist(stm, tmin.map(p => p.1)) +
    " [" +
    tyin.map(p => sty(p.0)).to_array().join("; ") +
    "]"
  })
  log.attempt("inst_goal", () => {
    let a = tm("a:bool")
    let p = tm("p:bool")
    sgoal(
      @tactics.inst_goal(
        (@list.List([]), @list.singleton((a, p)), @list.List([])),
        (@list.singleton(("h", @kernel.assume_rule(p))), p),
      ),
    )
  })
  // The goalstack.
  log.attempt("g_free", () => {
    let t = tm("x /\\ y ==> y")
    sgs(@tactics.g(t))
  })
  log.attempt("g", () => {
    let t = tm("forall p q:bool. p /\\ q ==> q /\\ p")
    sgs(@tactics.g(t))
  })
  log.attempt("e1", () => sgs(@tactics.e(repeat_tac(gen_tac))))
  log.attempt("e2", () => sgs(@tactics.e(@tactics.strip_tac)))
  log.attempt("top_goal", () => {
    let (asl, w) = @tactics.top_goal()
    slist(stm, asl) + " ?- " + stm(w)
  })
  log.attempt("e3", () => sgs(@tactics.e(conj_tac)))
  log.attempt("r1", () => sgs(@tactics.r(1)))
  log.attempt("r_neg", () => sgs(@tactics.r(-1)))
  log.attempt("b1", () => sgs(@tactics.b()))
  log.attempt("e_valid", () => {
    sgs(@tactics.e(_ => (@tactics.null_meta, @list.List([]), (_, _) => truth)))
  })
  log.attempt("e4", () => sgs(@tactics.e(accept)))
  log.attempt("e_bad", () => sgs(@tactics.e(accept)))
  log.attempt("e5", () => sgs(@tactics.e(accept)))
  log.attempt("top_thm", () => sthm(@tactics.top_thm()))
  log.attempt("p", () => sgs(@tactics.p()))
  log.attempt("flush", () => {
    @tactics.flush_goalstack()
    sgs(@tactics.p())
  })
  log.attempt("b_too_far", () => sgs(@tactics.b()))
  log.attempt("g2", () => {
    let t = tm("(a /\\ b) /\\ (c /\\ d)")
    sgs(@tactics.g(t))
  })
  @lib.verbose.val = false
  log.attempt("er1", () => sgs(@tactics.er(conj_tac)))
  log.attempt("er2", () => sgs(@tactics.er(conj_tac)))
  @lib.verbose.val = true
  log.attempt("length", () => @tactics.p().length().to_string())
  log.attempt("set_goal", () => {
    let a = tm("a:bool")
    let w = tm("a /\\ (b ==> c)")
    sgs(@tactics.set_goal(@list.singleton(a), w))
  })
  log.attempt("e_lab", () => {
    sgs(
      @tactics.e(
        thenl(
          conj_tac,
          @list.List([all_tac, disch_then(th => label_tac("hb", th))]),
        ),
      ),
    )
  })
  log.attempt("top_realgoal", () => sgoal(@tactics.top_realgoal()))
  @tactics.print_goal_hyp_max_boxes.val = Some(3)
  log.attempt("max_boxes", () => {
    let a = tm("((a /\\ b) /\\ (c /\\ d)) /\\ ((e /\\ f) /\\ (g /\\ h))")
    let w = tm("p:bool")
    sgoal((@list.singleton(("", @kernel.assume_rule(a))), w))
  })
  @tactics.print_goal_hyp_max_boxes.val = None
  log.attempt("empty_goalstack", () => sgs(@list.List([])))
  log.attempt("top_thm_open", () => sthm(@tactics.top_thm()))
  @tactics.current_goalstack.val = @list.List([])
  log.attempt("e_nogoal", () => sgs(@tactics.e(all_tac)))
  log.attempt("by_nogoal", () => {
    let w = tm("T")
    let gs = @tactics.mk_goalstate((@list.List([]), w))
    sgls(@tactics.by(all_tac)(@tactics.by(accept_tac(truth))(gs)))
  })
  log.attempt("axioms", () => @kernel.axioms().map(sthm).to_array().join(" ;; "))
  log.attempt("constants", () => {
    @kernel.constants().map(c => c.0).to_array().join(" ")
  })
  log.attempt("counter_tyvar", () => stm(tm("zz_counter")))
  log.attempt("counter_genvar", () => stm(@basics.genvar(@kernel.bool_ty)))
  inspect(
    log.contents(),
    content=(
      #|tactics quotations (7):
      #|  (_FALSITY_ : Bool) == false
      #|  _FALSITY_
      #|  _FALSITY_
      #|  true
      #|  false
      #|  (p : Bool) && ((q : Bool) \226\134\146 (r : Bool))
      #|  (p : Bool) \226\134\146 (q : Bool)
      #|CONJ_TAC =  |- ((#/\:fun(bool,fun(bool,bool)) #T:bool) #T:bool)
      #|DISJ1_TAC =  |- ((#\/:fun(bool,fun(bool,bool)) #T:bool) #F:bool)
      #|DISJ2_TAC =  |- ((#\/:fun(bool,fun(bool,bool)) #F:bool) #T:bool)
      #|GEN_DISCH =  |- (#forall:fun(fun(bool,bool),bool) (\p:bool. ((#==>:fun(bool,fun(bool,bool)) p:bool) p:bool)))
      #|STRIP_TAC ! CONJ_TAC
      #|EXISTS_TAC =  |- (#?:fun(fun(bool,bool),bool) (\x:bool. x:bool))
      #|X_CHOOSE_TAC =  |- ((#==>:fun(bool,fun(bool,bool)) (#?:fun(fun(bool,bool),bool) (\x:bool. (P:fun(bool,bool) x:bool)))) (#?:fun(fun(bool,bool),bool) (\y:bool. (P:fun(bool,bool) y:bool))))
      #|STRIP_EXISTS =  |- ((#==>:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))) (#?:fun(fun('A,bool),bool) (\y:'A. (P:fun('A,bool) y:'A))))
      #|DISJ_CASES_THEN =  |- ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) p:bool) q:bool)) ((#\/:fun(bool,fun(bool,bool)) q:bool) p:bool))
      #|CONTR_TAC =  |- ((#==>:fun(bool,fun(bool,bool)) #F:bool) p:bool)
      #|MATCH_ACCEPT_TAC =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) b:bool) b:bool)))
      #|MATCH_MP_TAC =  |- ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (Q:fun('A,bool) x:'A))))) ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) c:'A)) (Q:fun('A,bool) c:'A)))
      #|ANTS_TAC =  |- ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) #T:bool) q:bool)) q:bool)
      #|EQ_TAC =  |- ((#=:fun(bool,fun(bool,bool)) p:bool) p:bool)
      #|MK_COMB_TAC =  |- ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) x:'A))
      #|AP_TERM_TAC =  |- ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool))) (#~:fun(bool,bool) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool)))
      #|AP_THM_TAC =  |- ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (f:fun('A,'B) x:'A))
      #|BINOP_TAC =  |- ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool))
      #|ABS_TAC =  |- ((#=:fun(fun('A,'B),fun(fun('A,'B),bool)) (\x:'A. (f:fun('A,'B) x:'A))) (\y:'A. (f:fun('A,'B) y:'A)))
      #|BETA_TAC =  |- ((\x:bool. x:bool) #T:bool)
      #|CONV_TAC_eq =  |- ((#=:fun(bool,fun(bool,bool)) ((\x:bool. x:bool) #T:bool)) #T:bool)
      #|CONV_TAC_T =  |- #T:bool
      #|CONV_TAC_bad ! CONV_TAC: bad equation
      #|SUBST1_TAC =  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#==>:fun(bool,fun(bool,bool)) b:bool) a:bool))))))
      #|SUBST_ALL_TAC =  |- ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#==>:fun(bool,fun(bool,bool)) a:bool) b:bool))
      #|SUBST_VAR_TAC =  |- ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)) ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (P:fun('A,bool) y:'A)))
      #|UNDISCH_TAC =  |- ((#==>:fun(bool,fun(bool,bool)) p:bool) p:bool)
      #|SPEC_TAC =  |- ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) a:'A)) (f:fun('A,'A) a:'A))
      #|X_GEN_TAC_type ! X_GEN_TAC: expected type :bool but got :A
      #|X_GEN_TAC_notvar ! X_GEN_TAC: not a variable
      #|X_GEN_TAC_invalid ! X_GEN_TAC: invalid variable
      #|X_GEN_TAC_notforall ! X_GEN_TAC: Not universally quantified
      #|GEN_TAC_primed = [\n`(x <=> x) \\/ x'`\n]
      #|SUBGOAL_THEN =  |- ((#==>:fun(bool,fun(bool,bool)) p:bool) ((#/\:fun(bool,fun(bool,bool)) p:bool) p:bool))
      #|Warning: SUBGOAL_TAC: additional subproofs ignored
      #|SUBGOAL_TAC = [\n`q`\n; \n  0 [`q`] (lab)\n\n`p`\n]
      #|SUBGOAL_TAC_none ! SUBGOAL_TAC: no subproof given
      #|FREEZE_THEN =  |- ((#==>:fun(bool,fun(bool,bool)) p:bool) p:bool)
      #|IMP_RES_THEN =  |- ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) p:bool) q:bool)) ((#==>:fun(bool,fun(bool,bool)) p:bool) q:bool))
      #|ANTE_RES_THEN =  |- ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) p:bool) q:bool)) ((#==>:fun(bool,fun(bool,bool)) p:bool) q:bool))
      #|IMP_RES_THEN_none ! tryfind
      #|LABEL_USE_THEN =  |- ((#==>:fun(bool,fun(bool,bool)) p:bool) ((#==>:fun(bool,fun(bool,bool)) q:bool) p:bool))
      #|USE_THEN_missing ! USE_TAC: didn't find assumption nope
      #|REMOVE_THEN = [\n  0 [`q`] (hq)\n\n`p ==> r`\n]
      #|HYP =  |- ((#==>:fun(bool,fun(bool,bool)) p:bool) p:bool)
      #|HYP_bad ! Invalid using pattern
      #|NAME_ASSUMS_TAC = [\n  0 [`a`] (H2)\n  1 [`b`] (H0)\n  2 [`c`] (H1)\n\n`d`\n]
      #|RULE_ASSUM_TAC = [\n  0 [`a`]\n  1 [`b`]\n\n`c`\n]
      #|STRIP_ASSUME_TAC = [\n  0 [`a`]\n  1 [`b`]\n\n`c`\n; \n  0 [`P x`]\n\n`c`\n]
      #|STRIP_ASSUME_TAC_dup = [\n  0 [`a`]\n\n`c`\n]
      #|STRUCT_CASES_TAC = [\n`P true`\n; \n`P false`\n]
      #|CONJUNCTS_THEN2 = [\n  0 [`a`]\n\n`b ==> c`\n]
      #|CHANGED_TAC_all ! CHANGED_TAC
      #|CHANGED_TAC_gen = [\n`x`\n]
      #|Warning: inventing type variables
      #|REPLICATE_TAC = [\n`forall z. x`\n]
      #|FAIL_TAC ! boom
      #|NO_TAC ! NO_TAC
      #|FIRST_empty ! end_itlist
      #|EVERY_empty = [\n`p`\n]
      #|FIRST = [\n`p`\n; \n`q`\n]
      #|MAP_EVERY = [\n`a`\n]
      #|MAP_FIRST = [\n  0 [`p`]\n\n`q`\n]
      #|TRY = [\n`p`\n]
      #|ORELSE = [\n`p`\n; \n`q`\n]
      #|THEN1 ! seqapply: Length mismatch
      #|THENL_mismatch ! seqapply: Length mismatch
      #|THENL_empty = []
      #|POP_ASSUM_empty ! POP_ASSUM: No assumption to pop
      #|POP_ASSUM_LIST = [\n  0 [`b`]\n  1 [`a`]\n\n`c`\n]
      #|EVERY_ASSUM = [\n  0 [`a`]\n  1 [`b`]\n\n`a ==> b ==> c`\n]
      #|ASSUM_LIST = [\n  0 [`a`]\n  1 [`b`]\n\n`b /\\ a ==> c`\n]
      #|FIND_ASSUM = [\n  0 [`a`]\n  1 [`b`]\n\n`a ==> c`\n]
      #|ASM = [\n  0 [`a`]\n\n`a ==> b`\n]
      #|ORELSE_TCL = [\n  0 [`a`]\n  1 [`b`]\n\n`c`\n]
      #|NO_THEN ! NO_THEN
      #|EVERY_TCL ! dest_binary
      #|REPEAT_GTCL = [\n  0 [`a`]\n  1 [`b`]\n  2 [`c`]\n\n`d`\n]
      #|FIRST_TCL_empty ! end_itlist
      #|TRANS_TAC = [\n`(a <=> b) /\\ (b <=> c)`\n]
      #|X_META_EXISTS_TAC = [\n`v /\\ y`\n]
      #|X_META_EXISTS_TAC_bad ! X_META_EXISTS_TAC
      #|META_EXISTS_TAC = [\n`x /\\ x'`\n]
      #|META_SPEC_TAC = [\n  0 [`P t`]\n\n`q`\n]
      #|CHEAT_TAC =  |- #F:bool
      #|RECALL_ACCEPT_TAC =  |- #T:bool
      #|prove_hyps ! prove: additional assumptions in result
      #|prove_unsolved ! TAC_PROOF: Unsolved goals
      #|prove_nonbool ! mk_goalstate: Non-boolean goal
      #|prove_alpha =  |- (#forall:fun(fun(bool,bool),bool) (\x:bool. ((#==>:fun(bool,fun(bool,bool)) x:bool) x:bool)))
      #|mk_fthm = #_FALSITY_:bool, a:bool |- b:bool
      #|equals_goal = true false
      #|compose_insts = [a:bool; b:'A; a:'A] [x:bool; y:'A; x:'A] [bool]
      #|inst_goal = \n  0 [`a`] (h)\n\n`a`\n
      #|Warning: Free variables in goal: x, y
      #|g_free = 1 subgoal (1 total)\n\n`x /\\ y ==> y`\n
      #|g = 1 subgoal (1 total)\n\n`forall p q. p /\\ q ==> q /\\ p`\n
      #|e1 = 1 subgoal (1 total)\n\n`p /\\ q ==> q /\\ p`\n
      #|e2 = 1 subgoal (1 total)\n\n  0 [`p`]\n  1 [`q`]\n\n`q /\\ p`\n
      #|top_goal = [q:bool; p:bool] ?- ((#/\:fun(bool,fun(bool,bool)) q:bool) p:bool)
      #|e3 = 2 subgoals (2 total)\n\n  0 [`p`]\n  1 [`q`]\n\n`p`\n\n  0 [`p`]\n  1 [`q`]\n\n`q`\n
      #|r1 = 1 subgoal (2 total)\n\n  0 [`p`]\n  1 [`q`]\n\n`p`\n
      #|r_neg = 1 subgoal (2 total)\n\n  0 [`p`]\n  1 [`q`]\n\n`q`\n
      #|b1 = 1 subgoal (2 total)\n\n  0 [`p`]\n  1 [`q`]\n\n`p`\n
      #|e_valid ! VALID: Invalid tactic
      #|e4 = 1 subgoal (1 total)\n\n  0 [`p`]\n  1 [`q`]\n\n`q`\n
      #|e_bad = No subgoals\n
      #|e5 ! No goal set
      #|top_thm =  |- (#forall:fun(fun(bool,bool),bool) (\p:bool. (#forall:fun(fun(bool,bool),bool) (\q:bool. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) q:bool)) ((#/\:fun(bool,fun(bool,bool)) q:bool) p:bool))))))
      #|p = No subgoals\n
      #|flush = No subgoals\n
      #|b_too_far ! Can't back up any more
      #|Warning: Free variables in goal: a, b, c, d
      #|g2 = 1 subgoal (1 total)\n\n`(a /\\ b) /\\ c /\\ d`\n
      #|er1 = 1 subgoal (2 total)\n\n`a /\\ b`\n
      #|er2 = 1 subgoal (3 total)\n\n`c /\\ d`\n
      #|length = 3
      #|set_goal = 1 subgoal (1 total)\n\n  0 [`a`]\n\n`a /\\ (b ==> c)`\n
      #|e_lab = 2 subgoals (2 total)\n\n  0 [`a`]\n  1 [`b`] (hb)\n\n`c`\n\n  0 [`a`]\n\n`a`\n
      #|top_realgoal = \n  0 [`a`]\n\n`a`\n
      #|max_boxes = \n  0 []\n\n`p`\n
      #|empty_goalstack = Empty goalstack
      #|top_thm_open !! Match_failure
      #|e_nogoal ! No current goal
      #|by_nogoal ! No goal set
      #|axioms =  |- #F:bool
      #|constants = _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?1
      #|counter_genvar = _22:bool
      #|

    ),
  )
}
