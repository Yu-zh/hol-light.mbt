// In a package of its own: the test defines a constant named f, which would
// change how term_syntax's other tests read a variable f.

///|
test "naming a binder back avoids capture by a generated binder" {
  @kernel.new_constant("f", @kernel.mk_type("bool", @list.List([])))
  // the outer binder is named like the constant f, so it is elaborated
  // under an alias; the paired lambda's generated binder (GABS's f) was
  // chosen fresh against that alias only. Named back, the outer binder must
  // not be captured: the term is the one written with a binder named h
  let t = @term_syntax.parse_term(
    "(f : ((Num, Num)) -> Num) => fn { (x, y) => f((x, y)) }",
  )
  let u = @term_syntax.parse_term(
    "(h : ((Num, Num)) -> Num) => fn { (x, y) => h((x, y)) }",
  )
  assert_true(@basics.aconv(t, u))
  assert_true(t is Abs(Var("f", _), _))
}
