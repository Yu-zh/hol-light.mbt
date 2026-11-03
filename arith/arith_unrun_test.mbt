// A test of arith.ml's NUM_CANCEL_CONV, which no theory calls while it
// loads: it cancels the summands common to both sides of an equation.

///|
test "num_cancel_conv cancels a summand common to both sides" {
  let t = @term_syntax.parse_term(
    "(a : Num) + (b : Num) + (c : Num) == (d : Num) + b",
  )
  let th = @arith.num_cancel_conv(t)
  assert_eq(@kernel.hyp(th), @list.List([]))
  let (l, r) = @kernel.dest_eq(@kernel.concl(th))
  assert_eq(l, t)
  // the cancelled equation no longer mentions b
  let (rl, rr) = @kernel.dest_eq(r)
  let b = @term_syntax.parse_term("(b : Num)")
  assert_false(@lib.mem(b, @kernel.frees(rl)))
  assert_false(@lib.mem(b, @kernel.frees(rr)))
}
