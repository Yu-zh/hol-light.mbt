///|
test "String.sub counts bytes" {
  // OCaml: String.sub "a⇒b∀" 1 3 = "⇒" (three bytes), String.length = 8
  inspect(@lib.string_length("a⇒b∀"), content="8")
  inspect(@lib.string_sub("a⇒b∀", 1, 3), content="⇒")
  inspect(@lib.string_sub("a⇒b∀", 4, 4), content="b∀")
  inspect(@lib.string_sub("abc", 1, 2), content="bc")
  inspect(
    @lib.printexc_to_string(Failure("a\"b")),
    content="Failure(\"a\\\"b\")",
  )
  inspect(@lib.printexc_to_string(@lib.NotFound), content="Not_found")
}
