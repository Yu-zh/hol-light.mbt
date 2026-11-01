// Load-fidelity and behaviour test for nums.ml: replays
// tools/ocaml_ref/nums_ref.ml (keep in sync).

///|
using @testkit {stm, sthm}

///|
test "nums matches nums.ml" {
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot", "impconv", "pair", "compute", "nums",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("nums")
  // BEGIN generated theorem list
  log.attempt("ONE_ONE", () => sthm(@nums.one_one()))
  log.attempt("ONTO", () => sthm(@nums.onto()))
  log.attempt("INFINITY_AX", () => sthm(@nums.infinity_ax()))
  log.attempt("IND_SUC_0_EXISTS", () => sthm(@nums.ind_suc_0_exists()))
  log.attempt("IND_SUC_SPEC", () => sthm(@nums.ind_suc_spec()))
  log.attempt("IND_SUC_INJ", () => sthm(@nums.ind_suc_inj()))
  log.attempt("IND_SUC_0", () => sthm(@nums.ind_suc_0()))
  log.attempt("NUM_REP_RULES", () => sthm(@nums.num_rep_rules()))
  log.attempt("NUM_REP_INDUCT", () => sthm(@nums.num_rep_induct()))
  log.attempt("NUM_REP_CASES", () => sthm(@nums.num_rep_cases()))
  log.attempt("ZERO_DEF", () => sthm(@nums.zero_def()))
  log.attempt("SUC_DEF", () => sthm(@nums.suc_def()))
  log.attempt("SUC_INJ", () => sthm(@nums.suc_inj()))
  log.attempt("NUMERAL", () => sthm(@nums.numeral()))
  log.attempt("NOT_SUC", () => sthm(@nums.not_suc()))
  log.attempt("num_INDUCTION", () => sthm(@nums.num_induction()))
  log.attempt("num_Axiom", () => sthm(@nums.num_axiom()))
  log.attempt("num_RECURSION", () => sthm(@nums.num_recursion()))
  log.attempt("num_CASES", () => sthm(@nums.num_cases()))
  log.attempt("BIT0_DEF", () => sthm(@nums.bit0_def()))
  log.attempt("BIT1_DEF", () => sthm(@nums.bit1_def()))
  // END generated theorem list
  let tm = @parser.parse_term
  log.attempt("types", () => {
    @kernel.types().map(p => p.0 + "/" + p.1.to_string()).to_array().join(" ")
  })
  log.attempt("constants", () => {
    @kernel.constants().map(c => c.0).to_array().join(" ")
  })
  log.attempt("definitions", () => @kernel.definitions().length().to_string())
  log.attempt("mk_numeral", () => stm(@nums.mk_numeral(@num.num_of_int(12345))))
  log.attempt("mk_big", () => {
    @printer.string_of_term(
      @nums.mk_numeral(@num.power_num(@num.num_of_int(2), @num.num_of_int(70))),
    )
  })
  log.attempt("dest", () => {
    @num.string_of_num(@basics.dest_numeral(tm("123456789")))
  })
  log.attempt("small", () => {
    @nums.dest_small_numeral(@nums.mk_small_numeral(42)).to_string()
  })
  log.attempt("is_numeral", () => {
    @nums.is_numeral(tm("7")).to_string() +
    " " +
    @nums.is_numeral(tm("x:num")).to_string()
  })
  log.attempt("print", () => @printer.string_of_term(tm("SUC 0 = 1")))
  log.attempt("neg", () => stm(@nums.mk_numeral(@num.num_of_int(-1))))
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
      #|0..0..2..solved at 5
      #|0..0..solved at 2
      #|0..0..1..3..solved at 9
      #|0..0..1..2..5..9..15..29..44..68..142..260..solved at 420
      #|0..0..solved at 3
      #|0..0..solved at 2
      #|nums quotations (35):
      #|  (ONE_ONE : ((A) -> B) -> Bool)((f : (A) -> B)) == (\226\136\128 x1 : A, \226\136\128 x2 : A, f(x1) == f(x2) \226\134\146 x1 == x2)
      #|  (ONTO : ((A) -> B) -> Bool)((f : (A) -> B)) == (\226\136\128 y : B, \226\136\131 x : A, y == f(x))
      #|  \226\136\131 f : (Ind) -> Ind, ONE_ONE(f) && !ONTO(f)
      #|  (f : (Ind) -> Ind)
      #|  (f : (Ind) -> Ind)
      #|  \226\136\131 f : (Ind) -> Ind, \226\136\131 z : Ind, (\226\136\128 x1 : Ind, \226\136\128 x2 : Ind, (f(x1) == f(x2)) == (x1 == x2)) && (\226\136\128 x : Ind, !(f(x) == z))
      #|  (IND_SUC : (Ind) -> Ind) == select((f : (Ind) -> Ind) => \226\136\131 z : Ind, (\226\136\128 x1 : Ind, \226\136\128 x2 : Ind, (f(x1) == f(x2)) == (x1 == x2)) && (\226\136\128 x : Ind, !(f(x) == z)))
      #|  (IND_0 : Ind) == select((z : Ind) => (\226\136\128 x1 : Ind, \226\136\128 x2 : Ind, (IND_SUC(x1) == IND_SUC(x2)) == (x1 == x2)) && (\226\136\128 x : Ind, !(IND_SUC(x) == z)))
      #|  (NUM_REP : (Ind) -> Bool)(IND_0) && (\226\136\128 i : Ind, NUM_REP(i) \226\134\146 NUM_REP(IND_SUC(i)))
      #|  (_0 : Num) == mk_num(IND_0)
      #|  (SUC : (Num) -> Num)((n : Num)) == mk_num(IND_SUC(dest_num(n)))
      #|  \226\136\128 n : Num, !(SUC(n) == _0)
      #|  mk_num
      #|  \226\136\128 p : Num, NUM_REP(IND_SUC(dest_num(p)))
      #|  dest_num
      #|  \226\136\128 m : Num, \226\136\128 n : Num, (SUC(m) == SUC(n)) == (m == n)
      #|  dest_num((n : Num))
      #|  mk_num(IND_SUC((i : Ind))) == SUC(mk_num(i))
      #|  (i : Ind) => NUM_REP(i) && (P : (Num) -> Bool)(mk_num(i))
      #|  \226\136\128 P : (Num) -> Bool, P(_0) && (\226\136\128 n : Num, P(n) \226\134\146 P(SUC(n))) \226\134\146 (\226\136\128 n : Num, P(n))
      #|  (fn_ : (Num) -> A)
      #|  (fn_ : (Num) -> A)
      #|  (y : A)
      #|  (f : (A, Num) -> A)((y : A), (n : Num))
      #|  (y : A)
      #|  existsunique((y : A) => (PRG : (Num, A) -> Bool)((n : Num), y))
      #|  \226\136\128 n : Num, existsunique((y : A) => (PRG : (Num, A) -> Bool)(n, y))
      #|  (PRG : (Num, A) -> Bool)(_0, (e : A)) && (\226\136\128 b : A, \226\136\128 n : Num, PRG(n, b) \226\134\146 PRG(SUC(n), (f : (A, Num) -> A)(b, n)))
      #|  \226\136\128 e : A, \226\136\128 f : (A, Num) -> A, existsunique((fn_ : (Num) -> A) => fn_(_0) == e && (\226\136\128 n : Num, fn_(SUC(n)) == f(fn_(n), n)))
      #|  _0 == 0
      #|  \226\136\128 m : Num, m == 0 || (\226\136\131 n : Num, m == SUC(n))
      #|  select((fn_ : (Num) -> Num) => fn_(0) == 0 && (\226\136\128 n : Num, fn_(SUC(n)) == SUC(SUC(fn_(n)))))
      #|  (m : Num) => (n : Num) => SUC(SUC(m))
      #|  0
      #|  SUC(BIT0((n : Num)))
      #|ONE_ONE =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) (#ONE_ONE:fun(fun('A,'B),bool) f:fun('A,'B))) (#forall:fun(fun('A,bool),bool) (\x1:'A. (#forall:fun(fun('A,bool),bool) (\x2:'A. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x1:'A)) (f:fun('A,'B) x2:'A))) ((#=:fun('A,fun('A,bool)) x1:'A) x2:'A)))))))))
      #|ONTO =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) (#ONTO:fun(fun('A,'B),bool) f:fun('A,'B))) (#forall:fun(fun('B,bool),bool) (\y:'B. (#?:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('B,fun('B,bool)) y:'B) (f:fun('A,'B) x:'A)))))))))
      #|INFINITY_AX =  |- (#?:fun(fun(fun(ind,ind),bool),bool) (\f:fun(ind,ind). ((#/\:fun(bool,fun(bool,bool)) (#ONE_ONE:fun(fun(ind,ind),bool) f:fun(ind,ind))) (#~:fun(bool,bool) (#ONTO:fun(fun(ind,ind),bool) f:fun(ind,ind))))))
      #|IND_SUC_0_EXISTS =  |- (#?:fun(fun(fun(ind,ind),bool),bool) (\f:fun(ind,ind). (#?:fun(fun(ind,bool),bool) (\z:ind. ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(ind,bool),bool) (\x1:ind. (#forall:fun(fun(ind,bool),bool) (\x2:ind. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(ind,fun(ind,bool)) (f:fun(ind,ind) x1:ind)) (f:fun(ind,ind) x2:ind))) ((#=:fun(ind,fun(ind,bool)) x1:ind) x2:ind))))))) (#forall:fun(fun(ind,bool),bool) (\x:ind. (#~:fun(bool,bool) ((#=:fun(ind,fun(ind,bool)) (f:fun(ind,ind) x:ind)) z:ind)))))))))
      #|IND_SUC_SPEC =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(ind,bool),bool) (\x1:ind. (#forall:fun(fun(ind,bool),bool) (\x2:ind. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(ind,fun(ind,bool)) (#IND_SUC:fun(ind,ind) x1:ind)) (#IND_SUC:fun(ind,ind) x2:ind))) ((#=:fun(ind,fun(ind,bool)) x1:ind) x2:ind))))))) (#forall:fun(fun(ind,bool),bool) (\x:ind. (#~:fun(bool,bool) ((#=:fun(ind,fun(ind,bool)) (#IND_SUC:fun(ind,ind) x:ind)) #IND_0:ind)))))
      #|IND_SUC_INJ =  |- (#forall:fun(fun(ind,bool),bool) (\x1:ind. (#forall:fun(fun(ind,bool),bool) (\x2:ind. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(ind,fun(ind,bool)) (#IND_SUC:fun(ind,ind) x1:ind)) (#IND_SUC:fun(ind,ind) x2:ind))) ((#=:fun(ind,fun(ind,bool)) x1:ind) x2:ind))))))
      #|IND_SUC_0 =  |- (#forall:fun(fun(ind,bool),bool) (\x:ind. (#~:fun(bool,bool) ((#=:fun(ind,fun(ind,bool)) (#IND_SUC:fun(ind,ind) x:ind)) #IND_0:ind))))
      #|NUM_REP_RULES =  |- ((#/\:fun(bool,fun(bool,bool)) (#NUM_REP:fun(ind,bool) #IND_0:ind)) (#forall:fun(fun(ind,bool),bool) (\i:ind. ((#==>:fun(bool,fun(bool,bool)) (#NUM_REP:fun(ind,bool) i:ind)) (#NUM_REP:fun(ind,bool) (#IND_SUC:fun(ind,ind) i:ind))))))
      #|NUM_REP_INDUCT =  |- (#forall:fun(fun(fun(ind,bool),bool),bool) (\NUM_REP':fun(ind,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (NUM_REP':fun(ind,bool) #IND_0:ind)) (#forall:fun(fun(ind,bool),bool) (\i:ind. ((#==>:fun(bool,fun(bool,bool)) (NUM_REP':fun(ind,bool) i:ind)) (NUM_REP':fun(ind,bool) (#IND_SUC:fun(ind,ind) i:ind))))))) (#forall:fun(fun(ind,bool),bool) (\a:ind. ((#==>:fun(bool,fun(bool,bool)) (#NUM_REP:fun(ind,bool) a:ind)) (NUM_REP':fun(ind,bool) a:ind)))))))
      #|NUM_REP_CASES =  |- (#forall:fun(fun(ind,bool),bool) (\a:ind. ((#=:fun(bool,fun(bool,bool)) (#NUM_REP:fun(ind,bool) a:ind)) ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(ind,fun(ind,bool)) a:ind) #IND_0:ind)) (#?:fun(fun(ind,bool),bool) (\i:ind. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(ind,fun(ind,bool)) a:ind) (#IND_SUC:fun(ind,ind) i:ind))) (#NUM_REP:fun(ind,bool) i:ind))))))))
      #|ZERO_DEF =  |- ((#=:fun(num,fun(num,bool)) #_0:num) (#mk_num:fun(ind,num) #IND_0:ind))
      #|SUC_DEF =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#SUC:fun(num,num) n:num)) (#mk_num:fun(ind,num) (#IND_SUC:fun(ind,ind) (#dest_num:fun(num,ind) n:num))))))
      #|SUC_INJ =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#SUC:fun(num,num) m:num)) (#SUC:fun(num,num) n:num))) ((#=:fun(num,fun(num,bool)) m:num) n:num))))))
      #|NUMERAL =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) n:num)) n:num)))
      #|NOT_SUC =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#~:fun(bool,bool) ((#=:fun(num,fun(num,bool)) (#SUC:fun(num,num) n:num)) (#NUMERAL:fun(num,num) #_0:num)))))
      #|num_INDUCTION =  |- (#forall:fun(fun(fun(num,bool),bool),bool) (\P:fun(num,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(num,bool) (#NUMERAL:fun(num,num) #_0:num))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (P:fun(num,bool) n:num)) (P:fun(num,bool) (#SUC:fun(num,num) n:num))))))) (#forall:fun(fun(num,bool),bool) (\n:num. (P:fun(num,bool) n:num))))))
      #|num_Axiom =  |- (#forall:fun(fun('A,bool),bool) (\e:'A. (#forall:fun(fun(fun('A,fun(num,'A)),bool),bool) (\f:fun('A,fun(num,'A)). (#?!:fun(fun(fun(num,'A),bool),bool) (\fn_:fun(num,'A). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (fn_:fun(num,'A) (#NUMERAL:fun(num,num) #_0:num))) e:'A)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun('A,fun('A,bool)) (fn_:fun(num,'A) (#SUC:fun(num,num) n:num))) ((f:fun('A,fun(num,'A)) (fn_:fun(num,'A) n:num)) n:num)))))))))))
      #|num_RECURSION =  |- (#forall:fun(fun('A,bool),bool) (\e:'A. (#forall:fun(fun(fun('A,fun(num,'A)),bool),bool) (\f:fun('A,fun(num,'A)). (#?:fun(fun(fun(num,'A),bool),bool) (\fn_:fun(num,'A). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (fn_:fun(num,'A) (#NUMERAL:fun(num,num) #_0:num))) e:'A)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun('A,fun('A,bool)) (fn_:fun(num,'A) (#SUC:fun(num,num) n:num))) ((f:fun('A,fun(num,'A)) (fn_:fun(num,'A) n:num)) n:num)))))))))))
      #|num_CASES =  |- (#forall:fun(fun(num,bool),bool) (\m:num. ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) m:num) (#NUMERAL:fun(num,num) #_0:num))) (#?:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) m:num) (#SUC:fun(num,num) n:num)))))))
      #|BIT0_DEF =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#BIT0:fun(num,num) (#NUMERAL:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) #_0:num))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#BIT0:fun(num,num) (#SUC:fun(num,num) n:num))) (#SUC:fun(num,num) (#SUC:fun(num,num) (#BIT0:fun(num,num) n:num)))))))
      #|BIT1_DEF =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#BIT1:fun(num,num) n:num)) (#SUC:fun(num,num) (#BIT0:fun(num,num) n:num)))))
      #|types = num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 41
      #|mk_numeral = (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))))
      #|mk_big = 1180591620717411303424
      #|dest = 123456789
      #|small = 42
      #|is_numeral = true false
      #|print = SUC 0 = 1
      #|neg ! mk_numeral: negative argument
      #|counter_genvar = _2148:bool
      #|
    ),
  )
}
