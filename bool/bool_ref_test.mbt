// Load-fidelity and behaviour test for bool.ml: replays
// tools/ocaml_ref/bool_ref.ml (keep in sync). Besides theorems, it compares
// the constants/types/definitions, the parse tables and the global counters
// after loading, which checks that load-time effects happen in upstream's
// order.

///|
using @testkit {sty, stm, sthm}

///|
test "bool matches bool.ml" {
  let log = @testkit.Log::new()
  log.show_theory_trace("bool")
  log.capture_reports()
  let th = (name : String, f : () -> @kernel.Thm raise) => {
    log.attempt(name, () => sthm(f()))
  }
  let tm = @parser.parse_term
  let names = (l : @list.List[(String, @kernel.HolType)]) => {
    l.map(e => e.0).to_array().join(" ")
  }
  log.out("constants = " + names(@kernel.constants()))
  log.out("types = " + @kernel.types().map(e => e.0).to_array().join(" "))
  log.out(
    "definitions = " + @kernel.definitions().map(sthm).to_array().join(" ;; "),
  )
  log.out("axioms = " + @kernel.axioms().length().to_string())
  log.out(
    "infixes = " +
    @printer.infixes()
    .map(e => e.0 + "/" + e.1.0.to_string() + e.1.1)
    .to_array()
    .join(" "),
  )
  log.out("binders = " + @printer.binders().to_array().join(" "))
  log.out("prefixes = " + @printer.prefixes().to_array().join(" "))
  log.out(
    "interface = " +
    @printer.the_interface.val
    .map(e => e.0 + "=" + e.1.0 + ":" + sty(e.1.1))
    .to_array()
    .join(" "),
  )
  let theorems : Array[(String, @kernel.Thm)] = [
    ("T_DEF", @bool.t_def()),
    ("TRUTH", @bool.truth()),
    ("AND_DEF", @bool.and_def()),
    ("IMP_DEF", @bool.imp_def()),
    ("FORALL_DEF", @bool.forall_def()),
    ("EXISTS_DEF", @bool.exists_def()),
    ("OR_DEF", @bool.or_def()),
    ("F_DEF", @bool.f_def()),
    ("NOT_DEF", @bool.not_def()),
    ("EXISTS_UNIQUE_DEF", @bool.exists_unique_def()),
  ]
  for t in theorems {
    th(t.0, () => t.1)
  }
  let a = tm("a:bool")
  let b = tm("b:bool")
  let c = tm("c:bool")
  let ha = @kernel.assume_rule(a)
  let hb = @kernel.assume_rule(b)
  let hyp_of = (s : String) => @kernel.assume_rule(tm(s))
  th("EQT_INTRO", () => @bool.eqt_intro(ha))
  th("EQT_ELIM", () => @bool.eqt_elim(@bool.eqt_intro(ha)))
  th("EQT_ELIM_bad", () => @bool.eqt_elim(ha))
  th("CONJ", () => @bool.conj(ha, hb))
  th("CONJUNCT1", () => @bool.conjunct1(@bool.conj(ha, hb)))
  th("CONJUNCT2", () => @bool.conjunct2(@bool.conj(ha, hb)))
  th("CONJUNCT1_bad", () => @bool.conjunct1(ha))
  log.attempt("CONJUNCTS", () => {
    @bool.conjuncts_rule(hyp_of("a /\\ (b /\\ c) /\\ d"))
    .map(sthm)
    .to_array()
    .join(" ;; ")
  })
  th("MP", () => @bool.mp(hyp_of("a ==> b"), ha))
  th("MP_bad", () => @bool.mp(hyp_of("a ==> b"), hb))
  th("DISCH", () => @bool.disch(a, @bool.conj(ha, hb)))
  th("DISCH_ALL", () => @bool.disch_all(@bool.conj(ha, hb)))
  th("UNDISCH", () => @bool.undisch(hyp_of("a ==> b ==> c")))
  th("UNDISCH_ALL", () => @bool.undisch_all(hyp_of("a ==> b ==> c")))
  th("IMP_ANTISYM_RULE", () => {
    @bool.imp_antisym_rule(hyp_of("a ==> b"), hyp_of("b ==> a"))
  })
  th("ADD_ASSUM", () => @bool.add_assum(c, ha))
  log.attempt("EQ_IMP_RULE", () => {
    let (x, y) = @bool.eq_imp_rule(hyp_of("a <=> b"))
    sthm(x) + " ;; " + sthm(y)
  })
  th("IMP_TRANS", () => @bool.imp_trans(hyp_of("a ==> b"), hyp_of("b ==> c")))
  th("IMP_TRANS_bad", () => {
    @bool.imp_trans(hyp_of("a ==> b"), hyp_of("c ==> c"))
  })
  let fa = hyp_of("forall x:A. (P:A->bool) x")
  th("SPEC", () => @bool.spec(tm("y:A"), fa))
  th("SPEC_bad", () => @bool.spec(tm("y:B"), fa))
  th("SPECL", () => {
    @bool.specl(
      @list.List([tm("u:num"), tm("v:num")]),
      hyp_of("forall x y:num. (R:num->num->bool) x y"),
    )
  })
  th("SPEC_ALL", () => {
    @bool.spec_all(hyp_of("forall x y:num. (R:num->num->bool) x y /\\ R y x"))
  })
  th("ISPEC", () => @bool.ispec(tm("n:num"), hyp_of("forall x:A. x = x")))
  th("ISPECL", () => {
    @bool.ispecl(
      @list.List([tm("n:num"), tm("T")]),
      hyp_of("forall(x:A) (y:B). x = x /\\ y = y"),
    )
  })
  th("GEN", () => {
    @bool.gen(tm("x:A"), @bool.disch_all(hyp_of("(P:A->bool) x ==> P x")))
  })
  th("GEN_bad", () => @bool.gen(tm("x:A"), hyp_of("(P:A->bool) x")))
  th("GENL", () => {
    @bool.genl(
      @list.List([tm("x:A"), tm("y:A")]),
      @kernel.refl(tm("(f:A->A->A) x y")),
    )
  })
  th("GEN_ALL", () => {
    @bool.gen_all(@bool.disch_all(hyp_of("(P:A->B->bool) x y")))
  })
  th("EXISTS", () => {
    @bool.exists_rule(
      tm("?x:num. x = x"),
      tm("n:num"),
      @kernel.refl(tm("n:num")),
    )
  })
  th("SIMPLE_EXISTS", () => {
    @bool.simple_exists(tm("n:num"), @kernel.refl(tm("n:num")))
  })
  th("CHOOSE", () => {
    @bool.choose_rule(
      tm("x:A"),
      hyp_of("?x:A. (P:A->bool) x"),
      @bool.add_assum(tm("(P:A->bool) x"), @kernel.refl(tm("T"))),
    )
  })
  th("SIMPLE_CHOOSE", () => {
    @bool.simple_choose(
      tm("x:A"),
      @bool.add_assum(tm("(P:A->bool) x"), @kernel.refl(tm("T"))),
    )
  })
  th("DISJ1", () => @bool.disj1(ha, b))
  th("DISJ2", () => @bool.disj2(a, hb))
  th("DISJ_CASES", () => {
    @bool.disj_cases(hyp_of("a \\/ b"), @bool.disj2(b, ha), @bool.disj1(hb, a))
  })
  th("DISJ_CASES_bad", () => @bool.disj_cases(hyp_of("a \\/ b"), ha, hb))
  th("SIMPLE_DISJ_CASES", () => {
    @bool.simple_disj_cases(
      @bool.add_assum(a, @kernel.refl(tm("T"))),
      @bool.add_assum(b, @kernel.refl(tm("T"))),
    )
  })
  th("NOT_ELIM", () => @bool.not_elim(hyp_of("~a")))
  th("NOT_INTRO", () => @bool.not_intro(hyp_of("a ==> F")))
  th("EQF_INTRO", () => @bool.eqf_intro(hyp_of("~a")))
  th("EQF_ELIM", () => @bool.eqf_elim(hyp_of("a <=> F")))
  th("CONTR", () => @bool.contr(a, hyp_of("F")))
  th("CONTR_bad", () => @bool.contr(a, ha))
  th("EXISTENCE", () => @bool.existence(hyp_of("?!x:num. x = n")))
  th("PINST", () => {
    @bool.pinst(
      @list.singleton((@kernel.bool_ty, @kernel.aty)),
      @list.singleton((tm("T"), @kernel.mk_var("x", @kernel.aty))),
      @kernel.refl(tm("(f:A->A) x")),
    )
  })
  th("PROVE_HYP", () => @bool.prove_hyp(ha, @bool.conj(ha, hb)))
  log.attempt("mk_iff", () => stm(@bool.mk_iff(a, b)))
  log.attempt("dest_iff_bad", () => stm(@bool.dest_iff(tm("(x:num) = y")).0))
  log.attempt("mk_neg", () => stm(@bool.mk_neg(a)))
  log.attempt("mk_neg_bad", () => stm(@bool.mk_neg(tm("x:num"))))
  log.attempt("verbose", () => stm(tm("forall x. exists y. x = y /\\ true")))
  log.attempt("print", () => {
    @printer.string_of_term(tm("forall x. ?y. x = y /\\ (p <=> q) ==> ~r \\/ F"))
  })
  log.attempt("counter_tyvar", () => stm(tm("zz_counter")))
  log.attempt("counter_pgenvar", () => stm(tm("{x | T}")))
  log.attempt("counter_genvar", () => stm(@basics.genvar(@kernel.bool_ty)))
  inspect(
    log.contents(),
    content=(
      #|bool quotations (94):
      #|  (op_eq : (Bool, Bool) -> Bool)
      #|  (op_eq : (Bool, Bool) -> Bool)
      #|  (T : Bool) == (((p : Bool) => p) == ((p : Bool) => p))
      #|  (p : Bool) => p
      #|  (t : Bool)
      #|  (op_slash_bslash : (Bool, Bool) -> Bool) == ((p : Bool) => (q : Bool) => ((f : (Bool, Bool) -> Bool) => f(p, q)) == ((f : (Bool, Bool) -> Bool) => f(true, true)))
      #|  (f : (Bool, Bool) -> Bool)
      #|  (p : Bool)
      #|  (q : Bool)
      #|  (p : Bool) => (q : Bool) => q
      #|  (P : Bool)
      #|  (Q : Bool)
      #|  (p : Bool) => (q : Bool) => p
      #|  (P : Bool)
      #|  (Q : Bool)
      #|  (p : Bool) => (q : Bool) => q
      #|  (op_eq_eq_gt : (Bool, Bool) -> Bool) == ((p : Bool) => (q : Bool) => (p && q) == p)
      #|  (p : Bool)
      #|  (q : Bool)
      #|  (p : Bool)
      #|  (q : Bool)
      #|  (p : Bool)
      #|  (q : Bool)
      #|  op_eq_eq_gt
      #|  (p : Bool) == (q : Bool)
      #|  (p : Bool) \226\134\146 (q : Bool)
      #|  (q : Bool) \226\134\146 (r : Bool)
      #|  (forall : ((A) -> Bool) -> Bool) == ((P : (A) -> Bool) => P == ((x : A) => true))
      #|  (P : (A) -> Bool)
      #|  (x : A)
      #|  forall((P : (A) -> Bool))
      #|  (P : (A) -> Bool)
      #|  (x : A)
      #|  (P : (A) -> Bool)
      #|  (op_q : ((A) -> Bool) -> Bool) == ((P : (A) -> Bool) => \226\136\128 q : Bool, (\226\136\128 x : A, P(x) \226\134\146 q) \226\134\146 q)
      #|  (P : (A) -> Bool)
      #|  (x : A)
      #|  \226\136\128 x : A, (P : (A) -> Bool)(x) \226\134\146 (Q : Bool)
      #|  (x : A)
      #|  (P : (A) -> Bool)((x : A))
      #|  \226\136\128 x : A, (P : (A) -> Bool)(x) \226\134\146 (Q : Bool)
      #|  (Q : Bool)
      #|  (P : (A) -> Bool)
      #|  (Q : Bool)
      #|  (Q : Bool)
      #|  op_q((P : (A) -> Bool))
      #|  (op_bslash_slash : (Bool, Bool) -> Bool) == ((p : Bool) => (q : Bool) => \226\136\128 r : Bool, (p \226\134\146 r) \226\134\146 (q \226\134\146 r) \226\134\146 r)
      #|  (P : Bool)
      #|  (Q : Bool)
      #|  (P : Bool)
      #|  (Q : Bool)
      #|  (P : Bool)
      #|  (P : Bool) \226\134\146 (t : Bool)
      #|  (Q : Bool) \226\134\146 (t : Bool)
      #|  (P : Bool) \226\134\146 (t : Bool)
      #|  (t : Bool)
      #|  (P : Bool)
      #|  (Q : Bool)
      #|  (P : Bool)
      #|  (Q : Bool)
      #|  (Q : Bool)
      #|  (Q : Bool) \226\134\146 (t : Bool)
      #|  (Q : Bool) \226\134\146 (t : Bool)
      #|  (P : Bool) \226\134\146 (t : Bool)
      #|  (t : Bool)
      #|  (P : Bool)
      #|  (Q : Bool)
      #|  (R : Bool)
      #|  (P : Bool)
      #|  (Q : Bool)
      #|  (P : Bool) || (Q : Bool)
      #|  (R : Bool)
      #|  (F : Bool) == (\226\136\128 p : Bool, p)
      #|  (op_tilde : (Bool) -> Bool) == ((p : Bool) => p \226\134\146 false)
      #|  op_tilde
      #|  (P : Bool)
      #|  (P : Bool)
      #|  (P : Bool)
      #|  !(P : Bool)
      #|  false
      #|  false
      #|  (P : Bool)
      #|  (P : Bool)
      #|  (P : Bool) == false
      #|  false
      #|  (P : Bool)
      #|  false
      #|  false
      #|  (op_q_bang : ((A) -> Bool) -> Bool) == ((P : (A) -> Bool) => op_q(P) && (\226\136\128 x : A, \226\136\128 y : A, P(x) && P(y) \226\134\146 x == y))
      #|  (P : (A) -> Bool)
      #|  true
      #|  false
      #|  (op_q : ((A) -> Bool) -> Bool)
      #|  (op_q_bang : ((A) -> Bool) -> Bool)
      #|constants = ?! ~ F \/ ? forall ==> /\ T =
      #|types = bool fun
      #|definitions =  |- ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) #?!:fun(fun('A,bool),bool)) (\P:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) P:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (P:fun('A,bool) y:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))))) ;;  |- ((#=:fun(fun(bool,bool),fun(fun(bool,bool),bool)) #~:fun(bool,bool)) (\p:bool. ((#==>:fun(bool,fun(bool,bool)) p:bool) #F:bool))) ;;  |- ((#=:fun(bool,fun(bool,bool)) #F:bool) (#forall:fun(fun(bool,bool),bool) (\p:bool. p:bool))) ;;  |- ((#=:fun(fun(bool,fun(bool,bool)),fun(fun(bool,fun(bool,bool)),bool)) #\/:fun(bool,fun(bool,bool))) (\p:bool. (\q:bool. (#forall:fun(fun(bool,bool),bool) (\r:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) p:bool) r:bool)) ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) q:bool) r:bool)) r:bool))))))) ;;  |- ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) #?:fun(fun('A,bool),bool)) (\P:fun('A,bool). (#forall:fun(fun(bool,bool),bool) (\q:bool. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) q:bool)))) q:bool))))) ;;  |- ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) #forall:fun(fun('A,bool),bool)) (\P:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) P:fun('A,bool)) (\x:'A. #T:bool)))) ;;  |- ((#=:fun(fun(bool,fun(bool,bool)),fun(fun(bool,fun(bool,bool)),bool)) #==>:fun(bool,fun(bool,bool))) (\p:bool. (\q:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) q:bool)) p:bool)))) ;;  |- ((#=:fun(fun(bool,fun(bool,bool)),fun(fun(bool,fun(bool,bool)),bool)) #/\:fun(bool,fun(bool,bool))) (\p:bool. (\q:bool. ((#=:fun(fun(fun(bool,fun(bool,bool)),bool),fun(fun(fun(bool,fun(bool,bool)),bool),bool)) (\f:fun(bool,fun(bool,bool)). ((f:fun(bool,fun(bool,bool)) p:bool) q:bool))) (\f:fun(bool,fun(bool,bool)). ((f:fun(bool,fun(bool,bool)) #T:bool) #T:bool)))))) ;;  |- ((#=:fun(bool,fun(bool,bool)) #T:bool) ((#=:fun(fun(bool,bool),fun(fun(bool,bool),bool)) (\p:bool. p:bool)) (\p:bool. p:bool)))
      #|axioms = 0
      #|infixes = <=>/2right ==>/4right \//6right /\/8right =/12right ,/14right
      #|binders = \ forall ? ?! exists existsunique
      #|prefixes = ~
      #|interface = existsunique=?!:fun(fun('A,bool),bool) exists=?:fun(fun('A,bool),bool) false=F:bool true=T:bool <=>==:fun(bool,fun(bool,bool))
      #|T_DEF =  |- ((#=:fun(bool,fun(bool,bool)) #T:bool) ((#=:fun(fun(bool,bool),fun(fun(bool,bool),bool)) (\p:bool. p:bool)) (\p:bool. p:bool)))
      #|TRUTH =  |- #T:bool
      #|AND_DEF =  |- ((#=:fun(fun(bool,fun(bool,bool)),fun(fun(bool,fun(bool,bool)),bool)) #/\:fun(bool,fun(bool,bool))) (\p:bool. (\q:bool. ((#=:fun(fun(fun(bool,fun(bool,bool)),bool),fun(fun(fun(bool,fun(bool,bool)),bool),bool)) (\f:fun(bool,fun(bool,bool)). ((f:fun(bool,fun(bool,bool)) p:bool) q:bool))) (\f:fun(bool,fun(bool,bool)). ((f:fun(bool,fun(bool,bool)) #T:bool) #T:bool))))))
      #|IMP_DEF =  |- ((#=:fun(fun(bool,fun(bool,bool)),fun(fun(bool,fun(bool,bool)),bool)) #==>:fun(bool,fun(bool,bool))) (\p:bool. (\q:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) q:bool)) p:bool))))
      #|FORALL_DEF =  |- ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) #forall:fun(fun('A,bool),bool)) (\P:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) P:fun('A,bool)) (\x:'A. #T:bool))))
      #|EXISTS_DEF =  |- ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) #?:fun(fun('A,bool),bool)) (\P:fun('A,bool). (#forall:fun(fun(bool,bool),bool) (\q:bool. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) q:bool)))) q:bool)))))
      #|OR_DEF =  |- ((#=:fun(fun(bool,fun(bool,bool)),fun(fun(bool,fun(bool,bool)),bool)) #\/:fun(bool,fun(bool,bool))) (\p:bool. (\q:bool. (#forall:fun(fun(bool,bool),bool) (\r:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) p:bool) r:bool)) ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) q:bool) r:bool)) r:bool)))))))
      #|F_DEF =  |- ((#=:fun(bool,fun(bool,bool)) #F:bool) (#forall:fun(fun(bool,bool),bool) (\p:bool. p:bool)))
      #|NOT_DEF =  |- ((#=:fun(fun(bool,bool),fun(fun(bool,bool),bool)) #~:fun(bool,bool)) (\p:bool. ((#==>:fun(bool,fun(bool,bool)) p:bool) #F:bool)))
      #|EXISTS_UNIQUE_DEF =  |- ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) #?!:fun(fun('A,bool),bool)) (\P:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) P:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (P:fun('A,bool) y:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)))))))))
      #|EQT_INTRO = a:bool |- ((#=:fun(bool,fun(bool,bool)) a:bool) #T:bool)
      #|EQT_ELIM = a:bool |- a:bool
      #|EQT_ELIM_bad ! EQT_ELIM
      #|CONJ = a:bool, b:bool |- ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool)
      #|CONJUNCT1 = a:bool, b:bool |- a:bool
      #|CONJUNCT2 = a:bool, b:bool |- b:bool
      #|CONJUNCT1_bad ! CONJUNCT1
      #|CONJUNCTS = ((#/\:fun(bool,fun(bool,bool)) a:bool) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) c:bool)) d:bool)) |- a:bool ;; ((#/\:fun(bool,fun(bool,bool)) a:bool) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) c:bool)) d:bool)) |- b:bool ;; ((#/\:fun(bool,fun(bool,bool)) a:bool) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) c:bool)) d:bool)) |- c:bool ;; ((#/\:fun(bool,fun(bool,bool)) a:bool) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) c:bool)) d:bool)) |- d:bool
      #|MP = a:bool, ((#==>:fun(bool,fun(bool,bool)) a:bool) b:bool) |- b:bool
      #|MP_bad ! MP: theorems do not agree
      #|DISCH = b:bool |- ((#==>:fun(bool,fun(bool,bool)) a:bool) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool))
      #|DISCH_ALL =  |- ((#==>:fun(bool,fun(bool,bool)) b:bool) ((#==>:fun(bool,fun(bool,bool)) a:bool) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool)))
      #|UNDISCH = a:bool, ((#==>:fun(bool,fun(bool,bool)) a:bool) ((#==>:fun(bool,fun(bool,bool)) b:bool) c:bool)) |- ((#==>:fun(bool,fun(bool,bool)) b:bool) c:bool)
      #|UNDISCH_ALL = a:bool, b:bool, ((#==>:fun(bool,fun(bool,bool)) a:bool) ((#==>:fun(bool,fun(bool,bool)) b:bool) c:bool)) |- c:bool
      #|IMP_ANTISYM_RULE = ((#==>:fun(bool,fun(bool,bool)) a:bool) b:bool), ((#==>:fun(bool,fun(bool,bool)) b:bool) a:bool) |- ((#=:fun(bool,fun(bool,bool)) a:bool) b:bool)
      #|ADD_ASSUM = a:bool, c:bool |- a:bool
      #|EQ_IMP_RULE = ((#=:fun(bool,fun(bool,bool)) a:bool) b:bool) |- ((#==>:fun(bool,fun(bool,bool)) a:bool) b:bool) ;; ((#=:fun(bool,fun(bool,bool)) a:bool) b:bool) |- ((#==>:fun(bool,fun(bool,bool)) b:bool) a:bool)
      #|IMP_TRANS = ((#==>:fun(bool,fun(bool,bool)) a:bool) b:bool), ((#==>:fun(bool,fun(bool,bool)) b:bool) c:bool) |- ((#==>:fun(bool,fun(bool,bool)) a:bool) c:bool)
      #|IMP_TRANS_bad ! IMP_TRANS
      #|SPEC = (#forall:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A))) |- (P:fun('A,bool) y:'A)
      #|SPEC_bad ! SPEC
      #|SPECL = (#forall:fun(fun('num,bool),bool) (\x:'num. (#forall:fun(fun('num,bool),bool) (\y:'num. ((R:fun('num,fun('num,bool)) x:'num) y:'num))))) |- ((R:fun('num,fun('num,bool)) u:'num) v:'num)
      #|SPEC_ALL = (#forall:fun(fun('num,bool),bool) (\x:'num. (#forall:fun(fun('num,bool),bool) (\y:'num. ((#/\:fun(bool,fun(bool,bool)) ((R:fun('num,fun('num,bool)) x:'num) y:'num)) ((R:fun('num,fun('num,bool)) y:'num) x:'num)))))) |- ((#/\:fun(bool,fun(bool,bool)) ((R:fun('num,fun('num,bool)) x:'num) y:'num)) ((R:fun('num,fun('num,bool)) y:'num) x:'num))
      #|ISPEC = (#forall:fun(fun('num,bool),bool) (\x:'num. ((#=:fun('num,fun('num,bool)) x:'num) x:'num))) |- ((#=:fun('num,fun('num,bool)) n:'num) n:'num)
      #|ISPECL = (#forall:fun(fun('num,bool),bool) (\x:'num. (#forall:fun(fun(bool,bool),bool) (\y:bool. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('num,fun('num,bool)) x:'num) x:'num)) ((#=:fun(bool,fun(bool,bool)) y:bool) y:bool)))))) |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('num,fun('num,bool)) n:'num) n:'num)) ((#=:fun(bool,fun(bool,bool)) #T:bool) #T:bool))
      #|GEN =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (P:fun('A,bool) x:'A))) ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (P:fun('A,bool) x:'A)))))
      #|GEN_bad ! ABS
      #|GENL =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#=:fun('A,fun('A,bool)) ((f:fun('A,fun('A,'A)) x:'A) y:'A)) ((f:fun('A,fun('A,'A)) x:'A) y:'A))))))
      #|GEN_ALL =  |- (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\P:fun('A,fun('B,bool)). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('B,bool),bool) (\y:'B. ((#==>:fun(bool,fun(bool,bool)) ((P:fun('A,fun('B,bool)) x:'A) y:'B)) ((P:fun('A,fun('B,bool)) x:'A) y:'B))))))))
      #|EXISTS =  |- (#?:fun(fun('num,bool),bool) (\x:'num. ((#=:fun('num,fun('num,bool)) x:'num) x:'num)))
      #|SIMPLE_EXISTS =  |- (#?:fun(fun('num,bool),bool) (\n:'num. ((#=:fun('num,fun('num,bool)) n:'num) n:'num)))
      #|CHOOSE = (#?:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A))) |- ((#=:fun(bool,fun(bool,bool)) #T:bool) #T:bool)
      #|SIMPLE_CHOOSE = (#?:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A))) |- ((#=:fun(bool,fun(bool,bool)) #T:bool) #T:bool)
      #|DISJ1 = a:bool |- ((#\/:fun(bool,fun(bool,bool)) a:bool) b:bool)
      #|DISJ2 = b:bool |- ((#\/:fun(bool,fun(bool,bool)) a:bool) b:bool)
      #|DISJ_CASES = ((#\/:fun(bool,fun(bool,bool)) a:bool) b:bool) |- ((#\/:fun(bool,fun(bool,bool)) b:bool) a:bool)
      #|DISJ_CASES_bad ! DISJ_CASES
      #|SIMPLE_DISJ_CASES = ((#\/:fun(bool,fun(bool,bool)) a:bool) b:bool) |- ((#=:fun(bool,fun(bool,bool)) #T:bool) #T:bool)
      #|NOT_ELIM = (#~:fun(bool,bool) a:bool) |- ((#==>:fun(bool,fun(bool,bool)) a:bool) #F:bool)
      #|NOT_INTRO = ((#==>:fun(bool,fun(bool,bool)) a:bool) #F:bool) |- (#~:fun(bool,bool) a:bool)
      #|EQF_INTRO = (#~:fun(bool,bool) a:bool) |- ((#=:fun(bool,fun(bool,bool)) a:bool) #F:bool)
      #|EQF_ELIM = ((#=:fun(bool,fun(bool,bool)) a:bool) #F:bool) |- (#~:fun(bool,bool) a:bool)
      #|CONTR = #F:bool |- a:bool
      #|CONTR_bad ! CONTR
      #|EXISTENCE = (#?!:fun(fun('num,bool),bool) (\x:'num. ((#=:fun('num,fun('num,bool)) x:'num) n:'num))) |- (#?:fun(fun('num,bool),bool) (\x:'num. ((#=:fun('num,fun('num,bool)) x:'num) n:'num)))
      #|PINST =  |- ((#=:fun(bool,fun(bool,bool)) (f:fun(bool,bool) #T:bool)) (f:fun(bool,bool) #T:bool))
      #|PROVE_HYP = a:bool, b:bool |- ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool)
      #|mk_iff = ((#=:fun(bool,fun(bool,bool)) a:bool) b:bool)
      #|dest_iff_bad ! dest_iff
      #|mk_neg = (#~:fun(bool,bool) a:bool)
      #|mk_neg_bad ! mk_neg
      #|Warning: inventing type variables
      #|verbose = (#forall:fun(fun('?1,bool),bool) (\x:'?1. (#?:fun(fun('?1,bool),bool) (\y:'?1. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('?1,fun('?1,bool)) x:'?1) y:'?1)) #T:bool)))))
      #|Warning: inventing type variables
      #|print = forall (x:?2).
      #|    exists (y:?2). (x:?2) = (y:?2) /\ (p <=> q) ==> ~r \/ false
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?3
      #|Warning: inventing type variables
      #|counter_pgenvar = (GSPEC:fun(fun('?4,bool),'?5) (\GEN%PVAR%1:'?4. (#?:fun(fun('?6,bool),bool) (\x:'?6. (((SETSPEC:fun('?4,fun(bool,fun('?6,bool))) GEN%PVAR%1:'?4) #T:bool) x:'?6)))))
      #|counter_genvar = _0:bool
      #|



    ),
  )
}
