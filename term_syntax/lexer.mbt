// Tokens of the term syntax: MoonBit's tokens for the expressions the
// grammar accepts (moonbitlang/lexer), with two deviations: an identifier
// may end in primes (x', s''), as HOL's variables do, and a variable with a
// symbolic name no identifier spells (HOL's (<<) in `forall(<<)`) is written
// between backticks, `<<`.

///|
/// MoonBit's keywords and reserved words (moonbitlang/lexer), which are not
/// identifiers.
let moonbit_keywords : Array[String] = [
  "as", "extern", "fn", "let", "var", "proof_assert", "proof_let", "const",
  "match", "using", "mut", "type", "struct", "enum", "extenum", "trait", "derive",
  "while", "break", "continue", "import", "return", "throw", "raise", "try",
  "catch", "pub", "priv", "readonly", "test", "loop", "for", "in", "impl", "with",
  "guard", "async", "is", "suberror", "and", "letrec", "enumview", "extend",
  "noraise", "defer", "errdefer", "lexmatch", "lexscan", "where", "declare",
  "nobreak", "nocancel", "package", "module", "move", "ref", "static", "super",
  "unsafe", "use", "await", "dyn", "abstract", "do", "final", "macro", "override",
  "typeof", "virtual", "yield", "local", "method", "alias", "assert", "assume",
]

///|
/// Whether `name` is one of MoonBit's keywords or reserved words.
fn is_keyword(name : String) -> Bool {
  name is ("true" | "false" | "if" | "else") || moonbit_keywords.contains(name)
}

///|
fn keyword(name : String) -> @grammar.Token raise {
  match name {
    "true" => TRUE
    "false" => FALSE
    "if" => IF
    "else" => ELSE
    "fn" => FN
    "match" => MATCH
    "enum" => ENUM
    "struct" => STRUCT
    _ =>
      if moonbit_keywords.contains(name) {
        raise Failure("term syntax: " + name + " is a MoonBit keyword")
      } else {
        LIDENT(name)
      }
  }
}

///|
/// The tokens of `s`, each with its start and end offset, ending with EOF.
fn tokens(s : String) -> Array[(@grammar.Token, Int, Int)] raise {
  let toks : Array[(@grammar.Token, Int, Int)] = []
  let len = s.length()
  fn at(rest : StringView) -> Int {
    len - rest.length()
  }

  for input = s[:] {
    lexmatch input with longest {
      (re"^[ \t\r\n]+", after=rest) => continue rest
      (re"^//[^\r\n]*", after=rest) => continue rest
      (re"^(?:[a-z][A-Za-z0-9_]*|_[A-Za-z0-9_]+)'*" as name, after=rest) => {
        toks.push((keyword(name.to_owned()), at(input), at(rest)))
        continue rest
      }
      (re"^[A-Z][A-Za-z0-9_]*'*" as name, after=rest) => {
        toks.push((UIDENT(name.to_owned()), at(input), at(rest)))
        continue rest
      }
      (re"^`[\-!@#\$%\^&\*\+\|<=>/\?~\.:]+`" as raw, after=rest) => {
        let name = raw[1:raw.length() - 1].to_owned()
        // only a variable is written this way: a name that is a constant's
        // or an interface name would read as the constant
        if names_constant(name) {
          raise Failure("term syntax: `\{name}` names a constant")
        }
        toks.push((RAWIDENT(name), at(input), at(rest)))
        continue rest
      }
      // a HOL name verbatim, as types (`Term`), constructors (`module`) and
      // primed type variables (`'a`) are written when the syntax would
      // otherwise read another
      (re"^`'?[A-Za-z][A-Za-z0-9_]*'*`" as raw, after=rest) => {
        let name = raw[1:raw.length() - 1].to_owned()
        // a keyword between backticks is a name like any identifier's
        // (move, a constant of inverse_bug_puzzle_read)
        let tok : @grammar.Token = if is_keyword(name) {
          LIDENT(name)
        } else {
          VERBATIM(name)
        }
        toks.push((tok, at(input), at(rest)))
        continue rest
      }
      (re"^[0-9]+" as digits, after=rest) => {
        toks.push((INT(digits.to_owned()), at(input), at(rest)))
        continue rest
      }
      (re"^\.(?:[a-z][A-Za-z0-9_]*|_[A-Za-z0-9_]+)'*" as name, after=rest) => {
        toks.push((DOT_LIDENT(name[1:].to_owned()), at(input), at(rest)))
        continue rest
      }
      (re"^(?:==|!=|<=|>=|<|>)" as op, after=rest) => {
        toks.push((INFIX1(op.to_owned()), at(input), at(rest)))
        continue rest
      }
      (re"^(?:/|%)" as op, after=rest) => {
        toks.push((INFIX3(op.to_string()), at(input), at(rest)))
        continue rest
      }
      (re"^\u{2200}", after=rest) => {
        toks.push((FORALL, at(input), at(rest)))
        continue rest
      }
      (re"^\u{2203}", after=rest) => {
        toks.push((EXISTS, at(input), at(rest)))
        continue rest
      }
      (re"^\u{2192}", after=rest) => {
        toks.push((IMPLIES, at(input), at(rest)))
        continue rest
      }
      (re"^\|\|", after=rest) => {
        toks.push((BARBAR, at(input), at(rest)))
        continue rest
      }
      (re"^\|", after=rest) => {
        toks.push((BAR, at(input), at(rest)))
        continue rest
      }
      (re"^&&", after=rest) => {
        toks.push((AMPERAMPER, at(input), at(rest)))
        continue rest
      }
      (re"^=>", after=rest) => {
        toks.push((FAT_ARROW, at(input), at(rest)))
        continue rest
      }
      (re"^->", after=rest) => {
        toks.push((THIN_ARROW, at(input), at(rest)))
        continue rest
      }
      (re"^\+", after=rest) => {
        toks.push((PLUS, at(input), at(rest)))
        continue rest
      }
      (re"^-", after=rest) => {
        toks.push((MINUS, at(input), at(rest)))
        continue rest
      }
      (re"^\*", after=rest) => {
        toks.push((STAR, at(input), at(rest)))
        continue rest
      }
      (re"^!", after=rest) => {
        toks.push((EXCLAMATION, at(input), at(rest)))
        continue rest
      }
      (re"^\(", after=rest) => {
        toks.push((LPAREN, at(input), at(rest)))
        continue rest
      }
      (re"^\)", after=rest) => {
        toks.push((RPAREN, at(input), at(rest)))
        continue rest
      }
      (re"^\[", after=rest) => {
        toks.push((LBRACKET, at(input), at(rest)))
        continue rest
      }
      (re"^\]", after=rest) => {
        toks.push((RBRACKET, at(input), at(rest)))
        continue rest
      }
      (re"^[{]", after=rest) => {
        toks.push((LBRACE, at(input), at(rest)))
        continue rest
      }
      (re"^[}]", after=rest) => {
        toks.push((RBRACE, at(input), at(rest)))
        continue rest
      }
      (re"^,", after=rest) => {
        toks.push((COMMA, at(input), at(rest)))
        continue rest
      }
      (re"^:", after=rest) => {
        toks.push((COLON, at(input), at(rest)))
        continue rest
      }
      (re"^;", after=rest) => {
        toks.push((SEMI, at(input), at(rest)))
        continue rest
      }
      (re"^_", after=rest) => {
        toks.push((UNDERSCORE, at(input), at(rest)))
        continue rest
      }
      re"^$" => break
      _ => raise Failure("term syntax: unexpected character at offset \{at(input)}")
    }
  }
  toks.push((EOF, len, len))
  toks
}
