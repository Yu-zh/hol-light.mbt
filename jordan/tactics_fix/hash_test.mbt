///|
test "forall retains the term hash used by Jordan proof labels" {
  @tactics_fix.load()
  // Values independently obtained from the upstream OCaml hash function.
  let quantified = @term_syntax.parse_term("∀ x : Bool, x == x")
  assert_eq(@tactics_fix.hash_of_term(quantified), 5537L)
  let renamed = @term_syntax.parse_term("∀ y : Bool, y == y")
  assert_eq(@tactics_fix.hash_of_term(renamed), 5537L)
  // Only the constant's symbol code is fixed; ordinary string hashing stays unchanged.
  assert_eq(@tactics_fix.hash_of_string("forall"), 5596L)
}
