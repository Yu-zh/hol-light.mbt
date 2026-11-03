// ===========================================================================
// Intuitionistic theorem prover, complete for the propositional fragment
// (port of itab.ml).
// ===========================================================================

///|
using @kernel {type Term, type Thm}

///|
using @list {type List}

///|
using @tactics {type Tactic, type ThmTactic}

///|
/// `UNIFY_ACCEPT_TAC mvs th`: accept `th` modulo unification of the
/// metavariables `mvs`.
pub fn unify_accept_tac(mvs : List[Term], th : Thm) -> Tactic {
  g => {
    let (_, w) = g
    let insts = @drule.term_unify(mvs, @kernel.concl(th), w)
    // The tuple is evaluated right to left: the justification's theorem
    // first.
    let th1 = @drule.instantiate_rule(insts, th)
    (
      (@list.List([]), insts),
      @list.List([]),
      (i, ths) => {
        match ths {
          Empty => @drule.instantiate_rule(i, th1)
          _ => raise @lib.MatchFailure("itab.ml")
        }
      },
    )
  }
}

///|
/// `UNIFY_REFL_TAC`: solve `expr = x`, or `expr = f x y z`, where `x` and
/// `f` are metavariables.
pub let unify_refl_tac : Tactic = gl => {
  let (_, w) = gl
  let (w_lhs, w_rhs) = @kernel.dest_eq(w)
  if @kernel.is_var(w_rhs) {
    if @kernel.vfree_in(w_rhs, w_lhs) {
      raise Failure(
        "UNIFY_REFL_TAC: failed: `" + @printer.string_of_term(w) + "`",
      )
    }
    unify_accept_tac(@list.singleton(w_rhs), @kernel.refl(w_lhs))(gl)
  } else {
    let (constr, rargs) = @basics.strip_comb(w_rhs)
    if !@kernel.is_var(constr) {
      raise Failure("UNIFY_REFL_TAC: not variable")
    }
    if @kernel.vfree_in(constr, w_lhs) {
      raise Failure(
        "UNIFY_REFL_TAC: failed: `" + @printer.string_of_term(w) + "`",
      )
    }
    // Replace the non-variable arguments of the right-hand side's function
    // with fresh variables. Upstream prints the warning with `printf`, on
    // the standard output channel but not through the formatter.
    let rargs_vars = @lib.map(
      v => {
        if @kernel.is_var(v) {
          v
        } else {
          @pp.print_string(
            "UNIFY_REFL_TAC: warning: this isn't var: " +
            @printer.string_of_term(v) +
            "\n",
          )
          @basics.genvar(@kernel.type_of(v))
        }
      },
      rargs,
    )
    let f = @basics.list_mk_abs(rargs_vars, w_lhs)
    let the_goal = @basics.mk_eq(w_lhs, @basics.list_mk_comb(f, rargs))
    let th = @tactics.prove(
      the_goal,
      @tactics.then_tac(
        @tactics.conv_tac(@equal.rand_conv(@equal.depth_conv(@equal.beta_conv))),
        @tactics.refl_tac,
      ),
    )
    unify_accept_tac(@list.singleton(constr), th)(gl)
  }
}

// ---------------------------------------------------------------------------
// The prover, as a tactic.
// ---------------------------------------------------------------------------

///|
/// `CONJUNCTS_THEN' ttac cth = ttac(CONJUNCT1 cth) THEN ttac(CONJUNCT2 cth)`
fn conjuncts_then1(ttac : ThmTactic) -> ThmTactic {
  cth => {
    // The operands of THEN are evaluated right to left.
    let t2 = ttac(@bool.conjunct2(cth))
    let t1 = ttac(@bool.conjunct1(cth))
    @tactics.then_tac(t1, t2)
  }
}

///|
fn implicate(t : Term) -> Thm raise {
  let th1 = @equal.ap_thm(@bool.not_def(), @basics.dest_neg(t))
  @equal.conv_rule(@equal.rand_conv(@equal.beta_conv), th1)
}

///|
let right_reversible_tac : Tactic = @tactics.first(
  @list.List([
    @tactics.conj_tac, @tactics.gen_tac, @tactics.disch_tac, @tactics.eq_tac,
  ]),
)

