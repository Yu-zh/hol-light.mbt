// Load-fidelity and behaviour test for metis.ml: replays
// tools/ocaml_ref/metis_ref.ml (keep in sync).

///|
using @testkit {sthm}

///|
test "metis matches metis.ml" {
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("metis")
  log.capture_stdout()
  let tm = @term_syntax.parse_term
  let pv = (name : String, s : String, tac : @tactics.Tactic) => {
    log.attempt(name, () => sthm(@tactics.prove(tm(s), tac)))
  }
  let none : @list.List[@kernel.Thm] = @list.List([])
  pv("refl", "∀ x : A, (P : (A) -> Bool)(x) → P(x)", @metis.metis_tac(none))
  pv("drinker", "∃ x : A, (P : (A) -> Bool)(x) → (∀ y : A, P(y))", @metis.metis_tac(none))
  pv(
    "trans",
    "(∀ x : A, ∀ y : A, (R : (A, A) -> Bool)(x, y) → R(y, x)) && (∀ x : A, ∀ y : A, ∀ z : A, R(x, y) && R(y, z) → R(x, z)) && (∀ x : A, ∃ y : A, R(x, y)) → (∀ x : A, R(x, x))",
    @metis.metis_tac(none),
  )
  pv(
    "eq",
    "(∀ x : A, (f : (A) -> A)(f(x)) == x) && (∀ x : A, (g : (A) -> A)(x) == f(x)) → (∀ y : A, g(g(y)) == y)",
    @metis.metis_tac(none),
  )
  pv(
    "lemma",
    "∀ p : Bool, ∀ q : Bool, p && q → q && p",
    @metis.metis_tac(@list.singleton(@theorems.conj_sym())),
  )
  pv(
    "group",
    "(∀ x : A, (m : (A, A) -> A)((e : A), x) == x) && (∀ x : A, m((i : (A) -> A)(x), x) == e) && (∀ x : A, ∀ y : A, ∀ z : A, m(m(x, y), z) == m(x, m(y, z))) → (∀ x : A, m(i(x), m(x, e)) == e)",
    @metis.metis_tac(none),
  )
  pv(
    "asm",
    "(∀ x : A, (P : (A) -> Bool)(x) → (Q : (A) -> Bool)(x)) → P((a : A)) → Q(a)",
    @tactics.then_tac(
      @tactics.repeat_tac(@tactics.strip_tac),
      @metis.asm_metis_tac(none),
    ),
  )
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
      #|metis quotations (6):
      #|  \226\136\128 a : Bool, a \226\134\146 !a \226\134\146 false
      #|  \226\136\128 a : Bool, \226\136\128 b : Bool, a || b \226\134\146 !a \226\134\146 b
      #|  \226\136\128 a : Bool, \226\136\128 c : Bool, a \226\134\146 !a || c \226\134\146 c
      #|  \226\136\128 a : Bool, \226\136\128 b : Bool, \226\136\128 c : Bool, a || b \226\134\146 !a || c \226\134\146 b || c
      #|  \226\136\128 a : Bool, \226\136\128 b : Bool, (!a \226\134\146 b) == (a || b)
      #|  \226\136\128 a : Bool, \226\136\128 b : Bool, (a \226\134\146 b) == (!a || b)
      #|refl =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (P:fun('A,bool) x:'A))))
      #|drinker =  |- (#?:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (#forall:fun(fun('A,bool),bool) (\y:'A. (P:fun('A,bool) y:'A))))))
      #|trans =  |- ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) x:'A) y:'A)) ((R:fun('A,fun('A,bool)) y:'A) x:'A))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) x:'A) y:'A)) ((R:fun('A,fun('A,bool)) y:'A) z:'A))) ((R:fun('A,fun('A,bool)) x:'A) z:'A))))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('A,bool),bool) (\y:'A. ((R:fun('A,fun('A,bool)) x:'A) y:'A)))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((R:fun('A,fun('A,bool)) x:'A) x:'A))))
      #|eq =  |- ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) (f:fun('A,'A) x:'A))) x:'A)))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('A,fun('A,bool)) (g:fun('A,'A) x:'A)) (f:fun('A,'A) x:'A)))))) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#=:fun('A,fun('A,bool)) (g:fun('A,'A) (g:fun('A,'A) y:'A))) y:'A))))
      #|lemma =  |- (#forall:fun(fun(bool,bool),bool) (\p:bool. (#forall:fun(fun(bool,bool),bool) (\q:bool. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) q:bool)) ((#/\:fun(bool,fun(bool,bool)) q:bool) p:bool))))))
      #|group =  |- ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('A,fun('A,bool)) ((m:fun('A,fun('A,'A)) e:'A) x:'A)) x:'A)))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('A,fun('A,bool)) ((m:fun('A,fun('A,'A)) (i:fun('A,'A) x:'A)) x:'A)) e:'A)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#=:fun('A,fun('A,bool)) ((m:fun('A,fun('A,'A)) ((m:fun('A,fun('A,'A)) x:'A) y:'A)) z:'A)) ((m:fun('A,fun('A,'A)) x:'A) ((m:fun('A,fun('A,'A)) y:'A) z:'A)))))))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('A,fun('A,bool)) ((m:fun('A,fun('A,'A)) (i:fun('A,'A) x:'A)) ((m:fun('A,fun('A,'A)) x:'A) e:'A))) e:'A))))
      #|asm =  |- ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (Q:fun('A,bool) x:'A))))) ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) a:'A)) (Q:fun('A,bool) a:'A)))
      #|
    ),
  )
}
