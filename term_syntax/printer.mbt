// Print terms and types in the term syntax, so that parsing the result
// gives the term back. Constants are printed under their own names (or as
// the operator the grammar reads as that name), binders always carry their
// type, and a free variable carries its type where it first appears.

///|
/// A term or type that has no spelling in the syntax (a name that is not a
/// MoonBit identifier, a type variable the elaborator invented, ...).
pub(all) suberror Unprintable {
  Unprintable(String)
} derive(Debug)

///|
pub extend Unprintable with Debug::{to_repr}

///|
// precedence levels, loosest first, as in the grammar
const EXPR = 0

///|
const IMPL = 1

///|
const OR = 2

///|
const AND = 3

///|
const CMP = 4

///|
const ADD = 5

///|
const MUL = 6

///|
const PREFIX = 7

///|
const SIMPLE = 8

///|
fn is_ident_char(c : Char) -> Bool {
  c is ('a'..='z' | 'A'..='Z' | '0'..='9' | '_')
}

///|
/// Whether `name` lexes as one identifier (with optional trailing primes)
/// that is not a keyword.
fn is_ident(name : String) -> Bool {
  let cs = name.to_array()
  let mut n = cs.length()
  while n > 0 && cs[n - 1] == '\'' {
    n -= 1
  }
  if n == 0 || name == "_" || is_keyword(name) {
    return false
  }
  let c0 = cs[0]
  let start_ok = c0 is ('a'..='z' | 'A'..='Z') ||
    (c0 == '_' && n > 1)
  start_ok && cs[1:n].iter().all(is_ident_char)
}

///|
fn is_type_constant(name : String) -> Bool {
  (try @kernel.get_type_arity(name) catch { _ => -1L }) >= 0L
}

///|
fn capitalised(name : String) -> String {
  let cs = name.to_array()
  cs[0].to_string().to_upper() + String::from_array(cs[1:])
}

///|
fn lowered(name : String) -> String {
  let cs = name.to_array()
  cs[0].to_string().to_lower() + String::from_array(cs[1:])
}

///|
/// What the type name `s` reads as (the parser's rule, internal/grammar):
/// Some(type constant), or None for a type variable.
fn reads_as_type(s : String) -> String? {
  if s == "Unit" && !is_type_constant("unit") {
    Some("1")
  } else if is_type_constant(lowered(s)) {
    Some(lowered(s))
  } else if is_type_constant(s) {
    Some(s)
  } else {
    None
  }
}

///|
fn type_name(name : String) -> String raise Unprintable {
  let candidates = if name == "1" { ["Unit"] } else { [capitalised(name), name] }
  for s in candidates {
    if is_ident(s) && s.to_array()[0] is ('A'..='Z') && reads_as_type(s) == Some(name) {
      return s
    }
  }
  raise Unprintable("type constant " + name)
}

///|
fn flatten(ty : @kernel.HolType, op : String) -> Array[@kernel.HolType] {
  let out = []
  let mut t = ty
  while t is Tyapp(o, More(a, tail=More(b, tail=Empty))) && o == op {
    out.push(a)
    t = b
  }
  out.push(t)
  out
}

///|
fn print_type_at(ty : @kernel.HolType, simple : Bool) -> String raise Unprintable {
  match ty {
    // a type variable the elaborator invented is written as a hole, which
    // elaboration fills with a fresh one
    Tyvar(name) if name.has_prefix("?") => "_"
    Tyvar(name) =>
      if name.to_array() is [c, ..] &&
        c is ('A'..='Z') &&
        is_ident(name) &&
        reads_as_type(name) is None {
        name
      } else {
        raise Unprintable("type variable " + name)
      }
    Tyapp("fun", More(_, tail=More(_, tail=Empty))) => {
      let parts = flatten(ty, "fun")
      let res = parts.pop().unwrap()
      let args = parts.map(a => print_type_at(a, false)).join(", ")
      let s = "(" + args + ") -> " + print_type_at(res, false)
      if simple {
        "(" + s + ")"
      } else {
        s
      }
    }
    Tyapp("prod", More(_, tail=More(_, tail=Empty))) =>
      "(" + flatten(ty, "prod").map(a => print_type_at(a, false)).join(", ") + ")"
    Tyapp(name, Empty) => type_name(name)
    Tyapp(name, args) =>
      type_name(name) +
      "[" +
      args.map(a => print_type_at(a, false)).to_array().join(", ") +
      "]"
  }
}

///|
/// `ty` inside a term, where a hole stands for an invented type variable.
fn print_type_in_term(ty : @kernel.HolType) -> String raise Unprintable {
  print_type_at(ty, false)
}

///|
/// `ty` in the term syntax.
pub fn print_type(ty : @kernel.HolType) -> String raise Unprintable {
  // holes stand for invented type variables only inside a term, whose
  // elaboration recovers them; a type alone has nothing to recover them from
  for v in @kernel.tyvars(ty) {
    if v is Tyvar(name) && name.has_prefix("?") {
      raise Unprintable("invented type variable " + name)
    }
  }
  print_type_at(ty, false)
}

///|
priv struct Printer {
  // free variables printed with their type so far
  typed_free : Array[@kernel.Term]
  // type variables some variable's type fixes; a constant whose type has
  // another one is printed with its type
  fixed : @list.List[@kernel.HolType]
  // annotate every constant whose type has a type variable
  all_constants : Bool
  // write a constant under its overloaded name (+ for real_add, divides
  // for num_divides) where the interface has one
  overloads : Bool
  // names of every variable of the term, which a renamed binder avoids
  names : Array[String]
  // write sets as {a, b} and {e | p} (else as INSERT, GSPEC, ...)
  sets : Bool
  // the GEN%PVAR binders of the comprehensions written with their binders
  // listed ({e | x : A | p}) where {e | p} would do, as a quotation may:
  // HOL's parser reads the element of the two forms a different number of
  // times (pgen_cost), numbering the comprehensions in it differently
  listed : Array[String]
  // write a comprehension whose binder is not a GEN%PVAR name as GSPEC(...):
  // set notation reads with a GEN%PVAR binder, renaming it
  exact : Bool
  // bindings of a set comprehension's implicit binders ({e | p}), each the
  // variable and the depth of its binding in the scope: printed with their
  // type where they first occur
  untyped : Array[(@kernel.Term, Int)]
}

