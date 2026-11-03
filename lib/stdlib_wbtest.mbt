///|
fn hex(b : Bytes) -> String {
  let digits = "0123456789abcdef"
  let sb = StringBuilder()
  for x in b {
    sb.write_char(digits[x.to_int() >> 4].unsafe_to_char())
    sb.write_char(digits[x.to_int() & 15].unsafe_to_char())
  }
  sb.to_string()
}

///|
/// Values from OCaml 4.14 (Digest.string, Random.bits/int/init/full_init).
test "md5 and Random match OCaml 4.14" {
  inspect(hex(md5(b"")), content="d41d8cd98f00b204e9800998ecf8427e")
  inspect(hex(md5(b"x0")), content="e50eb7598b580311bab8f39bb8f4815b")
  let show = (xs : Array[Int64]) => xs.map(x => x.to_string()).join(" ")
  inspect(
    show(Array::makei(5, _ => random_bits())),
    content="89809344 994326685 290180182 366831641 332180439",
  )
  random_init(0)
  inspect(
    show(Array::makei(5, _ => random_bits())),
    content="218040752 178628190 911923154 33712936 1041571162",
  )
  let ints = []
  for i in 0..<8 {
    ints.push(random_int((i * 7 + 3).to_int64()))
  }
  inspect(show(ints), content="1 8 5 2 8 14 43 18")
  random_full_init([1L, 2L, 3L])
  inspect(random_bits(), content="311998834")
  random_init(123456)
  inspect(random_int(0x3FFFFFFFL), content="353840024")
}

///|
/// OCaml 4.14's List.sort calls `cmp 1 2` first on [1; 2].
test "list_sort compares like OCaml" {
  let calls = []
  let r = list_sort(
    (x : Int32, y : Int32) => {
      calls.push("\{x},\{y}")
      x.compare(y)
    },
    @list.List([5, 3, 8, 1, 9, 2, 7]),
  )
  @debug.debug_inspect(r.to_array(), content="[1, 2, 3, 5, 7, 8, 9]")
  inspect(
    calls.join(" "),
    content="5,3 3,8 5,8 1,9 2,7 1,2 9,2 9,7 8,9 8,7 5,7 5,2 3,2",
  )
}

///|
/// Shifts on OCaml's 63-bit ints (values from OCaml 4.14, 64-bit).
test "shifts like OCaml" {
  inspect(lsr(-1, 32), content="2147483647")
  inspect(lsr(-8, 1), content="-4")
  inspect(lsr(12, 2), content="3")
  inspect(asr(-8, 40), content="-1")
  inspect(lsl(3, 4), content="48")
}

///|
/// Hashtbl.hash and compare on floats (values from OCaml 4.14).
test "floats hash and compare like OCaml" {
  inspect(hash(1.5), content="819188451")
  inspect(hash(-0.0), content="256347020")
  inspect(hash(@double.not_a_number), content="841516429")
  inspect(hash((2.0, 3)), content="928673522")
  inspect(compare(@double.not_a_number, 1.0), content="-1")
  inspect(compare(1.0, @double.not_a_number), content="1")
  inspect(compare(@double.not_a_number, @double.not_a_number), content="0")
  inspect(compare(2.0, 1.5), content="1")
}

///|
/// Hashtbl with OCaml 4.14's layout: fold order after random operations
/// (values from OCaml, same random numbers).
test "hashtbl folds like OCaml" {
  random_init(5)
  let t : OHashtbl[Int32, Int32] = hashtbl_create(10)
  for _ in 0..<400 {
    let k = random_int(90L).to_int()
    let v = random_int(1000L).to_int()
    match random_int(5L) {
      0L | 1L => hashtbl_add(t, k, v)
      2L => hashtbl_replace(t, k, v)
      3L => hashtbl_remove(t, k)
      _ => ignore(hashtbl_find_opt(t, k))
    }
  }
  let l = hashtbl_fold(
    (k, v, acc : @list.List[String]) => acc.prepend("\{k}:\{v}"),
    t,
    @list.List([]),
  )
  inspect(
    l.to_array().join(" "),
    content="18:957 18:406 50:309 50:713 80:372 50:468 50:57 25:9 25:849 25:897 4:570 30:493 62:858 30:963 14:949 82:727 89:246 89:646 89:20 89:15 56:92 79:87 56:480 31:996 31:558 31:665 31:615 12:957 12:708 54:600 54:258 45:89 45:307 54:165 78:77 81:331 1:480 1:484 81:369 1:621 1:22 77:586 23:423 77:310 70:751 70:418 70:958 3:968 3:970 16:355 24:868 16:994 24:424 21:385 76:982 76:985 57:40 85:634 26:143 26:426 26:963 9:142 9:297 9:30 63:154 13:69 63:501 13:615 51:415 32:457 17:760 17:848 17:626 17:828 40:938 67:577 55:384 55:378 55:391 60:229 60:57 60:418 59:548 6:710 6:372 6:988 38:113 61:285 61:139 61:360 87:424 84:385 84:643 58:105 34:602 74:671 75:805 75:931 48:750 71:90 22:824 53:108 28:689 28:647 28:602 28:292 28:622 53:106 28:526 28:589 65:462 73:835 73:711 44:284 44:905 44:942 5:787 5:497 5:938 72:101 72:835 37:158 37:616 64:408 41:734 10:668 10:26 10:152 10:786 0:445 0:644 0:359 39:247 83:409 66:493 39:406 83:640 83:283 66:101 7:791 88:189 29:199 29:168 43:619 86:56 86:436 43:151 20:218 2:240",
  )
  inspect(hashtbl_length(t), content="149")
  let s : OHashtbl[String, Int32] = hashtbl_create(3)
  for w in ["alpha", "beta", "gamma", "delta", "x", "beta"] {
    hashtbl_add(s, w, w.length())
  }
  let l2 = hashtbl_fold(
    (k, v, acc : @list.List[String]) => acc.prepend("\{k}=\{v}"),
    s,
    @list.List([]),
  )
  inspect(
    l2.to_array().join(" "),
    content="delta=5 beta=4 x=1 beta=4 alpha=5 gamma=5",
  )
}

