// A test of Rqe/poly_ext.ml's is_poly, which no theory calls while it
// loads: it recognizes applications of poly.

///|
test "is_poly recognizes applications of poly" {
  @poly_ext.load()
  assert_true(
    @poly_ext.is_poly(
      @term_syntax.parse_term("poly((p : List[Real]), (x : Real))"),
    ),
  )
  assert_false(
    @poly_ext.is_poly(@term_syntax.parse_term("(x : Real) + real_of_num(1)")),
  )
}
