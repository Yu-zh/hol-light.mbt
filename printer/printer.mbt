// ===========================================================================
// Simplistic HOL Light prettyprinter (port of printer.ml), on top of the
// port of OCaml's Format engine in `pp/`.
//
// This file also holds the global tables that control parsing status
// (reserved words, binders, prefixes, infixes, the interface map), as
// upstream does.
// ===========================================================================

///|
using @kernel {type Term, type HolType}

///|
using @list {type List}

///|
using @pp {type Formatter}

// ---------------------------------------------------------------------------
// Character discrimination. As upstream, only the first character of the
// string is examined, and only ASCII characters belong to any class.
// ---------------------------------------------------------------------------

///|
fn char_class(s : String) -> Int32 {
  if s.length() == 0 {
    // Upstream raises Invalid_argument here; no caller passes "".
    return 0
  }
  let c = s.code_unit_at(0).to_int()
  if c >= 128 {
    return 0
  }
  let ch = c.unsafe_to_char()
  if " \t\n\r".contains_char(ch) {
    1
  } else if ",;".contains_char(ch) {
    2
  } else if "()[]{}".contains_char(ch) {
    4
  } else if "\\!@#$%^&*-+|\\<=>/?~.:".contains_char(ch) {
    8
  } else if "'abcdefghijklmnopqrstuvwxyz_ABCDEFGHIJKLMNOPQRSTUVWXYZ".contains_char(
      ch,
    ) {
    16
  } else if "0123456789".contains_char(ch) {
    32
  } else {
    0
  }
}

///|
pub fn isspace(s : String) -> Bool {
  char_class(s) == 1
}

///|
pub fn issep(s : String) -> Bool {
  char_class(s) == 2
}

///|
pub fn isbra(s : String) -> Bool {
  char_class(s) == 4
}

///|
pub fn issymb(s : String) -> Bool {
  char_class(s) == 8
}

///|
pub fn isalpha(s : String) -> Bool {
  char_class(s) == 16
}

///|
pub fn isnum(s : String) -> Bool {
  char_class(s) == 32
}

///|
pub fn isalnum(s : String) -> Bool {
  char_class(s) >= 16
}

// ---------------------------------------------------------------------------
// Binders, prefixes and infixes. These tables are independent of
// constant/variable status and of whether an identifier is symbolic.
// ---------------------------------------------------------------------------

///|
let binder_list : Ref[List[String]] = Ref::{ val: @list.List([]), }

///|
pub fn unparse_as_binder(n : String) -> Unit {
  binder_list.val = @lib.subtract(binder_list.val, @list.singleton(n))
}

///|
pub fn parse_as_binder(n : String) -> Unit {
  binder_list.val = @lib.union(binder_list.val, @list.singleton(n))
}

///|
pub fn parses_as_binder(n : String) -> Bool {
  @lib.mem(n, binder_list.val)
}

///|
pub fn binders() -> List[String] {
  binder_list.val
}

///|
let prefix_list : Ref[List[String]] = Ref::{ val: @list.List([]), }

///|
pub fn unparse_as_prefix(n : String) -> Unit {
  prefix_list.val = @lib.subtract(prefix_list.val, @list.singleton(n))
}

///|
pub fn parse_as_prefix(n : String) -> Unit {
  prefix_list.val = @lib.union(prefix_list.val, @list.singleton(n))
}

///|
pub fn is_prefix(n : String) -> Bool {
  @lib.mem(n, prefix_list.val)
}

///|
pub fn prefixes() -> List[String] {
  prefix_list.val
}

///|
let infix_list : Ref[List[(String, (Int64, String))]] = Ref::{
  val: @list.List([]),
}

///|
pub fn unparse_as_infix(n : String) -> Unit {
  infix_list.val = @lib.filter(
    (e : (String, (Int64, String))) => e.0 != n,
    infix_list.val,
  )
}

