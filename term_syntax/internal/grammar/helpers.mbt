// The preterms the grammar's actions build. Names are HOL's interface
// names, so overloading (`+` on num, int and real, ...) is resolved by the
// usual elaboration (@preterm.retypecheck).

///|
/// An identifier the term spells.
fn pvar(name : String) -> @preterm.Preterm {
  @preterm.Varp(name, @preterm.dpty)
}

///|
/// The prefix of a constant the syntax itself stands for (`true`, `&&`,
/// `if`, ...): no binder captures it, and the name resolution
/// (@term_syntax.parse_preterm) removes it.
pub let generated_mark : String = "\u{1}"

///|
fn pconst(name : String) -> @preterm.Preterm {
  @preterm.Varp(generated_mark + name, @preterm.dpty)
}

///|
let semantic_error : Ref[String?] = Ref::{ val: None }

///|
/// Record that the input has no meaning; the parse reports the first one.
fn reject(msg : String) -> Unit {
  if semantic_error.val is None {
    semantic_error.val = Some(msg)
  }
}

///|
/// The first error recorded since the last call, if any.
pub fn take_error() -> String? {
  let e = semantic_error.val
  semantic_error.val = None
  e
}

///|
fn apply(f : @preterm.Preterm, x : @preterm.Preterm) -> @preterm.Preterm {
  @preterm.Combp(f, x)
}

///|
fn applies(
  f : @preterm.Preterm,
  args : @list.List[@preterm.Preterm],
) -> @preterm.Preterm {
  args.fold(init=f, apply)
}

///|
fn binary(
  op : String,
  lhs : @preterm.Preterm,
  rhs : @preterm.Preterm,
) -> @preterm.Preterm {
  apply(apply(pconst(op), lhs), rhs)
}

///|
fn comparison(
  op : String,
  lhs : @preterm.Preterm,
  rhs : @preterm.Preterm,
) -> @preterm.Preterm {
  match op {
    "==" => binary("=", lhs, rhs)
    "!=" => apply(pconst("~"), binary("=", lhs, rhs))
    _ => binary(op, lhs, rhs)
  }
}

///|
fn infix3(
  op : String,
  lhs : @preterm.Preterm,
  rhs : @preterm.Preterm,
) -> @preterm.Preterm {
  match op {
    "/" => binary("/", lhs, rhs)
    _ => {
      reject("operator " + op + " has no HOL meaning")
      lhs
    }
  }
}

///|
fn typed(tm : @preterm.Preterm, ty : @preterm.Pretype) -> @preterm.Preterm {
  if ty == @preterm.dpty {
    tm
  } else {
    @preterm.Typing(tm, ty)
  }
}

///|
fn quantify(
  q : String,
  name : String,
  ty : @preterm.Pretype,
  body : @preterm.Preterm,
) -> @preterm.Preterm {
  apply(pconst(q), @preterm.Absp(typed(pvar(name), ty), body))
}

///|
fn lambdas(
  params : @list.List[(String, @preterm.Pretype?)],
  body : @preterm.Preterm,
) -> @preterm.Preterm {
  params
  .rev()
  .fold(init=body, (b, p) => {
    let v = match p.1 {
      Some(ty) => typed(pvar(p.0), ty)
      None => pvar(p.0)
    }
    @preterm.Absp(v, b)
  })
}

///|
fn cond(
  c : @preterm.Preterm,
  a : @preterm.Preterm,
  b : @preterm.Preterm,
) -> @preterm.Preterm {
  applies(pconst("COND"), @list.List([c, a, b]))
}

///|
fn tuple(es : @list.List[@preterm.Preterm]) -> @preterm.Preterm {
  let es = es.to_array()
  let mut t = es[es.length() - 1]
  for i = es.length() - 2; i >= 0; i = i - 1 {
    t = binary(",", es[i], t)
  }
  t
}

///|
fn list(es : @list.List[@preterm.Preterm]) -> @preterm.Preterm {
  es.rev().fold(init=pconst("NIL"), (t, e) => binary("CONS", e, t))
}

