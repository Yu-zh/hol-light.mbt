// Load-fidelity and behaviour test for drule.ml: replays
// tools/ocaml_ref/drule_ref.ml (keep in sync).

///|
using @testkit {sty, stm, sthm}

///|
using @kernel {type Thm}

///|
fn sinst(i : @drule.Instantiation) -> String {
  let (bcs, tmin, tyin) = i
  "[" +
  bcs.map(p => p.0.to_string() + "," + stm(p.1)).to_array().join("; ") +
  "] [" +
  tmin.map(p => stm(p.0) + "/" + stm(p.1)).to_array().join("; ") +
  "] [" +
  tyin.map(p => sty(p.0) + "/" + sty(p.1)).to_array().join("; ") +
  "]"
}

///|
test "drule matches drule.ml" {
  let log = @testkit.Log::new()
  log.capture_reports()
  log.show_theory_trace("drule")
  let th = (name : String, f : () -> Thm raise) => {
    log.attempt(name, () => sthm(f()))
  }
  let tm = @parser.parse_term
  let hyp_of = (s : String) => @kernel.assume_rule(tm(s))
  let tmatch = (name : String, lc : Array[String], v : String, c : String) => {
    log.attempt(name, () => {
      let lconsts = @list.List(lc).map(tm)
      sinst(@drule.term_match(lconsts, tm(v), tm(c)))
    })
  }
  th("MK_CONJ", () => @drule.mk_conj_rule(hyp_of("a <=> b"), hyp_of("c <=> d")))
  th("MK_DISJ", () => @drule.mk_disj_rule(hyp_of("a <=> b"), hyp_of("c <=> d")))
  th("MK_FORALL", () => {
    @drule.mk_forall_rule(tm("x:A"), @kernel.refl(tm("(P:A->bool) x")))
  })
  th("MK_FORALL_bad", () => {
    @drule.mk_forall_rule(tm("x:A"), hyp_of("(P:A->bool) x <=> Q x"))
  })
  th("MK_EXISTS", () => {
    @drule.mk_exists_rule(tm("x:A"), @kernel.refl(tm("(P:A->bool) x")))
  })
  th("MP_CONV", () => {
    @drule.mp_conv(@equal.beta_conv, hyp_of("(\\x:bool. x) T ==> b"))
  })
  th("MP_CONV2", () => {
    @drule.mp_conv(t => @kernel.assume_rule(t), hyp_of("a ==> b"))
  })
  th("BETAS_CONV", () => @drule.betas_conv(tm("(\\x y. (f:A->A->A) x y) a b")))
  th("BETAS_CONV_bad", () => @drule.betas_conv(tm("(f:A->A) a")))
  tmatch("match_fo", [], "(f:A->B) x", "(g:num->bool) n")
  tmatch("match_const", [], "x /\\ y", "a /\\ (b \\/ c)")
  tmatch("match_poly", [], "(x:A) = y", "T = F")
  tmatch("match_bound", [], "\\x:A. (f:A->B) x", "\\y:num. (g:num->bool) y")
  tmatch("match_lconst", ["x:bool"], "x /\\ y", "x /\\ T")
  tmatch("match_lconst_bad", ["x:bool"], "x /\\ y", "y /\\ T")
  tmatch("match_bad", [], "x /\\ y", "a \\/ b")
  tmatch("match_ho", [], "forall x:A. (P:A->bool) x", "forall n:num. n = n")
  tmatch("match_ho2", [], "?x:A. (P:A->B->bool) x y", "?n:num. n = m /\\ m = n")
  tmatch("match_ho_app", [], "(P:A->bool) (f (x:A))", "Q (g (y:B)):bool")
  tmatch("match_ho_beta", [], "\\x:A. (P:A->A->bool) x c", "\\n:num. n = c")
  tmatch("match_repeat", [], "(x:A) = x", "T = T")
  tmatch("match_repeat_bad", [], "(x:A) = x", "T = F")
  let i1 = @drule.term_match(
    @list.List([]),
    tm("forall x:A. (P:A->bool) x"),
    tm("forall n:num. n = n"),
  )
  log.attempt("instantiate_ho", () => {
    stm(@drule.instantiate(i1, tm("(P:A->bool) (z:A)")))
  })
  th("INSTANTIATE_ho", () => {
    @drule.instantiate_rule(i1, @kernel.refl(tm("(P:A->bool) (z:A)")))
  })
  th("INSTANTIATE_bad", () => {
    @drule.instantiate_rule(
      (@list.List([]), @list.singleton((tm("T"), tm("q:bool"))), @list.List([])),
      hyp_of("q:bool"),
    )
  })
  th("INSTANTIATE_ALL", () => {
    @drule.instantiate_all(
      (@list.List([]), @list.singleton((tm("T"), tm("q:bool"))), @list.List([])),
      hyp_of("q:bool"),
    )
  })
  th("INSTANTIATE_ALL_ty", () => {
    @drule.instantiate_all(
      (
        @list.List([]),
        @list.List([]),
        @list.singleton((@kernel.bool_ty, @kernel.aty)),
      ),
      hyp_of("(x:A) = x"),
    )
  })
  log.attempt("term_unify", () => {
    let x = tm("x:A")
    let y = tm("y:A")
    let t1 = tm("(f:A->A->A) x (g y)")
    let t2 = tm("(f:A->A->A) (g z) y")
    sinst(@drule.term_unify(@list.List([x, y]), t1, t2))
  })
  log.attempt("term_unify_occurs", () => {
    sinst(
      @drule.term_unify(@list.singleton(tm("x:A")), tm("x:A"), tm("(g:A->A) x")),
    )
  })
  log.attempt("term_unify_abs", () => {
    sinst(
      @drule.term_unify(
        @list.singleton(tm("x:A")),
        tm("\\u:A. (f:A->A->A) u x"),
        tm("\\v:A. (f:A->A->A) v c"),
      ),
    )
  })
  let sty_insts = (l : @list.List[(@kernel.HolType, @kernel.HolType)]) => {
    l.map(p => sty(p.0) + "/" + sty(p.1)).to_array().join("; ")
  }
  log.attempt("type_unify", () => {
    sty_insts(
      @drule.type_unify(
        @parser.parse_type("A->B"),
        @parser.parse_type("bool->C"),
        @list.List([]),
      ),
    )
  })
  log.attempt("type_unify_bad", () => {
    sty_insts(
      @drule.type_unify(
        @parser.parse_type("A->A"),
        @parser.parse_type("bool->(A->bool)"),
        @list.List([]),
      ),
    )
  })
  log.attempt("term_type_unify", () => {
    sinst(
      @drule.term_type_unify(
        tm("(f:A->B) x"),
        tm("(g:bool->C) T"),
        (@list.List([]), @list.List([]), @list.List([])),
      ),
    )
  })
  log.attempt("deep_alpha", () => {
    stm(
      @drule.deep_alpha(
        @list.List([("y", "x"), ("b", "a")]),
        tm("\\x:A. \\a:A. (f:A->A->A) x a"),
      ),
    )
  })
  let addth = hyp_of("forall x y. (f:A->A->A) x y = f y x")
  th("PART_MATCH", () => {
    @drule.part_match(@equal.lhs, addth)(tm("(f:A->A->A) u v"))
  })
  th("PART_MATCH_bad", () => {
    @drule.part_match(@equal.lhs, addth)(tm("(g:A->A->A) u v"))
  })
  th("GEN_PART_MATCH", () => {
    @drule.gen_part_match(@equal.lhs, hyp_of("forall x. (f:A->A->A) x y = f y x"))(
      tm("(f:A->A->A) u v"),
    )
  })
  th("MATCH_MP", () => {
    @drule.match_mp(hyp_of("forall x:A. (P:A->bool) x ==> Q x"))(
      hyp_of("(P:A->bool) c"),
    )
  })
  th("MATCH_MP_ty", () => {
    @drule.match_mp(hyp_of("forall x:A. (x = x) ==> T"))(@kernel.refl(tm("F")))
  })
  th("MATCH_MP_bad", () => {
    @drule.match_mp(hyp_of("forall x:A. (P:A->bool) x ==> Q x"))(
      hyp_of("(R:A->bool) c"),
    )
  })
  th("MATCH_MP_notimp", () => {
    // OCaml evaluates the argument before MATCH_MP fails.
    let a1 = hyp_of("a:bool")
    let a2 = hyp_of("a:bool")
    @drule.match_mp(a1)(a2)
  })
  th("MATCH_MP_partial", () => {
    @drule.match_mp(hyp_of("forall x y:A. (P:A->bool) x ==> (R:A->A->bool) x y"))(
      hyp_of("(P:A->bool) c"),
    )
  })
  let hr = hyp_of("forall x:A. (P:A->bool) ((f:A->A) x) <=> Q x")
  th("HIGHER_REWRITE_CONV", () => {
    @drule.higher_rewrite_conv(@list.singleton(hr))(true)(
      tm("a /\\ (R:A->bool) ((f:A->A) c)"),
    )
  })
  th("new_definition", () => {
    @drule.new_definition(tm("TWICE (f:A->A) x = f (f x)"))
  })
  th("new_definition_bad", () => @drule.new_definition(tm("a /\\ b")))
  th("mk_thm", () => {
    @drule.mk_thm(@list.List([tm("a:bool"), tm("b:bool")]), tm("c:bool"))
  })
  log.attempt("axioms", () => @kernel.axioms().map(sthm).to_array().join(" ;; "))
  log.attempt("constants", () => {
    @kernel.constants().map(e => e.0).to_array().join(" ")
  })
  log.attempt("counter_tyvar", () => stm(tm("zz_counter")))
  log.attempt("counter_genvar", () => stm(@basics.genvar(@kernel.bool_ty)))
  log.attempt("term_unify_abs_bad", () => {
    let t1 = tm("\\x:bool. x")
    let t2 = tm("(~)")
    sinst(@drule.term_unify(@list.List([]), t1, t2))
  })
  log.attempt("term_type_unify_abs_bad", () => {
    let t1 = tm("\\x:bool. x")
    let t2 = tm("(~)")
    sinst(
      @drule.term_type_unify(
        t1,
        t2,
        (@list.List([]), @list.List([]), @list.List([])),
      ),
    )
  })
  inspect(
    log.contents(),
    content=(
      #|drule quotations (2):
      #|  op_slash_bslash
      #|  op_bslash_slash
      #|MK_CONJ = ((#=:fun(bool,fun(bool,bool)) a:bool) b:bool), ((#=:fun(bool,fun(bool,bool)) c:bool) d:bool) |- ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) c:bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) d:bool))
      #|MK_DISJ = ((#=:fun(bool,fun(bool,bool)) a:bool) b:bool), ((#=:fun(bool,fun(bool,bool)) c:bool) d:bool) |- ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) a:bool) c:bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) d:bool))
      #|MK_FORALL =  |- ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A))))
      #|MK_FORALL_bad ! ABS
      #|MK_EXISTS =  |- ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))) (#?:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A))))
      #|MP_CONV = ((#==>:fun(bool,fun(bool,bool)) ((\x:bool. x:bool) #T:bool)) b:bool) |- b:bool
      #|MP_CONV2 = a:bool, ((#==>:fun(bool,fun(bool,bool)) a:bool) b:bool) |- b:bool
      #|BETAS_CONV =  |- ((#=:fun('A,fun('A,bool)) (((\x:'A. (\y:'A. ((f:fun('A,fun('A,'A)) x:'A) y:'A))) a:'A) b:'A)) ((f:fun('A,fun('A,'A)) a:'A) b:'A))
      #|BETAS_CONV_bad ! BETAS_CONV
      #|match_fo = [] [g:fun('num,bool)/f:fun('num,bool); n:'num/x:'num] ['num/'A; bool/'B]
      #|match_const = [] [((#\/:fun(bool,fun(bool,bool)) b:bool) c:bool)/y:bool; a:bool/x:bool] []
      #|match_poly = [] [#F:bool/y:bool; #T:bool/x:bool] [bool/'A]
      #|match_bound = [] [g:fun('num,bool)/f:fun('num,bool)] [bool/'B; 'num/'A]
      #|match_lconst = [] [#T:bool/y:bool] []
      #|match_lconst_bad ! term_pmatch: can't instantiate local constant
      #|match_bad ! term_pmatch
      #|match_ho = [1,P:fun('num,bool)] [(\n:'num. ((#=:fun('num,fun('num,bool)) n:'num) n:'num))/P:fun('num,bool)] ['num/'A]
      #|match_ho2 = [1,P:fun('num,fun(bool,bool))] [(\n:'num. (#/\:fun(bool,fun(bool,bool)) ((#=:fun('num,fun('num,bool)) n:'num) m:'num)))/P:fun('num,fun(bool,bool)); ((#=:fun('num,fun('num,bool)) m:'num) n:'num)/y:bool] [bool/'B; 'num/'A]
      #|Warning: inventing type variables
      #|match_ho_app ! type_match
      #|match_ho_beta = [] [#=:fun('num,fun('num,bool))/P:fun('num,fun('num,bool))] ['num/'A]
      #|match_repeat = [] [#T:bool/x:bool] [bool/'A]
      #|match_repeat_bad ! safe_inserta
      #|instantiate_ho = ((#=:fun('num,fun('num,bool)) z:'num) z:'num)
      #|INSTANTIATE_ho =  |- ((#=:fun(bool,fun(bool,bool)) ((#=:fun('num,fun('num,bool)) z:'num) z:'num)) ((#=:fun('num,fun('num,bool)) z:'num) z:'num))
      #|INSTANTIATE_bad ! INSTANTIATE: term or type var free in assumptions
      #|INSTANTIATE_ALL = #T:bool |- #T:bool
      #|INSTANTIATE_ALL_ty = ((#=:fun(bool,fun(bool,bool)) x:bool) x:bool) |- ((#=:fun(bool,fun(bool,bool)) x:bool) x:bool)
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|term_unify = [] [(g:fun('?1,'A) z:'?1)/x:'A; (g:fun('?2,'A) y:'?2)/y:'A] []
      #|term_unify_occurs ! augment_insts
      #|term_unify_abs = [] [c:'A/x:'A] []
      #|type_unify = bool/'A; 'C/'B
      #|type_unify_bad ! type_unify: augment_insts
      #|term_type_unify = [] [g:fun(bool,'C)/f:fun(bool,'C); #T:bool/x:bool] ['C/'B; bool/'A]
      #|deep_alpha = (\y:'A. (\b:'A. ((f:fun('A,fun('A,'A)) y:'A) b:'A)))
      #|PART_MATCH = (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#=:fun('A,fun('A,bool)) ((f:fun('A,fun('A,'A)) x:'A) y:'A)) ((f:fun('A,fun('A,'A)) y:'A) x:'A)))))) |- ((#=:fun('A,fun('A,bool)) ((f:fun('A,fun('A,'A)) u:'A) v:'A)) ((f:fun('A,fun('A,'A)) v:'A) u:'A))
      #|PART_MATCH_bad ! term_pmatch: can't instantiate local constant
      #|GEN_PART_MATCH ! term_pmatch: can't instantiate local constant
      #|MATCH_MP = (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (Q:fun('A,bool) x:'A)))), (P:fun('A,bool) c:'A) |- (Q:fun('A,bool) c:'A)
      #|MATCH_MP_ty ! MATCH_MP: No match
      #|MATCH_MP_bad ! MATCH_MP: No match
      #|MATCH_MP_notimp ! MATCH_MP: Not an implication
      #|MATCH_MP_partial = (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((R:fun('A,fun('A,bool)) x:'A) y:'A)))))), (P:fun('A,bool) c:'A) |- (#forall:fun(fun('A,bool),bool) (\y:'A. ((R:fun('A,fun('A,bool)) c:'A) y:'A)))
      #|HIGHER_REWRITE_CONV = (#forall:fun(fun(bool,bool),bool) (\x:bool. ((#=:fun(bool,fun(bool,bool)) ((\_5:bool. _5:bool) ((#/\:fun(bool,fun(bool,bool)) a:bool) x:bool))) (Q:fun(bool,bool) x:bool)))) |- ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) (R:fun('A,bool) (f:fun('A,'A) c:'A)))) (Q:fun(bool,bool) (R:fun('A,bool) (f:fun('A,'A) c:'A))))
      #|new_definition =  |- (#forall:fun(fun(fun('A,'A),bool),bool) (\f:fun('A,'A). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('A,fun('A,bool)) ((#TWICE:fun(fun('A,'A),fun('A,'A)) f:fun('A,'A)) x:'A)) (f:fun('A,'A) (f:fun('A,'A) x:'A)))))))
      #|new_definition_bad ! new_definition: Not an equation
      #|mk_thm = a:bool, b:bool |- c:bool
      #|axioms =  |- ((#==>:fun(bool,fun(bool,bool)) b:bool) ((#==>:fun(bool,fun(bool,bool)) a:bool) c:bool))
      #|constants = TWICE ?! ~ F \/ ? forall ==> /\ T =
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?3
      #|counter_genvar = _7:bool
      #|term_unify_abs_bad ! body: Not an abstraction
      #|term_type_unify_abs_bad ! body: Not an abstraction
      #|

    ),
  )
}
