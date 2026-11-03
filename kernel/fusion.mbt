// ---------------------------------------------------------------------------
// Private list helpers. These mirror the lib.ml functions fusion.ml uses,
// so the kernel does not depend on the (untrusted) lib package. They keep
// OCaml's result order and sharing behaviour.
// ---------------------------------------------------------------------------

///|
fn[A : Eq] mem(x : A, l : @list.List[A]) -> Bool {
  for y in l {
    if x == y {
      return true
    }
  }
  false
}

///|
/// `union l1 l2 = itlist insert l1 l2`: the elements of `l1` that are not in
/// `l2` (and not repeated later in `l1`) are put in front of `l2`, keeping
/// their order.
fn[A : Eq] union(l1 : @list.List[A], l2 : @list.List[A]) -> @list.List[A] {
  let mut acc = l2
  for x in l1.rev() {
    if !mem(x, acc) {
      acc = acc.prepend(x)
    }
  }
  acc
}

///|
/// Suffixes of a list: `suffixes(l)[i]` is `l` with its first `i` cells
/// dropped (physically the same cells), for `i` in `0..=length`.
fn[A] suffixes(l : @list.List[A]) -> Array[@list.List[A]] {
  let out = [l]
  let mut rest = l
  while true {
    match rest {
      More(_, tail=t) => {
        out.push(t)
        rest = t
      }
      Empty => break
    }
  }
  out
}

///|
/// `filter` that returns the original list when nothing is removed. Only
/// used with pure predicates, so evaluation order and partial sharing are
/// unobservable.
fn[A] filter_share(p : (A) -> Bool, l : @list.List[A]) -> @list.List[A] {
  if l.all(p) {
    l
  } else {
    l.filter(p)
  }
}

///|
fn[A : Eq] subtract(l1 : @list.List[A], l2 : @list.List[A]) -> @list.List[A] {
  filter_share(x => !mem(x, l2), l1)
}

///|
fn[A : Eq] subset(l1 : @list.List[A], l2 : @list.List[A]) -> Bool {
  l1.all(x => mem(x, l2))
}

///|
/// `rev_assocd a l d`: the first `x` with `(x, a)` in `l`, or `d`.
fn[A, B : Eq] rev_assocd(a : B, l : @list.List[(A, B)], d : A) -> A {
  for pair in l {
    if pair.1 == a {
      return pair.0
    }
  }
  d
}

///|
/// `lib.ml`'s `qmap`: map that keeps the original cells after the last
/// (physically) changed element, and returns `l` itself if nothing changed.
/// `f` is applied from the head of the list, as in OCaml.
fn[A] qmap(f : (A) -> A raise?, l : @list.List[A]) -> @list.List[A] raise? {
  let suf = suffixes(l)
  let n = suf.length() - 1
  let images = Array(capacity=n)
  let mut last_changed = -1
  for i in 0..<n {
    match suf[i] {
      More(x, tail=_) => {
        let y = f(x)
        if !physical_equal(x, y) {
          last_changed = i
        }
        images.push(y)
      }
      Empty => ()
    }
  }
  let mut acc = suf[last_changed + 1]
  for i = last_changed; i >= 0; i = i - 1 {
    acc = acc.prepend(images[i])
  }
  acc
}

// ---------------------------------------------------------------------------
// Type constants. Initially just `bool` and the function space constructor;
// later `ind` is added as primitive. All other types come from definitions.
// ---------------------------------------------------------------------------

///|
let the_type_constants : Ref[@list.List[(String, Int64)]] = Ref::{
  val: @list.List([("bool", 0L), ("fun", 2L)]),
}

///|
/// All type constants with their arities (OCaml ints), most recent first.
pub fn types() -> @list.List[(String, Int64)] {
  the_type_constants.val
}

///|
/// Arity of a type constant.
pub fn get_type_arity(s : String) -> Int64 raise {
  for entry in the_type_constants.val {
    if entry.0 == s {
      return entry.1
    }
  }
  failwith("find")
}

