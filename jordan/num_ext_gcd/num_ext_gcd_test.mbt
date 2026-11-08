///|
test "the GCD conversion proves the statement test_num_ext_gcd spells" {
  @num_ext_gcd.load()
  @num_ext_gcd.test_num_ext_gcd(12L, 18L)
  @num_ext_gcd.test_num_ext_gcd(35L, 64L)
  inspect(
    @kernel.concl(@num_ext_gcd.hol_gcd(12L, 18L)) ==
    @term_syntax.parse_term("GCD(12, 18) == 6"),
    content="true",
  )
}
