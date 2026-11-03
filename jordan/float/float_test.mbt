// Tests of Jordan/float.ml's interval arithmetic on the cases no theory
// reaches while it loads: integer subtraction, the format recognizers,
// negated and ssqrt terms, and inequalities.

///|
fn tm(s : String) -> @kernel.Term raise {
  @term_syntax.parse_term(s)
}

///|
test "int_sub_conv computes a + --b" {
  @float.load()
  for
    p in [
      ("int_add(int_of_num(5), int_neg(int_of_num(3)))", "int_of_num(2)"),
      (
        "int_add(int_of_num(3), int_neg(int_of_num(5)))", "int_neg(int_of_num(2))",
      ),
    ] {
    let t = tm(p.0)
    let th = @float.int_sub_conv(t)
    assert_eq(@kernel.hyp(th), @list.List([]))
    assert_eq(@kernel.concl(th), @basics.mk_eq(t, tm(p.1)))
  }
}

///|
test "the format recognizers accept Jordan's literals" {
  @float.load()
  assert_true(@float.is_pos_int_format(tm("int_of_num(3)")))
  assert_false(@float.is_pos_int_format(tm("int_neg(int_of_num(3))")))
  assert_true(@float.is_neg_int_format(tm("int_neg(int_of_num(3))")))
  assert_false(@float.is_neg_int_format(tm("int_of_num(3)")))
  assert_true(
    @float.is_float_format(tm("float(int_of_num(3), int_neg(int_of_num(1)))")),
  )
  assert_false(@float.is_float_format(tm("float(int_of_num(3), (n : Int))")))
}

///|
test "interval_of_term bounds negated and ssqrt terms" {
  @float.load()
  for
    s in [
      "real_neg(real_of_num(2))", "ssqrt(real_of_num(2))", "real_neg(ssqrt(real_of_num(2)))",
    ] {
    let t = tm(s)
    let th = @float.interval_of_term(10L, t)
    assert_eq(@kernel.hyp(th), @list.List([]))
    // interval x c e: the term, a float centre and a float error bound
    let (x, c, e) = @float.dest_interval(@kernel.concl(th))
    assert_eq(x, t)
    assert_true(@float.is_float_format(c))
    assert_true(@float.is_float_format(e))
  }
}

///|
test "real_ineq proves a strict inequality between constants" {
  @float.load()
  let t = tm("real_lt(real_of_num(1), ssqrt(real_of_num(2)))")
  let th = @float.real_ineq(10L, t)
  assert_eq(@kernel.hyp(th), @list.List([]))
  assert_eq(@kernel.concl(th), t)
}
