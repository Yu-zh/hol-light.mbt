// A test of Jordan/real_ext.ml's REAL_LMUL_TAC and REAL_RMUL_TAC, which no
// theory uses while it loads: each reduces a = b to multiplying both sides
// by a nonzero real, leaving that goal and the side condition.

///|
test "real_lmul_tac and real_rmul_tac reduce a = b to a product goal" {
  @real_ext.load()
  let two = @term_syntax.parse_term("real_of_num(2)")
  let goal = (
    @list.List([]),
    @term_syntax.parse_term("(a : Real) == (b : Real)"),
  )
  for tac in [@real_ext.real_lmul_tac(two), @real_ext.real_rmul_tac(two)] {
    let (_, goals, _) = tac(goal)
    assert_eq(goals.length(), 2)
  }
}
