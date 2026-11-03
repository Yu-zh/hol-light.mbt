///|
/// The spelling of the quotation `q`, checked to read back exactly as `q`
/// does (spell_quotation), and parsed once more.
fn spell(q : String) -> String raise {
  let t = @parser.parse_term(q)
  let s = @term_syntax.spell_quotation(q, t)
  assert_true(@term_syntax.same_term(@term_syntax.parse_term(s), t))
  s
}

///|
test "lambdas and quantifiers over a pattern" {
  inspect(
    spell("\\(m,n). m + n"),
    content=(
      #|fn { (m, n) => m + n }
    ),
  )
  inspect(
    spell("\\((a,b),c). a + b + c"),
    content=(
      #|fn { ((a, b), c) => a + (b + c) }
    ),
  )
  inspect(
    spell("\\(a,b) c. a + c"),
    content=(
      #|fn { (a, b) => (c : Num) => a + c }
    ),
  )
  inspect(
    spell("forall (a,b). a + b = b + a"),
    content=(
      #|∀ (a, b) : (Num, Num), a + b == b + a
    ),
  )
  inspect(
    spell("?(a,b). a < b"),
    content=(
      #|∃ (a, b) : (Num, Num), a < b
    ),
  )
  // the generalized abstraction's own binder is f, or f' when the term
  // has an f of its own
  inspect(
    spell("\\f:num#num->num. \\(a,b). f (a,b)"),
    content=(
      #|(f : ((Num, Num)) -> Num) => fn { (a, b) => f((a, b)) }
    ),
  )
}

///|
test "match and functions by cases" {
  inspect(
    spell("match n with 0 -> 1 | SUC m -> m"),
    content=(
      #|match (n : Num) { 0 => 1; SUC(m) => m }
    ),
  )
  inspect(
    spell("function 0 -> 1 | SUC m -> m"),
    content=(
      #|fn { 0 => 1; SUC(m) => m }
    ),
  )
  inspect(
    spell("\\l. match l with [] -> 0 | CONS h t -> h + LENGTH t"),
    content=(
      #|(l : List[Num]) => match l { NIL => 0; CONS(h, t) => h + LENGTH(t) }
    ),
  )
  inspect(
    spell("match (a,b) with (0,y) -> y | (SUC x,y) -> x + y"),
    content=(
      #|match ((a : Num), (b : Num)) { (0, y) => y; (SUC(x), y) => x + y }
    ),
  )
  // guards
  inspect(
    spell("match n with 0 -> 1 | m when m > 2 -> m | m -> 0"),
    content=(
      #|match (n : Num) { 0 => 1; m if m > 2 => m; m => 0 }
    ),
  )
  // a match in the element of a set comprehension, which HOL's parser
  // reads twice
  inspect(
    spell("{(match x with 0 -> 1 | SUC n -> n) | x IN s}"),
    content=(
      #|{match (x : Num) { 0 => 1; SUC(n) => n } | IN(x, (s : (Num) -> Bool))}
    ),
  )
  // arms whose bodies are matches
  inspect(
    spell("match n with 0 -> (match m with 0 -> 1 | SUC k -> k) | SUC j -> j"),
    content=(
      #|match (n : Num) { 0 => match (m : Num) { 0 => 1; SUC(k) => k }; SUC(j) => j }
    ),
  )
}

///|
test "reading arms" {
  // a trailing ; is allowed; a newline is only whitespace
  let a = @term_syntax.parse_term("match (n : Num) { 0 => 1; SUC(m) => m; }")
  let b = @term_syntax.parse_term(
    "match (n : Num) {\n  0 => 1;\n  SUC(m) => m\n}",
  )
  assert_true(@term_syntax.same_term(a, b))
  // two arms need a ;
  let missing = try
    @term_syntax.parse_term("match (n : Num) { 0 => 1 SUC(m) => m }")
  catch {
    _ => "error"
  } noraise {
    _ => "read"
  }
  inspect(missing, content="error")
}

