// Load-fidelity and behaviour test for theorems.ml: replays
// tools/ocaml_ref/theorems_ref.ml (keep in sync; refresh with tools/ocaml_ref/refresh_ref.py).

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
test "theorems matches theorems.ml" {
  let log = @testkit.Log::new()
  log.capture_reports()
  log.show_theory_output("simp")
  log.show_theory_output("theorems")
  log.show_theory_trace("theorems")
  // BEGIN generated theorem list
  log.attempt("EQ_REFL", () => sthm(@theorems.eq_refl()))
  log.attempt("REFL_CLAUSE", () => sthm(@theorems.refl_clause()))
  log.attempt("EQ_SYM", () => sthm(@theorems.eq_sym()))
  log.attempt("EQ_SYM_EQ", () => sthm(@theorems.eq_sym_eq()))
  log.attempt("EQ_TRANS", () => sthm(@theorems.eq_trans()))
  log.attempt("BETA_THM", () => sthm(@theorems.beta_thm()))
  log.attempt("ABS_SIMP", () => sthm(@theorems.abs_simp()))
  log.attempt("CONJ_ASSOC", () => sthm(@theorems.conj_assoc()))
  log.attempt("CONJ_SYM", () => sthm(@theorems.conj_sym()))
  log.attempt("CONJ_ACI", () => sthm(@theorems.conj_aci()))
  log.attempt("DISJ_ASSOC", () => sthm(@theorems.disj_assoc()))
  log.attempt("DISJ_SYM", () => sthm(@theorems.disj_sym()))
  log.attempt("DISJ_ACI", () => sthm(@theorems.disj_aci()))
  log.attempt("IMP_CONJ", () => sthm(@theorems.imp_conj()))
  log.attempt("IMP_IMP", () => sthm(@theorems.imp_imp()))
  log.attempt("IMP_CONJ_ALT", () => sthm(@theorems.imp_conj_alt()))
  log.attempt("LEFT_OR_DISTRIB", () => sthm(@theorems.left_or_distrib()))
  log.attempt("RIGHT_OR_DISTRIB", () => sthm(@theorems.right_or_distrib()))
  log.attempt("FORALL_SIMP", () => sthm(@theorems.forall_simp()))
  log.attempt("EXISTS_SIMP", () => sthm(@theorems.exists_simp()))
  log.attempt("EQ_IMP", () => sthm(@theorems.eq_imp()))
  log.attempt("EQ_CLAUSES", () => sthm(@theorems.eq_clauses()))
  log.attempt("NOT_CLAUSES_WEAK", () => sthm(@theorems.not_clauses_weak()))
  log.attempt("AND_CLAUSES", () => sthm(@theorems.and_clauses()))
  log.attempt("OR_CLAUSES", () => sthm(@theorems.or_clauses()))
  log.attempt("IMP_CLAUSES", () => sthm(@theorems.imp_clauses()))
  log.attempt("EXISTS_UNIQUE_THM", () => sthm(@theorems.exists_unique_thm()))
  log.attempt("EXISTS_REFL", () => sthm(@theorems.exists_refl()))
  log.attempt("EXISTS_UNIQUE_REFL", () => sthm(@theorems.exists_unique_refl()))
  log.attempt("UNWIND_THM1", () => sthm(@theorems.unwind_thm1()))
  log.attempt("UNWIND_THM2", () => sthm(@theorems.unwind_thm2()))
  log.attempt("FORALL_UNWIND_THM2", () => sthm(@theorems.forall_unwind_thm2()))
  log.attempt("FORALL_UNWIND_THM1", () => sthm(@theorems.forall_unwind_thm1()))
  log.attempt("SWAP_FORALL_THM", () => sthm(@theorems.swap_forall_thm()))
  log.attempt("SWAP_EXISTS_THM", () => sthm(@theorems.swap_exists_thm()))
  log.attempt("FORALL_AND_THM", () => sthm(@theorems.forall_and_thm()))
  log.attempt("AND_FORALL_THM", () => sthm(@theorems.and_forall_thm()))
  log.attempt("LEFT_AND_FORALL_THM", () => sthm(@theorems.left_and_forall_thm()))
  log.attempt("RIGHT_AND_FORALL_THM", () => {
    sthm(@theorems.right_and_forall_thm())
  })
  log.attempt("EXISTS_OR_THM", () => sthm(@theorems.exists_or_thm()))
  log.attempt("OR_EXISTS_THM", () => sthm(@theorems.or_exists_thm()))
  log.attempt("LEFT_OR_EXISTS_THM", () => sthm(@theorems.left_or_exists_thm()))
  log.attempt("RIGHT_OR_EXISTS_THM", () => sthm(@theorems.right_or_exists_thm()))
  log.attempt("LEFT_EXISTS_AND_THM", () => sthm(@theorems.left_exists_and_thm()))
  log.attempt("RIGHT_EXISTS_AND_THM", () => {
    sthm(@theorems.right_exists_and_thm())
  })
  log.attempt("TRIV_EXISTS_AND_THM", () => sthm(@theorems.triv_exists_and_thm()))
  log.attempt("LEFT_AND_EXISTS_THM", () => sthm(@theorems.left_and_exists_thm()))
  log.attempt("RIGHT_AND_EXISTS_THM", () => {
    sthm(@theorems.right_and_exists_thm())
  })
  log.attempt("TRIV_AND_EXISTS_THM", () => sthm(@theorems.triv_and_exists_thm()))
  log.attempt("TRIV_FORALL_OR_THM", () => sthm(@theorems.triv_forall_or_thm()))
  log.attempt("TRIV_OR_FORALL_THM", () => sthm(@theorems.triv_or_forall_thm()))
  log.attempt("RIGHT_IMP_FORALL_THM", () => {
    sthm(@theorems.right_imp_forall_thm())
  })
  log.attempt("RIGHT_FORALL_IMP_THM", () => {
    sthm(@theorems.right_forall_imp_thm())
  })
  log.attempt("LEFT_IMP_EXISTS_THM", () => sthm(@theorems.left_imp_exists_thm()))
  log.attempt("LEFT_FORALL_IMP_THM", () => sthm(@theorems.left_forall_imp_thm()))
  log.attempt("TRIV_FORALL_IMP_THM", () => sthm(@theorems.triv_forall_imp_thm()))
  log.attempt("TRIV_EXISTS_IMP_THM", () => sthm(@theorems.triv_exists_imp_thm()))
  log.attempt("MONO_AND", () => sthm(@theorems.mono_and()))
  log.attempt("MONO_OR", () => sthm(@theorems.mono_or()))
  log.attempt("MONO_IMP", () => sthm(@theorems.mono_imp()))
  log.attempt("MONO_NOT", () => sthm(@theorems.mono_not()))
  log.attempt("MONO_FORALL", () => sthm(@theorems.mono_forall()))
  log.attempt("MONO_EXISTS", () => sthm(@theorems.mono_exists()))
  log.attempt("WLOG_RELATION", () => sthm(@theorems.wlog_relation()))
  log.attempt("EXISTS_UNIQUE_ALT", () => sthm(@theorems.exists_unique_alt()))
  log.attempt("EXISTS_UNIQUE", () => sthm(@theorems.exists_unique()))
  // END generated theorem list
  log.attempt("basic_rewrites", () => {
    @simp.basic_rewrites().map(sthm).to_array().join(" ;; ")
  })
  log.attempt("basic_congs", () => {
    @simp.basic_congs().map(sthm).to_array().join(" ;; ")
  })
  let tm = @parser.parse_term
  let st = (name : String, f : () -> (@kernel.Term, @tactics.Tactic) raise) => {
    log.attempt(name, () => {
      let (w, tac) = f()
      let (_, gls, _) = tac((@list.List([]), w))
      "[" + gls.map(sgoal).to_array().join("; ") + "]"
    })
  }
  // `DISCH_THEN(DESTRUCT_TAC s)` parses the pattern when it is built
  let dt = (s : String) => {
    let ttac = @theorems.destruct_tac(s)
    @tactics.disch_then(th => ttac(th))
  }
  let lab = @tactics.disch_then(th => @tactics.label_tac("h", th))
  log.attempt("AC", () => {
    let t = tm("p /\\ q /\\ r <=> r /\\ q /\\ p")
    sthm(@theorems.ac(@theorems.conj_aci())(t))
  })
  log.attempt("AC_bad", () => {
    let t = tm("p /\\ q <=> p \\/ q")
    sthm(@theorems.ac(@theorems.conj_aci())(t))
  })
  st("DESTRUCT_obtain", () => (tm("(?x:A. P x /\\ Q x) ==> R"), dt("@x. hp hq")))
  st("DESTRUCT_disj", () => (tm("p \\/ (q /\\ r) ==> s"), dt("hp | hq hr")))
  st("DESTRUCT_paren", () => (tm("(p \\/ q) /\\ r ==> s"), dt("(hp | hq) _")))
  st("DESTRUCT_plus", () => (tm("p /\\ q ==> s"), dt("+ hq")))
  st("DESTRUCT_garbage", () => (tm("p ==> s"), dt("hp )")))
  st("DESTRUCT_bad", () => (tm("p ==> s"), dt("(")))
  st("INTRO_fix_dest", () => {
    let w = tm("forall x:A. P x ==> Q x")
    (w, @theorems.intro_tac("forall x; hp"))
  })
  st("INTRO_conj", () => {
    let w = tm("(p ==> q) /\\ (r ==> s)")
    (w, @theorems.intro_tac("{hp & hr}"))
  })
  st("INTRO_disj", () => {
    let w = tm("p \\/ (q ==> r) \\/ s")
    (w, @theorems.intro_tac("#2 hq"))
  })
  st("INTRO_zero", () => (tm("p \\/ q"), @theorems.intro_tac("#0")))
  st("INTRO_garbage", () => (tm("p ==> q"), @theorems.intro_tac("hp }")))
  st("FIX_vars", () => (tm("forall x y z:A. P x y z"), @theorems.fix_tac("x y")))
  st("FIX_rename", () => (tm("forall x y:A. P x y"), @theorems.fix_tac("[a/y] *")))
  st("FIX_star", () => (tm("forall x y:A. P x y"), @theorems.fix_tac("*")))
  st("FIX_missing", () => (tm("forall x:A. P x"), @theorems.fix_tac("y")))
  st("FIX_bad", () => (tm("forall x:A. P x"), @theorems.fix_tac("x ]")))
  st("HYP_destruct", () => {
    let w = tm("a /\\ b ==> c")
    let h = @theorems.hyp_tac("h: ha hb", th => th)
    (w, @tactics.then_tac(lab, h))
  })
  st("HYP_use", () => {
    let w = tm("a /\\ b ==> c")
    let h = @theorems.hyp_tac("h -> ha hb", th => th)
    (w, @tactics.then_tac(lab, h))
  })
  st("HYP_rule", () => {
    let w = tm("a /\\ b ==> c")
    let h = @theorems.hyp_tac("h", @bool.conjunct2)
    (w, @tactics.then_tac(lab, h))
  })
  st("HYP_bad", () => {
    let w = tm("a ==> c")
    let h = @theorems.hyp_tac("h ;", th => th)
    (w, @tactics.then_tac(lab, h))
  })
  st("CLAIM_TAC", () => {
    let w = tm("c:bool")
    let q = tm("p /\\ q")
    (w, @theorems.claim_tac("hp hq", q))
  })
  log.attempt("constants", () => {
    @kernel.constants().map(c => c.0).to_array().join(" ")
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
      #|theorems quotations (77):
      #|  \226\136\128 x : A, x == x
      #|  \226\136\128 x : A, (x == x) == true
      #|  \226\136\128 x : A, \226\136\128 y : A, x == y \226\134\146 y == x
      #|  \226\136\128 x : A, \226\136\128 y : A, (x == y) == (y == x)
      #|  \226\136\128 x : A, \226\136\128 y : A, \226\136\128 z : A, x == y && y == z \226\134\146 x == z
      #|  \226\136\128 f : (A) -> B, \226\136\128 y : A, ((x : A) => f(x))(y) == f(y)
      #|  \226\136\128 t1 : A, \226\136\128 t2 : B, ((x : B) => t1)(t2) == t1
      #|  \226\136\128 t1 : Bool, \226\136\128 t2 : Bool, \226\136\128 t3 : Bool, (t1 && t2 && t3) == ((t1 && t2) && t3)
      #|  \226\136\128 t1 : Bool, \226\136\128 t2 : Bool, (t1 && t2) == (t2 && t1)
      #|  ((p : Bool) && (q : Bool)) == (q && p) && ((p && q) && (r : Bool)) == (p && q && r) && (p && q && r) == (q && p && r) && (p && p) == p && (p && p && q) == (p && q)
      #|  \226\136\128 t1 : Bool, \226\136\128 t2 : Bool, \226\136\128 t3 : Bool, (t1 || t2 || t3) == ((t1 || t2) || t3)
      #|  \226\136\128 t1 : Bool, \226\136\128 t2 : Bool, (t1 || t2) == (t2 || t1)
      #|  ((p : Bool) || (q : Bool)) == (q || p) && ((p || q) || (r : Bool)) == (p || q || r) && (p || q || r) == (q || p || r) && (p || p) == p && (p || p || q) == (p || q)
      #|  ((p : Bool) && (q : Bool) \226\134\146 (r : Bool)) == (p \226\134\146 q \226\134\146 r)
      #|  ((p : Bool) && (q : Bool) \226\134\146 (r : Bool)) == (q \226\134\146 p \226\134\146 r)
      #|  \226\136\128 p : Bool, \226\136\128 q : Bool, \226\136\128 r : Bool, (p && (q || r)) == (p && q || p && r)
      #|  \226\136\128 p : Bool, \226\136\128 q : Bool, \226\136\128 r : Bool, ((p || q) && r) == (p && r || q && r)
      #|  \226\136\128 t : Bool, (\226\136\128 x : A, t) == t
      #|  \226\136\128 t : Bool, (\226\136\131 x : A, t) == t
      #|  (a : Bool) == (b : Bool) \226\134\146 a \226\134\146 b
      #|  \226\136\128 t : Bool, (true == t) == t && (t == true) == t && (false == t) == !t && (t == false) == !t
      #|  !true == false && !false == true
      #|  \226\136\128 t : Bool, (true && t) == t && (t && true) == t && (false && t) == false && (t && false) == false && (t && t) == t
      #|  \226\136\128 t : Bool, (true || t) == true && (t || true) == true && (false || t) == t && (t || false) == t && (t || t) == t
      #|  \226\136\128 t : Bool, (true \226\134\146 t) == t && (t \226\134\146 true) == true && (false \226\134\146 t) == true && (t \226\134\146 t) == true && (t \226\134\146 false) == !t
      #|  ((x : _) == x \226\134\146 (p : Bool)) == p
      #|  (p : Bool) == (p' : Bool) \226\134\146 (p' \226\134\146 (q : Bool) == (q' : Bool)) \226\134\146 (p \226\134\146 q) == (p' \226\134\146 q')
      #|  \226\136\128 P : (A) -> Bool, existsunique((x : A) => P(x)) == ((\226\136\131 x : A, P(x)) && (\226\136\128 x : A, \226\136\128 x' : A, P(x) && P(x') \226\134\146 x == x'))
      #|  (a : A)
      #|  \226\136\128 a : A, \226\136\131 x : A, x == a
      #|  (a : A)
      #|  \226\136\128 a : A, existsunique((x : A) => x == a)
      #|  (a : A)
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 a : A, (\226\136\131 x : A, a == x && P(x)) == P(a)
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 a : A, (\226\136\131 x : A, x == a && P(x)) == P(a)
      #|  (a : A)
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 a : A, (\226\136\128 x : A, x == a \226\134\146 P(x)) == P(a)
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 a : A, (\226\136\128 x : A, a == x \226\134\146 P(x)) == P(a)
      #|  \226\136\128 P : (A, B) -> Bool, (\226\136\128 x : A, \226\136\128 y : B, P(x, y)) == (\226\136\128 y : B, \226\136\128 x : A, P(x, y))
      #|  \226\136\128 P : (A, B) -> Bool, (\226\136\131 x : A, \226\136\131 y : B, P(x, y)) == (\226\136\131 y : B, \226\136\131 x : A, P(x, y))
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 Q : (A) -> Bool, (\226\136\128 x : A, P(x) && Q(x)) == ((\226\136\128 x : A, P(x)) && (\226\136\128 x : A, Q(x)))
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 Q : (A) -> Bool, ((\226\136\128 x : A, P(x)) && (\226\136\128 x : A, Q(x))) == (\226\136\128 x : A, P(x) && Q(x))
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 Q : Bool, ((\226\136\128 x : A, P(x)) && Q) == (\226\136\128 x : A, P(x) && Q)
      #|  \226\136\128 P : Bool, \226\136\128 Q : (A) -> Bool, (P && (\226\136\128 x : A, Q(x))) == (\226\136\128 x : A, P && Q(x))
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 Q : (A) -> Bool, (\226\136\131 x : A, P(x) || Q(x)) == ((\226\136\131 x : A, P(x)) || (\226\136\131 x : A, Q(x)))
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 Q : (A) -> Bool, ((\226\136\131 x : A, P(x)) || (\226\136\131 x : A, Q(x))) == (\226\136\131 x : A, P(x) || Q(x))
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 Q : Bool, ((\226\136\131 x : A, P(x)) || Q) == (\226\136\131 x : A, P(x) || Q)
      #|  \226\136\128 P : Bool, \226\136\128 Q : (A) -> Bool, (P || (\226\136\131 x : A, Q(x))) == (\226\136\131 x : A, P || Q(x))
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 Q : Bool, (\226\136\131 x : A, P(x) && Q) == ((\226\136\131 x : A, P(x)) && Q)
      #|  \226\136\128 P : Bool, \226\136\128 Q : (A) -> Bool, (\226\136\131 x : A, P && Q(x)) == (P && (\226\136\131 x : A, Q(x)))
      #|  \226\136\128 P : Bool, \226\136\128 Q : Bool, (\226\136\131 x : A, P && Q) == ((\226\136\131 x : A, P) && (\226\136\131 x : A, Q))
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 Q : Bool, ((\226\136\131 x : A, P(x)) && Q) == (\226\136\131 x : A, P(x) && Q)
      #|  \226\136\128 P : Bool, \226\136\128 Q : (A) -> Bool, (P && (\226\136\131 x : A, Q(x))) == (\226\136\131 x : A, P && Q(x))
      #|  \226\136\128 P : Bool, \226\136\128 Q : Bool, ((\226\136\131 x : A, P) && (\226\136\131 x : A, Q)) == (\226\136\131 x : A, P && Q)
      #|  \226\136\128 P : Bool, \226\136\128 Q : Bool, (\226\136\128 x : A, P || Q) == ((\226\136\128 x : A, P) || (\226\136\128 x : A, Q))
      #|  \226\136\128 P : Bool, \226\136\128 Q : Bool, ((\226\136\128 x : A, P) || (\226\136\128 x : A, Q)) == (\226\136\128 x : A, P || Q)
      #|  \226\136\128 P : Bool, \226\136\128 Q : (A) -> Bool, (P \226\134\146 (\226\136\128 x : A, Q(x))) == (\226\136\128 x : A, P \226\134\146 Q(x))
      #|  \226\136\128 P : Bool, \226\136\128 Q : (A) -> Bool, (\226\136\128 x : A, P \226\134\146 Q(x)) == (P \226\134\146 (\226\136\128 x : A, Q(x)))
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 Q : Bool, ((\226\136\131 x : A, P(x)) \226\134\146 Q) == (\226\136\128 x : A, P(x) \226\134\146 Q)
      #|  \226\136\128 P : (A) -> Bool, \226\136\128 Q : Bool, (\226\136\128 x : A, P(x) \226\134\146 Q) == ((\226\136\131 x : A, P(x)) \226\134\146 Q)
      #|  \226\136\128 P : Bool, \226\136\128 Q : Bool, (\226\136\128 x : A, P \226\134\146 Q) == ((\226\136\131 x : A, P) \226\134\146 (\226\136\128 x : A, Q))
      #|  \226\136\128 P : Bool, \226\136\128 Q : Bool, (\226\136\131 x : A, P \226\134\146 Q) == ((\226\136\128 x : A, P) \226\134\146 (\226\136\131 x : A, Q))
      #|  ((A : Bool) \226\134\146 (B : Bool)) && ((C : Bool) \226\134\146 (D : Bool)) \226\134\146 A && C \226\134\146 B && D
      #|  ((A : Bool) \226\134\146 (B : Bool)) && ((C : Bool) \226\134\146 (D : Bool)) \226\134\146 A || C \226\134\146 B || D
      #|  ((B : Bool) \226\134\146 (A : Bool)) && ((C : Bool) \226\134\146 (D : Bool)) \226\134\146 (A \226\134\146 C) \226\134\146 B \226\134\146 D
      #|  ((B : Bool) \226\134\146 (A : Bool)) \226\134\146 !A \226\134\146 !B
      #|  (\226\136\128 x : A, (P : (A) -> Bool)(x) \226\134\146 (Q : (A) -> Bool)(x)) \226\134\146 (\226\136\128 x : A, P(x)) \226\134\146 (\226\136\128 x : A, Q(x))
      #|  (x : A)
      #|  (x : A)
      #|  (\226\136\128 x : A, (P : (A) -> Bool)(x) \226\134\146 (Q : (A) -> Bool)(x)) \226\134\146 (\226\136\131 x : A, P(x)) \226\134\146 (\226\136\131 x : A, Q(x))
      #|  \226\136\128 R : (A, A) -> Bool, \226\136\128 P : (A, A) -> Bool, (\226\136\128 x : A, \226\136\128 y : A, P(x, y) \226\134\146 P(y, x)) && (\226\136\128 x : A, \226\136\128 y : A, R(x, y) || R(y, x)) && (\226\136\128 x : A, \226\136\128 y : A, R(x, y) \226\134\146 P(x, y)) \226\134\146 (\226\136\128 x : A, \226\136\128 y : A, P(x, y))
      #|  (x : A)
      #|  (x : A)
      #|  (x : A)
      #|  \226\136\128 P : (A) -> Bool, existsunique((x : A) => P(x)) == (\226\136\131 x : A, \226\136\128 y : A, P(y) == (x == y))
      #|  ((a : Bool) == (b : Bool)) == ((a \226\134\146 b) && (b \226\134\146 a))
      #|  \226\136\128 P : (A) -> Bool, existsunique((x : A) => P(x)) == (\226\136\131 x : A, P(x) && (\226\136\128 y : A, P(y) \226\134\146 y == x))
      #|EQ_REFL =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('A,fun('A,bool)) x:'A) x:'A)))
      #|REFL_CLAUSE =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. ((#=:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) x:'A) x:'A)) #T:bool)))
      #|EQ_SYM =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)) ((#=:fun('A,fun('A,bool)) y:'A) x:'A))))))
      #|EQ_SYM_EQ =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#=:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)) ((#=:fun('A,fun('A,bool)) y:'A) x:'A))))))
      #|EQ_TRANS =  |- (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. (#forall:fun(fun('A,bool),bool) (\z:'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)) ((#=:fun('A,fun('A,bool)) y:'A) z:'A))) ((#=:fun('A,fun('A,bool)) x:'A) z:'A))))))))
      #|BETA_THM =  |- (#forall:fun(fun(fun('A,'B),bool),bool) (\f:fun('A,'B). (#forall:fun(fun('A,bool),bool) (\y:'A. ((#=:fun('B,fun('B,bool)) ((\x:'A. (f:fun('A,'B) x:'A)) y:'A)) (f:fun('A,'B) y:'A))))))
      #|ABS_SIMP =  |- (#forall:fun(fun('A,bool),bool) (\t1:'A. (#forall:fun(fun('B,bool),bool) (\t2:'B. ((#=:fun('A,fun('A,bool)) ((\x:'B. t1:'A) t2:'B)) t1:'A)))))
      #|CONJ_ASSOC =  |- (#forall:fun(fun(bool,bool),bool) (\t1:bool. (#forall:fun(fun(bool,bool),bool) (\t2:bool. (#forall:fun(fun(bool,bool),bool) (\t3:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) t1:bool) ((#/\:fun(bool,fun(bool,bool)) t2:bool) t3:bool))) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) t1:bool) t2:bool)) t3:bool))))))))
      #|CONJ_SYM =  |- (#forall:fun(fun(bool,bool),bool) (\t1:bool. (#forall:fun(fun(bool,bool),bool) (\t2:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) t1:bool) t2:bool)) ((#/\:fun(bool,fun(bool,bool)) t2:bool) t1:bool))))))
      #|CONJ_ACI =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) q:bool)) ((#/\:fun(bool,fun(bool,bool)) q:bool) p:bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) q:bool)) r:bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) ((#/\:fun(bool,fun(bool,bool)) q:bool) r:bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) ((#/\:fun(bool,fun(bool,bool)) q:bool) r:bool))) ((#/\:fun(bool,fun(bool,bool)) q:bool) ((#/\:fun(bool,fun(bool,bool)) p:bool) r:bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) p:bool)) p:bool)) ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) ((#/\:fun(bool,fun(bool,bool)) p:bool) q:bool))) ((#/\:fun(bool,fun(bool,bool)) p:bool) q:bool))))))
      #|DISJ_ASSOC =  |- (#forall:fun(fun(bool,bool),bool) (\t1:bool. (#forall:fun(fun(bool,bool),bool) (\t2:bool. (#forall:fun(fun(bool,bool),bool) (\t3:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) t1:bool) ((#\/:fun(bool,fun(bool,bool)) t2:bool) t3:bool))) ((#\/:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) t1:bool) t2:bool)) t3:bool))))))))
      #|DISJ_SYM =  |- (#forall:fun(fun(bool,bool),bool) (\t1:bool. (#forall:fun(fun(bool,bool),bool) (\t2:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) t1:bool) t2:bool)) ((#\/:fun(bool,fun(bool,bool)) t2:bool) t1:bool))))))
      #|DISJ_ACI =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) p:bool) q:bool)) ((#\/:fun(bool,fun(bool,bool)) q:bool) p:bool))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) p:bool) q:bool)) r:bool)) ((#\/:fun(bool,fun(bool,bool)) p:bool) ((#\/:fun(bool,fun(bool,bool)) q:bool) r:bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) p:bool) ((#\/:fun(bool,fun(bool,bool)) q:bool) r:bool))) ((#\/:fun(bool,fun(bool,bool)) q:bool) ((#\/:fun(bool,fun(bool,bool)) p:bool) r:bool)))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) p:bool) p:bool)) p:bool)) ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) p:bool) ((#\/:fun(bool,fun(bool,bool)) p:bool) q:bool))) ((#\/:fun(bool,fun(bool,bool)) p:bool) q:bool))))))
      #|IMP_CONJ =  |- ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) q:bool)) r:bool)) ((#==>:fun(bool,fun(bool,bool)) p:bool) ((#==>:fun(bool,fun(bool,bool)) q:bool) r:bool)))
      #|IMP_IMP =  |- ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) p:bool) ((#==>:fun(bool,fun(bool,bool)) q:bool) r:bool))) ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) q:bool)) r:bool))
      #|IMP_CONJ_ALT =  |- ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) q:bool)) r:bool)) ((#==>:fun(bool,fun(bool,bool)) q:bool) ((#==>:fun(bool,fun(bool,bool)) p:bool) r:bool)))
      #|LEFT_OR_DISTRIB =  |- (#forall:fun(fun(bool,bool),bool) (\p:bool. (#forall:fun(fun(bool,bool),bool) (\q:bool. (#forall:fun(fun(bool,bool),bool) (\r:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) ((#\/:fun(bool,fun(bool,bool)) q:bool) r:bool))) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) q:bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) r:bool)))))))))
      #|RIGHT_OR_DISTRIB =  |- (#forall:fun(fun(bool,bool),bool) (\p:bool. (#forall:fun(fun(bool,bool),bool) (\q:bool. (#forall:fun(fun(bool,bool),bool) (\r:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) p:bool) q:bool)) r:bool)) ((#\/:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) r:bool)) ((#/\:fun(bool,fun(bool,bool)) q:bool) r:bool)))))))))
      #|FORALL_SIMP =  |- (#forall:fun(fun(bool,bool),bool) (\t:bool. ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. t:bool))) t:bool)))
      #|EXISTS_SIMP =  |- (#forall:fun(fun(bool,bool),bool) (\t:bool. ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. t:bool))) t:bool)))
      #|EQ_IMP =  |- ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) a:bool) b:bool)) ((#==>:fun(bool,fun(bool,bool)) a:bool) b:bool))
      #|EQ_CLAUSES =  |- (#forall:fun(fun(bool,bool),bool) (\t:bool. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) #T:bool) t:bool)) t:bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) t:bool) #T:bool)) t:bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) #F:bool) t:bool)) (#~:fun(bool,bool) t:bool))) ((#=:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) t:bool) #F:bool)) (#~:fun(bool,bool) t:bool)))))))
      #|NOT_CLAUSES_WEAK =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) #T:bool)) #F:bool)) ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) #F:bool)) #T:bool))
      #|AND_CLAUSES =  |- (#forall:fun(fun(bool,bool),bool) (\t:bool. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) #T:bool) t:bool)) t:bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) t:bool) #T:bool)) t:bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) #F:bool) t:bool)) #F:bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) t:bool) #F:bool)) #F:bool)) ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) t:bool) t:bool)) t:bool)))))))
      #|OR_CLAUSES =  |- (#forall:fun(fun(bool,bool),bool) (\t:bool. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) #T:bool) t:bool)) #T:bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) t:bool) #T:bool)) #T:bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) #F:bool) t:bool)) t:bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) t:bool) #F:bool)) t:bool)) ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) t:bool) t:bool)) t:bool)))))))
      #|IMP_CLAUSES =  |- (#forall:fun(fun(bool,bool),bool) (\t:bool. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) #T:bool) t:bool)) t:bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) t:bool) #T:bool)) #T:bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) #F:bool) t:bool)) #T:bool)) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) t:bool) t:bool)) #T:bool)) ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) t:bool) #F:bool)) (#~:fun(bool,bool) t:bool))))))))
      #|EXISTS_UNIQUE_THM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#?!:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\x':'A. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (P:fun('A,bool) x':'A))) ((#=:fun('A,fun('A,bool)) x:'A) x':'A))))))))))
      #|EXISTS_REFL =  |- (#forall:fun(fun('A,bool),bool) (\a:'A. (#?:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('A,fun('A,bool)) x:'A) a:'A)))))
      #|EXISTS_UNIQUE_REFL =  |- (#forall:fun(fun('A,bool),bool) (\a:'A. (#?!:fun(fun('A,bool),bool) (\x:'A. ((#=:fun('A,fun('A,bool)) x:'A) a:'A)))))
      #|UNWIND_THM1 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\a:'A. ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) a:'A) x:'A)) (P:fun('A,bool) x:'A))))) (P:fun('A,bool) a:'A))))))
      #|UNWIND_THM2 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\a:'A. ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) x:'A) a:'A)) (P:fun('A,bool) x:'A))))) (P:fun('A,bool) a:'A))))))
      #|FORALL_UNWIND_THM2 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\a:'A. ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) x:'A) a:'A)) (P:fun('A,bool) x:'A))))) (P:fun('A,bool) a:'A))))))
      #|FORALL_UNWIND_THM1 =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\a:'A. ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) a:'A) x:'A)) (P:fun('A,bool) x:'A))))) (P:fun('A,bool) a:'A))))))
      #|SWAP_FORALL_THM =  |- (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\P:fun('A,fun('B,bool)). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('B,bool),bool) (\y:'B. ((P:fun('A,fun('B,bool)) x:'A) y:'B)))))) (#forall:fun(fun('B,bool),bool) (\y:'B. (#forall:fun(fun('A,bool),bool) (\x:'A. ((P:fun('A,fun('B,bool)) x:'A) y:'B))))))))
      #|SWAP_EXISTS_THM =  |- (#forall:fun(fun(fun('A,fun('B,bool)),bool),bool) (\P:fun('A,fun('B,bool)). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. (#?:fun(fun('B,bool),bool) (\y:'B. ((P:fun('A,fun('B,bool)) x:'A) y:'B)))))) (#?:fun(fun('B,bool),bool) (\y:'B. (#?:fun(fun('A,bool),bool) (\x:'A. ((P:fun('A,fun('B,bool)) x:'A) y:'B))))))))
      #|FORALL_AND_THM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\Q:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (Q:fun('A,bool) x:'A))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (Q:fun('A,bool) x:'A)))))))))
      #|AND_FORALL_THM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\Q:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (Q:fun('A,bool) x:'A))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (Q:fun('A,bool) x:'A)))))))))
      #|LEFT_AND_FORALL_THM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(bool,bool),bool) (\Q:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))) Q:bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) Q:bool))))))))
      #|RIGHT_AND_FORALL_THM =  |- (#forall:fun(fun(bool,bool),bool) (\P:bool. (#forall:fun(fun(fun('A,bool),bool),bool) (\Q:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) P:bool) (#forall:fun(fun('A,bool),bool) (\x:'A. (Q:fun('A,bool) x:'A))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) P:bool) (Q:fun('A,bool) x:'A)))))))))
      #|EXISTS_OR_THM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\Q:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. ((#\/:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (Q:fun('A,bool) x:'A))))) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))) (#?:fun(fun('A,bool),bool) (\x:'A. (Q:fun('A,bool) x:'A)))))))))
      #|OR_EXISTS_THM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(fun('A,bool),bool),bool) (\Q:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))) (#?:fun(fun('A,bool),bool) (\x:'A. (Q:fun('A,bool) x:'A))))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#\/:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (Q:fun('A,bool) x:'A)))))))))
      #|LEFT_OR_EXISTS_THM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(bool,bool),bool) (\Q:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))) Q:bool)) (#?:fun(fun('A,bool),bool) (\x:'A. ((#\/:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) Q:bool))))))))
      #|RIGHT_OR_EXISTS_THM =  |- (#forall:fun(fun(bool,bool),bool) (\P:bool. (#forall:fun(fun(fun('A,bool),bool),bool) (\Q:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) P:bool) (#?:fun(fun('A,bool),bool) (\x:'A. (Q:fun('A,bool) x:'A))))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#\/:fun(bool,fun(bool,bool)) P:bool) (Q:fun('A,bool) x:'A)))))))))
      #|LEFT_EXISTS_AND_THM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(bool,bool),bool) (\Q:bool. ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) Q:bool)))) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))) Q:bool))))))
      #|RIGHT_EXISTS_AND_THM =  |- (#forall:fun(fun(bool,bool),bool) (\P:bool. (#forall:fun(fun(fun('A,bool),bool),bool) (\Q:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) P:bool) (Q:fun('A,bool) x:'A))))) ((#/\:fun(bool,fun(bool,bool)) P:bool) (#?:fun(fun('A,bool),bool) (\x:'A. (Q:fun('A,bool) x:'A)))))))))
      #|TRIV_EXISTS_AND_THM =  |- (#forall:fun(fun(bool,bool),bool) (\P:bool. (#forall:fun(fun(bool,bool),bool) (\Q:bool. ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) P:bool) Q:bool)))) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. P:bool))) (#?:fun(fun('A,bool),bool) (\x:'A. Q:bool))))))))
      #|LEFT_AND_EXISTS_THM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(bool,bool),bool) (\Q:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))) Q:bool)) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) Q:bool))))))))
      #|RIGHT_AND_EXISTS_THM =  |- (#forall:fun(fun(bool,bool),bool) (\P:bool. (#forall:fun(fun(fun('A,bool),bool),bool) (\Q:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) P:bool) (#?:fun(fun('A,bool),bool) (\x:'A. (Q:fun('A,bool) x:'A))))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) P:bool) (Q:fun('A,bool) x:'A)))))))))
      #|TRIV_AND_EXISTS_THM =  |- (#forall:fun(fun(bool,bool),bool) (\P:bool. (#forall:fun(fun(bool,bool),bool) (\Q:bool. ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. P:bool))) (#?:fun(fun('A,bool),bool) (\x:'A. Q:bool)))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) P:bool) Q:bool))))))))
      #|TRIV_FORALL_OR_THM =  |- (#forall:fun(fun(bool,bool),bool) (\P:bool. (#forall:fun(fun(bool,bool),bool) (\Q:bool. ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#\/:fun(bool,fun(bool,bool)) P:bool) Q:bool)))) ((#\/:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. P:bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. Q:bool))))))))
      #|TRIV_OR_FORALL_THM =  |- (#forall:fun(fun(bool,bool),bool) (\P:bool. (#forall:fun(fun(bool,bool),bool) (\Q:bool. ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. P:bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. Q:bool)))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#\/:fun(bool,fun(bool,bool)) P:bool) Q:bool))))))))
      #|RIGHT_IMP_FORALL_THM =  |- (#forall:fun(fun(bool,bool),bool) (\P:bool. (#forall:fun(fun(fun('A,bool),bool),bool) (\Q:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) P:bool) (#forall:fun(fun('A,bool),bool) (\x:'A. (Q:fun('A,bool) x:'A))))) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) P:bool) (Q:fun('A,bool) x:'A)))))))))
      #|RIGHT_FORALL_IMP_THM =  |- (#forall:fun(fun(bool,bool),bool) (\P:bool. (#forall:fun(fun(fun('A,bool),bool),bool) (\Q:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) P:bool) (Q:fun('A,bool) x:'A))))) ((#==>:fun(bool,fun(bool,bool)) P:bool) (#forall:fun(fun('A,bool),bool) (\x:'A. (Q:fun('A,bool) x:'A)))))))))
      #|LEFT_IMP_EXISTS_THM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(bool,bool),bool) (\Q:bool. ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))) Q:bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) Q:bool))))))))
      #|LEFT_FORALL_IMP_THM =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun(bool,bool),bool) (\Q:bool. ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) Q:bool)))) ((#==>:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))) Q:bool))))))
      #|TRIV_FORALL_IMP_THM =  |- (#forall:fun(fun(bool,bool),bool) (\P:bool. (#forall:fun(fun(bool,bool),bool) (\Q:bool. ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) P:bool) Q:bool)))) ((#==>:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. P:bool))) (#forall:fun(fun('A,bool),bool) (\x:'A. Q:bool))))))))
      #|TRIV_EXISTS_IMP_THM =  |- (#forall:fun(fun(bool,bool),bool) (\P:bool. (#forall:fun(fun(bool,bool),bool) (\Q:bool. ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) P:bool) Q:bool)))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. P:bool))) (#?:fun(fun('A,bool),bool) (\x:'A. Q:bool))))))))
      #|MONO_AND =  |- ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) A:bool) B:bool)) ((#==>:fun(bool,fun(bool,bool)) C:bool) D:bool))) ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) A:bool) C:bool)) ((#/\:fun(bool,fun(bool,bool)) B:bool) D:bool)))
      #|MONO_OR =  |- ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) A:bool) B:bool)) ((#==>:fun(bool,fun(bool,bool)) C:bool) D:bool))) ((#==>:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) A:bool) C:bool)) ((#\/:fun(bool,fun(bool,bool)) B:bool) D:bool)))
      #|MONO_IMP =  |- ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) B:bool) A:bool)) ((#==>:fun(bool,fun(bool,bool)) C:bool) D:bool))) ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) A:bool) C:bool)) ((#==>:fun(bool,fun(bool,bool)) B:bool) D:bool)))
      #|MONO_NOT =  |- ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) B:bool) A:bool)) ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) A:bool)) (#~:fun(bool,bool) B:bool)))
      #|MONO_FORALL =  |- ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (Q:fun('A,bool) x:'A))))) ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))) (#forall:fun(fun('A,bool),bool) (\x:'A. (Q:fun('A,bool) x:'A)))))
      #|MONO_EXISTS =  |- ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (Q:fun('A,bool) x:'A))))) ((#==>:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))) (#?:fun(fun('A,bool),bool) (\x:'A. (Q:fun('A,bool) x:'A)))))
      #|WLOG_RELATION =  |- (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\R:fun('A,fun('A,bool)). (#forall:fun(fun(fun('A,fun('A,bool)),bool),bool) (\P:fun('A,fun('A,bool)). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((P:fun('A,fun('A,bool)) x:'A) y:'A)) ((P:fun('A,fun('A,bool)) y:'A) x:'A))))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#\/:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) x:'A) y:'A)) ((R:fun('A,fun('A,bool)) y:'A) x:'A))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) ((R:fun('A,fun('A,bool)) x:'A) y:'A)) ((P:fun('A,fun('A,bool)) x:'A) y:'A))))))))) (#forall:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((P:fun('A,fun('A,bool)) x:'A) y:'A))))))))))
      #|EXISTS_UNIQUE_ALT =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#?!:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))) (#?:fun(fun('A,bool),bool) (\x:'A. (#forall:fun(fun('A,bool),bool) (\y:'A. ((#=:fun(bool,fun(bool,bool)) (P:fun('A,bool) y:'A)) ((#=:fun('A,fun('A,bool)) x:'A) y:'A)))))))))
      #|EXISTS_UNIQUE =  |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). ((#=:fun(bool,fun(bool,bool)) (#?!:fun(fun('A,bool),bool) (\x:'A. (P:fun('A,bool) x:'A)))) (#?:fun(fun('A,bool),bool) (\x:'A. ((#/\:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (#forall:fun(fun('A,bool),bool) (\y:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) y:'A)) ((#=:fun('A,fun('A,bool)) y:'A) x:'A))))))))))
      #|basic_rewrites =  |- ((#=:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) x:'A) x:'A)) #T:bool) ;;  |- ((#=:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) #T:bool) t:bool)) t:bool) ;;  |- ((#=:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) t:bool) #T:bool)) t:bool) ;;  |- ((#=:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) #F:bool) t:bool)) (#~:fun(bool,bool) t:bool)) ;;  |- ((#=:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) t:bool) #F:bool)) (#~:fun(bool,bool) t:bool)) ;;  |- ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) #T:bool)) #F:bool) ;;  |- ((#=:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) #F:bool)) #T:bool) ;;  |- ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) #T:bool) t:bool)) t:bool) ;;  |- ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) t:bool) #T:bool)) t:bool) ;;  |- ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) #F:bool) t:bool)) #F:bool) ;;  |- ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) t:bool) #F:bool)) #F:bool) ;;  |- ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) t:bool) t:bool)) t:bool) ;;  |- ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) #T:bool) t:bool)) #T:bool) ;;  |- ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) t:bool) #T:bool)) #T:bool) ;;  |- ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) #F:bool) t:bool)) t:bool) ;;  |- ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) t:bool) #F:bool)) t:bool) ;;  |- ((#=:fun(bool,fun(bool,bool)) ((#\/:fun(bool,fun(bool,bool)) t:bool) t:bool)) t:bool) ;;  |- ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) #T:bool) t:bool)) t:bool) ;;  |- ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) t:bool) #T:bool)) #T:bool) ;;  |- ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) #F:bool) t:bool)) #T:bool) ;;  |- ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) t:bool) t:bool)) #T:bool) ;;  |- ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) t:bool) #F:bool)) (#~:fun(bool,bool) t:bool)) ;;  |- ((#=:fun(bool,fun(bool,bool)) (#forall:fun(fun('A,bool),bool) (\x:'A. t:bool))) t:bool) ;;  |- ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun('A,bool),bool) (\x:'A. t:bool))) t:bool) ;;  |- ((#=:fun('B,fun('B,bool)) ((\x:'A. (f:fun('A,'B) x:'A)) y:'A)) (f:fun('A,'B) y:'A)) ;;  |- ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('?1,fun('?1,bool)) x:'?1) x:'?1)) p:bool)) p:bool)
      #|basic_congs =  |- ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) p:bool) p':bool)) ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) p':bool) ((#=:fun(bool,fun(bool,bool)) q:bool) q':bool))) ((#=:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) p:bool) q:bool)) ((#==>:fun(bool,fun(bool,bool)) p':bool) q':bool))))
      #|AC =  |- ((#=:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) ((#/\:fun(bool,fun(bool,bool)) q:bool) r:bool))) ((#/\:fun(bool,fun(bool,bool)) r:bool) ((#/\:fun(bool,fun(bool,bool)) q:bool) p:bool)))
      #|AC_bad ! EQT_ELIM
      #|DESTRUCT_obtain = [\n  0 [`P x`] (hp)\n  1 [`Q x`] (hq)\n\n`R`\n]
      #|DESTRUCT_disj = [\n  0 [`p`] (hp)\n\n`s`\n; \n  0 [`q`] (hq)\n  1 [`r`] (hr)\n\n`s`\n]
      #|DESTRUCT_paren = [\n  0 [`p`] (hp)\n\n`s`\n; \n  0 [`q`] (hq)\n\n`s`\n]
      #|DESTRUCT_plus = [\n  0 [`q`] (hq)\n\n`p ==> s`\n]
      #|DESTRUCT_garbage ! Garbage after destruct pattern
      #|DESTRUCT_bad ! Destruct pattern expected
      #|INTRO_fix_dest = [\n  0 [`P x`] (hp)\n\n`Q x`\n]
      #|INTRO_conj = [\n  0 [`p`] (hp)\n\n`q`\n; \n  0 [`r`] (hr)\n\n`s`\n]
      #|INTRO_disj = [\n  0 [`q`] (hq)\n\n`r`\n]
      #|INTRO_zero ! Garbage after intro pattern
      #|INTRO_garbage ! Garbage after intro pattern
      #|Warning: inventing type variables
      #|FIX_vars = [\n`forall z. (P:?2->?3->A->bool) (x:?2) (y:?3) z`\n]
      #|Warning: inventing type variables
      #|FIX_rename = [\n`(P:?4->A->bool) (x:?4) a`\n]
      #|Warning: inventing type variables
      #|FIX_star = [\n`(P:?5->A->bool) (x:?5) y`\n]
      #|FIX_missing ! 
      #|FIX_bad ! FIX_TAC: invalid pattern
      #|HYP_destruct = [\n  0 [`a`] (ha)\n  1 [`b`] (hb)\n\n`c`\n]
      #|HYP_use = [\n  0 [`a /\\ b`] (h)\n  1 [`a`] (ha)\n  2 [`b`] (hb)\n\n`c`\n]
      #|HYP_rule = [\n  0 [`b`] (h)\n\n`c`\n]
      #|HYP_bad ! HYP_TAC: invalid pattern
      #|CLAIM_TAC = [\n`p /\\ q`\n; \n  0 [`p`] (hp)\n  1 [`q`] (hq)\n\n`c`\n]
      #|constants = _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|axioms = 0
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?6
      #|counter_genvar = _383:bool
      #|
    ),
  )
}
