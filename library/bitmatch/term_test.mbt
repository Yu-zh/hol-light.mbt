///|
fn check_bitmatch_terms() -> Unit raise {
  let tm = @term_syntax.parse_term
  for word in ["BITPAT", "bitmatch"] {
    assert_eq(tm("(" + word + " : Bool)"), @kernel.mk_var(word, @kernel.bool_ty))
  }
  assert_eq(@bitmatch.mk_bitpat([]), tm("NILPAT"))
  let fields = [tm("true"), tm("false"), tm("true")]
  let pattern = @bitmatch.mk_bitpat(fields[0:2])
  assert_eq(pattern, tm("CONSPAT(CONSPAT(NILPAT, word1(true)), word1(false))"))
  assert_eq(tm(@term_syntax.print_term(pattern)), pattern)
  let a = tm("(a : Bool)")
  let clauses = [(@bitmatch.mk_bitpat([a]), a)]
  let built = @bitmatch.mk_bitmatch(tm("word1(true)"), clauses)
  let ordinary = tm(
    "_BITMATCH(word1(true), _SEQPATTERN((i : Num) => (r : Bool) => ∃ a : Bool, _UNGUARDED_PATTERN(pat_set(CONSPAT(NILPAT, word1(a)), i), a == r), _ELSEPATTERN(ARB)))",
  )
  assert_true(@basics.aconv(built, ordinary))
  assert_true(@basics.aconv(tm(@term_syntax.print_term(built)), built))
  assert_true(@kernel.frees(built).is_empty())
  // The existing evaluator accepts literal word numerals.
  let numeral_match = @bitmatch.mk_bitmatch(tm("(word(1) : Word[1])"), clauses)
  let proof = @bitmatch.bitmatch_conv(numeral_match)
  assert_true(@basics.aconv(@equal.lhs(@kernel.concl(proof)), numeral_match))
  assert_eq(@equal.rhs(@kernel.concl(proof)), tm("true"))
  assert_true(@kernel.hyp(proof).is_empty())
  // Overlapping clauses preserve first-match precedence; slices select clauses.
  let zero = @bitmatch.mk_bitpat([tm("false")])
  let alternatives = [(zero, tm("false")), (zero, tm("true")), (zero, tm("false"))]
  let ordered = @bitmatch.mk_bitmatch(tm("(word(0) : Word[1])"), alternatives[1:])
  let ordered_proof = @bitmatch.bitmatch_seq_conv(ordered)
  assert_eq(@equal.rhs(@kernel.concl(ordered_proof)), tm("true"))
  let unmatched = @bitmatch.mk_bitmatch(
    tm("(word(1) : Word[1])"),
    [(zero, tm("true"))],
    default=tm("false"),
  )
  let default_proof = @bitmatch.bitmatch_seq_conv(unmatched)
  assert_eq(@equal.rhs(@kernel.concl(default_proof)), tm("false"))
  // An explicit default also permits an empty match.
  let empty = @bitmatch.mk_bitmatch(tm("(word(0) : Word[2])"), [], default=tm("false"))
  assert_eq(empty, tm("_BITMATCH((word(0) : Word[2]), _ELSEPATTERN(false))"))
  // Names resembling the builder's internal binders remain free in results.
  let result = tm("(bm_input : Num) == 0 && (bm_result : Bool)")
  let capture = @bitmatch.mk_bitmatch(
    tm("(word(0) : Word[2])"),
    [(@bitmatch.mk_bitpat([tm("(word(0) : Word[2])")]), result)],
    default=tm("false"),
  )
  assert_eq(@kernel.frees(capture).length(), 2)
  assert_true(@kernel.frees(capture).contains(tm("(bm_input : Num)")))
  assert_true(@kernel.frees(capture).contains(tm("(bm_result : Bool)")))
  try @bitmatch.mk_bitpat([tm("0")]) catch {
    _ => ()
  } noraise {
    _ => fail("expected non-word field rejection")
  }
  try @bitmatch.mk_bitmatch(tm("true"), clauses) catch {
    _ => ()
  } noraise {
    _ => fail("expected non-word scrutinee rejection")
  }
  try @bitmatch.mk_bitmatch(tm("(word(0) : Word[2])"), []) catch {
    _ => ()
  } noraise {
    _ => fail("expected empty match rejection")
  }
  try
    @bitmatch.mk_bitmatch(tm("(word(0) : Word[2])"), clauses, default=tm("0"))
  catch {
    _ => ()
  } noraise {
    _ => fail("expected default type rejection")
  }
}