///|
fn wrap(s : String, level : Int, ctx : Int) -> String {
  if level < ctx {
    "(" + s + ")"
  } else {
    s
  }
}

///|
// operators of the grammar: HOL name -> (MoonBit operator, level, right-assoc)
fn binary_op(name : String) -> (String, Int, Bool)? {
  match name {
    "==>" => Some(("→", IMPL, true))
    "\\/" => Some(("||", OR, true))
    "/\\" => Some(("&&", AND, true))
    "=" => Some(("==", CMP, false))
    "<" | "<=" | ">" | ">=" => Some((name, CMP, false))
    "+" | "-" => Some((name, ADD, false))
    "*" | "/" => Some((name, MUL, false))
    _ => None
  }
}

///|
fn is_constant_name(name : String) -> Bool {
  names_constant(name)
}

///|
/// Whether `t` uses the constant named `name`.
fn uses_constant(t : @kernel.Term, name : String) -> Bool {
  match t {
    Const(n, _) => n == name
    Var(_, _) => false
    Comb(f, x) => uses_constant(f, name) || uses_constant(x, name)
    Abs(v, b) => uses_constant(v, name) || uses_constant(b, name)
  }
}

///|
/// Whether `name` is a symbolic name the syntax writes between backticks:
/// HOL symbol characters only (no letters, digits, `_`, primes or
/// backticks), as the lexer's RAWIDENT accepts.
fn is_raw_name(name : String) -> Bool {
  name != "" && name.iter().all(c => "-!@#$%^&*+|<=>/?~.:".contains_char(c))
}

///|
/// A variable's printed name as the syntax spells it: an identifier as it
/// is, a symbolic name between backticks.
fn spell_name(name : String) -> String raise Unprintable {
  if is_ident(name) {
    name
  } else if is_raw_name(name) {
    "`" + name + "`"
  } else {
    raise Unprintable("name " + name)
  }
}

///|
fn Printer::name(_self : Printer, name : String) -> String raise Unprintable {
  spell_name(name)
}

///|
/// A constant's name, spelt as an identifier if it is not one.
fn constant_name(name : String) -> String raise Unprintable {
  if is_ident(name) && @grammar.unescape(name) == name {
    name
  } else {
    match @grammar.escape(name) {
      Some(s) => s
      None => raise Unprintable("name " + name)
    }
  }
}

///|
/// The name a constant is written under: its overloaded name, when
/// overloads are on and the interface maps one the syntax can write (an
/// operator, ~, --, or an identifier) to this constant at an instance of its
/// type; its own name otherwise.
fn Printer::spelling(self : Printer, c : @kernel.Term) -> String {
  guard c is Const(name, ty) else { return "" }
  if !self.overloads {
    return name
  }
  for e in @printer.the_interface.val {
    let (iname, (cname, gty)) = e
    if cname == name &&
      iname != name &&
      (binary_op(iname) is Some(_) ||
      iname is ("~" | "--") ||
      is_ident(iname)) &&
      (try @basics.type_match(gty, ty, @list.List([])) is _ catch {
        _ => false
      } noraise {
        _ => true
      }) {
      return iname
    }
  }
  name
}

///|
fn Printer::constant(self : Printer, c : @kernel.Term) -> String raise Unprintable {
  guard c is Const(_, ty) else { raise Unprintable("not a constant") }
  let spelling = self.spelling(c)
  // a name the interface overloads reads as whichever constant the
  // priority in force picks (+ as real_add after prioritize_real)
  let overloaded = @printer.the_interface.val.iter().any(e => e.0 == spelling)
  self.annotated(constant_name(spelling), c, overloaded~)
}

///|
/// `s` for the constant `c`, with `c`'s type where the reading may not pin
/// it down: a type variable no variable fixes, or (annotating every
/// constant) any instance of a polymorphic constant, or a constant written
/// under an overloaded name.
fn Printer::annotated(
  self : Printer,
  s : String,
  c : @kernel.Term,
  overloaded? : Bool = false,
) -> String raise Unprintable {
  guard c is Const(name, ty) else { raise Unprintable("not a constant") }
  let tvs = @kernel.tyvars(ty)
  let polymorphic = (try @kernel.get_const_type(name) catch { _ => ty })
    |> @kernel.tyvars
    |> fn(l) { !l.is_empty() }
  if tvs.iter().any(v => !self.fixed.contains(v)) ||
    (self.all_constants && !tvs.is_empty()) {
    "(" + s + " : " + print_type_in_term(ty) + ")"
  } else if self.all_constants && (polymorphic || overloaded) {
    // a concrete instance: annotated where its type can be written
    "(" + s + " : " + print_type_in_term(ty) + ")" catch {
      _ => s
    }
  } else {
    s
  }
}

