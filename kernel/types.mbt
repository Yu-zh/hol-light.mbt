// ===========================================================================
// Complete HOL kernel of types, terms and theorems (port of fusion.ml).
//
// This package is the trusted computing base. It depends only on
// moonbitlang/core. Values of `Thm` can be created only by the primitive
// inference rules, axioms and definitional principles in this package.
// ===========================================================================

///|
/// HOL types. Read-only outside this package: they can be inspected by
/// pattern matching but only constructed through `mk_type`/`mk_vartype`.
pub enum HolType {
  Tyvar(String)
  Tyapp(String, @list.List[HolType])
} derive(Hash, Debug)

///|
/// Structural equality, with a fast path for physically equal values (as
/// OCaml's `compare` has): types and terms share most of their subterms.
pub impl Eq for HolType with equal(self, other) {
  if physical_equal(self, other) {
    return true
  }
  match (self, other) {
    (Tyvar(s), Tyvar(t)) => s == t
    (Tyapp(s, l), Tyapp(t, m)) => s == t && l == m
    _ => false
  }
}

///|
/// HOL terms. Read-only outside this package: they can be inspected by
/// pattern matching but only constructed through the `mk_*` functions,
/// which guarantee well-typedness.
pub enum Term {
  Var(String, HolType)
  Const(String, HolType)
  Comb(Term, Term)
  Abs(Term, Term)
} derive(Hash, Debug)

///|
/// Structural equality, with a fast path for physically equal terms.
pub impl Eq for Term with equal(self, other) {
  if physical_equal(self, other) {
    return true
  }
  match (self, other) {
    (Var(x, a), Var(y, b)) | (Const(x, a), Const(y, b)) => x == y && a == b
    (Comb(f, x), Comb(g, y)) | (Abs(f, x), Abs(g, y)) => f == g && x == y
    _ => false
  }
}

///|
/// Theorems (sequents). The fields are private, so a `Thm` can only be
/// produced by the inference rules of this package.
pub struct Thm {
  priv hyps : @list.List[Term]
  priv concl : Term
} derive(Eq, Debug)

///|
fn[T] failwith(msg : String) -> T raise {
  raise Failure(msg)
}

// ---------------------------------------------------------------------------
// OCaml-compatible ordering.
//
// HOL Light relies on OCaml's polymorphic `compare`: the constructor tag is
// compared first, then the fields from left to right; `[]` sorts before any
// cons cell; and strings are compared byte by byte (the shorter one first on
// a common prefix). MoonBit's `String::compare` puts shorter strings first,
// so it must not be used here.
// ---------------------------------------------------------------------------

///|
/// OCaml `compare` on strings: lexicographic, as `String::lexical_compare`
/// (UTF-16 code units). This equals OCaml's byte order on UTF-8 for ASCII
/// and almost all of Unicode; it differs only between a code point in
/// U+E000..U+FFFF and one above U+FFFF at the same position, which HOL's
/// ASCII identifiers never contain.
pub fn compare_string(a : String, b : String) -> Int {
  a.lexical_compare(b)
}

///|
fn[A] compare_list(
  a : @list.List[A],
  b : @list.List[A],
  cmp : (A, A) -> Int,
) -> Int {
  let mut a = a
  let mut b = b
  while true {
    match (a, b) {
      (Empty, Empty) => return 0
      (Empty, More(_)) => return -1
      (More(_), Empty) => return 1
      (More(x, tail=xs), More(y, tail=ys)) => {
        let c = cmp(x, y)
        if c != 0 {
          return c
        }
        a = xs
        b = ys
      }
    }
  }
  0
}

///|
/// OCaml `compare` on HOL types.
pub impl Compare for HolType with fn compare(self, other) {
  if physical_equal(self, other) {
    return 0
  }
  match (self, other) {
    (Tyvar(s), Tyvar(t)) => compare_string(s, t)
    (Tyvar(_), Tyapp(_)) => -1
    (Tyapp(_), Tyvar(_)) => 1
    (Tyapp(s, l), Tyapp(t, m)) => {
      let c = compare_string(s, t)
      if c != 0 {
        c
      } else {
        compare_list(l, m, HolType::compare)
      }
    }
  }
}

///|
fn term_tag(tm : Term) -> Int {
  match tm {
    Var(_) => 0
    Const(_) => 1
    Comb(_) => 2
    Abs(_) => 3
  }
}

///|
/// Structural order on HOL terms (not modulo alpha; see `alphaorder`).
/// Keep universal quantification first among constants: simplification and
/// bounded proof search depend on this established precedence.
pub impl Compare for Term with fn compare(self, other) {
  if physical_equal(self, other) {
    return 0
  }
  match (self, other) {
    (Const(s, ty), Const(t, uy)) => {
      let c = if s == t {
        0
      } else if s == "forall" {
        -1
      } else if t == "forall" {
        1
      } else {
        compare_string(s, t)
      }
      if c != 0 {
        c
      } else {
        ty.compare(uy)
      }
    }
    (Var(s, ty), Var(t, uy)) => {
      let c = compare_string(s, t)
      if c != 0 {
        c
      } else {
        ty.compare(uy)
      }
    }
    (Comb(s1, t1), Comb(s2, t2)) | (Abs(s1, t1), Abs(s2, t2)) => {
      let c = s1.compare(s2)
      if c != 0 {
        c
      } else {
        t1.compare(t2)
      }
    }
    _ => term_tag(self).compare(term_tag(other))
  }
}

///|
/// OCaml `compare` on theorems: hypotheses first, then conclusion.
pub impl Compare for Thm with fn compare(self, other) {
  let c = compare_list(self.hyps, other.hyps, Term::compare)
  if c != 0 {
    c
  } else {
    self.concl.compare(other.concl)
  }
}

///|
pub extend HolType with Eq::{equal, not_equal}

///|
pub extend Term with Eq::{equal, not_equal}

///|
pub extend Thm with Eq::{equal, not_equal}

///|
pub extend HolType with Compare::{compare, op_lt, op_le, op_ge, op_gt}

///|
pub extend Term with Compare::{compare, op_lt, op_le, op_ge, op_gt}

///|
pub extend Thm with Compare::{compare, op_lt, op_le, op_ge, op_gt}

///|
pub extend HolType with @debug.Debug::{to_repr}

///|
pub extend HolType with Hash::{hash, hash_combine}

///|
pub extend Term with @debug.Debug::{to_repr}

///|
pub extend Term with Hash::{hash, hash_combine}

///|
pub extend Thm with @debug.Debug::{to_repr}