///|
/// A MoonBit type name as a HOL type: `Bool`, `Num`, `List[A]` name the HOL
/// types bool, num and list (a type constant whose name is capitalised is
/// written as it is); any other name is a type variable.
fn named_type(
  name : String,
  args : @list.List[@preterm.Pretype],
) -> @preterm.Pretype {
  // HOL's unit type is called 1
  if name == "Unit" && (try @kernel.get_type_arity("unit") catch { _ => -1L }) < 0L {
    return @preterm.Ptycon("1", check_arity("1", args))
  }
  let chars = name.to_array()
  let lower = chars[0].to_string().to_lower() +
    String::from_array(chars[1:])
  // `Num` is num; a type constant whose name is capitalised already is
  // written as it is
  let lower = if (try @kernel.get_type_arity(lower) catch { _ => -1L }) < 0L &&
    (try @kernel.get_type_arity(name) catch { _ => -1L }) >= 0L {
    name
  } else {
    lower
  }
  let arity = @kernel.get_type_arity(lower) catch { _ => -1L }
  if arity >= 0L {
    if arity != args.length().to_int64() {
      reject("type " + name + " takes \{arity} arguments")
    }
    @preterm.Ptycon(lower, args.map(fill_hole))
  } else if args.is_empty() {
    @preterm.Utv(name)
  } else {
    reject("unknown type " + name)
    @preterm.Utv(name)
  }
}

///|
/// A numeral `n` as a type: HOL's finite type of n elements, 1 for 1 and
/// tybit0/tybit1 of n / 2 for an even/odd n above it, as in `Cart[Real, 3]`.
fn finite_type(n : String) -> @preterm.Pretype {
  fn go(n : BigInt) -> @preterm.Pretype {
    if n == 1 {
      @preterm.Ptycon("1", @list.List([]))
    } else {
      let c = if n % 2 == 0 { "tybit0" } else { "tybit1" }
      @preterm.Ptycon(c, @list.singleton(go(n / 2)))
    }
  }

  let n = BigInt::from_string(n)
  if n < 1 {
    reject("no type has \{n} elements")
    return @preterm.Ptycon("1", @list.List([]))
  }
  go(n)
}

///|
fn check_arity(
  name : String,
  args : @list.List[@preterm.Pretype],
) -> @list.List[@preterm.Pretype] {
  if !args.is_empty() {
    abort("type " + name + " takes no arguments")
  }
  args
}

///|
/// `_` inside a type is a fresh type variable for elaboration to solve (one
/// it cannot solve becomes an invented `?n`, as in quotations).
fn fill_hole(ty : @preterm.Pretype) -> @preterm.Pretype {
  if ty == @preterm.dpty {
    @preterm.new_type_var()
  } else {
    ty
  }
}

///|
fn tuple_type(tys : @list.List[@preterm.Pretype]) -> @preterm.Pretype {
  let tys = tys.to_array().map(fill_hole)
  let mut t = tys[tys.length() - 1]
  for i = tys.length() - 2; i >= 0; i = i - 1 {
    t = @preterm.Ptycon("prod", @list.List([tys[i], t]))
  }
  t
}

///|
fn fun_type(
  args : @list.List[@preterm.Pretype],
  res : @preterm.Pretype,
) -> @preterm.Pretype {
  args
  .rev()
  .fold(init=fill_hole(res), (t, a) => {
    @preterm.Ptycon("fun", @list.List([fill_hole(a), t]))
  })
}

///|
/// `{a, b, c}`: HOL's set enumeration, INSERT a (INSERT b (INSERT c EMPTY)).
fn set_enum(es : @list.List[@preterm.Preterm]) -> @preterm.Preterm {
  es.rev().fold(init=pconst("EMPTY"), (t, e) => binary("INSERT", e, t))
}

///|
/// The marks of set comprehensions, which the name resolution
/// (@term_syntax.parse_preterm) elaborates as HOL's parser does, once the
/// names in them are resolved.
pub let set_abs_mark : String = generated_mark + "{|}"

///|
pub let set_compr_mark : String = generated_mark + "{||}"

///|
/// `{e | p}`: the set of the values of `e` for the variables free in both
/// (HOL's rule).
fn set_abs(e : @preterm.Preterm, p : @preterm.Preterm) -> @preterm.Preterm {
  apply(apply(@preterm.Varp(set_abs_mark, @preterm.dpty), e), p)
}

