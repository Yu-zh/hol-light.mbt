///|
/// The automaton prover on a generic-width identity with carries: this
/// reaches HORN_WORD_AUTO_TAC, and through it WORD_AUTO_TRANSIFY_TAC and
/// REACHABLE_STATE_TAC, which nothing else runs. In a package of its own:
/// it would shift the counters of the reference test.
test "PURE_WORD_AUTO_RULE proves a generic-width identity with carries" {
  @word_automata.load()
  let tm = @term_syntax.parse_term(
    "word_add((x : Word[N]), y) == word_add(y, x)",
  )
  let th = @word_automata.pure_word_auto_rule(tm)
  assert_true(@basics.aconv(@kernel.concl(th), tm))
  assert_true(@kernel.hyp(th).is_empty())
}
