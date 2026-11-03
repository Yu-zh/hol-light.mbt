// Load-fidelity and behaviour test for ind_defs.ml: replays
// tools/ocaml_ref/ind_defs_ref.ml (keep in sync).

///|
using @testkit {stm, sthm}

///|
fn s3(t : (@kernel.Thm, @kernel.Thm, @kernel.Thm)) -> String {
  sthm(t.0) + " ;; " + sthm(t.1) + " ;; " + sthm(t.2)
}

///|
test "ind_defs matches ind_defs.ml" {
  let log = @testkit.Log::new()
  log.capture_reports()
  for th in ["simp", "theorems", "ind_defs"] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("ind_defs")
  let tm = @parser.parse_term
  let ndef = (name : String, s : String) => {
    log.attempt(name, () => {
      let t = tm(s)
      s3(@ind_defs.new_inductive_definition(t))
    })
  }
  log.attempt("strip_ncomb", () => {
    let t = tm("(f:A->A->A->A) a b c")
    let (h, args) = @ind_defs.strip_ncomb(2)(t)
    stm(h) + " [" + args.map(stm).to_array().join("; ") + "]"
  })
  log.attempt("strip_ncomb_bad", () => {
    let t = tm("(f:A->A) a")
    let (h, args) = @ind_defs.strip_ncomb(2)(t)
    stm(h) + " [" + args.map(stm).to_array().join("; ") + "]"
  })
  log.attempt("RIGHT_BETAS", () => {
    let x = tm("x:A")
    let y = tm("y:A")
    let f = tm("(\\a b. (P:A->A->bool) b a) = Q")
    sthm(@ind_defs.right_betas(@list.List([x, y]))(@kernel.assume_rule(f)))
  })
  log.attempt("EXISTS_EQUATION", () => {
    let e = tm("(x:A) = a")
    let th = @kernel.assume_rule(tm("(P:A->bool) a"))
    sthm(@ind_defs.exists_equation(e)(th))
  })
  ndef(
    "RTC", "(forall x:A. RTC R x x) /\\ (forall x y z. R x y /\\ RTC R y z ==> RTC R x z)",
  )
  ndef(
    "EVOD", "EV (a:A) /\\ (forall x. OD x ==> EV ((f:A->A) x)) /\\ (forall x. EV x ==> OD (f x))",
  )
  ndef(
    "EVB", "EVB T /\\ (forall x. ODB x ==> EVB (~x)) /\\ (forall x. EVB x ==> ODB (~x))",
  )
  log.attempt("strong_ok", () => {
    let t = tm("NB F /\\ (forall x. NB x ==> NB (~x))")
    let (rules, ind, _) = @ind_defs.new_inductive_definition(t)
    sthm(@ind_defs.derive_strong_induction((rules, ind)))
  })
  ndef("ACC", "forall x:A. (forall y. R y x ==> ACC R y) ==> ACC R x")
  ndef(
    "RTC_again", "(forall x:A. RTC R x x) /\\ (forall x y z. R x y /\\ RTC R y z ==> RTC R x z)",
  )
  log.attempt("exist", () => {
    let t = tm(
      "(forall x:A. TC R x x ==> TC R x x) /\\ (forall x y. R x y ==> TC R x y)",
    )
    sthm(@ind_defs.prove_inductive_relations_exist(t))
  })
  log.attempt("derive_nonschematic", () => {
    let t = tm("(forall x:A. Q x) /\\ (forall x. Q x ==> Q ((g:A->A) x))")
    sthm(@ind_defs.derive_nonschematic_inductive_relations(t))
  })
  ndef("bad_clause", "forall x:A. ~(BAD x) ==> BAD x")
  log.attempt("strong", () => {
    let t = tm("EV2 (a:A) /\\ (forall x. EV2 x ==> EV2 ((f:A->A) x))")
    let (rules, ind, _) = @ind_defs.new_inductive_definition(t)
    sthm(@ind_defs.derive_strong_induction((rules, ind)))
  })
  log.attempt("prove_monotonicity_hyps", () => {
    let th = @kernel.assume_rule(tm("(forall x:A. P x ==> Q x) ==> R"))
    sthm(@ind_defs.prove_monotonicity_hyps(th))
  })
  log.attempt("MONO_TAC", () => {
    let w = tm(
      "(forall x:A. P x ==> Q x) ==> (forall x. P x /\\ c) ==> (forall x. Q x /\\ c)",
    )
    let tac = @tactics.then_tac(@tactics.disch_tac, g => @ind_defs.mono_tac(g))
    let (_, gls, _) = tac((@list.List([]), w))
    gls.length().to_string()
  })
  log.attempt("the_inductive_definitions", () => {
    @ind_defs.the_inductive_definitions().val.map(s3).to_array().join(" | ")
  })
  log.attempt("monotonicity_theorems", () => {
    @ind_defs.monotonicity_theorems().val.length().to_string()
  })
  log.attempt("constants", () => {
    @kernel.constants().map(c => c.0).to_array().join(" ")
  })
  log.attempt("definitions", () => {
    @kernel.definitions().map(sthm).to_array().join(" ;; ")
  })
  log.attempt("axioms", () => @kernel.axioms().length().to_string())
  log.attempt("counter_tyvar", () => stm(tm("zz_counter")))
  log.attempt("counter_genvar", () => stm(@basics.genvar(@kernel.bool_ty)))
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
      #|ind_defs quotations (5):
      #|  (t : A)
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 t : A, (\226\136\128 x : A, x == t \226\134\146 P(x)) \226\134\146 op_q(P)
      #|  true
      #|  op_eq_eq_gt
      #|  \226\136\128 p : Bool, p \226\134\146 p
      #|strip_ncomb = (f:fun('A,fun('A,fun('A,'A))) a:'A) [b:'A; c:'A]
      #|strip_ncomb_bad ! dest_comb: not a combination
      #|RIGHT_BETAS ! BETA_CONV: Not a beta-redex
      #|EXISTS_EQUATION = (P:fun('A,bool) a:'A) |- (#?:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) a:'A)))
      #|RTC =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (((#RTC:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))) x:'A) x:'A)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) x:'A) y:'A)) (((#RTC:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))) y:'A) z:'A))) (((#RTC:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))) x:'A) z:'A))))))))))) ;;  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\RTC':fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((RTC':fun('A,fun('A,bool)) x:'A) x:'A)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) x:'A) y:'A)) ((RTC':fun('A,fun('A,bool)) y:'A) z:'A))) ((RTC':fun('A,fun('A,bool)) x:'A) z:'A)))))))))) (#forall:fun(fun('A,bool),bool) (\a0:'A. (#forall:fun(fun('A,bool),bool) (\a1:'A. ((#==>:fun(bool,fun(bool,bool)) (((#RTC:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))) a0:'A) a1:'A)) ((RTC':fun('A,fun('A,bool)) a0:'A) a1:'A))))))))))) ;;  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). (#forall:fun(fun('A,bool),bool) (\a0:'A. (#forall:fun(fun('A,bool),bool) (\a1:'A. ((#=:fun(bool,fun(bool,bool)) (((#RTC:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))) a0:'A) a1:'A)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) a1:'A) a0:'A)) (#?:fun(fun('A,bool),bool) (\y:'A. ((#/\:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) a0:'A) y:'A)) (((#RTC:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))) y:'A) a1:'A))))))))))))
      #|EVOD ! Schematic variables not used consistently
      #|EVB =  |- ((#/\:fun(bool,fun(bool,bool)) (#EVB:fun(bool,bool) #T:bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(bool,bool),bool) (\x:bool. ((#==>:fun(bool,fun(bool,bool)) (#ODB:fun(bool,bool) x:bool)) (#EVB:fun(bool,bool) (#~:fun(bool,bool) x:bool)))))) (#forall:fun(fun(bool,bool),bool) (\x:bool. ((#==>:fun(bool,fun(bool,bool)) (#EVB:fun(bool,bool) x:bool)) (#ODB:fun(bool,bool) (#~:fun(bool,bool) x:bool))))))) ;;  |- (#forall:fun(fun(fun(bool,bool),bool),bool) (\EVB':fun(bool,bool). (#forall:fun(fun(fun(bool,bool),bool),bool) (\ODB':fun(bool,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (EVB':fun(bool,bool) #T:bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(bool,bool),bool) (\x:bool. ((#==>:fun(bool,fun(bool,bool)) (ODB':fun(bool,bool) x:bool)) (EVB':fun(bool,bool) (#~:fun(bool,bool) x:bool)))))) (#forall:fun(fun(bool,bool),bool) (\x:bool. ((#==>:fun(bool,fun(bool,bool)) (EVB':fun(bool,bool) x:bool)) (ODB':fun(bool,bool) (#~:fun(bool,bool) x:bool)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(bool,bool),bool) (\a0:bool. ((#==>:fun(bool,fun(bool,bool)) (#EVB:fun(bool,bool) a0:bool)) (EVB':fun(bool,bool) a0:bool))))) (#forall:fun(fun(bool,bool),bool) (\a1:bool. ((#==>:fun(bool,fun(bool,bool)) (#ODB:fun(bool,bool) a1:bool)) (ODB':fun(bool,bool) a1:bool)))))))))) ;;  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(bool,bool),bool) (\a0:bool. ((#=:fun(bool,fun(bool,bool)) (#EVB:fun(bool,bool) a0:bool)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) a0:bool) #T:bool)) (#?:fun(fun(bool,bool),bool) (\x:bool. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) a0:bool) (#~:fun(bool,bool) x:bool))) (#ODB:fun(bool,bool) x:bool))))))))) (#forall:fun(fun(bool,bool),bool) (\a1:bool. ((#=:fun(bool,fun(bool,bool)) (#ODB:fun(bool,bool) a1:bool)) (#?:fun(fun(bool,bool),bool) (\x:bool. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) a1:bool) (#~:fun(bool,bool) x:bool))) (#EVB:fun(bool,bool) x:bool))))))))
      #|strong_ok =  |- (#forall:fun(fun(fun(bool,bool),bool),bool) (\NB':fun(bool,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (NB':fun(bool,bool) #F:bool)) (#forall:fun(fun(bool,bool),bool) (\x:bool. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#NB:fun(bool,bool) x:bool)) (NB':fun(bool,bool) x:bool))) (NB':fun(bool,bool) (#~:fun(bool,bool) x:bool))))))) (#forall:fun(fun(bool,bool),bool) (\a:bool. ((#==>:fun(bool,fun(bool,bool)) (#NB:fun(bool,bool) a:bool)) (NB':fun(bool,bool) a:bool)))))))
      #|ACC =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) y:'A) x:'A)) ((#ACC:fun(fun('A,fun('A,bool)),fun('A,bool)) R:fun('A,fun('A,bool))) y:'A))))) ((#ACC:fun(fun('A,fun('A,bool)),fun('A,bool)) R:fun('A,fun('A,bool))) x:'A)))))) ;;  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\ACC':fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) y:'A) x:'A)) (ACC':fun('A,bool) y:'A))))) (ACC':fun('A,bool) x:'A))))) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) ((#ACC:fun(fun('A,fun('A,bool)),fun('A,bool)) R:fun('A,fun('A,bool))) a:'A)) (ACC':fun('A,bool) a:'A))))))))) ;;  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). (#forall:fun(fun('A,bool),bool) (\a:'A. ((#=:fun(bool,fun(bool,bool)) ((#ACC:fun(fun('A,fun('A,bool)),fun('A,bool)) R:fun('A,fun('A,bool))) a:'A)) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) y:'A) a:'A)) ((#ACC:fun(fun('A,fun('A,bool)),fun('A,bool)) R:fun('A,fun('A,bool))) y:'A)))))))))
      #|Warning: Benign redefinition of inductive predicate
      #|RTC_again =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (((#RTC:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))) x:'A) x:'A)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) x:'A) y:'A)) (((#RTC:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))) y:'A) z:'A))) (((#RTC:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))) x:'A) z:'A))))))))))) ;;  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\RTC':fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((RTC':fun('A,fun('A,bool)) x:'A) x:'A)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) x:'A) y:'A)) ((RTC':fun('A,fun('A,bool)) y:'A) z:'A))) ((RTC':fun('A,fun('A,bool)) x:'A) z:'A)))))))))) (#forall:fun(fun('A,bool),bool) (\a0:'A. (#forall:fun(fun('A,bool),bool) (\a1:'A. ((#==>:fun(bool,fun(bool,bool)) (((#RTC:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))) a0:'A) a1:'A)) ((RTC':fun('A,fun('A,bool)) a0:'A) a1:'A))))))))))) ;;  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). (#forall:fun(fun('A,bool),bool) (\a0:'A. (#forall:fun(fun('A,bool),bool) (\a1:'A. ((#=:fun(bool,fun(bool,bool)) (((#RTC:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))) a0:'A) a1:'A)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) a1:'A) a0:'A)) (#?:fun(fun('A,bool),bool) (\y:'A. ((#/\:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) a0:'A) y:'A)) (((#RTC:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))) y:'A) a1:'A))))))))))))
      #|exist =  |- (#?:fun(fun(fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))),bool),bool) (\TC:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))). (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (((TC:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))) x:'A) x:'A)) (((TC:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))) x:'A) x:'A))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) x:'A) y:'A)) (((TC:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))) x:'A) y:'A)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\TC':fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((TC':fun('A,fun('A,bool)) x:'A) x:'A)) ((TC':fun('A,fun('A,bool)) x:'A) x:'A))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) x:'A) y:'A)) ((TC':fun('A,fun('A,bool)) x:'A) y:'A)))))))) (#forall:fun(fun('A,bool),bool) (\a0:'A. (#forall:fun(fun('A,bool),bool) (\a1:'A. ((#==>:fun(bool,fun(bool,bool)) (((TC:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))) a0:'A) a1:'A)) ((TC':fun('A,fun('A,bool)) a0:'A) a1:'A)))))))))) (#forall:fun(fun('A,bool),bool) (\a0:'A. (#forall:fun(fun('A,bool),bool) (\a1:'A. ((#=:fun(bool,fun(bool,bool)) (((TC:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))) a0:'A) a1:'A)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) a1:'A) a0:'A)) (((TC:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))) a0:'A) a0:'A))) ((R:fun('A,fun('A,bool)) a0:'A) a1:'A)))))))))))))
      #|derive_nonschematic ! ASSUME: not a proposition
      #|bad_clause = (#forall:fun(fun(fun('A,bool),bool),bool) (\BAD:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\BAD':fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) (BAD:fun('A,bool) a:'A)) (BAD':fun('A,bool) a:'A))))) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (BAD:fun('A,bool) a:'A))) (#~:fun(bool,bool) (BAD':fun('A,bool) a:'A)))))))))) |- (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#BAD:fun('A,bool) x:'A))) (#BAD:fun('A,bool) x:'A)))) ;; (#forall:fun(fun(fun('A,bool),bool),bool) (\BAD:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\BAD':fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) (BAD:fun('A,bool) a:'A)) (BAD':fun('A,bool) a:'A))))) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (BAD:fun('A,bool) a:'A))) (#~:fun(bool,bool) (BAD':fun('A,bool) a:'A)))))))))) |- (#forall:fun(fun(fun('A,bool),bool),bool) (\BAD':fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (BAD':fun('A,bool) x:'A))) (BAD':fun('A,bool) x:'A))))) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) (#BAD:fun('A,bool) a:'A)) (BAD':fun('A,bool) a:'A))))))) ;; (#forall:fun(fun(fun('A,bool),bool),bool) (\BAD:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\BAD':fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) (BAD:fun('A,bool) a:'A)) (BAD':fun('A,bool) a:'A))))) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (BAD:fun('A,bool) a:'A))) (#~:fun(bool,bool) (BAD':fun('A,bool) a:'A)))))))))) |- (#forall:fun(fun('A,bool),bool) (\a:'A. ((#=:fun(bool,fun(bool,bool)) (#BAD:fun('A,bool) a:'A)) (#~:fun(bool,bool) (#BAD:fun('A,bool) a:'A)))))
      #|strong ! Schematic variables not used consistently
      #|prove_monotonicity_hyps = ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (Q:fun('A,bool) x:'A))))) R:bool) |- ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (Q:fun('A,bool) x:'A))))) R:bool)
      #|MONO_TAC = 0
      #|the_inductive_definitions = (#forall:fun(fun(fun('A,bool),bool),bool) (\BAD:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\BAD':fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) (BAD:fun('A,bool) a:'A)) (BAD':fun('A,bool) a:'A))))) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (BAD:fun('A,bool) a:'A))) (#~:fun(bool,bool) (BAD':fun('A,bool) a:'A)))))))))) |- (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#BAD:fun('A,bool) x:'A))) (#BAD:fun('A,bool) x:'A)))) ;; (#forall:fun(fun(fun('A,bool),bool),bool) (\BAD:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\BAD':fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) (BAD:fun('A,bool) a:'A)) (BAD':fun('A,bool) a:'A))))) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (BAD:fun('A,bool) a:'A))) (#~:fun(bool,bool) (BAD':fun('A,bool) a:'A)))))))))) |- (#forall:fun(fun(fun('A,bool),bool),bool) (\BAD':fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (BAD':fun('A,bool) x:'A))) (BAD':fun('A,bool) x:'A))))) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) (#BAD:fun('A,bool) a:'A)) (BAD':fun('A,bool) a:'A))))))) ;; (#forall:fun(fun(fun('A,bool),bool),bool) (\BAD:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\BAD':fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) (BAD:fun('A,bool) a:'A)) (BAD':fun('A,bool) a:'A))))) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (BAD:fun('A,bool) a:'A))) (#~:fun(bool,bool) (BAD':fun('A,bool) a:'A)))))))))) |- (#forall:fun(fun('A,bool),bool) (\a:'A. ((#=:fun(bool,fun(bool,bool)) (#BAD:fun('A,bool) a:'A)) (#~:fun(bool,bool) (#BAD:fun('A,bool) a:'A))))) |  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) y:'A) x:'A)) ((#ACC:fun(fun('A,fun('A,bool)),fun('A,bool)) R:fun('A,fun('A,bool))) y:'A))))) ((#ACC:fun(fun('A,fun('A,bool)),fun('A,bool)) R:fun('A,fun('A,bool))) x:'A)))))) ;;  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,bool),bool),bool) (\ACC':fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) y:'A) x:'A)) (ACC':fun('A,bool) y:'A))))) (ACC':fun('A,bool) x:'A))))) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) ((#ACC:fun(fun('A,fun('A,bool)),fun('A,bool)) R:fun('A,fun('A,bool))) a:'A)) (ACC':fun('A,bool) a:'A))))))))) ;;  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). (#forall:fun(fun('A,bool),bool) (\a:'A. ((#=:fun(bool,fun(bool,bool)) ((#ACC:fun(fun('A,fun('A,bool)),fun('A,bool)) R:fun('A,fun('A,bool))) a:'A)) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) y:'A) a:'A)) ((#ACC:fun(fun('A,fun('A,bool)),fun('A,bool)) R:fun('A,fun('A,bool))) y:'A))))))))) |  |- ((#/\:fun(bool,fun(bool,bool)) (#NB:fun(bool,bool) #F:bool)) (#forall:fun(fun(bool,bool),bool) (\x:bool. ((#==>:fun(bool,fun(bool,bool)) (#NB:fun(bool,bool) x:bool)) (#NB:fun(bool,bool) (#~:fun(bool,bool) x:bool)))))) ;;  |- (#forall:fun(fun(fun(bool,bool),bool),bool) (\NB':fun(bool,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (NB':fun(bool,bool) #F:bool)) (#forall:fun(fun(bool,bool),bool) (\x:bool. ((#==>:fun(bool,fun(bool,bool)) (NB':fun(bool,bool) x:bool)) (NB':fun(bool,bool) (#~:fun(bool,bool) x:bool))))))) (#forall:fun(fun(bool,bool),bool) (\a:bool. ((#==>:fun(bool,fun(bool,bool)) (#NB:fun(bool,bool) a:bool)) (NB':fun(bool,bool) a:bool))))))) ;;  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. ((#=:fun(bool,fun(bool,bool)) (#NB:fun(bool,bool) a:bool)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) a:bool) #F:bool)) (#?:fun(fun(bool,bool),bool) (\x:bool. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) a:bool) (#~:fun(bool,bool) x:bool))) (#NB:fun(bool,bool) x:bool)))))))) |  |- ((#/\:fun(bool,fun(bool,bool)) (#EVB:fun(bool,bool) #T:bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(bool,bool),bool) (\x:bool. ((#==>:fun(bool,fun(bool,bool)) (#ODB:fun(bool,bool) x:bool)) (#EVB:fun(bool,bool) (#~:fun(bool,bool) x:bool)))))) (#forall:fun(fun(bool,bool),bool) (\x:bool. ((#==>:fun(bool,fun(bool,bool)) (#EVB:fun(bool,bool) x:bool)) (#ODB:fun(bool,bool) (#~:fun(bool,bool) x:bool))))))) ;;  |- (#forall:fun(fun(fun(bool,bool),bool),bool) (\EVB':fun(bool,bool). (#forall:fun(fun(fun(bool,bool),bool),bool) (\ODB':fun(bool,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (EVB':fun(bool,bool) #T:bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(bool,bool),bool) (\x:bool. ((#==>:fun(bool,fun(bool,bool)) (ODB':fun(bool,bool) x:bool)) (EVB':fun(bool,bool) (#~:fun(bool,bool) x:bool)))))) (#forall:fun(fun(bool,bool),bool) (\x:bool. ((#==>:fun(bool,fun(bool,bool)) (EVB':fun(bool,bool) x:bool)) (ODB':fun(bool,bool) (#~:fun(bool,bool) x:bool)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(bool,bool),bool) (\a0:bool. ((#==>:fun(bool,fun(bool,bool)) (#EVB:fun(bool,bool) a0:bool)) (EVB':fun(bool,bool) a0:bool))))) (#forall:fun(fun(bool,bool),bool) (\a1:bool. ((#==>:fun(bool,fun(bool,bool)) (#ODB:fun(bool,bool) a1:bool)) (ODB':fun(bool,bool) a1:bool)))))))))) ;;  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(bool,bool),bool) (\a0:bool. ((#=:fun(bool,fun(bool,bool)) (#EVB:fun(bool,bool) a0:bool)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) a0:bool) #T:bool)) (#?:fun(fun(bool,bool),bool) (\x:bool. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) a0:bool) (#~:fun(bool,bool) x:bool))) (#ODB:fun(bool,bool) x:bool))))))))) (#forall:fun(fun(bool,bool),bool) (\a1:bool. ((#=:fun(bool,fun(bool,bool)) (#ODB:fun(bool,bool) a1:bool)) (#?:fun(fun(bool,bool),bool) (\x:bool. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) a1:bool) (#~:fun(bool,bool) x:bool))) (#EVB:fun(bool,bool) x:bool)))))))) |  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (((#RTC:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))) x:'A) x:'A)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) x:'A) y:'A)) (((#RTC:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))) y:'A) z:'A))) (((#RTC:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))) x:'A) z:'A))))))))))) ;;  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\RTC':fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((RTC':fun('A,fun('A,bool)) x:'A) x:'A)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) x:'A) y:'A)) ((RTC':fun('A,fun('A,bool)) y:'A) z:'A))) ((RTC':fun('A,fun('A,bool)) x:'A) z:'A)))))))))) (#forall:fun(fun('A,bool),bool) (\a0:'A. (#forall:fun(fun('A,bool),bool) (\a1:'A. ((#==>:fun(bool,fun(bool,bool)) (((#RTC:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))) a0:'A) a1:'A)) ((RTC':fun('A,fun('A,bool)) a0:'A) a1:'A))))))))))) ;;  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). (#forall:fun(fun('A,bool),bool) (\a0:'A. (#forall:fun(fun('A,bool),bool) (\a1:'A. ((#=:fun(bool,fun(bool,bool)) (((#RTC:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))) a0:'A) a1:'A)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) a1:'A) a0:'A)) (#?:fun(fun('A,bool),bool) (\y:'A. ((#/\:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) a0:'A) y:'A)) (((#RTC:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))) R:fun('A,fun('A,bool))) y:'A) a1:'A))))))))))))
      #|monotonicity_theorems = 6
      #|constants = BAD ACC NB ODB EVB RTC _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions =  |- ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) #BAD:fun('A,bool)) (\a:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\BAD':fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (BAD':fun('A,bool) a:'A))) (BAD':fun('A,bool) a:'A))))) (BAD':fun('A,bool) a:'A)))))) ;;  |- ((#=:fun(fun(fun('A,fun('A,bool)),fun('A,bool)),fun(fun(fun('A,fun('A,bool)),fun('A,bool)),bool)) #ACC:fun(fun('A,fun('A,bool)),fun('A,bool))) (\R:fun('A,fun('A,bool)). (\a:'A. (#forall:fun(fun(fun('A,bool),bool),bool) (\ACC':fun('A,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\a:'A. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) y:'A) a:'A)) (ACC':fun('A,bool) y:'A))))) (ACC':fun('A,bool) a:'A))))) (ACC':fun('A,bool) a:'A))))))) ;;  |- ((#=:fun(fun(bool,bool),fun(fun(bool,bool),bool)) #NB:fun(bool,bool)) (\a:bool. (#forall:fun(fun(fun(bool,bool),bool),bool) (\NB':fun(bool,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(bool,bool),bool) (\a:bool. ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) a:bool) #F:bool)) (#?:fun(fun(bool,bool),bool) (\x:bool. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) a:bool) (#~:fun(bool,bool) x:bool))) (NB':fun(bool,bool) x:bool)))))) (NB':fun(bool,bool) a:bool))))) (NB':fun(bool,bool) a:bool)))))) ;;  |- ((#=:fun(fun(bool,bool),fun(fun(bool,bool),bool)) #ODB:fun(bool,bool)) (\a1:bool. (#forall:fun(fun(fun(bool,bool),bool),bool) (\EVB':fun(bool,bool). (#forall:fun(fun(fun(bool,bool),bool),bool) (\ODB':fun(bool,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(bool,bool),bool) (\a0:bool. ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) a0:bool) #T:bool)) (#?:fun(fun(bool,bool),bool) (\x:bool. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) a0:bool) (#~:fun(bool,bool) x:bool))) (ODB':fun(bool,bool) x:bool)))))) (EVB':fun(bool,bool) a0:bool))))) (#forall:fun(fun(bool,bool),bool) (\a1:bool. ((#==>:fun(bool,fun(bool,bool)) (#?:fun(fun(bool,bool),bool) (\x:bool. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) a1:bool) (#~:fun(bool,bool) x:bool))) (EVB':fun(bool,bool) x:bool))))) (ODB':fun(bool,bool) a1:bool)))))) (ODB':fun(bool,bool) a1:bool)))))))) ;;  |- ((#=:fun(fun(bool,bool),fun(fun(bool,bool),bool)) #EVB:fun(bool,bool)) (\a0:bool. (#forall:fun(fun(fun(bool,bool),bool),bool) (\EVB':fun(bool,bool). (#forall:fun(fun(fun(bool,bool),bool),bool) (\ODB':fun(bool,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(bool,bool),bool) (\a0:bool. ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) a0:bool) #T:bool)) (#?:fun(fun(bool,bool),bool) (\x:bool. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) a0:bool) (#~:fun(bool,bool) x:bool))) (ODB':fun(bool,bool) x:bool)))))) (EVB':fun(bool,bool) a0:bool))))) (#forall:fun(fun(bool,bool),bool) (\a1:bool. ((#==>:fun(bool,fun(bool,bool)) (#?:fun(fun(bool,bool),bool) (\x:bool. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) a1:bool) (#~:fun(bool,bool) x:bool))) (EVB':fun(bool,bool) x:bool))))) (ODB':fun(bool,bool) a1:bool)))))) (EVB':fun(bool,bool) a0:bool)))))))) ;;  |- ((#=:fun(fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))),fun(fun(fun('A,fun('A,bool)),fun('A,fun('A,bool))),bool)) #RTC:fun(fun('A,fun('A,bool)),fun('A,fun('A,bool)))) (\R:fun('A,fun('A,bool)). (\a0:'A. (\a1:'A. (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\RTC':fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\a0:'A. (#forall:fun(fun('A,bool),bool) (\a1:'A. ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) a1:'A) a0:'A)) (#?:fun(fun('A,bool),bool) (\y:'A. ((#/\:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) a0:'A) y:'A)) ((RTC':fun('A,fun('A,bool)) y:'A) a1:'A)))))) ((RTC':fun('A,fun('A,bool)) a0:'A) a1:'A))))))) ((RTC':fun('A,fun('A,bool)) a0:'A) a1:'A)))))))) ;;  |- ((#=:fun(bool,fun(bool,bool)) #_FALSITY_:bool) #F:bool) ;;  |- ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) #?!:fun(fun('A,bool),bool)) (\P:fun('A,bool). ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) P:fun('A,bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (P:fun('A,bool) y:'A))) ((#=:fun('A,fun('A,bool)) x:'A) y:'A))))))))) ;;  |- ((#=:fun(fun(bool,bool),fun(fun(bool,bool),bool)) #~:fun(bool,bool)) (\p:bool. ((#==>:fun(bool,fun(bool,bool)) p:bool) #F:bool))) ;;  |- ((#=:fun(bool,fun(bool,bool)) #F:bool) (#forall:fun(fun(bool,bool),bool) (\p:bool. p:bool))) ;;  |- ((#=:fun(fun(bool,fun(bool,bool)),fun(fun(bool,fun(bool,bool)),bool)) #\/:fun(bool,fun(bool,bool))) (\p:bool. (\q:bool. (#forall:fun(fun(bool,bool),bool) (\r:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) p:bool) r:bool)) ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) q:bool) r:bool)) r:bool))))))) ;;  |- ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) #?:fun(fun('A,bool),bool)) (\P:fun('A,bool). (#forall:fun(fun(bool,bool),bool) (\q:bool. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) q:bool)))) q:bool))))) ;;  |- ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) #forall:fun(fun('A,bool),bool)) (\P:fun('A,bool). ((#=:fun(fun('A,bool),fun(fun('A,bool),bool)) P:fun('A,bool)) (\x:'A. #T:bool)))) ;;  |- ((#=:fun(fun(bool,fun(bool,bool)),fun(fun(bool,fun(bool,bool)),bool)) #==>:fun(bool,fun(bool,bool))) (\p:bool. (\q:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) q:bool)) p:bool)))) ;;  |- ((#=:fun(fun(bool,fun(bool,bool)),fun(fun(bool,fun(bool,bool)),bool)) #/\:fun(bool,fun(bool,bool))) (\p:bool. (\q:bool. ((#=:fun(fun(fun(bool,fun(bool,bool)),bool),fun(fun(fun(bool,fun(bool,bool)),bool),bool)) (\f:fun(bool,fun(bool,bool)). ((f:fun(bool,fun(bool,bool)) p:bool) q:bool))) (\f:fun(bool,fun(bool,bool)). ((f:fun(bool,fun(bool,bool)) #T:bool) #T:bool)))))) ;;  |- ((#=:fun(bool,fun(bool,bool)) #T:bool) ((#=:fun(fun(bool,bool),fun(fun(bool,bool),bool)) (\p:bool. p:bool)) (\p:bool. p:bool)))
      #|axioms = 0
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?1
      #|counter_genvar = _424:bool
      #|
    ),
  )
}