///|
/// Declare `n` as an infix with precedence `d.0` and associativity
/// `d.1` (`"left"` or `"right"`).
pub fn parse_as_infix(n : String, d : (Int64, String)) -> Unit {
  // Sort by precedence, then right-associative first, then by name.
  let cmp = (e1 : (String, (Int64, String)), e2 : (String, (Int64, String))) => {
    let (s, (x, a)) = e1
    let (t, (y, b)) = e2
    x < y ||
    (x == y && @kernel.compare_string(a, b) > 0) ||
    (x == y && a == b && @kernel.compare_string(s, t) < 0)
  }
  infix_list.val = @lib.sort(
    cmp,
    @lib.filter((e : (String, (Int64, String))) => e.0 != n, infix_list.val).prepend(
      (n, d),
    ),
  )
}

///|
/// Precedence and associativity of an infix (fails with "find").
pub fn get_infix_status(n : String) -> (Int64, String) raise {
  @lib.assoc(n, infix_list.val)
}

///|
pub fn infixes() -> List[(String, (Int64, String))] {
  infix_list.val
}

// ---------------------------------------------------------------------------
// Interface mapping and printer flags.
// ---------------------------------------------------------------------------

///|
/// The interface: `(name, (constant, type))` entries mapping overloaded or
/// interface names to the underlying constants.
pub let the_interface : Ref[List[(String, (String, HolType))]] = Ref::{
  val: @list.List([]),
}

///|
pub let the_overload_skeletons : Ref[List[(String, HolType)]] = Ref::{
  val: @list.List([]),
}

///|
/// Whether interface/overloading is reversed on printing.
pub let reverse_interface_mapping : Ref[Bool] = Ref::{ val: true, }

///|
/// Binary operators that print without surrounding spaces.
pub let unspaced_binops : Ref[List[String]] = Ref::{
  val: @list.List([",", "..", "$"]),
}

///|
/// Binary operators to print at the start of a line when breaking.
pub let prebroken_binops : Ref[List[String]] = Ref::{
  val: @list.singleton("==>"),
}

///|
/// Force explicit indication of bound variables in set abstractions.
pub let print_unambiguous_comprehensions : Ref[Bool] = Ref::{ val: false, }

///|
/// Print the universal set `UNIV:A->bool` as `(:A)`.
pub let typify_universal_set : Ref[Bool] = Ref::{ val: true, }

///|
/// Whether hypotheses of theorems are printed.
pub let print_all_thm : Ref[Bool] = Ref::{ val: true, }

///|
/// 0: never print types of subterms; 1 (default): only types containing
/// invented type variables; 2: types of all constants and variables.
pub let print_types_of_subterms : Ref[Int64] = Ref::{ val: 1, }

///|
/// The name of a constant or variable (`""` otherwise).
pub fn name_of(tm : Term) -> String {
  match tm {
    Var(x, _) | Const(x, _) => x
    _ => ""
  }
}

// ---------------------------------------------------------------------------
// Colors (ANSI codes).
// ---------------------------------------------------------------------------

///|
pub let printer_color_const : Ref[String?] = Ref::{ val: Some("32"), }

///|
pub let printer_color_resword : Ref[String?] = Ref::{ val: Some("34"), }

///|
pub let printer_color_binder : Ref[String?] = Ref::{ val: Some("35"), }

///|
pub let printer_color_infix : Ref[String?] = Ref::{ val: None, }

///|
pub let printer_color_prefix : Ref[String?] = Ref::{ val: None, }

///|
pub let printer_color_type : Ref[String?] = Ref::{ val: Some("36"), }

///|
pub let printer_color_typevar : Ref[String?] = Ref::{ val: Some("34"), }

///|
pub let printer_color_itypevar : Ref[String?] = Ref::{ val: Some("31"), }

