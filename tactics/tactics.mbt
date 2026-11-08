// ===========================================================================
// System of tactics (port of tactics.ml).
//
// Tactics, theorem tactics and tacticals are closures. Where upstream does
// work before receiving the goal (`X_CHOOSE_TAC x th`, `MATCH_MP_TAC th`,
// `CONJUNCTS_THEN2 t1 t2 th`, ...), the MoonBit function does the same work
// and returns the tactic.
// ===========================================================================

///|
using @kernel {type Term, type Thm}

///|
using @list {type List}

///|
using @lib {type Cell}

///|
using @equal {type Conv}

///|
using @drule {type Instantiation}

///|
using @pp {type Formatter}


///|
fn[T] fail_() -> T raise {
  raise Failure("")
}

///|
fn[T] match_failure() -> T raise {
  raise @lib.MatchFailure("tactics.ml")
}

///|
/// The trivial instantiation.
pub let null_inst : Instantiation = (
  @list.List([]),
  @list.List([]),
  @list.List([]),
)

///|
/// No metavariables and the trivial instantiation.
pub let null_meta : (List[Term], Instantiation) = (@list.List([]), null_inst)

///|
/// A goal: labelled assumptions (as theorems) and a conclusion.
pub type Goal = (List[(String, Thm)], Term)

///|
/// A justification: given an instantiation and theorems for the subgoals,
/// a theorem for the (instantiated) goal.
pub type Justification = (Instantiation, List[Thm]) -> Thm raise

///|
/// Metavariables and instantiation, subgoals, and justification.
pub type Goalstate = ((List[Term], Instantiation), List[Goal], Justification)

///|
pub type Goalstack = List[Goalstate]

///|
pub type Refinement = (Goalstate) -> Goalstate raise

///|
pub type Tactic = (Goal) -> Goalstate raise

///|
pub type ThmTactic = (Thm) -> Tactic raise

///|
pub type ThmTactical = (ThmTactic) -> ThmTactic raise

///|
/// The single theorem of a justification argument (`fun _ [th] -> ...`).
fn one(ths : List[Thm]) -> Thm raise {
  match ths {
    More(th, tail=Empty) => th
    _ => match_failure()
  }
}

///|
fn two(ths : List[Thm]) -> (Thm, Thm) raise {
  match ths {
    More(a, tail=More(b, tail=Empty)) => (a, b)
    _ => match_failure()
  }
}

///|
fn no_ths(ths : List[Thm]) -> Unit raise {
  match ths {
    Empty => ()
    _ => match_failure()
  }
}

///|
pub fn equals_goal(g1 : Goal, g2 : Goal) -> Bool {
  let (a, w) = g1
  let (a1, w1) = g2
  @lib.forall2(
    (p : (String, Thm), p1 : (String, Thm)) => {
      p.0 == p1.0 && @basics.equals_thm(p.1, p1.1)
    },
    a,
    a1,
  ) &&
  w == w1
}

///|
/// Apply an instantiation to a goal.
pub fn inst_goal(p : Instantiation, g : Goal) -> Goal raise {
  let (thms, w) = g
  // The pair is evaluated right to left.
  let w1 = @drule.instantiate(p, w)
  let thms1 = @lib.map(
    (st : (String, Thm)) => (st.0, @drule.instantiate_all(p, st.1)),
    thms,
  )
  (thms1, w1)
}

///|
/// Sequential composition (left first) of instantiations.
pub fn compose_insts(
  i1 : Instantiation,
  i2 : Instantiation,
) -> Instantiation raise {
  let (pats1, tmin1, tyin1) = i1
  let (pats2, tmin2, tyin2) = i2
  let tmin = @lib.map(
    (p : (Term, Term)) => {
      let b = @kernel.inst(tyin2, p.1)
      (@drule.instantiate(i2, p.0), b)
    },
    tmin1,
  )
  let tyin = @lib.map(
    (p : (@kernel.HolType, @kernel.HolType)) => {
      (@kernel.type_subst(tyin2, p.0), p.1)
    },
    tyin1,
  )
  let tmin1_ = @lib.filter(
    (p : (Term, Term)) => !@lib.can(x => @lib.rev_assoc(x, tmin), p.1),
    tmin2,
  )
  let tyin1_ = @lib.filter(
    (p : (@kernel.HolType, @kernel.HolType)) => {
      !@lib.can(x => @lib.rev_assoc(x, tyin), p.1)
    },
    tyin2,
  )
  (pats1.concat(pats2), tmin.concat(tmin1_), tyin.concat(tyin1_))
}

// ---------------------------------------------------------------------------
// Falsity and validity checking.
// ---------------------------------------------------------------------------

///|
let falsity_c : Cell[Thm] = Cell::new("_FALSITY_")

///|
/// `_FALSITY_`: `|- _FALSITY_ = F`
pub fn falsity() -> Thm {
  falsity_c.get()
}

///|
let mk_fthm_pth : Cell[Thm] = Cell::new("mk_fthm")

///|
let mk_fthm_qth : Cell[Thm] = Cell::new("mk_fthm")

///|
/// `mk_fthm(asl, c)`: `asl, _FALSITY_ |- c`.
pub fn mk_fthm(asl : List[Term], c : Term) -> Thm raise {
  @bool.prove_hyp(
    mk_fthm_qth.get(),
    @lib.itlist(@bool.add_assum, asl.rev(), @bool.contr(c, mk_fthm_pth.get())),
  )
}

///|
let valid_false_tm : Cell[Term] = Cell::new("VALID")

///|
/// `VALID`: check that a tactic's justification proves the goal.
pub fn valid(tac : Tactic) -> Tactic {
  g => {
    let (asl, w) = g
    let res = tac(g)
    let ((_, i), gls, just) = res
    let fake_thm = (gl : Goal) => {
      let asms = @lib.itlist(
        (p : (String, Thm), acc) => @lib.union(@kernel.hyp(p.1), acc),
        gl.0,
        @list.List([]),
      )
      mk_fthm(asms, gl.1)
    }
    let ths = @lib.map(fake_thm, gls)
    let (asl1, w1) = @kernel.dest_thm(just(null_inst, ths))
    let (asl2, w2) = inst_goal(i, (asl, w))
    let maxasms = @lib.itlist(
      (p : (String, Thm), acc) => {
        @lib.union(@lib.insert(@kernel.concl(p.1), @kernel.hyp(p.1)), acc)
      },
      asl2,
      @list.List([]),
    )
    if @basics.aconv(w1, w2) &&
      @lib.forall(
        t => @lib.exists(a => @basics.aconv(t, a), maxasms),
        @lib.subtract(asl1, @list.singleton(valid_false_tm.get())),
      ) {
      res
    } else {
      raise Failure("VALID: Invalid tactic")
    }
  }
}

// ---------------------------------------------------------------------------
// THEN, THENL.
// ---------------------------------------------------------------------------

///|
fn propagate_thm(th : Thm) -> Justification {
  (i, ths) => {
    no_ths(ths)
    @drule.instantiate_all(i, th)
  }
}

///|
/// The justification of a sequence: a list of theorems (one per subgoal of
/// the first goal of the sequence, then the rest).
type SeqJust = (Instantiation, List[Thm]) -> List[Thm] raise

///|
fn seqapply(
  l1 : List[Tactic],
  l2 : List[Goal],
) -> ((List[Term], Instantiation), List[Goal], SeqJust) raise {
  match (l1, l2) {
    (Empty, Empty) =>
      (
        null_meta,
        @list.List([]),
        (_, ths) => {
          no_ths(ths)
          @list.List([])
        },
      )
    (More(tac, tail=tacs), More(goal, tail=goals)) => {
      let ((mvs1, insts1), gls1, just1) = tac(goal)
      let goals1 = @lib.map(gl => inst_goal(insts1, gl), goals)
      let ((mvs2, insts2), gls2, just2) = seqapply(tacs, goals1)
      let n = gls1.length()
      let just : SeqJust = (i, ths) => {
        let (ths1, ths2) = @lib.chop_list(n, ths)
        // `just1 ... :: just2 i ths2`: the tail is evaluated first.
        let rest = just2(i, ths2)
        rest.prepend(just1(compose_insts(insts2, i), ths1))
      }
      // The tuple is evaluated right to left.
      let gls = @lib.map(gl => inst_goal(insts2, gl), gls1).concat(gls2)
      ((@lib.union(mvs1, mvs2), compose_insts(insts1, insts2)), gls, just)
    }
    _ => raise Failure("seqapply: Length mismatch")
  }
}

