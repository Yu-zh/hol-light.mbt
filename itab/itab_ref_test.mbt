// Behaviour test for itab.ml: replays tools/ocaml_ref/itab_ref.ml (keep in
// sync).

///|
using @testkit {stm, sthm, ocaml_escaped}

///|
fn sgs(gs : @tactics.Goalstack) -> String raise {
  let b = StringBuilder()
  let f = @pp.formatter_of_buffer(b)
  @tactics.pp_print_goalstack(f, gs)
  f.print_flush()
  ocaml_escaped(b.to_string())
}

///|
test "itab matches itab.ml" {
  let log = @testkit.Log::new()
  log.capture_reports()
  log.capture_stdout()
  let tm = @parser.parse_term
  let it = (name : String, s : String) => {
    log.attempt(name, () => {
      let t = tm(s)
      sthm(@itab.itaut(t))
    })
  }
  it("imp_refl", "p ==> p")
  it("conj_comm", "p /\\ q ==> q /\\ p")
  it("imp_trans", "(p ==> q) ==> (q ==> r) ==> p ==> r")
  it("triple_neg", "~ ~ ~p ==> ~p")
  it("disj_elim", "(p \\/ q) /\\ (p ==> r) /\\ (q ==> r) ==> r")
  it("forall_inst", "(forall x:A. P x) ==> P a")
  it("exists_weaken", "(?x:A. P x /\\ Q x) ==> ?x. P x")
  it("iff", "(p <=> q) ==> q ==> p")
  it("contrapos", "(p ==> q) ==> ~q ==> ~p")
  it("dist", "p /\\ (q \\/ r) ==> (p /\\ q) \\/ (p /\\ r)")
  let goal = (name : String, s : String) => {
    log.attempt(name, () => {
      let t = tm(s)
      sgs(@tactics.g(t))
    })
  }
  let step = (name : String, tac : @tactics.Tactic) => {
    log.attempt(name, () => sgs(@tactics.e(tac)))
  }
  let thm = (name : String) => log.attempt(name, () => sthm(@tactics.top_thm()))
  goal("g1", "?x:bool. (a /\\ b) = x")
  step("meta1", @tactics.meta_exists_tac)
  step("refl1", @itab.unify_refl_tac)
  thm("thm1")
  goal("g2", "?f:bool->bool. (a /\\ b) = f a")
  step("meta2", @tactics.meta_exists_tac)
  step("refl2", @itab.unify_refl_tac)
  thm("thm2")
  goal("g3", "?f:bool->bool. (a /\\ b) = f T")
  step("meta3", @tactics.meta_exists_tac)
  step("refl3", @itab.unify_refl_tac)
  thm("thm3")
  goal("g4", "?x:bool. (x /\\ b) = x")
  step("meta4", @tactics.meta_exists_tac)
  step("refl4_occurs", @itab.unify_refl_tac)
  goal("g5", "(a /\\ b) = (b /\\ a)")
  step("refl5_notvar", @itab.unify_refl_tac)
  goal("g6", "a /\\ b")
  step("refl6_noteq", @itab.unify_refl_tac)
  log.attempt("accept_bad", () => {
    let x = tm("x:bool")
    let th = @kernel.assume_rule(tm("c:bool"))
    sgs(@tactics.e(@itab.unify_accept_tac(@list.singleton(x), th)))
  })
  log.attempt("counter_tyvar", () => stm(tm("zz_counter")))
  log.attempt("counter_genvar", () => stm(@basics.genvar(@kernel.bool_ty)))
  inspect(
    log.contents(),
    content=(
      #|Searching with limit 0
      #|Searching with limit 1
      #|imp_refl =  |- ((#==>:fun(bool,fun(bool,bool)) p:bool) p:bool)
      #|Searching with limit 0
      #|Searching with limit 1
      #|conj_comm =  |- ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) q:bool)) ((#/\:fun(bool,fun(bool,bool)) q:bool) p:bool))
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|imp_trans =  |- ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) p:bool) q:bool)) ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) q:bool) r:bool)) ((#==>:fun(bool,fun(bool,bool)) p:bool) r:bool)))
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|triple_neg =  |- ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#~:fun(bool,bool) (#~:fun(bool,bool) p:bool)))) (#~:fun(bool,bool) p:bool))
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|disj_elim =  |- ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) p:bool) q:bool)) ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) p:bool) r:bool)) ((#==>:fun(bool,fun(bool,bool)) q:bool) r:bool)))) r:bool)
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|forall_inst =  |- ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))) (P:fun('A,bool) a:'A))
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|exists_weaken =  |- ((#==>:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (Q:fun('A,bool) x:'A))))) (#?:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A))))
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|iff =  |- ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) p:bool) q:bool)) ((#==>:fun(bool,fun(bool,bool)) q:bool) p:bool))
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|contrapos =  |- ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) p:bool) q:bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) q:bool)) (#~:fun(bool,bool) p:bool)))
      #|Searching with limit 0
      #|Searching with limit 1
      #|dist =  |- ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) ((#\/:fun(bool,fun(bool,bool)) q:bool) r:bool))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) q:bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) r:bool)))
      #|Warning: Free variables in goal: a, b
      #|g1 = 1 subgoal (1 total)\n\n`exists x. a /\\ b <=> x`\n
      #|meta1 = 1 subgoal (1 total)\n\n`a /\\ b <=> x`\n
      #|refl1 = No subgoals\n
      #|thm1 =  |- (#?:fun(fun(bool,bool),bool) (\x:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool)) x:bool)))
      #|Warning: Free variables in goal: a, b
      #|g2 = 1 subgoal (1 total)\n\n`exists f. a /\\ b <=> f a`\n
      #|meta2 = 1 subgoal (1 total)\n\n`a /\\ b <=> f a`\n
      #|refl2 = No subgoals\n
      #|thm2 =  |- (#?:fun(fun(fun(bool,bool),bool),bool) (\f:fun(bool,bool). ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool)) (f:fun(bool,bool) a:bool))))
      #|Warning: Free variables in goal: a, b
      #|g3 = 1 subgoal (1 total)\n\n`exists f. a /\\ b <=> f true`\n
      #|meta3 = 1 subgoal (1 total)\n\n`a /\\ b <=> f true`\n
      #|UNIFY_REFL_TAC: warning: this isn't var: true
      #|refl3 = No subgoals\n
      #|thm3 =  |- (#?:fun(fun(fun(bool,bool),bool),bool) (\f:fun(bool,bool). ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool)) (f:fun(bool,bool) #T:bool))))
      #|Warning: Free variables in goal: b
      #|g4 = 1 subgoal (1 total)\n\n`exists x. x /\\ b <=> x`\n
      #|meta4 = 1 subgoal (1 total)\n\n`x /\\ b <=> x`\n
      #|refl4_occurs ! UNIFY_REFL_TAC: failed: `x /\ b <=> x`
      #|Warning: Free variables in goal: a, b
      #|g5 = 1 subgoal (1 total)\n\n`a /\\ b <=> b /\\ a`\n
      #|refl5_notvar ! UNIFY_REFL_TAC: not variable
      #|Warning: Free variables in goal: a, b
      #|g6 = 1 subgoal (1 total)\n\n`a /\\ b`\n
      #|refl6_noteq ! dest_eq
      #|accept_bad ! dest_comb: not a combination
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?1
      #|counter_genvar = _8:bool
      #|
    ),
  )
}
