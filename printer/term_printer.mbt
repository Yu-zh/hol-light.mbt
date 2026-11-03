// ---------------------------------------------------------------------------
// Printer for terms.
//
// Upstream tries a chain of handlers, each guarded by `try ... with
// Failure _ ->`; a handler checks its preconditions before printing
// anything, so falling through never leaves partial output. The same
// structure is kept here: `attempt` runs a handler and reports whether it
// failed with `Failure` (other errors propagate).
// ---------------------------------------------------------------------------

///|
priv struct Ctx {
  fmt : Formatter
  use_color : Bool
}

///|
fn attempt(f : () -> Unit raise) -> Bool raise {
  try f() catch {
    Failure(_) => false
    e => raise e
  } noraise {
    _ => true
  }
}

///|
fn[T] failure() -> T raise {
  raise Failure("")
}

///|
fn reverse_interface(s0 : String, ty0 : HolType) -> String raise {
  if !reverse_interface_mapping.val {
    return s0
  }
  let found = @lib.find(
    (e : (String, (String, HolType))) => {
      let (_, (s1, ty)) = e
      s1 == s0 && @lib.can(t => @basics.type_match(ty, t, @list.List([])), ty0)
    },
    the_interface.val,
  ) catch {
    Failure(_) => return s0
    e => raise e
  }
  found.0
}

///|
fn dest_binary_term(c : Term, tm : Term) -> (Term, Term) raise {
  let result = try {
    let (il, r) = @kernel.dest_comb(tm)
    let (i, l) = @kernel.dest_comb(il)
    let same = i == c ||
      (
        @kernel.is_const(i) &&
        @kernel.is_const(c) &&
        ({
          let (ni, ti) = @kernel.dest_const(i)
          let (nc, tc) = @kernel.dest_const(c)
          reverse_interface(ni, ti) == reverse_interface(nc, tc)
        })
      )
    if same {
      (l, r)
    } else {
      failure()
    }
  } catch {
    Failure(_) => raise Failure("DEST_BINARY")
    e => raise e
  }
  result
}

///|
fn aright(s : String) -> Bool raise {
  get_infix_status(s).1 == "right"
}

///|
fn powerof10(n : @num.Num) -> Bool raise {
  let mut n = n
  let ten = @num.num_of_int(10)
  while true {
    if @num.abs_num(n) < @num.num_1 {
      return false
    } else if n == @num.num_1 {
      return true
    }
    n = @num.div_num(n, ten)
  }
  false
}

///|
fn bool_of_term(t : Term) -> Bool raise {
  match t {
    Const("T", _) => true
    Const("F", _) => false
    _ => raise Failure("bool_of_term")
  }
}

///|
fn code_of_term(t : Term) -> Int32 raise {
  let (f, tms) = @basics.strip_comb(t)
  if !(f is Const("ASCII", _)) || tms.length() != 8 {
    raise Failure("code_of_term")
  }
  @lib.itlist(
    (b, acc) => if b { 1 + 2 * acc } else { 2 * acc },
    @lib.map(bool_of_term, tms.rev()),
    0,
  )
}

///|
fn dest_clause(tm : Term) -> List[Term] raise {
  let pbod = @basics.strip_exists(@basics.body(@basics.body(tm))).1
  let (s, args) = @basics.strip_comb(pbod)
  let rr = (t : Term) => @kernel.rand(@kernel.rator(t))
  // List literals are evaluated right to left in OCaml.
  if name_of(s) == "_UNGUARDED_PATTERN" && args.length() == 2 {
    let second = rr(@lib.hd(@lib.tl(args)))
    @list.List([rr(@lib.hd(args)), second])
  } else if name_of(s) == "_GUARDED_PATTERN" && args.length() == 3 {
    let third = rr(@lib.hd(@lib.tl(@lib.tl(args))))
    let second = @lib.hd(@lib.tl(args))
    @list.List([rr(@lib.hd(args)), second, third])
  } else {
    raise Failure("dest_clause")
  }
}

