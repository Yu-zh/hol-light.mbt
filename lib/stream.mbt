// OCaml's Stream (camlp-streams), as far as upstream's files use it: a
// stream of the characters of a string or a file, read one at a time
// (LP_arith/lp_arith.ml).

///|
/// `Stream.Failure`: nothing left.
#derive(Debug)
pub(all) suberror StreamFailure

///|
pub extend StreamFailure with @debug.Debug::{to_repr}

///|
/// `'a Stream.t`
pub struct Stream[A] {
  items : Array[A]
  mut pos : Int32
}

///|
/// `Stream.of_string`
pub fn stream_of_string(s : String) -> Stream[Char] {
  { items: s.iter().collect(), pos: 0, }
}

///|
/// `Stream.of_channel`: what is left of the file.
pub fn stream_of_channel(ic : InChannel) -> Stream[Char] {
  let items : Array[Char] = []
  while true {
    let c = input_char(ic) catch { _ => break }
    items.push(c)
  }
  { items, pos: 0, }
}

///|
/// `Stream.peek`
pub fn[A] stream_peek(st : Stream[A]) -> A? {
  if st.pos < st.items.length() {
    Some(st.items[st.pos])
  } else {
    None
  }
}

///|
/// `Stream.next`
pub fn[A] stream_next(st : Stream[A]) -> A raise {
  if st.pos >= st.items.length() {
    raise StreamFailure
  }
  let x = st.items[st.pos]
  st.pos += 1
  x
}

///|
/// `Stream.junk`
pub fn[A] stream_junk(st : Stream[A]) -> Unit {
  if st.pos < st.items.length() {
    st.pos += 1
  }
}

///|
/// `Char.escaped`: the character as OCaml writes it in a literal.
pub fn char_escaped(c : Char) -> String {
  match c {
    '\'' => "\\'"
    '\\' => "\\\\"
    '\n' => "\\n"
    '\t' => "\\t"
    '\r' => "\\r"
    '\b' => "\\b"
    _ => {
      let n = c.to_int()
      if n >= 32 && n < 127 {
        c.to_string()
      } else {
        let d = (n % 256).to_string()
        "\\" + "0".repeat(3 - d.length()) + d
      }
    }
  }
}
