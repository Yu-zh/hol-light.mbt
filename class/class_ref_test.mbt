// Load-fidelity and behaviour test for class.ml: replays
// tools/ocaml_ref/class_ref.ml (keep in sync; refresh with tools/ocaml_ref/refresh_ref.py).

///|
using @testkit {stm, sthm, ocaml_escaped}

///|
fn sgoal(gl : @tactics.Goal) -> String raise {
  let b = StringBuilder()
  let f = @pp.formatter_of_buffer(b)
  @tactics.pp_print_goal(f, gl)
  f.print_flush()
  ocaml_escaped(b.to_string())
}

///|
test "class matches class.ml" {
  let log = @testkit.Log::new()
  log.capture_reports()
  for th in ["simp", "theorems", "ind_defs", "class"] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("class")
  // BEGIN generated theorem list
  log.attempt("ETA_AX", () => sthm(@class.eta_ax()))
  log.attempt("EQ_EXT", () => sthm(@class.eq_ext()))
  log.attempt("FUN_EQ_THM", () => sthm(@class.fun_eq_thm()))
  log.attempt("SELECT_AX", () => sthm(@class.select_ax()))
  log.attempt("EXISTS_THM", () => sthm(@class.exists_thm()))
  log.attempt("SELECT_REFL", () => sthm(@class.select_refl()))
  log.attempt("SELECT_UNIQUE", () => sthm(@class.select_unique()))
  log.attempt("EXCLUDED_MIDDLE", () => sthm(@class.excluded_middle()))
  log.attempt("BOOL_CASES_AX", () => sthm(@class.bool_cases_ax()))
  log.attempt("DE_MORGAN_THM", () => sthm(@class.de_morgan_thm()))
  log.attempt("NOT_CLAUSES", () => sthm(@class.not_clauses()))
  log.attempt("NOT_IMP", () => sthm(@class.not_imp()))
  log.attempt("CONTRAPOS_THM", () => sthm(@class.contrapos_thm()))
  log.attempt("NOT_EXISTS_THM", () => sthm(@class.not_exists_thm()))
  log.attempt("EXISTS_NOT_THM", () => sthm(@class.exists_not_thm()))
  log.attempt("NOT_FORALL_THM", () => sthm(@class.not_forall_thm()))
  log.attempt("FORALL_NOT_THM", () => sthm(@class.forall_not_thm()))
  log.attempt("FORALL_BOOL_THM", () => sthm(@class.forall_bool_thm()))
  log.attempt("EXISTS_BOOL_THM", () => sthm(@class.exists_bool_thm()))
  log.attempt("LEFT_FORALL_OR_THM", () => sthm(@class.left_forall_or_thm()))
  log.attempt("RIGHT_FORALL_OR_THM", () => sthm(@class.right_forall_or_thm()))
  log.attempt("LEFT_OR_FORALL_THM", () => sthm(@class.left_or_forall_thm()))
  log.attempt("RIGHT_OR_FORALL_THM", () => sthm(@class.right_or_forall_thm()))
  log.attempt("LEFT_IMP_FORALL_THM", () => sthm(@class.left_imp_forall_thm()))
  log.attempt("LEFT_EXISTS_IMP_THM", () => sthm(@class.left_exists_imp_thm()))
  log.attempt("RIGHT_IMP_EXISTS_THM", () => sthm(@class.right_imp_exists_thm()))
  log.attempt("RIGHT_EXISTS_IMP_THM", () => sthm(@class.right_exists_imp_thm()))
  log.attempt("COND_DEF", () => sthm(@class.cond_def()))
  log.attempt("COND_CLAUSES", () => sthm(@class.cond_clauses()))
  log.attempt("COND_EXPAND", () => sthm(@class.cond_expand()))
  log.attempt("COND_ID", () => sthm(@class.cond_id()))
  log.attempt("COND_RAND", () => sthm(@class.cond_rand()))
  log.attempt("COND_RATOR", () => sthm(@class.cond_rator()))
  log.attempt("COND_ABS", () => sthm(@class.cond_abs()))
  log.attempt("COND_SWAP", () => sthm(@class.cond_swap()))
  log.attempt("MONO_COND", () => sthm(@class.mono_cond()))
  log.attempt("COND_ELIM_THM", () => sthm(@class.cond_elim_thm()))
  log.attempt("SKOLEM_THM", () => sthm(@class.skolem_thm()))
  log.attempt("SKOLEM_THM_GEN", () => sthm(@class.skolem_thm_gen()))
  log.attempt("UNIQUE_SKOLEM_ALT", () => sthm(@class.unique_skolem_alt()))
  log.attempt("UNIQUE_SKOLEM_THM", () => sthm(@class.unique_skolem_thm()))
  log.attempt("bool_INDUCT", () => sthm(@class.bool_induct()))
  log.attempt("bool_RECURSION", () => sthm(@class.bool_recursion()))
  // END generated theorem list
  let tm = @parser.parse_term
  let st = (name : String, f : () -> (@kernel.Term, @tactics.Tactic) raise) => {
    log.attempt(name, () => {
      let (w, tac) = f()
      let (_, gls, _) = tac((@list.List([]), w))
      "[" + gls.map(sgoal).to_array().join("; ") + "]"
    })
  }
  let th = (name : String, f : () -> @kernel.Thm raise) => {
    log.attempt(name, () => sthm(f()))
  }
  th("ETA_CONV", () => @class.eta_conv(tm("\\x:A. (f:A->B) x")))
  th("ETA_CONV_bad", () => @class.eta_conv(tm("\\x:A. (f:A->A->B) x x")))
  log.attempt("select", () => {
    let t = tm("@x:A. P x")
    let (v, b) = @class.dest_select(t)
    @class.is_select(t).to_string() +
    " " +
    stm(v) +
    " " +
    stm(b) +
    " " +
    stm(@class.mk_select((v, b)))
  })
  th("SELECT_RULE", () => {
    @class.select_rule(@kernel.assume_rule(tm("?x:A. P x")))
  })
  th("SELECT_CONV", () => @class.select_conv(tm("(P:A->bool) (@x. P x)")))
  th("TAUT1", () => @class.taut(tm("p \\/ ~p")))
  th("TAUT2", () => @class.taut(tm("(p ==> q) \\/ (q ==> p)")))
  th("TAUT3", () => @class.taut(tm("(a <=> b) <=> (a /\\ b) \\/ (~a /\\ ~b)")))
  th("TAUT_bad", () => @class.taut(tm("p ==> q")))
  th("TAUT_cond", () => {
    @class.taut(tm("(if b then x else y) = (if ~b then y else x:A)"))
  })
  th("CCONTR", () => {
    let p = tm("p:bool")
    let th0 = @kernel.assume_rule(tm("~p ==> F"))
    @class.ccontr(p)(@bool.undisch(th0))
  })
  th("CONTRAPOS_CONV", () => @class.contrapos_conv(tm("p ==> q")))
  log.attempt("cond", () => {
    let b = tm("b:bool")
    let x = tm("x:A")
    let y = tm("y:A")
    let c = @class.mk_cond(b, x, y)
    let (b1, (x1, y1)) = @class.dest_cond(c)
    @class.is_cond(c).to_string() +
    " " +
    stm(c) +
    " " +
    stm(b1) +
    " " +
    stm(x1) +
    " " +
    stm(y1)
  })
  th("COND_ELIM_CONV", () => {
    @class.cond_elim_conv(tm("(P:A->bool) (if b then x else y)"))
  })
  st("COND_CASES_TAC", () => {
    (tm("(P:A->bool) (if b then x else y)"), g => @class.cond_cases_tac(g))
  })
  st("BOOL_CASES_TAC", () => {
    let w = tm("(P:bool->bool) b")
    let b = tm("b:bool")
    (w, @class.bool_cases_tac(b))
  })
  st("ASM_CASES_TAC", () => {
    let w = tm("q:bool")
    let p = tm("p:bool")
    (w, @class.asm_cases_tac(p))
  })
  st("REFUTE_THEN", () => {
    (tm("p:bool"), @class.refute_then(th => @tactics.assume_tac(th)))
  })
  let new_unit = () => {
    let t = tm("?b:bool. b")
    let tt = tm("T")
    let th0 = @tactics.prove(
      t,
      @tactics.then_tac(
        @tactics.exists_tac(tt),
        @tactics.accept_tac(@bool.truth()),
      ),
    )
    @class.new_type_definition("unit'", ("mk_unit'", "dest_unit'"), th0)
  }
  th("new_type_definition", new_unit)
  th("new_type_definition_again", new_unit)
  log.attempt("type_definitions", () => {
    @class.the_type_definitions().val.length().to_string()
  })
  log.attempt("inductive_type_store", () => {
    @class.inductive_type_store().val.map(p => p.0).to_array().join(" ")
  })
  log.attempt("types", () => {
    @kernel.types().map(p => p.0 + "/" + p.1.to_string()).to_array().join(" ")
  })
  log.attempt("constants", () => {
    @kernel.constants().map(c => c.0).to_array().join(" ")
  })
  log.attempt("definitions", () => @kernel.definitions().length().to_string())
  log.attempt("axioms", () => @kernel.axioms().map(sthm).to_array().join(" ;; "))
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
      #|class quotations (100):
      #|  \226\136\128 t : (A) -> B, ((x : A) => t(x)) == t
      #|  (t : (A) -> B)
      #|  ((x : A) => (t : (A) -> B)(x)) == t
      #|  (x : A)
      #|  (x : A)
      #|  \226\136\128 f : (A) -> B, \226\136\128 g : (A) -> B, (\226\136\128 x : A, f(x) == g(x)) \226\134\146 f == g
      #|  \226\136\128 f : (A) -> B, \226\136\128 g : (A) -> B, (f == g) == (\226\136\128 x : A, f(x) == g(x))
      #|  :(A->bool)->A
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 x : A, P(x) \226\134\146 P(select(P))
      #|  select((P : (A) -> Bool))
      #|  (P : (A) -> Bool)
      #|  op_q == ((P : (A) -> Bool) => P(select(P)))
      #|  (P : (A) -> Bool)
      #|  op_q((P : (A) -> Bool)) \226\134\146 P(select(P))
      #|  (P : (A) -> Bool)
      #|  (P : (A) -> Bool)(select(P)) == op_q(P)
      #|  (x : A)
      #|  \226\136\128 x : A, select((y : A) => y == x) == x
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 x : A, (\226\136\128 y : A, P(y) == (y == x)) \226\134\146 select(P) == x
      #|  ((p : Bool) || true) == true
      #|  !(true == false)
      #|  true
      #|  false
      #|  (select((x : Bool) => x == false || (t : Bool)) == false || t) && (select((x : Bool) => x == true || t) == true || t)
      #|  \226\136\128 t : Bool, t || !t
      #|  (t : Bool)
      #|  \226\136\128 t : Bool, t == true || t == false
      #|  \226\136\128 t1 : Bool, \226\136\128 t2 : Bool, !(t1 && t2) == (!t1 || !t2) && !(t1 || t2) == (!t1 && !t2)
      #|  (\226\136\128 t : Bool, !!t == t) && !true == false && !false == true
      #|  \226\136\128 t1 : Bool, \226\136\128 t2 : Bool, !(t1 \226\134\146 t2) == (t1 && !t2)
      #|  \226\136\128 t1 : Bool, \226\136\128 t2 : Bool, (!t1 \226\134\146 !t2) == (t2 \226\134\146 t1)
      #|  (P : Bool)
      #|  (!(P : Bool) \226\134\146 false) \226\134\146 P
      #|  (a : Bool)
      #|  (b : Bool)
      #|  ((a : Bool) \226\134\146 (b : Bool)) == (!b \226\134\146 !a)
      #|  false
      #|  (p : Bool) == (!p \226\134\146 false)
      #|  (x : A)
      #|  !(\226\136\131 x : A, (P : (A) -> Bool)(x))
      #|  \226\136\128 P : (A) -> Bool, !(\226\136\131 x : A, P(x)) == (\226\136\128 x : A, !P(x))
      #|  ((a : Bool) == !(b : Bool)) == (!a == b)
      #|  \226\136\128 P : (A) -> Bool, (\226\136\131 x : A, !P(x)) == !(\226\136\128 x : A, P(x))
      #|  \226\136\128 P : (A) -> Bool, !(\226\136\128 x : A, P(x)) == (\226\136\131 x : A, !P(x))
      #|  \226\136\128 P : (A) -> Bool, (\226\136\128 x : A, !P(x)) == !(\226\136\131 x : A, P(x))
      #|  (b : Bool)
      #|  (\226\136\128 b : Bool, (P : (Bool) -> Bool)(b)) == (P(true) && P(false))
      #|  !(p : Bool) == !(q : Bool) \226\134\146 p == q
      #|  (\226\136\131 b : Bool, (P : (Bool) -> Bool)(b)) == (P(true) || P(false))
      #|  ((a : Bool) == (b : Bool)) == (!a == !b)
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 Q : Bool, (\226\136\128 x : A, P(x) || Q) == ((\226\136\128 x : A, P(x)) || Q)
      #|  ((a : Bool) == (b : Bool)) == (!a == !b)
      #|  \226\136\128 P : Bool, \226\136\128 Q : (A) -> Bool, (\226\136\128 x : A, P || Q(x)) == (P || (\226\136\128 x : A, Q(x)))
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 Q : Bool, ((\226\136\128 x : A, P(x)) || Q) == (\226\136\128 x : A, P(x) || Q)
      #|  \226\136\128 P : Bool, \226\136\128 Q : (A) -> Bool, (P || (\226\136\128 x : A, Q(x))) == (\226\136\128 x : A, P || Q(x))
      #|  ((a : Bool) == (b : Bool)) == (!a == !b)
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 Q : Bool, ((\226\136\128 x : A, P(x)) \226\134\146 Q) == (\226\136\131 x : A, P(x) \226\134\146 Q)
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 Q : Bool, (\226\136\131 x : A, P(x) \226\134\146 Q) == ((\226\136\128 x : A, P(x)) \226\134\146 Q)
      #|  ((a : Bool) == (b : Bool)) == (!a == !b)
      #|  \226\136\128 P : Bool, \226\136\128 Q : (A) -> Bool, (P \226\134\146 (\226\136\131 x : A, Q(x))) == (\226\136\131 x : A, P \226\134\146 Q(x))
      #|  \226\136\128 P : Bool, \226\136\128 Q : (A) -> Bool, (\226\136\131 x : A, P \226\134\146 Q(x)) == (P \226\134\146 (\226\136\131 x : A, Q(x)))
      #|  (COND : (Bool, A, A) -> A) == ((t : Bool) => (t1 : A) => (t2 : A) => select((x : A) => (t == true \226\134\146 x == t1) && (t == false \226\134\146 x == t2)))
      #|  \226\136\128 t1 : A, \226\136\128 t2 : A, (if true { t1 } else { t2 }) == t1 && (if false { t1 } else { t2 }) == t2
      #|  (b : Bool)
      #|  \226\136\128 b : Bool, \226\136\128 t1 : Bool, \226\136\128 t2 : Bool, (if b { t1 } else { t2 }) == ((!b || t1) && (b || t2))
      #|  (b : Bool)
      #|  \226\136\128 b : Bool, \226\136\128 t : A, (if b { t } else { t }) == t
      #|  (b : Bool)
      #|  \226\136\128 b : Bool, \226\136\128 f : (A) -> B, \226\136\128 x : A, \226\136\128 y : A, f(if b { x } else { y }) == (if b { f(x) } else { f(y) })
      #|  (b : Bool)
      #|  \226\136\128 b : Bool, \226\136\128 f : (A) -> B, \226\136\128 g : (A) -> B, \226\136\128 x : A, COND(b, f, g, x) == (if b { f(x) } else { g(x) })
      #|  (b : Bool)
      #|  \226\136\128 b : Bool, \226\136\128 f : (A) -> B, \226\136\128 g : (A) -> B, ((x : A) => if b { f(x) } else { g(x) }) == (if b { f } else { g })
      #|  (p : Bool)
      #|  \226\136\128 p : Bool, \226\136\128 x : A, \226\136\128 y : A, (if !p { x } else { y }) == (if p { y } else { x })
      #|  (b : Bool)
      #|  ((A : Bool) \226\134\146 (B : Bool)) && ((C : Bool) \226\134\146 (D : Bool)) \226\134\146 (if (b : Bool) { A } else { C }) \226\134\146 (if b { B } else { D })
      #|  (c : Bool)
      #|  (P : (A) -> Bool)(if (c : Bool) { (x : A) } else { (y : A) }) == ((c \226\134\146 P(x)) && (!c \226\134\146 P(y)))
      #|  !!(p : Bool) == p
      #|  (y : (A) -> B)((x : A))
      #|  (x : A) => select((y : B) => (P : (A, B) -> Bool)(x, y))
      #|  \226\136\128 P : (A, B) -> Bool, (\226\136\128 x : A, \226\136\131 y : B, P(x, y)) == (\226\136\131 y : (A) -> B, \226\136\128 x : A, P(x, y(x)))
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 R : (A, B) -> Bool, (\226\136\128 x : A, P(x) \226\134\146 (\226\136\131 y : B, R(x, y))) == (\226\136\131 f : (A) -> B, \226\136\128 x : A, P(x) \226\134\146 R(x, f(x)))
      #|  \226\136\128 P : (A, B) -> Bool, (\226\136\128 x : A, existsunique((y : B) => P(x, y))) == (\226\136\131 f : (A) -> B, \226\136\128 x : A, \226\136\128 y : B, P(x, y) == (f(x) == y))
      #|  (x : A)
      #|  ((z : A) => if z == (x : A) { (y1 : B) } else { (f : (A) -> B)(z) }) == ((z : A) => if z == x { (y2 : B) } else { f(z) })
      #|  (f : (A) -> B)
      #|  (y2 : B)
      #|  (y1 : B)
      #|  (x : A)
      #|  (x : A)
      #|  (x : A)
      #|  \226\136\128 P : (A, B) -> Bool, (\226\136\128 x : A, existsunique((y : B) => P(x, y))) == existsunique((f : (A) -> B) => \226\136\128 x : A, P(x, f(x)))
      #|  (g : Bool) == (g' : Bool) \226\134\146 (g' \226\134\146 (t : _) == (t' : _)) \226\134\146 (!g' \226\134\146 (e : _) == (e' : _)) \226\134\146 (if g { t } else { e }) == (if g' { t' } else { e' })
      #|  (if (x : _) == x { (y : _) } else { (z : _) }) == y
      #|  (x : Bool)
      #|  \226\136\128 P : (Bool) -> Bool, P(false) && P(true) \226\134\146 (\226\136\128 x : Bool, P(x))
      #|  (x : Bool) => if x { (b : A) } else { (a : A) }
      #|  \226\136\128 a : A, \226\136\128 b : A, \226\136\131 f : (Bool) -> A, f(false) == a && f(true) == b
      #|ETA_AX =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\t:fun('A,'B). ((#=:fun(fun('A,'B),fun(fun('A,'B),bool)) (\x:'A. (t:fun('A,'B) x:'A))) t:fun('A,'B))))
      #|EQ_EXT =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,'B),bool),bool) (\g:fun('A,'B). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (g:fun('A,'B) x:'A))))) ((#=:fun(fun('A,'B),fun(fun('A,'B),bool)) f:fun('A,'B)) g:fun('A,'B)))))))
      #|FUN_EQ_THM =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,'B),bool),bool) (\g:fun('A,'B). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,'B),fun(fun('A,'B),bool)) f:fun('A,'B)) g:fun('A,'B))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) (g:fun('A,'B) x:'A)))))))))
      #|SELECT_AX =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (P:fun('A,bool) (#@:fun(fun('A,bool),'A) P:fun('A,bool))))))))
      #|EXISTS_THM =  |- ((#=:fun(fun(fun('A,bool),bool),fun(fun(fun('A,bool),bool),bool)) #?:fun(fun('A,bool),bool)) (\P:fun('A,bool). (P:fun('A,bool) (#@:fun(fun('A,bool),'A) P:fun('A,bool)))))
      #|SELECT_REFL =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('A,fun('A,bool)) (#@:fun(fun('A,bool),'A) (\y:'A. ((#=:fun('A,fun('A,bool)) y:'A) x:'A)))) x:'A)))
      #|SELECT_UNIQUE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#=:fun(bool,fun(bool,bool)) (P:fun('A,bool) y:'A)) ((#=:fun('A,fun('A,bool)) y:'A) x:'A))))) ((#=:fun('A,fun('A,bool)) (#@:fun(fun('A,bool),'A) P:fun('A,bool))) x:'A))))))
      #|EXCLUDED_MIDDLE =  |- (#forall:fun(fun(bool,bool),bool) (\t:bool. ((#\/:fun(bool,fun(bool,bool)) t:bool) (#~:fun(bool,bool) t:bool))))
      #|BOOL_CASES_AX =  |- (#forall:fun(fun(bool,bool),bool) (\t:bool. ((#\/:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) t:bool) #T:bool)) ((#=:fun(bool,fun(bool,bool)) t:bool) #F:bool))))
      #|DE_MORGAN_THM =  |- (#forall:fun(fun(bool,bool),bool) (\t1:bool. (#forall:fun(fun(bool,bool),bool) (\t2:bool. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#/\:fun(bool,fun(bool,bool)) t1:bool) t2:bool))) ((#\/:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) t1:bool)) (#~:fun(bool,bool) t2:bool)))) ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#\/:fun(bool,fun(bool,bool)) t1:bool) t2:bool))) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) t1:bool)) (#~:fun(bool,bool) t2:bool))))))))
      #|NOT_CLAUSES =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(bool,bool),bool) (\t:bool. ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#~:fun(bool,bool) t:bool))) t:bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) #T:bool)) #F:bool)) ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) #F:bool)) #T:bool)))
      #|NOT_IMP =  |- (#forall:fun(fun(bool,bool),bool) (\t1:bool. (#forall:fun(fun(bool,bool),bool) (\t2:bool. ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#==>:fun(bool,fun(bool,bool)) t1:bool) t2:bool))) ((#/\:fun(bool,fun(bool,bool)) t1:bool) (#~:fun(bool,bool) t2:bool)))))))
      #|CONTRAPOS_THM =  |- (#forall:fun(fun(bool,bool),bool) (\t1:bool. (#forall:fun(fun(bool,bool),bool) (\t2:bool. ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) t1:bool)) (#~:fun(bool,bool) t2:bool))) ((#==>:fun(bool,fun(bool,bool)) t2:bool) t1:bool))))))
      #|NOT_EXISTS_THM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#?:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#~:fun(bool,bool) (P:fun('A,bool) x:'A)))))))
      #|EXISTS_NOT_THM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. (#~:fun(bool,bool) (P:fun('A,bool) x:'A))))) (#~:fun(bool,bool) (#forall:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))))))
      #|NOT_FORALL_THM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) (#forall:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A))))) (#?:fun(fun('A,bool),bool) (\x:'A. (#~:fun(bool,bool) (P:fun('A,bool) x:'A)))))))
      #|FORALL_NOT_THM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#~:fun(bool,bool) (P:fun('A,bool) x:'A))))) (#~:fun(bool,bool) (#?:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))))))
      #|FORALL_BOOL_THM =  |- ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun(bool,bool),bool) (\b:bool. (P:fun(bool,bool) b:bool)))) ((#/\:fun(bool,fun(bool,bool)) (P:fun(bool,bool) #T:bool)) (P:fun(bool,bool) #F:bool)))
      #|EXISTS_BOOL_THM =  |- ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(bool,bool),bool) (\b:bool. (P:fun(bool,bool) b:bool)))) ((#\/:fun(bool,fun(bool,bool)) (P:fun(bool,bool) #T:bool)) (P:fun(bool,bool) #F:bool)))
      #|LEFT_FORALL_OR_THM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(bool,bool),bool) (\Q:bool. ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#\/:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) Q:bool)))) ((#\/:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))) Q:bool))))))
      #|RIGHT_FORALL_OR_THM =  |- (#forall:fun(fun(bool,bool),bool) (\P:bool. (#forall:fun(fun(fun('A,bool),bool),bool) (\Q:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#\/:fun(bool,fun(bool,bool)) P:bool) (Q:fun('A,bool) x:'A))))) ((#\/:fun(bool,fun(bool,bool)) P:bool) (#forall:fun(fun('A,bool),bool) (\x:'A. (Q:fun('A,bool) x:'A)))))))))
      #|LEFT_OR_FORALL_THM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(bool,bool),bool) (\Q:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))) Q:bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#\/:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) Q:bool))))))))
      #|RIGHT_OR_FORALL_THM =  |- (#forall:fun(fun(bool,bool),bool) (\P:bool. (#forall:fun(fun(fun('A,bool),bool),bool) (\Q:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) P:bool) (#forall:fun(fun('A,bool),bool) (\x:'A. (Q:fun('A,bool) x:'A))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#\/:fun(bool,fun(bool,bool)) P:bool) (Q:fun('A,bool) x:'A)))))))))
      #|LEFT_IMP_FORALL_THM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(bool,bool),bool) (\Q:bool. ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))) Q:bool)) (#?:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) Q:bool))))))))
      #|LEFT_EXISTS_IMP_THM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(bool,bool),bool) (\Q:bool. ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) Q:bool)))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))) Q:bool))))))
      #|RIGHT_IMP_EXISTS_THM =  |- (#forall:fun(fun(bool,bool),bool) (\P:bool. (#forall:fun(fun(fun('A,bool),bool),bool) (\Q:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) P:bool) (#?:fun(fun('A,bool),bool) (\x:'A. (Q:fun('A,bool) x:'A))))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) P:bool) (Q:fun('A,bool) x:'A)))))))))
      #|RIGHT_EXISTS_IMP_THM =  |- (#forall:fun(fun(bool,bool),bool) (\P:bool. (#forall:fun(fun(fun('A,bool),bool),bool) (\Q:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) P:bool) (Q:fun('A,bool) x:'A))))) ((#==>:fun(bool,fun(bool,bool)) P:bool) (#?:fun(fun('A,bool),bool) (\x:'A. (Q:fun('A,bool) x:'A)))))))))
      #|COND_DEF =  |- ((#=:fun(fun(bool,fun('A,fun('A,'A))),fun(fun(bool,fun('A,fun('A,'A))),bool)) #COND:fun(bool,fun('A,fun('A,'A)))) (\t:bool. (\t1:'A. (\t2:'A. (#@:fun(fun('A,bool),'A) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) t:bool) #T:bool)) ((#=:fun('A,fun('A,bool)) x:'A) t1:'A))) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) t:bool) #F:bool)) ((#=:fun('A,fun('A,bool)) x:'A) t2:'A)))))))))
      #|COND_CLAUSES =  |- (#forall:fun(fun('A,bool),bool) (\t1:'A. (#forall:fun(fun('A,bool),bool) (\t2:'A. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (((#COND:fun(bool,fun('A,fun('A,'A))) #T:bool) t1:'A) t2:'A)) t1:'A)) ((#=:fun('A,fun('A,bool)) (((#COND:fun(bool,fun('A,fun('A,'A))) #F:bool) t1:'A) t2:'A)) t2:'A))))))
      #|COND_EXPAND =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(bool,bool),bool) (\t1:bool. (#forall:fun(fun(bool,bool),bool) (\t2:bool. ((#=:fun(bool,fun(bool,bool)) (((#COND:fun(bool,fun(bool,fun(bool,bool))) b:bool) t1:bool) t2:bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) t1:bool)) ((#\/:fun(bool,fun(bool,bool)) b:bool) t2:bool)))))))))
      #|COND_ID =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun('A,bool),bool) (\t:'A. ((#=:fun('A,fun('A,bool)) (((#COND:fun(bool,fun('A,fun('A,'A))) b:bool) t:'A) t:'A)) t:'A)))))
      #|COND_RAND =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) (((#COND:fun(bool,fun('A,fun('A,'A))) b:bool) x:'A) y:'A))) (((#COND:fun(bool,fun('B,fun('B,'B))) b:bool) (f:fun('A,'B) x:'A)) (f:fun('A,'B) y:'A)))))))))))
      #|COND_RATOR =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,'B),bool),bool) (\g:fun('A,'B). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('B,fun('B,bool)) ((((#COND:fun(bool,fun(fun('A,'B),fun(fun('A,'B),fun('A,'B)))) b:bool) f:fun('A,'B)) g:fun('A,'B)) x:'A)) (((#COND:fun(bool,fun('B,fun('B,'B))) b:bool) (f:fun('A,'B) x:'A)) (g:fun('A,'B) x:'A)))))))))))
      #|COND_ABS =  |- (#forall:fun(fun(bool,bool),bool) (\b:bool. (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun(fun('A,'B),bool),bool) (\g:fun('A,'B). ((#=:fun(fun('A,'B),fun(fun('A,'B),bool)) (\x:'A. (((#COND:fun(bool,fun('B,fun('B,'B))) b:bool) (f:fun('A,'B) x:'A)) (g:fun('A,'B) x:'A)))) (((#COND:fun(bool,fun(fun('A,'B),fun(fun('A,'B),fun('A,'B)))) b:bool) f:fun('A,'B)) g:fun('A,'B)))))))))
      #|COND_SWAP =  |- (#forall:fun(fun(bool,bool),bool) (\p:bool. (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#=:fun('A,fun('A,bool)) (((#COND:fun(bool,fun('A,fun('A,'A))) (#~:fun(bool,bool) p:bool)) x:'A) y:'A)) (((#COND:fun(bool,fun('A,fun('A,'A))) p:bool) y:'A) x:'A))))))))
      #|MONO_COND =  |- ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) A:bool) B:bool)) ((#==>:fun(bool,fun(bool,bool)) C:bool) D:bool))) ((#==>:fun(bool,fun(bool,bool)) (((#COND:fun(bool,fun(bool,fun(bool,bool))) b:bool) A:bool) C:bool)) (((#COND:fun(bool,fun(bool,fun(bool,bool))) b:bool) B:bool) D:bool)))
      #|COND_ELIM_THM =  |- ((#=:fun(bool,fun(bool,bool)) (P:fun('A,bool) (((#COND:fun(bool,fun('A,fun('A,'A))) c:bool) x:'A) y:'A))) ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) c:bool) (P:fun('A,bool) x:'A))) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) c:bool)) (P:fun('A,bool) y:'A))))
      #|SKOLEM_THM =  |- (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\P:fun('A,fun('B,bool)). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('B,bool),bool) (\y:'B. ((P:fun('A,fun('B,bool)) x:'A) y:'B)))))) (#?:fun(fun(fun('A,'B),bool),bool) (\y:fun('A,'B). (#forall:fun(fun('A,bool),bool) (\x:'A. ((P:fun('A,fun('B,bool)) x:'A) (y:fun('A,'B) x:'A)))))))))
      #|SKOLEM_THM_GEN =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\R:fun('A,fun('B,bool)). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (#?:fun(fun('B,bool),bool) (\y:'B. ((R:fun('A,fun('B,bool)) x:'A) y:'B))))))) (#?:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) ((R:fun('A,fun('B,bool)) x:'A) (f:fun('A,'B) x:'A))))))))))))
      #|UNIQUE_SKOLEM_ALT =  |- (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\P:fun('A,fun('B,bool)). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#?!:fun(fun('B,bool),bool) (\y:'B. ((P:fun('A,fun('B,bool)) x:'A) y:'B)))))) (#?:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('B,bool),bool) (\y:'B. ((#=:fun(bool,fun(bool,bool)) ((P:fun('A,fun('B,bool)) x:'A) y:'B)) ((#=:fun('B,fun('B,bool)) (f:fun('A,'B) x:'A)) y:'B)))))))))))
      #|UNIQUE_SKOLEM_THM =  |- (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\P:fun('A,fun('B,bool)). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#?!:fun(fun('B,bool),bool) (\y:'B. ((P:fun('A,fun('B,bool)) x:'A) y:'B)))))) (#?!:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun('A,bool),bool) (\x:'A. ((P:fun('A,fun('B,bool)) x:'A) (f:fun('A,'B) x:'A)))))))))
      #|bool_INDUCT =  |- (#forall:fun(fun(fun(bool,bool),bool),bool) (\P:fun(bool,bool). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun(bool,bool) #F:bool)) (P:fun(bool,bool) #T:bool))) (#forall:fun(fun(bool,bool),bool) (\x:bool. (P:fun(bool,bool) x:bool))))))
      #|bool_RECURSION =  |- (#forall:fun(fun('A,bool),bool) (\a:'A. (#forall:fun(fun('A,bool),bool) (\b:'A. (#?:fun(fun(fun(bool,'A),bool),bool) (\f:fun(bool,'A). ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) (f:fun(bool,'A) #F:bool)) a:'A)) ((#=:fun('A,fun('A,bool)) (f:fun(bool,'A) #T:bool)) b:'A))))))))
      #|ETA_CONV =  |- ((#=:fun(fun('A,'B),fun(fun('A,'B),bool)) (\x:'A. (f:fun('A,'B) x:'A))) f:fun('A,'B))
      #|ETA_CONV_bad ! ETA_CONV
      #|select = true x:'A (P:fun('A,bool) x:'A) (#@:fun(fun('A,bool),'A) (\x:'A. (P:fun('A,bool) x:'A)))
      #|SELECT_RULE = (#?:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A))) |- (P:fun('A,bool) (#@:fun(fun('A,bool),'A) (\x:'A. (P:fun('A,bool) x:'A))))
      #|SELECT_CONV =  |- ((#=:fun(bool,fun(bool,bool)) (P:fun('A,bool) (#@:fun(fun('A,bool),'A) (\x:'A. (P:fun('A,bool) x:'A))))) (#?:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A))))
      #|TAUT1 =  |- ((#\/:fun(bool,fun(bool,bool)) p:bool) (#~:fun(bool,bool) p:bool))
      #|TAUT2 =  |- ((#\/:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) p:bool) q:bool)) ((#==>:fun(bool,fun(bool,bool)) q:bool) p:bool))
      #|TAUT3 =  |- ((#=:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#/\:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) a:bool)) (#~:fun(bool,bool) b:bool))))
      #|TAUT_bad ! TAUT `p ==> q`: cannot solve
      #|TAUT_cond =  |- ((#=:fun('A,fun('A,bool)) (((#COND:fun(bool,fun('A,fun('A,'A))) b:bool) x:'A) y:'A)) (((#COND:fun(bool,fun('A,fun('A,'A))) (#~:fun(bool,bool) b:bool)) y:'A) x:'A))
      #|CCONTR = ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) p:bool)) #F:bool) |- p:bool
      #|CONTRAPOS_CONV =  |- ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) p:bool) q:bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) q:bool)) (#~:fun(bool,bool) p:bool)))
      #|cond = true (((#COND:fun(bool,fun('A,fun('A,'A))) b:bool) x:'A) y:'A) b:bool x:'A y:'A
      #|COND_ELIM_CONV =  |- ((#=:fun(bool,fun(bool,bool)) (P:fun('A,bool) (((#COND:fun(bool,fun('A,fun('A,'A))) b:bool) x:'A) y:'A))) ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) b:bool) (P:fun('A,bool) x:'A))) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) b:bool)) (P:fun('A,bool) y:'A))))
      #|COND_CASES_TAC = [\n  0 [`b`]\n\n`P x`\n; \n  0 [`~b`]\n\n`P y`\n]
      #|BOOL_CASES_TAC = [\n`P true`\n; \n`P false`\n]
      #|ASM_CASES_TAC = [\n  0 [`p`]\n\n`q`\n; \n  0 [`~p`]\n\n`q`\n]
      #|REFUTE_THEN = [\n  0 [`~p`]\n\n`false`\n]
      #|new_type_definition =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(unit',bool),bool) (\a:unit'. ((#=:fun(unit',fun(unit',bool)) (#mk_unit':fun(bool,unit') (#dest_unit':fun(unit',bool) a:unit'))) a:unit')))) (#forall:fun(fun(bool,bool),bool) (\r:bool. ((#=:fun(bool,fun(bool,bool)) r:bool) ((#=:fun(bool,fun(bool,bool)) (#dest_unit':fun(unit',bool) (#mk_unit':fun(bool,unit') r:bool))) r:bool)))))
      #|Warning: Benign redefinition of type
      #|new_type_definition_again =  |- ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(unit',bool),bool) (\a:unit'. ((#=:fun(unit',fun(unit',bool)) (#mk_unit':fun(bool,unit') (#dest_unit':fun(unit',bool) a:unit'))) a:unit')))) (#forall:fun(fun(bool,bool),bool) (\r:bool. ((#=:fun(bool,fun(bool,bool)) r:bool) ((#=:fun(bool,fun(bool,bool)) (#dest_unit':fun(unit',bool) (#mk_unit':fun(bool,unit') r:bool))) r:bool)))))
      #|type_definitions = 1
      #|inductive_type_store = bool
      #|types = unit'/0 bool/0 fun/2
      #|constants = dest_unit' mk_unit' COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 11
      #|axioms =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (P:fun('A,bool) (#@:fun(fun('A,bool),'A) P:fun('A,bool)))))))) ;;  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\t:fun('A,'B). ((#=:fun(fun('A,'B),fun(fun('A,'B),bool)) (\x:'A. (t:fun('A,'B) x:'A))) t:fun('A,'B))))
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?1
      #|counter_genvar = _542:bool
      #|
    ),
  )
}