///|
fn dest_clauses(tm : Term) -> List[List[Term]] raise {
  let (s, args) = @basics.strip_comb(tm)
  if name_of(s) == "_SEQPATTERN" && args.length() == 2 {
    let rest = dest_clauses(@lib.hd(@lib.tl(args)))
    rest.prepend(dest_clause(@lib.hd(args)))
  } else {
    @list.singleton(dest_clause(tm))
  }
}

///|
fn pdest_cond(tm : Term) -> ((Term, Term), Term) raise {
  match tm {
    Comb(Comb(Comb(Const("COND", _), i), t), e) => ((i, t), e)
    _ => raise Failure("pdest_cond")
  }
}

///|
fn has_invented_typevar(ty : HolType) -> Bool {
  match ty {
    Tyvar(s) => s.has_prefix("?")
    Tyapp(_, args) => args.any(has_invented_typevar)
  }
}

///|
/// OCaml's `String.escaped` for a string of bytes `0..255` (each given as
/// a character).
fn ocaml_escaped(codes : Array[Int32]) -> String {
  let buf = StringBuilder()
  for c in codes {
    match c {
      0x22 => buf.write_string("\\\"")
      0x5C => buf.write_string("\\\\")
      0x0A => buf.write_string("\\n")
      0x09 => buf.write_string("\\t")
      0x0D => buf.write_string("\\r")
      0x08 => buf.write_string("\\b")
      _ =>
        if c >= 32 && c <= 126 {
          buf.write_char(c.unsafe_to_char())
        } else {
          buf.write_char('\\')
          buf.write_char(('0'.to_int() + c / 100).unsafe_to_char())
          buf.write_char(('0'.to_int() + c / 10 % 10).unsafe_to_char())
          buf.write_char(('0'.to_int() + c % 10).unsafe_to_char())
        }
    }
  }
  buf.to_string()
}

///|
fn Ctx::color_switch(
  self : Ctx,
  pp : (Formatter, String) -> Unit,
  s : String,
) -> Unit {
  if self.use_color {
    pp(self.fmt, s)
  } else {
    self.fmt.print_string(s)
  }
}

///|
fn colored_resword(fmt : Formatter, s : String) -> Unit {
  pp_print_colored_string(printer_color_resword.val, fmt, s)
}

///|
fn colored_const(fmt : Formatter, s : String) -> Unit {
  pp_print_colored_string(printer_color_const.val, fmt, s)
}

///|
fn colored_binder(fmt : Formatter, s : String) -> Unit {
  pp_print_colored_string(printer_color_binder.val, fmt, s)
}

///|
fn colored_infix(fmt : Formatter, s : String) -> Unit {
  pp_print_colored_string(printer_color_infix.val, fmt, s)
}

///|
fn colored_prefix(fmt : Formatter, s : String) -> Unit {
  pp_print_colored_string(printer_color_prefix.val, fmt, s)
}

///|
fn Ctx::try_user_printers(self : Ctx, tm : Term) -> Unit raise {
  if self.use_color {
    // Upstream catches every exception here (`with _ ->`).
    try_user_color_printer(self.fmt, tm) catch {
      _ => try_user_printer(self.fmt, tm)
    }
  } else {
    try_user_printer(self.fmt, tm)
  }
}