///|
fn check_new_type(name : String) -> Unit raise {
  if the_type_constants.val.any(entry => entry.0 == name) {
    failwith("new_type: type " + name + " has already been declared")
  }
}

///|
/// Declare a new type constant.
pub fn new_type(name : String, arity : Int64) -> Unit raise {
  check_new_type(name)
  the_type_constants.val = the_type_constants.val.prepend((name, arity))
}

///|
pub fn mk_type(tyop : String, args : @list.List[HolType]) -> HolType raise {
  let arity = get_type_arity(tyop) catch {
    _ => failwith("mk_type: type " + tyop + " has not been defined")
  }
  if arity == args.length().to_int64() {
    Tyapp(tyop, args)
  } else {
    failwith("mk_type: wrong number of arguments to " + tyop)
  }
}

///|
pub fn mk_vartype(v : String) -> HolType {
  Tyvar(v)
}

///|
pub fn dest_type(ty : HolType) -> (String, @list.List[HolType]) raise {
  match ty {
    Tyapp(s, args) => (s, args)
    Tyvar(_) => failwith("dest_type: type variable not a constructor")
  }
}

///|
pub fn dest_vartype(ty : HolType) -> String raise {
  match ty {
    Tyapp(_) => failwith("dest_vartype: type constructor not a variable")
    Tyvar(s) => s
  }
}

///|
pub fn is_type(ty : HolType) -> Bool {
  ty is Tyapp(_)
}

///|
pub fn is_vartype(ty : HolType) -> Bool {
  ty is Tyvar(_)
}

///|
/// Type variables in a type, in OCaml's `itlist (union o tyvars)` order.
pub fn tyvars(ty : HolType) -> @list.List[HolType] {
  match ty {
    Tyapp(_, args) =>
      args
      .rev()
      .fold(init=@list.List([]), (acc, arg) => union(tyvars(arg), acc))
    Tyvar(_) => @list.singleton(ty)
  }
}

///|
/// Substitute types for type variables. Non-variables in the substitution
/// list are ignored, and for repeated variables the first entry wins.
pub fn type_subst(i : @list.List[(HolType, HolType)], ty : HolType) -> HolType {
  match ty {
    Tyapp(tycon, args) => {
      let args1 = qmap(a => type_subst(i, a), args)
      if physical_equal(args1, args) {
        ty
      } else {
        Tyapp(tycon, args1)
      }
    }
    _ => rev_assocd(ty, i, ty)
  }
}

///|
pub let bool_ty : HolType = Tyapp("bool", @list.List([]))

///|
pub let aty : HolType = Tyvar("A")

///|
fn fun_ty(a : HolType, b : HolType) -> HolType {
  Tyapp("fun", @list.List([a, b]))
}

// ---------------------------------------------------------------------------
// Term constants. Initially just equality (over all types); the Hilbert
// choice operator is added later. All others are defined.
// ---------------------------------------------------------------------------

///|
let the_term_constants : Ref[@list.List[(String, HolType)]] = Ref::{
  val: @list.singleton(("=", fun_ty(aty, fun_ty(aty, bool_ty)))),
}

///|
/// All constants with their generic types, most recent first.
pub fn constants() -> @list.List[(String, HolType)] {
  the_term_constants.val
}

///|
/// Generic type of a constant.
pub fn get_const_type(s : String) -> HolType raise {
  for entry in the_term_constants.val {
    if entry.0 == s {
      return entry.1
    }
  }
  failwith("find")
}

///|
fn check_new_constant(name : String) -> Unit raise {
  if the_term_constants.val.any(entry => entry.0 == name) {
    failwith("new_constant: constant " + name + " has already been declared")
  }
}

///|
/// Declare a new constant.
pub fn new_constant(name : String, ty : HolType) -> Unit raise {
  check_new_constant(name)
  the_term_constants.val = the_term_constants.val.prepend((name, ty))
}