///|
fn Printer::variable(
  self : Printer,
  v : @kernel.Term,
  bound : Bound,
) -> String raise Unprintable {
  guard v is Var(name, ty) else { raise Unprintable("not a variable") }
  match bound.iter().find_first(b => b.0 == v) {
    Some((_, printed)) => {
      // the binding the occurrence refers to: the innermost of v
      let mut i = 0
      for b in bound {
        if b.0 == v {
          break
        }
        i += 1
      }
      match self.untyped.search((v, bound.length() - i)) {
        Some(i) => {
          self.untyped.remove(i) |> ignore
          return "(" + spell_name(printed) + " : " + print_type_in_term(ty) + ")"
        }
        None => return spell_name(printed)
      }
    }
    None => ()
  }
  // a symbolic name (the --> a definition is about to make a constant) is
  // spelt as a constant's is
  let s = if is_ident(name) {
    name
  } else {
    match @grammar.escape(name) {
      Some(e) => e
      None => raise Unprintable("name " + name)
    }
  }
  // a bound variable of the same name would capture it
  if bound.iter().any(b => b.1 == name) {
    raise Unprintable("free variable " + name + " captured by a binder")
  }
  if is_constant_name(name) {
    raise Unprintable("free variable " + name + " named like a constant")
  }
  if self.typed_free.contains(v) {
    s
  } else {
    self.typed_free.push(v)
    "(" + s + " : " + print_type_in_term(ty) + ")"
  }
}

///|
type Bound = @list.List[(@kernel.Term, String)]

///|
/// The name `v` is printed under where it is bound over `body`: its own,
/// unless that would capture another variable occurring in `body`, printed
/// under the same name, which a fresh name with primes avoids. Shadowing a
/// binder whose variable `body` does not mention captures nothing.
fn Printer::bind(
  self : Printer,
  v : @kernel.Term,
  body : @kernel.Term,
  bound : Bound,
  truth~ : Bool = true,
) -> (String, Bound) raise Unprintable {
  guard v is Var(name, ty) else { raise Unprintable("binder is not a variable") }
  // the names the other variables free in body are printed under
  let clash = @kernel.frees(body).iter().any(u => {
    u != v &&
    (match bound.iter().find_first(b => b.0 == u) {
      Some((_, printed)) => printed
      None => if u is Var(n, _) { n } else { "" }
    }) ==
    name
  })
  // a binder named like a constant binds a variable that shadows the
  // constant (term_syntax's binder_alias): T and F always, since the syntax
  // writes truth and falsity as true and false; any other constant that is
  // no interface name when `body` does not use it, since in the binder's
  // scope the name means the binder. A pattern's constant names are
  // constants, as in HOL, so a pattern variable named so is renamed
  // (`truth=false`), as is a binder named like an interface name
  let truth = truth &&
    (name == "T" ||
    name == "F" ||
    (names_plain_constant(name) && !uses_constant(body, name)))
  // a binder with a symbolic name no identifier spells is written between
  // backticks (bound occurrences too); a free one has its op_ spelling
  let writable = is_ident(name) || is_raw_name(name)
  let plain = writable && (truth || !is_constant_name(name))
  let mut printed = if plain { name } else if is_ident(name) { name + "'" } else { "v" }
  if clash || !plain {
    // a symbolic name takes no primes: a fresh identifier instead
    if !is_ident(printed) {
      printed = "v"
    }
    while self.names.contains(printed) || is_constant_name(printed) {
      printed = printed + "'"
    }
    self.names.push(printed)
  }
  let s = self.name(printed) + " : " + print_type_in_term(ty)
  (s, bound.prepend((v, printed)))
}

///|
fn Printer::term(
  self : Printer,
  t : @kernel.Term,
  ctx : Int,
  bound : Bound,
) -> String raise Unprintable {
  match t {
    Var(_, _) => self.variable(t, bound)
    Const("T", _) => "true"
    Const("F", _) => "false"
    Const("EMPTY", _) if self.sets => self.annotated("{}", t)
    // an operator or binder that is not applied as the syntax spells it is
    // named like any symbolic constant (op_plus, op_tilde, ...)
    Const(_, _) => self.constant(t)
    Abs(v, body) => {
      let (b, inner) = self.bind(v, body, bound)
      wrap("(" + b + ") => " + self.term(body, EXPR, inner), EXPR, ctx)
    }
    Comb(_, _) => self.comb(t, ctx, bound)
  }
}

