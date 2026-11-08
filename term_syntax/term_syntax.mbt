// HOL terms and types in a subset of MoonBit's syntax:
//
//   ∀ n : Num, n + 0 == n                    ∃ x : _, p(x) && q(x)
//   (x : Num) => x * 2                        if c { a } else { b }
//   f(x, y)   s.subset(t)   (a, b)   [a, b]   !p || q   p → q
//
// Binders take a type (`_` lets it be inferred). Names are HOL's: constants
// and variables by their own name, operators by their usual reading (`==`
// is `=`, `&&` is `/\`, `→` is `==>`, ...), so overloading works as in the
// quotation syntax. Types: `Bool`, `Num`, `List[A]`, `(A, B) -> C`, `(A, B)`;
// a name that is not a type constant is a type variable.
//
// Sets are written as in HOL's quotations (a deviation from MoonBit):
// `{a, b}`, `{}`, `{e | p}` (binding the variables free in both e and p,
// HOL's rule) and `{e | x : A, y : B | p}` (binding those listed). Unlike
// HOL, which drops the types in that list, the listed types are checked.
//
// Patterns are written as MoonBit's: `match e { 0 => a; SUC(n) if n > 1 =>
// b }` (HOL's match e with 0 -> a | SUC n when n > 1 -> b), `fn { 0 => a;
// SUC(n) => b }` (function 0 -> a | SUC n -> b), and over one pattern
// `fn { (a, b) => e }` (\(a,b). e) and `∀ (a, b) : (A, B), e`. Arms are
// separated by `;`; a newline is only whitespace.

///|
fn describe(e : @grammar.ParseError) -> String {
  match e {
    UnexpectedToken(tok, (start, _), _) =>
      "unexpected \{@debug.to_string(tok)} at offset \{start}"
    UnexpectedEndOfInput(pos, _) => "unexpected end of input at offset \{pos}"
  }
}

///|
fn binder_name(v : @preterm.Preterm) -> String {
  match v {
    Varp(n, _) => n
    Typing(x, _) => binder_name(x)
    _ => ""
  }
}

///|
fn rename_binder(v : @preterm.Preterm, n : String) -> @preterm.Preterm {
  match v {
    Varp(_, ty) => Varp(n, ty)
    Typing(x, pty) => Typing(rename_binder(x, n), pty)
    _ => v
  }
}

///|
/// Whether a binder is a variable (with any type annotations), not a
/// pattern.
fn is_variable_binder(v : @preterm.Preterm) -> Bool {
  match v {
    Varp(_, _) => true
    Typing(x, _) => is_variable_binder(x)
    _ => false
  }
}

///|
/// Whether a variable named `n` would be read as a constant: the name of
/// one, or an interface name (`exists`, `+`, ...).
fn names_constant(n : String) -> Bool {
  (try @kernel.get_const_type(n) catch { _ => None } noraise { _ => Some(()) })
  is Some(_) ||
  @printer.the_interface.val.iter().any(e => e.0 == n)
}

///|
/// The name a binder `n` is elaborated under: under `binder_alias` if it
/// names a constant or is an interface name, which it shadows in its scope,
/// as a local binding shadows a global name in MoonBit; else its own.
fn binder_rename(n : String) -> String {
  // a binder named like a constant binds a variable, as in HOL, under an
  // alias named back after elaboration (binder_alias); in its scope the
  // name means the binder. Truth and falsity, written true and false,
  // elaborate to the constants themselves, so T and F are never shadowed
  if n == "T" || n == "F" || names_constant(n) {
    binder_alias + n
  } else {
    n
  }
}

