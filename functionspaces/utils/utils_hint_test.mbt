// A test of Functionspaces/utils.ml's HINT_EXISTS_TAC, which no theory uses
// while it loads: it picks the witness of an existential goal from an
// assumption matching one of the goal's conjuncts, then rewrites with the
// assumptions.

///|
test "hint_exists_tac takes the witness from an assumption" {
  @utils.load()
  let pa = @term_syntax.parse_term("(P : (Num) -> Bool)((a : Num))")
  let goal = (
    @list.List([("", @kernel.assume_rule(pa))]),
    @term_syntax.parse_term(
      "∃ x : Num, (P : (Num) -> Bool)(x) && (Q : (Num) -> Bool)(x)",
    ),
  )
  let (_, goals, _) = @utils.hint_exists_tac(goal)
  assert_eq(goals.length(), 1)
  let (_, w) = goals.nth(0).unwrap()
  // the witness a, then the assumption P a rewritten away
  assert_eq(w, @term_syntax.parse_term("(Q : (Num) -> Bool)((a : Num))"))
}