///|
/// The type of a term. Every `Term` value is well-typed by construction.
pub fn type_of(tm : Term) -> HolType {
  match tm {
    Var(_, ty) | Const(_, ty) => ty
    Comb(s, _) =>
      match type_of(s) {
        Tyapp("fun", More(_, tail=More(rty, tail=Empty))) => rty
        _ => abort("type_of: ill-typed combination")
      }
    Abs(Var(_, ty), t) => fun_ty(ty, type_of(t))
    Abs(_) => abort("type_of: abstraction over a non-variable")
  }
}

///|
pub fn is_var(tm : Term) -> Bool {
  tm is Var(_)
}

///|
pub fn is_const(tm : Term) -> Bool {
  tm is Const(_)
}

///|
pub fn is_abs(tm : Term) -> Bool {
  tm is Abs(_)
}

///|
pub fn is_comb(tm : Term) -> Bool {
  tm is Comb(_)
}

///|
pub fn mk_var(v : String, ty : HolType) -> Term {
  Var(v, ty)
}

///|
/// Instance of a constant, with its generic type instantiated by `theta`.
pub fn mk_const(
  name : String,
  theta : @list.List[(HolType, HolType)],
) -> Term raise {
  let uty = get_const_type(name) catch {
    _ => failwith("mk_const: not a constant name")
  }
  Const(name, type_subst(theta, uty))
}

///|
pub fn mk_abs(bvar : Term, bod : Term) -> Term raise {
  match bvar {
    Var(_) => Abs(bvar, bod)
    _ => failwith("mk_abs: not a variable")
  }
}

///|
pub fn mk_comb(f : Term, a : Term) -> Term raise {
  match type_of(f) {
    Tyapp("fun", More(ty, tail=More(_, tail=Empty))) if ty == type_of(a) =>
      Comb(f, a)
    _ => failwith("mk_comb: types do not agree")
  }
}

///|
pub fn dest_var(tm : Term) -> (String, HolType) raise {
  match tm {
    Var(s, ty) => (s, ty)
    _ => failwith("dest_var: not a variable")
  }
}

///|
pub fn dest_const(tm : Term) -> (String, HolType) raise {
  match tm {
    Const(s, ty) => (s, ty)
    _ => failwith("dest_const: not a constant")
  }
}

///|
pub fn dest_comb(tm : Term) -> (Term, Term) raise {
  match tm {
    Comb(f, x) => (f, x)
    _ => failwith("dest_comb: not a combination")
  }
}

///|
pub fn dest_abs(tm : Term) -> (Term, Term) raise {
  match tm {
    Abs(v, b) => (v, b)
    _ => failwith("dest_abs: not an abstraction")
  }
}

///|
/// Free variables of a term, in OCaml HOL Light's order.
pub fn frees(tm : Term) -> @list.List[Term] {
  match tm {
    Var(_) => @list.singleton(tm)
    Const(_) => @list.List([])
    Abs(bv, bod) => subtract(frees(bod), @list.singleton(bv))
    Comb(s, t) => union(frees(s), frees(t))
  }
}

///|
/// Free variables of a list of terms.
pub fn freesl(tml : @list.List[Term]) -> @list.List[Term] {
  tml.rev().fold(init=@list.List([]), (acc, t) => union(frees(t), acc))
}

///|
/// Whether all free variables of `tm` appear in `acc`.
pub fn freesin(acc : @list.List[Term], tm : Term) -> Bool {
  match tm {
    Var(_) => mem(tm, acc)
    Const(_) => true
    Abs(bv, bod) => freesin(acc.prepend(bv), bod)
    Comb(s, t) => freesin(acc, s) && freesin(acc, t)
  }
}

///|
/// Whether a variable (or constant) occurs free in a term.
pub fn vfree_in(v : Term, tm : Term) -> Bool {
  match tm {
    Abs(bv, bod) => v != bv && vfree_in(v, bod)
    Comb(s, t) => vfree_in(v, s) || vfree_in(v, t)
    _ => tm == v
  }
}

///|
/// Type variables occurring in a term.
pub fn type_vars_in_term(tm : Term) -> @list.List[HolType] {
  match tm {
    Var(_, ty) | Const(_, ty) => tyvars(ty)
    Comb(s, t) => union(type_vars_in_term(s), type_vars_in_term(t))
    Abs(Var(_, ty), t) => union(tyvars(ty), type_vars_in_term(t))
    Abs(_) => abort("type_vars_in_term: abstraction over a non-variable")
  }
}