///|
fn tacsequence(gstate : Goalstate, tacl : List[Tactic]) -> Goalstate raise {
  let ((mvs1, insts1), gls1, just1) = gstate
  let ((mvs2, insts2), gls2, just2) = seqapply(tacl, gls1)
  let jst : Justification = (i, ths) => {
    // `just1 (compose_insts insts2 i) (just2 i ths)`: right to left.
    let sub = just2(i, ths)
    just1(compose_insts(insts2, i), sub)
  }
  let just = if gls2.is_empty() {
    propagate_thm(jst(null_inst, @list.List([])))
  } else {
    jst
  }
  ((@lib.union(mvs1, mvs2), compose_insts(insts1, insts2)), gls2, just)
}

///|
/// `tac1 THEN tac2`: apply `tac2` to every subgoal of `tac1`.
pub fn then_tac(tac1 : Tactic, tac2 : Tactic) -> Tactic {
  g => {
    let gstate = tac1(g)
    tacsequence(gstate, @lib.replicate(tac2, gstate.1.length()))
  }
}

///|
/// `tac1 THENL [t1; ...; tn]`: apply `ti` to the ith subgoal.
pub fn thenl(tac1 : Tactic, tac2l : List[Tactic]) -> Tactic {
  g => {
    let gstate = tac1(g)
    if gstate.1.is_empty() {
      tacsequence(gstate, @list.List([]))
    } else {
      tacsequence(gstate, tac2l)
    }
  }
}

///|
/// `then1_ tac1 tac2 = tac1 THENL [tac2]`
pub fn then1(tac1 : Tactic, tac2 : Tactic) -> Tactic {
  thenl(tac1, @list.singleton(tac2))
}

///|
/// `tac1 ORELSE tac2`
pub fn orelse_tac(tac1 : Tactic, tac2 : Tactic) -> Tactic {
  g => {
    tac1(g) catch {
      Failure(_) => tac2(g)
      e => raise e
    }
  }
}

///|
/// `FAIL_TAC tok`
pub fn fail_tac(tok : String) -> Tactic {
  _ => raise Failure(tok)
}

///|
/// `NO_TAC`
pub let no_tac : Tactic = fail_tac("NO_TAC")

///|
/// `ALL_TAC`
pub let all_tac : Tactic = g => {
  (null_meta, @list.singleton(g), (_, ths) => one(ths))
}

///|
/// `TRY tac`
pub fn try_tac(tac : Tactic) -> Tactic {
  orelse_tac(tac, all_tac)
}

///|
/// `REPEAT tac`
pub fn repeat_tac(tac : Tactic) -> Tactic {
  fn go(g : Goal) -> Goalstate raise {
    orelse_tac(then_tac(tac, go), all_tac)(g)
  }

  go
}

///|
/// `EVERY tacl`
pub fn every(tacl : List[Tactic]) -> Tactic {
  @lib.itlist(then_tac, tacl, all_tac)
}

///|
/// `FIRST tacl`
pub fn first(tacl : List[Tactic]) -> Tactic {
  g => @lib.end_itlist(orelse_tac, tacl)(g)
}

///|
/// `MAP_EVERY tacf lst`
pub fn[A] map_every(tacf : (A) -> Tactic raise, lst : List[A]) -> Tactic raise {
  every(@lib.map(tacf, lst))
}

///|
/// `MAP_FIRST tacf lst`
pub fn[A] map_first(tacf : (A) -> Tactic raise, lst : List[A]) -> Tactic raise {
  first(@lib.map(tacf, lst))
}

///|
/// `CHANGED_TAC`: fail if the tactic leaves the goal unchanged.
pub fn changed_tac(tac : Tactic) -> Tactic {
  g => {
    let gstate = tac(g)
    let (meta, gl, _) = gstate
    if meta == null_meta && gl.length() == 1 && equals_goal(@lib.hd(gl), g) {
      raise Failure("CHANGED_TAC")
    }
    gstate
  }
}

///|
/// `REPLICATE_TAC n tac`
pub fn replicate_tac(n : Int, tac : Tactic) -> Tactic {
  if n <= 0 {
    all_tac
  } else {
    then_tac(tac, replicate_tac(n - 1, tac))
  }
}

// ---------------------------------------------------------------------------
// Theorem tacticals.
// ---------------------------------------------------------------------------

///|
/// `ttcl1 THEN_TCL ttcl2`
pub fn then_tcl(ttcl1 : ThmTactical, ttcl2 : ThmTactical) -> ThmTactical {
  ttac => ttcl1(ttcl2(ttac))
}

///|
/// `ttcl1 ORELSE_TCL ttcl2`
pub fn orelse_tcl(ttcl1 : ThmTactical, ttcl2 : ThmTactical) -> ThmTactical {
  ttac => {
    th => {
      ttcl1(ttac)(th) catch {
        Failure(_) => ttcl2(ttac)(th)
        e => raise e
      }
    }
  }
}

///|
/// `ALL_THEN`
pub let all_then : ThmTactical = ttac => ttac

///|
/// `REPEAT_TCL ttcl`
pub fn repeat_tcl(ttcl : ThmTactical) -> ThmTactical {
  fn go(ttac : ThmTactic) -> ThmTactic raise {
    orelse_tcl(then_tcl(ttcl, go), all_then)(ttac)
  }

  go
}

///|
/// `REPEAT_GTCL ttcl`
pub fn repeat_gtcl(ttcl : ThmTactical) -> ThmTactical {
  fn go(ttac : ThmTactic) -> ThmTactic {
    th => {
      g => {
        ttcl(go(ttac))(th)(g) catch {
          Failure(_) => ttac(th)(g)
          e => raise e
        }
      }
    }
  }

  ttac => go(ttac)
}

///|
/// `NO_THEN`
pub let no_then : ThmTactical = _ => _ => raise Failure("NO_THEN")

///|
/// `EVERY_TCL`
pub fn every_tcl(ttcll : List[ThmTactical]) -> ThmTactical {
  @lib.itlist(then_tcl, ttcll, all_then)
}

///|
/// `FIRST_TCL`
pub fn first_tcl(ttcll : List[ThmTactical]) -> ThmTactical raise {
  @lib.end_itlist(orelse_tcl, ttcll)
}

// ---------------------------------------------------------------------------
// Assumption list manipulation.
// ---------------------------------------------------------------------------

///|
/// `LABEL_TAC s th`: add `th` as an assumption labelled `s`.
pub fn label_tac(s : String, thm : Thm) -> Tactic {
  g => {
    let (asl, w) = g
    (
      null_meta,
      @list.singleton((asl.prepend((s, thm)), w)),
      (i, ths) => {
        let th0 = one(ths)
        @bool.prove_hyp(@drule.instantiate_all(i, thm), th0)
      },
    )
  }
}

///|
/// `ASSUME_TAC`
pub fn assume_tac(th : Thm) -> Tactic {
  label_tac("", th)
}

///|
/// `FIND_ASSUM ttac t`
pub fn find_assum(ttac : ThmTactic, t : Term) -> Tactic {
  g => {
    let (asl, _) = g
    ttac(@lib.find((p : (String, Thm)) => @kernel.concl(p.1) == t, asl).1)(g)
  }
}

///|
/// `POP_ASSUM ttac`
pub fn pop_assum(ttac : ThmTactic) -> Tactic {
  g => {
    match g {
      (More((_, th), tail=asl), w) => ttac(th)((asl, w))
      _ => raise Failure("POP_ASSUM: No assumption to pop")
    }
  }
}

///|
/// `ASSUM_LIST aslfun`
pub fn assum_list(aslfun : (List[Thm]) -> Tactic raise) -> Tactic {
  g => aslfun(g.0.map(p => p.1))(g)
}

