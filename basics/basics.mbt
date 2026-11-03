// ===========================================================================
// More syntax constructors, and prelogical utilities like matching
// (port of basics.ml, plus the untrusted tail of fusion.ml).
// ===========================================================================

///|
using @kernel {type Term, type HolType}

///|
using @list {type List}

// ---------------------------------------------------------------------------
// The tail of fusion.ml (outside the trusted kernel).
// ---------------------------------------------------------------------------

///|
pub fn mk_fun_ty(ty1 : HolType, ty2 : HolType) -> HolType raise {
  @kernel.mk_type("fun", @list.List([ty1, ty2]))
}

///|
pub let bty : HolType = @kernel.mk_vartype("B")

///|
pub fn is_eq(tm : Term) -> Bool {
  tm is Comb(Comb(Const("=", _), _), _)
}

///|
pub fn mk_eq(l : Term, r : Term) -> Term raise {
  let eq = @kernel.mk_const("=", @list.List([]))
  let ty = @kernel.type_of(l)
  let eq_tm = @kernel.inst(@list.List([(ty, @kernel.aty)]), eq)
  @kernel.mk_comb(@kernel.mk_comb(eq_tm, l), r) catch {
    _ => raise Failure("mk_eq")
  }
}

///|
/// Alpha-convertibility.
pub fn aconv(s : Term, t : Term) -> Bool {
  @kernel.alphaorder(s, t) == 0
}

///|
/// Equality of theorems (same assumption list and conclusion).
pub fn equals_thm(th : @kernel.Thm, th1 : @kernel.Thm) -> Bool {
  @kernel.dest_thm(th) == @kernel.dest_thm(th1)
}

// ---------------------------------------------------------------------------
// Fresh variables.
// ---------------------------------------------------------------------------

///|
let gcounter : Ref[Int32] = Ref::{ val: 0, }

///|
/// A probably-fresh variable `_n`.
pub fn genvar(ty : HolType) -> Term {
  let count = gcounter.val
  gcounter.val = count + 1
  @kernel.mk_var("_" + count.to_string(), ty)
}

// ---------------------------------------------------------------------------
// Types.
// ---------------------------------------------------------------------------

///|
pub fn dest_fun_ty(ty : HolType) -> (HolType, HolType) raise {
  match ty {
    Tyapp("fun", More(ty1, tail=More(ty2, tail=Empty))) => (ty1, ty2)
    _ => raise Failure("dest_fun_ty")
  }
}

///|
/// Whether `ty` occurs in `bigty`.
pub fn occurs_in(ty : HolType, bigty : HolType) -> Bool {
  bigty == ty ||
  (match bigty {
    Tyapp(_, args) => args.any(a => occurs_in(ty, a))
    Tyvar(_) => false
  })
}

///|
/// Substitute types for types (not only variables): `alist` is a list of
/// `(replacement, original)` pairs.
pub fn tysubst(alist : List[(HolType, HolType)], ty : HolType) -> HolType raise {
  @lib.rev_assoc(ty, alist) catch {
    Failure(_) =>
      match ty {
        Tyvar(_) => ty
        Tyapp(tycon, args) =>
          @kernel.mk_type(tycon, @lib.map(a => tysubst(alist, a), args))
      }
    e => raise e
  }
}

// ---------------------------------------------------------------------------
// A bit more syntax.
// ---------------------------------------------------------------------------

///|
pub fn bndvar(tm : Term) -> Term raise {
  match tm {
    Abs(v, _) => v
    _ => raise Failure("bndvar: Not an abstraction")
  }
}

///|
pub fn body(tm : Term) -> Term raise {
  match tm {
    Abs(_, b) => b
    _ => raise Failure("body: Not an abstraction")
  }
}

///|
pub fn list_mk_comb(h : Term, t : List[Term]) -> Term raise {
  @lib.rev_itlist((a, f) => @kernel.mk_comb(f, a), t, h)
}

