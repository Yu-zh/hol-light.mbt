// Hand-built printer checks against printer.ml: replays
// tools/ocaml_ref/printer_ref.ml (keep in sync). tests/hol_printer checks
// terms that need the library's constants (patterns, strings).

///|
priv struct Log {
  buf : StringBuilder
}

///|
fn Log::out(self : Log, s : String) -> Unit {
  self.buf.write_string(s + "\n")
}

///|
fn Log::attempt(self : Log, name : String, f : () -> String raise) -> Unit {
  let line = try f() catch {
    Failure(msg) => name + " ! " + msg
    e => name + " !! " + e.to_string()
  } noraise {
    s => name + " = " + s
  }
  self.out(line)
}

///|
test "printer matches printer.ml" {
  let log = { buf: StringBuilder(), }
  let a = @kernel.mk_vartype("A")
  let b = @kernel.mk_vartype("B")
  let fn_ = @basics.mk_fun_ty
  let bool = @kernel.bool_ty
  let bb = fn_(bool, fn_(bool, bool))
  for
    t in [
      ("num", 0),
      ("prod", 2),
      ("sum", 2),
      ("cart", 2),
      ("list", 1),
      ("char", 0),
      ("1", 0),
      ("tybit0", 1),
      ("tybit1", 1),
    ] {
    @kernel.new_type(t.0, t.1.to_int64())
  }
  let mk_type = (s : String, args : Array[@kernel.HolType]) => {
    @kernel.mk_type(s, @list.List(args))
  }
  let num_ty = mk_type("num", [])
  let prod = (x, y) => mk_type("prod", [x, y])
  let sum = (x, y) => mk_type("sum", [x, y])
  let cart = (x, y) => mk_type("cart", [x, y])
  let lst = x => mk_type("list", [x])
  let char_ty = mk_type("char", [])
  let finty = (k : Int) => @basics.mk_finty(@num.num_of_int(k))
  let p = (t : @kernel.HolType) => log.out(@printer.string_of_type(t))
  p(fn_(a, fn_(b, a)))
  p(fn_(fn_(a, b), a))
  p(prod(a, prod(b, a)))
  p(prod(prod(a, b), a))
  p(sum(a, prod(b, num_ty)))
  p(fn_(sum(a, b), prod(a, b)))
  p(cart(num_ty, finty(3)))
  p(lst(lst(a)))
  p(mk_type("prod", [fn_(a, b), lst(num_ty)]))
  p(finty(12))
  p(cart(cart(a, b), num_ty))
  p(cart(a, cart(b, num_ty)))
  p(@kernel.mk_vartype("?123"))
  let consts : Array[(String, @kernel.HolType)] = [
    ("/\\", bb),
    ("\\/", bb),
    ("==>", bb),
    ("~", fn_(bool, bool)),
    ("T", bool),
    ("F", bool),
    ("forall", fn_(fn_(a, bool), bool)),
    ("?", fn_(fn_(a, bool), bool)),
    ("NUMERAL", fn_(num_ty, num_ty)),
    ("BIT0", fn_(num_ty, num_ty)),
    ("BIT1", fn_(num_ty, num_ty)),
    ("_0", num_ty),
    ("+", fn_(num_ty, fn_(num_ty, num_ty))),
    ("*", fn_(num_ty, fn_(num_ty, num_ty))),
    ("-", fn_(num_ty, fn_(num_ty, num_ty))),
    ("SUC", fn_(num_ty, num_ty)),
    ("COND", fn_(bool, fn_(a, fn_(a, a)))),
    ("INSERT", fn_(a, fn_(fn_(a, bool), fn_(a, bool)))),
    ("EMPTY", fn_(a, bool)),
    ("UNIV", fn_(a, bool)),
    (",", fn_(a, fn_(b, prod(a, b)))),
    ("CONS", fn_(a, fn_(lst(a), lst(a)))),
    ("NIL", lst(a)),
    ("ASCII", @lib.itlist(fn_, @lib.replicate(bool, 8), char_ty)),
    ("DECIMAL", fn_(num_ty, fn_(num_ty, num_ty))),
    ("GSPEC", fn_(fn_(a, bool), fn_(a, bool))),
    ("SETSPEC", fn_(a, fn_(bool, fn_(a, bool)))),
    ("GEQ", fn_(a, fn_(a, bool))),
    ("GABS", fn_(fn_(a, bool), a)),
    ("LET", fn_(fn_(a, b), fn_(a, b))),
    ("LET_END", fn_(a, a)),
  ]
  for c in consts {
    @kernel.new_constant(c.0, c.1)
  }
  @printer.parse_as_infix("==>", (4, "right"))
  @printer.parse_as_infix("\\/", (16, "right"))
  @printer.parse_as_infix("/\\", (20, "right"))
  @printer.parse_as_infix("=", (12, "right"))
  @printer.parse_as_infix("+", (16, "right"))
  @printer.parse_as_infix("*", (20, "right"))
  @printer.parse_as_infix("-", (18, "left"))
  @printer.parse_as_infix(",", (14, "right"))
  @printer.parse_as_binder("forall")
  @printer.parse_as_binder("?")
  @printer.parse_as_binder("\\")
  @printer.parse_as_prefix("~")
  log.attempt("infixes", () => {
    @printer.infixes()
    .map(e => e.0 + "/" + e.1.0.to_string() + e.1.1)
    .to_array()
    .join(" ")
  })
  let mk_var = @kernel.mk_var
  let x = mk_var("x", num_ty)
  let y = mk_var("y", num_ty)
  let z = mk_var("z", num_ty)
  let pv = mk_var("p", bool)
  let q = mk_var("q", bool)
  let r = mk_var("r", bool)
  let c0 = (s : String) => @kernel.mk_const(s, @list.List([]))
  let bin = (s, l, r) => @kernel.mk_comb(@kernel.mk_comb(c0(s), l), r)
  let ibin = (s, l, r) => @basics.list_mk_icomb(s, @list.List([l, r]))
  let neg = t => @kernel.mk_comb(c0("~"), t)
  let numeral = (k : Int) => {
    let bits = []
    let mut k = k
    while k != 0 {
      bits.push(k % 2)
      k = k / 2
    }
    let mut t = c0("_0")
    for i = bits.length() - 1; i >= 0; i = i - 1 {
      t = @kernel.mk_comb(c0(if bits[i] == 0 { "BIT0" } else { "BIT1" }), t)
    }
    @kernel.mk_comb(c0("NUMERAL"), t)
  }
  let t = (s : String, tm : @kernel.Term) => {
    log.attempt(s, () => @printer.string_of_term(tm))
  }
  t("plus_assoc", bin("+", x, bin("+", y, z)))
  t("plus_left", bin("+", bin("+", x, y), z))
  t("minus_left", bin("-", bin("-", x, y), z))
  t("minus_right", bin("-", x, bin("-", y, z)))
  t("prec", bin("*", bin("+", x, y), bin("+", y, bin("*", z, x))))
  t(
    "imp_chain",
    bin("==>", pv, bin("==>", q, bin("\\/", r, bin("/\\", pv, q)))),
  )
  t("neg", neg(neg(bin("/\\", pv, q))))
  t("neg_atom", neg(pv))
  t("eq", @basics.mk_eq(bin("+", x, y), numeral(42)))
  t(
    "forall",
    @basics.mk_binder("forall", x, @basics.mk_binder("forall", y, @basics.mk_eq(x, y))),
  )
  t("exists", @basics.mk_binder("?", pv, bin("\\/", pv, neg(pv))))
  t("lambda", @kernel.mk_abs(x, @kernel.mk_abs(y, bin("+", x, y))))
  t(
    "app_lambda",
    @kernel.mk_comb(@kernel.mk_abs(x, bin("+", x, x)), numeral(3)),
  )
  t(
    "suc",
    @kernel.mk_comb(c0("SUC"), @kernel.mk_comb(c0("SUC"), bin("+", x, y))),
  )
  t("numerals", bin("+", numeral(0), bin("+", numeral(1), numeral(123456789))))
  t("cond", @basics.list_mk_icomb("COND", @list.List([pv, x, y])))
  let mut chain = x
  for n in 1..<=6 {
    chain = @basics.list_mk_icomb(
      "COND",
      @list.List([mk_var("c" + n.to_string(), bool), numeral(n), chain]),
    )
  }
  t("cond_long", chain)
  t("pair", ibin(",", x, ibin(",", y, pv)))
  let ins = (e, s) => ibin("INSERT", e, s)
  let empty = ty => @kernel.inst(@list.List([(ty, a)]), c0("EMPTY"))
  t("finite_set", ins(x, ins(y, ins(numeral(2), empty(num_ty)))))
  t("empty", empty(num_ty))
  t("univ", @kernel.inst(@list.List([(num_ty, a)]), c0("UNIV")))
  let cons = (h, l) => ibin("CONS", h, l)
  let nil = ty => @kernel.inst(@list.List([(ty, a)]), c0("NIL"))
  t("list", cons(x, cons(y, nil(num_ty))))
  let tf = (bit : Bool) => c0(if bit { "T" } else { "F" })
  let chr = (k : Int) => {
    @basics.list_mk_comb(
      c0("ASCII"),
      @list.List([ for i in 0..<8 => tf(((k >> (7 - i)) & 1) == 1) ]),
    )
  }
  let str = (s : String) => {
    let mut l = nil(char_ty)
    let codes = [ for c in s => c.to_int() ]
    for i = codes.length() - 1; i >= 0; i = i - 1 {
      l = cons(chr(codes[i]), l)
    }
    l
  }
  t("string", str("hi \"there\"\n\t\\"))
  t("string_empty_is_list", nil(char_ty))
  t("decimal", bin("DECIMAL", numeral(12345), numeral(100)))
  t("decimal_int", bin("DECIMAL", numeral(7), numeral(1)))
  t("decimal_bad", bin("DECIMAL", numeral(7), numeral(3)))
  let gx = mk_var("GEN%PVAR%0", num_ty)
  let comp = @kernel.mk_comb(
    @kernel.inst(@list.List([(num_ty, a)]), c0("GSPEC")),
    @kernel.mk_abs(
      gx,
      @basics.mk_binder(
        "?",
        x,
        @basics.list_mk_icomb(
          "SETSPEC",
          @list.List([
            gx,
            bin("==>", pv, @basics.mk_eq(x, y)),
            bin("+", x, numeral(1)),
          ]),
        ),
      ),
    ),
  )
  t("comprehension", comp)
  t("gabs", @basics.mk_gabs(ibin(",", x, y), bin("+", x, y)))
  t(
    "let",
    @basics.mk_let(
      @list.List([(x, numeral(1)), (y, bin("+", x, x))]),
      bin("*", x, y),
    ),
  )
  let big = (n : Int) => {
    let mut acc = x
    for i in 1..<=n {
      acc = bin(
        "+",
        bin("*", mk_var("long_variable_name_" + i.to_string(), num_ty), y),
        acc,
      )
    }
    acc
  }
  t("wrap", big(12))
  let mut imp = pv
  for i = 8; i >= 1; i = i - 1 {
    imp = bin(
      "==>",
      @basics.mk_eq(mk_var("hypothesis_" + i.to_string(), num_ty), numeral(i)),
      imp,
    )
  }
  t("wrap_imp", imp)
  let itv = mk_var("v", @kernel.mk_vartype("?7"))
  t("invented", @basics.mk_eq(itv, itv))
  @printer.print_types_of_subterms.val = 2
  t("types_all", bin("+", x, numeral(1)))
  @printer.print_types_of_subterms.val = 1
  t("infix_atom", c0("+"))
  t(
    "binder_atom",
    @kernel.mk_comb(
      @kernel.inst(@list.List([(num_ty, a)]), c0("forall")),
      mk_var("P", fn_(num_ty, bool)),
    ),
  )
  @printer.the_interface.val = @list.singleton(
    ("++", ("+", fn_(num_ty, fn_(num_ty, num_ty)))),
  )
  @printer.parse_as_infix("++", (16, "right"))
  t("interface", bin("+", x, y))
  @printer.the_interface.val = @list.List([])
  log.attempt("thm", () => {
    @printer.string_of_thm(@kernel.assume_rule(bin("/\\", pv, q)))
  })
  log.attempt("thm2", () => {
    @printer.string_of_thm(
      @kernel.deduct_antisym_rule(
        @kernel.assume_rule(pv),
        @kernel.assume_rule(q),
      ),
    )
  })
  @pp.std_formatter.set_margin(30)
  t("wrap_30", big(5))
  log.attempt("thm_30", () => {
    @printer.string_of_thm(
      @kernel.deduct_antisym_rule(
        @kernel.assume_rule(@basics.mk_eq(big(2), x)),
        @kernel.assume_rule(q),
      ),
    )
  })
  @pp.std_formatter.set_margin(78)
  t("wrap_78_again", big(5))
  inspect(
    log.buf.to_string(),
    content=(
      #|A->B->A
      #|(A->B)->A
      #|A#B#A
      #|(A#B)#A
      #|A+B#num
      #|A+B->A#B
      #|num^3
      #|((A)list)list
      #|(A->B)#(num)list
      #|12
      #|A^B^num
      #|A^(B^num)
      #|?123
      #|infixes = ==>/4right =/12right ,/14right +/16right \//16right -/18left */20right /\/20right
      #|plus_assoc = x + y + z
      #|plus_left = (x + y) + z
      #|minus_left = x - y - z
      #|minus_right = x - (y - z)
      #|prec = (x + y) * (y + z * x)
      #|imp_chain = p ==> q ==> r \/ p /\ q
      #|neg = ~ ~(p /\ q)
      #|neg_atom = ~p
      #|eq = x + y = 42
      #|forall = forall x y. x = y
      #|exists = ?p. p \/ ~p
      #|lambda = \x y. x + y
      #|app_lambda = (\x. x + x) 3
      #|suc = SUC (SUC (x + y))
      #|numerals = 0 + 1 + 123456789
      #|cond = if p then x else y
      #|cond_long = if c6 then 6
      #| else if c5 then 5
      #| else if c4 then 4
      #| else if c3 then 3
      #| else if c2 then 2
      #| else if c1 then 1
      #| else x
      #|pair = x,y,p
      #|finite_set = {x, y, 2}
      #|empty = {}
      #|univ = (:num)
      #|list = [x; y]
      #|string = "hi \"there\"\n\t\\"
      #|string_empty_is_list = ""
      #|decimal = #123.45
      #|decimal_int = #7
      #|decimal_bad = DECIMAL 7 3
      #|comprehension = {x + 1 | p ==> x = y}
      #|gabs = \(x,y). x + y
      #|let = let x = 1 and y = x + x in x * y
      #|wrap = long_variable_name_12 * y +
      #|long_variable_name_11 * y +
      #|long_variable_name_10 * y +
      #|long_variable_name_9 * y +
      #|long_variable_name_8 * y +
      #|long_variable_name_7 * y +
      #|long_variable_name_6 * y +
      #|long_variable_name_5 * y +
      #|long_variable_name_4 * y +
      #|long_variable_name_3 * y +
      #|long_variable_name_2 * y +
      #|long_variable_name_1 * y +
      #|x
      #|wrap_imp = hypothesis_1 = 1
      #|==> hypothesis_2 = 2
      #|==> hypothesis_3 = 3
      #|==> hypothesis_4 = 4
      #|==> hypothesis_5 = 5
      #|==> hypothesis_6 = 6
      #|==> hypothesis_7 = 7
      #|==> hypothesis_8 = 8
      #|==> p
      #|invented = (v:?7) = (v:?7)
      #|types_all = (x:num) + 1
      #|infix_atom = (+)
      #|binder_atom = (forall) P
      #|interface = x ++ y
      #|thm = p /\ q
      #||- p /\ q
      #|thm2 = p, q
      #||- p = q
      #|wrap_30 = long_variable_name_5 * y +
      #|long_variable_name_4 * y +
      #|long_variable_name_3 * y +
      #|long_variable_name_2 * y +
      #|long_variable_name_1 * y +
      #|x
      #|thm_30 = q,
      #|long_variable_name_2 * y +
      #|long_variable_name_1 * y +
      #|x =
      #|x
      #||- (long_variable_name_2 * y +
      #|    long_variable_name_1 * y +
      #|    x =
      #|    x) =
      #|   q
      #|wrap_78_again = long_variable_name_5 * y +
      #|long_variable_name_4 * y +
      #|long_variable_name_3 * y +
      #|long_variable_name_2 * y +
      #|long_variable_name_1 * y +
      #|x
      #|

    ),
  )
}

///|
test "std_formatter has upstream's 100-box limit" {
  @test.assert_eq(@pp.std_formatter.get_max_boxes(), 100)
}
