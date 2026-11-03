///|
test "a binder with a symbolic name is written between backticks" {
  inspect(
    spell("\\(<<). (<<) a b"),
    content=(
      #|(`<<` : (_, _) -> _) => `<<`((a : _), (b : _))
    ),
  )
  inspect(
    spell("forall (<<) x y. (<<) x y ==> (<<) y x"),
    content=(
      #|∀ `<<` : (_, _) -> Bool, ∀ x : _, ∀ y : _, `<<`(x, y) → `<<`(y, x)
    ),
  )
  inspect(
    spell("?(<<=). forall m:num. (<<=) m m"),
    content=(
      #|∃ `<<=` : (Num, Num) -> Bool, ∀ m : Num, `<<=`(m, m)
    ),
  )
  // bound occurrences carry the binder's spelling, also typed
  inspect(
    spell("\\(**) a. (**) a a"),
    content=(
      #|(`**` : (_, _) -> _) => (a : _) => `**`(a, a)
    ),
  )
}

///|
test "a free symbolic variable keeps its op_ spelling" {
  inspect(
    spell("(<<) a b"),
    content=(
      #|(op_lt_lt : (_, _) -> _)((a : _), (b : _))
    ),
  )
}

///|
test "a raw name reads as the variable of that name" {
  let t = @term_syntax.parse_term("∀ `<<` : (Num, Num) -> Bool, `<<`(1, 2)")
  inspect(
    @term_syntax.same_term(
      t,
      @parser.parse_term("forall (<<):num->num->bool. (<<) 1 2"),
    ),
    content="true",
  )
  match t {
    Comb(_, Abs(Var(name, _), _)) => inspect(name, content="<<")
    _ => fail("not a quantifier")
  }
}

///|
test "backticks take symbol characters only" {
  // keywords and ordinary names are not escaped this way
  for s in ["`fn`", "`x`", "`a<b`", "``"] {
    let read = try {
      @term_syntax.parse_term(s) |> ignore
      true
    } catch {
      _ => false
    }
    assert_false(read)
  }
}

///|
test "a binder named like a constant gets no backticks" {
  // `+` would read as the constant: no spelling reads back exactly
  let q = "\\(+) a. (+) a a"
  let printable = try {
    @term_syntax.spell_quotation(q, @parser.parse_term(q)) |> ignore
    true
  } catch {
    _ => false
  }
  assert_false(printable)
}

///|
test "a backticked name that is a constant's is refused" {
  for s in ["(`=` : (Bool, Bool) -> Bool)", "(`=` : Bool) => `=`", "`+`"] {
    let read = try {
      @term_syntax.parse_term(s) |> ignore
      true
    } catch {
      _ => false
    }
    assert_false(read)
  }
}

///|
test "a symbolic binder that would capture takes an identifier" {
  // the binder << : bool and a free << : A: the binder is renamed, as
  // before, since a symbolic name takes no primes
  let a = @kernel.mk_vartype("A")
  let t = @kernel.mk_abs(
    @kernel.mk_var("<<", @kernel.bool_ty),
    @kernel.mk_var("<<", a),
  )
  inspect(
    @term_syntax.print_term(t),
    content=(
      #|(v : Bool) => (op_lt_lt : A)
    ),
  )
}

///|
test "a pattern or an implicit set binder keeps its op_ spelling" {
  // there an op_ name reads as the symbolic variable, so no backticks
  inspect(
    @term_syntax.print_term(
      @term_syntax.parse_term(
        "match true { op_dollar_dollar => op_dollar_dollar }",
      ),
    ),
    content=(
      #|match true { op_dollar_dollar => op_dollar_dollar }
    ),
  )
  inspect(
    @term_syntax.print_term(
      @term_syntax.parse_term("{(op_lt_lt : Bool) | true}"),
    ),
    content=(
      #|{(op_lt_lt : Bool) | true}
    ),
  )
}

///|
test "the op_ spelling is not used where its name is taken" {
  // an enclosing binder already printed op_lt_lt: the pattern variable and
  // the comprehension's binder keep their backticks
  inspect(
    spell("\\op_lt_lt:bool. match T with (<<) -> ((<<),op_lt_lt)"),
    content=(
      #|(op_lt_lt : Bool) => match true { `<<` => (`<<`, op_lt_lt) }
    ),
  )
  inspect(
    spell("\\op_lt_lt:bool. {(<<):bool | T}"),
    content=(
      #|(op_lt_lt : Bool) => {(`<<` : Bool) | true}
    ),
  )
}

///|
test "the op_ spelling is not used where a binder inside has its name" {
  inspect(
    spell("match T with (<<) -> (\\op_lt_lt:bool. (<<))"),
    content=(
      #|match true { `<<` => (op_lt_lt : Bool) => `<<` }
    ),
  )
  inspect(
    spell("{(<<):bool | (\\op_lt_lt:bool. (<<)) T}"),
    content=(
      #|{(`<<` : Bool) | ((op_lt_lt : Bool) => `<<`)(true)}
    ),
  )
}

///|
test "a guard is in the scope the op_ name must be free in" {
  inspect(
    spell("match T with (<<) when (\\op_lt_lt:bool. (<<)) T -> (<<)"),
    content=(
      #|match true { `<<` if ((op_lt_lt : Bool) => `<<`)(true) => `<<` }
    ),
  )
}

///|
test "symbolic variables in quantified and lambda patterns" {
  inspect(
    spell("forall (a,(<<)). (<<) a a"),
    content=(
      #|∀ (a, op_lt_lt) : (_, (_, _) -> Bool), op_lt_lt(a, a)
    ),
  )
  inspect(
    spell("\\(a,(<<)). (<<) a a"),
    content=(
      #|fn { (a, op_lt_lt) => op_lt_lt(a, a) }
    ),
  )
}