///|
/// `POP_ASSUM_LIST asltac`
pub fn pop_assum_list(asltac : (List[Thm]) -> Tactic raise) -> Tactic {
  g => asltac(g.0.map(p => p.1))((@list.List([]), g.1))
}

///|
/// `EVERY_ASSUM ttac`
pub fn every_assum(ttac : ThmTactic) -> Tactic {
  assum_list(ths => map_every(ttac, ths))
}

///|
/// `FIRST_ASSUM ttac`
pub fn first_assum(ttac : ThmTactic) -> Tactic {
  g => @lib.tryfind((p : (String, Thm)) => ttac(p.1)(g), g.0)
}

///|
/// `RULE_ASSUM_TAC rule`: apply a rule to every assumption.
pub fn rule_assum_tac(rule : (Thm) -> Thm raise) -> Tactic {
  g => {
    let (asl, _) = g
    // `POP_ASSUM_LIST (K ALL_TAC) THEN MAP_EVERY ...`: the arguments of
    // THEN are evaluated right to left, so the rule runs first.
    let rest = map_every(
      (p : (String, Thm)) => label_tac(p.0, rule(p.1)),
      asl.rev(),
    )
    then_tac(pop_assum_list(_ => all_tac), rest)(g)
  }
}

///|
/// `USE_THEN s ttac`: apply `ttac` to the assumption labelled `s`.
pub fn use_then(s : String, ttac : ThmTactic) -> Tactic {
  g => {
    let th = @lib.assoc(s, g.0) catch {
      Failure(_) => raise Failure("USE_TAC: didn't find assumption " + s)
      e => raise e
    }
    ttac(th)(g)
  }
}

///|
/// `REMOVE_THEN s ttac`: remove the assumption labelled `s` and apply
/// `ttac` to it.
pub fn remove_then(s : String, ttac : ThmTactic) -> Tactic {
  g => {
    let (asl, w) = g
    let th = @lib.assoc(s, asl) catch {
      Failure(_) => raise Failure("USE_TAC: didn't find assumption " + s)
      e => raise e
    }
    let (asl1, asl2) = @lib.chop_list(@lib.index(s, asl.map(p => p.0)), asl)
    ttac(th)((asl1.concat(@lib.tl(asl2)), w))
  }
}

///|
/// `NAME_ASSUMS_TAC`: give unlabelled assumptions names `H0`, `H1`, ...
pub let name_assums_tac : Tactic = g => {
  let (asl, w) = g
  let idx = Ref::{ val: 0, }
  let has = (name : String) => asl.any(p => p.0 == name)
  let next_hyp_name = () => {
    while true {
      let n = "H" + idx.val.to_string()
      idx.val += 1
      if !has(n) {
        return n
      }
    }
    ""
  }
  let asl1 = @lib.map(
    (p : (String, Thm)) => if p.0 == "" { (next_hyp_name(), p.1) } else { p },
    asl,
  )
  all_tac((asl1, w))
}

///|
/// `ASM tltac ths`: add the assumptions to the theorem list.
pub fn asm_tac(
  tltac : (List[Thm]) -> Tactic raise,
) -> (List[Thm]) -> Tactic raise {
  ths => g => tltac(g.0.map(p => p.1).concat(ths))(g)
}

///|
/// `HYP tac s`: add the assumptions labelled in `s` (space-separated) to
/// the theorem list.
pub fn hyp_tac(
  tac : (List[Thm]) -> Tactic raise,
  s : String,
) -> ((List[Thm]) -> Tactic raise) raise {
  let ident : (ArrayView[@lexer.Lexcode]) -> (String, ArrayView[@lexer.Lexcode]) raise = inp => {
    match inp {
      [Ident(s), ..rest] if @printer.isalnum(s) => (s, rest)
      _ => raise @parserutil.Noparse
    }
  }
  let parse_using = @parserutil.many(ident)
  let (l, rest) = @parserutil.fix("Using pattern", parse_using)(@lexer.lex(s))
  if !rest.is_empty() {
    raise Failure("Invalid using pattern")
  }
  @lib.rev_itlist(
    (s : String, k : (List[Thm]) -> Tactic raise) => {
      (l1 : List[Thm]) => use_then(s, th => k(l1.prepend(th)))
    },
    l,
    tac,
  )
}

// ---------------------------------------------------------------------------
// Basic tactics.
// ---------------------------------------------------------------------------

///|
/// `ACCEPT_TAC th`: solve a goal equal to `th`'s conclusion.
pub fn accept_tac(th : Thm) -> Tactic {
  g => {
    if @basics.aconv(@kernel.concl(th), g.1) {
      (null_meta, @list.List([]), propagate_thm(th))
    } else {
      raise Failure("ACCEPT_TAC")
    }
  }
}

///|
let conv_tac_t : Cell[Term] = Cell::new("CONV_TAC")

///|
/// `CONV_TAC conv`: a tactic from a conversion.
pub fn conv_tac(conv : Conv) -> Tactic {
  g => {
    let (asl, w) = g
    let th = conv(w)
    let tm = @kernel.concl(th)
    if @basics.aconv(tm, w) {
      return accept_tac(th)(g)
    }
    let (l, r) = @kernel.dest_eq(tm)
    if !@basics.aconv(l, w) {
      raise Failure("CONV_TAC: bad equation")
    }
    if r == conv_tac_t.get() {
      return accept_tac(@bool.eqt_elim(th))(g)
    }
    let th1 = @equal.sym(th)
    (
      null_meta,
      @list.singleton((asl, r)),
      (i, ths) => {
        let th0 = one(ths)
        @kernel.eq_mp(@drule.instantiate_all(i, th1), th0)
      },
    )
  }
}

///|
/// `REFL_TAC`
pub let refl_tac : Tactic = g => {
  accept_tac(@kernel.refl(@kernel.rand(g.1)))(g) catch {
    Failure(_) => raise Failure("REFL_TAC")
    e => raise e
  }
}

///|
/// `ABS_TAC`
pub let abs_tac : Tactic = g => {
  let (asl, w) = g
  let result = try {
    let (l, r) = @kernel.dest_eq(w)
    let (lv, lb) = @kernel.dest_abs(l)
    let (rv, rb) = @kernel.dest_abs(r)
    let avoids = @lib.itlist(
      (p : (String, Thm), acc) => @lib.union(@basics.thm_frees(p.1), acc),
      asl,
      @kernel.frees(w),
    )
    let v = @equal.mk_primed_var(avoids, lv)
    let goal = @basics.mk_eq(
      @kernel.vsubst(@list.singleton((v, lv)), lb),
      @kernel.vsubst(@list.singleton((v, rv)), rb),
    )
    let just : Justification = (i, ths) => {
      let th0 = one(ths)
      let ath = @kernel.abs_rule(v, th0)
      @kernel.eq_mp(
        @equal.alpha_rule(@kernel.concl(ath), @drule.instantiate(i, w)),
        ath,
      )
    }
    (null_meta, @list.singleton((asl, goal)), just)
  } catch {
    Failure(_) => raise Failure("ABS_TAC")
    e => raise e
  }
  result
}

///|
/// `MK_COMB_TAC`
pub let mk_comb_tac : Tactic = g => {
  let (asl, gl) = g
  let result = try {
    let (l, r) = @kernel.dest_eq(gl)
    let (f, x) = @kernel.dest_comb(l)
    let (gg, y) = @kernel.dest_comb(r)
    let goals = @list.List([
      (asl, @basics.mk_eq(f, gg)),
      (asl, @basics.mk_eq(x, y)),
    ])
    let just : Justification = (_, ths) => {
      let (th1, th2) = two(ths)
      @kernel.mk_comb_rule(th1, th2)
    }
    (null_meta, goals, just)
  } catch {
    Failure(_) => raise Failure("MK_COMB_TAC")
    e => raise e
  }
  result
}

///|
/// `AP_TERM_TAC`
pub let ap_term_tac : Tactic = {
  let tac = thenl(mk_comb_tac, @list.List([refl_tac, all_tac]))
  g => {
    tac(g) catch {
      Failure(_) => raise Failure("AP_TERM_TAC")
      e => raise e
    }
  }
}

