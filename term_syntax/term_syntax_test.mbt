///|
fn same(new : String, old : String) -> Unit raise {
  let t = @term_syntax.parse_term(new)
  let u = @parser.parse_term(old)
  if !@basics.aconv(t, u) {
    fail("\{new} is not \{old}")
  }
}

///|
test "quantifiers, connectives and their precedence" {
  same("∀ n : Num, n + 0 == n", "forall n:num. n + 0 = n")
  same("∀ p : Bool, ∃ q : Bool, p → q", "forall p:bool. ?q:bool. p ==> q")
  same("∀ x : _, ∀ y : _, x + y == y + x", "forall x y. x + y = y + x")
  same("∀ x : Num, x == x && true", "forall x:num. x = x /\\ T")
  same("∀ a : Bool, ∀ b : Bool, ∀ c : Bool, a && b || c", "forall a b c. a /\\ b \\/ c")
  same("∀ p : _, ∀ q : _, ∀ r : _, p → q → r", "forall p q r. p ==> q ==> r")
  same("∀ a : _, ∀ b : _, ∀ c : _, ∀ d : Num, a + b * c == d", "forall a b c d. a + b * c = d")
  same("∀ p : _, ∀ q : _, !p || q", "forall p q. ~p \\/ q")
  same("∀ x : Num, ∀ y : _, x != y → y != x", "forall x:num y. ~(x = y) ==> ~(y = x)")
  same("∀ a : Num, ∀ b : _, a - b <= a", "forall a b. a - b <= a")
}

///|
test "application, lambdas, conditionals, tuples and lists" {
  same("∀ n : _, SUC(n) > n", "forall n. SUC n > n")
  same("(x : Num) => x * 2", "\\x:num. x * 2")
  same("(x : Num, y : Num) => x + y", "\\x:num y:num. x + y")
  same("∀ f : (Num, Num) -> Num, ∀ x : _, ∀ y : _, x.f(y) == f(x, y)", "forall f:num->num->num x y. f x y = f x y")
  same("∀ c : Bool, ∀ a : Num, ∀ b : _, (if c { a } else { b }) <= a + b", "forall c a b. (if c then a else b) <= a + b")
  same("(1, 2)", "1,2")
  same("(1, true, 3)", "1,T,3")
  same("[1, 2, 3]", "[1;2;3]")
}

///|
test "HOL names: primes and capitalised binders" {
  same("∀ x' : Num, x' == x'", "forall x':num. x' = x'")
  // as in MoonBit, a quantifier is not an operand of → without parentheses
  same("∀ P : (Num) -> Bool, P(0) → (∃ n : _, P(n))", "forall P:num->bool. P 0 ==> ?n. P n")
}

///|
test "types" {
  let ty = @term_syntax.parse_type
  assert_eq(ty("(Num, Bool) -> Bool"), @parser.parse_type("num->bool->bool"))
  assert_eq(ty("(Num, Bool)"), @parser.parse_type("num#bool"))
  assert_eq(ty("List[A]"), @parser.parse_type("(A)list"))
  assert_eq(ty("((A) -> B, A) -> B"), @parser.parse_type("(A->B)->A->B"))
}

///|
test "syntax errors name the offset" {
  let msg = try @term_syntax.parse_term("∀ x : Num x") catch {
    Failure(m) => m
    e => raise e
  } noraise {
    _ => "parsed"
  }
  assert_true(msg.has_prefix("term syntax: unexpected"))
}

///|
test "binders cannot capture what the syntax stands for" {
  // true is the constant T even under a binder named T
  same("(T : Bool) => true", "\\x:bool. T")
  same("(T : Bool) => T", "\\x:bool. x")
  same("(NIL : Num) => [NIL]", "\\x:num. [x]")
  // a binder named like a constant or an interface name binds its uses
  same("(SUC : Num) => SUC", "\\x:num. x")
  same("(exists : Num) => exists", "\\x:num. x")
}

