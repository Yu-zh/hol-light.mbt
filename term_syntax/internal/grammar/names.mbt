// Names for HOL constants that are not MoonBit identifiers. The choice
// operator @ is `select` (?! needs none: bool spells it existsunique). Any
// other symbolic name is spelt op_ followed by the names of its characters
// ($ is op_dollar, <=_c is op_lt_eq_us_c, + used as a value is op_plus). An
// identifier that names a constant means that constant; otherwise these
// spellings are read back, as a constant's name or, when the name is
// symbolic, as a variable's (the --> a definition is about to make a
// constant).

///|
let readable : Array[(String, String)] = [("select", "@")]

///|
let char_names : Array[(Char, String)] = [
  ('$', "dollar"),
  ('.', "dot"),
  ('=', "eq"),
  ('<', "lt"),
  ('>', "gt"),
  ('@', "at"),
  ('?', "q"),
  ('!', "bang"),
  ('%', "pct"),
  ('&', "amp"),
  ('|', "bar"),
  ('~', "tilde"),
  ('*', "star"),
  ('+', "plus"),
  ('-', "minus"),
  ('/', "slash"),
  ('\\', "bslash"),
  ('^', "caret"),
  ('#', "hash"),
  ('\'', "prime"),
  (':', "colon"),
  (',', "comma"),
  (';', "semi"),
]

///|
fn is_constant(name : String) -> Bool {
  try {
    ignore(@kernel.get_const_type(name))
    true
  } catch {
    _ => false
  }
}

///|
/// The MoonBit spelling of the symbolic name `name`: its readable name, or
/// op_ and the names of its characters joined by `_` (a run of letters and
/// digits stands for itself, `_` is `us`). None when there is none that
/// reads back as `name`.
pub fn escape(name : String) -> String? {
  for p in readable {
    if p.1 == name {
      return Some(p.0)
    }
  }
  let ident = match escape_chars(name) {
    Some(i) => i
    None => return None
  }
  if unescape(ident) == name {
    Some(ident)
  } else {
    None
  }
}

///|
/// op_ and the names of the characters of `name` (see `escape`).
fn escape_chars(name : String) -> String? {
  let tokens = []
  let run = StringBuilder()
  for c in name {
    if c is ('a'..<='z' | 'A'..<='Z' | '0'..<='9') {
      run.write_char(c)
      continue
    }
    if run.to_string() != "" {
      tokens.push(run.to_string())
      run.reset()
    }
    if c == '_' {
      tokens.push("us")
    } else {
      match char_names.iter().find_first(p => p.0 == c) {
        Some((_, n)) => tokens.push(n)
        None => return None
      }
    }
  }
  if run.to_string() != "" {
    tokens.push(run.to_string())
  }
  Some("op_" + tokens.join("_"))
}

///|
/// The HOL name the identifier `ident` stands for in an expression.
pub fn unescape(ident : String) -> String {
  if is_constant(ident) {
    return ident
  }
  for p in readable {
    if p.0 == ident {
      return p.1
    }
  }
  if !ident.has_prefix("op_") {
    return ident
  }
  let out = StringBuilder()
  for part in ident.to_string()[3:].to_owned().split("_") {
    let part = part.to_owned()
    if part == "us" {
      out.write_char('_')
    } else {
      match char_names.iter().find_first(p => p.1 == part) {
        Some((c, _)) => out.write_char(c)
        None => out.write_string(part)
      }
    }
  }
  let decoded = out.to_string()
  if is_constant(decoded) {
    return decoded
  }
  // a symbolic name that is not a constant yet (the --> a definition is
  // about to make one): only in its own spelling, and never a name the
  // elaboration generates
  let symbolic = !decoded
    .iter()
    .all(c => c is ('a'..<='z' | 'A'..<='Z' | '0'..<='9' | '_' | '\''))
  if symbolic &&
    !decoded.has_prefix("GEN%PVAR%") &&
    escape_chars(decoded) == Some(ident) {
    decoded
  } else {
    ident
  }
}