///|
fn Printer::comb(
  self : Printer,
  t : @kernel.Term,
  ctx : Int,
  bound : Bound,
) -> String raise Unprintable {
  // only a numeral in canonical form is written in decimal
  if (try @basics.dest_numeral(t) catch { _ => None } noraise { n => Some(n) })
    is Some(n) &&
    canonical_numeral(t) {
    return @num.string_of_num(n)
  }
  let (head, args) = @basics.strip_comb(t)
  let args = args.to_array()
  let spelled = self.spelling(head)
  match (head, args) {
    (Const(q, _), [Abs(v, body)]) if q is ("forall" | "?") => {
      let sym = if q == "forall" { "∀" } else { "∃" }
      let (b, inner) = self.bind(v, body, bound)
      // the body is another quantifier or an infix expression
      let body_s = match body {
        Comb(Const(q2, _), Abs(_, _)) if q2 is ("forall" | "?") =>
          self.term(body, EXPR, inner)
        _ => self.term(body, IMPL, inner)
      }
      wrap(sym + " " + b + ", " + body_s, EXPR, ctx)
    }
    // a quantifier over a pattern, forall (a,b). e
    (Const(q, _), [Comb(Const("GABS", _), gabs)]) if q is ("forall" | "?") &&
      dest_pattern_abs(gabs) is Some((pat, vs, rhs)) => {
      let sym = if q == "forall" { "∀" } else { "∃" }
      let inner = self.bind_pattern(vs, rhs, bound, [pat, rhs])
      let p = self.term(pat, SIMPLE, inner)
      let ty = print_type_in_term(@kernel.type_of(pat))
      wrap(sym + " " + p + " : " + ty + ", " + self.term(rhs, IMPL, inner), EXPR, ctx)
    }
    // a lambda over a pattern (\(a,b). e), a match or a function by
    // cases, applied to any further arguments
    _ if self.pattern_form(head, args, bound) is Some((s, used)) =>
      if used == args.length() {
        s
      } else {
        let rest = args[used:].to_array().map(a => self.term(a, EXPR, bound))
        wrap(s + "(" + rest.join(", ") + ")", SIMPLE, ctx)
      }
    (Const(_, _), [x]) if spelled is ("~" | "--") => {
      let op = if spelled == "~" { "!" } else { "-" }
      wrap(op + self.term(x, PREFIX, bound), PREFIX, ctx)
    }
    (Const("COND", _), [c, a, b]) => {
      let s = "if " +
        self.term(c, IMPL, bound) +
        " { " +
        self.term(a, EXPR, bound) +
        " } else { " +
        self.term(b, EXPR, bound) +
        " }"
      wrap(s, EXPR, ctx)
    }
    (Const(",", _), [_, _]) => {
      let elems = []
      let mut r = t
      while r is Comb(Comb(Const(",", _), a), b) {
        elems.push(self.term(a, EXPR, bound))
        r = b
      }
      elems.push(self.term(r, EXPR, bound))
      "(" + elems.join(", ") + ")"
    }
    (Const("INSERT", _), [_, _]) if self.sets && set_elements(t) is Some(items) =>
      "{" + items.map(x => self.term(x, EXPR, bound)).join(", ") + "}"
    // with no binders to list, only the implicit form can write it; a
    // comprehension applied to arguments ({x | P x} y) is written so too
    (Const("GSPEC", _), [Abs(g, body), ..]) if self.sets &&
      !(self.exact && !(g is Var(n, _) && pvar_number(n) is Some(_))) &&
      comprehension(g, body) is Some((scoped, p, e)) &&
      (!scoped.is_empty() || implicit_binders(e, p, bound).is_empty()) => {
      let s = self.comprehension(g, scoped, p, e, bound)
      if args.length() == 1 {
        s
      } else {
        let rest = args[1:].to_array().map(a => self.term(a, EXPR, bound))
        wrap(s + "(" + rest.join(", ") + ")", SIMPLE, ctx)
      }
    }
    (Const("CONS", _), [_, _]) if (try @basics.dest_list(t) catch { _ => None } noraise {
          l => Some(l)
        })
      is Some(items) =>
      "[" +
      items.to_array().map(x => self.term(x, EXPR, bound)).join(", ") +
      "]"
    (Const(_, _), [a, b]) if binary_op(spelled) is Some((op, level, right)) => {
      // comparisons associate to the left in MoonBit, but a chain such as
      // a == b == c (for (a = b) <=> c) misreads easily: parenthesize them
      let (lctx, rctx) = if level == CMP {
        (level + 1, level + 1)
      } else if right {
        (level + 1, level)
      } else {
        (level, level + 1)
      }
      let s = self.term(a, lctx, bound) + " " + op + " " + self.term(b, rctx, bound)
      wrap(s, level, ctx)
    }
    _ => {
      let h = self.term(head, SIMPLE, bound)
      let s = h + "(" + args.map(a => self.term(a, EXPR, bound)).join(", ") + ")"
      wrap(s, SIMPLE, ctx)
    }
  }
}

///|
/// The pattern, the variables it binds and the body of a lambda over a
/// pattern, GABS applied to `gabs`: GABS (\f. ∀ vs. GEQ (f pat) body), as
/// elaboration builds it.
fn dest_pattern_abs(
  gabs : @kernel.Term,
) -> (@kernel.Term, Array[@kernel.Term], @kernel.Term)? {
  guard gabs is Abs(f, b) else { return None }
  let vs = []
  let mut b = b
  while b is Comb(Const("forall", _), Abs(v, inner)) {
    vs.push(v)
    b = inner
  }
  guard b is Comb(Comb(Const("GEQ", _), Comb(g, pat)), body) && g == f else {
    return None
  }
  if @kernel.vfree_in(f, pat) || @kernel.vfree_in(f, body) {
    return None
  }
  Some((pat, vs, body))
}

///|
/// A pattern-match clause, as HOL's parser builds it (pmk_pattern):
/// \x y. ∃ vs. _UNGUARDED_PATTERN (GEQ pat x) (GEQ body y), or with
/// _GUARDED_PATTERN and a guard: its pattern, variables, guard and body.
fn clause(
  c : @kernel.Term,
) -> (@kernel.Term, Array[@kernel.Term], @kernel.Term?, @kernel.Term)? {
  guard c is Abs(x, Abs(y, b)) else { return None }
  let vs = []
  let mut b = b
  while b is Comb(Const("?", _), Abs(v, inner)) {
    vs.push(v)
    b = inner
  }
  match b {
    Comb(
      Comb(Const("_UNGUARDED_PATTERN", _), Comb(Comb(Const("GEQ", _), pat), x1)),
      Comb(Comb(Const("GEQ", _), body), y1)
    ) if x1 == x && y1 == y => Some((pat, vs, None, body))
    Comb(
      Comb(
        Comb(Const("_GUARDED_PATTERN", _), Comb(Comb(Const("GEQ", _), pat), x1)),
        g
      ),
      Comb(Comb(Const("GEQ", _), body), y1)
    ) if x1 == x && y1 == y => Some((pat, vs, Some(g), body))
    _ => None
  }
}

///|
/// The clauses of a _SEQPATTERN chain, nested to the right.
fn clauses(
  t : @kernel.Term,
) -> Array[(@kernel.Term, Array[@kernel.Term], @kernel.Term?, @kernel.Term)]? {
  let arms = []
  let mut t = t
  while t is Comb(Comb(Const("_SEQPATTERN", _), a), rest) {
    guard clause(a) is Some(arm) else { return None }
    arms.push(arm)
    t = rest
  }
  guard clause(t) is Some(arm) else { return None }
  arms.push(arm)
  Some(arms)
}

