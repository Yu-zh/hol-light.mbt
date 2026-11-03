// A test of Functionspaces/utils.ml's term_of_horns, which no theory calls
// while it loads: Horn clauses back to a term, T for a clause without
// conclusions.

///|
test "term_of_horns builds conjunctions of implications" {
  @utils.load()
  let p = @term_syntax.parse_term("(p : Bool)")
  let q = @term_syntax.parse_term("(q : Bool)")
  let r = @term_syntax.parse_term("(r : Bool)")
  let t = @utils.term_of_horns(
    @list.List([
      (@list.List([p]), @list.List([q, r])),
      (@list.List([]), @list.List([p])),
      (@list.List([q]), @list.List([])),
    ]),
  )
  let expected = @bool.list_mk_conj(
    @list.List([
      @bool.mk_imp(p, @bool.mk_conj(q, r)),
      p,
      @term_syntax.parse_term("true"),
    ]),
  )
  assert_eq(t, expected)
}