///|
/// Rename variable `v` by priming it until it is not free in `avoid`.
pub fn variant(avoid : @list.List[Term], v : Term) -> Term raise {
  let mut v = v
  while avoid.any(t => vfree_in(v, t)) {
    match v {
      Var(s, ty) => v = Var(s + "'", ty)
      _ => failwith("variant: not a variable")
    }
  }
  v
}

// ---------------------------------------------------------------------------
// Substitution primitive (substitution for variables only!)
// ---------------------------------------------------------------------------

///|
fn vsubst_rec(ilist : @list.List[(Term, Term)], tm : Term) -> Term {
  match tm {
    Var(_) => rev_assocd(tm, ilist, tm)
    Const(_) => tm
    Comb(s, t) => {
      let s1 = vsubst_rec(ilist, s)
      let t1 = vsubst_rec(ilist, t)
      if physical_equal(s1, s) && physical_equal(t1, t) {
        tm
      } else {
        Comb(s1, t1)
      }
    }
    Abs(v, s) => {
      let ilist1 = filter_share((p : (Term, Term)) => p.1 != v, ilist)
      if ilist1.is_empty() {
        return tm
      }
      let s1 = vsubst_rec(ilist1, s)
      if physical_equal(s1, s) {
        tm
      } else if ilist1.any(p => vfree_in(v, p.0) && vfree_in(p.1, s)) {
        // `variant` only fails on non-variables, and `v` is a binder.
        let v1 = variant(@list.singleton(s1), v) catch {
          _ => abort("vsubst: variant of a non-variable")
        }
        Abs(v1, vsubst_rec(ilist1.prepend((v1, v)), s))
      } else {
        Abs(v, s1)
      }
    }
  }
}

///|
/// Substitute terms for variables: `theta` is a list of `(term, var)`
/// pairs, each term having the type of its variable.
pub fn vsubst(theta : @list.List[(Term, Term)], tm : Term) -> Term raise {
  if theta.is_empty() {
    return tm
  }
  let ok = theta.all(p => {
    match p.1 {
      Var(_, y) => type_of(p.0) == y
      _ => false
    }
  })
  if ok {
    vsubst_rec(theta, tm)
  } else {
    failwith("vsubst: Bad substitution list")
  }
}

// ---------------------------------------------------------------------------
// Type instantiation primitive.
// ---------------------------------------------------------------------------

///|
priv suberror Clash {
  Clash(Term)
}

///|
fn inst_rec(
  env : @list.List[(Term, Term)],
  tyin : @list.List[(HolType, HolType)],
  tm : Term,
) -> Term raise Clash {
  match tm {
    Var(n, ty) => {
      let ty1 = type_subst(tyin, ty)
      let tm1 = if physical_equal(ty1, ty) { tm } else { Var(n, ty1) }
      if rev_assocd(tm1, env, tm) == tm {
        tm1
      } else {
        raise Clash(tm1)
      }
    }
    Const(c, ty) => {
      let ty1 = type_subst(tyin, ty)
      if physical_equal(ty1, ty) {
        tm
      } else {
        Const(c, ty1)
      }
    }
    Comb(f, x) => {
      let f1 = inst_rec(env, tyin, f)
      let x1 = inst_rec(env, tyin, x)
      if physical_equal(f1, f) && physical_equal(x1, x) {
        tm
      } else {
        Comb(f1, x1)
      }
    }
    Abs(y, t) => {
      let y1 = inst_rec(@list.List([]), tyin, y)
      let env1 = env.prepend((y, y1))
      try inst_rec(env1, tyin, t) catch {
        Clash(w1) => {
          if w1 != y1 {
            raise Clash(w1)
          }
          let ifrees = qmap(u => inst_rec(@list.List([]), tyin, u), frees(t))
          let y2 = variant(ifrees, y1) catch {
            _ => abort("inst: variant of a non-variable")
          }
          let name = match y2 {
            Var(name, _) => name
            _ => abort("inst: variant of a non-variable")
          }
          let z = Var(name, type_of(y))
          let body = vsubst_rec(@list.singleton((z, y)), t)
          inst_rec(env, tyin, Abs(z, body))
        }
      } noraise {
        t1 =>
          if physical_equal(y1, y) && physical_equal(t1, t) {
            tm
          } else {
            Abs(y1, t1)
          }
      }
    }
  }
}