///|
test "patterns from the leftovers" {
  // nested quantifiers over patterns, under an f of the term's own
  inspect(
    spell(
      "forall f:A#B->L. (forall(a,b) (c,d). f (a,b) = f (c,d) ==> (a,b) = (c,d)) ==> forall x y. f x = f y ==> x = y",
    ),
    content=(
      #|∀ f : ((A, B)) -> L, (∀ (a, b) : (A, B), (∀ (c, d) : (A, B), f((a, b)) == f((c, d)) → (a, b) == (c, d))) → (∀ x : (A, B), ∀ y : (A, B), f(x) == f(y) → x == y)
    ),
  )
  inspect(
    spell("(x:C) = (\\((a:A),(b:B)). f a b) (a,b)"),
    content=(
      #|(x : C) == fn { (a, b) => (f : (A, B) -> C)(a, b) }(((a : A), (b : B)))
    ),
  )
  // a pattern variable named like an enclosing binder rebinds it
  inspect(
    spell("\\x:num. match x with 0 -> x | SUC x -> x"),
    content=(
      #|(x : Num) => match x { 0 => x; SUC(x) => x }
    ),
  )
}

///|
test "functions by cases with one arm" {
  // fn { p => e } is the lambda over p, so HOL's function with one
  // unguarded clause has no spelling
  let q = "function (a,b) -> a + b"
  let r = try @term_syntax.spell_quotation(q, @parser.parse_term(q)) catch {
    _ => "unprintable"
  } noraise {
    s => s
  }
  inspect(
    r,
    content=(
      #|unprintable
    ),
  )
  // with a guard it is a function by cases
  inspect(
    spell("function m when m > 0 -> m"),
    content=(
      #|fn { m if m > 0 => m }
    ),
  )
}

///|
/// Whether the term syntax `s` reads as the HOL quotation `q`.
fn reads_like(s : String, q : String) -> Bool raise {
  @term_syntax.same_term(@term_syntax.parse_term(s), @parser.parse_term(q))
}

///|
test "pattern variables are scoped as HOL scopes them" {
  // a lambda inside a pattern binds its own variable, which the arm's body
  // does not see
  assert_true(
    reads_like(
      "match (f : (A) -> A) { (select => select) => select }", "match (f:A->A) with (\\select. select) -> (@)",
    ),
  )
  // a pattern variable spelt as a symbolic name shadows an enclosing
  // binder of that spelling
  assert_true(
    reads_like(
      "(op_dollar_dollar : Bool) => match true { op_dollar_dollar => op_dollar_dollar }",
      "\\($$):bool. match T with ($$) -> ($$)",
    ),
  )
  // a match inside a pattern binds its own variables
  assert_true(
    reads_like(
      "(op_dollar_dollar : Num) => match 0 { (match 0 { op_dollar_dollar => 0 }) => op_dollar_dollar + 1 }",
      "\\op_dollar_dollar:num. match 0 with (match 0 with ($$) -> 0) -> op_dollar_dollar + 1",
    ),
  )
  // a name in a pattern that names a constant is not the pattern's: an
  // enclosing binder of that name binds it
  assert_true(
    reads_like(
      "(T : Bool) => match false { T => T }", "\\T:bool. match F with T -> T",
    ),
  )
  // a lambda over a pattern reads it with nothing in scope: its T is the
  // constant
  assert_true(
    reads_like(
      "(T : Bool) => fn { (T, x) => T == false }", "\\T:bool. \\(T,x). T = F",
    ),
  )
  // a pattern shadows the binding in effect, whatever an older one binds
  assert_true(
    reads_like(
      "match 0 { op_dollar_dollar => (op_dollar_dollar : Num) => match 0 { op_dollar_dollar => op_dollar_dollar } }",
      "match 0 with ($$) -> (\\op_dollar_dollar:num. match 0 with ($$) -> ($$))",
    ),
  )
  // a binder with several annotations is a variable, renamed when it is
  // named like a constant
  assert_true(
    reads_like("fn { ((T : Bool) : Bool) => (true : Bool) }", "\\x:bool. T"),
  )
  // a lambda binds a name or a pattern, not a constant alone
  for
    s in [
      "fn { true => true }", "fn { (true : Bool) => true }", "fn { 0 => 1 }", "∀ (true) : Bool, true",
      "∃ (false) : Bool, false",
    ] {
    let r = try @term_syntax.parse_term(s) catch {
      _ => "error"
    } noraise {
      _ => "read"
    }
    inspect(r, content="error")
  }
}
