///|
/// OCaml's `compare` and `Hashtbl.hash` on `func`s; the expected values are
/// OCaml 4.14's, on the same seven maps.
test "structural compare and hash of finite maps, as OCaml's" {
  let u : @lib.Func[Int64, Int64] = @lib.undefined()
  let fs = [
    u,
    @lib.single(1L, 2L),
    @lib.single(1L, 3L),
    @lib.single(2L, 1L),
    @lib.update(1L, 2L, @lib.single(3L, 4L)),
    @lib.update(1L, 2L, @lib.update(3L, 4L, @lib.single(100L, 7L))),
    @lib.update(5L, 0L, @lib.single(3L, 4L)),
  ]
  fn sgn(c : Int32) -> Int32 {
    if c < 0 {
      -1
    } else if c > 0 {
      1
    } else {
      0
    }
  }

  let rows = fs.map(a => {
    fs.map(b => sgn(@lib.compare(a, b)).to_string()).join(" ")
  })
  inspect(
    rows.join("\n"),
    content=(
      #|0 -1 -1 -1 -1 -1 -1
      #|1 0 -1 1 -1 -1 -1
      #|1 1 0 1 -1 -1 -1
      #|1 -1 -1 0 -1 -1 -1
      #|1 1 1 1 0 1 1
      #|1 1 1 1 -1 0 -1
      #|1 1 1 1 -1 1 0
    ),
  )
  inspect(
    fs.map(a => @lib.hash(a).to_string()).join(" "),
    content="129913994 534103224 1070854586 873316554 311820025 401120782 916595822",
  )
}