///|
/// Instantiate type variables in a term, renaming bound variables where
/// necessary to avoid capture.
pub fn inst(tyin : @list.List[(HolType, HolType)], tm : Term) -> Term {
  if tyin.is_empty() {
    return tm
  }
  inst_rec(@list.List([]), tyin, tm) catch {
    // A clash with an empty environment is impossible: every variable in
    // `env` was bound by an enclosing abstraction.
    _ => abort("inst: unexpected clash")
  }
}

// ---------------------------------------------------------------------------
// A few bits of general derived syntax.
// ---------------------------------------------------------------------------

///|
pub fn rator(tm : Term) -> Term raise {
  match tm {
    Comb(l, _) => l
    _ => failwith("rator: Not a combination")
  }
}

///|
pub fn rand(tm : Term) -> Term raise {
  match tm {
    Comb(_, r) => r
    _ => failwith("rand: Not a combination")
  }
}

///|
fn safe_mk_eq(l : Term, r : Term) -> Term {
  let ty = type_of(l)
  Comb(Comb(Const("=", fun_ty(ty, fun_ty(ty, bool_ty))), l), r)
}

///|
pub fn dest_eq(tm : Term) -> (Term, Term) raise {
  match tm {
    Comb(Comb(Const("=", _), l), r) => (l, r)
    _ => failwith("dest_eq")
  }
}

// ---------------------------------------------------------------------------
// Term ordering modulo alpha-conversion, used to keep assumption lists as
// sorted sets.
// ---------------------------------------------------------------------------

///|
fn ordav(env : @list.List[(Term, Term)], x1 : Term, x2 : Term) -> Int32 {
  for pair in env {
    let (t1, t2) = pair
    if x1 == t1 {
      return if x2 == t2 { 0 } else { -1 }
    } else if x2 == t2 {
      return 1
    }
  }
  x1.compare(x2)
}

///|
fn orda(env : @list.List[(Term, Term)], tm1 : Term, tm2 : Term) -> Int32 {
  if physical_equal(tm1, tm2) && env.all(p => p.0 == p.1) {
    return 0
  }
  match (tm1, tm2) {
    (Var(_), Var(_)) => ordav(env, tm1, tm2)
    (Const(_), Const(_)) => tm1.compare(tm2)
    (Comb(s1, t1), Comb(s2, t2)) => {
      let c = orda(env, s1, s2)
      if c != 0 {
        c
      } else {
        orda(env, t1, t2)
      }
    }
    (Abs(Var(_, ty1) as x1, t1), Abs(Var(_, ty2) as x2, t2)) => {
      let c = ty1.compare(ty2)
      if c != 0 {
        c
      } else {
        orda(env.prepend((x1, x2)), t1, t2)
      }
    }
    (Const(_), _) => -1
    (_, Const(_)) => 1
    (Var(_), _) => -1
    (_, Var(_)) => 1
    (Comb(_), _) => -1
    (_, Comb(_)) => 1
    _ => abort("orda: abstraction over a non-variable")
  }
}

///|
/// Total order on terms that identifies alpha-equivalent terms.
pub fn alphaorder(tm1 : Term, tm2 : Term) -> Int32 {
  orda(@list.List([]), tm1, tm2)
}