///|
/// `AP_THM_TAC`
pub let ap_thm_tac : Tactic = {
  let tac = thenl(mk_comb_tac, @list.List([all_tac, refl_tac]))
  g => {
    tac(g) catch {
      Failure(_) => raise Failure("AP_THM_TAC")
      e => raise e
    }
  }
}

///|
/// `BINOP_TAC` (upstream's failure message says AP_THM_TAC).
pub let binop_tac : Tactic = {
  let tac = thenl(mk_comb_tac, @list.List([ap_term_tac, all_tac]))
  g => {
    tac(g) catch {
      Failure(_) => raise Failure("AP_THM_TAC")
      e => raise e
    }
  }
}

///|
/// `SUBST1_TAC th`
pub fn subst1_tac(th : Thm) -> Tactic {
  conv_tac(@equal.subs_conv(@list.singleton(th)))
}

///|
/// `SUBST_ALL_TAC rth`: substitute in the goal and the assumptions.
pub fn subst_all_tac(rth : Thm) -> Tactic {
  then_tac(
    subst1_tac(rth),
    rule_assum_tac(th => @equal.subs(@list.singleton(rth), th)),
  )
}

///|
/// `BETA_TAC`
pub let beta_tac : Tactic = conv_tac(@equal.redepth_conv(@equal.beta_conv))

///|
/// `SUBST_VAR_TAC th`: substitute with an equation between a variable or
/// constant and a term.
pub fn subst_var_tac(th : Thm) -> Tactic raise {
  let result = try {
    let (asms, eq) = @kernel.dest_thm(th)
    let (l, r) = @kernel.dest_eq(eq)
    if @basics.aconv(l, r) {
      all_tac
    } else if !@lib.subset(@kernel.frees(eq), @kernel.freesl(asms)) {
      fail_()
    } else if (@kernel.is_const(l) || @kernel.is_var(l)) &&
      !@basics.free_in(l, r) {
      subst_all_tac(th)
    } else if (@kernel.is_const(r) || @kernel.is_var(r)) &&
      !@basics.free_in(r, l) {
      subst_all_tac(@equal.sym(th))
    } else {
      fail_()
    }
  } catch {
    Failure(_) => raise Failure("SUBST_VAR_TAC")
    e => raise e
  }
  result
}

///|
let disch_tac_f : Cell[Term] = Cell::new("DISCH_TAC")

///|
/// `DISCH_TAC`
pub let disch_tac : Tactic = g => {
  let (asl, w) = g
  try {
    let (ant, c) = @basics.dest_imp(w)
    let th1 = @kernel.assume_rule(ant)
    (
      null_meta,
      @list.singleton((asl.prepend(("", th1)), c)),
      (i, ths) => {
        let th0 = one(ths)
        @bool.disch(@drule.instantiate(i, ant), th0)
      },
    )
  } catch {
    Failure(_) =>
      try {
        let ant = @basics.dest_neg(w)
        let th1 = @kernel.assume_rule(ant)
        (
          null_meta,
          @list.singleton((asl.prepend(("", th1)), disch_tac_f.get())),
          (i, ths) => {
            let th0 = one(ths)
            @bool.not_intro(@bool.disch(@drule.instantiate(i, ant), th0))
          },
        )
      } catch {
        Failure(_) => raise Failure("DISCH_TAC")
        e => raise e
      }
    e => raise e
  }
}

///|
/// `MP_TAC th`
pub fn mp_tac(thm : Thm) -> Tactic {
  g => {
    let (asl, w) = g
    (
      null_meta,
      @list.singleton((asl, @bool.mk_imp(@kernel.concl(thm), w))),
      (i, ths) => {
        let th0 = one(ths)
        @bool.mp(th0, @drule.instantiate_all(i, thm))
      },
    )
  }
}

///|
/// `EQ_TAC`
pub let eq_tac : Tactic = g => {
  let (asl, w) = g
  let result = try {
    let (l, r) = @kernel.dest_eq(w)
    let goals = @list.List([
      (asl, @bool.mk_imp(l, r)),
      (asl, @bool.mk_imp(r, l)),
    ])
    let just : Justification = (_, ths) => {
      let (th1, th2) = two(ths)
      @bool.imp_antisym_rule(th1, th2)
    }
    (null_meta, goals, just)
  } catch {
    Failure(_) => raise Failure("EQ_TAC")
    e => raise e
  }
  result
}

///|
/// `UNDISCH_TAC tm`
pub fn undisch_tac(tm : Term) -> Tactic {
  g => {
    let (asl, w) = g
    let result = try {
      let (sthm, asl1) = @lib.remove(
        (p : (String, Thm)) => @basics.aconv(@kernel.concl(p.1), tm),
        asl,
      )
      let thm = sthm.1
      let just : Justification = (i, ths) => {
        let th0 = one(ths)
        @bool.mp(th0, @drule.instantiate_all(i, thm))
      }
      (null_meta, @list.singleton((asl1, @bool.mk_imp(tm, w))), just)
    } catch {
      Failure(_) => raise Failure("UNDISCH_TAC")
      e => raise e
    }
    result
  }
}

///|
/// `SPEC_TAC (t, x)`: generalize `t` to `x`.
pub fn spec_tac(t : Term, x : Term) -> Tactic {
  g => {
    let (asl, w) = g
    let result = try {
      let goal = @bool.mk_forall(x, @basics.subst(@list.singleton((x, t)), w))
      let just : Justification = (i, ths) => {
        let th0 = one(ths)
        @bool.spec(@drule.instantiate(i, t), th0)
      }
      (null_meta, @list.singleton((asl, goal)), just)
    } catch {
      Failure(_) => raise Failure("SPEC_TAC")
      e => raise e
    }
    result
  }
}

///|
fn tactic_type_compatibility_check(
  pfx : String,
  e : Term,
  g : Term,
) -> Unit raise {
  let et = @kernel.type_of(e)
  let gt = @kernel.type_of(g)
  if et != gt {
    raise Failure(
      pfx +
      ": expected type :" +
      @printer.string_of_type(et) +
      " but got :" +
      @printer.string_of_type(gt),
    )
  }
}

///|
/// `X_GEN_TAC x'`: strip a universal quantifier, using variable `x'`.
pub fn x_gen_tac(x1 : Term) -> Tactic raise {
  if !@kernel.is_var(x1) {
    raise Failure("X_GEN_TAC: not a variable")
  }
  g => {
    let (asl, w) = g
    let (x, bod) = @basics.dest_forall(w) catch {
      Failure(_) => raise Failure("X_GEN_TAC: Not universally quantified")
      e => raise e
    }
    tactic_type_compatibility_check("X_GEN_TAC", x, x1)
    let avoids = @lib.itlist(
      (p : (String, Thm), acc) => @lib.union(@basics.thm_frees(p.1), acc),
      asl,
      @kernel.frees(w),
    )
    if @lib.mem(x1, avoids) {
      raise Failure("X_GEN_TAC: invalid variable")
    }
    let afn = (th : Thm) => @equal.conv_rule(@equal.gen_alpha_conv(x), th)
    (
      null_meta,
      @list.singleton((asl, @kernel.vsubst(@list.singleton((x1, x)), bod))),
      (_, ths) => {
        let th0 = one(ths)
        afn(@bool.gen(x1, th0))
      },
    )
  }
}

///|
/// `X_CHOOSE_TAC x' th`: use an existential theorem, with witness `x'`.
pub fn x_choose_tac(x1 : Term, xth : Thm) -> Tactic raise {
  let xtm = @kernel.concl(xth)
  let (x, bod) = @basics.dest_exists(xtm) catch {
    Failure(_) => raise Failure("X_CHOOSE_TAC: not existential")
    e => raise e
  }
  tactic_type_compatibility_check("X_CHOOSE_TAC", x, x1)
  let pat = @kernel.vsubst(@list.singleton((x1, x)), bod)
  let xth1 = @kernel.assume_rule(pat)
  g => {
    let (asl, w) = g
    let avoids = @lib.itlist(
      (p : (String, Thm), acc) => {
        @lib.union(@kernel.frees(@kernel.concl(p.1)), acc)
      },
      asl,
      @lib.union(@kernel.frees(w), @basics.thm_frees(xth)),
    )
    if @lib.mem(x1, avoids) {
      raise Failure("X_CHOOSE_TAC: invalid variable")
    }
    (
      null_meta,
      @list.singleton((asl.prepend(("", xth1)), w)),
      (i, ths) => {
        let th0 = one(ths)
        @bool.choose_rule(x1, @drule.instantiate_all(i, xth), th0)
      },
    )
  }
}