///|
pub fn list_mk_abs(vs : List[Term], bod : Term) -> Term raise {
  @lib.itlist((v, b) => @kernel.mk_abs(v, b), vs, bod)
}

///|
pub fn strip_comb(tm : Term) -> (Term, List[Term]) {
  @lib.rev_splitlist(@kernel.dest_comb, tm) catch {
    _ => abort("strip_comb: dest_comb raised a non-Failure error")
  }
}

///|
pub fn strip_abs(tm : Term) -> (List[Term], Term) {
  @lib.splitlist(@kernel.dest_abs, tm) catch {
    _ => abort("strip_abs: dest_abs raised a non-Failure error")
  }
}

// ---------------------------------------------------------------------------
// Generic syntax to deal with some binary operators. `mk_binary` only works
// for monomorphic functions.
// ---------------------------------------------------------------------------

///|
pub fn is_binary(s : String, tm : Term) -> Bool {
  match tm {
    Comb(Comb(Const(s1, _), _), _) => s1 == s
    _ => false
  }
}

///|
pub fn dest_binary(s : String, tm : Term) -> (Term, Term) raise {
  match tm {
    Comb(Comb(Const(s1, _), l), r) if s1 == s => (l, r)
    _ => raise Failure("dest_binary")
  }
}

///|
pub fn mk_binary(s : String, l : Term, r : Term) -> Term raise {
  let c = @kernel.mk_const(s, @list.List([]))
  @kernel.mk_comb(@kernel.mk_comb(c, l), r) catch {
    _ => raise Failure("mk_binary")
  }
}

///|
/// A sequence of variants, each avoiding the previous ones.
pub fn variants(av : List[Term], vs : List[Term]) -> List[Term] raise {
  let out = []
  let mut av = av
  for v in vs {
    let vh = @kernel.variant(av, v)
    out.push(vh)
    av = av.prepend(vh)
  }
  @list.List(out)
}

///|
/// All variables (free and/or bound) in a term.
pub fn variables(tm : Term) -> List[Term] {
  fn vars(acc : List[Term], tm : Term) -> List[Term] {
    match tm {
      Var(_) => @lib.insert(tm, acc)
      Const(_) => acc
      Abs(v, bod) => vars(@lib.insert(v, acc), bod)
      Comb(l, r) => vars(vars(acc, l), r)
    }
  }

  vars(@list.List([]), tm)
}

///|
fn ssubst(ilist : List[(Term, Term)], tm : Term) -> Term raise {
  if ilist.is_empty() {
    return tm
  }
  match ilist.find(p => aconv(tm, p.1)) {
    Some(p) => p.0
    None =>
      match tm {
        Comb(f, x) => {
          let f1 = ssubst(ilist, f)
          let x1 = ssubst(ilist, x)
          if physical_equal(f1, f) && physical_equal(x1, x) {
            tm
          } else {
            @kernel.mk_comb(f1, x1)
          }
        }
        Abs(v, bod) => {
          let ilist1 = @lib.filter(
            (p : (Term, Term)) => !@kernel.vfree_in(v, p.1),
            ilist,
          )
          @kernel.mk_abs(v, ssubst(ilist1, bod))
        }
        _ => tm
      }
  }
}

///|
/// General substitution of terms for (any free) terms: `ilist` is a list of
/// `(replacement, original)` pairs.
pub fn subst(ilist : List[(Term, Term)], tm : Term) -> Term raise {
  let theta = @lib.filter((p : (Term, Term)) => p.0 != p.1, ilist)
  if theta.is_empty() {
    return tm
  }
  let (ts, xs) = @lib.unzip(theta)
  let gs = variants(
    variables(tm),
    @lib.map(x => genvar(@kernel.type_of(x)), xs),
  )
  let tm1 = ssubst(@lib.zip(gs, xs), tm)
  if physical_equal(tm1, tm) {
    tm
  } else {
    @kernel.vsubst(@lib.zip(ts, gs), tm1)
  }
}