///|
/// `head` applied to the first of `args` it takes, written as a lambda over
/// a pattern (`fn { (a, b) => e }`), a match (`match e { p => a; ... }`) or
/// a function by cases (`fn { p => a; q => b }`), and how many it takes.
fn Printer::pattern_form(
  self : Printer,
  head : @kernel.Term,
  args : Array[@kernel.Term],
  bound : Bound,
) -> (String, Int)? raise Unprintable {
  match (head, args) {
    (Const("GABS", _), [a, ..]) =>
      match dest_pattern_abs(a) {
        Some((pat, vs, rhs)) =>
          Some(
            (
              "fn { " +
              self.arm(pat, vs, None, rhs, bound) +
              " }",
              1,
            ),
          )
        None => None
      }
    (Const("_MATCH", _), [e, cs, ..]) =>
      match clauses(cs) {
        Some(arms) =>
          Some(
            (
              "match " +
              self.term(e, IMPL, bound) +
              " { " +
              self.arms(arms, bound) +
              " }",
              2,
            ),
          )
        None => None
      }
    // with one arm and no guard, fn { ... } is the lambda over the pattern
    (Const("_FUNCTION", _), [cs, ..]) =>
      match clauses(cs) {
        Some(arms) if !(arms is [(_, _, None, _)]) =>
          Some(("fn { " + self.arms(arms, bound) + " }", 1))
        _ => None
      }
    _ => None
  }
}

///|
/// Whether a variable named `name` occurs in `t`, free or bound.
fn names_variable(t : @kernel.Term, name : String) -> Bool {
  match t {
    Var(n, _) => n == name
    Const(_, _) => false
    Comb(f, x) => names_variable(f, name) || names_variable(x, name)
    Abs(v, b) => names_variable(v, name) || names_variable(b, name)
  }
}

///|
/// `bound` with its first `n` bindings' symbolic names spelt op_, as a
/// pattern or an implicit set binder reads them (the backticks are for the
/// binders that have no other spelling, which read an op_ name literally),
/// unless that name is taken: printed for another binding in scope, or the
/// name of any variable in `scope`, free or bound (it would be captured,
/// read as the other variable, or force a binder there to be renamed);
/// then the backticks stay.
fn op_spelled(bound : Bound, n : Int, scope : Array[@kernel.Term]) -> Bound {
  let bs = bound.to_array()
  let n = if n < bs.length() { n } else { bs.length() }
  for i in 0..<n {
    let (v, printed) = bs[i]
    if !is_ident(printed) && is_raw_name(printed) {
      match @grammar.escape(printed) {
        Some(e) => {
          let taken = bs.iter().any(b => b.1 == e) ||
            scope.iter().any(t => names_variable(t, e))
          if !taken {
            bs[i] = (v, e)
          }
        }
        None => ()
      }
    }
  }
  @list.from_array(bs)
}

///|
/// `bound` with a pattern's variables `vs` bound over `body` (all that the
/// pattern scopes over, its guard included, is `scope`). Annotating every
/// constant, the variables are written with their type where they first
/// occur in the pattern.
fn Printer::bind_pattern(
  self : Printer,
  vs : Array[@kernel.Term],
  body : @kernel.Term,
  bound : Bound,
  scope : Array[@kernel.Term],
) -> Bound raise Unprintable {
  let mut inner = bound
  for v in vs {
    inner = self.bind(v, body, inner, truth=false).1
  }
  inner = op_spelled(inner, vs.length(), scope)
  if self.all_constants {
    self.untyped.append(vs.mapi((i, v) => (v, bound.length() + i + 1)))
  }
  inner
}

///|
/// An arm `pat => body` (`pat if guard => body`), its pattern binding `vs`.
fn Printer::arm(
  self : Printer,
  pat : @kernel.Term,
  vs : Array[@kernel.Term],
  guard_ : @kernel.Term?,
  body : @kernel.Term,
  bound : Bound,
) -> String raise Unprintable {
  let scope = match guard_ {
    Some(g) => [pat, g, body]
    None => [pat, body]
  }
  let inner = self.bind_pattern(vs, body, bound, scope)
  let p = self.term(pat, IMPL, inner)
  // a variable the pattern binds occurs in it, so these marks are used
  for i in 0..<vs.length() {
    match self.untyped.search((vs[i], bound.length() + i + 1)) {
      Some(j) => self.untyped.remove(j) |> ignore
      None => ()
    }
  }
  let g = match guard_ {
    Some(g) => " if " + self.term(g, IMPL, inner)
    None => ""
  }
  p + g + " => " + self.term(body, EXPR, inner)
}

///|
/// Arms separated by `; `.
fn Printer::arms(
  self : Printer,
  arms : Array[(@kernel.Term, Array[@kernel.Term], @kernel.Term?, @kernel.Term)],
  bound : Bound,
) -> String raise Unprintable {
  arms.map(a => self.arm(a.0, a.1, a.2, a.3, bound)).join("; ")
}

///|
/// Whether the numeral `t` (one `dest_numeral` reads) is in the form
/// `mk_numeral` builds: NUMERAL _0, or bits with no leading zero (the bit
/// applied to _0 is BIT1). Written here so that the term syntax depends on
/// nothing loaded after the parser (nums), which every package with
/// quotations may use.
fn canonical_numeral(t : @kernel.Term) -> Bool {
  guard t is Comb(Const("NUMERAL", _), bits) else { return false }
  let mut b = bits
  let mut innermost = ""
  while b is Comb(Const(("BIT0" | "BIT1") as bit, _), rest) {
    innermost = bit
    b = rest
  }
  b is Const("_0", _) && (innermost == "" || innermost == "BIT1")
}

///|
/// The elements of `{a, b, ...}`: INSERT a (INSERT b ... EMPTY).
fn set_elements(t : @kernel.Term) -> Array[@kernel.Term]? {
  let items = []
  let mut r = t
  while r is Comb(Comb(Const("INSERT", _), a), rest) {
    items.push(a)
    r = rest
  }
  if r is Const("EMPTY", _) {
    Some(items)
  } else {
    None
  }
}