///|
/// `{e | x : A, y : B | p}`: the set of the values of `e` for the variables
/// listed, marked as set_compr_mark applied to \x y. (e, p) (the pair as
/// set_abs_mark e p), so that the name resolution scopes the binders.
fn set_compr(
  e : @preterm.Preterm,
  vs : @list.List[(String, @preterm.Pretype)],
  p : @preterm.Preterm,
) -> @preterm.Preterm {
  let inner = apply(apply(@preterm.Varp(set_abs_mark, @preterm.dpty), e), p)
  apply(
    @preterm.Varp(set_compr_mark, @preterm.dpty),
    vs
    .rev()
    .fold(init=inner, (b, v) => @preterm.Absp(typed(pvar(v.0), v.1), b)),
  )
}

///|
/// `∀ p : A, e` for a pattern `p` such as `(a, b)`: HOL's quantifier over a
/// generalized abstraction (forall (a,b). e), which elaboration builds.
fn quantify_pattern(
  q : String,
  pat : @preterm.Preterm,
  ty : @preterm.Pretype,
  body : @preterm.Preterm,
) -> @preterm.Preterm {
  check_binds(pat)
  apply(pconst(q), @preterm.Absp(typed(pat, ty), body))
}

///|
/// Reject a lambda's or quantifier's pattern that is a constant alone
/// (`true`, `0`, any annotated): it would bind nothing.
fn check_binds(pat : @preterm.Preterm) -> Unit {
  let mut bare = pat
  while bare is Typing(x, _) {
    bare = x
  }
  if bare is Varp(n, _) &&
    (n.has_prefix(generated_mark) || n.iter().all(c => c is ('0'..='9'))) {
    reject("a lambda or quantifier over a constant alone binds no variable")
  }
}

///|
/// The mark of a pattern-match arm, `clause_mark` applied to its pattern,
/// its guard (`no_guard_mark` for none) and its body, which the name
/// resolution (@term_syntax.parse_preterm) turns into HOL's clause (GEQ,
/// _UNGUARDED_PATTERN or _GUARDED_PATTERN, the pattern's variables bound)
/// once the names in it are resolved, as HOL's parser does.
pub let clause_mark : String = generated_mark + "=>"

///|
pub let no_guard_mark : String = generated_mark + "no guard"

///|
fn clause(
  pat : @preterm.Preterm,
  when_ : @preterm.Preterm?,
  body : @preterm.Preterm,
) -> @preterm.Preterm {
  let g = match when_ {
    Some(g) => g
    None => @preterm.Varp(no_guard_mark, @preterm.dpty)
  }
  applies(@preterm.Varp(clause_mark, @preterm.dpty), @list.List([pat, g, body]))
}

///|
/// HOL's _SEQPATTERN of the arms, nested to the right.
fn seq_patterns(arms : @list.List[@preterm.Preterm]) -> @preterm.Preterm {
  let arms = arms.to_array()
  let mut t = arms[arms.length() - 1]
  for i = arms.length() - 2; i >= 0; i = i - 1 {
    t = binary("_SEQPATTERN", arms[i], t)
  }
  t
}

///|
/// `fn { p => e }`, one arm with no guard, is the lambda over the pattern
/// `p` (HOL's \(a,b). e); any other `fn { ... }` is a function by cases
/// (HOL's function p -> e | ...).
fn function(arms : @list.List[@preterm.Preterm]) -> @preterm.Preterm {
  match arms {
    More(Combp(Combp(Combp(Varp(m, _), pat), Varp(g, _)), body), tail=Empty) if m ==
      clause_mark &&
      g == no_guard_mark => {
      check_binds(pat)
      @preterm.Absp(pat, body)
    }
    _ => apply(pconst("_FUNCTION"), seq_patterns(arms))
  }
}

///|
/// `match e { ... }`: HOL's match e with ...
fn match_cases(
  e : @preterm.Preterm,
  arms : @list.List[@preterm.Preterm],
) -> @preterm.Preterm {
  apply(apply(pconst("_MATCH"), e), seq_patterns(arms))
}