///|
/// Rename the bound variable of an abstraction.
pub fn alpha(v : Term, tm : Term) -> Term raise {
  let (v0, bod) = @kernel.dest_abs(tm) catch {
    _ => raise Failure("alpha: Not an abstraction")
  }
  if v == v0 {
    tm
  } else if @kernel.type_of(v) == @kernel.type_of(v0) &&
    !@kernel.vfree_in(v, bod) {
    @kernel.mk_abs(v, @kernel.vsubst(@list.List([(v, v0)]), bod))
  } else {
    raise Failure("alpha: Invalid new variable")
  }
}

// ---------------------------------------------------------------------------
// Type matching.
// ---------------------------------------------------------------------------

///|
/// Extend `sofar` (a list of `(type, variable)` pairs) so that `vty`
/// instantiates to `cty`.
pub fn type_match(
  vty : HolType,
  cty : HolType,
  sofar : List[(HolType, HolType)],
) -> List[(HolType, HolType)] raise {
  match vty {
    Tyvar(_) =>
      // OCaml catches only `Failure "find"` here.
      match sofar.find(p => p.1 == vty) {
        Some(p) => if p.0 == cty { sofar } else { raise Failure("type_match") }
        None => sofar.prepend((cty, vty))
      }
    Tyapp(vop, vargs) => {
      let (cop, cargs) = @kernel.dest_type(cty)
      if vop == cop {
        @lib.itlist2((v, c, acc) => type_match(v, c, acc), vargs, cargs, sofar) catch {
          Failure(msg) => raise Failure(msg)
          _ => abort("type_match: unexpected error")
        }
      } else {
        raise Failure("type_match")
      }
    }
  }
}

///|
/// `mk_const` by matching against the generic type.
pub fn mk_mconst(c : String, ty : HolType) -> Term raise {
  let result = try {
    let uty = @kernel.get_const_type(c)
    let mat = type_match(uty, ty, @list.List([]))
    let con = @kernel.mk_const(c, mat)
    if @kernel.type_of(con) == ty {
      Some(con)
    } else {
      None
    }
  } catch {
    _ => None
  }
  match result {
    Some(con) => con
    None => raise Failure("mk_const: generic type cannot be instantiated")
  }
}

///|
/// Like `mk_comb`, but instantiates type variables in the operator.
pub fn mk_icomb(tm1 : Term, tm2 : Term) -> Term raise {
  // `let "fun",[ty;_] = dest_type ...` raises Match_failure otherwise.
  let ty = match @kernel.type_of(tm1) {
    Tyapp("fun", More(ty, tail=More(_, tail=Empty))) => ty
    Tyapp(_) => raise @lib.MatchFailure("basics.ml: mk_icomb")
    Tyvar(_) => raise Failure("dest_type: type variable not a constructor")
  }
  let tyins = type_match(ty, @kernel.type_of(tm2), @list.List([]))
  @kernel.mk_comb(@kernel.inst(tyins, tm1), tm2)
}

///|
/// Instantiate the type of constant `cname` to fit `args` and apply it.
pub fn list_mk_icomb(cname : String, args : List[Term]) -> Term raise {
  let (atys, _) = @lib.nsplit(dest_fun_ty, args, @kernel.get_const_type(cname))
  let tyin = @lib.itlist2(
    (g, a, acc) => type_match(g, @kernel.type_of(a), acc),
    atys,
    args,
    @list.List([]),
  ) catch {
    Failure(msg) => raise Failure(msg)
    _ => abort("list_mk_icomb: unexpected error")
  }
  list_mk_comb(@kernel.mk_const(cname, tyin), args)
}

///|
/// Free variables in the assumptions and conclusion of a theorem.
pub fn thm_frees(th : @kernel.Thm) -> List[Term] {
  let (asl, c) = @kernel.dest_thm(th)
  @lib.itlist(
    (a, acc) => @lib.union(@kernel.frees(a), acc),
    asl,
    @kernel.frees(c),
  )
}

