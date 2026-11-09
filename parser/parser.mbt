// ===========================================================================
// Type and preterm parsers (parser.ml), built from the same combinators as
// upstream so that backtracking (and the side effects of the actions it
// re-runs, such as `pgenvar`) behaves identically.
// ===========================================================================

///|
using @parserutil {
  alt,
  seq,
  many,
  map,
  fix,
  listof,
  nothing,
  elistof,
  possibly,
  a,
}

///|
using @kernel {type Term, type HolType}

///|
using @preterm {
  type Preterm,
  type Pretype,
  pfrees,
  pmk_setcompr,
  pmk_setabs,
  pmk_pattern_binding,
}

///|
using @lexer {type Lexcode}

///|
type Toks = ArrayView[Lexcode]

///|
fn init {
  // "," is needed for set enumerations and is not a reserved word.
  @printer.parse_as_infix(",", (14, "right"))
}

///|
fn res(s : String) -> (Toks) -> (Lexcode, Toks) raise {
  a(Resword(s))
}

///|
fn idt(s : String) -> (Toks) -> (Lexcode, Toks) raise {
  a(Ident(s))
}

// ---------------------------------------------------------------------------
// Pretypes.
//
// TYPE        :: SUMTYPE -> TYPE | SUMTYPE
// SUMTYPE     :: PRODTYPE + SUMTYPE | PRODTYPE
// PRODTYPE    :: POWTYPE # PRODTYPE | POWTYPE
// POWTYPE     :: APPTYPE ^ POWTYPE | APPTYPE
// APPTYPE     :: ATOMICTYPES type-constructor | ATOMICTYPES
// ATOMICTYPES :: type-constructor | type-variable | ( TYPE ) | ( TYPELIST )
// ---------------------------------------------------------------------------

///|
fn mk_prefinty(n : @num.Num) -> Pretype raise {
  if !@num.is_integer_num(n) || n < @num.num_1 {
    raise Failure("mk_prefinty")
  }
  fn go(n : @num.Num) -> Pretype raise {
    if n == @num.num_1 {
      @preterm.Ptycon("1", @list.List([]))
    } else {
      let c = if @num.mod_num(n, @num.num_2) == @num.num_0 {
        "tybit0"
      } else {
        "tybit1"
      }
      @preterm.Ptycon(c, @list.singleton(go(@num.quo_num(n, @num.num_2))))
    }
  }

  go(n)
}

///|
fn btyop(n : String) -> (Lexcode, Pretype, Pretype) -> Pretype raise {
  (_, x, y) => @preterm.Ptycon(n, @list.List([x, y]))
}

///|
fn mk_apptype(p : (List[Pretype], List[String])) -> Pretype raise {
  match p {
    (More(s, tail=Empty), Empty) => s
    (tys, More(c, tail=Empty)) => @preterm.Ptycon(c, tys)
    _ => raise Failure("Bad type construction")
  }
}

///|
fn type_atom(input : Toks) -> (Pretype, Toks) raise {
  match input {
    [Ident(s), .. rest] => {
      let pty = @preterm.pretype_of_type(@lib.assoc(s, @preterm.type_abbrevs())) catch {
        Failure(_) =>
          mk_prefinty(@num.num_of_string(s)) catch {
            Failure(_) => {
              let nullary = try @kernel.get_type_arity(s) == 0 catch {
                Failure(_) => false
                e => raise e
              }
              if nullary {
                @preterm.Ptycon(s, @list.List([]))
              } else {
                @preterm.Utv(s)
              }
            }
            e => raise e
          }
        e => raise e
      }
      (pty, rest)
    }
    _ => raise @parserutil.Noparse
  }
}

///|
fn type_constructor(input : Toks) -> (String, Toks) raise {
  match input {
    [Ident(s), .. rest] => {
      let ok = try @kernel.get_type_arity(s) > 0 catch {
        Failure(_) => false
        e => raise e
      }
      if ok {
        (s, rest)
      } else {
        raise @parserutil.Noparse
      }
    }
    _ => raise @parserutil.Noparse
  }
}

