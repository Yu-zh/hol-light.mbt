// OCaml `Hashtbl.hash` compatibility: replays tools/ocaml_ref/hash_ref.ml.

///|
priv struct Log {
  buf : StringBuilder
}

///|
fn[T : @lib.OHash] Log::h(self : Log, name : String, v : T) -> Unit {
  self.buf.write_string(name + " = " + @lib.hash(v).to_string())
  self.buf.write_char('\n')
}

///|
test "Hashtbl.hash matches OCaml" {
  let log = { buf: StringBuilder(), }
  log.h("int0", 0)
  log.h("int1", 1)
  log.h("int-1", -1)
  log.h("int1e6", 1000000)
  log.h("int_2^40", 1L << 40)
  log.h("int_min32", -2147483648)
  log.h("max_int", 4611686018427387903L)
  log.h("true", true)
  log.h("false", false)
  log.h("unit", ())
  log.h("str_empty", "")
  log.h("str_a", "a")
  log.h("str_abcd", "abcd")
  log.h("str_hello", "hello world")
  log.h("str_utf8", "été")
  log.h("nil", (@list.List([]) : @list.List[Int32]))
  log.h("list123", @list.List([1, 2, 3]))
  log.h("list_str", @list.List(["a", "b"]))
  log.h("list_long", @list.List([ for i in 1..<=30 => i ]))
  log.h("pair", (1, "x"))
  log.h("triple", ("a", 2, true))
  log.h("none", (None : Int32?))
  log.h("some", Some(3))
  log.h("nested", @list.List([@list.List([1, 2]), @list.List([3])]))
  let a = @kernel.mk_vartype("A")
  let fa = @kernel.mk_type("fun", @list.List([a, a]))
  log.h("tyvar", a)
  log.h("bool_ty", @kernel.bool_ty)
  log.h("fun_ty", fa)
  let x = @kernel.mk_var("x", a)
  let f = @kernel.mk_var("f", fa)
  log.h("var", x)
  log.h("const", @kernel.mk_const("=", @list.List([])))
  log.h("comb", @kernel.mk_comb(f, x))
  log.h("abs", @kernel.mk_abs(x, @kernel.mk_comb(f, x)))
  let mut deep = x
  for _ in 0..<50 {
    deep = @kernel.mk_comb(f, deep)
  }
  log.h("deep50", deep)
  log.h("term_pair", (x, @kernel.mk_comb(f, x)))
  log.h("term_list", @list.List([x, f, @kernel.mk_comb(f, x)]))
  log.h("thm", @kernel.refl(x))
  inspect(
    log.buf.to_string(),
    content=(
      #|int0 = 129913994
      #|int1 = 883721435
      #|int-1 = 911466517
      #|int1e6 = 955328250
      #|int_2^40 = 268849449
      #|int_min32 = 129913994
      #|max_int = 952257787
      #|true = 883721435
      #|false = 129913994
      #|unit = 129913994
      #|str_empty = 0
      #|str_a = 721651713
      #|str_abcd = 65890154
      #|str_hello = 1053319576
      #|str_utf8 = 602599716
      #|nil = 129913994
      #|list123 = 794519639
      #|list_str = 311998908
      #|list_long = 822221246
      #|pair = 916635072
      #|triple = 625573469
      #|none = 129913994
      #|some = 771557183
      #|nested = 195323850
      #|tyvar = 87292758
      #|bool_ty = 729028179
      #|fun_ty = 1054535078
      #|var = 702023771
      #|const = 141744656
      #|comb = 461630587
      #|abs = 624427801
      #|deep50 = 135278289
      #|term_pair = 552400385
      #|term_list = 127647060
      #|thm = 746016170
      #|
    ),
  )
}