///|
/// Whether `tm1` occurs free in `tm2` (modulo alpha).
pub fn free_in(tm1 : Term, tm2 : Term) -> Bool {
  if aconv(tm1, tm2) {
    true
  } else {
    match tm2 {
      Comb(l, r) => free_in(tm1, l) || free_in(tm1, r)
      Abs(bv, bod) => !@kernel.vfree_in(bv, tm1) && free_in(tm1, bod)
      _ => false
    }
  }
}

///|
/// The first subterm satisfying `p` (bodies, then operators before
/// operands).
pub fn find_term(p : (Term) -> Bool raise, tm : Term) -> Term raise {
  if p(tm) {
    return tm
  }
  match tm {
    Abs(_, bod) => find_term(p, bod)
    Comb(l, r) =>
      find_term(p, l) catch {
        Failure(_) => find_term(p, r)
        e => raise e
      }
    _ => raise Failure("find_term")
  }
}

///|
/// All subterms satisfying `p` (as a set, in `insert` order).
pub fn find_terms(p : (Term) -> Bool raise?, tm : Term) -> List[Term] raise? {
  fn accum(tl : List[Term], tm : Term) -> List[Term] raise? {
    let tl1 = if p(tm) { @lib.insert(tm, tl) } else { tl }
    match tm {
      Abs(_, bod) => accum(tl1, bod)
      Comb(l, r) => accum(accum(tl1, l), r)
      _ => tl1
    }
  }

  accum(@list.List([]), tm)
}

// ---------------------------------------------------------------------------
// General syntax for binders. `mk_binder` expects polytype "A" as domain.
// ---------------------------------------------------------------------------

///|
pub fn is_binder(s : String, tm : Term) -> Bool {
  match tm {
    Comb(Const(s1, _), Abs(_)) => s1 == s
    _ => false
  }
}

///|
pub fn dest_binder(s : String, tm : Term) -> (Term, Term) raise {
  match tm {
    Comb(Const(s1, _), Abs(x, t)) if s1 == s => (x, t)
    _ => raise Failure("dest_binder")
  }
}

///|
pub fn mk_binder(op : String, v : Term, tm : Term) -> Term raise {
  let c = @kernel.mk_const(op, @list.List([]))
  @kernel.mk_comb(
    @kernel.inst(@list.List([(@kernel.type_of(v), @kernel.aty)]), c),
    @kernel.mk_abs(v, tm),
  )
}

// ---------------------------------------------------------------------------
// Syntax for binary operators given as terms.
// ---------------------------------------------------------------------------

///|
pub fn is_binop(op : Term, tm : Term) -> Bool {
  match tm {
    Comb(Comb(op1, _), _) => op1 == op
    _ => false
  }
}

///|
pub fn dest_binop(op : Term, tm : Term) -> (Term, Term) raise {
  match tm {
    Comb(Comb(op1, l), r) if op1 == op => (l, r)
    _ => raise Failure("dest_binop")
  }
}

///|
pub fn mk_binop(op : Term, tm1 : Term, tm2 : Term) -> Term raise {
  @kernel.mk_comb(@kernel.mk_comb(op, tm1), tm2)
}

///|
pub fn list_mk_binop(op : Term, l : List[Term]) -> Term raise {
  @lib.end_itlist((a, b) => mk_binop(op, a, b), l)
}

///|
pub fn binops(op : Term, tm : Term) -> List[Term] {
  @lib.striplist(t => dest_binop(op, t), tm) catch {
    _ => abort("binops: unexpected error")
  }
}

// ---------------------------------------------------------------------------
// Some common special cases.
// ---------------------------------------------------------------------------

///|
pub fn is_conj(tm : Term) -> Bool {
  is_binary("/\\", tm)
}

///|
pub fn dest_conj(tm : Term) -> (Term, Term) raise {
  dest_binary("/\\", tm)
}

///|
pub fn conjuncts(tm : Term) -> List[Term] {
  @lib.striplist(dest_conj, tm) catch {
    _ => abort("conjuncts: unexpected error")
  }
}