///|
/// Parse a pretype from tokens.
pub fn parse_pretype(i : Toks) -> (Pretype, Toks) raise {
  rightbin(sumtype, res("->"), btyop("fun"), "proper use of type operator (->)")(
    i,
  )
}

///|
fn sumtype(i : Toks) -> (Pretype, Toks) raise {
  rightbin(prodtype, idt("+"), btyop("sum"), "proper use of type operator (+)")(
    i,
  )
}

///|
fn prodtype(i : Toks) -> (Pretype, Toks) raise {
  rightbin(carttype, idt("#"), btyop("prod"), "proper use of type operator (#)")(
    i,
  )
}

///|
fn carttype(i : Toks) -> (Pretype, Toks) raise {
  leftbin(apptype, idt("^"), btyop("cart"), "proper use of type operator (^)")(
    i,
  )
}

///|
fn apptype(i : Toks) -> (Pretype, Toks) raise {
  map(
    seq(
      atomictypes,
      alt(map(type_constructor, x => @list.singleton(x)), t => nothing(t)),
    ),
    mk_apptype,
  )(i)
}

///|
fn atomictypes(i : Toks) -> (List[Pretype], Toks) raise {
  alt(
    map(seq(seq(res("("), typelist), res(")")), r => r.0.1),
    map(type_atom, x => @list.singleton(x)),
  )(i)
}

///|
fn typelist(i : Toks) -> (List[Pretype], Toks) raise {
  listof(parse_pretype, idt(","), "comma separated list for type constructor")(
    i,
  )
}

// ---------------------------------------------------------------------------
// Preterm construction helpers.
// ---------------------------------------------------------------------------

///|
let dpty : Pretype = @preterm.dpty

///|
fn pv(s : String) -> Preterm {
  @preterm.Varp(s, dpty)
}

///|
fn pairwise(
  r : (Preterm, Preterm) -> Bool raise,
  l : List[Preterm],
) -> Bool raise {
  let mut l = l
  while l is More(h, tail=t) {
    if !@lib.forall(x => r(h, x), t) {
      return false
    }
    l = t
  }
  true
}

///|
fn pdest_eq(p : Preterm) -> (Preterm, Preterm) raise {
  match p {
    @preterm.Combp(@preterm.Combp(@preterm.Varp("=" | "<=>", _), l), r) =>
      (l, r)
    _ => raise @lib.MatchFailure("parser.ml: pdest_eq")
  }
}

///|
fn pmk_let(letbindings : List[Preterm], body : Preterm) -> Preterm raise {
  let (vars, tms) = @lib.unzip(@lib.map(pdest_eq, letbindings))
  @lib.warn(
    !pairwise((s, t) => @lib.intersect(pfrees(s), pfrees(t)).is_empty(), vars),
    "duplicate names on left of let-binding: latest is used",
  )
  let lend = @preterm.Combp(pv("LET_END"), body)
  let abs = @lib.itlist((v, t) => @preterm.Absp(v, t), vars, lend)
  let labs = @preterm.Combp(pv("LET"), abs)
  @lib.rev_itlist((x, f) => @preterm.Combp(f, x), tms, labs)
}

///|
fn pmk_vbinder(n : String, v : Preterm, bod : Preterm) -> Preterm {
  if n == "\\" {
    @preterm.Absp(v, bod)
  } else {
    @preterm.Combp(pv(n), @preterm.Absp(v, bod))
  }
}

///|
fn pmk_binder(n : String, vs : List[Preterm], bod : Preterm) -> Preterm {
  @lib.itlist((v, b) => pmk_vbinder(n, v, b), vs, bod)
}

///|
fn pmk_set_enum(ptms : List[Preterm]) -> Preterm {
  @lib.itlist(
    (x, t) => @preterm.Combp(@preterm.Combp(pv("INSERT"), x), t),
    ptms,
    pv("EMPTY"),
  )
}