///|
fn left_reversible_tac(th : Thm) -> Tactic {
  gl => {
    let ttacs : List[ThmTactic] = @list.List([
      conjuncts_then1(th => @tactics.assume_tac(th)),
      th => @tactics.disj_cases_tac(th),
      th => @tactics.choose_tac(th),
      th => @tactics.assume_tac(@kernel.eq_mp(implicate(@kernel.concl(th)), th)),
      th => {
        let (a, b) = @bool.eq_imp_rule(th)
        conjuncts_then1(th => @tactics.mp_tac(th))(@bool.conj(a, b))
      },
    ])
    @lib.tryfind((ttac : ThmTactic) => ttac(th)(gl), ttacs)
  }
}

///|
fn itaut_tac_n(mvs : List[Term], n : Int32) -> Tactic {
  gl => {
    if n <= 0 {
      raise Failure("ITAUT_TAC: Too deep")
    }
    let then_ = @tactics.then_tac
    let no_tac = @tactics.no_tac
    let instantiate_forall : ThmTactic = th => {
      // `ASSUME_TAC th THEN (let gv = ... in ...)`: the right operand,
      // with its genvar, is evaluated first.
      let gv = @basics.genvar(
        @kernel.type_of(@basics.dest_forall(@kernel.concl(th)).0),
      )
      let rest = then_(
        then_(
          @tactics.meta_spec_tac(gv, th),
          itaut_tac_n(mvs.prepend(gv), n - 2),
        ),
        no_tac,
      )
      then_(@tactics.assume_tac(th), rest)
    }
    let meta_exists : Tactic = gl => {
      let gv = @basics.genvar(@kernel.type_of(@basics.dest_exists(gl.1).0))
      then_(
        then_(
          @tactics.x_meta_exists_tac(gv),
          itaut_tac_n(mvs.prepend(gv), n - 2),
        ),
        no_tac,
      )(gl)
    }
    let use_imp : ThmTactic = th => {
      let sub = @tactics.subgoal_then(@basics.dest_imp(@kernel.concl(th)).0, ath => {
        @tactics.assume_tac(@bool.mp(th, ath))
      })
      then_(then_(sub, itaut_tac_n(mvs, n - 1)), no_tac)
    }
    // `t1 ORELSE t2 ORELSE ...` groups to the left.
    let first : Tactic = @tactics.first_assum(th => unify_accept_tac(mvs, th))
    let rest : List[Tactic] = @list.List([
      @tactics.accept_tac(@bool.truth()),
      @tactics.first_assum(th => @tactics.contr_tac(th)),
      then_(right_reversible_tac, @tactics.try_tac(itaut_tac_n(mvs, n))),
      then_(
        @tactics.first_x_assum(th => left_reversible_tac(th)),
        @tactics.try_tac(itaut_tac_n(mvs, n)),
      ),
      @tactics.first_x_assum(instantiate_forall),
      then_(then_(@tactics.disj1_tac, itaut_tac_n(mvs, n)), no_tac),
      then_(then_(@tactics.disj2_tac, itaut_tac_n(mvs, n)), no_tac),
      meta_exists,
      @tactics.first_assum(use_imp),
    ])
    let tac = rest.fold(init=first, @tactics.orelse_tac)
    tac(gl)
  }
}

///|
fn itaut_iterdeep_tac(n : Int32) -> Tactic {
  gl => {
    @lib.remark("Searching with limit " + n.to_string())
    @tactics.orelse_tac(
      @tactics.then_tac(itaut_tac_n(@list.List([]), n), @tactics.no_tac),
      itaut_iterdeep_tac(n + 1),
    )(gl)
  }
}

///|
/// `ITAUT_TAC`: iterative-deepening search for an intuitionistic proof.
pub let itaut_tac : Tactic = itaut_iterdeep_tac(0)

///|
/// `ITAUT tm = prove(tm, ITAUT_TAC)`
pub fn itaut(tm : Term) -> Thm raise {
  @tactics.prove(tm, itaut_tac)
}
