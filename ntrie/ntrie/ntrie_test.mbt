// Run from the reference test after its snapshot: parsing and proving allocate
// global type/variable IDs that the upstream snapshot checks.

///|
fn check_ntrie_disjointness_without_sugar() -> Unit raise {
  @ntrie.load()

  // User-facing statement: ordinary HOL set syntax needs no ntrie notation.
  let goal = @term_syntax.parse_term("DISJOINT({1, 3}, {2, 4})")
  let encode = @equal.binop_conv(@ntrie.ntrie_encode_conv)(goal)
  let trie_goal = @equal.rhs(@kernel.concl(encode))
  let decide = @ntrie.ntrie_disjoint_conv(trie_goal)
  let proof = @bool.eqt_elim(@kernel.trans(encode, decide))
  assert_eq(@kernel.concl(proof), goal)
  assert_true(@kernel.hyp(proof).is_empty())

  // For data supplied by MoonBit code, build the same trie terms directly.
  // This replaces the former quotation: DISJOINT %%(1 3) %%(2 4).
  let left = @ntrie.mk_small_ntrie([1, 3])
  let right = @ntrie.mk_small_ntrie([2, 4])
  let built_goal = @basics.mk_binop(@ntrie.disjoint_tm(), left, right)
  assert_eq(built_goal, trie_goal)
  let built_proof = @bool.eqt_elim(@ntrie.ntrie_disjoint_conv(built_goal))
  assert_eq(@kernel.concl(built_proof), built_goal)
  assert_true(@kernel.hyp(built_proof).is_empty())
  // Transport the builder-based proof back to the user's ordinary set statement.
  let ordinary_proof = @kernel.eq_mp(@equal.sym(encode), built_proof)
  assert_eq(@kernel.concl(ordinary_proof), goal)
  assert_true(@kernel.hyp(ordinary_proof).is_empty())

  // A shared element must produce a refutation rather than a disjointness proof.
  let overlapping = @term_syntax.parse_term("DISJOINT({1, 3}, {3, 4})")
  let encode_overlap = @equal.binop_conv(@ntrie.ntrie_encode_conv)(overlapping)
  let decide_overlap = @ntrie.ntrie_disjoint_conv(
    @equal.rhs(@kernel.concl(encode_overlap)),
  )
  let refutation = @kernel.trans(encode_overlap, decide_overlap)
  assert_eq(@equal.lhs(@kernel.concl(refutation)), overlapping)
  assert_eq(
    @equal.rhs(@kernel.concl(refutation)),
    @term_syntax.parse_term("false"),
  )
  assert_true(@kernel.hyp(refutation).is_empty())
}