///|
fn Ctx::print_term(self : Ctx, prec : Int32, tm : Term) -> Unit raise {
  let fmt = self.fmt
  if attempt(() => self.try_user_printers(tm)) {
    return
  }
  if attempt(() => {
      fmt.print_string(@num.string_of_num(@basics.dest_numeral(tm)))
    }) {
    return
  }
  if attempt(() => self.print_string_or_list(tm)) {
    return
  }
  if @basics.is_gabs(tm) {
    return self.print_binder(prec, tm)
  }
  let (hop, args) = @basics.strip_comb(tm)
  let s = reverse_interface(name_of(hop), @kernel.type_of(hop))
  if attempt(() => self.print_empty_set(s, tm, args)) ||
    attempt(() => self.print_universal_set(s, tm, args)) ||
    attempt(() => self.print_finite_set(s, tm)) ||
    attempt(() => self.print_set_comprehension(s, tm)) ||
    attempt(() => self.print_let_term(s, prec, tm)) ||
    attempt(() => self.print_decimal(s, args)) ||
    attempt(() => self.print_match(s, prec, args)) ||
    attempt(() => self.print_function(s, prec, args)) ||
    attempt(() => self.print_cond(s, prec, tm, args)) ||
    attempt(() => self.print_prefix_app(s, prec, args)) ||
    attempt(() => self.print_binder_app(s, prec, tm, args)) ||
    attempt(() => self.print_infix_app(s, prec, tm, hop, args)) {
    return
  }
  if (@kernel.is_const(hop) || @kernel.is_var(hop)) && args.is_empty() {
    self.print_atom(hop, s)
  } else {
    self.print_generic_app(prec, tm)
  }
}

///|
fn Ctx::print_string_or_list(self : Ctx, tm : Term) -> Unit raise {
  let fmt = self.fmt
  let tms = @basics.dest_list(tm)
  let as_string = try {
    let (_, targs) = @kernel.dest_type(@kernel.type_of(tm))
    if @kernel.dest_type(@lib.hd(targs)).0 != "char" {
      failure()
    }
    Some(ocaml_escaped(@lib.map(code_of_term, tms).to_array()))
  } catch {
    Failure(_) => None
    e => raise e
  }
  match as_string {
    Some(s) => fmt.print_string("\"" + s + "\"")
    None => {
      fmt.open_box(0)
      fmt.print_string("[")
      fmt.open_box(0)
      self.print_term_sequence(true, ";", 0, tms)
      fmt.close_box()
      fmt.print_string("]")
      fmt.close_box()
    }
  }
}

///|
fn Ctx::print_empty_set(
  self : Ctx,
  s : String,
  tm : Term,
  args : List[Term],
) -> Unit raise {
  if s == "EMPTY" && @kernel.is_const(tm) && args.is_empty() {
    self.fmt.print_string("{}")
  } else {
    failure()
  }
}

///|
fn Ctx::print_universal_set(
  self : Ctx,
  s : String,
  tm : Term,
  args : List[Term],
) -> Unit raise {
  if s == "UNIV" &&
    typify_universal_set.val &&
    @kernel.is_const(tm) &&
    args.is_empty() {
    let ty = @basics.dest_fun_ty(@kernel.type_of(tm)).0
    self.fmt.print_string("(:")
    pp_print_type(self.fmt, ty)
    self.fmt.print_string(")")
  } else {
    failure()
  }
}

///|
fn Ctx::print_finite_set(self : Ctx, s : String, tm : Term) -> Unit raise {
  if s != "INSERT" {
    failure()
  }
  let (mems, oth) = @lib.splitlist(t => @basics.dest_binary("INSERT", t), tm)
  if oth is Const("EMPTY", _) {
    let fmt = self.fmt
    fmt.open_box(0)
    fmt.print_string("{")
    fmt.open_box(0)
    self.print_term_sequence(true, ",", 14, mems)
    fmt.close_box()
    fmt.print_string("}")
    fmt.close_box()
  } else {
    failure()
  }
}

///|
fn Ctx::print_set_comprehension(
  self : Ctx,
  s : String,
  tm : Term,
) -> Unit raise {
  if s != "GSPEC" {
    failure()
  }
  let (evs, bod) = @basics.strip_exists(@basics.body(@kernel.rand(tm)))
  let (bod1, fabs) = @kernel.dest_comb(bod)
  let (bod2, babs) = @kernel.dest_comb(bod1)
  let c = @kernel.rator(bod2)
  if @kernel.dest_const(c).0 != "SETSPEC" {
    failure()
  }
  let fmt = self.fmt
  fmt.print_string("{")
  self.print_term(0, fabs)
  fmt.print_string(" | ")
  let fvs = @kernel.frees(fabs)
  let bvs = @kernel.frees(babs)
  let shown = if fvs.length() <= 1 || bvs.is_empty() {
    fvs
  } else {
    @lib.intersect(fvs, bvs)
  }
  if print_unambiguous_comprehensions.val || !@lib.set_eq(evs, shown) {
    self.print_term_sequence(false, ",", 14, evs)
    fmt.print_string(" | ")
  }
  self.print_term(0, babs)
  fmt.print_string("}")
}

