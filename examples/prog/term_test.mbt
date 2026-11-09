///|
fn check_program_terms() -> Unit raise {
  // the program syntax's words name variables (`while` between backticks)
  for word in ["var", "end", "skip", "abort", ":=", "while", "do"] {
    let v = @kernel.mk_var(word, @kernel.bool_ty)
    assert_eq(@term_syntax.parse_term(@term_syntax.print_term(v)), v)
  }
  let predicate = @term_syntax.parse_term("(x : Num) => x == 0")
  let skip = @term_syntax.parse_term("(SKIP : Command[Num])")
  let built = @basics.list_mk_icomb(
    "correct",
    @list.List([predicate, skip, predicate]),
  )
  let quoted = @term_syntax.parse_term(
    "correct((x : Num) => x == 0, SKIP, (x : Num) => x == 0)",
  )
  assert_eq(built, quoted)
  let rule = @bool.ispecl(
    @list.List([predicate, predicate]),
    @prog.correct_skip(),
  )
  let implication = @basics.list_mk_icomb(
    "IMPLIES",
    @list.List([predicate, predicate]),
  )
  let proof = @bool.mp(rule, @prog.pred_taut(implication))
  assert_eq(@kernel.concl(proof), quoted)
  assert_true(@kernel.hyp(proof).is_empty())
  let update = @term_syntax.parse_term("(x : Num) => x + 1")
  let assign = @basics.list_mk_icomb("Assign", @list.List([update]))
  assert_eq(assign, @term_syntax.parse_term("Assign((x : Num) => x + 1)"))
  let sequence = @basics.list_mk_icomb("Seq", @list.List([assign, skip]))
  assert_eq(
    sequence,
    @term_syntax.parse_term("Seq(Assign((x : Num) => x + 1), SKIP)"),
  )
  assert_eq(@term_syntax.parse_term(@term_syntax.print_term(sequence)), sequence)
  assert_true(@kernel.hyp(@prog.example_factorial()).is_empty())
}