///|
pub fn is_imp(tm : Term) -> Bool {
  is_binary("==>", tm)
}

///|
pub fn dest_imp(tm : Term) -> (Term, Term) raise {
  dest_binary("==>", tm)
}

///|
pub fn is_forall(tm : Term) -> Bool {
  is_binder("forall", tm)
}

///|
pub fn dest_forall(tm : Term) -> (Term, Term) raise {
  dest_binder("forall", tm)
}

///|
pub fn strip_forall(tm : Term) -> (List[Term], Term) {
  @lib.splitlist(dest_forall, tm) catch {
    _ => abort("strip_forall: unexpected error")
  }
}

///|
pub fn is_exists(tm : Term) -> Bool {
  is_binder("?", tm)
}

///|
pub fn dest_exists(tm : Term) -> (Term, Term) raise {
  dest_binder("?", tm)
}

///|
pub fn strip_exists(tm : Term) -> (List[Term], Term) {
  @lib.splitlist(dest_exists, tm) catch {
    _ => abort("strip_exists: unexpected error")
  }
}

///|
pub fn is_disj(tm : Term) -> Bool {
  is_binary("\\/", tm)
}

///|
pub fn dest_disj(tm : Term) -> (Term, Term) raise {
  dest_binary("\\/", tm)
}

///|
pub fn disjuncts(tm : Term) -> List[Term] {
  @lib.striplist(dest_disj, tm) catch {
    _ => abort("disjuncts: unexpected error")
  }
}

///|
pub fn is_neg(tm : Term) -> Bool {
  tm is Comb(Const("~", _), _)
}

///|
pub fn dest_neg(tm : Term) -> Term raise {
  match tm {
    Comb(Const("~", _), p) => p
    _ => raise Failure("dest_neg")
  }
}

///|
pub fn is_uexists(tm : Term) -> Bool {
  is_binder("?!", tm)
}

///|
pub fn dest_uexists(tm : Term) -> (Term, Term) raise {
  dest_binder("?!", tm)
}

///|
pub fn dest_cons(tm : Term) -> (Term, Term) raise {
  dest_binary("CONS", tm)
}

///|
pub fn is_cons(tm : Term) -> Bool {
  is_binary("CONS", tm)
}

///|
pub fn dest_list(tm : Term) -> List[Term] raise {
  let (tms, nil) = @lib.splitlist(dest_cons, tm) catch {
    _ => raise Failure("dest_list")
  }
  match nil {
    Const("NIL", _) => tms
    _ => raise Failure("dest_list")
  }
}

///|
pub fn is_list(tm : Term) -> Bool {
  try dest_list(tm) catch {
    _ => false
  } noraise {
    _ => true
  }
}

// ---------------------------------------------------------------------------
// Numerals.
// ---------------------------------------------------------------------------

///|
/// The value of a numeral `NUMERAL (BIT1 (BIT0 ... _0))`.
pub fn dest_numeral(tm : Term) -> @num.Num raise {
  // Collect the bits from the outside in, then evaluate from the inside.
  let bits = []
  let mut t = match tm {
    Comb(Const("NUMERAL", _), r) => r
    _ => raise Failure("dest_numeral")
  }
  while true {
    match t {
      Const("_0", _) => break
      Comb(Const("BIT0", _), r) => {
        bits.push(0)
        t = r
      }
      Comb(Const("BIT1", _), r) => {
        bits.push(1)
        t = r
      }
      _ => raise Failure("dest_numeral")
    }
  }
  let mut n = @num.num_0
  for i = bits.length() - 1; i >= 0; i = i - 1 {
    n = @num.num_2 * n + @num.num_of_int(bits[i])
  }
  n
}

// ---------------------------------------------------------------------------
// Generalized abstractions (used by the preterm-to-term translator).
// ---------------------------------------------------------------------------

