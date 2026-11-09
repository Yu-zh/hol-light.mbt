// What printer.ml prints for these terms, from upstream's run of the old
// parser's reference cases (tools/ocaml_ref/parse_cases.txt). T and F
// print as true and false: bool gives them those interface names.

///|
fn hol(s : String) -> String raise {
  ignore(@define.define_)
  @printer.string_of_term(@term_syntax.parse_term(s))
}

///|
test "functions by cases print as upstream" {
  inspect(hol("match (x : Num) { 0 => 1; SUC(n) => n }"), content=(
    #|match x with 0 -> 1 | SUC n -> n
  ))
  inspect(hol("match (x : Num) { 0 => true; n => false }"), content=(
    #|match x with 0 -> true | n -> false
  ))
  inspect(hol("match (x : Num) { n if n < 2 => 0; n => 1 }"), content=(
    #|match x with n when n < 2 -> 0 | n -> 1
  ))
  inspect(hol("fn { 0 => 1; SUC(n) => n }"), content=(
    #|function 0 -> 1 | SUC n -> n
  ))
}

///|
/// The HOL string with these bytes: a list of ASCII characters, each
/// given by its bits, most significant first.
fn hol_string(bytes : Array[Int]) -> String raise {
  let chars = bytes.map(c => {
    let bits = [7, 6, 5, 4, 3, 2, 1, 0].map(i => {
      if (c >> i) % 2 == 1 {
        "true"
      } else {
        "false"
      }
    })
    "ASCII(" + bits.join(", ") + ")"
  })
  hol(chars.rev_fold(init="NIL", (l, c) => "CONS(" + c + ", " + l + ")"))
}

///|
test "strings print with OCaml's escapes, bytes beyond ASCII in decimal" {
  inspect(hol_string([97, 10, 98, 9, 34, 99, 34, 92]), content=(
    #|"a\nb\t\"c\"\\"
  ))
  inspect(hol_string([65, 66]), content=(
    #|"AB"
  ))
  inspect(hol_string([195, 169]), content=(
    #|"\195\169"
  ))
  inspect(hol_string([233, 33]), content=(
    #|"\233!"
  ))
  inspect(hol_string([97, 255, 128]), content=(
    #|"a\255\128"
  ))
}