///|
/// Merge two alpha-ordered term lists.
fn term_union(l1 : @list.List[Term], l2 : @list.List[Term]) -> @list.List[Term] {
  if l1.is_empty() {
    return l2
  }
  if l2.is_empty() {
    return l1
  }
  let out = []
  let mut a = l1
  let mut b = l2
  while true {
    match (a, b) {
      (Empty, rest) | (rest, Empty) => {
        let mut acc = rest
        for i = out.length() - 1; i >= 0; i = i - 1 {
          acc = acc.prepend(out[i])
        }
        return acc
      }
      (More(h1, tail=t1), More(h2, tail=t2)) => {
        let c = alphaorder(h1, h2)
        if c == 0 {
          out.push(h1)
          a = t1
          b = t2
        } else if c < 0 {
          out.push(h1)
          a = t1
        } else {
          out.push(h2)
          b = t2
        }
      }
    }
  }
  l1
}

///|
/// Remove the element alpha-equivalent to `t` (if any) from a sorted list.
fn term_remove(t : Term, l : @list.List[Term]) -> @list.List[Term] {
  let prefix = []
  let mut rest = l
  while true {
    match rest {
      More(s, tail=ss) => {
        let c = alphaorder(t, s)
        if c > 0 {
          prefix.push(s)
          rest = ss
        } else if c == 0 {
          let mut acc = ss
          for i = prefix.length() - 1; i >= 0; i = i - 1 {
            acc = acc.prepend(prefix[i])
          }
          return acc
        } else {
          return l
        }
      }
      Empty => return l
    }
  }
  l
}

///|
/// Apply `f` to every element of a sorted list and re-sort. Keeps the
/// original cells of the longest unchanged suffix, as upstream does.
fn term_image(
  f : (Term) -> Term raise?,
  l : @list.List[Term],
) -> @list.List[Term] raise? {
  // OCaml: `let h' = f h and t' = term_image f t in ...`, evaluated
  // left to right, so `f` is applied from the head of the list.
  let suf = suffixes(l)
  let n = suf.length() - 1
  let heads = Array(capacity=n)
  let images = Array(capacity=n)
  for i in 0..<n {
    match suf[i] {
      More(x, tail=_) => {
        heads.push(x)
        images.push(f(x))
      }
      Empty => ()
    }
  }
  let mut acc = suf[n]
  let mut same = true
  for i = n - 1; i >= 0; i = i - 1 {
    if same && physical_equal(images[i], heads[i]) {
      acc = suf[i]
    } else {
      same = false
      acc = term_union(@list.singleton(images[i]), acc)
    }
  }
  acc
}

// ---------------------------------------------------------------------------
// Basic theorem destructors.
// ---------------------------------------------------------------------------

///|
pub fn dest_thm(th : Thm) -> (@list.List[Term], Term) {
  (th.hyps, th.concl)
}

///|
pub fn hyp(th : Thm) -> @list.List[Term] {
  th.hyps
}

///|
pub fn concl(th : Thm) -> Term {
  th.concl
}

// ---------------------------------------------------------------------------
// Primitive inference rules.
// ---------------------------------------------------------------------------

///|
/// `REFL`: `|- t = t`
pub fn refl(tm : Term) -> Thm {
  { hyps: @list.List([]), concl: safe_mk_eq(tm, tm), }
}

///|
/// `TRANS`: `A1 |- a = b`, `A2 |- b' = c` (b, b' alpha-equivalent) gives
/// `A1 u A2 |- a = c`.
pub fn trans(th1 : Thm, th2 : Thm) -> Thm raise {
  match (th1.concl, th2.concl) {
    (Comb(Comb(Const("=", _), _) as eql, m1), Comb(Comb(Const("=", _), m2), r)) if alphaorder(
        m1, m2,
      ) ==
      0 => { hyps: term_union(th1.hyps, th2.hyps), concl: Comb(eql, r), }
    _ => failwith("TRANS")
  }
}

