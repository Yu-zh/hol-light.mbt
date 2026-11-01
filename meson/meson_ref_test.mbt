// Load-fidelity and behaviour test for meson.ml: replays
// tools/ocaml_ref/meson_ref.ml (keep in sync).

///|
using @testkit {stm, sthm}

///|
test "meson matches meson.ml" {
  let log = @testkit.Log::new()
  log.capture_reports()
  log.capture_stdout()
  for
    th in ["simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson"] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("meson")
  let tm = @parser.parse_term
  let ms = (name : String, s : String) => {
    log.attempt(name, () => {
      let t = tm(s)
      sthm(@tactics.prove(t, @meson.meson_tac(@list.List([]))))
    })
  }
  ms("mp", "(forall x:A. P x ==> Q x) /\\ P a ==> Q a")
  ms("swap", "(?x:A. forall y:B. P x y) ==> (forall y. ?x. P x y)")
  ms("drinker", "?x:A. P x ==> forall y. P y")
  ms(
    "trans", "(forall x y z:A. R x y /\\ R y z ==> R x z) /\\ R a b /\\ R b c /\\ R c d ==> R a d",
  )
  ms("equality", "(forall x:A. f(f x) = x) ==> forall y. ?x. f x = y")
  ms("p18", "?y:A. forall x. F y ==> F x")
  log.attempt("meson_thms", () => {
    let a = @kernel.assume_rule(tm("forall x:A. P x ==> Q x"))
    let b = @kernel.assume_rule(tm("(P:A->bool) c"))
    let t = tm("(Q:A->bool) c")
    sthm(@tactics.prove(t, @meson.meson_tac(@list.List([a, b]))))
  })
  log.attempt("asm_meson", () => {
    let t = tm("(forall x:A. P x ==> Q x) ==> P a ==> Q a")
    let tac = @tactics.then_tac(
      @tactics.repeat_tac(@tactics.disch_tac),
      @meson.asm_meson_tac(@list.List([])),
    )
    sthm(@tactics.prove(t, tac))
  })
  log.attempt("depth_limit", () => {
    let t = tm("(p:bool) ==> q")
    sthm(@tactics.prove(t, @meson.gen_meson_tac(0, 2, 1, @list.List([]))))
  })
  log.attempt("inferences", () => @meson.inferences().val.to_string())
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
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|meson quotations (13):
      #|  false
      #|  ((a : Bool) || (b : Bool)) == (!b \226\134\146 a)
      #|  !!(a : Bool) == a
      #|  !((a : Bool) || (b : Bool)) == (!a && !b)
      #|  (!(a : Bool) || !(b : Bool)) == !(a && b)
      #|  !(p : Bool) == (p \226\134\146 false)
      #|  ((p : Bool) \226\134\146 !p) == !p
      #|  (!(p : Bool) \226\134\146 p) == p
      #|  (x : A) == (y : A)
      #|  (x : A) == x && (!(x == (y : A)) || !(x == (z : A)) || y == z)
      #|  ((a : Bool) \226\134\146 (b : Bool)) == (!a || b)
      #|  (a : Bool) == (b : Bool) \226\134\146 b || !a
      #|  ((a : Bool) \226\134\146 (b : Bool)) == (!a || b)
      #|0..0..1..solved at 4
      #|mp =  |- ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (Q:fun('A,bool) x:'A))))) (P:fun('A,bool) a:'A))) (Q:fun('A,bool) a:'A))
      #|0..0..solved at 2
      #|swap =  |- ((#==>:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('B,bool),bool) (\y:'B. ((P:fun('A,fun('B,bool)) x:'A) y:'B)))))) (#forall:fun(fun('B,bool),bool) (\y:'B. (#?:fun(fun('A,bool),bool) (\x:'A. ((P:fun('A,fun('B,bool)) x:'A) y:'B))))))
      #|0..0..solved at 2
      #|drinker =  |- (#?:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (#forall:fun(fun('A,bool),bool) (\y:'A. (P:fun('A,bool) y:'A))))))
      #|0..0..1..2..5..9..solved at 15
      #|trans =  |- ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) x:'A) y:'A)) ((R:fun('A,fun('A,bool)) y:'A) z:'A))) ((R:fun('A,fun('A,bool)) x:'A) z:'A))))))))) ((#/\:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) a:'A) b:'A)) ((#/\:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) b:'A) c:'A)) ((R:fun('A,fun('A,bool)) c:'A) d:'A))))) ((R:fun('A,fun('A,bool)) a:'A) d:'A))
      #|0..0..solved at 2
      #|equality =  |- ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) (f:fun('A,'A) x:'A))) x:'A)))) (#forall:fun(fun('A,bool),bool) (\y:'A. (#?:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('A,fun('A,bool)) (f:fun('A,'A) x:'A)) y:'A))))))
      #|p18 ! typechecking error (initial type assignment): F has type bool, it cannot be used with type _->bool
      #|0..0..1..solved at 4
      #|meson_thms ! prove: additional assumptions in result
      #|0..0..1..solved at 4
      #|asm_meson =  |- ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (Q:fun('A,bool) x:'A))))) ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) a:'A)) (Q:fun('A,bool) a:'A)))
      #|0..0..0..depth_limit ! solve_goal: Too deep
      #|inferences = 0
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?1
      #|counter_genvar = _651:bool
      #|
    ),
  )
}