///|
fn pmk_list(els : List[Preterm]) -> Preterm {
  @lib.itlist(
    (x, y) => @preterm.Combp(@preterm.Combp(pv("CONS"), x), y),
    els,
    pv("NIL"),
  )
}

///|
fn pmk_char(c : Int) -> Preterm {
  let bits = @lib.map(
    (i : Int64) => pv(if (c >> i.to_int()) % 2 == 1 { "T" } else { "F" }),
    @lib.range(0, 7),
  )
  @lib.itlist((x, y) => @preterm.Combp(y, x), bits, pv("ASCII"))
}

///|
/// The bytes of a string literal token (the lexer works on bytes, one
/// character per byte).
fn literal_bytes(s : String) -> Array[Int] {
  [
    for ch in s => ch.to_int()
  ]
}

///|
fn pmk_string(s : String) -> Preterm {
  pmk_list(@list.List(literal_bytes(s).map(pmk_char)))
}

///|
fn mk_precedence(
  infxs : List[(String, (Int64, String))],
  prs : (Toks) -> (Preterm, Toks) raise,
  inp : Toks,
) -> (Preterm, Toks) raise {
  match infxs {
    More((_, (p, at)), tail=_) => {
      let (topins, rest) = @lib.partition(
        (e : (String, (Int64, String))) => e.1 == (p, at),
        infxs,
      )
      let binop = if at == "right" { rightbin } else { leftbin }
      let ops = @lib.end_itlist(
        (p1, p2) => alt(p1, p2),
        @lib.map((e : (String, (Int64, String))) => idt(e.0), topins),
      )
      binop(
        i => mk_precedence(rest, prs, i),
        ops,
        (op : Lexcode, x : Preterm, y : Preterm) => {
          match op {
            Ident(o) => @preterm.Combp(@preterm.Combp(pv(o), x), y)
            Resword(_) => raise @lib.MatchFailure("parser.ml: mk_precedence")
          }
        },
        "term after binary operator",
      )(inp)
    }
    Empty => prs(inp)
  }
}

///|
fn pmk_pattern(pgr : ((Preterm, List[Preterm]), Preterm)) -> Preterm raise {
  pmk_pattern_binding(pgr, () => pfrees(pgr.0.0))
}

///|
fn is_quoted(s : String) -> Bool {
  s.length() >= 2 && s.has_prefix("\"") && s.has_suffix("\"")
}

///|
fn string_tok(inp : Toks) -> (String, Toks) raise {
  match inp {
    [Ident(s), .. rst] if is_quoted(s) => (s[1:s.length() - 1].to_owned(), rst)
    _ => raise @parserutil.Noparse
  }
}

///|
fn lmk_typed(p : (Preterm, List[Pretype])) -> Preterm raise {
  match p {
    (p, Empty) => p
    (p, More(ty, tail=Empty)) => @preterm.Typing(p, ty)
    _ => raise Failure("")
  }
}

///|
fn lmk_decimal(p : ((Lexcode, String), List[String])) -> Preterm raise {
  let ((_, l0), ropt) = p
  let (l, r) = match ropt {
    Empty => (l0, "1")
    More(r0, tail=_) => {
      let n_l = @num.num_of_string(l0)
      let n_r = @num.num_of_string(r0)
      let n_d = @num.power_num(
        @num.num_of_int(10),
        @num.num_of_int(r0.length()),
      )
      let n_n = n_l * n_d + n_r
      (@num.string_of_num(n_n), @num.string_of_num(n_d))
    }
  }
  @preterm.Combp(@preterm.Combp(pv("DECIMAL"), pv(l)), pv(r))
}

///|
fn any_identifier(inp : Toks) -> (String, Toks) raise {
  match inp {
    [Ident(s), .. rest] if s != "!" => (s, rest)
    _ => raise @parserutil.Noparse
  }
}

