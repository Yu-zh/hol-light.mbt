///|
fn check_ntrie_term_construction() -> Unit raise {
  fn parse(source : String) -> @kernel.Term raise {
    @term_syntax.parse_term(source) catch {
      _ => fail("could not parse term: " + source)
    }
  }
  for
    (values, source) in [
      ([], "NTRIE(NEMPTY)"),
      ([0L], "NTRIE(NZERO)"),
      ([1L], "NTRIE(NNODE(NEMPTY, NZERO))"),
      ([0L, 1L, 2L], "NTRIE(NNODE(NNODE(NZERO, NZERO), NZERO))"),
    ] {
    let parsed = parse(source)
    assert_eq(@ntrie.mk_small_ntrie(values), parsed)
    assert_eq(
      @ntrie.mk_ntrie(@list.List(values).map(@num.num_of_int64)),
      parsed,
    )
    assert_eq(
      @lib.sort((a, b) => a < b, @ntrie.dest_small_ntrie(parsed)),
      @list.List(values),
    )
    assert_eq(parse(@term_syntax.print_term(parsed)), parsed)
  }
  let values = [0L, 1L, 2L]
  assert_eq(
    @ntrie.mk_small_ntrie([0L, 1L, 2L, 2L]),
    @ntrie.mk_small_ntrie(values),
  )
  let input = [99L, 1L, 3L, 99L]
  assert_eq(@ntrie.mk_small_ntrie(input[1:3]), @ntrie.mk_small_ntrie([1L, 3L]))
  let large = @num.num_of_string("18446744073709551616")
  let term = @ntrie.mk_ntrie(@list.List([large]))
  assert_eq(@ntrie.dest_ntrie(term), @list.List([large]))
  // The standard pretty-printer has a depth limit, so build the full ordinary
  // quotation explicitly for this deep trie.
  let mut source = "NNODE(NEMPTY, NZERO)"
  for _ in 0..<64 {
    source = "NNODE(" + source + ", NEMPTY)"
  }
  assert_eq(parse("NTRIE(" + source + ")"), term)
  // Existing proof conversions accept constructor syntax and built terms alike.
  let membership = parse("IN(1, NTRIE(NNODE(NEMPTY, NZERO)))")
  let thm = @ntrie.ntrie_in_conv(membership)
  assert_eq(@equal.lhs(@kernel.concl(thm)), membership)
  assert_eq(@equal.rhs(@kernel.concl(thm)), parse("true"))
  assert_true(@kernel.hyp(thm).is_empty())
  let set = parse("({0, 1, 2} : (Num) -> Bool)")
  let encoded = @ntrie.ntrie_encode_conv(set)
  assert_eq(@equal.lhs(@kernel.concl(encoded)), set)
  assert_eq(@equal.rhs(@kernel.concl(encoded)), @ntrie.mk_small_ntrie(values))
  assert_true(@kernel.hyp(encoded).is_empty())
  // Compact output remains an explicit display helper, not a parsing format.
  assert_eq(@ntrie.string_of_ntrie(@ntrie.mk_small_ntrie(values)), "%%(0 1 2)")
  let ordinary = parse("`%%`(0)")
  assert_true(@kernel.frees(ordinary).any(v => v is @kernel.Var("%%", _)))
}