///|
pub fn dest_gabs(tm : Term) -> (Term, Term) raise {
  let result = try {
    match tm {
      Abs(v, b) => (v, b)
      Comb(Const("GABS", _), r) => {
        let (_, inner) = strip_forall(body(r))
        let (ltm, rtm) = dest_binary("GEQ", inner)
        (@kernel.rand(ltm), rtm)
      }
      _ => raise Failure("")
    }
  } catch {
    _ => raise Failure("dest_gabs: Not a generalized abstraction")
  }
  result
}

///|
pub fn is_gabs(tm : Term) -> Bool {
  try dest_gabs(tm) catch {
    _ => false
  } noraise {
    _ => true
  }
}

///|
pub fn mk_gabs(tm1 : Term, tm2 : Term) -> Term raise {
  if @kernel.is_var(tm1) {
    return @kernel.mk_abs(tm1, tm2)
  }
  let mk_forall = (v : Term, t : Term) => {
    let cop = @kernel.mk_const(
      "forall",
      @list.List([(@kernel.type_of(v), @kernel.aty)]),
    )
    @kernel.mk_comb(cop, @kernel.mk_abs(v, t))
  }
  let mk_geq = (t1 : Term, t2 : Term) => {
    let p = @kernel.mk_const(
      "GEQ",
      @list.List([(@kernel.type_of(t1), @kernel.aty)]),
    )
    @kernel.mk_comb(@kernel.mk_comb(p, t1), t2)
  }
  let fvs = @kernel.frees(tm1)
  let fty = mk_fun_ty(@kernel.type_of(tm1), @kernel.type_of(tm2))
  let f = @kernel.variant(
    @kernel.frees(tm1).concat(@kernel.frees(tm2)),
    @kernel.mk_var("f", fty),
  )
  let bod = @kernel.mk_abs(
    f,
    @lib.itlist(mk_forall, fvs, mk_geq(@kernel.mk_comb(f, tm1), tm2)),
  )
  @kernel.mk_comb(
    @kernel.mk_const("GABS", @list.List([(fty, @kernel.aty)])),
    bod,
  )
}

///|
pub fn list_mk_gabs(vs : List[Term], bod : Term) -> Term raise {
  @lib.itlist(mk_gabs, vs, bod)
}

///|
pub fn strip_gabs(tm : Term) -> (List[Term], Term) {
  @lib.splitlist(dest_gabs, tm) catch {
    _ => abort("strip_gabs: unexpected error")
  }
}

// ---------------------------------------------------------------------------
// Let terms.
// ---------------------------------------------------------------------------

///|
pub fn dest_let(tm : Term) -> (List[(Term, Term)], Term) raise {
  let result = try {
    let (l, aargs) = strip_comb(tm)
    match l {
      Const("LET", _) => ()
      _ => raise Failure("")
    }
    let (vars, lebod) = strip_gabs(@lib.hd(aargs))
    let eqs = @lib.zip(vars, @lib.tl(aargs))
    match lebod {
      Comb(Const("LET_END", _), bod) => (eqs, bod)
      _ => raise Failure("")
    }
  } catch {
    _ => raise Failure("dest_let: not a let-term")
  }
  result
}

///|
pub fn is_let(tm : Term) -> Bool {
  try dest_let(tm) catch {
    _ => false
  } noraise {
    _ => true
  }
}

///|
pub fn mk_let(assigs : List[(Term, Term)], bod : Term) -> Term raise {
  let (lefts, rights) = @lib.unzip(assigs)
  let lend = @kernel.mk_comb(
    @kernel.mk_const(
      "LET_END",
      @list.List([(@kernel.type_of(bod), @kernel.aty)]),
    ),
    bod,
  )
  let lbod = list_mk_gabs(lefts, lend)
  let (ty1, ty2) = dest_fun_ty(@kernel.type_of(lbod))
  let ltm = @kernel.mk_const(
    "LET",
    @list.List([(ty1, @kernel.aty), (ty2, bty)]),
  )
  list_mk_comb(ltm, rights.prepend(lbod))
}

// ---------------------------------------------------------------------------
// Finite types.
// ---------------------------------------------------------------------------