///|
fn identifier(inp : Toks) -> (String, Toks) raise {
  match inp {
    [Ident(s), .. rest] if s != "!" =>
      if @lib.can(@printer.get_infix_status, s) ||
        @printer.is_prefix(s) ||
        @printer.parses_as_binder(s) {
        raise @parserutil.Noparse
      } else {
        (s, rest)
      }
    _ => raise @parserutil.Noparse
  }
}

///|
fn binder(inp : Toks) -> (String, Toks) raise {
  match inp {
    [Ident(s), .. rest] if @printer.parses_as_binder(s) => (s, rest)
    _ => raise @parserutil.Noparse
  }
}

///|
fn pre_fix(inp : Toks) -> (String, Toks) raise {
  match inp {
    [Ident(s), .. rest] if @printer.is_prefix(s) => (s, rest)
    _ => raise @parserutil.Noparse
  }
}

// ---------------------------------------------------------------------------
// The preterm grammar.
//
// PRETERM            :: APPL_PRETERM binop APPL_PRETERM | APPL_PRETERM
// APPL_PRETERM       :: APPL_PRETERM : type | APPL_PRETERM BINDER_PRETERM
//                     | BINDER_PRETERM
// BINDER_PRETERM     :: binder VARSTRUCT_PRETERMS . PRETERM
//                     | let PRETERM and ... and PRETERM in PRETERM
//                     | ATOMIC_PRETERM
// VARSTRUCT_PRETERMS :: TYPED_PRETERM VARSTRUCT_PRETERMS | TYPED_PRETERM
// TYPED_PRETERM      :: TYPED_PRETERM : type | ATOMIC_PRETERM
// ATOMIC_PRETERM     :: ( PRETERM ) | if PRETERM then PRETERM else PRETERM
//                     | [ PRETERM; .. ; PRETERM ] | { PRETERM, .. , PRETERM }
//                     | { PRETERM | PRETERM } | identifier
// ---------------------------------------------------------------------------

///|
fn preterm(i : Toks) -> (Preterm, Toks) raise {
  mk_precedence(@printer.infixes(), typed_appl_preterm, i)
}

///|
fn nocommapreterm(i : Toks) -> (Preterm, Toks) raise {
  let infs = @lib.filter(
    (e : (String, (Int64, String))) => e.0 != ",",
    @printer.infixes(),
  )
  mk_precedence(infs, typed_appl_preterm, i)
}

///|
fn typed_appl_preterm(i : Toks) -> (Preterm, Toks) raise {
  map(
    seq(appl_preterm, possibly(map(seq(res(":"), parse_pretype), r => r.1))),
    lmk_typed,
  )(i)
}

///|
fn appl_preterm(i : Toks) -> (Preterm, Toks) raise {
  alt(
    map(seq(pre_fix, appl_preterm), xy => @preterm.Combp(pv(xy.0), xy.1)),
    map(seq(binder_preterm, many(binder_preterm)), ht => {
      @lib.itlist((x, y) => @preterm.Combp(y, x), ht.1.rev(), ht.0)
    }),
  )(i)
}

///|
fn binder_preterm(i : Toks) -> (Preterm, Toks) raise {
  alt(
    map(
      seq(
        seq(
          seq(
            res("let"),
            leftbin(
              map(preterm, x => @list.singleton(x)),
              res("and"),
              (_, x : List[Preterm], y) => x.concat(y),
              "binding",
            ),
          ),
          res("in"),
        ),
        preterm,
      ),
      r => pmk_let(r.0.0.1, r.1),
    ),
    alt(
      map(
        seq(
          seq(seq(seq(binder, typed_apreterm), many(typed_apreterm)), res(".")),
          preterm,
        ),
        r => {
          let ((((s, h), t), _), p) = r
          pmk_binder(s, t.prepend(h), p)
        },
      ),
      atomic_preterm,
    ),
  )(i)
}

///|
fn typed_apreterm(i : Toks) -> (Preterm, Toks) raise {
  map(
    seq(atomic_preterm, possibly(map(seq(res(":"), parse_pretype), r => r.1))),
    lmk_typed,
  )(i)
}