///|
/// `EXISTS_TAC t`: prove an existential goal with witness `t`.
pub fn exists_tac(t : Term) -> Tactic {
  g => {
    let (asl, w) = g
    let (v, bod) = @basics.dest_exists(w) catch {
      Failure(_) =>
        raise Failure("EXISTS_TAC: Goal not existentially quantified")
      e => raise e
    }
    tactic_type_compatibility_check("EXISTS_TAC", v, t)
    (
      null_meta,
      @list.singleton((asl, @kernel.vsubst(@list.singleton((t, v)), bod))),
      (i, ths) => {
        let th0 = one(ths)
        // `EXISTS (instantiate i w, instantiate i t) th`: right to left.
        let it = @drule.instantiate(i, t)
        @bool.exists_rule(@drule.instantiate(i, w), it, th0)
      },
    )
  }
}

///|
/// `GEN_TAC`
pub let gen_tac : Tactic = g => {
  let (asl, w) = g
  try {
    let x = @basics.dest_forall(w).0
    let avoids = @lib.itlist(
      (p : (String, Thm), acc) => @lib.union(@basics.thm_frees(p.1), acc),
      asl,
      @kernel.frees(w),
    )
    let x1 = @equal.mk_primed_var(avoids, x)
    x_gen_tac(x1)(g)
  } catch {
    Failure(_) => raise Failure("GEN_TAC")
    e => raise e
  }
}

///|
/// `CHOOSE_TAC th`
pub fn choose_tac(xth : Thm) -> Tactic raise {
  let x = @basics.dest_exists(@kernel.concl(xth)).0 catch {
      Failure(_) => raise Failure("CHOOSE_TAC")
      e => raise e
    }
  g => {
    let (asl, w) = g
    let avoids = @lib.itlist(
      (p : (String, Thm), acc) => @lib.union(@basics.thm_frees(p.1), acc),
      asl,
      @lib.union(@kernel.frees(w), @basics.thm_frees(xth)),
    )
    let x1 = @equal.mk_primed_var(avoids, x)
    x_choose_tac(x1, xth)(g)
  }
}

///|
/// `CONJ_TAC`
pub let conj_tac : Tactic = g => {
  let (asl, w) = g
  let result = try {
    let (l, r) = @basics.dest_conj(w)
    let just : Justification = (_, ths) => {
      let (th1, th2) = two(ths)
      @bool.conj(th1, th2)
    }
    (null_meta, @list.List([(asl, l), (asl, r)]), just)
  } catch {
    Failure(_) => raise Failure("CONJ_TAC")
    e => raise e
  }
  result
}

///|
/// `DISJ1_TAC`
pub let disj1_tac : Tactic = g => {
  let (asl, w) = g
  let result = try {
    let (l, r) = @basics.dest_disj(w)
    let just : Justification = (i, ths) => {
      let th0 = one(ths)
      @bool.disj1(th0, @drule.instantiate(i, r))
    }
    (null_meta, @list.singleton((asl, l)), just)
  } catch {
    Failure(_) => raise Failure("DISJ1_TAC")
    e => raise e
  }
  result
}

///|
/// `DISJ2_TAC`
pub let disj2_tac : Tactic = g => {
  let (asl, w) = g
  let result = try {
    let (l, r) = @basics.dest_disj(w)
    let just : Justification = (i, ths) => {
      // `DISJ2 (instantiate i l) th`: right to left.
      let th = one(ths)
      @bool.disj2(@drule.instantiate(i, l), th)
    }
    (null_meta, @list.singleton((asl, r)), just)
  } catch {
    Failure(_) => raise Failure("DISJ2_TAC")
    e => raise e
  }
  result
}

///|
/// `DISJ_CASES_TAC th`
pub fn disj_cases_tac(dth : Thm) -> Tactic raise {
  let result = try {
    let dtm = @kernel.concl(dth)
    let (l, r) = @basics.dest_disj(dtm)
    let thl = @kernel.assume_rule(l)
    let thr = @kernel.assume_rule(r)
    let tac : Tactic = g => {
      let (asl, w) = g
      (
        null_meta,
        @list.List([(asl.prepend(("", thl)), w), (asl.prepend(("", thr)), w)]),
        (i, ths) => {
          let (th1, th2) = two(ths)
          @bool.disj_cases(@drule.instantiate_all(i, dth), th1, th2)
        },
      )
    }
    tac
  } catch {
    Failure(_) => raise Failure("DISJ_CASES_TAC")
    e => raise e
  }
  result
}

///|
/// `CONTR_TAC th`: solve any goal from `|- F`.
pub fn contr_tac(cth : Thm) -> Tactic {
  g => {
    let th = @bool.contr(g.1, cth) catch {
      Failure(_) => raise Failure("CONTR_TAC")
      e => raise e
    }
    (null_meta, @list.List([]), propagate_thm(th))
  }
}

///|
/// `MATCH_ACCEPT_TAC th`: solve a goal that is an instance of `th`.
pub fn match_accept_tac(th : Thm) -> Tactic {
  let rawtac : Tactic = g => {
    let ith = @drule.part_match(t => t, th)(g.1) catch {
      Failure(_) => raise Failure("ACCEPT_TAC")
      e => raise e
    }
    (null_meta, @list.List([]), propagate_thm(ith))
  }
  then_tac(repeat_tac(gen_tac), rawtac)
}

///|
/// `MATCH_MP_TAC th`: reduce a goal `q` to `p` using `|- !x. p ==> q`.
pub fn match_mp_tac(th : Thm) -> Tactic raise {
  let sth = try {
    let tm = @kernel.concl(th)
    let (avs, bod) = @basics.strip_forall(tm)
    let (ant, con) = @basics.dest_imp(bod)
    let th1 = @bool.specl(avs, @kernel.assume_rule(tm))
    let th2 = @bool.undisch(th1)
    let evs = @lib.filter(
      v => @kernel.vfree_in(v, ant) && !@kernel.vfree_in(v, con),
      avs,
    )
    let th3 = @lib.itlist(@bool.simple_choose, evs, @bool.disch(tm, th2))
    let tm3 = @lib.hd(@kernel.hyp(th3))
    @bool.mp(
      @bool.disch(tm, @bool.gen_all(@bool.disch(tm3, @bool.undisch(th3)))),
      th,
    )
  } catch {
    Failure(_) => raise Failure("MATCH_MP_TAC: Bad theorem")
    e => raise e
  }
  let match_fun = @drule.part_match(t => @basics.dest_imp(t).1, sth)
  g => {
    let (asl, w) = g
    let result = try {
      let xth = match_fun(w)
      let lant = @basics.dest_imp(@kernel.concl(xth)).0
      let just : Justification = (i, ths) => {
        let th0 = one(ths)
        @bool.mp(@drule.instantiate_all(i, xth), th0)
      }
      (null_meta, @list.singleton((asl, lant)), just)
    } catch {
      Failure(_) => raise Failure("MATCH_MP_TAC: No match")
      e => raise e
    }
    result
  }
}

///|
/// `TRANS_TAC th tm`: chain through `tm` using a transitivity theorem.
pub fn trans_tac(th : Thm) -> ((Term) -> Tactic) raise {
  let ctm = @basics.strip_forall(@kernel.concl(th)).1
  let (cl, cr) = @basics.dest_conj(@equal.lhand(ctm))
  let x = @equal.lhand(cl)
  let y = @kernel.rand(cl)
  let z = @kernel.rand(cr)
  tm => {
    gl => {
      let (lop, r) = @kernel.dest_comb(gl.1)
      let (_, l) = @kernel.dest_comb(lop)
      // `itlist2 type_match (map type_of [x;y;z]) (map type_of [l;tm;r]) []`
      // evaluates its arguments right to left.
      let tys2 = @lib.map(@kernel.type_of, @list.List([l, tm, r]))
      let tys1 = @lib.map(@kernel.type_of, @list.List([x, y, z]))
      let ilist = @lib.itlist2(
        (a, b, acc) => @basics.type_match(a, b, acc),
        tys1,
        tys2,
        @list.List([]),
      )
      let th1 = @kernel.inst_type(ilist, th)
      // `MATCH_MP_TAC th' THEN EXISTS_TAC tm`: right to left.
      let ex = exists_tac(tm)
      then_tac(match_mp_tac(th1), ex)(gl)
    }
  }
}