///|
/// Hashtbl.hash of small nums (values from OCaml 4.14 with nums).
test "num hashes like OCaml" {
  inspect(hash(@num.num_of_int(5)), content="448001807")
  inspect(hash(@num.num_of_int(123456)), content="63828017")
  inspect(hash((@num.num_of_int(5), 1)), content="775441332")
  let two = @num.num_of_int(2)
  inspect(hash(@num.power_num(two, @num.num_of_int(62))), content="884995623")
  // (OCaml's minus_num leaves -2^62 a Big_int although it fits an int;
  // the port's representation is canonical)
  inspect(
    hash(@num.minus_num(@num.power_num(two, @num.num_of_int(70)))),
    content="62429635",
  )
  inspect(
    hash(
      @num.div_num(@num.num_of_int(7), @num.power_num(two, @num.num_of_int(40))),
    ),
    content="890408135",
  )
  inspect(hash(@num.power_num(two, @num.num_of_int(100))), content="924931919")
  inspect(hash(@num.div_num(@num.num_of_int(1), two)), content="38334622")
  inspect(
    hash(@num.div_num(@num.num_of_int(-3), @num.num_of_int(4))),
    content="191741208",
  )
  // compare follows the representation: an Int is below any Ratio
  inspect(
    compare(@num.num_of_int(0), @num.div_num(@num.num_of_int(-1), two)),
    content="-1",
  )
}

///|
/// gp's factorint output (values from PARI/GP 2.x).
test "gp factorint emulation" {
  let f = (s : String) => gp_factorint(@bigint.BigInt::from_string(s))
  inspect(f("12000000084"), content="[2, 2; 3, 1; 1000000007, 1]")
  inspect(f("65535"), content="[3, 1; 5, 1; 17, 1; 257, 1]")
  inspect(f("2"), content="Mat([2, 1])")
  // 0, 1, strong pseudoprimes to many bases, squares, large primes
  inspect(f("0"), content="Mat([0, 1])")
  inspect(f("1"), content="matrix(0,2)")
  inspect(
    f("3317044064679887385961981"),
    content="[1287836182261, 1; 2575672364521, 1]",
  )
  inspect(f("3215031751"), content="[151, 1; 751, 1; 28351, 1]")
  inspect(
    f("3825123056546413051"),
    content="[149491, 1; 747451, 1; 34233211, 1]",
  )
  inspect(
    f("318665857834031151167461"),
    content="[399165290221, 1; 798330580441, 1]",
  )
  inspect(
    f("5316911983139663487003542222693990401"),
    content="Mat([2305843009213693951, 2])",
  )
  inspect(
    f("618970019642690137449562111"),
    content="Mat([618970019642690137449562111, 1])",
  )
  inspect(
    f("4951760154835678088235319297"),
    content="[2147483647, 1; 2305843009213693951, 1]",
  )
  inspect(
    f("1000000000000000000000000000057"),
    content="Mat([1000000000000000000000000000057, 1])",
  )
  inspect(
    f("1180591620717411303423"),
    content="[3, 1; 11, 1; 31, 1; 43, 1; 71, 1; 127, 1; 281, 1; 86171, 1; 122921, 1]",
  )
  inspect(
    sys_command(
      "echo 'print(factorint(65537))  \n quit' | gp >/tmp/x.out 2>/dev/null",
    ),
    content="0",
  )
  // the lines joined: no final newline, as lib.ml's
  inspect(string_of_file("/tmp/x.out"), content="Mat([65537, 1])")
  sys_remove("/tmp/x.out") catch {
    _ => ()
  }
  inspect(sys_file_exists("/tmp/x.out"), content="false")
  inspect(sys_command("ls"), content="127")
}

///|
/// `frexp` against OCaml 4.14 (mantissa bits, exponent).
test "float_frexp matches OCaml" {
  let check = (x : Double, mbits : UInt64, e : Int64) => {
    let (m, e1) = float_frexp(x)
    assert_eq(m.reinterpret_as_uint64(), mbits)
    assert_eq(e1, e)
  }
  check(0.0, 0UL, 0L)
  check(1.0, 4602678819172646912UL, 1L)
  check(-3.5, 13829428555747950592UL, 2L)
  check(1.0e-310, 4603356717229943552UL, -1029L)
  check(5.0e-324, 4602678819172646912UL, -1073L)
  check(1.7976931348623157e308, 4607182418800017407UL, 1024L)
  check(0.1, 4605380978949069210UL, -3L)
  check(1024.0, 4602678819172646912UL, 11L)
}