///|
/// A set comprehension GSPEC (\g. ?xs. SETSPEC g p e): (each x with the
/// body it scopes, p, e).
fn comprehension(
  g : @kernel.Term,
  body : @kernel.Term,
) -> (Array[(@kernel.Term, @kernel.Term)], @kernel.Term, @kernel.Term)? {
  let xs = []
  let mut b = body
  while b is Comb(Const("?", _), Abs(x, inner)) {
    xs.push((x, inner))
    b = inner
  }
  guard b is Comb(Comb(Comb(Const("SETSPEC", _), g2), p), e) && g2 == g else {
    return None
  }
  if xs.iter().any(x => x.0 == g) ||
    @kernel.frees(p).contains(g) ||
    @kernel.frees(e).contains(g) {
    return None
  }
  Some((xs, p, e))
}

///|
/// The variables HOL's `{e | p}` binds: those free in both, or all those of
/// `e` when it has at most one or `p` has none (@parser.pmk_setabs; a
/// variable named like a constant or a numeral reads as that).
fn implicit_binders(
  e : @kernel.Term,
  p : @kernel.Term,
  bound : Bound,
) -> Array[@kernel.Term] {
  // a variable reads as a constant or numeral by the name it is printed
  // under (a binder in scope may be renamed)
  fn printed(v : @kernel.Term) -> String {
    match bound.iter().find_first(b => b.0 == v) {
      Some((_, n)) => n
      None => if v is Var(n, _) { n } else { "" }
    }
  }
  fn vars(t : @kernel.Term) -> Array[@kernel.Term] {
    @kernel.frees(t)
    .to_array()
    .filter(v => {
      let n = printed(v)
      !is_constant_name(n) && !n.to_array().iter().all(c => c is ('0'..='9'))
    })
  }
  let fvs = vars(e)
  let bvs = vars(p)
  if fvs.length() <= 1 || bvs.is_empty() {
    fvs
  } else {
    fvs.filter(v => bvs.contains(v))
  }
}

///|
/// A comprehension the printer writes in set notation, with a GEN%PVAR
/// binder: (its number, its binder's name, e, p, whether {e | p} binds
/// its binders, whether it has binders to list), as the printer finds it
/// (with no binder in scope renamed).
priv struct Notation {
  number : Int
  name : String
  e : @kernel.Term
  p : @kernel.Term
  implicit : Bool
  listable : Bool
}

///|
/// n for a GEN%PVAR name `GEN%PVAR%n`.
fn pvar_number(name : String) -> Int? {
  guard name.strip_prefix("GEN%PVAR%") is Some(digits) &&
    !digits.is_empty() &&
    digits.iter().all(c => c is ('0'..='9')) else {
    return None
  }
  let mut number = 0
  for c in digits {
    number = number * 10 + (c.to_int() - '0'.to_int())
  }
  Some(number)
}

///|
fn notation(t : @kernel.Term) -> Notation? {
  guard t is Comb(Const("GSPEC", _), Abs(Var(name, _) as g, body)) &&
    pvar_number(name) is Some(number) else {
    return None
  }
  guard comprehension(g, body) is Some((scoped, p, e)) else { return None }
  let xs = scoped.map(x => x.0)
  let binds = implicit_binders(e, p, @list.List([]))
  // with no binders to list, only {e | p} can write it, else GSPEC(...)
  if scoped.is_empty() && !binds.is_empty() {
    return None
  }
  Some({ number, name, e, p, implicit: binds == xs, listable: !xs.is_empty() })
}

///|
/// The comprehensions in set notation in `t` not inside another, in the
/// order of their numbers (the order a reading takes their names in).
fn outermost_notations(t : @kernel.Term) -> Array[Notation] {
  let found = []
  fn go(t : @kernel.Term) {
    match notation(t) {
      Some(n) => found.push(n)
      None =>
        match t {
          Comb(f, x) => {
            go(f)
            go(x)
          }
          Abs(_, b) => go(b)
          _ => ()
        }
    }
  }
  go(t)
  found.sort_by_key(n => n.number)
  found
}

///|
/// The comprehensions to write with their binders listed, where {e | p}
/// would do, so that reading the printed `t` numbers its GEN%PVAR names as
/// the quotation's reading did, taking `taken` names: None when none does.
///
/// A reading takes its names in order and a comprehension takes its own
/// last, so the comprehensions of a reading are read from where the one
/// before ends. {e | p} reads e twice and {e | vs | p} three times
/// (pgen_cost), the last reading of e ending where p's begins, so for k
/// earlier readings of e from `start`, start + (k + 1) * f(e) is where the
/// last ends.
fn listed_comprehensions(t : @kernel.Term, taken : Int) -> Array[String]? {
  let outer = outermost_notations(t)
  if outer.is_empty() {
    return Some([])
  }
  let end = outer[outer.length() - 1].number + 1
  let listed = []
  if read_names(t, end - taken, end, listed) {
    Some(listed)
  } else {
    None
  }
}

///|
/// Whether a reading of `t` from `start` to `end` (exclusive) numbers its
/// comprehensions as they are, adding to `listed` those to list.
fn read_names(
  t : @kernel.Term,
  start : Int,
  end : Int,
  listed : Array[String],
) -> Bool {
  let mut at = start
  for n in outermost_notations(t) {
    if !read_comprehension(n, at, listed) {
      return false
    }
    at = n.number + 1
  }
  at == end
}