///|
/// `MK_COMB`: `A1 |- f = g`, `A2 |- x = y` gives `A1 u A2 |- f x = g y`.
pub fn mk_comb_rule(th1 : Thm, th2 : Thm) -> Thm raise {
  match (th1.concl, th2.concl) {
    (Comb(Comb(Const("=", _), l1), r1), Comb(Comb(Const("=", _), l2), r2)) =>
      match type_of(r1) {
        Tyapp("fun", More(ty, tail=More(_, tail=Empty))) if ty == type_of(r2) =>
          {
            hyps: term_union(th1.hyps, th2.hyps),
            concl: safe_mk_eq(Comb(l1, l2), Comb(r1, r2)),
          }
        _ => failwith("MK_COMB: types do not agree")
      }
    _ => failwith("MK_COMB: not both equations")
  }
}

///|
/// `ABS`: `A |- l = r` gives `A |- (\v. l) = (\v. r)` if `v` is not free in `A`.
pub fn abs_rule(v : Term, th : Thm) -> Thm raise {
  match (v, th.concl) {
    (Var(_), Comb(Comb(Const("=", _), l), r)) if !th.hyps.any(h => {
        vfree_in(v, h)
      }) => { hyps: th.hyps, concl: safe_mk_eq(Abs(v, l), Abs(v, r)), }
    _ => failwith("ABS")
  }
}

///|
/// `BETA`: `|- (\x. t) x = t`
pub fn beta(tm : Term) -> Thm raise {
  match tm {
    Comb(Abs(v, bod), arg) if arg == v =>
      { hyps: @list.List([]), concl: safe_mk_eq(tm, bod), }
    _ => failwith("BETA: not a trivial beta-redex")
  }
}

///|
/// `ASSUME`: `p |- p`
pub fn assume_rule(tm : Term) -> Thm raise {
  if type_of(tm) == bool_ty {
    { hyps: @list.singleton(tm), concl: tm, }
  } else {
    failwith("ASSUME: not a proposition")
  }
}

///|
/// `EQ_MP`: `A1 |- p = q`, `A2 |- p'` (p, p' alpha-equivalent) gives `A1 u A2 |- q`.
pub fn eq_mp(th1 : Thm, th2 : Thm) -> Thm raise {
  match th1.concl {
    Comb(Comb(Const("=", _), l), r) if alphaorder(l, th2.concl) == 0 =>
      { hyps: term_union(th1.hyps, th2.hyps), concl: r, }
    _ => failwith("EQ_MP")
  }
}

///|
/// `DEDUCT_ANTISYM_RULE`: `A1 |- p`, `A2 |- q` gives `(A1 - {q}) u (A2 - {p}) |- p = q`.
pub fn deduct_antisym_rule(th1 : Thm, th2 : Thm) -> Thm {
  let asl1 = term_remove(th2.concl, th1.hyps)
  let asl2 = term_remove(th1.concl, th2.hyps)
  { hyps: term_union(asl1, asl2), concl: safe_mk_eq(th1.concl, th2.concl), }
}

///|
/// `INST_TYPE`: Instantiate type variables throughout a theorem.
pub fn inst_type(theta : @list.List[(HolType, HolType)], th : Thm) -> Thm {
  {
    hyps: term_image(t => inst(theta, t), th.hyps),
    concl: inst(theta, th.concl),
  }
}

///|
/// `INST`: Instantiate free variables throughout a theorem.
pub fn inst_rule(theta : @list.List[(Term, Term)], th : Thm) -> Thm raise {
  let hyps = term_image(t => vsubst(theta, t), th.hyps)
  { hyps, concl: vsubst(theta, th.concl), }
}

// ---------------------------------------------------------------------------
// Axioms.
// ---------------------------------------------------------------------------

///|
let the_axioms : Ref[@list.List[Thm]] = Ref::{ val: @list.List([]), }

///|
pub fn axioms() -> @list.List[Thm] {
  the_axioms.val
}

///|
pub fn new_axiom(tm : Term) -> Thm raise {
  if type_of(tm) == bool_ty {
    let th = { hyps: @list.List([]), concl: tm, }
    the_axioms.val = the_axioms.val.prepend(th)
    th
  } else {
    failwith("new_axiom: Not a proposition")
  }
}

// ---------------------------------------------------------------------------
// Definitions.
// ---------------------------------------------------------------------------

///|
let the_definitions : Ref[@list.List[Thm]] = Ref::{ val: @list.List([]), }

