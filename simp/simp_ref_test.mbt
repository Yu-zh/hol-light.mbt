// Load-fidelity and behaviour test for simp.ml: replays
// tools/ocaml_ref/simp_ref.ml (keep in sync).

///|
using @testkit {stm, sthm}

///|
using @kernel {type Thm}

///|
using @list {type List}

///|
fn sb(b : Bool) -> String {
  if b {
    "true"
  } else {
    "false"
  }
}

///|
fn slist(l : List[Thm]) -> String {
  "[" + l.map(sthm).to_array().join("; ") + "]"
}

///|
fn ths(a : Array[Thm]) -> List[Thm] {
  @list.List(a)
}

///|
test "simp matches simp.ml" {
  let log = @testkit.Log::new()
  log.capture_reports()
  log.show_theory_output("simp")
  log.show_theory_trace("simp")
  let tm = @parser.parse_term
  let hyp = (s : String) => @kernel.assume_rule(tm(s))
  let cv = (name : String, f : () -> Thm raise) => {
    log.attempt(name, () => sthm(f()))
  }
  log.attempt("term_order", () => {
    let a = tm("a:bool")
    let b = tm("b:bool")
    let t = tm("T")
    let fab = tm("(f:bool->bool->bool) a b")
    let fba = tm("(f:bool->bool->bool) b a")
    [
      @simp.term_order(a, b),
      @simp.term_order(b, a),
      @simp.term_order(t, a),
      @simp.term_order(a, t),
      @simp.term_order(fab, fba),
      @simp.term_order(fba, fab),
    ]
    .map(sb)
    .join(" ")
  })
  let big = "forall x:A. (P x /\\ (Q x = R x)) /\\ ~(a = b) /\\ ~c /\\ (p ==> (u:A) = v)"
  log.attempt("mk_rewrites_false", () => {
    let th = hyp(big)
    slist(@simp.mk_rewrites(false, th, @list.List([])))
  })
  log.attempt("mk_rewrites_true", () => {
    let th = hyp(big)
    slist(@simp.mk_rewrites(true, th, @list.List([])))
  })
  log.attempt("mk_rewrites_exists", () => {
    let th = hyp("forall x y:A. P x y ==> Q x y ==> (f:A->A) x = g x")
    slist(@simp.mk_rewrites(true, th, @list.List([])))
  })
  cv("REWRITE_CONV", () => {
    let th = hyp("forall x:A. (f:A->A) x = g x")
    let t = tm("(h:A->A) (f a) = f (f b)")
    @simp.rewrite_conv(ths([th]))(t)
  })
  cv("REWRITE_CONV_fail", () => {
    let th = hyp("forall x:A. (f:A->A) x = g x")
    let t = tm("(h:A->A) a")
    @simp.rewrite_conv(ths([th]))(t)
  })
  cv("REWRITE_CONV_loop", () => {
    let th = hyp("(a:bool) = (a /\\ b)")
    let t = tm("a \\/ a")
    @simp.rewrite_conv(ths([th]))(t)
  })
  cv("REWRITE_CONV_perm", () => {
    let th = hyp("forall x y. (f:A->A->A) x y = f y x")
    let t = tm("(f:A->A->A) b a = f a b")
    @simp.rewrite_conv(ths([th]))(t)
  })
  cv("REWRITE_CONV_eta", () => {
    let th = hyp("(\\x:A. (f:A->B) x) = f")
    let t = tm("\\y:A. (g:A->B) y")
    @simp.rewrite_conv(ths([th]))(t)
  })
  cv("REWRITE_CONV_lconst", () => {
    let th = hyp("(x:bool) = T")
    let t = tm("x /\\ y /\\ (\\x. x) z")
    @simp.rewrite_conv(ths([th]))(t)
  })
  cv("PURE_REWRITE_CONV", () => {
    let th = hyp("(a:bool) = b")
    let t = tm("a /\\ a")
    @simp.pure_rewrite_conv(ths([th]))(t)
  })
  cv("ONCE_REWRITE_CONV", () => {
    let th = hyp("forall x:A. (f:A->A) x = f (f x)")
    let t = tm("(f:A->A) a")
    @simp.once_rewrite_conv(ths([th]))(t)
  })
  cv("PURE_ONCE_REWRITE_CONV", () => {
    let th = hyp("(a:bool) = (a /\\ a)")
    let t = tm("a \\/ a")
    @simp.pure_once_rewrite_conv(ths([th]))(t)
  })
  cv("GEN_REWRITE_CONV", () => {
    let th = hyp("(a:bool) = b")
    let t = tm("a /\\ a")
    @simp.gen_rewrite_conv(@equal.rand_conv, ths([th]))(t)
  })
  cv("REWRITE_RULE", () => {
    let th = hyp("(a:bool) = b")
    let th2 = hyp("a /\\ c")
    @simp.rewrite_rule(ths([th]))(th2)
  })
  cv("ASM_REWRITE_RULE", () => {
    let _th = hyp("(a:bool) = b")
    // `DISCH (tm "c:bool") (ASSUME (tm "(a:bool) = b"))`: right to left.
    let h = hyp("(a:bool) = b")
    let th2 = @bool.disch(tm("c:bool"), h)
    @simp.asm_rewrite_rule(@list.List([]), @bool.undisch(th2))
  })
  cv("ONCE_ASM_REWRITE_RULE", () => {
    let th = hyp("(a:bool) = b")
    @simp.once_asm_rewrite_rule(@list.List([]), @bool.conj(th, th))
  })
  let accept : @tactics.Tactic = g => {
    @tactics.first_assum(th => @tactics.accept_tac(th))(g)
  }
  cv("REWRITE_TAC", () => {
    let w = tm("(a:bool) = b ==> a ==> b")
    @tactics.prove(
      w,
      @tactics.disch_then(th => {
        @tactics.then_tac(
          @tactics.then_tac(@simp.rewrite_tac(ths([th])), @tactics.disch_tac),
          accept,
        )
      }),
    )
  })
  cv("ASM_REWRITE_TAC", () => {
    let w = tm("(a:bool) = b ==> b ==> a")
    @tactics.prove(
      w,
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.disch_tac,
            @simp.asm_rewrite_tac(@list.List([])),
          ),
          @tactics.disch_tac,
        ),
        accept,
      ),
    )
  })
  cv("REWRITES_CONV_fail", () => {
    let t = tm("a:bool")
    @simp.rewrites_conv(@nets.empty_net())(t)
  })
  cv("SIMP_CONV_cond", () => {
    let th1 = hyp("forall x:A. P x ==> (f:A->A) x = g x")
    let th2 = hyp("(P:A->bool) a")
    let t = tm("(h:A->A) ((f:A->A) a) = f b")
    @simp.simp_conv(ths([th1, th2]))(t)
  })
  cv("SIMP_CONV_ctx_abs", () => {
    let th = hyp("(x:bool) = T")
    let t = tm("\\x. x /\\ y")
    @simp.simp_conv(ths([th]))(t)
  })
  cv("PURE_SIMP_CONV", () => {
    let th = hyp("(a:bool) = b")
    let t = tm("a /\\ c")
    @simp.pure_simp_conv(ths([th]))(t)
  })
  cv("ONCE_SIMP_CONV", () => {
    let th = hyp("forall x:A. (f:A->A) x = f (f x)")
    let t = tm("(f:A->A) a")
    @simp.once_simp_conv(ths([th]))(t)
  })
  cv("SIMP_RULE", () => {
    let th = hyp("(a:bool) = b")
    let th2 = hyp("a /\\ c")
    @simp.simp_rule(ths([th]))(th2)
  })
  let imp_cong = @itab.itaut(
    tm("(p <=> p') ==> (p' ==> (q <=> q')) ==> (p ==> q <=> p' ==> q')"),
  ) catch {
    e => fail("imp_cong: \{e}")
  }
  cv("net_of_cong_bad", () => {
    let th = hyp("a:bool")
    let n = @simp.net_of_cong(th, @nets.empty_net())
    @simp.rewrites_conv(n)(tm("a:bool"))
  })
  cv("SIMP_cong", () => {
    let ss = @simp.ss_of_congs(ths([imp_cong]), @simp.empty_ss)
    let t = tm("(x:A) = a ==> (f:A->A) x = f a")
    @simp.simplify_conv(ss, @list.List([]))(t)
  })
  cv("SIMP_cong_deep", () => {
    let ss = @simp.ss_of_congs(ths([imp_cong]), @simp.empty_ss)
    let th = hyp("forall x:A. P x ==> (f:A->A) x = g x")
    let t = tm("(P:A->bool) a ==> (f:A->A) a = b")
    @simp.simplify_conv(ss, ths([th]))(t)
  })
  let pr = @simp.mk_prover(
    (state : List[Thm]) => {
      let c : @equal.Conv = tm => {
        @lib.tryfind(
          th => {
            if @basics.aconv(@kernel.concl(th), tm) {
              th
            } else {
              raise Failure("")
            }
          },
          state,
        )
      }
      c
    },
    (state, new_ths) => new_ths.concat(state),
  )(@list.List([])) catch {
    e => fail("mk_prover: \{e}")
  }
  cv("prover", () => {
    let qa = hyp("(Q:A->bool) a")
    let ss = @simp.ss_of_provers(
      ths([]).map(_ => pr).concat(@list.singleton(@simp.augment(pr, ths([qa])))),
      @simp.empty_ss,
    )
    let th = hyp("forall x:A. Q x ==> (f:A->A) x = g x")
    let t = tm("(f:A->A) a")
    @simp.simplify_conv(ss, ths([th]))(t)
  })
  cv("prover_none", () => {
    let th = hyp("forall x:A. Q x ==> (f:A->A) x = g x")
    let t = tm("(f:A->A) a")
    @simp.simplify_conv(@simp.empty_ss, ths([th]))(t)
  })
  cv("too_deep", () => {
    let th1 = hyp("forall x:A. Q x ==> (f:A->A) x = g x")
    let th2 = hyp("forall x:A. R x ==> Q x")
    let th3 = hyp("(R:A->bool) a")
    let t = tm("(f:A->A) a")
    @simp.once_simplify_conv(@simp.empty_ss, ths([th1, th2, th3]))(t)
  })
  cv("deep_ok", () => {
    let th1 = hyp("forall x:A. Q x ==> (f:A->A) x = g x")
    let th2 = hyp("forall x:A. R x ==> Q x")
    let th3 = hyp("(R:A->bool) a")
    let t = tm("(f:A->A) a")
    @simp.simplify_conv(@simp.empty_ss, ths([th1, th2, th3]))(t)
  })
  cv("DEPTH_SQCONV", () => {
    let th = hyp("forall x:A. (f:A->A) x = g x")
    let ss = @simp.ss_of_thms(ths([th]), @simp.empty_ss)
    let t = tm("(f:A->A) (f a)")
    @simp.depth_sqconv(ss, 3, t)
  })
  cv("REDEPTH_SQCONV", () => {
    let th1 = hyp("forall x:A. (f:A->A) x = g x")
    let th2 = hyp("forall x:A. (h:A->A) (g x) = f x")
    let ss = @simp.ss_of_thms(ths([th1, th2]), @simp.empty_ss)
    let t = tm("(h:A->A) (f a)")
    @simp.redepth_sqconv(ss, 3, t)
  })
  cv("TOP_SWEEP_SQCONV", () => {
    let th = hyp("forall x:A. (f:A->A) x = g (f x)")
    let ss = @simp.ss_of_thms(ths([th]), @simp.empty_ss)
    let t = tm("(f:A->A) a")
    @simp.top_sweep_sqconv(ss, 3, t)
  })
  cv("ss_of_conv", () => {
    let ss = @simp.ss_of_conv(
      tm("(\\x:A. (b:B)) y"),
      @equal.beta_conv,
      @simp.empty_ss,
    )
    let t = tm("(\\x:A. (f:A->B) x) c = (\\y. f y) d")
    @simp.simplify_conv(ss, @list.List([]))(t)
  })
  log.attempt("basic_rewrites", () => {
    let th = hyp("forall x:A. (f:A->A) x = g x")
    @simp.set_basic_rewrites(ths([th]))
    let th2 = hyp("(a:bool) = b")
    @simp.extend_basic_rewrites(ths([th2]))
    slist(@simp.basic_rewrites())
  })
  cv("REWRITE_CONV_basic", () => {
    let t = tm("(f:A->A) c = c /\\ a")
    @simp.rewrite_conv(@list.List([]))(t)
  })
  cv("PURE_REWRITE_CONV_basic", () => {
    let t = tm("(f:A->A) c = c /\\ a")
    @simp.pure_rewrite_conv(@list.List([]))(t)
  })
  log.attempt("basic_convs", () => {
    let p = tm("(\\x:A. (b:B)) y")
    @simp.extend_basic_convs("BETA", (p, @equal.beta_conv))
    let p2 = tm("(\\x:A. (b:B)) y")
    @simp.extend_basic_convs("BETA", (p2, @equal.beta_conv))
    @simp.basic_convs().map(c => c.0).to_array().join(" ")
  })
  cv("REWRITE_CONV_conv", () => {
    let t = tm("(\\x:A. (f:A->A) x) c")
    @simp.rewrite_conv(@list.List([]))(t)
  })
  cv("SIMP_CONV_basic", () => {
    let t = tm("(\\x:A. (f:A->A) x) c")
    @simp.simp_conv(@list.List([]))(t)
  })
  log.attempt("basic_congs", () => {
    @simp.extend_basic_congs(ths([imp_cong]))
    @simp.extend_basic_congs(ths([imp_cong]))
    @simp.basic_congs().length().to_string()
  })
  cv("SIMP_CONV_congs", () => {
    let t = tm("(x:A) = c ==> (h:A->A) x = h c")
    @simp.simp_conv(@list.List([]))(t)
  })
  log.attempt("reset", () => {
    @simp.set_basic_rewrites(@list.List([]))
    @simp.set_basic_convs(@list.List([]))
    @simp.set_basic_congs(@list.List([]))
    @simp.basic_rewrites().length().to_string()
  })
  let subgoal_thm = (gs : @tactics.Goalstate) => {
    match gs.1 {
      More((asl, gw), tail=Empty) =>
        @drule.mk_thm(asl.map(p => @kernel.concl(p.1)), gw)
      _ => raise @lib.MatchFailure("simp_ref.ml")
    }
  }
  cv("ABBREV_TAC", () => {
    let w = tm("(a /\\ b) \\/ ~(a /\\ b)")
    let ab = tm("c = (a /\\ b)")
    let _c = tm("c:bool")
    let gs = @simp.abbrev_tac(ab)((@list.List([]), w))
    match gs.1 {
      More((_, gw), tail=Empty) => @drule.mk_thm(@list.List([]), gw)
      _ => raise @lib.MatchFailure("simp_ref.ml")
    }
  })
  cv("ABBREV_TAC_fun", () => {
    let w = tm("(f:A->A) a = f b")
    let ab = tm("(g:A->A) x = (f:A->A) x")
    subgoal_thm(@simp.abbrev_tac(ab)((@list.List([]), w)))
  })
  cv("ABBREV_TAC_used", () => {
    let w = tm("(c:bool) /\\ a")
    let ab = tm("c = (a:bool)")
    let gs = @simp.abbrev_tac(ab)((@list.List([]), w))
    match gs.1 {
      More((_, gw), tail=Empty) => @drule.mk_thm(@list.List([]), gw)
      _ => raise @lib.MatchFailure("simp_ref.ml")
    }
  })
  cv("ABBREV_EXPAND", () => {
    let w = tm("(a /\\ b) \\/ ~(a /\\ b)")
    let ab = tm("c = (a /\\ b)")
    let tac = @tactics.then_tac(@simp.abbrev_tac(ab), @simp.expand_tac("c"))
    subgoal_thm(tac((@list.List([]), w)))
  })
  cv("EXPAND_TAC_none", () => {
    let w = tm("(a:bool)")
    subgoal_thm(@simp.expand_tac("c")((@list.List([]), w)))
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
      #|simp quotations (3):
      #|  true
      #|  ((p : Bool) \226\134\146 (q : Bool) \226\134\146 (r : Bool)) == (p && q \226\134\146 r)
      #|  (\226\136\128 x : _, (P : (_) -> Bool)(x) \226\134\146 (Q : Bool)) == ((\226\136\131 x : _, P(x)) \226\134\146 Q)
      #|term_order = false true true false false true
      #|Warning: inventing type variables
      #|mk_rewrites_false = [(#forall:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#=:fun('?1,fun('?1,bool)) (Q:fun('A,'?1) x:'A)) (R:fun('A,'?1) x:'A)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('?2,fun('?2,bool)) a:'?2) b:'?2))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) c:bool)) ((#==>:fun(bool,fun(bool,bool)) p:bool) ((#=:fun('A,fun('A,bool)) u:'A) v:'A))))))) |- ((#=:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) #T:bool); (#forall:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#=:fun('?1,fun('?1,bool)) (Q:fun('A,'?1) x:'A)) (R:fun('A,'?1) x:'A)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('?2,fun('?2,bool)) a:'?2) b:'?2))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) c:bool)) ((#==>:fun(bool,fun(bool,bool)) p:bool) ((#=:fun('A,fun('A,bool)) u:'A) v:'A))))))) |- ((#=:fun('?1,fun('?1,bool)) (Q:fun('A,'?1) x:'A)) (R:fun('A,'?1) x:'A)); (#forall:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#=:fun('?1,fun('?1,bool)) (Q:fun('A,'?1) x:'A)) (R:fun('A,'?1) x:'A)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('?2,fun('?2,bool)) a:'?2) b:'?2))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) c:bool)) ((#==>:fun(bool,fun(bool,bool)) p:bool) ((#=:fun('A,fun('A,bool)) u:'A) v:'A))))))) |- ((#=:fun(bool,fun(bool,bool)) ((#=:fun('?2,fun('?2,bool)) b:'?2) a:'?2)) #F:bool); (#forall:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#=:fun('?1,fun('?1,bool)) (Q:fun('A,'?1) x:'A)) (R:fun('A,'?1) x:'A)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('?2,fun('?2,bool)) a:'?2) b:'?2))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) c:bool)) ((#==>:fun(bool,fun(bool,bool)) p:bool) ((#=:fun('A,fun('A,bool)) u:'A) v:'A))))))) |- ((#=:fun(bool,fun(bool,bool)) ((#=:fun('?2,fun('?2,bool)) a:'?2) b:'?2)) #F:bool); (#forall:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#=:fun('?1,fun('?1,bool)) (Q:fun('A,'?1) x:'A)) (R:fun('A,'?1) x:'A)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('?2,fun('?2,bool)) a:'?2) b:'?2))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) c:bool)) ((#==>:fun(bool,fun(bool,bool)) p:bool) ((#=:fun('A,fun('A,bool)) u:'A) v:'A))))))) |- ((#=:fun(bool,fun(bool,bool)) c:bool) #F:bool); (#forall:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#=:fun('?1,fun('?1,bool)) (Q:fun('A,'?1) x:'A)) (R:fun('A,'?1) x:'A)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('?2,fun('?2,bool)) a:'?2) b:'?2))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) c:bool)) ((#==>:fun(bool,fun(bool,bool)) p:bool) ((#=:fun('A,fun('A,bool)) u:'A) v:'A))))))) |- ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) p:bool) ((#=:fun('A,fun('A,bool)) u:'A) v:'A))) #T:bool)]
      #|Warning: inventing type variables
      #|mk_rewrites_true = [(#forall:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#=:fun('?3,fun('?3,bool)) (Q:fun('A,'?3) x:'A)) (R:fun('A,'?3) x:'A)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('?4,fun('?4,bool)) a:'?4) b:'?4))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) c:bool)) ((#==>:fun(bool,fun(bool,bool)) p:bool) ((#=:fun('A,fun('A,bool)) u:'A) v:'A))))))) |- ((#=:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) #T:bool); (#forall:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#=:fun('?3,fun('?3,bool)) (Q:fun('A,'?3) x:'A)) (R:fun('A,'?3) x:'A)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('?4,fun('?4,bool)) a:'?4) b:'?4))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) c:bool)) ((#==>:fun(bool,fun(bool,bool)) p:bool) ((#=:fun('A,fun('A,bool)) u:'A) v:'A))))))) |- ((#=:fun('?3,fun('?3,bool)) (Q:fun('A,'?3) x:'A)) (R:fun('A,'?3) x:'A)); (#forall:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#=:fun('?3,fun('?3,bool)) (Q:fun('A,'?3) x:'A)) (R:fun('A,'?3) x:'A)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('?4,fun('?4,bool)) a:'?4) b:'?4))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) c:bool)) ((#==>:fun(bool,fun(bool,bool)) p:bool) ((#=:fun('A,fun('A,bool)) u:'A) v:'A))))))) |- ((#=:fun(bool,fun(bool,bool)) ((#=:fun('?4,fun('?4,bool)) b:'?4) a:'?4)) #F:bool); (#forall:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#=:fun('?3,fun('?3,bool)) (Q:fun('A,'?3) x:'A)) (R:fun('A,'?3) x:'A)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('?4,fun('?4,bool)) a:'?4) b:'?4))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) c:bool)) ((#==>:fun(bool,fun(bool,bool)) p:bool) ((#=:fun('A,fun('A,bool)) u:'A) v:'A))))))) |- ((#=:fun(bool,fun(bool,bool)) ((#=:fun('?4,fun('?4,bool)) a:'?4) b:'?4)) #F:bool); (#forall:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#=:fun('?3,fun('?3,bool)) (Q:fun('A,'?3) x:'A)) (R:fun('A,'?3) x:'A)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('?4,fun('?4,bool)) a:'?4) b:'?4))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) c:bool)) ((#==>:fun(bool,fun(bool,bool)) p:bool) ((#=:fun('A,fun('A,bool)) u:'A) v:'A))))))) |- ((#=:fun(bool,fun(bool,bool)) c:bool) #F:bool); (#forall:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#=:fun('?3,fun('?3,bool)) (Q:fun('A,'?3) x:'A)) (R:fun('A,'?3) x:'A)))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun('?4,fun('?4,bool)) a:'?4) b:'?4))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) c:bool)) ((#==>:fun(bool,fun(bool,bool)) p:bool) ((#=:fun('A,fun('A,bool)) u:'A) v:'A))))))) |- ((#==>:fun(bool,fun(bool,bool)) p:bool) ((#=:fun('A,fun('A,bool)) u:'A) v:'A))]
      #|mk_rewrites_exists = [(#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((P:fun('A,fun('A,bool)) x:'A) y:'A)) ((#==>:fun(bool,fun(bool,bool)) ((Q:fun('A,fun('A,bool)) x:'A) y:'A)) ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) x:'A)) (g:fun('A,'A) x:'A)))))))) |- ((#==>:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\y:'A. ((#/\:fun(bool,fun(bool,bool)) ((P:fun('A,fun('A,bool)) x:'A) y:'A)) ((Q:fun('A,fun('A,bool)) x:'A) y:'A))))) ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) x:'A)) (g:fun('A,'A) x:'A)))]
      #|REWRITE_CONV = (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) x:'A)) (g:fun('A,'A) x:'A)))) |- ((#=:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (h:fun('A,'A) (f:fun('A,'A) a:'A))) (f:fun('A,'A) (f:fun('A,'A) b:'A)))) ((#=:fun('A,fun('A,bool)) (h:fun('A,'A) (g:fun('A,'A) a:'A))) (g:fun('A,'A) (g:fun('A,'A) b:'A))))
      #|REWRITE_CONV_fail =  |- ((#=:fun('A,fun('A,bool)) (h:fun('A,'A) a:'A)) (h:fun('A,'A) a:'A))
      #|REWRITE_CONV_loop =  |- ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) a:bool) a:bool)) ((#\/:fun(bool,fun(bool,bool)) a:bool) a:bool))
      #|REWRITE_CONV_perm = (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#=:fun('A,fun('A,bool)) ((f:fun('A,fun('A,'A)) x:'A) y:'A)) ((f:fun('A,fun('A,'A)) y:'A) x:'A)))))) |- ((#=:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) ((f:fun('A,fun('A,'A)) b:'A) a:'A)) ((f:fun('A,fun('A,'A)) a:'A) b:'A))) ((#=:fun('A,fun('A,bool)) ((f:fun('A,fun('A,'A)) a:'A) b:'A)) ((f:fun('A,fun('A,'A)) a:'A) b:'A)))
      #|REWRITE_CONV_eta =  |- ((#=:fun(fun('A,'B),fun(fun('A,'B),bool)) (\y:'A. (g:fun('A,'B) y:'A))) (\y:'A. (g:fun('A,'B) y:'A)))
      #|REWRITE_CONV_lconst = ((#=:fun(bool,fun(bool,bool)) x:bool) #T:bool) |- ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) x:bool) ((#/\:fun(bool,fun(bool,bool)) y:bool) ((\x:bool. x:bool) z:bool)))) ((#/\:fun(bool,fun(bool,bool)) #T:bool) ((#/\:fun(bool,fun(bool,bool)) y:bool) ((\x:bool. x:bool) z:bool))))
      #|PURE_REWRITE_CONV = ((#=:fun(bool,fun(bool,bool)) a:bool) b:bool) |- ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) a:bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) b:bool))
      #|ONCE_REWRITE_CONV = (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) x:'A)) (f:fun('A,'A) (f:fun('A,'A) x:'A))))) |- ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) a:'A)) (f:fun('A,'A) (f:fun('A,'A) a:'A)))
      #|PURE_ONCE_REWRITE_CONV = ((#=:fun(bool,fun(bool,bool)) a:bool) ((#/\:fun(bool,fun(bool,bool)) a:bool) a:bool)) |- ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) a:bool) a:bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) a:bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) a:bool)))
      #|GEN_REWRITE_CONV = ((#=:fun(bool,fun(bool,bool)) a:bool) b:bool) |- ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) a:bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool))
      #|REWRITE_RULE = ((#/\:fun(bool,fun(bool,bool)) a:bool) c:bool), ((#=:fun(bool,fun(bool,bool)) a:bool) b:bool) |- ((#/\:fun(bool,fun(bool,bool)) b:bool) c:bool)
      #|ASM_REWRITE_RULE = c:bool, ((#=:fun(bool,fun(bool,bool)) a:bool) b:bool) |- ((#=:fun(bool,fun(bool,bool)) b:bool) b:bool)
      #|ONCE_ASM_REWRITE_RULE = ((#=:fun(bool,fun(bool,bool)) a:bool) b:bool) |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) b:bool) b:bool)) ((#=:fun(bool,fun(bool,bool)) b:bool) b:bool))
      #|REWRITE_TAC =  |- ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#==>:fun(bool,fun(bool,bool)) a:bool) b:bool))
      #|ASM_REWRITE_TAC =  |- ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#==>:fun(bool,fun(bool,bool)) b:bool) a:bool))
      #|REWRITES_CONV_fail ! REWRITES_CONV
      #|SIMP_CONV_cond = (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) x:'A)) (g:fun('A,'A) x:'A))))), (P:fun('A,bool) a:'A) |- ((#=:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (h:fun('A,'A) (f:fun('A,'A) a:'A))) (f:fun('A,'A) b:'A))) ((#=:fun('A,fun('A,bool)) (h:fun('A,'A) (g:fun('A,'A) a:'A))) (f:fun('A,'A) b:'A)))
      #|SIMP_CONV_ctx_abs =  |- ((#=:fun(fun(bool,bool),fun(fun(bool,bool),bool)) (\x:bool. ((#/\:fun(bool,fun(bool,bool)) x:bool) y:bool))) (\x:bool. ((#/\:fun(bool,fun(bool,bool)) x:bool) y:bool)))
      #|PURE_SIMP_CONV = ((#=:fun(bool,fun(bool,bool)) a:bool) b:bool) |- ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) c:bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) c:bool))
      #|ONCE_SIMP_CONV =  |- ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) a:'A)) (f:fun('A,'A) a:'A))
      #|SIMP_RULE = ((#/\:fun(bool,fun(bool,bool)) a:bool) c:bool), ((#=:fun(bool,fun(bool,bool)) a:bool) b:bool) |- ((#/\:fun(bool,fun(bool,bool)) b:bool) c:bool)
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|net_of_cong_bad ! net_of_cong: Non-implicational congruence
      #|SIMP_cong =  |- ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) x:'A) a:'A)) ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) x:'A)) (f:fun('A,'A) a:'A)))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) x:'A) a:'A)) ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) a:'A)) (f:fun('A,'A) a:'A))))
      #|SIMP_cong_deep = (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) x:'A)) (g:fun('A,'A) x:'A))))) |- ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) a:'A)) ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) a:'A)) b:'A))) ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) a:'A)) ((#=:fun('A,fun('A,bool)) (g:fun('A,'A) a:'A)) b:'A)))
      #|prover = (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (Q:fun('A,bool) x:'A)) ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) x:'A)) (g:fun('A,'A) x:'A))))), (Q:fun('A,bool) a:'A) |- ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) a:'A)) (g:fun('A,'A) a:'A))
      #|prover_none =  |- ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) a:'A)) (f:fun('A,'A) a:'A))
      #|too_deep =  |- ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) a:'A)) (f:fun('A,'A) a:'A))
      #|deep_ok = (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (Q:fun('A,bool) x:'A)) ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) x:'A)) (g:fun('A,'A) x:'A))))), (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (R:fun('A,bool) x:'A)) (Q:fun('A,bool) x:'A)))), (R:fun('A,bool) a:'A) |- ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) a:'A)) (g:fun('A,'A) a:'A))
      #|DEPTH_SQCONV = (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) x:'A)) (g:fun('A,'A) x:'A)))) |- ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) (f:fun('A,'A) a:'A))) (g:fun('A,'A) (g:fun('A,'A) a:'A)))
      #|Warning: inventing type variables
      #|REDEPTH_SQCONV ! tryfind
      #|TOP_SWEEP_SQCONV ! GEN_SUB_CONV
      #|ss_of_conv =  |- ((#=:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) ((\x:'A. (f:fun('A,'B) x:'A)) c:'A)) ((\y:'A. (f:fun('A,'B) y:'A)) d:'A))) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) c:'A)) (f:fun('A,'B) d:'A)))
      #|basic_rewrites = [((#=:fun(bool,fun(bool,bool)) a:bool) b:bool) |- ((#=:fun(bool,fun(bool,bool)) a:bool) b:bool); (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) x:'A)) (g:fun('A,'A) x:'A)))) |- ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) x:'A)) (g:fun('A,'A) x:'A))]
      #|REWRITE_CONV_basic = (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) x:'A)) (g:fun('A,'A) x:'A)))), ((#=:fun(bool,fun(bool,bool)) a:bool) b:bool) |- ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) c:'A)) c:'A)) a:bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (g:fun('A,'A) c:'A)) c:'A)) b:bool))
      #|PURE_REWRITE_CONV_basic =  |- ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) c:'A)) c:'A)) a:bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) c:'A)) c:'A)) a:bool))
      #|basic_convs = BETA
      #|REWRITE_CONV_conv = (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) x:'A)) (g:fun('A,'A) x:'A)))) |- ((#=:fun('A,fun('A,bool)) ((\x:'A. (f:fun('A,'A) x:'A)) c:'A)) (g:fun('A,'A) c:'A))
      #|SIMP_CONV_basic = (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) x:'A)) (g:fun('A,'A) x:'A)))) |- ((#=:fun('A,fun('A,bool)) ((\x:'A. (f:fun('A,'A) x:'A)) c:'A)) (g:fun('A,'A) c:'A))
      #|basic_congs = 1
      #|SIMP_CONV_congs =  |- ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) x:'A) c:'A)) ((#=:fun('A,fun('A,bool)) (h:fun('A,'A) x:'A)) (h:fun('A,'A) c:'A)))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) x:'A) c:'A)) ((#=:fun('A,fun('A,bool)) (h:fun('A,'A) c:'A)) (h:fun('A,'A) c:'A))))
      #|reset = 0
      #|ABBREV_TAC =  |- ((#\/:fun(bool,fun(bool,bool)) c:bool) (#~:fun(bool,bool) c:bool))
      #|ABBREV_TAC_fun = (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) x:'A)) (g:fun('A,'A) x:'A)))) |- ((#=:fun('A,fun('A,bool)) (g:fun('A,'A) a:'A)) (g:fun('A,'A) b:'A))
      #|ABBREV_TAC_used ! ABBREV_TAC: variable already used
      #|ABBREV_EXPAND = ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool)) c:bool) |- ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool)) (#~:fun(bool,bool) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool)))
      #|EXPAND_TAC_none ! tryfind
      #|axioms = 3
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?5
      #|counter_genvar = _15:bool
      #|

    ),
  )
}