///|
fn Ctx::print_let_term(
  self : Ctx,
  s : String,
  prec : Int32,
  tm : Term,
) -> Unit raise {
  if s != "LET" {
    failure()
  }
  let (eqs, bod) = @basics.dest_let(tm)
  let fmt = self.fmt
  if prec == 0 {
    fmt.open_hvbox(0)
  } else {
    fmt.open_hvbox(1)
    fmt.print_string("(")
  }
  self.color_switch(colored_resword, "let ")
  let first = @lib.hd(eqs)
  self.print_term(0, @basics.mk_eq(first.0, first.1))
  for e in @lib.tl(eqs) {
    fmt.print_break(1, 0)
    self.color_switch(colored_resword, "and ")
    self.print_term(0, @basics.mk_eq(e.0, e.1))
  }
  self.color_switch(colored_resword, " in")
  fmt.print_break(1, 0)
  self.print_term(0, bod)
  if prec != 0 {
    fmt.print_string(")")
  }
  fmt.close_box()
}

///|
fn Ctx::print_decimal(self : Ctx, s : String, args : List[Term]) -> Unit raise {
  if s != "DECIMAL" {
    failure()
  }
  let n_num = @basics.dest_numeral(@lib.hd(args))
  let n_den = @basics.dest_numeral(@lib.hd(@lib.tl(args)))
  if !powerof10(n_den) {
    failure()
  }
  let s_num = @num.string_of_num(@num.quo_num(n_num, n_den))
  let s_den = @lib.implode(
    @lib.tl(
      @lib.explode(@num.string_of_num(n_den + @num.mod_num(n_num, n_den))),
    ),
  )
  self.fmt.print_string(
    "#" + s_num + (if n_den == @num.num_1 { "" } else { "." }) + s_den,
  )
}

///|
fn Ctx::print_match(
  self : Ctx,
  s : String,
  prec : Int32,
  args : List[Term],
) -> Unit raise {
  if s != "_MATCH" || args.length() != 2 {
    failure()
  }
  let cls = dest_clauses(@lib.hd(@lib.tl(args)))
  let fmt = self.fmt
  if prec != 0 {
    fmt.print_string("(")
  }
  fmt.open_hvbox(0)
  self.color_switch(colored_resword, "match ")
  self.print_term(0, @lib.hd(args))
  self.color_switch(colored_resword, " with")
  fmt.print_break(1, 2)
  self.print_clauses(cls)
  fmt.close_box()
  if prec != 0 {
    fmt.print_string(")")
  }
}

///|
fn Ctx::print_function(
  self : Ctx,
  s : String,
  prec : Int32,
  args : List[Term],
) -> Unit raise {
  if s != "_FUNCTION" || args.length() != 1 {
    failure()
  }
  let cls = dest_clauses(@lib.hd(args))
  let fmt = self.fmt
  if prec != 0 {
    fmt.print_string("(")
  }
  fmt.open_hvbox(0)
  self.color_switch(colored_resword, "function")
  fmt.print_break(1, 2)
  self.print_clauses(cls)
  fmt.close_box()
  if prec != 0 {
    fmt.print_string(")")
  }
}

