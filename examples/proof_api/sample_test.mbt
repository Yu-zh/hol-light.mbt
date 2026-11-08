///|
test "MoonBit relation proof proves the relation-successor statement" {
  let theorem = @proof_api.relation_successors()
  assert_true(@kernel.hyp(theorem).is_empty())
  let expected = @term_syntax.parse_term(
    (
      #|∀ R : (Num, Num) -> Bool,
      #|  (∀ x : Num, R(x, x)) →
      #|  (∀ x : Num, ∀ y : Num, ∀ z : Num, R(x, y) && R(y, z) → R(x, z)) →
      #|  ((∀ m : Num, ∀ n : Num, m <= n → R(m, n)) == (∀ n : Num, R(n, SUC(n))))
    ),
  )
  assert_true(@basics.aconv(@kernel.concl(theorem), expected))
}
