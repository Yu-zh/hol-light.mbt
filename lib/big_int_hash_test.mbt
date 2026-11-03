// `Hashtbl.hash` and `compare` on `Big_int.big_int` values, against OCaml
// 4.14 with num 1.4 (ocaml: `Hashtbl.hash (big_int_of_string s)`).

///|
test "Hashtbl.hash on big_int" {
  let out = StringBuilder()
  for
    s in [
      "0", "1", "-1", "12345", "4294967296", "-4294967297", "123456789012345678901234567890",
      "-340282366920938463463374607431768211456",
    ] {
    out.write_string("\{s} \{@lib.hash(@bigint.BigInt::from_string(s))}\n")
  }
  out.write_string(
    "pair \{@lib.hash((true, @bigint.BigInt::from_string("12345"), 7L))}\n",
  )
  inspect(
    out.to_string(),
    content=(
      #|0 955772237
      #|1 992063522
      #|-1 161678167
      #|12345 225617930
      #|4294967296 467130997
      #|-4294967297 586418335
      #|123456789012345678901234567890 395762041
      #|-340282366920938463463374607431768211456 233662092
      #|pair 936520994
      #|
    ),
  )
}

///|
test "compare on big_int of different signs" {
  let b = @bigint.BigInt::from_int
  inspect(@lib.compare(b(5), b(-5)), content="1")
  inspect(@lib.compare(b(0), b(1)), content="-1")
  inspect(
    @lib.compare(
      @bigint.BigInt::from_string("123456789012345678901234567890"),
      b(-1),
    ),
    content="1",
  )
}