// ---------------------------------------------------------------------------
// Theorem continuations.
// ---------------------------------------------------------------------------

///|
/// `CONJUNCTS_THEN2 ttac1 ttac2 th`
pub fn conjuncts_then2(ttac1 : ThmTactic, ttac2 : ThmTactic) -> ThmTactic {
  cth => {
    let (c1, c2) = @basics.dest_conj(@kernel.concl(cth))
    gl => {
      // `ttac1(ASSUME c1) THEN ttac2(ASSUME c2)`: right to left.
      let t2 = ttac2(@kernel.assume_rule(c2))
      let t1 = ttac1(@kernel.assume_rule(c1))
      let (ti, gls, jfn) = then_tac(t1, t2)(gl)
      let jfn1 : Justification = (i, ths) => {
        let (th1, th2) = @bool.conj_pair(@drule.instantiate_all(i, cth))
        @bool.prove_hyp(th1, @bool.prove_hyp(th2, jfn(i, ths)))
      }
      (ti, gls, jfn1)
    }
  }
}

///|
/// `CONJUNCTS_THEN`
pub let conjuncts_then : ThmTactical = ttac => conjuncts_then2(ttac, ttac)

///|
/// `DISJ_CASES_THEN2 ttac1 ttac2 th`
pub fn disj_cases_then2(ttac1 : ThmTactic, ttac2 : ThmTactic) -> ThmTactic {
  cth => {
    let tacs = @list.List([pop_assum(ttac1), pop_assum(ttac2)])
    thenl(disj_cases_tac(cth), tacs)
  }
}

///|
/// `DISJ_CASES_THEN`
pub let disj_cases_then : ThmTactical = ttac => disj_cases_then2(ttac, ttac)

///|
/// `DISCH_THEN ttac`
pub fn disch_then(ttac : ThmTactic) -> Tactic {
  then_tac(disch_tac, pop_assum(ttac))
}

///|
/// `X_CHOOSE_THEN x ttac th`
pub fn x_choose_then(x : Term) -> ThmTactical {
  ttac => {
    th => {
      let p = pop_assum(ttac)
      then_tac(x_choose_tac(x, th), p)
    }
  }
}

///|
/// `CHOOSE_THEN`
pub let choose_then : ThmTactical = ttac => {
  th => {
    let p = pop_assum(ttac)
    then_tac(choose_tac(th), p)
  }
}

///|
/// `STRIP_THM_THEN`
pub let strip_thm_then : ThmTactical = ttac => {
  th => {
    let tcl = first_tcl(
      @list.List([conjuncts_then, disj_cases_then, choose_then]),
    )
    tcl(ttac)(th)
  }
}

///|
/// `ANTE_RES_THEN ttac ante`
pub let ante_res_then : ThmTactical = ttac => {
  ante => {
    assum_list(asl => {
      let tacs = @lib.mapfilter(imp => ttac(@drule.match_mp(imp)(ante)), asl)
      if tacs.is_empty() {
        raise Failure("IMP_RES_THEN")
      }
      every(tacs)
    })
  }
}

///|
/// `IMP_RES_THEN ttac imp`
pub let imp_res_then : ThmTactical = ttac => {
  imp => {
    assum_list(asl => {
      let tacs = @lib.mapfilter(ante => ttac(@drule.match_mp(imp)(ante)), asl)
      if tacs.is_empty() {
        raise Failure("IMP_RES_THEN")
      }
      every(tacs)
    })
  }
}

///|
/// `STRIP_ASSUME_TAC th`
pub fn strip_assume_tac(th : Thm) -> Tactic raise {
  let discard_tac = (th : Thm) => {
    let tm = @kernel.concl(th)
    let tac : Tactic = g => {
      if g.0.any(a => @basics.aconv(tm, @kernel.concl(a.1))) {
        all_tac(g)
      } else {
        raise Failure("DISCARD_TAC: not already present")
      }
    }
    tac
  }
  repeat_tcl(strip_thm_then)(gth => {
    first(
      @list.List([
        contr_tac(gth),
        accept_tac(gth),
        discard_tac(gth),
        assume_tac(gth),
      ]),
    )
  })(th)
}

///|
/// `STRUCT_CASES_THEN ttac`
pub fn struct_cases_then(ttac : ThmTactic) -> ThmTactic raise {
  repeat_tcl(strip_thm_then)(ttac)
}

///|
/// `STRUCT_CASES_TAC th`
pub fn struct_cases_tac(th : Thm) -> Tactic raise {
  struct_cases_then(th => orelse_tac(subst1_tac(th), assume_tac(th)))(th)
}

///|
/// `STRIP_GOAL_THEN ttac`
pub fn strip_goal_then(ttac : ThmTactic) -> Tactic {
  first(@list.List([gen_tac, conj_tac, disch_then(ttac)]))
}

///|
/// `STRIP_TAC`
pub let strip_tac : Tactic = g => {
  strip_goal_then(strip_assume_tac)(g) catch {
    Failure(_) => raise Failure("STRIP_TAC")
    e => raise e
  }
}

///|
/// `UNDISCH_THEN tm ttac`
pub fn undisch_then(tm : Term, ttac : ThmTactic) -> Tactic {
  g => {
    let (asl, w) = g
    let (thp, asl1) = @lib.remove(
      (p : (String, Thm)) => @basics.aconv(@kernel.concl(p.1), tm),
      asl,
    )
    ttac(thp.1)((asl1, w))
  }
}

///|
/// `FIRST_X_ASSUM ttac`
pub fn first_x_assum(ttac : ThmTactic) -> Tactic {
  first_assum(th => undisch_then(@kernel.concl(th), ttac))
}

// ---------------------------------------------------------------------------
// Subgoaling and freezing.
// ---------------------------------------------------------------------------

///|
/// `SUBGOAL_THEN wa ttac`
pub fn subgoal_then(wa : Term, ttac : ThmTactic) -> Tactic {
  g => {
    let (asl, w) = g
    let (meta, gl, just) = ttac(@kernel.assume_rule(wa))((asl, w))
    (
      meta,
      gl.prepend((asl, wa)),
      (i, l) => {
        // `PROVE_HYP (hd l) (just i (tl l))`: right to left.
        let th = just(i, @lib.tl(l))
        @bool.prove_hyp(@lib.hd(l), th)
      },
    )
  }
}

///|
/// `SUBGOAL_TAC s tm [proof]`
pub fn subgoal_tac(s : String, tm : Term, prfs : List[Tactic]) -> Tactic raise {
  match prfs {
    More(p, tail=ps) => {
      @lib.warn(!ps.is_empty(), "SUBGOAL_TAC: additional subproofs ignored")
      thenl(subgoal_then(tm, th => label_tac(s, th)), @list.List([p, all_tac]))
    }
    Empty => raise Failure("SUBGOAL_TAC: no subproof given")
  }
}

///|
/// `FREEZE_THEN ttac th`
pub let freeze_then : ThmTactical = ttac => {
  th => {
    g => {
      let (meta, gl, just) = ttac(@kernel.assume_rule(@kernel.concl(th)))(g)
      (meta, gl, (i, l) => @bool.prove_hyp(th, just(i, l)))
    }
  }
}

// ---------------------------------------------------------------------------
// Metavariable tactics.
// ---------------------------------------------------------------------------