///|
/// How many GEN%PVAR names HOL's parser takes reading the quotation `t`
/// stands for (a preterm with set marks). Reading `{e | p}`, it first tries
/// `{a, b, ...}`, which reads `e` and fails at `|`, so it reads `e` twice;
/// reading `{e | vs | p}`, it also tries `{e | p}` first, reading `e` three
/// times (and `vs`, binders here, twice). Its readings are not undone, so
/// each takes the names of the comprehensions in it; the last is kept.
/// The term syntax skips the names of the readings before the last, so
/// that the two syntaxes number GEN%PVAR alike.
fn pgen_cost(t : @preterm.Preterm) -> Int {
  match t {
    // a pattern-match arm takes two (pmk_pattern), after its parts
    Combp(Combp(Combp(Varp(m, _), pat), when_), body) if m ==
      @grammar.clause_mark => 2 + pgen_cost(pat) + pgen_cost(when_) + pgen_cost(body)
    Combp(Combp(Varp(m, _), e), p) if m == @grammar.set_abs_mark =>
      2 * pgen_cost(e) + pgen_cost(p) + 1
    Combp(Varp(m, _), binders) if m == @grammar.set_compr_mark => {
      let mut b = binders
      while b is Absp(_, body) {
        b = body
      }
      match b {
        Combp(Combp(Varp(_, _), e), p) => 3 * pgen_cost(e) + pgen_cost(p) + 1
        _ => 0
      }
    }
    Combp(f, x) => pgen_cost(f) + pgen_cost(x)
    Absp(v, b) => pgen_cost(v) + pgen_cost(b)
    Typing(x, _) => pgen_cost(x)
    Varp(_, _) | Constp(_, _) => 0
  }
}

///|
/// A pattern resolved, the variables it binds (as HOL's pfrees lists them)
/// and `bound` with them. Those are
/// the ones HOL's parser gives it: the free variables (pfrees) of the
/// pattern read with nothing in scope, which name no constant (a lambda
/// inside the pattern binds its own). Each is bound under every spelling
/// the pattern writes it with (op_dollar_dollar for $$). Any other name in
/// the pattern, such as a constant's, is read as HOL's elaboration reads
/// it: in a match's clause, in `bound` (an enclosing binder renamed from T
/// to T' binds T); in a lambda or quantifier over a pattern, with nothing
/// in scope (T is the constant).
fn resolve_pattern(
  pat : @preterm.Preterm,
  bound : @list.List[(String, String)],
  enclosing~ : Bool,
) -> (
  @preterm.Preterm,
  @list.List[@preterm.Preterm],
  @list.List[(String, String)],
) raise {
  // read once without taking GEN%PVAR names, to find what it binds
  let frees = @parser.with_pgen_counter_restored(() => {
    @parser.pfrees(resolve_names(pat, @list.List([])))
  })
  let names = frees.map(v => if v is Varp(n, _) { n } else { "" })
  let own = []
  fn go(t : @preterm.Preterm) {
    match t {
      Varp(n, _) =>
        if !n.has_prefix(@grammar.generated_mark) {
          let r = if @printer.the_interface.val.iter().any(e => e.0 == n) {
            n
          } else {
            @grammar.unescape(n)
          }
          if names.contains(r) && !own.contains((n, r)) {
            own.push((n, r))
          }
        }
      Constp(_, _) => ()
      Combp(f, x) => {
        go(f)
        go(x)
      }
      Absp(v, b) => {
        go(v)
        go(b)
      }
      Typing(x, _) => go(x)
    }
  }

  go(pat)
  fn with_own(b : @list.List[(String, String)]) {
    own.fold(init=b, (b, v) => b.prepend(v))
  }

  let scope = if enclosing { bound } else { @list.List([]) }
  (resolve_names(pat, with_own(scope)), frees, with_own(bound))
}