///|
fn[A] fail_with(msg : String) -> (A) -> Preterm raise {
  _ => raise Failure(msg)
}

///|
fn atomic_preterm(i : Toks) -> (Preterm, Toks) raise {
  let alts : Array[(Toks) -> (Preterm, Toks) raise] = [
    map(seq(seq(seq(res("("), res(":")), parse_pretype), res(")")), r => {
      @preterm.Typing(
        pv("UNIV"),
        @preterm.Ptycon(
          "fun",
          @list.List([r.0.1, @preterm.Ptycon("bool", @list.List([]))]),
        ),
      )
    }),
    map(
      seq(seq(res("("), res(":")), parse_pretype),
      fail_with("closing right parenthesis on universe expected"),
    ),
    map(
      seq(res("("), res(":")),
      fail_with("type in universe construction expected"),
    ),
    map(string_tok, pmk_string),
    map(seq(seq(res("("), map(any_identifier, pv)), res(")")), r => r.0.1),
    map(seq(seq(res("("), preterm), res(")")), r => r.0.1),
    map(
      seq(
        seq(
          seq(seq(seq(res("if"), preterm), res("then")), preterm),
          res("else"),
        ),
        preterm,
      ),
      r => {
        let (((((_, b), _), l), _), rr) = r
        @preterm.Combp(@preterm.Combp(@preterm.Combp(pv("COND"), b), l), rr)
      },
    ),
    map(
      seq(seq(seq(seq(res("if"), preterm), res("then")), preterm), res("else")),
      fail_with("malformed else clause"),
    ),
    map(
      seq(seq(seq(res("if"), preterm), res("then")), preterm),
      fail_with("missing else following then clause"),
    ),
    map(
      seq(seq(res("if"), preterm), res("then")),
      fail_with("malformed then clause in if-then-else statement"),
    ),
    map(
      seq(res("if"), preterm),
      fail_with("missing 'then' reserved word in if-then-else statement"),
    ),
    map(res("if"), fail_with("malformed if-then-else")),
    map(
      seq(
        seq(
          res("["),
          elistof(preterm, res(";"), "semicolon separated list of terms"),
        ),
        res("]"),
      ),
      r => pmk_list(r.0.1),
    ),
    map(
      seq(
        res("["),
        elistof(preterm, res(";"), "semicolon separated list of terms"),
      ),
      fail_with("closing square bracket of list expected"),
    ),
    map(
      seq(
        res("{"),
        alt(
          map(
            seq(
              elistof(nocommapreterm, idt(","), "comma separated list of terms"),
              res("}"),
            ),
            r => pmk_set_enum(r.0),
          ),
          alt(
            map(seq(seq(seq(preterm, res("|")), preterm), res("}")), r => {
              pmk_setabs(r.0.0.0, r.0.1)
            }),
            map(
              seq(
                seq(
                  seq(seq(seq(preterm, res("|")), preterm), res("|")),
                  preterm,
                ),
                res("}"),
              ),
              r => {
                let (((((f, _), vs), _), b), _) = r
                pmk_setcompr(f, pfrees(vs), b)
              },
            ),
          ),
        ),
      ),
      r => r.1,
    ),
    map(res("{"), fail_with("malformed set {}")),
    map(seq(seq(seq(res("match"), preterm), res("with")), clauses), r => {
      @preterm.Combp(@preterm.Combp(pv("_MATCH"), r.0.0.1), r.1)
    }),
    map(res("match"), fail_with("malformed match-with statement")),
    map(seq(res("function"), clauses), r => @preterm.Combp(pv("_FUNCTION"), r.1)),
    map(res("function"), fail_with("malformed function and pattern clauses")),
    map(
      seq(
        seq(idt("#"), identifier),
        possibly(map(seq(res("."), identifier), r => r.1)),
      ),
      lmk_decimal,
    ),
    map(idt("#"), fail_with("malformed numerical # identifier")),
    map(identifier, pv),
  ]
  // `p1 ||| p2 ||| ...` associates to the right; trying the alternatives
  // in order is equivalent.
  for p in alts {
    try p(i) catch {
      @parserutil.Noparse => continue
      e => raise e
    } noraise {
      r => return r
    }
  }
  raise @parserutil.Noparse
}

