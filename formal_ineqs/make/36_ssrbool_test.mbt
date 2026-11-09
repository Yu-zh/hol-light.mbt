// Formal_ineqs/lib/ssrbool.hl in its directory's load order: the test block of
// formal_ineqs/lib/ssrbool/ssrbool_ref_test.mbt (tools/ocaml_ref/chain_test.py), with the same golden
// (tools/ocaml_ref/Formal_ineqs_lib_ssrbool_ref.expected).

///|
test "Formal_ineqs/lib/ssrbool matches Formal_ineqs/lib/ssrbool.ml" {
  @testkit.release_output()
  @ssrbool.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for th in ["Formal_ineqs/lib/ssrbool"] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Formal_ineqs/lib/ssrbool")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("Ssrbool.iffLR", () => sthm(@ssrbool.ifflr_v1()))
  log.attempt("Ssrbool.iffRL", () => sthm(@ssrbool.iffrl_v1()))
  log.attempt("Ssrbool.iffLRn", () => sthm(@ssrbool.ifflrn_v1()))
  log.attempt("Ssrbool.iffRLn", () => sthm(@ssrbool.iffrln_v1()))
  log.attempt("Ssrbool.is_true_true", () => sthm(@ssrbool.is_true_true()))
  log.attempt("Ssrbool.not_false_is_true", () => {
    sthm(@ssrbool.not_false_is_true())
  })
  log.attempt("Ssrbool.isT", () => sthm(@ssrbool.ist()))
  log.attempt("Ssrbool.notF", () => sthm(@ssrbool.notf()))
  log.attempt("Ssrbool.negbT", () => sthm(@ssrbool.negbt()))
  log.attempt("Ssrbool.negbTE", () => sthm(@ssrbool.negbte()))
  log.attempt("Ssrbool.negbF", () => sthm(@ssrbool.negbf()))
  log.attempt("Ssrbool.negbFE", () => sthm(@ssrbool.negbfe()))
  log.attempt("Ssrbool.negbK", () => sthm(@ssrbool.negbk()))
  log.attempt("Ssrbool.negbNE", () => sthm(@ssrbool.negbne()))
  log.attempt("Ssrbool.negb_inj", () => sthm(@ssrbool.negb_inj()))
  log.attempt("Ssrbool.negbLR", () => sthm(@ssrbool.negblr()))
  log.attempt("Ssrbool.negbRL", () => sthm(@ssrbool.negbrl()))
  log.attempt("Ssrbool.contra", () => sthm(@ssrbool.contra()))
  log.attempt("Ssrbool.contraNN", () => sthm(@ssrbool.contrann()))
  log.attempt("Ssrbool.contraL", () => sthm(@ssrbool.contral()))
  log.attempt("Ssrbool.contraR", () => sthm(@ssrbool.contrar()))
  log.attempt("Ssrbool.contraLR", () => sthm(@ssrbool.contralr()))
  log.attempt("Ssrbool.contraT", () => sthm(@ssrbool.contrat()))
  log.attempt("Ssrbool.wlog_neg", () => sthm(@ssrbool.wlog_neg()))
  log.attempt("Ssrbool.contraFT", () => sthm(@ssrbool.contraft()))
  log.attempt("Ssrbool.contraFN", () => sthm(@ssrbool.contrafn()))
  log.attempt("Ssrbool.contraTF", () => sthm(@ssrbool.contratf()))
  log.attempt("Ssrbool.contraNF", () => sthm(@ssrbool.contranf()))
  log.attempt("Ssrbool.contraFF", () => sthm(@ssrbool.contraff()))
  log.attempt("Ssrbool.isSome", () => sthm(@ssrbool.issome()))
  log.attempt("Ssrbool.if_same", () => sthm(@ssrbool.if_same_v1()))
  log.attempt("Ssrbool.if_neg", () => sthm(@ssrbool.if_neg_v1()))
  log.attempt("Ssrbool.fun_if", () => sthm(@ssrbool.fun_if_v1()))
  log.attempt("Ssrbool.if_arg", () => sthm(@ssrbool.if_arg_v1()))
  log.attempt("Ssrbool.andTb", () => sthm(@ssrbool.andtb()))
  log.attempt("Ssrbool.andFb", () => sthm(@ssrbool.andfb()))
  log.attempt("Ssrbool.andbT", () => sthm(@ssrbool.andbt()))
  log.attempt("Ssrbool.andbF", () => sthm(@ssrbool.andbf()))
  log.attempt("Ssrbool.andbb", () => sthm(@ssrbool.andbb()))
  log.attempt("Ssrbool.andbC", () => sthm(@ssrbool.andbc()))
  log.attempt("Ssrbool.andbA", () => sthm(@ssrbool.andba()))
  log.attempt("Ssrbool.andbCA", () => sthm(@ssrbool.andbca()))
  log.attempt("Ssrbool.andbAC", () => sthm(@ssrbool.andbac()))
  log.attempt("Ssrbool.orTb", () => sthm(@ssrbool.ortb()))
  log.attempt("Ssrbool.orFb", () => sthm(@ssrbool.orfb()))
  log.attempt("Ssrbool.orbT", () => sthm(@ssrbool.orbt()))
  log.attempt("Ssrbool.orbF", () => sthm(@ssrbool.orbf()))
  log.attempt("Ssrbool.orbb", () => sthm(@ssrbool.orbb()))
  log.attempt("Ssrbool.orbC", () => sthm(@ssrbool.orbc()))
  log.attempt("Ssrbool.orbA", () => sthm(@ssrbool.orba()))
  log.attempt("Ssrbool.orbCA", () => sthm(@ssrbool.orbca()))
  log.attempt("Ssrbool.orbAC", () => sthm(@ssrbool.orbac()))
  log.attempt("Ssrbool.andbN", () => sthm(@ssrbool.andbn()))
  log.attempt("Ssrbool.andNb", () => sthm(@ssrbool.andnb()))
  log.attempt("Ssrbool.orbN", () => sthm(@ssrbool.orbn()))
  log.attempt("Ssrbool.orNb", () => sthm(@ssrbool.ornb()))
  log.attempt("Ssrbool.andb_orl", () => sthm(@ssrbool.andb_orl()))
  log.attempt("Ssrbool.andb_orr", () => sthm(@ssrbool.andb_orr()))
  log.attempt("Ssrbool.orb_andl", () => sthm(@ssrbool.orb_andl()))
  log.attempt("Ssrbool.orb_andr", () => sthm(@ssrbool.orb_andr()))
  log.attempt("Ssrbool.andb_idl", () => sthm(@ssrbool.andb_idl()))
  log.attempt("Ssrbool.andb_idr", () => sthm(@ssrbool.andb_idr()))
  log.attempt("Ssrbool.andb_id2l", () => sthm(@ssrbool.andb_id2l()))
  log.attempt("Ssrbool.andb_id2r", () => sthm(@ssrbool.andb_id2r()))
  log.attempt("Ssrbool.orb_idl", () => sthm(@ssrbool.orb_idl()))
  log.attempt("Ssrbool.orbb_idr", () => sthm(@ssrbool.orbb_idr()))
  log.attempt("Ssrbool.orb_id2l", () => sthm(@ssrbool.orb_id2l()))
  log.attempt("Ssrbool.orb_id2r", () => sthm(@ssrbool.orb_id2r()))
  log.attempt("Ssrbool.negb_and", () => sthm(@ssrbool.negb_and()))
  log.attempt("Ssrbool.negb_or", () => sthm(@ssrbool.negb_or()))
  log.attempt("Ssrbool.andbK", () => sthm(@ssrbool.andbk()))
  log.attempt("Ssrbool.andKb", () => sthm(@ssrbool.andkb()))
  log.attempt("Ssrbool.orbK", () => sthm(@ssrbool.orbk()))
  log.attempt("Ssrbool.orKb", () => sthm(@ssrbool.orkb()))
  log.attempt("Ssrbool.implybT", () => sthm(@ssrbool.implybt()))
  log.attempt("Ssrbool.implybF", () => sthm(@ssrbool.implybf()))
  log.attempt("Ssrbool.implyFb", () => sthm(@ssrbool.implyfb()))
  log.attempt("Ssrbool.implyTb", () => sthm(@ssrbool.implytb()))
  log.attempt("Ssrbool.implybb", () => sthm(@ssrbool.implybb()))
  log.attempt("Ssrbool.negb_imply", () => sthm(@ssrbool.negb_imply()))
  log.attempt("Ssrbool.implybE", () => sthm(@ssrbool.implybe()))
  log.attempt("Ssrbool.implyNb", () => sthm(@ssrbool.implynb()))
  log.attempt("Ssrbool.implybN", () => sthm(@ssrbool.implybn()))
  log.attempt("Ssrbool.implybNN", () => sthm(@ssrbool.implybnn()))
  log.attempt("Ssrbool.implyb_idl", () => sthm(@ssrbool.implyb_idl()))
  log.attempt("Ssrbool.implyb_idr", () => sthm(@ssrbool.implyb_idr()))
  log.attempt("Ssrbool.implyb_id2l", () => sthm(@ssrbool.implyb_id2l()))
  log.attempt("Ssrbool.XOR_DEF", () => sthm(@ssrbool.xor_def()))
  log.attempt("Ssrbool.addFb", () => sthm(@ssrbool.addfb()))
  log.attempt("Ssrbool.addbF", () => sthm(@ssrbool.addbf()))
  log.attempt("Ssrbool.addbb", () => sthm(@ssrbool.addbb()))
  log.attempt("Ssrbool.addbC", () => sthm(@ssrbool.addbc()))
  log.attempt("Ssrbool.addbA", () => sthm(@ssrbool.addba()))
  log.attempt("Ssrbool.addbCA", () => sthm(@ssrbool.addbca()))
  log.attempt("Ssrbool.addbAC", () => sthm(@ssrbool.addbac()))
  log.attempt("Ssrbool.andb_addl", () => sthm(@ssrbool.andb_addl()))
  log.attempt("Ssrbool.andb_addr", () => sthm(@ssrbool.andb_addr()))
  log.attempt("Ssrbool.addKb", () => sthm(@ssrbool.addkb()))
  log.attempt("Ssrbool.addbK", () => sthm(@ssrbool.addbk()))
  log.attempt("Ssrbool.addIb", () => sthm(@ssrbool.addib()))
  log.attempt("Ssrbool.addbI", () => sthm(@ssrbool.addbi()))
  log.attempt("Ssrbool.addTb", () => sthm(@ssrbool.addtb()))
  log.attempt("Ssrbool.addbT", () => sthm(@ssrbool.addbt()))
  log.attempt("Ssrbool.addbN", () => sthm(@ssrbool.addbn()))
  log.attempt("Ssrbool.addNb", () => sthm(@ssrbool.addnb()))
  log.attempt("Ssrbool.subpred", () => sthm(@ssrbool.subpred()))
  log.attempt("Ssrbool.subrel", () => sthm(@ssrbool.subrel()))
  log.attempt("Ssrbool.pred0", () => sthm(@ssrbool.pred0()))
  log.attempt("Ssrbool.predT", () => sthm(@ssrbool.predt()))
  log.attempt("Ssrbool.predI", () => sthm(@ssrbool.predi()))
  log.attempt("Ssrbool.predU", () => sthm(@ssrbool.predu()))
  log.attempt("Ssrbool.predC", () => sthm(@ssrbool.predc()))
  log.attempt("Ssrbool.predD", () => sthm(@ssrbool.predd()))
  log.attempt("Ssrbool.preim", () => sthm(@ssrbool.preim()))
  log.attempt("Ssrbool.relU", () => sthm(@ssrbool.relu()))
  log.attempt("Ssrbool.subrelUl", () => sthm(@ssrbool.subrelul()))
  log.attempt("Ssrbool.subrelUr", () => sthm(@ssrbool.subrelur()))
  // END generated theorem list
  let tm = @term_syntax.parse_term
  log.attempt("types", () => {
    @kernel.types().map(p => p.0 + "/" + p.1.to_string()).to_array().join(" ")
  })
  log.attempt("constants", () => {
    @kernel.constants().map(c => c.0).to_array().join(" ")
  })
  log.attempt("definitions", () => @kernel.definitions().length().to_string())
  // BEGIN EXTRA
  // END EXTRA
  log.probe_counters()
  @testkit.check_axioms()
  inspect(
    @testkit.normalize_times(log.contents()),
    content=(
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Formal_ineqs/lib/ssrbool quotations (122):
      #|  :Bool
      #|  :Bool
      #|  (P : Bool) == (Q : Bool)
      #|  (P : Bool) \226\134\146 (Q : Bool)
      #|  (Q : Bool) \226\134\146 (P : Bool)
      #|  !(P : Bool) \226\134\146 !(Q : Bool)
      #|  !(Q : Bool) \226\134\146 !(P : Bool)
      #|  true
      #|  !false
      #|  (b : Bool) == false \226\134\146 !b
      #|  !(b : Bool) \226\134\146 b == false
      #|  (b : Bool) \226\134\146 !b == false
      #|  !(b : Bool) == false \226\134\146 b
      #|  !!(b : Bool) == b
      #|  !!(b : Bool) \226\134\146 b
      #|  !(b1 : Bool) == !(b2 : Bool) \226\134\146 b1 == b2
      #|  (b : Bool) == !(c : Bool) \226\134\146 !b == c
      #|  !(b : Bool) == (c : Bool) \226\134\146 b == !c
      #|  ((c : Bool) \226\134\146 (b : Bool)) \226\134\146 !b \226\134\146 !c
      #|  ((c : Bool) \226\134\146 !(b : Bool)) \226\134\146 b \226\134\146 !c
      #|  (!(c : Bool) \226\134\146 (b : Bool)) \226\134\146 !b \226\134\146 c
      #|  (!(c : Bool) \226\134\146 !(b : Bool)) \226\134\146 b \226\134\146 c
      #|  (!(b : Bool) \226\134\146 false) \226\134\146 b
      #|  (!(b : Bool) \226\134\146 b) \226\134\146 b
      #|  (!(c : Bool) \226\134\146 (b : Bool)) \226\134\146 b == false \226\134\146 c
      #|  ((c : Bool) \226\134\146 (b : Bool)) \226\134\146 b == false \226\134\146 !c
      #|  ((c : Bool) \226\134\146 !(b : Bool)) \226\134\146 b \226\134\146 c == false
      #|  ((c : Bool) \226\134\146 (b : Bool)) \226\134\146 !b \226\134\146 c == false
      #|  ((c : Bool) \226\134\146 (b : Bool)) \226\134\146 b == false \226\134\146 c == false
      #|  (isSome : (Option[_]) -> Bool)(NONE) == false && (\226\136\128 x : _, isSome(SOME(x)) == true)
      #|  :A
      #|  :A
      #|  :(A) -> B
      #|  :Bool
      #|  (if (b : Bool) { (vT : _) } else { vT }) == vT
      #|  (if !(b : Bool) { (vT : _) } else { (vF : _) }) == (if b { vF } else { vT })
      #|  (f : (_) -> _)(if (b : Bool) { (vT : _) } else { (vF : _) }) == (if b { f(vT) } else { f(vF) })
      #|  COND((b : Bool), (fT : (A) -> B), (fF : (A) -> B), (x : A)) == (if b { fT(x) } else { fF(x) })
      #|  (true && (b : Bool)) == b
      #|  (false && (b : Bool)) == false
      #|  ((b : Bool) && true) == b
      #|  ((b : Bool) && false) == false
      #|  ((b : Bool) && b) == b
      #|  ((b : Bool) && (c : Bool)) == (c && b)
      #|  ((b : Bool) && (c : Bool) && (p : Bool)) == ((b && c) && p)
      #|  ((b : Bool) && (c : Bool) && (p : Bool)) == (c && b && p)
      #|  (((b : Bool) && (c : Bool)) && (p : Bool)) == ((b && p) && c)
      #|  (true || (b : Bool)) == true
      #|  (false || (b : Bool)) == b
      #|  ((b : Bool) || true) == true
      #|  ((b : Bool) || false) == b
      #|  ((b : Bool) || b) == b
      #|  ((b : Bool) || (c : Bool)) == (c || b)
      #|  ((b : Bool) || (c : Bool) || (p : Bool)) == ((b || c) || p)
      #|  ((b : Bool) || (c : Bool) || (p : Bool)) == (c || b || p)
      #|  (((b : Bool) || (c : Bool)) || (p : Bool)) == ((b || p) || c)
      #|  ((b : Bool) && !b) == false
      #|  (!(b : Bool) && b) == false
      #|  (b : Bool) || !b
      #|  !(b : Bool) || b
      #|  (((b : Bool) || (c : Bool)) && (p : Bool)) == (b && p || c && p)
      #|  ((b : Bool) && ((c : Bool) || (p : Bool))) == (b && c || b && p)
      #|  ((b : Bool) && (c : Bool) || (p : Bool)) == ((b || p) && (c || p))
      #|  ((b : Bool) || (c : Bool) && (p : Bool)) == ((b || c) && (b || p))
      #|  ((b : Bool) \226\134\146 (a : Bool)) \226\134\146 (a && b) == b
      #|  ((a : Bool) \226\134\146 (b : Bool)) \226\134\146 (a && b) == a
      #|  ((a : Bool) \226\134\146 (b : Bool) == (c : Bool)) \226\134\146 (a && b) == (a && c)
      #|  ((b : Bool) \226\134\146 (a : Bool) == (c : Bool)) \226\134\146 (a && b) == (c && b)
      #|  ((a : Bool) \226\134\146 (b : Bool)) \226\134\146 (a || b) == b
      #|  ((b : Bool) \226\134\146 (a : Bool)) \226\134\146 (a || b) == a
      #|  (!(a : Bool) \226\134\146 (b : Bool) == (c : Bool)) \226\134\146 (a || b) == (a || c)
      #|  (!(b : Bool) \226\134\146 (a : Bool) == (c : Bool)) \226\134\146 (a || b) == (c || b)
      #|  !((a : Bool) && (b : Bool)) == (!a || !b)
      #|  !((a : Bool) || (b : Bool)) == (!a && !b)
      #|  ((a : Bool) && (b : Bool) || a) == a
      #|  ((a : Bool) || (b : Bool) && a) == a
      #|  (((a : Bool) || (b : Bool)) && a) == a
      #|  ((a : Bool) && ((b : Bool) || a)) == a
      #|  (b : Bool) \226\134\146 true
      #|  ((b : Bool) \226\134\146 false) == !b
      #|  false \226\134\146 (b : Bool)
      #|  (true \226\134\146 (b : Bool)) == b
      #|  (b : Bool) \226\134\146 b
      #|  !((a : Bool) \226\134\146 (b : Bool)) == (a && !b)
      #|  ((a : Bool) \226\134\146 (b : Bool)) == (!a || b)
      #|  (!(a : Bool) \226\134\146 (b : Bool)) == (a || b)
      #|  ((a : Bool) \226\134\146 !(b : Bool)) == (b \226\134\146 !a)
      #|  (!(a : Bool) \226\134\146 !(b : Bool)) == (b \226\134\146 a)
      #|  (!(a : Bool) \226\134\146 (b : Bool)) \226\134\146 (a \226\134\146 b) == b
      #|  ((b : Bool) \226\134\146 !(a : Bool)) \226\134\146 (a \226\134\146 b) == !a
      #|  ((a : Bool) \226\134\146 (b : Bool) == (c : Bool)) \226\134\146 (a \226\134\146 b) == (a \226\134\146 c)
      #|  (XOR : (Bool, Bool) -> Bool)((p : Bool), (q : Bool)) == (if p { !q } else { q })
      #|  XOR
      #|  false + (b : Bool) == b
      #|  (b : Bool) + false == b
      #|  (b : Bool) + b == false
      #|  (b : Bool) + (c : Bool) == c + b
      #|  (a : Bool) + ((b : Bool) + (c : Bool)) == a + b + c
      #|  (a : Bool) + (b : Bool) + (c : Bool) == a + c + b
      #|  (a : Bool) + ((b : Bool) + (c : Bool)) == b + (a + c)
      #|  ((a : Bool) + (b : Bool) && (c : Bool)) == (a && c) + (b && c)
      #|  ((a : Bool) && (b : Bool) + (c : Bool)) == (a && b) + (a && c)
      #|  (x : Bool) + (x + (y : Bool)) == y
      #|  (y : Bool) + (x : Bool) + x == y
      #|  (y1 : Bool) + (x : Bool) == (y2 : Bool) + x \226\134\146 y1 == y2
      #|  (x : Bool) + (y1 : Bool) == x + (y2 : Bool) \226\134\146 y1 == y2
      #|  true + (b : Bool) == !b
      #|  (b : Bool) + true == !b
      #|  (a : Bool) + !(b : Bool) == !(a + b)
      #|  !(a : Bool) + (b : Bool) == !(a + b)
      #|  (subpred : ((_) -> Bool, (_) -> Bool) -> Bool)((p1 : (_) -> Bool), (p2 : (_) -> Bool)) == (\226\136\128 x : _, p1(x) \226\134\146 p2(x))
      #|  (subrel : ((_, _) -> Bool, (_, _) -> Bool) -> Bool)((r1 : (_, _) -> Bool), (r2 : (_, _) -> Bool)) == (\226\136\128 x : _, \226\136\128 y : _, r1(x, y) \226\134\146 r2(x, y))
      #|  (pred0 : (_) -> Bool) == ((x : _) => false)
      #|  (predT : (_) -> Bool) == ((x : _) => true)
      #|  (predI : ((_) -> Bool, (_) -> Bool, _) -> Bool)((p1 : (_) -> Bool), (p2 : (_) -> Bool)) == ((x : _) => p1(x) && p2(x))
      #|  (predU : ((_) -> Bool, (_) -> Bool, _) -> Bool)((p1 : (_) -> Bool), (p2 : (_) -> Bool)) == ((x : _) => p1(x) || p2(x))
      #|  (predC : ((_) -> Bool, _) -> Bool)((p : (_) -> Bool)) == ((x : _) => !p(x))
      #|  (predD : ((_) -> Bool, (_) -> Bool, _) -> Bool)((p1 : (_) -> Bool), (p2 : (_) -> Bool)) == ((x : _) => !p2(x) && p1(x))
      #|  (preim : ((_) -> A, (A) -> Bool, _) -> Bool)((f : (_) -> A), (d : (A) -> Bool)) == ((x : _) => d(f(x)))
      #|  (relU : ((_, _) -> Bool, (_, _) -> Bool, _, _) -> Bool)((r1 : (_, _) -> Bool), (r2 : (_, _) -> Bool)) == ((x : _) => (y : _) => r1(x, y) || r2(x, y))
      #|  subrel((r1 : (_, _) -> Bool), relU(r1, (r2 : (_, _) -> Bool)))
      #|  subrel((r2 : (_, _) -> Bool), relU((r1 : (_, _) -> Bool), r2))
      #|Ssrbool.iffLR =  |- (#forall:fun(fun(bool,bool),bool) (\P:bool. (#forall:fun(fun(bool,bool),bool) (\Q:bool. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) P:bool) Q:bool)) ((#==>:fun(bool,fun(bool,bool)) P:bool) Q:bool))))))
      #|Ssrbool.iffRL =  |- (#forall:fun(fun(bool,bool),bool) (\Q:bool. (#forall:fun(fun(bool,bool),bool) (\P:bool. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) P:bool) Q:bool)) ((#==>:fun(bool,fun(bool,bool)) Q:bool) P:bool))))))
      #|Ssrbool.iffLRn =  |- (#forall:fun(fun(bool,bool),bool) (\P:bool. (#forall:fun(fun(bool,bool),bool) (\Q:bool. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) P:bool) Q:bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) P:bool)) (#~:fun(bool,bool) Q:bool)))))))
      #|Ssrbool.iffRLn =  |- (#forall:fun(fun(bool,bool),bool) (\Q:bool. (#forall:fun(fun(bool,bool),bool) (\P:bool. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) P:bool) Q:bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) Q:bool)) (#~:fun(bool,bool) P:bool)))))))
      #|Ssrbool.is_true_true =  |- #T:bool
      #|Ssrbool.not_false_is_true =  |- (#~:fun(bool,bool) #F:bool)
      #|Ssrbool.isT =  |- #T:bool
      #|Ssrbool.notF =  |- (#~:fun(bool,bool) #F:bool)
      #|Ssrbool.negbT =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) b:bool) #F:bool)) (#~:fun(bool,bool) b:bool))))
      #|Ssrbool.negbTE =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) ((#=:fun(bool,fun(bool,bool)) b:bool) #F:bool))))
      #|Ssrbool.negbF =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) b:bool) ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) #F:bool))))
      #|Ssrbool.negbFE =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) #F:bool)) b:bool)))
      #|Ssrbool.negbK =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#~:fun(bool,bool) b:bool))) b:bool)))
      #|Ssrbool.negbNE =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#~:fun(bool,bool) b:bool))) b:bool)))
      #|Ssrbool.negb_inj =  |- (#forall:fun(fun(bool,bool),bool) (\b1:bool. (#forall:fun(fun(bool,bool),bool) (\b2:bool. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b1:bool)) (#~:fun(bool,bool) b2:bool))) ((#=:fun(bool,fun(bool,bool)) b1:bool) b2:bool))))))
      #|Ssrbool.negbLR =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(bool,bool),bool) (\c:bool. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) b:bool) (#~:fun(bool,bool) c:bool))) ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) c:bool))))))
      #|Ssrbool.negbRL =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(bool,bool),bool) (\c:bool. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) c:bool)) ((#=:fun(bool,fun(bool,bool)) b:bool) (#~:fun(bool,bool) c:bool)))))))
      #|Ssrbool.contra =  |- (#forall:fun(fun(bool,bool),bool) (\c:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) c:bool) b:bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) (#~:fun(bool,bool) c:bool)))))))
      #|Ssrbool.contraNN =  |- (#forall:fun(fun(bool,bool),bool) (\c:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) c:bool) b:bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) (#~:fun(bool,bool) c:bool)))))))
      #|Ssrbool.contraL =  |- (#forall:fun(fun(bool,bool),bool) (\c:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) c:bool) (#~:fun(bool,bool) b:bool))) ((#==>:fun(bool,fun(bool,bool)) b:bool) (#~:fun(bool,bool) c:bool)))))))
      #|Ssrbool.contraR =  |- (#forall:fun(fun(bool,bool),bool) (\c:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) c:bool)) b:bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) c:bool))))))
      #|Ssrbool.contraLR =  |- (#forall:fun(fun(bool,bool),bool) (\c:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) c:bool)) (#~:fun(bool,bool) b:bool))) ((#==>:fun(bool,fun(bool,bool)) b:bool) c:bool))))))
      #|Ssrbool.contraT =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) #F:bool)) b:bool)))
      #|Ssrbool.wlog_neg =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) b:bool)) b:bool)))
      #|Ssrbool.contraFT =  |- (#forall:fun(fun(bool,bool),bool) (\c:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) c:bool)) b:bool)) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) b:bool) #F:bool)) c:bool))))))
      #|Ssrbool.contraFN =  |- (#forall:fun(fun(bool,bool),bool) (\c:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) c:bool) b:bool)) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) b:bool) #F:bool)) (#~:fun(bool,bool) c:bool)))))))
      #|Ssrbool.contraTF =  |- (#forall:fun(fun(bool,bool),bool) (\c:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) c:bool) (#~:fun(bool,bool) b:bool))) ((#==>:fun(bool,fun(bool,bool)) b:bool) ((#=:fun(bool,fun(bool,bool)) c:bool) #F:bool)))))))
      #|Ssrbool.contraNF =  |- (#forall:fun(fun(bool,bool),bool) (\c:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) c:bool) b:bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) ((#=:fun(bool,fun(bool,bool)) c:bool) #F:bool)))))))
      #|Ssrbool.contraFF =  |- (#forall:fun(fun(bool,bool),bool) (\c:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) c:bool) b:bool)) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) b:bool) #F:bool)) ((#=:fun(bool,fun(bool,bool)) c:bool) #F:bool)))))))
      #|Ssrbool.isSome =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) (#isSome:fun(option('?1),bool) #NONE:option('?1))) #F:bool)) (#forall:fun(fun('?1,bool),bool) (\x:'?1. ((#=:fun(bool,fun(bool,bool)) (#isSome:fun(option('?1),bool) (#SOME:fun('?1,option('?1)) x:'?1))) #T:bool))))
      #|Ssrbool.if_same =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun('A,bool),bool) (\vT:'A. ((#=:fun('A,fun('A,bool)) (((#COND:fun(bool,fun('A,fun('A,'A))) b:bool) vT:'A) vT:'A)) vT:'A)))))
      #|Ssrbool.if_neg =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun('A,bool),bool) (\vF:'A. (#forall:fun(fun('A,bool),bool) (\vT:'A. ((#=:fun('A,fun('A,bool)) (((#COND:fun(bool,fun('A,fun('A,'A))) (#~:fun(bool,bool) b:bool)) vT:'A) vF:'A)) (((#COND:fun(bool,fun('A,fun('A,'A))) b:bool) vF:'A) vT:'A))))))))
      #|Ssrbool.fun_if =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun('A,bool),bool) (\vT:'A. (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun('A,bool),bool) (\vF:'A. ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) (((#COND:fun(bool,fun('A,fun('A,'A))) b:bool) vT:'A) vF:'A))) (((#COND:fun(bool,fun('B,fun('B,'B))) b:bool) (f:fun('A,'B) vT:'A)) (f:fun('A,'B) vF:'A)))))))))))
      #|Ssrbool.if_arg =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(fun('A,'B),bool),bool) (\fT:fun('A,'B). (#forall:fun(fun(fun('A,'B),bool),bool) (\fF:fun('A,'B). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('B,fun('B,bool)) ((((#COND:fun(bool,fun(fun('A,'B),fun(fun('A,'B),fun('A,'B)))) b:bool) fT:fun('A,'B)) fF:fun('A,'B)) x:'A)) (((#COND:fun(bool,fun('B,fun('B,'B))) b:bool) (fT:fun('A,'B) x:'A)) (fF:fun('A,'B) x:'A)))))))))))
      #|Ssrbool.andTb =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) #T:bool) b:bool)) b:bool)))
      #|Ssrbool.andFb =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) #F:bool) b:bool)) #F:bool)))
      #|Ssrbool.andbT =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) #T:bool)) b:bool)))
      #|Ssrbool.andbF =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) #F:bool)) #F:bool)))
      #|Ssrbool.andbb =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) b:bool)) b:bool)))
      #|Ssrbool.andbC =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(bool,bool),bool) (\c:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) c:bool)) ((#/\:fun(bool,fun(bool,bool)) c:bool) b:bool))))))
      #|Ssrbool.andbA =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(bool,bool),bool) (\c:bool. (#forall:fun(fun(bool,bool),bool) (\p:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) ((#/\:fun(bool,fun(bool,bool)) c:bool) p:bool))) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) c:bool)) p:bool))))))))
      #|Ssrbool.andbCA =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(bool,bool),bool) (\c:bool. (#forall:fun(fun(bool,bool),bool) (\p:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) ((#/\:fun(bool,fun(bool,bool)) c:bool) p:bool))) ((#/\:fun(bool,fun(bool,bool)) c:bool) ((#/\:fun(bool,fun(bool,bool)) b:bool) p:bool)))))))))
      #|Ssrbool.andbAC =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(bool,bool),bool) (\c:bool. (#forall:fun(fun(bool,bool),bool) (\p:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) c:bool)) p:bool)) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) p:bool)) c:bool))))))))
      #|Ssrbool.orTb =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) #T:bool) b:bool)) #T:bool)))
      #|Ssrbool.orFb =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) #F:bool) b:bool)) b:bool)))
      #|Ssrbool.orbT =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) #T:bool)) #T:bool)))
      #|Ssrbool.orbF =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) #F:bool)) b:bool)))
      #|Ssrbool.orbb =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) b:bool)) b:bool)))
      #|Ssrbool.orbC =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(bool,bool),bool) (\c:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) c:bool)) ((#\/:fun(bool,fun(bool,bool)) c:bool) b:bool))))))
      #|Ssrbool.orbA =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(bool,bool),bool) (\c:bool. (#forall:fun(fun(bool,bool),bool) (\p:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) ((#\/:fun(bool,fun(bool,bool)) c:bool) p:bool))) ((#\/:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) c:bool)) p:bool))))))))
      #|Ssrbool.orbCA =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(bool,bool),bool) (\c:bool. (#forall:fun(fun(bool,bool),bool) (\p:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) ((#\/:fun(bool,fun(bool,bool)) c:bool) p:bool))) ((#\/:fun(bool,fun(bool,bool)) c:bool) ((#\/:fun(bool,fun(bool,bool)) b:bool) p:bool)))))))))
      #|Ssrbool.orbAC =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(bool,bool),bool) (\c:bool. (#forall:fun(fun(bool,bool),bool) (\p:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) c:bool)) p:bool)) ((#\/:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) p:bool)) c:bool))))))))
      #|Ssrbool.andbN =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) (#~:fun(bool,bool) b:bool))) #F:bool)))
      #|Ssrbool.andNb =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) b:bool)) #F:bool)))
      #|Ssrbool.orbN =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#\/:fun(bool,fun(bool,bool)) b:bool) (#~:fun(bool,bool) b:bool))))
      #|Ssrbool.orNb =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#\/:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) b:bool)))
      #|Ssrbool.andb_orl =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(bool,bool),bool) (\c:bool. (#forall:fun(fun(bool,bool),bool) (\p:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) c:bool)) p:bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) p:bool)) ((#/\:fun(bool,fun(bool,bool)) c:bool) p:bool)))))))))
      #|Ssrbool.andb_orr =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(bool,bool),bool) (\c:bool. (#forall:fun(fun(bool,bool),bool) (\p:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) ((#\/:fun(bool,fun(bool,bool)) c:bool) p:bool))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) c:bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) p:bool)))))))))
      #|Ssrbool.orb_andl =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(bool,bool),bool) (\c:bool. (#forall:fun(fun(bool,bool),bool) (\p:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) c:bool)) p:bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) p:bool)) ((#\/:fun(bool,fun(bool,bool)) c:bool) p:bool)))))))))
      #|Ssrbool.orb_andr =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(bool,bool),bool) (\c:bool. (#forall:fun(fun(bool,bool),bool) (\p:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) ((#/\:fun(bool,fun(bool,bool)) c:bool) p:bool))) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) c:bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) p:bool)))))))))
      #|Ssrbool.andb_idl =  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) b:bool) a:bool)) ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool)) b:bool))))))
      #|Ssrbool.andb_idr =  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool)) a:bool))))))
      #|Ssrbool.andb_id2l =  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(bool,bool),bool) (\c:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) a:bool) ((#=:fun(bool,fun(bool,bool)) b:bool) c:bool))) ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) c:bool)))))))))
      #|Ssrbool.andb_id2r =  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(bool,bool),bool) (\c:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) b:bool) ((#=:fun(bool,fun(bool,bool)) a:bool) c:bool))) ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#/\:fun(bool,fun(bool,bool)) c:bool) b:bool)))))))))
      #|Ssrbool.orb_idl =  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) a:bool) b:bool)) b:bool))))))
      #|Ssrbool.orbb_idr =  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) b:bool) a:bool)) ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) a:bool) b:bool)) a:bool))))))
      #|Ssrbool.orb_id2l =  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(bool,bool),bool) (\c:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) a:bool)) ((#=:fun(bool,fun(bool,bool)) b:bool) c:bool))) ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#\/:fun(bool,fun(bool,bool)) a:bool) c:bool)))))))))
      #|Ssrbool.orb_id2r =  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(bool,bool),bool) (\c:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) ((#=:fun(bool,fun(bool,bool)) a:bool) c:bool))) ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#\/:fun(bool,fun(bool,bool)) c:bool) b:bool)))))))))
      #|Ssrbool.negb_and =  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool))) ((#\/:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) a:bool)) (#~:fun(bool,bool) b:bool)))))))
      #|Ssrbool.negb_or =  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#\/:fun(bool,fun(bool,bool)) a:bool) b:bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) a:bool)) (#~:fun(bool,bool) b:bool)))))))
      #|Ssrbool.andbK =  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool)) a:bool)) a:bool)))))
      #|Ssrbool.andKb =  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) a:bool) ((#/\:fun(bool,fun(bool,bool)) b:bool) a:bool))) a:bool)))))
      #|Ssrbool.orbK =  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) a:bool) b:bool)) a:bool)) a:bool)))))
      #|Ssrbool.orKb =  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) ((#\/:fun(bool,fun(bool,bool)) b:bool) a:bool))) a:bool)))))
      #|Ssrbool.implybT =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) b:bool) #T:bool)))
      #|Ssrbool.implybF =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) b:bool) #F:bool)) (#~:fun(bool,bool) b:bool))))
      #|Ssrbool.implyFb =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) #F:bool) b:bool)))
      #|Ssrbool.implyTb =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) #T:bool) b:bool)) b:bool)))
      #|Ssrbool.implybb =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) b:bool) b:bool)))
      #|Ssrbool.negb_imply =  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#==>:fun(bool,fun(bool,bool)) a:bool) b:bool))) ((#/\:fun(bool,fun(bool,bool)) a:bool) (#~:fun(bool,bool) b:bool)))))))
      #|Ssrbool.implybE =  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#\/:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) a:bool)) b:bool))))))
      #|Ssrbool.implyNb =  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) a:bool)) b:bool)) ((#\/:fun(bool,fun(bool,bool)) a:bool) b:bool))))))
      #|Ssrbool.implybN =  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) a:bool) (#~:fun(bool,bool) b:bool))) ((#==>:fun(bool,fun(bool,bool)) b:bool) (#~:fun(bool,bool) a:bool)))))))
      #|Ssrbool.implybNN =  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) a:bool)) (#~:fun(bool,bool) b:bool))) ((#==>:fun(bool,fun(bool,bool)) b:bool) a:bool))))))
      #|Ssrbool.implyb_idl =  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) a:bool)) b:bool)) ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) a:bool) b:bool)) b:bool))))))
      #|Ssrbool.implyb_idr =  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) b:bool) (#~:fun(bool,bool) a:bool))) ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) a:bool) b:bool)) (#~:fun(bool,bool) a:bool)))))))
      #|Ssrbool.implyb_id2l =  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(bool,bool),bool) (\c:bool. ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) a:bool) ((#=:fun(bool,fun(bool,bool)) b:bool) c:bool))) ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#==>:fun(bool,fun(bool,bool)) a:bool) c:bool)))))))))
      #|Ssrbool.XOR_DEF =  |- (#forall:fun(fun(bool,bool),bool) (\p:bool. (#forall:fun(fun(bool,bool),bool) (\q:bool. ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) p:bool) q:bool)) (((#COND:fun(bool,fun(bool,fun(bool,bool))) p:bool) (#~:fun(bool,bool) q:bool)) q:bool))))))
      #|Ssrbool.addFb =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) #F:bool) b:bool)) b:bool)))
      #|Ssrbool.addbF =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) b:bool) #F:bool)) b:bool)))
      #|Ssrbool.addbb =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) b:bool) b:bool)) #F:bool)))
      #|Ssrbool.addbC =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(bool,bool),bool) (\c:bool. ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) b:bool) c:bool)) ((#XOR:fun(bool,fun(bool,bool)) c:bool) b:bool))))))
      #|Ssrbool.addbA =  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(bool,bool),bool) (\c:bool. ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) a:bool) ((#XOR:fun(bool,fun(bool,bool)) b:bool) c:bool))) ((#XOR:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) a:bool) b:bool)) c:bool))))))))
      #|Ssrbool.addbCA =  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(bool,bool),bool) (\c:bool. ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) a:bool) b:bool)) c:bool)) ((#XOR:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) a:bool) c:bool)) b:bool))))))))
      #|Ssrbool.addbAC =  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(bool,bool),bool) (\c:bool. ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) a:bool) ((#XOR:fun(bool,fun(bool,bool)) b:bool) c:bool))) ((#XOR:fun(bool,fun(bool,bool)) b:bool) ((#XOR:fun(bool,fun(bool,bool)) a:bool) c:bool)))))))))
      #|Ssrbool.andb_addl =  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(bool,bool),bool) (\c:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) a:bool) b:bool)) c:bool)) ((#XOR:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) c:bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) c:bool)))))))))
      #|Ssrbool.andb_addr =  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(bool,bool),bool) (\c:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) ((#XOR:fun(bool,fun(bool,bool)) b:bool) c:bool))) ((#XOR:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) c:bool)))))))))
      #|Ssrbool.addKb =  |- (#forall:fun(fun(bool,bool),bool) (\x:bool. (#forall:fun(fun(bool,bool),bool) (\y:bool. ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) x:bool) ((#XOR:fun(bool,fun(bool,bool)) x:bool) y:bool))) y:bool)))))
      #|Ssrbool.addbK =  |- (#forall:fun(fun(bool,bool),bool) (\x:bool. (#forall:fun(fun(bool,bool),bool) (\y:bool. ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) y:bool) x:bool)) x:bool)) y:bool)))))
      #|Ssrbool.addIb =  |- (#forall:fun(fun(bool,bool),bool) (\x:bool. (#forall:fun(fun(bool,bool),bool) (\y1:bool. (#forall:fun(fun(bool,bool),bool) (\y2:bool. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) y1:bool) x:bool)) ((#XOR:fun(bool,fun(bool,bool)) y2:bool) x:bool))) ((#=:fun(bool,fun(bool,bool)) y1:bool) y2:bool))))))))
      #|Ssrbool.addbI =  |- (#forall:fun(fun(bool,bool),bool) (\x:bool. (#forall:fun(fun(bool,bool),bool) (\y1:bool. (#forall:fun(fun(bool,bool),bool) (\y2:bool. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) x:bool) y1:bool)) ((#XOR:fun(bool,fun(bool,bool)) x:bool) y2:bool))) ((#=:fun(bool,fun(bool,bool)) y1:bool) y2:bool))))))))
      #|Ssrbool.addTb =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) #T:bool) b:bool)) (#~:fun(bool,bool) b:bool))))
      #|Ssrbool.addbT =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) b:bool) #T:bool)) (#~:fun(bool,bool) b:bool))))
      #|Ssrbool.addbN =  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) a:bool) (#~:fun(bool,bool) b:bool))) (#~:fun(bool,bool) ((#XOR:fun(bool,fun(bool,bool)) a:bool) b:bool)))))))
      #|Ssrbool.addNb =  |- (#forall:fun(fun(bool,bool),bool) (\a:bool. (#forall:fun(fun(bool,bool),bool) (\b:bool. ((#=:fun(bool,fun(bool,bool)) ((#XOR:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) a:bool)) b:bool)) (#~:fun(bool,bool) ((#XOR:fun(bool,fun(bool,bool)) a:bool) b:bool)))))))
      #|Ssrbool.subpred =  |- (#forall:fun(fun(fun('?2,bool),bool),bool) (\p1:fun('?2,bool). (#forall:fun(fun(fun('?2,bool),bool),bool) (\p2:fun('?2,bool). ((#=:fun(bool,fun(bool,bool)) ((#subpred:fun(fun('?2,bool),fun(fun('?2,bool),bool)) p1:fun('?2,bool)) p2:fun('?2,bool))) (#forall:fun(fun('?2,bool),bool) (\x:'?2. ((#==>:fun(bool,fun(bool,bool)) (p1:fun('?2,bool) x:'?2)) (p2:fun('?2,bool) x:'?2)))))))))
      #|Ssrbool.subrel =  |- (#forall:fun(fun(fun('?3,fun('?4,bool)),bool),bool) (\r1:fun('?3,fun('?4,bool)). (#forall:fun(fun(fun('?3,fun('?4,bool)),bool),bool) (\r2:fun('?3,fun('?4,bool)). ((#=:fun(bool,fun(bool,bool)) ((#subrel:fun(fun('?3,fun('?4,bool)),fun(fun('?3,fun('?4,bool)),bool)) r1:fun('?3,fun('?4,bool))) r2:fun('?3,fun('?4,bool)))) (#forall:fun(fun('?3,bool),bool) (\x:'?3. (#forall:fun(fun('?4,bool),bool) (\y:'?4. ((#==>:fun(bool,fun(bool,bool)) ((r1:fun('?3,fun('?4,bool)) x:'?3) y:'?4)) ((r2:fun('?3,fun('?4,bool)) x:'?3) y:'?4)))))))))))
      #|Ssrbool.pred0 =  |- ((#=:fun(fun('?5,bool),fun(fun('?5,bool),bool)) #pred0:fun('?5,bool)) (\x:'?5. #F:bool))
      #|Ssrbool.predT =  |- ((#=:fun(fun('?6,bool),fun(fun('?6,bool),bool)) #predT:fun('?6,bool)) (\x:'?6. #T:bool))
      #|Ssrbool.predI =  |- (#forall:fun(fun(fun('?7,bool),bool),bool) (\p1:fun('?7,bool). (#forall:fun(fun(fun('?7,bool),bool),bool) (\p2:fun('?7,bool). ((#=:fun(fun('?7,bool),fun(fun('?7,bool),bool)) ((#predI:fun(fun('?7,bool),fun(fun('?7,bool),fun('?7,bool))) p1:fun('?7,bool)) p2:fun('?7,bool))) (\x:'?7. ((#/\:fun(bool,fun(bool,bool)) (p1:fun('?7,bool) x:'?7)) (p2:fun('?7,bool) x:'?7))))))))
      #|Ssrbool.predU =  |- (#forall:fun(fun(fun('?8,bool),bool),bool) (\p1:fun('?8,bool). (#forall:fun(fun(fun('?8,bool),bool),bool) (\p2:fun('?8,bool). ((#=:fun(fun('?8,bool),fun(fun('?8,bool),bool)) ((#predU:fun(fun('?8,bool),fun(fun('?8,bool),fun('?8,bool))) p1:fun('?8,bool)) p2:fun('?8,bool))) (\x:'?8. ((#\/:fun(bool,fun(bool,bool)) (p1:fun('?8,bool) x:'?8)) (p2:fun('?8,bool) x:'?8))))))))
      #|Ssrbool.predC =  |- (#forall:fun(fun(fun('?9,bool),bool),bool) (\p:fun('?9,bool). ((#=:fun(fun('?9,bool),fun(fun('?9,bool),bool)) (#predC:fun(fun('?9,bool),fun('?9,bool)) p:fun('?9,bool))) (\x:'?9. (#~:fun(bool,bool) (p:fun('?9,bool) x:'?9))))))
      #|Ssrbool.predD =  |- (#forall:fun(fun(fun('?10,bool),bool),bool) (\p2:fun('?10,bool). (#forall:fun(fun(fun('?10,bool),bool),bool) (\p1:fun('?10,bool). ((#=:fun(fun('?10,bool),fun(fun('?10,bool),bool)) ((#predD:fun(fun('?10,bool),fun(fun('?10,bool),fun('?10,bool))) p1:fun('?10,bool)) p2:fun('?10,bool))) (\x:'?10. ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (p2:fun('?10,bool) x:'?10))) (p1:fun('?10,bool) x:'?10))))))))
      #|Ssrbool.preim =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\d:fun('A,bool). (#forall:fun(fun(fun('?11,'A),bool),bool) (\f:fun('?11,'A). ((#=:fun(fun('?11,bool),fun(fun('?11,bool),bool)) ((#preim:fun(fun('?11,'A),fun(fun('A,bool),fun('?11,bool))) f:fun('?11,'A)) d:fun('A,bool))) (\x:'?11. (d:fun('A,bool) (f:fun('?11,'A) x:'?11))))))))
      #|Ssrbool.relU =  |- (#forall:fun(fun(fun('?12,fun('?13,bool)),bool),bool) (\r1:fun('?12,fun('?13,bool)). (#forall:fun(fun(fun('?12,fun('?13,bool)),bool),bool) (\r2:fun('?12,fun('?13,bool)). ((#=:fun(fun('?12,fun('?13,bool)),fun(fun('?12,fun('?13,bool)),bool)) ((#relU:fun(fun('?12,fun('?13,bool)),fun(fun('?12,fun('?13,bool)),fun('?12,fun('?13,bool)))) r1:fun('?12,fun('?13,bool))) r2:fun('?12,fun('?13,bool)))) (\x:'?12. (\y:'?13. ((#\/:fun(bool,fun(bool,bool)) ((r1:fun('?12,fun('?13,bool)) x:'?12) y:'?13)) ((r2:fun('?12,fun('?13,bool)) x:'?12) y:'?13)))))))))
      #|Ssrbool.subrelUl =  |- (#forall:fun(fun(fun('?14,fun('?15,bool)),bool),bool) (\r1:fun('?14,fun('?15,bool)). (#forall:fun(fun(fun('?14,fun('?15,bool)),bool),bool) (\r2:fun('?14,fun('?15,bool)). ((#subrel:fun(fun('?14,fun('?15,bool)),fun(fun('?14,fun('?15,bool)),bool)) r1:fun('?14,fun('?15,bool))) ((#relU:fun(fun('?14,fun('?15,bool)),fun(fun('?14,fun('?15,bool)),fun('?14,fun('?15,bool)))) r1:fun('?14,fun('?15,bool))) r2:fun('?14,fun('?15,bool))))))))
      #|Ssrbool.subrelUr =  |- (#forall:fun(fun(fun('?16,fun('?17,bool)),bool),bool) (\r1:fun('?16,fun('?17,bool)). (#forall:fun(fun(fun('?16,fun('?17,bool)),bool),bool) (\r2:fun('?16,fun('?17,bool)). ((#subrel:fun(fun('?16,fun('?17,bool)),fun(fun('?16,fun('?17,bool)),bool)) r2:fun('?16,fun('?17,bool))) ((#relU:fun(fun('?16,fun('?17,bool)),fun(fun('?16,fun('?17,bool)),fun('?16,fun('?17,bool)))) r1:fun('?16,fun('?17,bool))) r2:fun('?16,fun('?17,bool))))))))
      #|types = multivector/1 matroid/1 group/1 frag/1 metric/1 net/1 topology/1 tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = relU preim predD predC predU predI predT pred0 subrel subpred XOR isSome associative idempotent commutative self_inverse rev_left_loop left_loop right_distributive left_commutative right_zero left_id rev_right_loop right_loop left_distributive right_commutative left_zero right_id right_injective left_injective right_inverse left_inverse involutive bijective ocancel pcancel cancel injective pcomp omap obind odflt oapp ssreflect_eq error_mul_f1 error_mul_f2 list_sum2 list_sum ddmatan dmatan matan halfatn4 halfatn poly_f_odd poly_f_even poly_f real_zero l_seq TABLE REVERSE_TABLE mod_plus arith_base float_num min_exp interval_gt interval_neg interval_pos interval_not_zero iabs bounded_on_int bounded_on interval_arith num_exp D199 D198 D197 D196 D195 D194 D193 D192 D191 D190 D189 D188 D187 D186 D185 D184 D183 D182 D181 D180 D179 D178 D177 D176 D175 D174 D173 D172 D171 D170 D169 D168 D167 D166 D165 D164 D163 D162 D161 D160 D159 D158 D157 D156 D155 D154 D153 D152 D151 D150 D149 D148 D147 D146 D145 D144 D143 D142 D141 D140 D139 D138 D137 D136 D135 D134 D133 D132 D131 D130 D129 D128 D127 D126 D125 D124 D123 D122 D121 D120 D119 D118 D117 D116 D115 D114 D113 D112 D111 D110 D109 D108 D107 D106 D105 D104 D103 D102 D101 D100 D99 D98 D97 D96 D95 D94 D93 D92 D91 D90 D89 D88 D87 D86 D85 D84 D83 D82 D81 D80 D79 D78 D77 D76 D75 D74 D73 D72 D71 D70 D69 D68 D67 D66 D65 D64 D63 D62 D61 D60 D59 D58 D57 D56 D55 D54 D53 D52 D51 D50 D49 D48 D47 D46 D45 D44 D43 D42 D41 D40 D39 D38 D37 D36 D35 D34 D33 D32 D31 D30 D29 D28 D27 D26 D25 D24 D23 D22 D21 D20 D19 D18 D17 D16 D15 D14 D13 D12 D11 D10 D9 D8 D7 D6 D5 D4 D3 D2 D1 D0 NUM200 real_variation has_bounded_real_variation_on real_lebesgue_measurable real_measurable_on bernoulli vector_polynomial_function real_polynomial_function bernstein slice real_measure real_measurable has_real_measure absolutely_real_integrable_on real_negligible real_integral real_integrable_on has_real_integral real_log_convex_on log_convex_on real_convex_on open_real_segment closed_real_segment has_liminf has_limsup real_differentiable_on higher_real_derivative real_derivative real_differentiable has_real_derivative real_uniformly_continuous_on real_continuous_on real_continuous atreal binom rpow root acs asn cacs casn atn catn unwinding cpow clog tan ctan rotate2d Arg pi log cos sin exp csin ccos cexp analytic_on holomorphic_on higher_complex_derivative complex_derivative complex_differentiable has_complex_derivative cproduct real csqrt cnj complex_pow complex_div complex_inv complex_mul ii Cx complex Im Re lebesgue_measurable measurable_on measure measurable has_measure path_length rectifiable_path absolutely_continuous_on absolutely_setcontinuous_on vector_variation has_bounded_variation_on equiintegrable_on absolutely_integrable_on has_bounded_setvariation_on set_variation negligible division_points lifted operative integral integrable_on has_integral has_integral_compact_interval fine tagged_division_of tagged_partial_division_of division_of gauge content interval_lowerbound interval_upperbound reversion outermorphism seqiterate inner outer geom_mul Product grade multivector multivec mbasis lambdas $$ codeset setcode dest_multivector mk_multivector binarysum bitset vector_derivative has_vector_derivative jacobian frechet_derivative differentiable_on differentiable has_derivative interval_bij ENR ANR AR retract_of retraction brouwer_degree brouwer_degree1 triangulation simplicial_complex simplex polyhedron polytope edge_of facet_of extreme_point_of exposed_face_of face_of covering_space dimension contractible homotopy_equivalent fundamental_group simply_connected homotopic_loops homotopic_paths outside inside path_connected path_components path_component linepath subpath shiftpath arc simple_path ++ reversepath path_image pathfinish pathstart path barycentre relative_frontier relative_interior starlike epigraph convex_cone polar_dual aff_dim convex_on coplanar affine_dependent conic convex affine analytic borel_measurable_on baire borel fsigma gdelta locally hausdist setdist closest_point summable infsum sums homeomorphic homeomorphism is_interval diameter components connected_component uniformly_continuous_on continuous_on continuous complete cauchy compact bounded condensation_point_of lim --> in_direction at_neginfinity at_posinfinity at_infinity at frontier closure interior limit_point_of connected open_segment closed_segment manhattan sphere cball ball closed euclidean_metric euclidean open reflect_along rotoinversion_matrix rotation_matrix orthogonal_matrix orthogonal_transformation positive_definite positive_semidefinite diagonal_matrix cofactor det trace sign evenperm permutation swapseq three_cycle swap inverse permutes closed_interval open_interval midpoint between collinear infnorm matrix_inv rank columnvector rowvector euclidean_matroid dim independent dependent span subspace pushin dropout indicator drop lift onorm matrix invertible normal_matrix symmetric_matrix columns rows column row transp mat vector_matrix_mul matrix_vector_mul matrix_mul matrix_sub matrix_add matrix_neg %% adjoint bilinear linear orthogonal basis vsum distance vector_norm dot vec % vector_neg vector_sub vector_add matroid_dim matroid_finite_dim matroid_dimension matroid_finite_dimensional submatroid matroid_subspace matroid_dependent matroid_basis matroid_independent matroid_spanning matroid_span matroid_set dest_matroid matroid brouwer_degree2 reduced_homology_group hom_relboundary hom_induced hom_boundary homology_group relative_homology_group relcycle_group chain_group singular_subdivision simplicial_subdivision simplicial_vertex simplicial_cone simplex_cone simplicial_chain simplicial_simplex oriented_simplex chain_map simplex_map homologous_rel singular_relboundary singular_relcycle mod_subset chain_boundary singular_chain singular_face singular_simplex simplicial_face standard_simplex short_exact_sequence group_exactness solvable_group free_abelian_group pgroup integer_mod_group integer_group finitely_generated_group cyclic_group group_element_order trivial_homomorphism group_image group_kernel quotient_group group_normalizer group_centralizer group_conjugate normal_subgroup_of left_coset right_coset group_orbit group_stabilizer group_action group_setmul group_setinv isomorphic_group group_automorphism group_isomorphism group_isomorphisms group_endomorphism group_epimorphism group_monomorphism group_homomorphism sum_group product_group prod_group subgroup_generated subgroup_of group_conjugation group_sum group_product group_nmul group_add group_neg abelian_group group_zpow group_pow group_div opposite_group trivial_group singleton_group group_mul group_inv group_id group_carrier group_operations group index frag_extend frag_sub frag_add frag_cmul frag_neg frag_of frag_0 frag_support dest_frag mk_frag cantor_set cantor_map cantor_term cantor_space dimension_le sigma_locally_finite_in paracompact_space cfunspace funspace nsphere euclidean_space capped_metric fccoverable_in ulc_space fccoverable_space mdiameter cauchy_continuous_map uniformly_continuous_map lipschitz_continuous_map prod_metric completely_metrizable_space contractible_space homotopy_equivalent_space homotopic_with alexandroff_compactification kification k_space quasi_components_of quasi_component_of locally_connected_space locally_connected_at weakly_locally_connected_at locally_path_connected_space locally_path_connected_at weakly_locally_path_connected_at completely_regular_space normal_space path_components_of path_component_of path_connected_in path_connected_space path_in real_summable real_infsum real_sums reallim ---> topcontinuous_at totally_bounded_in mcomplete cauchy_in limit atpointof real_compact real_bounded real_euclidean_metric euclideanreal real_closed real_open locally_compact_space regular_space kolmogorov_quotient t0_space neighbourhood_base_of neighbourhood_base_at monotone_map connected_components_of connected_component_of separated_between connected_in connected_space metrizable_space discrete_metric mbounded msphere mcball mtopology submetric mball mdist mspace dest_metric metric is_metric_space borel_measurable_map borel_in gdelta_in fsigma_in sequentially trivial_limit eventually within netlimit netlimits netfilter dest_net mk_net separable_space first_countable second_countable lindelof_space perfect_map proper_map kc_space hausdorff_space t1_space separated_in compact_space compact_in retract_of_space retraction_map section_map retraction_maps embedding_map homeomorphic_space homeomorphic_maps homeomorphic_map sum_topology product_topology prod_topology quotient_map closed_map open_map continuous_map locally_finite_in frontier_of interior_of closure_of derived_set_of hereditarily subtopology discrete_space discrete_topology closed_in topspace open_in topology istopology ITER suslin suslin_operation relative_to from hull matrify vectorize closed_real_interval open_real_interval is_realinterval frac floor rational ^_c *_c +_c ordinal linseg inseg properly strictly antichain chain wqoset woset toset poset qoset fld superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 1112
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?18
      #|counter_genvar = _3719611:bool
      #|
    ),
  )
}