///|
pub fn definitions() -> @list.List[Thm] {
  the_definitions.val
}

///|
/// Define a new constant `c` by `c = r`, where `r` is closed and its type
/// variables all occur in the type of `c`.
pub fn new_basic_definition(tm : Term) -> Thm raise {
  match tm {
    Comb(Comb(Const("=", _), Var(cname, ty)), r) => {
      if !freesin(@list.List([]), r) {
        let names = frees(r).map(v => {
          match v {
            Var(name, _) => name
            _ => ""
          }
        })
        failwith(
          "new_definition: term not closed: " +
          names.to_array().join(", ").to_string(),
        )
      }
      if !subset(type_vars_in_term(r), tyvars(ty)) {
        failwith("new_definition: Type variables not reflected in constant")
      }
      check_new_constant(cname)
      let c = Const(cname, ty)
      let dth = { hyps: @list.List([]), concl: safe_mk_eq(c, r), }
      // Publish only after every check has passed and the theorem exists.
      the_term_constants.val = the_term_constants.val.prepend((cname, ty))
      the_definitions.val = the_definitions.val.prepend(dth)
      dth
    }
    Comb(Comb(Const("=", _), Const(cname, _)), _) =>
      failwith("new_basic_definition: '" + cname + "' is already defined")
    _ => failwith("new_basic_definition")
  }
}

///|
/// OCaml `sort (<=)` on types, as used by `new_basic_type_definition`.
/// The order of equal elements is irrelevant here because they are
/// structurally identical.
fn sort_types(l : @list.List[HolType]) -> @list.List[HolType] {
  let arr = l.to_array()
  arr.sort_by((a, b) => a.compare(b))
  @list.List(arr)
}

///|
/// Define a new type from a nonempty subset of an existing type:
///
/// ```text
///             |- P t
///    ---------------------------
///        |- abs(rep a) = a
///     |- P r = (rep(abs r) = r)
/// ```
pub fn new_basic_type_definition(
  tyname : String,
  absname : String,
  repname : String,
  th : Thm,
) -> (Thm, Thm) raise {
  let in_use = name => the_term_constants.val.any(e => e.0 == name)
  if in_use(absname) || in_use(repname) {
    failwith("new_basic_type_definition: Constant(s) already in use")
  }
  if !th.hyps.is_empty() {
    failwith("new_basic_type_definition: Assumptions in theorem")
  }
  let (p, x) = match th.concl {
    Comb(p, x) => (p, x)
    _ => failwith("new_basic_type_definition: Not a combination")
  }
  if !freesin(@list.List([]), p) {
    failwith("new_basic_type_definition: Predicate is not closed")
  }
  let tyvars = sort_types(type_vars_in_term(p))
  check_new_type(tyname) catch {
    _ => failwith("new_basic_type_definition: Type already defined")
  }
  // Upstream registers the type and the abstraction constant before
  // discovering that the two constant names coincide, and then fails with
  // this message. Here it fails before any state changes.
  if absname == repname {
    failwith("new_constant: constant " + repname + " has already been declared")
  }
  let aty = Tyapp(tyname, tyvars)
  let rty = type_of(x)
  let absty = fun_ty(rty, aty)
  let repty = fun_ty(aty, rty)
  let abs = Const(absname, absty)
  let rep = Const(repname, repty)
  let a = Var("a", aty)
  let r = Var("r", rty)
  let th1 = {
    hyps: @list.List([]),
    concl: safe_mk_eq(Comb(abs, Comb(rep, a)), a),
  }
  let th2 = {
    hyps: @list.List([]),
    concl: safe_mk_eq(Comb(p, r), safe_mk_eq(Comb(rep, Comb(abs, r)), r)),
  }
  // Publish only after every check has passed and both theorems exist.
  the_type_constants.val = the_type_constants.val.prepend(
    (tyname, tyvars.length().to_int64()),
  )
  the_term_constants.val = the_term_constants.val
    .prepend((absname, absty))
    .prepend((repname, repty))
  (th1, th2)
}