///|
fn pattern(i : Toks) -> ((Preterm, List[Preterm]), Toks) raise {
  seq(preterm, possibly(map(seq(res("when"), preterm), r => r.1)))(i)
}

///|
fn clause(i : Toks) -> (Preterm, Toks) raise {
  map(seq(pattern, map(seq(res("->"), preterm), r => r.1)), pmk_pattern)(i)
}

///|
fn clauses(i : Toks) -> (Preterm, Toks) raise {
  map(
    map(
      seq(possibly(res("|")), listof(clause, res("|"), "pattern-match clause")),
      r => r.1,
    ),
    cs => {
      @lib.end_itlist(
        (s, t) => @preterm.Combp(@preterm.Combp(pv("_SEQPATTERN"), s), t),
        cs,
      )
    },
  )(i)
}

///|
/// Parse a preterm from tokens.
pub fn parse_preterm(inp : Toks) -> (Preterm, Toks) raise {
  match inp {
    [Ident(s)] if !is_quoted(s) && s != "!" => (pv(s), inp[1:])
    _ => preterm(inp)
  }
}

///|
/// Called with each quotation `parse_term` reads, the site `parse_term_at`
/// gave it (-1 for none) and the term it denotes; tools/migrate.mbtx
/// records the term's new spelling with it.
pub let quotation_hook : Ref[((Int, String, Term) -> Unit raise)?] = Ref::{
  val: None,
}

///|
let quotation_site : Ref[Int] = Ref::{ val: -1 }

///|
/// `parse_term(s)` reporting `site` to `quotation_hook`: tools/migrate.mbtx
/// numbers a package's quotations with it while it records them.
pub fn parse_term_at(site : Int, s : String) -> Term raise {
  quotation_site.val = site
  parse_term(s)
}

///|
/// Parse a HOL type.
pub fn parse_type(s : String) -> HolType raise {
  @theory.record_quotation(":" + s)
  let (pty, l) = parse_pretype(@lexer.lex(s))
  if l.is_empty() {
    @preterm.type_of_pretype(pty)
  } else {
    raise Failure("Unparsed input following type")
  }
}

///|
/// Parse and typecheck a HOL term.
pub fn parse_term(s : String) -> Term raise {
  let site = quotation_site.val
  quotation_site.val = -1
  @theory.record_quotation(s)
  let tm = elaborate(s)
  match quotation_hook.val {
    Some(hook) => hook(site, s, tm)
    None => ()
  }
  tm
}

///|
fn elaborate(s : String) -> Term raise {
  let (ptm, l) = parse_preterm(@lexer.lex(s))
  if l.is_empty() {
    @preterm.term_of_preterm(@preterm.retypecheck(@list.List([]), ptm))
  } else {
    raise Failure("Unparsed input following term")
  }
}

///|
/// The term `s` denotes, read as `parse_term` would read it now, with no
/// trace or hook and without advancing the GEN%PVAR counter, and how many
/// GEN%PVAR names it took: for comparing another reading of `s` with it.
pub fn reread_term(s : String) -> (Term, Int) raise {
  @preterm.with_pgen_counter_restored(() => {
    let start = @preterm.pgen_count()
    let tm = elaborate(s)
    (tm, @preterm.pgen_count() - start)
  })
}

///|
/// The theory bookkeeping moved to @theory; the generated `load`s still call
/// it here.
pub fn begin_theory(name : String) -> Unit {
  @theory.begin_theory(name)
}

///|
pub fn end_theory() -> Unit {
  @theory.end_theory()
}

///|
pub fn is_loading(name : String) -> Bool {
  @theory.is_loading(name)
}

///|
pub fn theory_trace(name : String) -> Array[String] {
  @theory.theory_trace(name)
}