///|
/// Resolve names: a constant the syntax stands for (`true`, `&&`, ...)
/// drops its mark; an identifier a binder in scope binds is that variable;
/// any other identifier is read through the spellings of symbolic constants
/// (`select`, `op_plus`, ...). A binder named like a constant is renamed with primes, with the
/// identifiers it binds, so that the elaboration can neither read it as the
/// constant nor capture a constant with it.
fn resolve_names(
  t : @preterm.Preterm,
  bound : @list.List[(String, String)],
) -> @preterm.Preterm raise {
  match t {
    // a set comprehension is elaborated as HOL's parser does (GEN%PVAR
    // binder, the variables it binds), which needs the names resolved
    Combp(Combp(Varp(m, _), e), p) if m == @grammar.set_abs_mark => {
      @parser.skip_pgenvars(pgen_cost(e))
      setabs(resolve_names(e, bound), resolve_names(p, bound))
    }
    Combp(Varp(m, _), binders) if m == @grammar.set_compr_mark => {
      let vs = []
      let mut b = binders
      let mut bound = bound
      while b is Absp(v, body) {
        let n = binder_name(v)
        let renamed = binder_rename(n)
        vs.push(rename_binder(v, renamed))
        bound = bound.prepend((n, renamed))
        b = body
      }
      guard b is Combp(Combp(Varp(_, _), e), p) else {
        raise Failure("term syntax: malformed set comprehension")
      }
      @parser.skip_pgenvars(2 * pgen_cost(e))
      @parser.pmk_setcompr(
        resolve_names(e, bound),
        @list.List(vs),
        resolve_names(p, bound),
      )
    }
    // a pattern-match arm is HOL's clause (pmk_pattern), which needs the
    // names resolved: the pattern, its guard and its body, in the order
    // HOL's parser reads them, then the clause's GEN%PVAR names
    Combp(Combp(Combp(Varp(m, _), pat), when_), body) if m ==
      @grammar.clause_mark => {
      let (p, vs, inner) = resolve_pattern(pat, bound, enclosing=true)
      let tests = match when_ {
        Varp(g, _) if g == @grammar.no_guard_mark => @list.List([])
        _ => @list.singleton(resolve_names(when_, inner))
      }
      // the clause binds the variables HOL's parser finds in the pattern,
      // whatever names the resolution gave the rest (a binder renamed
      // because it is named like a constant)
      @parser.pmk_pattern_binding(((p, tests), resolve_names(body, inner)), () => vs)
    }
    // truth and falsity are the constants themselves, so that a binder
    // named T or F (which HOL allows) cannot capture them
    Varp(n, _) if n == @grammar.generated_mark + "T" ||
      n == @grammar.generated_mark + "F" =>
      Constp(n[@grammar.generated_mark.length():].to_owned(), @preterm.Ptycon("bool", @list.List([])))
    Varp(n, ty) if n.has_prefix(@grammar.generated_mark) =>
      Varp(n[@grammar.generated_mark.length():].to_owned(), ty)
    Varp(n, ty) =>
      match bound.iter().find_first(b => b.0 == n) {
        Some((_, renamed)) => Varp(renamed, ty)
        // the spellings of symbolic constants: select, op_plus, ...; an
        // interface name means what the interface says
        None =>
          Varp(
            if @printer.the_interface.val.iter().any(e => e.0 == n) {
              n
            } else {
              @grammar.unescape(n)
            },
            ty,
          )
      }
    Constp(_, _) => t
    Combp(f, x) => Combp(resolve_names(f, bound), resolve_names(x, bound))
    // a lambda or quantifier over a pattern: elaboration makes it HOL's
    // generalized abstraction (GABS)
    Absp(v, b) if !is_variable_binder(v) => {
      let (p, _, inner) = resolve_pattern(v, bound, enclosing=false)
      Absp(p, resolve_names(b, inner))
    }
    Absp(v, b) => {
      let n = binder_name(v)
      let renamed = binder_rename(n)
      Absp(
        rename_binder(v, renamed),
        resolve_names(b, bound.prepend((n, renamed))),
      )
    }
    Typing(x, ty) => Typing(resolve_names(x, bound), ty)
  }
}

///|
fn check_semantics() -> Unit raise {
  match @grammar.take_error() {
    Some(msg) => raise Failure("term syntax: " + msg)
    None => ()
  }
}

///|
/// The preterm of `s`, before elaboration.
pub fn parse_preterm(s : String) -> @preterm.Preterm raise {
  parse_preterm_under(s, @list.List([]))
}

///|
/// The preterm of `s` with the names in `bound` resolved as binders around
/// it would resolve them.
fn parse_preterm_under(
  s : String,
  bound : @list.List[(String, String)],
) -> @preterm.Preterm raise {
  let toks = tokens(s)
  ignore(@grammar.take_error())
  let ptm = @grammar.term(toks) catch {
    e => raise Failure("term syntax: " + describe(e))
  }
  check_semantics()
  resolve_names(ptm, bound)
}

