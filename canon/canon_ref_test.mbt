// Load-fidelity and behaviour test for canon.ml: replays
// tools/ocaml_ref/canon_ref.ml (keep in sync; refresh with tools/ocaml_ref/refresh_ref.py).

///|
using @testkit {stm, sthm}

///|
test "canon matches canon.ml" {
  let log = @testkit.Log::new()
  log.capture_reports()
  for th in ["simp", "theorems", "ind_defs", "class", "trivia", "canon"] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("canon")
  // BEGIN generated theorem list
  // END generated theorem list
  let tm = @term_syntax.parse_term
  let cv = (name : String, c : @equal.Conv, s : String) => {
    log.attempt(name, () => {
      let t = tm(s)
      sthm(c(t))
    })
  }
  let fol = "(∀ x : A, (P : (A) -> Bool)(x) → (∃ y : A, (Q : (A, A) -> Bool)(x, y))) && !(∃ z : A, (R : (A) -> Bool)(z) && P(z) == Q(z, z))"
  cv("PRESIMP_CONV", @canon.presimp_conv, "!((a : Bool) && !(b : Bool)) → true && (c : Bool) || false")
  cv("NNF_CONV", @canon.nnf_conv, fol)
  cv("NNFC_CONV", @canon.nnfc_conv, "!((p : Bool) == (q : Bool)) || (r : Bool) == !(s : Bool)")
  cv("NNF_CONV_eq", @canon.nnf_conv, "!((p : Bool) == (q : Bool)) || (r : Bool) == !(s : Bool)")
  cv("SKOLEM_CONV", @canon.skolem_conv, "∀ x : A, ∃ y : B, (P : (A, B) -> Bool)(x, y) && (∃ z : C, (Q : (A, C) -> Bool)(x, z))")
  cv("PRENEX_CONV", @canon.prenex_conv, "(∀ x : A, (P : (A) -> Bool)(x)) && (∃ y : A, (Q : (A) -> Bool)(y)) → (R : Bool)")
  cv("WEAK_DNF_CONV", @canon.weak_dnf_conv, "((a : Bool) || (b : Bool)) && ((c : Bool) || (d : Bool))")
  cv("DNF_CONV", @canon.dnf_conv, "((a : Bool) || (b : Bool)) && ((c : Bool) || a)")
  cv("WEAK_CNF_CONV", @canon.weak_cnf_conv, "(a : Bool) && (b : Bool) || (c : Bool) && (d : Bool)")
  cv("CNF_CONV", @canon.cnf_conv, "(a : Bool) && (b : Bool) || (c : Bool) && a")
  cv("CONJ_CANON_CONV", @canon.conj_canon_conv, "((b : Bool) && (a : Bool)) && a && (c : Bool)")
  cv("DISJ_CANON_CONV", @canon.disj_canon_conv, "((b : Bool) || (a : Bool)) || a || (c : Bool)")
  cv("CONJ_ACI_RULE", @canon.conj_aci_rule, "(((a : Bool) && (b : Bool)) && (c : Bool)) == (c && b && a)")
  cv("DISJ_ACI_RULE", @canon.disj_aci_rule, "(((a : Bool) || (b : Bool)) || (c : Bool)) == (c || b || a)")
  cv(
    "LAMBDA_ELIM_CONV", @canon.lambda_elim_conv, "(P : ((A) -> B) -> Bool)((x : A) => (f : (A, _) -> B)(x, (y : _)))",
  )
  cv(
    "CONDS_ELIM_CONV", @canon.conds_elim_conv, "(P : (A) -> Bool)(if (b : Bool) { (x : A) } else { (y : A) }) && (c : Bool)",
  )
  cv(
    "CONDS_CELIM_CONV", @canon.conds_celim_conv, "(P : (A) -> Bool)(if (b : Bool) { (x : A) } else { (y : A) }) && (c : Bool)",
  )
  log.attempt("ASSOC_CONV", () => {
    let t = tm("((a : Bool) && (b : Bool)) && (c : Bool) && (d : Bool)")
    sthm(@canon.assoc_conv(@theorems.conj_assoc())(t))
  })
  log.attempt("PROP_ATOM_CONV", () => {
    let t = tm("(a : Bool) && !((b : Bool) → ((x : Bool) => x)((c : Bool)))")
    sthm(@canon.prop_atom_conv(@equal.depth_conv(@equal.beta_conv), t))
  })
  log.attempt("GEN_NNF_CONV", () => {
    let t = tm("!((p : Bool) && ((q : Bool) || !(r : Bool)))")
    let c = @canon.gen_nnf_conv(true)(
      (@equal.all_conv, t => (@kernel.refl(t), @kernel.refl(t))),
    )
    sthm(c(t))
  })
  log.attempt("SELECT_ELIM_TAC", () => {
    let w = tm("(P : (A) -> Bool)(select((x : A) => P(x))) → (Q : Bool)")
    let (_, gls, _) = @canon.select_elim_tac((@list.List([]), w))
    "[" + gls.map(g => stm(g.1)).to_array().join("; ") + "]"
  })
  log.attempt("ASM_FOL_TAC", () => {
    let w = tm("(∀ x : A, (P : (A) -> Bool)(x)) → P((a : A))")
    let tac = @tactics.then_tac(@tactics.disch_tac, g => @canon.asm_fol_tac(g))
    let (_, gls, _) = tac((@list.List([]), w))
    "[" +
    gls
    .map(g => {
      "[" +
      g.0.map(p => stm(@kernel.concl(p.1))).to_array().join("; ") +
      "] ?- " +
      stm(g.1)
    })
    .to_array()
    .join("; ") +
    "]"
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
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|canon quotations (48):
      #|  !((a : Bool) || (b : Bool)) \226\134\146 !a
      #|  !((a : Bool) || (b : Bool)) \226\134\146 !b
      #|  !(a : Bool) \226\134\146 !(b : Bool) \226\134\146 !(a || b)
      #|  !(a : Bool) == !(b : Bool) \226\134\146 a == b
      #|  (a : Bool)
      #|  (b : Bool)
      #|  op_slash_bslash
      #|  op_bslash_slash
      #|  op_tilde
      #|  !!(p : Bool) == p
      #|  !((p : Bool) && (q : Bool)) == (!p || !q)
      #|  !((p : Bool) || (q : Bool)) == (!p && !q)
      #|  ((p : Bool) \226\134\146 (q : Bool)) == (!p || q)
      #|  !((p : Bool) \226\134\146 (q : Bool)) == (p && !q)
      #|  ((p : Bool) == (q : Bool)) == (p && q || !p && !q)
      #|  !((p : Bool) == (q : Bool)) == (p && !q || !p && q)
      #|  ((p : Bool) == (q : Bool)) == ((p || !q) && (!p || q))
      #|  !((p : Bool) == (q : Bool)) == ((p || q) && (!p || !q))
      #|  !forall((P : (A) -> Bool)) == (\226\136\131 x : A, !P(x)) && !op_q(P) == (\226\136\128 x : A, !P(x)) && !existsunique(P) == ((\226\136\128 x : A, !P(x)) || (\226\136\131 x : A, \226\136\131 y : A, P(x) && P(y) && !(y == x)))
      #|  ((a : Bool) && (b : Bool) \226\134\146 (c : Bool)) == (!a || !b || c)
      #|  existsunique((P : (A) -> Bool)) == ((\226\136\131 x : A, P(x)) && (\226\136\128 x : A, \226\136\128 y : A, !P(x) || !P(y) || y == x))
      #|  (p : Bool)
      #|  (q : Bool)
      #|  ((a : Bool) && ((b : Bool) || (c : Bool))) == (a && b || a && c)
      #|  (((a : Bool) || (b : Bool)) && (c : Bool)) == (a && c || b && c)
      #|  (a : Bool)
      #|  (b : Bool)
      #|  (c : Bool)
      #|  op_bslash_slash
      #|  ((a : Bool) || (b : Bool) && (c : Bool)) == ((a || b) && (a || c))
      #|  ((a : Bool) && (b : Bool) || (c : Bool)) == ((a || c) && (b || c))
      #|  (a : Bool)
      #|  (b : Bool)
      #|  (c : Bool)
      #|  op_slash_bslash
      #|  (P : (A) -> Bool)(select(P)) == op_q(P)
      #|  (P : (A) -> Bool)
      #|  (P : (A) -> Bool)
      #|  (P : (A) -> Bool)
      #|  ((s : (_) -> _) == ((x : _) => (t : (_) -> _)(x))) == (\226\136\128 x : _, s(x) == t(x))
      #|  (\226\136\128 a : _, a == (c : _) \226\134\146 (P : Bool) == (Q : (_) -> Bool)(a)) \226\134\146 P == (\226\136\128 a : _, a == c \226\134\146 Q(a))
      #|  (b : Bool)
      #|  ((b : Bool) == false \226\134\146 (x : Bool) == (x0 : Bool)) && (b == true \226\134\146 x == (x1 : Bool)) \226\134\146 x == (b && x1 || !b && x0)
      #|  (b : Bool)
      #|  ((b : Bool) == false \226\134\146 (x : Bool) == (x0 : Bool)) && (b == true \226\134\146 x == (x1 : Bool)) \226\134\146 x == ((!b || x1) && (b || x0))
      #|  false
      #|  true
      #|  \226\136\128 f : (A) -> B, \226\136\128 x : A, f(x) == I(f, x)
      #|PRESIMP_CONV =  |- ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#/\:fun(bool,fun(bool,bool)) a:bool) (#~:fun(bool,bool) b:bool)))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) #T:bool) c:bool)) #F:bool))) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#/\:fun(bool,fun(bool,bool)) a:bool) (#~:fun(bool,bool) b:bool)))) c:bool))
      #|NNF_CONV =  |- ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (#?:fun(fun('A,bool),bool) (\y:'A. ((Q:fun('A,fun('A,bool)) x:'A) y:'A))))))) (#~:fun(bool,bool) (#?:fun(fun('A,bool),bool) (\z:'A. ((#/\:fun(bool,fun(bool,bool)) (R:fun('A,bool) z:'A)) ((#=:fun(bool,fun(bool,bool)) (P:fun('A,bool) z:'A)) ((Q:fun('A,fun('A,bool)) z:'A) z:'A)))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#\/:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (P:fun('A,bool) x:'A))) (#?:fun(fun('A,bool),bool) (\y:'A. ((Q:fun('A,fun('A,bool)) x:'A) y:'A))))))) (#forall:fun(fun('A,bool),bool) (\z:'A. ((#\/:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (R:fun('A,bool) z:'A))) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (P:fun('A,bool) z:'A)) ((Q:fun('A,fun('A,bool)) z:'A) z:'A))) ((#\/:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (P:fun('A,bool) z:'A))) (#~:fun(bool,bool) ((Q:fun('A,fun('A,bool)) z:'A) z:'A)))))))))
      #|NNFC_CONV =  |- ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(bool,fun(bool,bool)) p:bool) q:bool))) ((#=:fun(bool,fun(bool,bool)) r:bool) (#~:fun(bool,bool) s:bool)))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) p:bool) q:bool)) ((#\/:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) p:bool)) (#~:fun(bool,bool) q:bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) r:bool) s:bool)) ((#\/:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) r:bool)) (#~:fun(bool,bool) s:bool)))))
      #|NNF_CONV_eq =  |- ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(bool,fun(bool,bool)) p:bool) q:bool))) ((#=:fun(bool,fun(bool,bool)) r:bool) (#~:fun(bool,bool) s:bool)))) ((#\/:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) (#~:fun(bool,bool) q:bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) p:bool)) q:bool))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) r:bool) (#~:fun(bool,bool) s:bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) r:bool)) s:bool))))
      #|SKOLEM_CONV =  |- ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('B,bool),bool) (\y:'B. ((#/\:fun(bool,fun(bool,bool)) ((P:fun('A,fun('B,bool)) x:'A) y:'B)) (#?:fun(fun('C,bool),bool) (\z:'C. ((Q:fun('A,fun('C,bool)) x:'A) z:'C))))))))) (#?:fun(fun(fun('A,'B),bool),bool) (\y:fun('A,'B). (#?:fun(fun(fun('A,'C),bool),bool) (\z:fun('A,'C). ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((P:fun('A,fun('B,bool)) x:'A) (y:fun('A,'B) x:'A))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((Q:fun('A,fun('C,bool)) x:'A) (z:fun('A,'C) x:'A))))))))))
      #|PRENEX_CONV =  |- ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))) (#?:fun(fun('A,bool),bool) (\y:'A. (Q:fun('A,bool) y:'A))))) R:bool)) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('A,bool),bool) (\y:'A. ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (Q:fun('A,bool) y:'A))))))) R:bool))
      #|WEAK_DNF_CONV =  |- ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#\/:fun(bool,fun(bool,bool)) c:bool) d:bool))) ((#\/:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) c:bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) c:bool))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) d:bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) d:bool))))
      #|DNF_CONV =  |- ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#\/:fun(bool,fun(bool,bool)) c:bool) a:bool))) ((#\/:fun(bool,fun(bool,bool)) a:bool) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) c:bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) c:bool)))))
      #|WEAK_CNF_CONV =  |- ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#/\:fun(bool,fun(bool,bool)) c:bool) d:bool))) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) a:bool) c:bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) c:bool))) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) a:bool) d:bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) d:bool))))
      #|CNF_CONV =  |- ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#/\:fun(bool,fun(bool,bool)) c:bool) a:bool))) ((#/\:fun(bool,fun(bool,bool)) a:bool) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) a:bool) c:bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) c:bool)))))
      #|CONJ_CANON_CONV =  |- ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) a:bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) c:bool))) ((#/\:fun(bool,fun(bool,bool)) a:bool) ((#/\:fun(bool,fun(bool,bool)) b:bool) c:bool)))
      #|DISJ_CANON_CONV =  |- ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) a:bool)) ((#\/:fun(bool,fun(bool,bool)) a:bool) c:bool))) ((#\/:fun(bool,fun(bool,bool)) a:bool) ((#\/:fun(bool,fun(bool,bool)) b:bool) c:bool)))
      #|CONJ_ACI_RULE =  |- ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool)) c:bool)) ((#/\:fun(bool,fun(bool,bool)) c:bool) ((#/\:fun(bool,fun(bool,bool)) b:bool) a:bool)))
      #|DISJ_ACI_RULE =  |- ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) a:bool) b:bool)) c:bool)) ((#\/:fun(bool,fun(bool,bool)) c:bool) ((#\/:fun(bool,fun(bool,bool)) b:bool) a:bool)))
      #|Warning: inventing type variables
      #|LAMBDA_ELIM_CONV =  |- ((#=:fun(bool,fun(bool,bool)) (P:fun(fun('A,'B),bool) (\x:'A. ((f:fun('A,fun('?1,'B)) x:'A) y:'?1)))) (#forall:fun(fun(fun(fun('A,fun('?1,'B)),fun('?1,fun('A,'B))),bool),bool) (\_602:fun(fun('A,fun('?1,'B)),fun('?1,fun('A,'B))). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(fun('A,fun('?1,'B)),bool),bool) (\f:fun('A,fun('?1,'B)). (#forall:fun(fun('?1,bool),bool) (\y:'?1. (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('B,fun('B,bool)) (((_602:fun(fun('A,fun('?1,'B)),fun('?1,fun('A,'B))) f:fun('A,fun('?1,'B))) y:'?1) x:'A)) ((f:fun('A,fun('?1,'B)) x:'A) y:'?1))))))))) (P:fun(fun('A,'B),bool) ((_602:fun(fun('A,fun('?1,'B)),fun('?1,fun('A,'B))) f:fun('A,fun('?1,'B))) y:'?1))))))
      #|CONDS_ELIM_CONV =  |- ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) (((#COND:fun(bool,fun('A,fun('A,'A))) b:bool) x:'A) y:'A))) c:bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) b:bool) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) c:bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) y:'A)) c:bool))))
      #|CONDS_CELIM_CONV =  |- ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) (((#COND:fun(bool,fun('A,fun('A,'A))) b:bool) x:'A) y:'A))) c:bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) c:bool))) ((#\/:fun(bool,fun(bool,bool)) b:bool) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) y:'A)) c:bool))))
      #|ASSOC_CONV =  |- ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#/\:fun(bool,fun(bool,bool)) c:bool) d:bool))) ((#/\:fun(bool,fun(bool,bool)) a:bool) ((#/\:fun(bool,fun(bool,bool)) b:bool) ((#/\:fun(bool,fun(bool,bool)) c:bool) d:bool))))
      #|PROP_ATOM_CONV =  |- ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) (#~:fun(bool,bool) ((#==>:fun(bool,fun(bool,bool)) b:bool) ((\x:bool. x:bool) c:bool))))) ((#/\:fun(bool,fun(bool,bool)) a:bool) (#~:fun(bool,bool) ((#==>:fun(bool,fun(bool,bool)) b:bool) c:bool))))
      #|GEN_NNF_CONV =  |- ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#/\:fun(bool,fun(bool,bool)) p:bool) ((#\/:fun(bool,fun(bool,bool)) q:bool) (#~:fun(bool,bool) r:bool))))) ((#\/:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) p:bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) q:bool)) r:bool)))
      #|SELECT_ELIM_TAC = [((#==>:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))) Q:bool)]
      #|ASM_FOL_TAC = [[(#forall:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))] ?- (P:fun('A,bool) a:'A)]
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?2
      #|counter_genvar = _603:bool
      #|
    ),
  )
}