///|
fn Ctx::print_cond(
  self : Ctx,
  s : String,
  prec : Int32,
  tm : Term,
  args : List[Term],
) -> Unit raise {
  if s != "COND" || args.length() != 3 {
    failure()
  }
  let fmt = self.fmt
  if prec != 0 {
    fmt.print_string("(")
  }
  fmt.open_hvbox(-1)
  let (ccls, ecl) = @lib.splitlist(pdest_cond, tm)
  if ccls.length() <= 4 {
    self.color_switch(colored_resword, "if ")
    self.print_term(0, @lib.hd(args))
    fmt.print_break(0, 0)
    self.color_switch(colored_resword, " then ")
    self.print_term(0, @lib.hd(@lib.tl(args)))
    fmt.print_break(0, 0)
    self.color_switch(colored_resword, " else ")
    self.print_term(0, @lib.hd(@lib.tl(@lib.tl(args))))
  } else {
    let first = @lib.hd(ccls)
    self.color_switch(colored_resword, "if ")
    self.print_term(0, first.0)
    self.color_switch(colored_resword, " then ")
    self.print_term(0, first.1)
    fmt.print_break(0, 0)
    for cl in @lib.tl(ccls) {
      self.color_switch(colored_resword, " else if ")
      self.print_term(0, cl.0)
      self.color_switch(colored_resword, " then ")
      self.print_term(0, cl.1)
      fmt.print_break(0, 0)
    }
    self.color_switch(colored_resword, " else ")
    self.print_term(0, ecl)
  }
  fmt.close_box()
  if prec != 0 {
    fmt.print_string(")")
  }
}

///|
fn Ctx::print_prefix_app(
  self : Ctx,
  s : String,
  prec : Int32,
  args : List[Term],
) -> Unit raise {
  if !(is_prefix(s) && args.length() == 1) {
    failure()
  }
  let fmt = self.fmt
  if prec == 1000 {
    fmt.print_string("(")
  }
  self.color_switch(colored_prefix, s)
  let numeric_negation = () => {
    try {
      let (l, _) = @kernel.dest_comb(@lib.hd(args))
      let s0 = name_of(l)
      let ty0 = @kernel.type_of(l)
      reverse_interface(s0, ty0) == "--" ||
      @lib.mem(
        @kernel.dest_const(l).0,
        @list.List(["real_of_num", "int_of_num"]),
      )
    } catch {
      Failure(_) => false
      e => raise e
    }
  }
  if isalnum(s) ||
    (s == "--" && args.length() == 1 && numeric_negation()) ||
    (s == "~" && args.length() == 1 && @basics.is_neg(@lib.hd(args))) {
    fmt.print_string(" ")
  }
  self.print_term(999, @lib.hd(args))
  if prec == 1000 {
    fmt.print_string(")")
  }
}

///|
fn Ctx::print_binder_app(
  self : Ctx,
  s : String,
  prec : Int32,
  tm : Term,
  args : List[Term],
) -> Unit raise {
  if !(parses_as_binder(s) &&
    args.length() == 1 &&
    @basics.is_gabs(@lib.hd(args))) {
    failure()
  }
  self.print_binder(prec, tm)
}

///|
fn Ctx::print_infix_app(
  self : Ctx,
  s : String,
  prec : Int32,
  tm : Term,
  hop : Term,
  args : List[Term],
) -> Unit raise {
  if args.length() != 2 || !@lib.can(get_infix_status, s) {
    failure()
  }
  let bargs = if aright(s) {
    let (tms, tmt) = @lib.splitlist(t => dest_binary_term(hop, t), tm)
    tms.concat(@list.singleton(tmt))
  } else {
    let (tmt, tms) = @lib.rev_splitlist(t => dest_binary_term(hop, t), tm)
    tms.prepend(tmt)
  }
  let newprec = get_infix_status(s).0.to_int()
  let fmt = self.fmt
  if newprec <= prec {
    fmt.open_hvbox(1)
    fmt.print_string("(")
  } else {
    fmt.open_hvbox(0)
  }
  self.print_term(newprec, @lib.hd(bargs))
  for x in @lib.tl(bargs) {
    if @lib.mem(s, unspaced_binops.val) {
      ()
    } else if @lib.mem(s, prebroken_binops.val) {
      fmt.print_break(1, 0)
    } else {
      fmt.print_string(" ")
    }
    self.color_switch(colored_infix, s)
    if @lib.mem(s, unspaced_binops.val) {
      fmt.print_break(0, 0)
    } else if @lib.mem(s, prebroken_binops.val) {
      fmt.print_string(" ")
    } else {
      fmt.print_break(1, 0)
    }
    self.print_term(newprec, x)
  }
  if newprec <= prec {
    fmt.print_string(")")
  }
  fmt.close_box()
}

