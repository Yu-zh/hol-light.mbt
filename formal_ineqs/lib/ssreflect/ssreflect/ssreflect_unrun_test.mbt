// A test of the ssreflect port's break_conjuncts, which no theory calls
// while it loads with a negated theorem: ~P becomes P <=> F.

///|
test "break_conjuncts turns a negation into an equation with F" {
  @ssreflect.load()
  let p = @term_syntax.parse_term("(p : Bool)")
  let ths = @ssreflect.break_conjuncts(
    @kernel.assume_rule(@term_syntax.parse_term("!(p : Bool)")),
  )
  assert_eq(ths.length(), 1)
  assert_eq(
    @kernel.concl(ths.nth(0).unwrap()),
    @basics.mk_eq(p, @term_syntax.parse_term("false")),
  )
}