///|
/// The type `1`, `tybit0`/`tybit1` encoding of a positive integer.
pub fn mk_finty(n : @num.Num) -> HolType raise {
  if !@num.is_integer_num(n) || n < @num.num_1 {
    raise Failure("mk_finty")
  }
  fn finty(n : @num.Num) -> HolType raise {
    if n == @num.num_1 {
      @kernel.mk_type("1", @list.List([]))
    } else {
      let name = if @num.mod_num(n, @num.num_2) == @num.num_0 {
        "tybit0"
      } else {
        "tybit1"
      }
      @kernel.mk_type(name, @list.singleton(finty(@num.quo_num(n, @num.num_2))))
    }
  }

  finty(n)
}

///|
pub fn dest_finty(ty : HolType) -> @num.Num raise {
  match ty {
    Tyapp("1", _) => @num.num_1
    Tyapp("tybit0", More(t, tail=Empty)) => dest_finty(t) * @num.num_2
    Tyapp("tybit1", More(t, tail=Empty)) =>
      @num.succ_num(dest_finty(t) * @num.num_2)
    _ => raise Failure("dest_finty")
  }
}

///|
/// Variables named `s` (or `s0`, `s1`, ...) of the given types, avoiding
/// `avoid`.
pub fn make_args(
  s : String,
  avoid : List[Term],
  tys : List[HolType],
) -> List[Term] raise {
  if tys.length() == 1 {
    return @list.singleton(
      @kernel.variant(avoid, @kernel.mk_var(s, @lib.hd(tys))),
    )
  }
  let out = []
  let mut avoid = avoid
  let mut n = 0
  for ty in tys {
    let v = @kernel.variant(avoid, @kernel.mk_var(s + n.to_string(), ty))
    out.push(v)
    avoid = avoid.prepend(v)
    n += 1
  }
  @list.List(out)
}

// ---------------------------------------------------------------------------
// Director strings down a term.
// ---------------------------------------------------------------------------

///|
/// The path (`b` = body, `r` = rand, `l` = rator) to the first subterm
/// satisfying `p`, trying operands before operators.
pub fn find_path(p : (Term) -> Bool raise, tm : Term) -> String raise {
  fn go(tm : Term) -> List[String] raise {
    if p(tm) {
      return @list.List([])
    }
    if @kernel.is_abs(tm) {
      return go(body(tm)).prepend("b")
    }
    go(@kernel.rand(tm)).prepend("r") catch {
      Failure(_) => go(@kernel.rator(tm)).prepend("l")
      e => raise e
    }
  }

  @lib.implode(go(tm))
}

///|
pub fn follow_path(s : String, tm : Term) -> Term raise {
  let mut tm = tm
  for c in s {
    tm = match c {
      'l' => @kernel.rator(tm)
      'r' => @kernel.rand(tm)
      _ => body(tm)
    }
  }
  tm
}

///|
/// The atoms of a term considered as a propositional formula.
pub fn atoms(tm : Term) -> List[Term] raise {
  if @kernel.type_of(tm) != @kernel.bool_ty {
    raise Failure("atoms: not Boolean")
  }
  fn go(acc : @lib.Func[Term, Unit], tm : Term) -> @lib.Func[Term, Unit] {
    match tm {
      Comb(Comb(Const("/\\", _), l), r)
      | Comb(Comb(Const("\\/", _), l), r)
      | Comb(Comb(Const("==>", _), l), r)
      | Comb(
        Comb(Const("=", Tyapp("fun", More(Tyapp("bool", Empty), tail=_))), l),
        r
      ) => go(go(acc, l), r)
      Comb(Const("~", _), l) => go(acc, l)
      _ => @lib.update(tm, (), acc)
    }
  }

  @lib.foldl(
    (a, x, _) => a.prepend(x),
    @list.List([]),
    go(@lib.undefined(), tm),
  )
}

///|
/// The `genvar` counter (for differential tests of load order).
pub fn genvar_counter() -> Int32 {
  gcounter.val
}