///|
fn Ctx::print_atom(self : Ctx, hop : Term, s : String) -> Unit raise {
  let s1 = if parses_as_binder(s) ||
    @lib.can(get_infix_status, s) ||
    is_prefix(s) {
    "(" + s + ")"
  } else {
    s
  }
  let fmt = self.fmt
  let print_name = () => {
    if @kernel.is_const(hop) {
      self.color_switch(colored_const, s1)
    } else {
      fmt.print_string(s1)
    }
  }
  if print_types_of_subterms.val == 2 ||
    (
      print_types_of_subterms.val == 1 &&
      has_invented_typevar(@kernel.type_of(hop))
    ) {
    fmt.open_box(0)
    fmt.print_string("(")
    print_name()
    // A trailing symbolic character would lex together with ":".
    if s1.length() > 0 && issymb(s1[s1.length() - 1:].to_owned()) {
      fmt.print_string(" ")
    }
    fmt.print_string(":")
    if self.use_color {
      pp_print_colored_type(fmt, @kernel.type_of(hop))
    } else {
      pp_print_type(fmt, @kernel.type_of(hop))
    }
    fmt.print_string(")")
    fmt.close_box()
  } else {
    print_name()
  }
}

///|
fn Ctx::print_generic_app(self : Ctx, prec : Int32, tm : Term) -> Unit raise {
  let (l, r) = @kernel.dest_comb(tm)
  let fmt = self.fmt
  fmt.open_hvbox(0)
  if prec == 1000 {
    fmt.print_string("(")
  }
  self.print_term(999, l)
  let no_space = match l {
    Const("real_of_num", _) | Const("int_of_num", _) => true
    _ => false
  }
  if !no_space {
    fmt.print_space()
  }
  self.print_term(1000, r)
  if prec == 1000 {
    fmt.print_string(")")
  }
  fmt.close_box()
}

///|
fn Ctx::print_term_sequence(
  self : Ctx,
  brk : Bool,
  sep : String,
  prec : Int32,
  tms : List[Term],
) -> Unit raise {
  let mut rest = tms
  while rest is More(t, tail=ttms) {
    self.print_term(prec, t)
    if ttms.is_empty() {
      break
    }
    self.fmt.print_string(sep)
    if brk {
      self.fmt.print_space()
    }
    rest = ttms
  }
}

