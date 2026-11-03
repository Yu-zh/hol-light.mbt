// A test of the preterm builders metis.ml adds for proof reconstruction:
// mk_conjp, which nothing calls, and list_mk_disjp of no disjuncts, which
// reconstruction reaches only with metisverb on (printing the empty
// clause), here or upstream.

///|
test "mk_conjp and list_mk_disjp build the connectives" {
  let p = @term_syntax.parse_term("(p : Bool)")
  let q = @term_syntax.parse_term("(q : Bool)")
  let check = (pt : @preterm.Preterm, s : String) => {
    assert_eq(@metis.typecheck(@list.List([]))(pt), @term_syntax.parse_term(s))
  }
  check(
    @metis.mk_conjp(@preterm.preterm_of_term(p), @preterm.preterm_of_term(q)),
    "(p : Bool) && (q : Bool)",
  )
  check(
    @metis.mk_disjp(@preterm.preterm_of_term(p), @preterm.preterm_of_term(q)),
    "(p : Bool) || (q : Bool)",
  )
  check(@metis.mk_negp(@preterm.preterm_of_term(p)), "!(p : Bool)")
  check(@metis.list_mk_disjp(@list.List([])), "false")
  // the tail is folded onto the head: [p; q] gives q \/ p, as upstream
  check(
    @metis.list_mk_disjp(
      @list.List([@preterm.preterm_of_term(p), @preterm.preterm_of_term(q)]),
    ),
    "(q : Bool) || (p : Bool)",
  )
}