///|
/// Whether the comprehension `n`, read from `start`, is numbered as it is.
fn read_comprehension(n : Notation, start : Int, listed : Array[String]) -> Bool {
  let inner = outermost_notations(n.e)
  if inner.is_empty() {
    // e takes no names: both forms read p from the start
    return read_names(n.p, start, n.number, listed)
  }
  let e_end = inner[inner.length() - 1].number + 1
  if !read_names(n.p, e_end, n.number, listed) {
    return false
  }
  let before = listed.length()
  let forms = match (n.implicit, n.listable) {
    (true, true) => [1, 2]
    (true, false) => [1]
    (false, _) => [2]
  }
  for k in forms {
    if e_end > start && (e_end - start) % (k + 1) == 0 {
      let size = (e_end - start) / (k + 1)
      if read_names(n.e, e_end - size, e_end, listed) {
        if k == 2 && n.implicit {
          listed.push(n.name)
        }
        return true
      }
      while listed.length() > before {
        listed.pop() |> ignore
      }
    }
  }
  false
}

///|
/// `{e | p}` when HOL's rule binds exactly `xs` (in order), else
/// `{e | x : A, y : B | p}`.
fn Printer::comprehension(
  self : Printer,
  g : @kernel.Term,
  scoped : Array[(@kernel.Term, @kernel.Term)],
  p : @kernel.Term,
  e : @kernel.Term,
  bound : Bound,
) -> String raise Unprintable {
  let xs = scoped.map(x => x.0)
  let mut inner = bound
  let binders = []
  let mut renamed = false
  for x in scoped {
    let (b, next) = self.bind(x.0, x.1, inner)
    if next.head() is Some((_, printed)) && x.0 is Var(n, _) && printed != n {
      renamed = true
    }
    binders.push(b)
    inner = next
  }
  if !renamed &&
    implicit_binders(e, p, inner) == xs &&
    !(g is Var(n, _) && self.listed.contains(n)) {
    // each binder is written with its type where it first occurs in e,
    // as {e | p} reads it (a symbolic one spelt op_)
    let inner = op_spelled(inner, xs.length(), [e, p])
    let marks = xs.mapi((i, x) => (x, bound.length() + i + 1))
    let typed_before = self.typed_free.length()
    self.untyped.append(marks)
    let e_s = self.term(e, EXPR, inner)
    let p_s = self.term(p, EXPR, inner)
    let unused = marks.filter(m => self.untyped.contains(m))
    for m in marks {
      match self.untyped.search(m) {
        Some(i) => self.untyped.remove(i) |> ignore
        None => ()
      }
    }
    // a binder that only an inner binding of the same variable shows would
    // read back with no type: write the binders out instead
    if !unused.is_empty() {
      // the free variables that attempt wrote with their type are written
      // with it again
      while self.typed_free.length() > typed_before {
        self.typed_free.pop() |> ignore
      }
      return "{" +
        self.term(e, EXPR, inner) +
        " | " +
        binders.join(", ") +
        " | " +
        self.term(p, EXPR, inner) +
        "}"
    }
    "{" + e_s + " | " + p_s + "}"
  } else {
    "{" +
    self.term(e, EXPR, inner) +
    " | " +
    binders.join(", ") +
    " | " +
    self.term(p, EXPR, inner) +
    "}"
  }
}

///|
/// `t` in the term syntax: `parse_term(print_term(t))` is `t` again, up to
/// the names of bound variables and invented type variables (`same_term`).
pub fn print_term(t : @kernel.Term) -> String raise Unprintable {
  print_term_with(t, sets=true)
}

///|
fn print_term_with(
  t : @kernel.Term,
  sets~ : Bool,
  listed? : Array[String] = [],
  exact? : Bool = false,
) -> String raise Unprintable {
  let vars = @basics.variables(t).to_array()
  let fixed = vars
    .map(v => @kernel.tyvars(@kernel.type_of(v)))
    .fold(init=@list.List([]), (acc, l) => acc.concat(l))
  // names chosen through the view the term syntax reads them with; the
  // readings are checked outside it (reads_as), under both resolutions
  fn print(overloads : Bool, all_constants : Bool) -> String raise Unprintable {
    let names = vars.map(v => if v is Var(n, _) { n } else { "" })
    with_fixed_interface(() => {
      {
        typed_free: [],
        fixed,
        all_constants,
        overloads,
        names,
        sets,
        listed,
        exact,
        untyped: [],
      }.term(
        t,
        EXPR,
        @list.List([]),
      )
    }) catch {
      Unprintable(_) as e => raise e
      e => raise Unprintable("term: " + e.to_string())
    }
  }
  // The most readable spelling that reads back as `t`: overloaded names
  // where they resolve to the same constants, and types only where the
  // variables' types do not pin a constant's type down (they do only where
  // they are connected to it, so the reading is checked).
  let mut first_error : Unprintable? = None
  let mut printed = false
  for overloads in [true, false] {
    for all_constants in [false, true] {
      let s = print(overloads, all_constants) catch {
        e => {
          if first_error is None {
            first_error = Some(e)
          }
          continue
        }
      }
      printed = true
      if reads_as(s, t) {
        return s
      }
    }
  }
  match first_error {
    Some(e) if !printed => raise e
    _ => raise Unprintable("term whose types the syntax cannot pin down")
  }
}

///|
/// n for an invented type variable `?n`.
fn invented_number(name : String) -> Int64 {
  let mut n = 0L
  for c in name[1:] {
    guard c is ('0'..='9') else { return -1L }
    n = n * 10L + (c.to_int() - '0'.to_int()).to_int64()
  }
  n
}

///|
/// `t` with its invented type variables (`?n`) renamed in the order
/// `type_vars_in_term` lists them (those numbered `from` or more): holes in
/// the text read back as fresh ones.
fn canonical_invented(t : @kernel.Term, from? : Int64 = 0L) -> @kernel.Term {
  let theta = []
  for ty in @kernel.type_vars_in_term(t) {
    if ty is Tyvar(name) &&
      name.has_prefix("?") &&
      invented_number(name) >= from {
      // not of the form ?k, which a type variable kept as it is may have
      theta.push((@kernel.mk_vartype("?\u{0}\{theta.length()}"), ty))
    }
  }
  @kernel.inst(@list.List(theta), t)
}

