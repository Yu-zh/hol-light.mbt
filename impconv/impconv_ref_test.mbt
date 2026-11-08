// Load-fidelity and behaviour test for impconv.ml: replays
// tools/ocaml_ref/impconv_ref.ml (keep in sync).

///|
using @testkit {stm, sthm}

///|
fn sgoal(g : @tactics.Goal) -> String {
  let (asl, w) = g
  "[" +
  asl.map(p => p.0 + ": " + sthm(p.1)).to_array().join("; ") +
  "] ?- " +
  stm(w)
}

///|
test "impconv matches impconv.ml" {
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot", "impconv",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("impconv")
  log.capture_stdout()
  let tm = @term_syntax.parse_term
  let st = (
    name : String,
    g : @tactics.Goal,
    tac : (@tactics.Goal) -> @tactics.Goalstate raise,
  ) => {
    log.attempt(name, () => {
      let (_, gls, _) = tac(g)
      "[" + gls.map(sgoal).to_array().join("; ") + "]"
    })
  }
  let pv = (
    name : String,
    w : @kernel.Term,
    tac : (@tactics.Goal) -> @tactics.Goalstate raise,
  ) => log.attempt(name, () => sthm(@tactics.prove(w, tac)))
  let (ax, ax2, px) = try {
    let ax = @kernel.assume_rule(tm("∀ x : Bool, (P : (Bool) -> Bool)(x) → (f : (Bool) -> Bool)(x) == (g : (Bool) -> Bool)(x)"))
    let ax2 = @kernel.assume_rule(tm("∀ x : Bool, (Q : (Bool) -> Bool)(x) → (g : (Bool) -> Bool)(x) == (h : (Bool) -> Bool)(x)"))
    let px = @kernel.assume_rule(tm("(P : (Bool) -> Bool)((a : Bool))"))
    (ax, ax2, px)
  } catch {
    e => fail("setup: \{e}")
  }
  let none : @list.List[(String, @kernel.Thm)] = @list.List([])
  let ths = (a : Array[@kernel.Thm]) => @list.List(a)
  let goal = (s : String) => (none, tm(s))
  try {
    st(
      "imp_rewrite",
      goal("(P : (Bool) -> Bool)((a : Bool)) → (g : (Bool) -> Bool)(a) → (f : (Bool) -> Bool)(a)"),
      @impconv.imp_rewrite_tac(ths([ax])),
    )
    st(
      "imp_rewrite_seq",
      goal("(f : (Bool) -> Bool)((a : Bool)) && f((b : Bool))"),
      @impconv.seq_imp_rewrite_tac(ths([ax, ax2])),
    )
    st(
      "imp_rewrite_two",
      goal("(f : (Bool) -> Bool)((a : Bool)) → (g : (Bool) -> Bool)(a)"),
      @impconv.imp_rewrite_tac(ths([ax, ax2])),
    )
    st(
      "imp_rewrite_eq",
      goal("!((p : Bool) && (q : Bool)) → !p || !q"),
      @impconv.imp_rewrite_tac(ths([@class.de_morgan_thm()])),
    )
    st(
      "imp_rewrite_unchanged",
      goal("(p : Bool)"),
      @impconv.imp_rewrite_tac(ths([])),
    )
    st(
      "imp_rewrite_hyp",
      (@list.singleton(("h", px)), tm("(f : (Bool) -> _)((a : Bool))")),
      @impconv.imp_rewrite_tac(ths([ax])),
    )
    st("case_rewrite", goal("(f : (Bool) -> _)((a : Bool))"), @impconv.case_rewrite_tac(ax))
    st(
      "target_rewrite",
      goal("(f : (Bool) -> _)((a : Bool))"),
      @impconv.target_rewrite_tac(ths([ax2]))(ax),
    )
    st(
      "hint_exists",
      (@list.singleton(("h", px)), tm("∃ x : Bool, (P : (Bool) -> Bool)(x)")),
      @impconv.hint_exists_tac,
    )
    st("hint_exists_none", goal("∃ x : Bool, (P : (Bool) -> Bool)(x)"), @impconv.hint_exists_tac)
    st(
      "imp_rewrite_forall",
      goal("∀ y : Bool, (P : (Bool) -> Bool)(y) → (f : (Bool) -> Bool)(y)"),
      @impconv.imp_rewrite_tac(ths([ax])),
    )
    st(
      "imp_rewrite_exists",
      goal("∃ y : Bool, (f : (Bool) -> Bool)(y)"),
      @impconv.imp_rewrite_tac(ths([ax])),
    )
    pv(
      "prove_imp_rewrite",
      tm("(∀ x : Bool, (P : (Bool) -> Bool)(x) → (f : (Bool) -> Bool)(x) == (g : (Bool) -> Bool)(x)) → P((a : Bool)) → g(a) → f(a)"),
      @tactics.then_tac(
        @tactics.disch_then(th => @impconv.imp_rewrite_tac(ths([th]))),
        @itab.itaut_tac,
      ),
    )
    st(
      "case_rewrite_conj",
      goal("(q : Bool) → (f : (Bool) -> Bool)((a : Bool))"),
      @impconv.case_rewrite_tac(ax),
    )
    st(
      "target_rewrite_hyp",
      goal("(f : (Bool) -> _)((a : Bool))"),
      @impconv.target_rewrite_tac(ths([ax]))(ax2),
    )
  } catch {
    e => fail("\{e}")
  }
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
      #|impconv quotations (31):
      #|  op_slash_bslash
      #|  (A : Bool)
      #|  (B : Bool)
      #|  (C : Bool)
      #|  (D : Bool)
      #|  true
      #|  (A : Bool) \226\134\146 A
      #|  ((x : Bool) \226\134\146 (y : Bool) && (z : Bool)) == ((x \226\134\146 y) && (x \226\134\146 z))
      #|  ((p : Bool) \226\134\146 (q : Bool) \226\134\146 (r : Bool)) == (q \226\134\146 p \226\134\146 r)
      #|  (((A : Bool) \226\134\146 (B : Bool)) \226\134\146 (C : Bool) \226\134\146 (D : Bool)) && ((B \226\134\146 A) \226\134\146 D \226\134\146 C) \226\134\146 A == B \226\134\146 C == D
      #|  (((A : Bool) \226\134\146 (B : Bool)) \226\134\146 (C : Bool)) && ((B \226\134\146 A) \226\134\146 (D : Bool)) \226\134\146 A == B \226\134\146 C && D
      #|  (((A : Bool) \226\134\146 (B : Bool)) \226\134\146 (C : Bool)) \226\134\146 A == B \226\134\146 C && (B \226\134\146 A)
      #|  (((B : Bool) \226\134\146 (A : Bool)) \226\134\146 (D : Bool)) \226\134\146 A == B \226\134\146 (A \226\134\146 B) && D
      #|  ((C : Bool) \226\134\146 (A : Bool) \226\134\146 (B : Bool)) && ((D : Bool) \226\134\146 B \226\134\146 A) \226\134\146 C && D \226\134\146 A == B
      #|  ((C : Bool) \226\134\146 (A : Bool) \226\134\146 (B : Bool)) \226\134\146 C && (B \226\134\146 A) \226\134\146 A == B
      #|  ((D : Bool) \226\134\146 (B : Bool) \226\134\146 (A : Bool)) \226\134\146 (A \226\134\146 B) && D \226\134\146 A == B
      #|  ((B : Bool) \226\134\146 (A : Bool)) && (A \226\134\146 B \226\134\146 (C : Bool) \226\134\146 (D : Bool)) \226\134\146 (A \226\134\146 C) \226\134\146 B \226\134\146 D
      #|  ((A : Bool) \226\134\146 (B : Bool)) && (A \226\134\146 B \226\134\146 (D : Bool) \226\134\146 (C : Bool)) \226\134\146 (B \226\134\146 D) \226\134\146 A \226\134\146 C
      #|  ((A : Bool) \226\134\146 (C : Bool) \226\134\146 (D : Bool)) \226\134\146 (A \226\134\146 C) \226\134\146 A \226\134\146 D
      #|  ((C : Bool) \226\134\146 (A : Bool) \226\134\146 (B : Bool)) && (A \226\134\146 B \226\134\146 C \226\134\146 (D : Bool)) \226\134\146 A && C \226\134\146 B && D
      #|  ((C : Bool) \226\134\146 (A : Bool) \226\134\146 (B : Bool)) \226\134\146 A && C \226\134\146 B && C
      #|  ((A : Bool) \226\134\146 (C : Bool) \226\134\146 (D : Bool)) \226\134\146 A && C \226\134\146 A && D
      #|  ((B : Bool) \226\134\146 (A : Bool)) && (B \226\134\146 (D : Bool) \226\134\146 (C : Bool)) \226\134\146 B && D \226\134\146 A && C
      #|  ((B : Bool) \226\134\146 (A : Bool)) \226\134\146 B && (C : Bool) \226\134\146 A && C
      #|  ((C : Bool) \226\134\146 (B : Bool) \226\134\146 (A : Bool)) \226\134\146 B && C \226\134\146 A && C
      #|  :(Bool, Bool) -> Bool
      #|  ((A : Bool) \226\134\146 (B : Bool) \226\134\146 (C : Bool)) == (B \226\134\146 A \226\134\146 C)
      #|  (!(P : Bool) \226\134\146 (Q : Bool) == (R : Bool)) \226\134\146 Q == ((!P \226\134\146 R) && (P \226\134\146 Q))
      #|  ((P : Bool) \226\134\146 (Q : Bool) == (R : Bool)) \226\134\146 Q == ((P \226\134\146 R) && (!P \226\134\146 Q))
      #|  :(Bool, Bool) -> Bool
      #|  ((A : Bool) \226\134\146 (B : Bool) \226\134\146 (C : Bool)) == (B \226\134\146 A \226\134\146 C)
      #|imp_rewrite = []
      #|imp_rewrite_seq = [[] ?- ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (h:fun(bool,bool) a:bool)) (Q:fun(bool,bool) a:bool))) (P:fun(bool,bool) a:bool))) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (h:fun(bool,bool) b:bool)) (Q:fun(bool,bool) b:bool))) (P:fun(bool,bool) b:bool)))]
      #|imp_rewrite_two = [[] ?- ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (P:fun(bool,bool) a:bool)) (g:fun(bool,bool) a:bool))) ((#/\:fun(bool,fun(bool,bool)) #T:bool) (P:fun(bool,bool) a:bool)))]
      #|imp_rewrite_eq = []
      #|imp_rewrite_unchanged ! Unchanged
      #|Warning: inventing type variables
      #|imp_rewrite_hyp ! Unchanged
      #|Warning: inventing type variables
      #|case_rewrite !! Unchanged
      #|Warning: inventing type variables
      #|target_rewrite ! vsubst: Bad substitution list
      #|hint_exists = []
      #|hint_exists_none ! Unchanged
      #|imp_rewrite_forall = [[] ?- (#forall:fun(fun(bool,bool),bool) (\y:bool. ((#==>:fun(bool,fun(bool,bool)) (P:fun(bool,bool) y:bool)) (g:fun(bool,bool) y:bool))))]
      #|imp_rewrite_exists = [[] ?- (#?:fun(fun(bool,bool),bool) (\y:bool. ((#/\:fun(bool,fun(bool,bool)) (g:fun(bool,bool) y:bool)) (P:fun(bool,bool) y:bool))))]
      #|prove_imp_rewrite =  |- ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(bool,bool),bool) (\x:bool. ((#==>:fun(bool,fun(bool,bool)) (P:fun(bool,bool) x:bool)) ((#=:fun(bool,fun(bool,bool)) (f:fun(bool,bool) x:bool)) (g:fun(bool,bool) x:bool)))))) ((#==>:fun(bool,fun(bool,bool)) (P:fun(bool,bool) a:bool)) ((#==>:fun(bool,fun(bool,bool)) (g:fun(bool,bool) a:bool)) (f:fun(bool,bool) a:bool))))
      #|case_rewrite_conj = [[] ?- ((#==>:fun(bool,fun(bool,bool)) q:bool) ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (P:fun(bool,bool) a:bool)) (g:fun(bool,bool) a:bool))) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (P:fun(bool,bool) a:bool))) (f:fun(bool,bool) a:bool))))]
      #|Warning: inventing type variables
      #|target_rewrite_hyp ! vsubst: Bad substitution list
      #|
    ),
  )
}