///|
/// HOL's `{e | p}` (@parser.pmk_setabs) over resolved preterms: it binds
/// the variables free in both, or all those of `e` when it has at most one
/// or `p` has none, and a constant's name, such as T, is no variable there
/// (HOL reads it as the constant's, even under a binder), so the aliased
/// ones are counted under their own names.
fn setabs(
  e : @preterm.Preterm,
  p : @preterm.Preterm,
) -> @preterm.Preterm raise {
  let fvs = @parser.pfrees(unalias_preterm(e))
  let bvs = @parser.pfrees(unalias_preterm(p))
  let evs = if fvs.length() <= 1 || bvs.is_empty() {
    fvs
  } else {
    fvs.filter(v => bvs.contains(v))
  }
  @parser.pmk_setcompr(e, evs, p)
}

///|
/// `t` with the binders elaborated under `binder_alias` named back.
fn unalias_preterm(t : @preterm.Preterm) -> @preterm.Preterm {
  match t {
    Varp(n, ty) if n.has_prefix(binder_alias) =>
      Varp(n[binder_alias.length():].to_owned(), ty)
    Varp(_, _) | Constp(_, _) => t
    Combp(f, x) => Combp(unalias_preterm(f), unalias_preterm(x))
    Absp(v, b) => Absp(unalias_preterm(v), unalias_preterm(b))
    Typing(x, ty) => Typing(unalias_preterm(x), ty)
  }
}

///|
/// The prefix a binder named like a constant (T, F, I, ...) is elaborated
/// under, so that typing reads it as the variable it is (the preterm typing
/// would read the name as the constant and drop the binder's annotation);
/// `elaborate` names it back.
let binder_alias = "\u{1}"

///|
/// `t` with the variables elaborated under `binder_alias` named back. A
/// binder's occurrences are named back by substitution (vsubst), which
/// renames a binder in its scope that would capture them: one elaboration
/// generated (GABS binds `f`, fresh only against the alias) and named like
/// the restored binder. No free variable in `t` is named like a constant
/// (the syntax reads such a free name as the constant).
fn unalias_binders(t : @kernel.Term) -> @kernel.Term raise {
  match t {
    Var(n, ty) if n.has_prefix(binder_alias) =>
      @kernel.mk_var(n[binder_alias.length():].to_owned(), ty)
    Var(_, _) | Const(_, _) => t
    Comb(f, x) => @kernel.mk_comb(unalias_binders(f), unalias_binders(x))
    Abs(Var(n, ty) as v, b) if n.has_prefix(binder_alias) => {
      let real = @kernel.mk_var(n[binder_alias.length():].to_owned(), ty)
      @kernel.mk_abs(real, unalias_binders(@kernel.vsubst(@list.List([(real, v)]), b)))
    }
    Abs(v, b) => @kernel.mk_abs(unalias_binders(v), unalias_binders(b))
  }
}

///|
/// The HOL term `s` denotes.
pub fn parse_term(s : String) -> @kernel.Term raise {
  @parser.record_quotation(s)
  elaborate(s)
}

///|
/// The term `s` denotes, without recording it as a quotation.
fn elaborate(s : String) -> @kernel.Term raise {
  // names are read through the fixed view of the interface when it is on
  // (resolution.mbt)
  fn go() -> @kernel.Term raise {
    unalias_binders(
      @preterm.term_of_preterm(
        @preterm.retypecheck(@list.List([]), parse_preterm(s)),
      ),
    )
  }
  if fixed_resolution.val {
    with_fixed_interface(go)
  } else {
    go()
  }
}

///|
/// The HOL type `s` denotes, recorded as a type quotation (`:s`).
pub fn parse_type(s : String) -> @kernel.HolType raise {
  @parser.record_quotation(":" + s)
  let toks = tokens(s)
  ignore(@grammar.take_error())
  let pty = @grammar.pretype(toks) catch {
    e => raise Failure("term syntax: " + describe(e))
  }
  check_semantics()
  if pty == @preterm.dpty {
    raise Failure("term syntax: _ alone is not a type")
  }
  @preterm.type_of_pretype(pty)
}