///|
/// Whether `a` and `b` are the same term up to the names of bound variables
/// and of invented type variables (the round trip of `print_term`).
pub fn same_term(a : @kernel.Term, b : @kernel.Term) -> Bool {
  @basics.aconv(canonical_invented(a), canonical_invented(b))
}

///|
/// The spelling of the quotation `old`, which denotes `t`, in the term
/// syntax: `print_term(t)`, when it reads back as `old` does with nothing
/// renamed, bound variables included (theorems show them), and takes as
/// many GEN%PVAR names (both readings start from the same counter), so
/// that later generated names do not move. Invented type variables may
/// differ in name. tools/migrate.mbtx migrates only such quotations, so the
/// theorems of a migrated package print as before.
pub fn spell_quotation(old : String, t : @kernel.Term) -> String raise Unprintable {
  // set notation, else the sets as written (GSPEC(...)), which an old
  // quotation may spell out. A comprehension whose element has one may be
  // written either way, numbering the GEN%PVAR names in it differently:
  // the forms the quotation's numbering shows are tried too.
  // the first form's failure says most (later forms are fallbacks)
  let mut error : Unprintable? = None
  let forms = [(true, [])]
  let taken = try @parser.reread_term(old).1 catch { _ => -1 }
  if listed_comprehensions(t, taken) is Some(listed) && !listed.is_empty() {
    forms.push((true, listed))
  }
  forms.push((false, []))
  let tried = []
  for form in forms {
    let (sets, listed) = form
    let s = print_term_with(t, sets~, listed~, exact=true) catch {
      e => {
        if error is None { error = Some(e) }
        continue
      }
    }
    if tried.contains(s) {
      continue
    }
    tried.push(s)
    check_spelling(old, s) catch {
      e => {
        if error is None { error = Some(e) }
        continue
      }
    }
    return s
  }
  raise error.unwrap_or(Unprintable("term"))
}

///|
/// Check that the term syntax `s` reads now exactly as the quotation `old`
/// does: the same term with nothing renamed, bound variables included, and
/// as many GEN%PVAR names taken (both readings start from the same
/// counter). Only type variables the readings themselves invent may
/// differ in name; one invented before (which the environment may share)
/// must be the same.
pub fn check_spelling(old : String, s : String) -> Unit raise Unprintable {
  // under the live interface and the fixed view alike (resolution.mbt)
  with_resolution(false, () => check_spelling_once(old, s)) catch {
    Unprintable(_) as e => raise e
    _ => raise Unprintable("term")
  }
  with_resolution(true, () => check_spelling_once(old, s)) catch {
    Unprintable(m) => raise Unprintable(m + " (names read context-free)")
    _ => raise Unprintable("term")
  }
}

///|
/// A type, briefly, for a diagnostic (a type variable after a quote).
fn brief_type(ty : @kernel.HolType) -> String {
  match ty {
    Tyvar(n) => "'" + n
    Tyapp(c, @list.Empty) => c
    Tyapp(c, args) => c + "(" + args.iter().map(brief_type).join(",") + ")"
  }
}

///|
/// Where the reading `b` of a spelling first departs from the quotation's
/// reading `a`, for a diagnostic.
fn difference(a : @kernel.Term, b : @kernel.Term) -> String {
  match (a, b) {
    (Var(n, s), Var(m, t)) =>
      if n != m {
        "variable \{n} read as \{m}"
      } else {
        "variable \{n} : \{brief_type(s)} read with type \{brief_type(t)}"
      }
    (Const(n, s), Const(m, t)) =>
      if n != m {
        "constant \{n} read as \{m}"
      } else {
        "constant \{n} : \{brief_type(s)} read with type \{brief_type(t)}"
      }
    (Comb(f, x), Comb(g, y)) => if f != g { difference(f, g) } else { difference(x, y) }
    (Abs(Var(v, s), x), Abs(Var(w, t), y)) =>
      if v != w {
        "bound variable \{v} read as \{w}"
      } else if s != t {
        "bound variable \{v} : \{brief_type(s)} read with type \{brief_type(t)}"
      } else {
        difference(x, y)
      }
    _ => "\{shape(a)} read as \{shape(b)}"
  }
}

///|
fn shape(t : @kernel.Term) -> String {
  match t {
    Var(n, _) => "variable " + n
    Const(n, _) => "constant " + n
    Comb(_, _) => "application"
    Abs(_, _) => "abstraction"
  }
}

///|
fn check_spelling_once(old : String, s : String) -> Unit raise Unprintable {
  let from = @preterm.type_var_counter()
  let (a, na) = @parser.reread_term(old) catch {
    _ => raise Unprintable("quotation that does not read back")
  }
  let (b, nb) = reread(s) catch {
    _ => raise Unprintable("term that does not read back")
  }
  let ca = canonical_invented(a, from~)
  let cb = canonical_invented(b, from~)
  if cb != ca {
    raise Unprintable("term that reads back differently: " + difference(ca, cb))
  }
  if na != nb {
    raise Unprintable(
      "term that takes \{nb} GEN%PVAR names where the quotation takes \{na}",
    )
  }
}

///|
/// `s` read now, without advancing the GEN%PVAR counter, and how many
/// GEN%PVAR names it took.
fn reread(s : String) -> (@kernel.Term, Int) raise {
  @parser.with_pgen_counter_restored(() => {
    let start = @parser.pgen_count()
    let t = elaborate(s)
    (t, @parser.pgen_count() - start)
  })
}

///|
fn reads_as(s : String, t : @kernel.Term) -> Bool {
  // under the live interface and the fixed view alike (resolution.mbt)
  try same_term(with_resolution(false, () => reread(s).0), t) &&
    same_term(with_resolution(true, () => reread(s).0), t) catch {
    _ => false
  }
}