///|
fn Ctx::print_binder(self : Ctx, prec : Int32, tm : Term) -> Unit raise {
  let absf = @basics.is_gabs(tm)
  let (s, s1) = if absf {
    ("\\", "\\")
  } else {
    let bt = @kernel.rator(tm)
    let sn = name_of(bt)
    (sn, reverse_interface(sn, @kernel.type_of(bt)))
  }
  // collectvs: the bound variables (flagged when generalized) and body.
  let vs = []
  let mut t = tm
  while true {
    if absf {
      match t {
        Abs(v, b) => {
          vs.push((false, v))
          t = b
        }
        _ =>
          if @basics.is_gabs(t) {
            let (v, b) = @basics.dest_gabs(t)
            vs.push((true, v))
            t = b
          } else {
            break
          }
      }
    } else if @kernel.is_comb(t) && name_of(@kernel.rator(t)) == s {
      let r = @kernel.rand(t)
      match r {
        Abs(v, b) => {
          vs.push((false, v))
          t = b
        }
        _ =>
          if @basics.is_gabs(r) {
            let (v, b) = @basics.dest_gabs(r)
            vs.push((true, v))
            t = b
          } else {
            break
          }
      }
    } else {
      break
    }
  }
  let bod = t
  let vs = @list.List(vs)
  let fmt = self.fmt
  if prec == 0 {
    fmt.open_hvbox(4)
  } else {
    fmt.open_hvbox(5)
    fmt.print_string("(")
  }
  self.color_switch(colored_binder, s1)
  if isalnum(s1) {
    fmt.print_string(" ")
  }
  for bx in @lib.butlast(vs) {
    let (b, x) = bx
    if b {
      fmt.print_string("(")
    }
    self.print_term(0, x)
    if b {
      fmt.print_string(")")
    }
    fmt.print_string(" ")
  }
  let (lb, lx) = @lib.last(vs)
  if lb {
    fmt.print_string("(")
  }
  self.print_term(0, lx)
  if lb {
    fmt.print_string(")")
  }
  fmt.print_string(".")
  fmt.print_space()
  self.print_term(0, bod)
  if prec != 0 {
    fmt.print_string(")")
  }
  fmt.close_box()
}

///|
fn Ctx::print_clauses(self : Ctx, cls : List[List[Term]]) -> Unit raise {
  let mut rest = cls
  while rest is More(c, tail=cs) {
    self.print_clause(c)
    if cs.is_empty() {
      break
    }
    self.fmt.print_break(1, 0)
    self.fmt.print_string("| ")
    rest = cs
  }
}

///|
fn Ctx::print_clause(self : Ctx, cl : List[Term]) -> Unit raise {
  match cl {
    More(p, tail=More(g, tail=More(r, tail=Empty))) => {
      self.print_term(1, p)
      self.fmt.print_string(" when ")
      self.print_term(1, g)
      self.fmt.print_string(" -> ")
      self.print_term(1, r)
    }
    More(p, tail=More(r, tail=Empty)) => {
      self.print_term(1, p)
      self.fmt.print_string(" -> ")
      self.print_term(1, r)
    }
    _ => raise @lib.MatchFailure("printer.ml: print_clause")
  }
}

///|
pub fn pp_print_term(fmt : Formatter, tm : Term) -> Unit raise {
  { fmt, use_color: false, }.print_term(0, tm)
}

///|
pub fn pp_print_colored_term(fmt : Formatter, tm : Term) -> Unit raise {
  { fmt, use_color: true, }.print_term(0, tm)
}

///|
/// Print a term between backquotes.
pub fn pp_print_qterm(fmt : Formatter, tm : Term) -> Unit raise {
  fmt.print_string("`")
  pp_print_term(fmt, tm)
  fmt.print_string("`")
}

///|
pub fn pp_print_colored_qterm(fmt : Formatter, tm : Term) -> Unit raise {
  fmt.print_string("`")
  pp_print_colored_term(fmt, tm)
  fmt.print_string("`")
}

///|
fn print_thm_gen(
  use_color : Bool,
  fmt : Formatter,
  th : @kernel.Thm,
) -> Unit raise {
  let (asl, tm) = @kernel.dest_thm(th)
  let pt = (t : Term) => {
    if use_color {
      pp_print_colored_term(fmt, t)
    } else {
      pp_print_term(fmt, t)
    }
  }
  if !asl.is_empty() {
    if print_all_thm.val {
      pt(@lib.hd(asl))
      for x in @lib.tl(asl) {
        fmt.print_string(",")
        fmt.print_space()
        pt(x)
      }
    } else {
      fmt.print_string("...")
    }
    fmt.print_space()
  }
  fmt.open_hbox()
  fmt.print_string("|- ")
  pt(tm)
  fmt.close_box()
}

///|
pub fn pp_print_thm(fmt : Formatter, th : @kernel.Thm) -> Unit raise {
  print_thm_gen(false, fmt, th)
}

