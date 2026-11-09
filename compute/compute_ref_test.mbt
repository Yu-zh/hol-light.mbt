// Load-fidelity and behaviour test for compute.ml: replays
// tools/ocaml_ref/compute_ref.ml (keep in sync).

///|
using @testkit {stm, sthm}

///|
test "compute matches compute.ml" {
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot", "impconv", "pair", "compute",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("compute")
  let tm = @term_syntax.parse_term
  let ev = (name : String, s : String) => {
    log.attempt(name, () => sthm(@compute.eval_conv(tm(s))))
  }
  ev("eval_bool", "true && false || !false")
  ev("eval_cond", "if true && true { (a : A) } else { (b : A) }")
  ev("eval_let", "LET((x : Bool) => LET_END(x && !x), true)")
  ev("eval_beta", "((x : Bool) => x || false)(true)")
  ev("eval_pair", "FST((true, false)) && SND((false, true))")
  log.attempt("eval_weak", () => {
    sthm(
      @compute.weak_cbv_conv(@compute.bool_compset(()))(tm("((x : Bool) => x && true)(false)")),
    )
  })
  ev("eval_fail", "(p : Bool)")
  try {
    let d = @pair.new_definition(tm("(myneg : (Bool) -> Bool)((b : Bool)) == (if b { false } else { true })"))
    log.attempt("add_funs", () => {
      @compute.add_funs(@list.singleton(d))
      sthm(@compute.eval_conv(tm("myneg(myneg(true))")))
    })
  } catch {
    e => fail("setup: \{e}")
  }
  log.attempt("restr", () => {
    sthm(
      @compute.restr_eval_conv(@list.singleton(tm("myneg")))(
        tm("myneg(true && false)"),
      ),
    )
  })
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
      #|compute quotations (1):
      #|  (COND : (Bool, A, A) -> A)
      #|eval_bool =  |- ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) #T:bool) #F:bool)) (#~:fun(bool,bool) #F:bool))) #T:bool)
      #|eval_cond =  |- ((#=:fun('A,fun('A,bool)) (((#COND:fun(bool,fun('A,fun('A,'A))) ((#/\:fun(bool,fun(bool,bool)) #T:bool) #T:bool)) a:'A) b:'A)) a:'A)
      #|eval_let =  |- ((#=:fun(bool,fun(bool,bool)) ((#LET:fun(fun(bool,bool),fun(bool,bool)) (\x:bool. (#LET_END:fun(bool,bool) ((#/\:fun(bool,fun(bool,bool)) x:bool) (#~:fun(bool,bool) x:bool))))) #T:bool)) (#LET_END:fun(bool,bool) #F:bool))
      #|eval_beta =  |- ((#=:fun(bool,fun(bool,bool)) ((\x:bool. ((#\/:fun(bool,fun(bool,bool)) x:bool) #F:bool)) #T:bool)) #T:bool)
      #|eval_pair =  |- ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#FST:fun(prod(bool,bool),bool) ((#,:fun(bool,fun(bool,prod(bool,bool))) #T:bool) #F:bool))) (#SND:fun(prod(bool,bool),bool) ((#,:fun(bool,fun(bool,prod(bool,bool))) #F:bool) #T:bool)))) ((#/\:fun(bool,fun(bool,bool)) (#FST:fun(prod(bool,bool),bool) ((#,:fun(bool,fun(bool,prod(bool,bool))) #T:bool) #F:bool))) (#SND:fun(prod(bool,bool),bool) ((#,:fun(bool,fun(bool,prod(bool,bool))) #F:bool) #T:bool))))
      #|eval_weak =  |- ((#=:fun(bool,fun(bool,bool)) ((\x:bool. ((#/\:fun(bool,fun(bool,bool)) x:bool) #T:bool)) #F:bool)) #F:bool)
      #|eval_fail =  |- ((#=:fun(bool,fun(bool,bool)) p:bool) p:bool)
      #|add_funs =  |- ((#=:fun(bool,fun(bool,bool)) (#myneg:fun(bool,bool) (#myneg:fun(bool,bool) #T:bool))) #T:bool)
      #|restr =  |- ((#=:fun(bool,fun(bool,bool)) (#myneg:fun(bool,bool) ((#/\:fun(bool,fun(bool,bool)) #T:bool) #F:bool))) (#myneg:fun(bool,bool) #F:bool))
      #|counter_genvar = _2069:bool
      #|
    ),
  )
}
