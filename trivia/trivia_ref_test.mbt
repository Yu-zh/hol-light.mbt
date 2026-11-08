// Load-fidelity test for trivia.ml: replays tools/ocaml_ref/trivia_ref.ml
// (keep in sync; refresh with tools/ocaml_ref/refresh_ref.py).

///|
using @testkit {stm, sthm}

///|
test "trivia matches trivia.ml" {
  let log = @testkit.Log::new()
  log.capture_reports()
  for th in ["simp", "theorems", "ind_defs", "class", "trivia"] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("trivia")
  // BEGIN generated theorem list
  log.attempt("o_DEF", () => sthm(@trivia.o_def()))
  log.attempt("I_DEF", () => sthm(@trivia.i_def()))
  log.attempt("o_THM", () => sthm(@trivia.o_thm()))
  log.attempt("o_ASSOC", () => sthm(@trivia.o_assoc()))
  log.attempt("I_THM", () => sthm(@trivia.i_thm()))
  log.attempt("I_O_ID", () => sthm(@trivia.i_o_id()))
  log.attempt("EXISTS_ONE_REP", () => sthm(@trivia.exists_one_rep()))
  log.attempt("one_tydef", () => sthm(@trivia.one_tydef()))
  log.attempt("one_DEF", () => sthm(@trivia.one_def()))
  log.attempt("one", () => sthm(@trivia.one()))
  log.attempt("one_axiom", () => sthm(@trivia.one_axiom()))
  log.attempt("one_INDUCT", () => sthm(@trivia.one_induct()))
  log.attempt("one_RECURSION", () => sthm(@trivia.one_recursion()))
  log.attempt("one_Axiom", () => sthm(@trivia.one_axiom_v1()))
  log.attempt("FORALL_ONE_THM", () => sthm(@trivia.forall_one_thm()))
  log.attempt("EXISTS_ONE_THM", () => sthm(@trivia.exists_one_thm()))
  log.attempt("ETA_ONE", () => sthm(@trivia.eta_one()))
  // END generated theorem list
  let tm = @term_syntax.parse_term
  log.attempt("types", () => {
    @kernel.types().map(p => p.0 + "/" + p.1.to_string()).to_array().join(" ")
  })
  log.attempt("constants", () => {
    @kernel.constants().map(c => c.0).to_array().join(" ")
  })
  log.attempt("definitions", () => @kernel.definitions().length().to_string())
  log.attempt("inductive_type_store", () => {
    @class.inductive_type_store().val.map(p => p.0).to_array().join(" ")
  })
  log.attempt("counter_tyvar", () => stm(tm("(zz_counter : _)")))
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
      #|trivia quotations (20):
      #|  (o : ((B) -> C, (A) -> B, A) -> C)((f : (B) -> C), (g : (A) -> B)) == ((x : A) => f(g(x)))
      #|  (I : (A) -> A) == ((x : A) => x)
      #|  \226\136\128 f : (B) -> C, \226\136\128 g : (A) -> B, \226\136\128 x : A, o(f, g, x) == f(g(x))
      #|  \226\136\128 f : (C) -> D, \226\136\128 g : (B) -> C, \226\136\128 h : (A) -> B, o(f, o(g, h)) == o(o(f, g), h)
      #|  \226\136\128 x : A, I(x) == x
      #|  \226\136\128 f : (A) -> B, o(I, f) == f && o(f, I) == f
      #|  true
      #|  \226\136\131 b : Bool, b
      #|  (one : Unit) == select((x : Unit) => true)
      #|  one_REP((a : Unit))
      #|  \226\136\128 v : Unit, v == one
      #|  \226\136\128 f : (A) -> Unit, \226\136\128 g : (A) -> Unit, f == g
      #|  \226\136\128 P : (Unit) -> Bool, P(one) \226\134\146 (\226\136\128 x : Unit, P(x))
      #|  (x : Unit) => (e : A)
      #|  \226\136\128 e : A, \226\136\131 fn_ : (Unit) -> A, fn_(one) == e
      #|  \226\136\128 e : A, existsunique((fn_ : (Unit) -> A) => fn_(one) == e)
      #|  (\226\136\128 x : Unit, (P : (Unit) -> Bool)(x)) == P(one)
      #|  ((p : Bool) == (q : Bool)) == (!p == !q)
      #|  (\226\136\131 x : Unit, (P : (Unit) -> Bool)(x)) == P(one)
      #|  \226\136\128 f : (Unit) -> A, ((x : Unit) => f(one)) == f
      #|o_DEF =  |- (#forall:fun(fun(fun('B,'C),bool),bool) (\f:fun('B,'C). (#forall:fun(fun(fun('A,'B),bool),bool) (\g:fun('A,'B). ((#=:fun(fun('A,'C),fun(fun('A,'C),bool)) ((#o:fun(fun('B,'C),fun(fun('A,'B),fun('A,'C))) f:fun('B,'C)) g:fun('A,'B))) (\x:'A. (f:fun('B,'C) (g:fun('A,'B) x:'A))))))))
      #|I_DEF =  |- ((#=:fun(fun('A,'A),fun(fun('A,'A),bool)) #I:fun('A,'A)) (\x:'A. x:'A))
      #|o_THM =  |- (#forall:fun(fun(fun('B,'C),bool),bool) (\f:fun('B,'C). (#forall:fun(fun(fun('A,'B),bool),bool) (\g:fun('A,'B). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('C,fun('C,bool)) (((#o:fun(fun('B,'C),fun(fun('A,'B),fun('A,'C))) f:fun('B,'C)) g:fun('A,'B)) x:'A)) (f:fun('B,'C) (g:fun('A,'B) x:'A)))))))))
      #|o_ASSOC =  |- (#forall:fun(fun(fun('C,'D),bool),bool) (\f:fun('C,'D). (#forall:fun(fun(fun('B,'C),bool),bool) (\g:fun('B,'C). (#forall:fun(fun(fun('A,'B),bool),bool) (\h:fun('A,'B). ((#=:fun(fun('A,'D),fun(fun('A,'D),bool)) ((#o:fun(fun('C,'D),fun(fun('A,'C),fun('A,'D))) f:fun('C,'D)) ((#o:fun(fun('B,'C),fun(fun('A,'B),fun('A,'C))) g:fun('B,'C)) h:fun('A,'B)))) ((#o:fun(fun('B,'D),fun(fun('A,'B),fun('A,'D))) ((#o:fun(fun('C,'D),fun(fun('B,'C),fun('B,'D))) f:fun('C,'D)) g:fun('B,'C))) h:fun('A,'B)))))))))
      #|I_THM =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('A,fun('A,bool)) (#I:fun('A,'A) x:'A)) x:'A)))
      #|I_O_ID =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,'B),fun(fun('A,'B),bool)) ((#o:fun(fun('B,'B),fun(fun('A,'B),fun('A,'B))) #I:fun('B,'B)) f:fun('A,'B))) f:fun('A,'B))) ((#=:fun(fun('A,'B),fun(fun('A,'B),bool)) ((#o:fun(fun('A,'B),fun(fun('A,'A),fun('A,'B))) f:fun('A,'B)) #I:fun('A,'A))) f:fun('A,'B)))))
      #|EXISTS_ONE_REP =  |- (#?:fun(fun(bool,bool),bool) (\b:bool. b:bool))
      #|one_tydef =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(1,bool),bool) (\a:1. ((#=:fun(1,fun(1,bool)) (#one_ABS:fun(bool,1) (#one_REP:fun(1,bool) a:1))) a:1)))) (#forall:fun(fun(bool,bool),bool) (\r:bool. ((#=:fun(bool,fun(bool,bool)) r:bool) ((#=:fun(bool,fun(bool,bool)) (#one_REP:fun(1,bool) (#one_ABS:fun(bool,1) r:bool))) r:bool)))))
      #|one_DEF =  |- ((#=:fun(1,fun(1,bool)) #one:1) (#@:fun(fun(1,bool),1) (\x:1. #T:bool)))
      #|one =  |- (#forall:fun(fun(1,bool),bool) (\v:1. ((#=:fun(1,fun(1,bool)) v:1) #one:1)))
      #|one_axiom =  |- (#forall:fun(fun(fun('A,1),bool),bool) (\f:fun('A,1). (#forall:fun(fun(fun('A,1),bool),bool) (\g:fun('A,1). ((#=:fun(fun('A,1),fun(fun('A,1),bool)) f:fun('A,1)) g:fun('A,1))))))
      #|one_INDUCT =  |- (#forall:fun(fun(fun(1,bool),bool),bool) (\P:fun(1,bool). ((#==>:fun(bool,fun(bool,bool)) (P:fun(1,bool) #one:1)) (#forall:fun(fun(1,bool),bool) (\x:1. (P:fun(1,bool) x:1))))))
      #|one_RECURSION =  |- (#forall:fun(fun('A,bool),bool) (\e:'A. (#?:fun(fun(fun(1,'A),bool),bool) (\fn_:fun(1,'A). ((#=:fun('A,fun('A,bool)) (fn_:fun(1,'A) #one:1)) e:'A)))))
      #|one_Axiom =  |- (#forall:fun(fun('A,bool),bool) (\e:'A. (#?!:fun(fun(fun(1,'A),bool),bool) (\fn_:fun(1,'A). ((#=:fun('A,fun('A,bool)) (fn_:fun(1,'A) #one:1)) e:'A)))))
      #|FORALL_ONE_THM =  |- ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(1,bool),bool) (\x:1. (P:fun(1,bool) x:1)))) (P:fun(1,bool) #one:1))
      #|EXISTS_ONE_THM =  |- ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(1,bool),bool) (\x:1. (P:fun(1,bool) x:1)))) (P:fun(1,bool) #one:1))
      #|ETA_ONE =  |- (#forall:fun(fun(fun(1,'A),bool),bool) (\f:fun(1,'A). ((#=:fun(fun(1,'A),fun(fun(1,'A),bool)) (\x:1. (f:fun(1,'A) #one:1))) f:fun(1,'A))))
      #|types = 1/0 bool/0 fun/2
      #|constants = one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 14
      #|inductive_type_store = 1 bool
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?1
      #|counter_genvar = _510:bool
      #|
    ),
  )
}