///|
/// `X_META_EXISTS_TAC t`
pub fn x_meta_exists_tac(t : Term) -> Tactic {
  g => {
    let (asl, w) = g
    let result = try {
      if !@kernel.is_var(t) {
        fail_()
      }
      let (v, bod) = @basics.dest_exists(w)
      let just : Justification = (i, ths) => {
        let th0 = one(ths)
        let it = @drule.instantiate(i, t)
        @bool.exists_rule(@drule.instantiate(i, w), it, th0)
      }
      (
        (@list.singleton(t), null_inst),
        @list.singleton((asl, @kernel.vsubst(@list.singleton((t, v)), bod))),
        just,
      )
    } catch {
      Failure(_) => raise Failure("X_META_EXISTS_TAC")
      e => raise e
    }
    result
  }
}

///|
/// `META_EXISTS_TAC`
pub let meta_exists_tac : Tactic = gl => {
  let (asl, w) = gl
  let v = @basics.dest_exists(w).0
  let avoids = @lib.itlist(
    (p : (String, Thm), acc) => {
      @lib.union(@kernel.frees(@kernel.concl(p.1)), acc)
    },
    asl,
    @kernel.frees(w),
  )
  let v1 = @equal.mk_primed_var(avoids, v)
  x_meta_exists_tac(v1)(gl)
}

///|
/// `META_SPEC_TAC t th`
pub fn meta_spec_tac(t : Term, thm : Thm) -> Tactic {
  g => {
    let (asl, w) = g
    let sth = @bool.spec(t, thm)
    (
      (@list.singleton(t), null_inst),
      @list.singleton((asl.prepend(("", sth)), w)),
      (i, ths) => {
        let th = one(ths)
        @bool.prove_hyp(@bool.spec(@drule.instantiate(i, t), thm), th)
      },
    )
  }
}

///|
/// `CHEAT_TAC`: solve any goal with `mk_thm` (recorded in `axioms()`).
pub let cheat_tac : Tactic = g => {
  accept_tac(@drule.mk_thm(@list.List([]), g.1))(g)
}

///|
/// `RECALL_ACCEPT_TAC r a`: delay a (slow) rule until the goal is seen.
pub fn[A] recall_accept_tac(r : (A) -> Thm raise, a : A) -> Tactic {
  g => accept_tac(@lib.time(r, a))(g)
}

///|
let ants_tac_c : Cell[Tactic] = Cell::new("ANTS_TAC")

///|
/// `ANTS_TAC`: split off the antecedent of an antecedent as a subgoal.
pub fn ants_tac(g : Goal) -> Goalstate raise {
  ants_tac_c.get()(g)
}

// ---------------------------------------------------------------------------
// Printing goals and goalstacks.
// ---------------------------------------------------------------------------

///|
/// Max boxes for printing hypotheses (`None`: the formatter's setting).
pub let print_goal_hyp_max_boxes : Ref[Int64?] = Ref::{ val: None, }

///|
fn string_of_int3(n : Int) -> String {
  if n < 10 {
    "  " + n.to_string()
  } else if n < 100 {
    " " + n.to_string()
  } else {
    n.to_string()
  }
}

///|
fn print_goal_gen(color : Bool, fmt : Formatter, g : Goal) -> Unit raise {
  let (asl, w) = g
  let qterm = (t : Term) => {
    if color {
      @printer.pp_print_colored_qterm(fmt, t)
    } else {
      @printer.pp_print_qterm(fmt, t)
    }
  }
  fmt.print_newline()
  if !asl.is_empty() {
    let mut n = 0
    for p in asl.rev() {
      let (s, th) = p
      fmt.open_hbox()
      fmt.print_string(string_of_int3(n))
      fmt.print_string(" [")
      fmt.open_hvbox(0)
      let old_max_boxes = fmt.get_max_boxes()
      match print_goal_hyp_max_boxes.val {
        None => ()
        Some(hb) => fmt.set_max_boxes(@lib.int63_to_int(hb))
      }
      qterm(@kernel.concl(th))
      fmt.set_max_boxes(old_max_boxes)
      fmt.close_box()
      fmt.print_string("]")
      if s != "" {
        fmt.print_string(" (" + s + ")")
      }
      fmt.close_box()
      fmt.print_newline()
      n += 1
    }
    fmt.print_newline()
  }
  qterm(w)
  fmt.print_newline()
}

///|
pub fn pp_print_goal(fmt : Formatter, g : Goal) -> Unit raise {
  print_goal_gen(false, fmt, g)
}

///|
pub fn pp_print_colored_goal(fmt : Formatter, g : Goal) -> Unit raise {
  print_goal_gen(true, fmt, g)
}

///|
fn print_goalstate(
  color : Bool,
  fmt : Formatter,
  k : Int,
  gs : Goalstate,
) -> Unit raise {
  let (_, gl, _) = gs
  let n = gl.length()
  let s = if n == 0 {
    "No subgoals"
  } else {
    k.to_string() +
    " subgoal" +
    (if k > 1 { "s" } else { "" }) +
    " (" +
    n.to_string() +
    " total)"
  }
  fmt.print_string(s)
  fmt.print_newline()
  if !gl.is_empty() {
    for i in @lib.range(0, (k - 1).to_int64()).rev() {
      print_goal_gen(color, fmt, @lib.el(i.to_int(), gl))
    }
  }
}

///|
fn print_goalstack_gen(
  color : Bool,
  fmt : Formatter,
  l : Goalstack,
) -> Unit raise {
  match l {
    Empty => fmt.print_string("Empty goalstack")
    More(gs, tail=Empty) => print_goalstate(color, fmt, 1, gs)
    More(gs, tail=More(gs0, tail=_)) => {
      let p = gs.1.length() - gs0.1.length()
      let p1 = if p < 1 { 1 } else { p + 1 }
      print_goalstate(color, fmt, p1, gs)
    }
  }
}

///|
pub fn pp_print_goalstack(fmt : Formatter, l : Goalstack) -> Unit raise {
  print_goalstack_gen(false, fmt, l)
}

///|
pub fn pp_print_colored_goalstack(fmt : Formatter, l : Goalstack) -> Unit raise {
  print_goalstack_gen(true, fmt, l)
}

///|
pub fn print_goal(g : Goal) -> Unit raise {
  pp_print_goal(@pp.std_formatter, g)
}

///|
pub fn print_goalstack(l : Goalstack) -> Unit raise {
  pp_print_goalstack(@pp.std_formatter, l)
}

///|
/// `PRINT_GOAL_TAC`
pub let print_goal_tac : Tactic = gl => {
  print_goal(gl)
  all_tac(gl)
}

///|
/// `PRINT_COLORED_GOAL_TAC`
pub let print_colored_goal_tac : Tactic = gl => {
  pp_print_colored_goal(@pp.std_formatter, gl)
  all_tac(gl)
}

///|
/// `REMARK_TAC s`
pub fn remark_tac(s : String) -> Tactic {
  gl => {
    @lib.remark(s)
    all_tac(gl)
  }
}

// ---------------------------------------------------------------------------
// Refinements and proofs.
// ---------------------------------------------------------------------------

///|
/// `by tac`: apply a tactic to the first subgoal of a goalstate.
pub fn by(tac : Tactic) -> Refinement {
  gs => {
    let ((mvs, inst), gls, just) = gs
    if gls.is_empty() {
      raise Failure("No goal set")
    }
    let g = @lib.hd(gls)
    let ogls = @lib.tl(gls)
    let ((newmvs, newinst), subgls, subjust) = tac(g)
    let n = subgls.length()
    let mvs1 = @lib.union(newmvs, mvs)
    let inst1 = compose_insts(inst, newinst)
    let gls1 = subgls.concat(@lib.map(gl => inst_goal(newinst, gl), ogls))
    let just1 : Justification = (i, ths) => {
      let i1 = compose_insts(inst1, i)
      let (cths, oths) = @lib.chop_list(n, ths)
      let sths = oths.prepend(subjust(i, cths))
      just(i1, sths)
    }
    ((mvs1, inst1), gls1, just1)
  }
}

///|
fn rotate_p(gs : Goalstate) -> Goalstate raise {
  let (meta, sgs, just) = gs
  // `(tl sgs)@[hd sgs]`: the operands of `@` are evaluated right to left.
  let last1 = @list.singleton(@lib.hd(sgs))
  let sgs1 = @lib.tl(sgs).concat(last1)
  let just1 : Justification = (i, ths) => {
    let ths1 = @lib.butlast(ths).prepend(@lib.last(ths))
    just(i, ths1)
  }
  (meta, sgs1, just1)
}