///|
pub fn pp_print_colored_thm(fmt : Formatter, th : @kernel.Thm) -> Unit raise {
  print_thm_gen(true, fmt, th)
}

// ---------------------------------------------------------------------------
// Printing on standard output and to strings.
// ---------------------------------------------------------------------------

///|
pub fn print_type(ty : HolType) -> Unit raise {
  pp_print_type(@pp.std_formatter, ty)
}

///|
pub fn print_qtype(ty : HolType) -> Unit raise {
  pp_print_qtype(@pp.std_formatter, ty)
}

///|
pub fn print_term(tm : Term) -> Unit raise {
  pp_print_term(@pp.std_formatter, tm)
}

///|
pub fn print_qterm(tm : Term) -> Unit raise {
  pp_print_qterm(@pp.std_formatter, tm)
}

///|
pub fn print_thm(th : @kernel.Thm) -> Unit raise {
  pp_print_thm(@pp.std_formatter, th)
}

///|
/// A persistent buffer formatter per printer, as upstream's
/// `print_to_string` (its geometry carries over between calls).
priv struct StringPrinter {
  buf : StringBuilder
  fmt : Formatter
}

///|
fn StringPrinter::new() -> StringPrinter {
  let buf = StringBuilder()
  let fmt = @pp.formatter_of_buffer(buf)
  fmt.set_max_boxes(100)
  { buf, fmt, }
}

///|
fn[T] StringPrinter::run(
  self : StringPrinter,
  printer : (Formatter, T) -> Unit raise,
  x : T,
) -> String raise {
  self.fmt.set_margin(@pp.std_formatter.get_margin())
  printer(self.fmt, x)
  self.fmt.print_flush()
  let s = self.buf.to_string()
  self.buf.reset()
  s
}

///|
let type_printer : StringPrinter = StringPrinter::new()

///|
let term_printer : StringPrinter = StringPrinter::new()

///|
let thm_printer : StringPrinter = StringPrinter::new()

///|
pub fn string_of_type(ty : HolType) -> String raise {
  type_printer.run(pp_print_type, ty)
}

///|
pub fn string_of_term(tm : Term) -> String raise {
  term_printer.run(pp_print_term, tm)
}

///|
pub fn string_of_thm(th : @kernel.Thm) -> String raise {
  thm_printer.run(pp_print_thm, th)
}

///|
/// printer.ml's `print_to_string printer`: a buffer formatter (at most 100
/// boxes) made now, and `printer fmt` applied now; each call prints at the
/// current margin and returns the text.
pub fn[T] print_to_string(
  printer : (Formatter) -> ((T) -> Unit raise) raise,
) -> ((T) -> String raise) raise {
  let buf = StringBuilder()
  let fmt = @pp.formatter_of_buffer(buf)
  fmt.set_max_boxes(100)
  let print = printer(fmt)
  x => {
    fmt.set_margin(@pp.std_formatter.get_margin())
    print(x)
    fmt.print_flush()
    let s = buf.to_string()
    buf.reset()
    s
  }
}

///|
/// printer.ml's `pp_print_colored_const`
pub fn pp_print_colored_const(fmt : Formatter, s : String) -> Unit {
  colored_const(fmt, s)
}

///|
/// printer.ml's `pp_print_colored_resword`
pub fn pp_print_colored_resword(fmt : Formatter, s : String) -> Unit {
  colored_resword(fmt, s)
}

///|
/// printer.ml's `pp_print_colored_binder`
pub fn pp_print_colored_binder(fmt : Formatter, s : String) -> Unit {
  colored_binder(fmt, s)
}

///|
/// printer.ml's `pp_print_colored_infix`
pub fn pp_print_colored_infix(fmt : Formatter, s : String) -> Unit {
  colored_infix(fmt, s)
}

///|
/// printer.ml's `pp_print_colored_prefix`
pub fn pp_print_colored_prefix(fmt : Formatter, s : String) -> Unit {
  colored_prefix(fmt, s)
}