///|
/// The inductive types the enums `s` define, as ind_types' define_type
/// takes them: `enum Tree { Leaf(Num); Node(Tree, Tree) }` defines tree,
/// with a constructor `Leaf` from num and `Node` from two trees. Each type
/// is given as the type variable named as the HOL type (`Tree` is tree), by
/// which its constructors' arguments refer to it. A name between backticks
/// is the HOL name verbatim, for one that starts with a capital: enum `Term`
/// defines Term, which its constructors call `Term`.
pub fn parse_type_definition(
  s : String,
) -> @list.List[
  (@kernel.HolType, @list.List[(String, @list.List[@kernel.HolType])]),
] raise {
  let toks = tokens(s)
  // the enums' names, which their constructors refer to the types by
  let spellings = []
  for i in 0..<(toks.length() - 1) {
    match (toks[i].0, toks[i + 1].0) {
      (ENUM, UIDENT(name)) => spellings.push(name)
      (ENUM, VERBATIM(name)) => spellings.push("`" + name + "`")
      _ => ()
    }
  }
  ignore(@grammar.take_error())
  let enums = @grammar.with_defined_types(spellings, () => {
    @grammar.type_definition(toks) catch {
      e => raise Failure("term syntax: " + describe(e))
    }
  })
  check_semantics()
  // a type being defined reads as a type variable of its own
  let defined = enums.map(e => (
    @kernel.mk_vartype(e.0),
    @kernel.mk_vartype(e.1),
  ))
  enums.map(e => (
    @kernel.mk_vartype(e.0),
    e.2.map(c => (
      c.0,
      c.1.map(pty => @kernel.type_subst(defined, @preterm.type_of_pretype(pty))),
    )),
  ))
}

///|
/// The record type the struct `s` defines, as Library/records'
/// define_record_type takes it: `struct Point { x : Num; y : Num }` is the
/// type point with fields x and y of type num.
pub fn parse_record_definition(
  s : String,
) -> (String, @list.List[(String, @kernel.HolType)]) raise {
  let toks = tokens(s)
  let spellings = if toks is [(STRUCT, _, _), (UIDENT(name), _, _), ..] {
    [name]
  } else {
    []
  }
  ignore(@grammar.take_error())
  let (name, marker, fields) = @grammar.with_defined_types(spellings, () => {
    @grammar.record_definition(toks) catch {
      e => raise Failure("term syntax: " + describe(e))
    }
  })
  check_semantics()
  // the record's own type reads as a type variable, as enums' do
  let defined = @list.List([(@kernel.mk_vartype(name), @kernel.mk_vartype(marker))])
  (
    name,
    fields.map(f => (
      f.0,
      @kernel.type_subst(defined, @preterm.type_of_pretype(f.1)),
    )),
  )
}

///|
/// The term `s` denotes where the variables `env` names have the types it
/// gives them, and of type `ty` when given: Library/q.ml reads its
/// quotations so, in a goal's context. The context's variables are named
/// as binders around `s` would be, so one named like a constant (`select`)
/// means the variable. Not recorded as a quotation.
pub fn parse_term_in_context(
  env : @list.List[(String, @preterm.Pretype)],
  s : String,
  ty? : @preterm.Pretype,
) -> @kernel.Term raise {
  let bound = env.map(p => (p.0, binder_rename(p.0)))
  let env = env.map(p => (binder_rename(p.0), p.1))
  fn go() -> @kernel.Term raise {
    let ptm = parse_preterm_under(s, bound)
    let ptm = match ty {
      Some(ty) => @preterm.Preterm::Typing(ptm, ty)
      None => ptm
    }
    unalias_binders(@preterm.term_of_preterm(@preterm.retypecheck(env, ptm)))
  }
  if fixed_resolution.val {
    with_fixed_interface(go)
  } else {
    go()
  }
}
