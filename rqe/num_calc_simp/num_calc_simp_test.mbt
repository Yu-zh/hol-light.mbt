// A test of Rqe/num_calc_simp.ml's ARITH_REWRITE_CONV in its own package:
// Rqe's theories never call it while they load (Jordan/float.ml's do).

///|
test "arith_rewrite_conv evaluates numeral arithmetic" {
  @num_calc_simp.load()
  for
    p in [
      ("2 + 3 == 5", "true"),
      ("SUC(4) < 3 * 2", "true"),
      ("10 - 4 == 7", "false"),
      ("EVEN(6) && ODD(7)", "true"),
      ("EXP(2, 3) == DIV(8, 1) + MOD(0, 2)", "true"),
      ("PRE(5) >= FACT(3)", "false"),
    ] {
    let t = @term_syntax.parse_term(p.0)
    let th = @num_calc_simp.arith_rewrite_conv(@list.List([]))(t)
    assert_eq(@kernel.hyp(th), @list.List([]))
    assert_eq(@kernel.concl(th), @basics.mk_eq(t, @term_syntax.parse_term(p.1)))
  }
}