///|
fn rotate_n(gs : Goalstate) -> Goalstate raise {
  let (meta, sgs, just) = gs
  let sgs1 = @lib.butlast(sgs).prepend(@lib.last(sgs))
  let just1 : Justification = (i, ths) => {
    let last1 = @list.singleton(@lib.hd(ths))
    let ths1 = @lib.tl(ths).concat(last1)
    just(i, ths1)
  }
  (meta, sgs1, just1)
}

///|
/// `rotate n`: rotate the subgoals.
pub fn rotate(n : Int64) -> Refinement {
  gs => {
    // an OCaml int count: `-n` wraps at 63 bits as in OCaml
    if n > 0L {
      @lib.funpow(@lib.int63_to_int(n), rotate_p, gs)
    } else {
      @lib.funpow(@lib.int63_to_int(@lib.neg63(n)), rotate_n, gs)
    }
  }
}

///|
pub fn mk_goalstate(g : Goal) -> Goalstate raise {
  let (asl, w) = g
  if @kernel.type_of(w) == @kernel.bool_ty {
    (
      null_meta,
      @list.singleton((asl, w)),
      (inst, ths) => {
        let th0 = one(ths)
        @drule.instantiate_all(inst, th0)
      },
    )
  } else {
    raise Failure("mk_goalstate: Non-boolean goal")
  }
}

///|
/// `TAC_PROOF (g, tac)`
pub fn tac_proof(g : Goal, tac : Tactic) -> Thm raise {
  let gstate = mk_goalstate(g)
  let (_, sgs, just) = by(tac)(gstate)
  if sgs.is_empty() {
    just(null_inst, @list.List([]))
  } else {
    raise Failure("TAC_PROOF: Unsolved goals")
  }
}

///|
/// `prove (t, tac)`
pub fn prove(t : Term, tac : Tactic) -> Thm raise {
  let th = tac_proof((@list.List([]), t), tac)
  let (asl, t1) = @kernel.dest_thm(th)
  if !asl.is_empty() {
    raise Failure("prove: additional assumptions in result")
  } else if t1 == t {
    th
  } else {
    @kernel.eq_mp(@equal.alpha_rule(t1, t), th) catch {
      Failure(_) =>
        raise Failure("prove: justification generated wrong theorem")
      e => raise e
    }
  }
}

// ---------------------------------------------------------------------------
// The interactive subgoal package.
// ---------------------------------------------------------------------------

///|
pub let current_goalstack : Ref[Goalstack] = Ref::{ val: @list.List([]), }

///|
pub fn refine(r : Refinement) -> Goalstack raise {
  let l = current_goalstack.val
  if l.is_empty() {
    raise Failure("No current goal")
  }
  let h = @lib.hd(l)
  let res = l.prepend(r(h))
  current_goalstack.val = res
  current_goalstack.val
}

///|
pub fn flush_goalstack() -> Unit raise {
  let l = current_goalstack.val
  current_goalstack.val = @list.singleton(@lib.hd(l))
}

///|
/// `e tac`: apply a tactic to the current goal.
pub fn e(tac : Tactic) -> Goalstack raise {
  refine(by(valid(tac)))
}

///|
/// `r n`: rotate the subgoals.
pub fn r(n : Int64) -> Goalstack raise {
  refine(rotate(n))
}

///|
/// `er tac`: `e tac` followed by a rotation to the next THENL branch.
pub fn er(tac : Tactic) -> Goalstack raise {
  let e_result = e(tac)
  let (n_subgoals_to_rotate, n_subgoals) = match current_goalstack.val {
    More((_, gl, _), tail=More((_, glprev, _), tail=_)) => {
      let n_subgoals = gl.length()
      if n_subgoals == 0 {
        (0, 0)
      } else {
        (n_subgoals - glprev.length() + 1, n_subgoals)
      }
    }
    _ => raise Failure("current_goalstack must have at least 2 items after 'e'")
  }
  if n_subgoals_to_rotate == 0 || n_subgoals == 1 {
    @lib.remark("(Rotating zero subgoal)\n\n")
    e_result
  } else {
    if @lib.verbose.val {
      print_goalstack(current_goalstack.val)
    }
    @lib.remark(
      "\n(Rotating " +
      n_subgoals_to_rotate.to_string() +
      " subgoal" +
      (if n_subgoals_to_rotate == 1 { "" } else { "s" }) +
      "...)\n\n",
    )
    let new_g = r(n_subgoals_to_rotate.to_int64())
    let cur_gs = current_goalstack.val
    current_goalstack.val = @lib.tl(@lib.tl(cur_gs)).prepend(@lib.hd(cur_gs))
    new_g
  }
}

///|
pub fn set_goal(asl : List[Term], w : Term) -> Goalstack raise {
  current_goalstack.val = @list.singleton(
    mk_goalstate((asl.map(t => ("", @kernel.assume_rule(t))), w)),
  )
  current_goalstack.val
}

///|
/// `g t`: set the goal.
pub fn g(t : Term) -> Goalstack raise {
  let fvs = @lib.sort(
    (a : String, b : String) => @kernel.compare_string(a, b) < 0,
    @lib.map(v => @kernel.dest_var(v).0, @kernel.frees(t)),
  )
  if !fvs.is_empty() {
    let errmsg = @lib.end_itlist((s, t) => s + ", " + t, fvs)
    @lib.warn(true, "Free variables in goal: " + errmsg)
  }
  set_goal(@list.List([]), t)
}

///|
/// `b()`: back up one step.
pub fn b() -> Goalstack raise {
  let l = current_goalstack.val
  if l.length() == 1 {
    raise Failure("Can't back up any more")
  }
  current_goalstack.val = @lib.tl(l)
  current_goalstack.val
}

///|
/// `p()`: the current goalstack.
pub fn p() -> Goalstack {
  current_goalstack.val
}

///|
pub fn top_realgoal() -> Goal raise {
  match current_goalstack.val {
    More((_, More(gl, tail=_), _), tail=_) => gl
    _ => match_failure()
  }
}

///|
pub fn top_goal() -> (List[Term], Term) raise {
  let (asl, w) = top_realgoal()
  (asl.map(p => @kernel.concl(p.1)), w)
}

///|
pub fn top_thm() -> Thm raise {
  match current_goalstack.val {
    More((_, Empty, f), tail=_) => f(null_inst, @list.List([]))
    _ => match_failure()
  }
}

// ---------------------------------------------------------------------------
// Load-time steps, in upstream order.
// ---------------------------------------------------------------------------

///|
fn init {
  @parser.begin_theory("tactics")
  load_steps() catch {
    e => abort("HOL Light: loading tactics.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}

///|
fn load_steps() -> Unit raise {
  falsity_c.set(@drule.new_definition(@term_syntax.parse_term("(_FALSITY_ : Bool) == false")))
  // `let pth = ... and qth = ASSUME `_FALSITY_``: left to right.
  mk_fthm_pth.set(@bool.undisch(@bool.eq_imp_rule(falsity()).0))
  mk_fthm_qth.set(@kernel.assume_rule(@term_syntax.parse_term("_FALSITY_")))
  valid_false_tm.set(@term_syntax.parse_term("_FALSITY_"))
  conv_tac_t.set(@term_syntax.parse_term("true"))
  disch_tac_f.set(@term_syntax.parse_term("false"))
  let tm1 = @term_syntax.parse_term("(p : Bool) && ((q : Bool) → (r : Bool))")
  let tm2 = @term_syntax.parse_term("(p : Bool) → (q : Bool)")
  let (th1, th2) = @bool.conj_pair(@kernel.assume_rule(tm1))
  let th = @lib.itlist(
    @bool.disch,
    @list.List([tm1, tm2]),
    @bool.mp(th2, @bool.mp(@kernel.assume_rule(tm2), th1)),
  )
  // `MATCH_MP_TAC th THEN CONJ_TAC`: MATCH_MP_TAC's set-up runs now.
  ants_tac_c.set(then_tac(match_mp_tac(th), conj_tac))
}