///|
pub fn pp_print_colored_string(
  colorcode : String?,
  fmt : Formatter,
  contents : String,
) -> Unit {
  match colorcode {
    Some(code) => {
      fmt.print_as(0, "\u{1b}[" + code + "m")
      fmt.print_string(contents)
      fmt.print_as(0, "\u{1b}[0m")
    }
    None => fmt.print_string(contents)
  }
}

///|
fn print_colored_tyvar(fmt : Formatter, s : String) -> Unit {
  let code = if s.has_prefix("?") {
    printer_color_itypevar.val
  } else {
    printer_color_typevar.val
  }
  pp_print_colored_string(code, fmt, s)
}

// ---------------------------------------------------------------------------
// Printer for types.
// ---------------------------------------------------------------------------

///|
fn soc(sep : String, flag : Bool, ss : List[String]) -> String raise {
  if ss.is_empty() {
    return ""
  }
  let s = @lib.end_itlist((s1, s2) => s1 + sep + s2, ss)
  if flag {
    "(" + s + ")"
  } else {
    s
  }
}

///|
fn sot(pr : Int32, ty : HolType) -> String raise {
  match ty {
    Tyvar(s) => return s
    _ => ()
  }
  try @basics.dest_finty(ty) catch {
    Failure(_) => ()
    e => raise e
  } noraise {
    n => return @num.string_of_num(n)
  }
  // OCaml evaluates the list literals right to left.
  match ty {
    Tyapp(con, Empty) => con
    Tyapp("fun", More(ty1, tail=More(ty2, tail=Empty))) => {
      let s2 = sot(0, ty2)
      soc("->", pr > 0, @list.List([sot(1, ty1), s2]))
    }
    Tyapp("sum", More(ty1, tail=More(ty2, tail=Empty))) => {
      let s2 = sot(2, ty2)
      soc("+", pr > 2, @list.List([sot(3, ty1), s2]))
    }
    Tyapp("prod", More(ty1, tail=More(ty2, tail=Empty))) => {
      let s2 = sot(4, ty2)
      soc("#", pr > 4, @list.List([sot(5, ty1), s2]))
    }
    Tyapp("cart", More(ty1, tail=More(ty2, tail=Empty))) => {
      let s2 = sot(7, ty2)
      soc("^", pr > 6, @list.List([sot(6, ty1), s2]))
    }
    Tyapp(con, args) => soc(",", true, @lib.map(a => sot(0, a), args)) + con
    Tyvar(s) => s
  }
}

///|
pub fn pp_print_type(fmt : Formatter, ty : HolType) -> Unit raise {
  fmt.print_string(sot(0, ty))
}

///|
pub fn pp_print_qtype(fmt : Formatter, ty : HolType) -> Unit raise {
  fmt.print_string("`:")
  fmt.print_string(sot(0, ty))
  fmt.print_string("`")
}

///|
fn color_print_str(fmt : Formatter, s : String) -> Unit {
  pp_print_colored_string(printer_color_type.val, fmt, s)
}

///|
fn csoc(
  sep : String,
  flag : Bool,
  ss : List[(Formatter) -> Unit raise],
  fmt : Formatter,
) -> Unit raise {
  if ss.is_empty() {
    return
  }
  if flag {
    color_print_str(fmt, "(")
  }
  let tuple_printer = @lib.end_itlist(
    (pp : (Formatter) -> Unit raise, pp_next : (Formatter) -> Unit raise) => {
      (f : Formatter) => {
        pp(f)
        color_print_str(f, sep)
        pp_next(f)
      }
    },
    ss,
  )
  tuple_printer(fmt)
  if flag {
    color_print_str(fmt, ")")
  }
}

