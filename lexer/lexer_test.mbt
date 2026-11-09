///|
test "standalone lexer preserves tokens and default comments" {
  let source = "x <= y // ignored\nz"
  let expected : Array[@lexer.Lexcode] = [
    Ident("x"),
    Ident("<="),
    Ident("y"),
    Ident("z"),
  ]
  assert_eq(@lexer.lex(source), expected)
}

///|
test "forall spelling leaves strings and other symbolic tokens unchanged" {
  assert_eq(@lexer.lex("forall x. ?!y. P x y"), [
    Ident("forall"),
    Ident("x"),
    Resword("."),
    Ident("?!"),
    Ident("y"),
    Resword("."),
    Ident("P"),
    Ident("x"),
    Ident("y"),
  ])
  assert_eq(@lexer.lex("\"!\" !! !_x // ! is only a comment\nforall"), [
    Ident("\"!\""),
    Ident("!!"),
    Ident("!_x"),
    Ident("forall"),
  ])
}

///|
test "legacy universal notation is rejected" {
  for source in ["!x:bool. x", "(!)", "!", "forall x:bool. !y:bool. x = y"] {
    try @lexer.lex(source) catch {
      Failure(message) =>
        assert_eq(message, "'!' notation has been removed; use 'forall'")
      error => raise error
    } noraise {
      _ => fail("legacy notation was accepted: " + source)
    }
  }
}

///|
/// The tokens of `s` (bytes outside printable ASCII as \ddd), or the
/// failure lexing it, as upstream's parser reports it (the cases are
/// from parse_cases.txt).
fn lexed(s : String) -> String {
  let show = (x : String) => {
    let b = StringBuilder()
    for c in x {
      let n = c.to_int()
      if n < 32 || n > 126 {
        let pad = if n < 10 {
          "00"
        } else if n < 100 {
          "0"
        } else {
          ""
        }
        b.write_string("\\" + pad + n.to_string())
      } else {
        b.write_char(c)
      }
    }
    b.to_string()
  }
  try
    @lexer.lex(s)
    .map(t => match t {
      Ident(x) => "Ident " + show(x)
      Resword(x) => "Resword " + show(x)
    })
    .join(" | ") catch {
    Failure(message) => "! " + message
    error => "!! " + error.to_string()
  }
}

///|
test "string literals keep their escapes; malformed ones fail as upstream" {
  inspect(lexed("\"a\\nb\\t\\\"c\\\"\\\\\""), content=(
    #|Ident "a\010b\009"c"\"
  ))
  inspect(lexed("\"\\065\\x42\""), content=(
    #|Ident "AB"
  ))
  inspect(lexed("\"\""), content=(
    #|Ident ""
  ))
  inspect(lexed("\"é\""), content=(
    #|Ident "\195\169"
  ))
  inspect(lexed("\"\\195\\169\""), content=(
    #|Ident "\195\169"
  ))
  inspect(lexed("\"\\xe9!\""), content=(
    #|Ident "\233!"
  ))
  inspect(lexed("\"a\\xFF\\128\""), content=(
    #|Ident "a\255\128"
  ))
  inspect(lexed("\"abc"), content=(
    #|! Unparsed input
  ))
  inspect(lexed("\"\\q\""), content=(
    #|! lex:unrecognized OCaml-style escape in string
  ))
  inspect(lexed("\"\\xé\""), content=(
    #|! int_of_string
  ))
  inspect(lexed("é"), content=(
    #|! Unparsed input
  ))
  inspect(lexed("xé"), content=(
    #|! Unparsed input
  ))
}
