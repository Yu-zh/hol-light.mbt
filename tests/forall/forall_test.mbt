///|
test "forall is the universal quantifier and round trips through the printer" {
  let term = @term_syntax.parse_term("∀ x : Bool, x == x")
  let x = @kernel.mk_var("x", @kernel.bool_ty)
  assert_eq(term, @bool.mk_forall(x, @basics.mk_eq(x, x)))
  let printed = @printer.string_of_term(term)
  assert_true(printed.has_prefix("forall "))
  assert_eq(@term_syntax.parse_term(@term_syntax.print_term(term)), term)
  assert_true(@basics.is_forall(term))
  let (quantifier, _) = @kernel.dest_comb(term)
  assert_eq(@kernel.dest_const(quantifier).0, "forall")
  assert_true(@kernel.constants().any(entry => entry.0 == "forall"))
  assert_true(!@kernel.constants().any(entry => entry.0 == "!"))
  assert_true(@basics.is_uexists(@term_syntax.parse_term("existsunique((x : Bool) => x)")))
  assert_true(!@printer.parses_as_binder("!"))
}

///|
test "legacy universal notation is rejected" {
  for source in ["!x:bool. x", "(!)", "!", "forall x:bool. !y:bool. x = y"] {
    try @parser.parse_term(source) catch {
      Failure(message) =>
        assert_eq(message, "'!' notation has been removed; use 'forall'")
      error => raise error
    } noraise {
      _ => fail("legacy notation was accepted: " + source)
    }
  }
  try @parser.parse_preterm([Ident("!")]) catch {
    @parserutil.Noparse => ()
    error => raise error
  } noraise {
    _ => fail("legacy token was accepted")
  }
}

///|
test "canonical forall preserves the quantifier's precedence in term ordering" {
  let quantifier = @kernel.mk_const("forall", @list.List([]))
  for (name, _) in @kernel.constants() {
    let constant = @kernel.mk_const(name, @list.List([]))
    if name == "forall" {
      assert_eq(quantifier.compare(constant), 0)
    } else {
      assert_true(quantifier.compare(constant) < 0)
      assert_true(constant.compare(quantifier) > 0)
      assert_true(@kernel.alphaorder(quantifier, constant) < 0)
    }
  }
  // Ordinary strings and variable names still use lexical ordering.
  assert_true(@kernel.compare_string("forall", "T") > 0)
  assert_true(
    @kernel.mk_var("forall", @kernel.bool_ty).compare(
      @kernel.mk_var("T", @kernel.bool_ty),
    ) >
    0,
  )
}
