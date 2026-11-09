// Proofs in the readable style as MoonBit values. The readable proof format
// (`theorem` on a string) parses its text into these same tactics when a
// file loads; a proof written with the functions below builds the tactic
// directly, with the same steps in the same order, so it proves the same
// theorem and parses its terms in the same order.
//
// Statements and terms are in the term syntax, read in the context of the
// goal they are used in (`parse_env_string`): its free variables need no
// type.

///|
/// A theorem argument of a proof step, resolved against the goal when the
/// step runs.
pub(all) enum Arg {
  /// `-`: the most recent assumption
  Prev
  /// The theorem `name`; if evaluating it raises, the assumption labelled
  /// `name`. A theorem whose theory is not loaded yet aborts instead
  /// (`@lib.Cell::get`), so refer to an assumption that shares a theorem's
  /// name with `Label`.
  Thm(String, () -> @kernel.Thm raise)
  /// The assumption labelled with the string.
  Label(String)
  /// A theorem rule (`thm -> thm`) applied to the next argument.
  Rule((@kernel.Thm) -> @kernel.Thm raise, Arg)
  /// A rule from a term (`term -> thm`), the term parsed in the goal's
  /// context.
  TermRule((@kernel.Term) -> @kernel.Thm raise, String)
  /// A rule from theorems and a term (`thm list -> term -> thm`).
  ThmsTermRule(
    (@list.List[@kernel.Thm]) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
    Array[Arg],
    String
  )
  /// A rule from terms and a theorem (`term list -> thm -> thm`).
  TermsRule(
    (@list.List[@kernel.Term]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
    Array[String],
    Arg
  )
}

///|
fn goal_term(gl : @tactics.Goal, s : String) -> @kernel.Term raise {
  parse_env_string(make_env(gl.0, gl.1), s)
}

///|
/// The theorem `arg` denotes in the goal `gl`.
pub fn Arg::resolve(arg : Arg, gl : @tactics.Goal) -> @kernel.Thm raise {
  match arg {
    Prev => @lib.hd(gl.0).1
    Thm(name, thm) => thm() catch { _ => @lib.assoc(name, gl.0) }
    Label(name) => @lib.assoc(name, gl.0)
    Rule(rule, arg) => {
      let th = arg.resolve(gl)
      rule(th)
    }
    TermRule(rule, s) => rule(goal_term(gl, s))
    ThmsTermRule(rule, args, s) => {
      let ths = @list.List(args.map(a => a.resolve(gl)))
      rule(ths)(goal_term(gl, s))
    }
    TermsRule(rule, ss, arg) => {
      let tms = @list.List(ss.map(s => goal_term(gl, s)))
      let th = arg.resolve(gl)
      rule(tms)(th)
    }
  }
}

///|
/// The tactic `ttac` given the theorems `args` denote in the goal
/// (`fol H1 TriangleCong_DEF`).
pub fn by(
  ttac : (@list.List[@kernel.Thm]) -> @tactics.Tactic raise,
  args : Array[Arg],
) -> @tactics.Tactic {
  gl => {
    let ths = @list.List(args.map(a => a.resolve(gl)))
    ttac(ths)(gl)
  }
}

///|
/// The tactic `ttac` given the theorem `arg` denotes in the goal.
pub fn by_thm(ttac : @tactics.ThmTactic, arg : Arg) -> @tactics.Tactic {
  gl => ttac(arg.resolve(gl))(gl)
}

///|
/// The steps one after the other: `t1 THEN (t2 THEN (... THEN ALL_TAC))`.
pub fn steps(tactics : Array[@tactics.Tactic]) -> @tactics.Tactic {
  steps_then(tactics, @tactics.all_tac)
}

///|
/// The steps one after the other, ending with `last` (a case split) instead
/// of `ALL_TAC`.
pub fn steps_then(
  tactics : Array[@tactics.Tactic],
  last : @tactics.Tactic,
) -> @tactics.Tactic {
  let mut tac = last
  for i = tactics.length() - 1; i >= 0; i = i - 1 {
    tac = @tactics.then_tac(tactics[i], tac)
  }
  tac
}

///|
/// The theorem `statement`, proved by `proof`.
pub fn prove(statement : String, proof : @tactics.Tactic) -> @kernel.Thm raise {
  @tactics.prove(parse_env_string(@list.List([]), statement), proof)
}

///|
/// `statement [label] by proof`: prove `statement`, then continue with it as
/// the assumption `label`.
pub fn have(
  statement : String,
  label : String,
  proof : @tactics.Tactic,
) -> @tactics.Tactic {
  gl => subgoal_tac(statement, label, proof, gl)
}

///|
/// `assume statement [label] by proof`.
pub fn assuming(
  statement : String,
  label : String,
  proof : @tactics.Tactic,
) -> @tactics.Tactic {
  gl => assume_(statement, label, proof, gl)
}

///|
/// `exists_TAC term`.
pub fn exists(term : String) -> @tactics.Tactic {
  gl => exists_tac(term, gl)
}