///|
fn csot(pr : Int32, ty : HolType, fmt : Formatter) -> Unit raise {
  match ty {
    Tyvar(s) => return print_colored_tyvar(fmt, s)
    _ => ()
  }
  try @basics.dest_finty(ty) catch {
    Failure(_) => ()
    e => raise e
  } noraise {
    n => return color_print_str(fmt, @num.string_of_num(n))
  }
  let p = (pr : Int32, t : HolType) => (f : Formatter) => csot(pr, t, f)
  match ty {
    Tyapp(con, Empty) => color_print_str(fmt, con)
    Tyapp("fun", More(ty1, tail=More(ty2, tail=Empty))) =>
      csoc("->", pr > 0, @list.List([p(1, ty1), p(0, ty2)]), fmt)
    Tyapp("sum", More(ty1, tail=More(ty2, tail=Empty))) =>
      csoc("+", pr > 2, @list.List([p(3, ty1), p(2, ty2)]), fmt)
    Tyapp("prod", More(ty1, tail=More(ty2, tail=Empty))) =>
      csoc("#", pr > 4, @list.List([p(5, ty1), p(4, ty2)]), fmt)
    Tyapp("cart", More(ty1, tail=More(ty2, tail=Empty))) =>
      csoc("^", pr > 6, @list.List([p(6, ty1), p(7, ty2)]), fmt)
    Tyapp(con, args) => {
      csoc(",", true, args.map(a => p(0, a)), fmt)
      color_print_str(fmt, con)
    }
    Tyvar(_) => ()
  }
}

///|
pub fn pp_print_colored_type(fmt : Formatter, ty : HolType) -> Unit raise {
  csot(0, ty, fmt)
}

///|
pub fn pp_print_colored_qtype(fmt : Formatter, ty : HolType) -> Unit raise {
  fmt.print_string("`:")
  csot(0, ty, fmt)
  fmt.print_string("`")
}

// ---------------------------------------------------------------------------
// User printers (must fail quickly if not applicable).
// ---------------------------------------------------------------------------

///|
/// A named user printer.
pub type UserPrinter = (String, (Formatter, Term) -> Unit raise)

///|
let user_printers : Ref[List[(String, (Formatter, Term) -> Unit raise)]] = Ref::{
  val: @list.List([]),
}

///|
let user_color_printers : Ref[List[(String, (Formatter, Term) -> Unit raise)]] = Ref::{
  val: @list.List([]),
}

///|
pub fn install_user_printer(
  name : String,
  pr : (Formatter, Term) -> Unit raise,
) -> Unit {
  user_printers.val = user_printers.val.prepend((name, pr))
}

///|
pub fn install_user_color_printer(
  name : String,
  pr : (Formatter, Term) -> Unit raise,
) -> Unit {
  user_color_printers.val = user_color_printers.val.prepend((name, pr))
}

///|
pub fn delete_user_printer(s : String) -> Unit raise {
  user_printers.val = @lib.remove(
      (p : UserPrinter) => p.0 == s,
      user_printers.val,
    ).1
}

///|
pub fn delete_user_color_printer(s : String) -> Unit raise {
  user_color_printers.val = @lib.remove(
      (p : UserPrinter) => p.0 == s,
      user_color_printers.val,
    ).1
}

///|
pub fn try_user_printer(fmt : Formatter, tm : Term) -> Unit raise {
  @lib.tryfind((p : UserPrinter) => (p.1)(fmt, tm), user_printers.val)
}

///|
pub fn try_user_color_printer(fmt : Formatter, tm : Term) -> Unit raise {
  @lib.tryfind((p : UserPrinter) => (p.1)(fmt, tm), user_color_printers.val)
}

///|
/// As upstream's `set_max_boxes 100` (printer.ml), and route `report`
/// through the standard formatter (lib.ml's `report` uses Format), so all
/// output is ordered.
fn init {
  @pp.std_formatter.set_max_boxes(100)
  @lib.report_sink.val = s => {
    @pp.std_formatter.print_string(s)
    @pp.std_formatter.print_newline()
  }
}

///|
/// printer.ml's `pp_print_colored_tyvar`
pub fn pp_print_colored_tyvar(fmt : Formatter, s : String) -> Unit {
  print_colored_tyvar(fmt, s)
}