///|
fn rejects(s : String, is_type? : Bool = false) -> String raise {
  try {
    if is_type {
      ignore(@term_syntax.parse_type(s))
    } else {
      ignore(@term_syntax.parse_term(s))
    }
    fail("accepted: " + s)
  } catch {
    Failure(m) => m
    e => raise e
  }
}

///|
test "input without a meaning is an error, not an abort" {
  inspect(rejects("1 % 2"), content="term syntax: operator % has no HOL meaning")
  inspect(rejects("Bool[Num]", is_type=true), content="term syntax: type Bool takes 0 arguments")
  inspect(rejects("_", is_type=true), content="term syntax: _ alone is not a type")
  inspect(rejects("(let : Bool) => let"), content="term syntax: let is a MoonBit keyword")
}

///|
test "a hole inside a type is a fresh type variable" {
  let t = @term_syntax.parse_term("(xs : List[_]) => xs == xs")
  let elem = @kernel.type_of(@kernel.dest_abs(t).0)
  assert_true(elem is Tyapp("list", More(Tyvar(_), tail=Empty)))
  assert_true(@kernel.is_vartype(@basics.dest_fun_ty(@term_syntax.parse_type("(_) -> Bool")).0))
}

///|
test "names with a semicolon are escaped" {
  inspect(@grammar.escape(";;"), content="Some(op_semi_semi)")
  inspect(@grammar.unescape("op_semi_semi"), content=";;")
}

///|
test "an overload declared before its constant reads as the constant once defined" {
  @preterm.make_overloadable("zz_ovl", @parser.parse_type("A->A"))
  @preterm.overload_interface(
    "zz_ovl",
    @term_syntax.parse_term("(zz_ovl_num : (Num) -> Num)"),
  )
  // a read before the definition must not fix the view without the overload
  ignore(@term_syntax.parse_term("(0 : Num)"))
  @kernel.new_constant("zz_ovl_num", @parser.parse_type("num->num"))
  let t = @term_syntax.parse_term("zz_ovl((0 : Num))")
  assert_true(@kernel.is_const(@kernel.rator(t)))
}

///|
test "parse_term_in_context types free variables from the context" {
  let bool_pty = @preterm.pretype_of_type(@kernel.bool_ty)
  let x = @term_syntax.parse_term_in_context(@list.List([("x", bool_pty)]), "x")
  inspect(@kernel.type_of(x) == @kernel.bool_ty, content="true")
  let y = @term_syntax.parse_term_in_context(@list.List([]), "y", ty=bool_pty)
  inspect(@kernel.type_of(y) == @kernel.bool_ty, content="true")
  let e = @term_syntax.parse_term_in_context(
    @list.List([("x", bool_pty)]),
    "x && z",
  )
  inspect(@term_syntax.print_term(e), content="(x : Bool) && (z : Bool)")
}

///|
test "a context variable named like a constant means the variable" {
  let bool_pty = @preterm.pretype_of_type(@kernel.bool_ty)
  let t = @term_syntax.parse_term_in_context(
    @list.List([("select", bool_pty)]),
    "select",
    ty=bool_pty,
  )
  inspect(t == @kernel.mk_var("select", @kernel.bool_ty), content="true")
}

///|
test "type abbreviations" {
  @preterm.new_type_abbrev("zz_pair", @parser.parse_type("A#num"))
  defer @preterm.remove_type_abbrev("zz_pair")
  let ty = @term_syntax.parse_type
  assert_eq(ty("(Zz_pair) -> Bool"), @parser.parse_type("A#num->bool"))
  assert_true((try Some(ty("Zz_pair[Num]")) catch { _ => None }) is None)
  // a type variable named like the abbreviation would read as it
  let v = @kernel.mk_vartype("Zz_pair")
  assert_true((try Some(@term_syntax.print_type(v)) catch { _ => None }) is None)
}
