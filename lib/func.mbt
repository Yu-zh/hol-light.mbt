// ===========================================================================
// Polymorphic finite partial functions via Patricia trees (lib.ml's
// `func`, `|->`, `apply`, ...).
//
// The representation is canonical (equal functions have the same tree) only
// because keys are placed by OCaml's `Hashtbl.hash`; `OHash` reproduces it,
// so trees, folds and `choose` agree with OCaml HOL Light.
//
// Renamings: `x |-> y` → `update(x, y, f)`, `x |=> y` → `single(x, y)`.
// ===========================================================================

///|
/// A finite partial function from `K` to `V`. Read-only outside this
/// package so that only the operations below build trees. Equality is
/// structural, as OCaml's `=` on the same trees.
#derive(Eq)
pub enum Func[K, V] {
  Empty
  Leaf(Int32, @list.List[(K, V)])
  Branch(Int32, Int32, Func[K, V], Func[K, V])
}

///|
pub extend Func with Eq::{not_equal, equal}

///|
pub extend Func with OCompare::{ocompare}

///|
pub extend Func with OHash::{ohash_visit}

///|
/// The everywhere-undefined function.
pub fn[K, V] undefined() -> Func[K, V] {
  Empty
}

///|
pub fn[K, V] is_undefined(f : Func[K, V]) -> Bool {
  f is Empty
}

///|
/// Apply `g` to every value. As in OCaml, right subtrees and later list
/// elements are processed first.
pub fn[K, V, W] mapf(g : (V) -> W raise?, t : Func[K, V]) -> Func[K, W] raise? {
  match t {
    Empty => Empty
    Leaf(h, l) => {
      let arr = l.to_array()
      let mut acc = @list.List([])
      for i = arr.length() - 1; i >= 0; i = i - 1 {
        acc = acc.prepend((arr[i].0, g(arr[i].1)))
      }
      Leaf(h, acc)
    }
    Branch(p, b, l, r) => {
      let r1 = mapf(g, r)
      let l1 = mapf(g, l)
      Branch(p, b, l1, r1)
    }
  }
}

///|
/// Left fold over the graph, in tree order.
pub fn[K, V, A] foldl(
  g : (A, K, V) -> A raise?,
  a : A,
  t : Func[K, V],
) -> A raise? {
  match t {
    Empty => a
    Leaf(_, l) => {
      let mut acc = a
      for p in l {
        acc = g(acc, p.0, p.1)
      }
      acc
    }
    Branch(_, _, l, r) => foldl(g, foldl(g, a, l), r)
  }
}

///|
/// Right fold over the graph, in tree order.
pub fn[K, V, A] foldr(
  g : (K, V, A) -> A raise?,
  t : Func[K, V],
  a : A,
) -> A raise? {
  match t {
    Empty => a
    Leaf(_, l) => {
      let arr = l.to_array()
      let mut acc = a
      for i = arr.length() - 1; i >= 0; i = i - 1 {
        acc = g(arr[i].0, arr[i].1, acc)
      }
      acc
    }
    Branch(_, _, l, r) => foldr(g, l, foldr(g, r, a))
  }
}

///|
/// The graph as a sorted list of pairs.
pub fn[K : OCompare, V : OCompare] graph(f : Func[K, V]) -> @list.List[(K, V)] {
  setify(foldl((a, x, y) => a.prepend((x, y)), @list.List([]), f))
}

///|
/// The domain as a sorted list.
pub fn[K : OCompare, V] dom(f : Func[K, V]) -> @list.List[K] {
  setify(foldl((a, x, _) => a.prepend(x), @list.List([]), f))
}

///|
/// The range as a sorted list.
pub fn[K, V : OCompare] ran(f : Func[K, V]) -> @list.List[V] {
  setify(foldl((a, _, y) => a.prepend(y), @list.List([]), f))
}

///|
/// The value of `f` at `x`, if defined (an extension: upstream uses
/// `defined` followed by `apply`).
pub fn[K : OCompare + OHash, V] apply_opt(f : Func[K, V], x : K) -> V? {
  lookup(f, x)
}

///|
/// The value of `f` at `x`, if defined.
fn[K : OCompare + OHash, V] lookup(f : Func[K, V], x : K) -> V? {
  let k = hash(x)
  let mut t = f
  while true {
    match t {
      Leaf(h, l) if h == k => {
        for p in l {
          let c = OCompare::ocompare(x, p.0)
          if c == 0 {
            return Some(p.1)
          } else if c < 0 {
            return None
          }
        }
        return None
      }
      Branch(p, b, l, r) if ((k ^ p) & (b - 1)) == 0 =>
        t = if (k & b) == 0 { l } else { r }
      _ => return None
    }
  }
  None
}

///|
/// Apply `f` to `x`, or `d x` if `x` is not in the domain.
pub fn[K : OCompare + OHash, V] applyd(
  f : Func[K, V],
  d : (K) -> V raise?,
  x : K,
) -> V raise? {
  match lookup(f, x) {
    Some(v) => v
    None => d(x)
  }
}

///|
pub fn[K : OCompare + OHash, V] apply(f : Func[K, V], x : K) -> V raise {
  applyd(f, _ => raise Failure("apply"), x)
}

///|
pub fn[K : OCompare + OHash, V] tryapplyd(f : Func[K, V], a : K, d : V) -> V {
  applyd(f, _ => d, a)
}

///|
/// Whether `x` is in the domain of `f`.
pub fn[K : OCompare + OHash, V] defined(f : Func[K, V], x : K) -> Bool {
  lookup(f, x) is Some(_)
}

///|
fn[K : OCompare, V] undefine_list(
  x : K,
  l : @list.List[(K, V)],
) -> @list.List[(K, V)] {
  let prefix = []
  let mut rest = l
  while rest is More(ab, tail=t) {
    let c = x.ocompare(ab.0)
    if c == 0 {
      return prepend_array(prefix, t)
    } else if c < 0 {
      return l
    }
    prefix.push(ab)
    rest = t
  }
  l
}

///|
/// Remove `x` from the domain (returns `t` itself if `x` was undefined).
pub fn[K : OCompare + OHash, V] undefine(x : K, t : Func[K, V]) -> Func[K, V] {
  let k = hash(x)
  fn und(t : Func[K, V]) -> Func[K, V] {
    match t {
      Leaf(h, l) if h == k => {
        let l1 = undefine_list(x, l)
        if physical_equal(l1, l) {
          t
        } else if l1.is_empty() {
          Empty
        } else {
          Leaf(h, l1)
        }
      }
      Branch(p, b, l, r) if (k & (b - 1)) == p =>
        if (k & b) == 0 {
          let l1 = und(l)
          if physical_equal(l1, l) {
            t
          } else {
            match l1 {
              Empty => r
              _ => Branch(p, b, l1, r)
            }
          }
        } else {
          let r1 = und(r)
          if physical_equal(r1, r) {
            t
          } else {
            match r1 {
              Empty => l
              _ => Branch(p, b, l, r1)
            }
          }
        }
      _ => t
    }
  }

  und(t)
}

///|
fn[K, V] newbranch(
  p1 : Int32,
  t1 : Func[K, V],
  p2 : Int32,
  t2 : Func[K, V],
) -> Func[K, V] {
  let zp = p1 ^ p2
  let b = zp & -zp
  let p = p1 & (b - 1)
  if (p1 & b) == 0 {
    Branch(p, b, t1, t2)
  } else {
    Branch(p, b, t2, t1)
  }
}

///|
fn[K : OCompare, V] define_list(
  xy : (K, V),
  l : @list.List[(K, V)],
) -> @list.List[(K, V)] {
  let prefix = []
  let mut rest = l
  while rest is More(ab, tail=t) {
    let c = xy.0.ocompare(ab.0)
    if c == 0 {
      return prepend_array(prefix, t.prepend(xy))
    } else if c < 0 {
      return prepend_array(prefix, rest.prepend(xy))
    }
    prefix.push(ab)
    rest = t
  }
  prepend_array(prefix, @list.singleton(xy))
}

///|
/// `(x |-> y) f`: `f` updated to map `x` to `y`.
pub fn[K : OCompare + OHash, V] update(
  x : K,
  y : V,
  f : Func[K, V],
) -> Func[K, V] {
  let k = hash(x)
  fn upd(t : Func[K, V]) -> Func[K, V] {
    match t {
      Empty => Leaf(k, @list.singleton((x, y)))
      Leaf(h, l) =>
        if h == k {
          Leaf(h, define_list((x, y), l))
        } else {
          newbranch(h, t, k, Leaf(k, @list.singleton((x, y))))
        }
      Branch(p, b, l, r) =>
        if (k & (b - 1)) != p {
          newbranch(p, t, k, Leaf(k, @list.singleton((x, y))))
        } else if (k & b) == 0 {
          Branch(p, b, upd(l), r)
        } else {
          Branch(p, b, l, upd(r))
        }
    }
  }

  upd(f)
}

///|
/// `x |=> y`: the function defined only at `x`.
pub fn[K : OCompare + OHash, V] single(x : K, y : V) -> Func[K, V] {
  update(x, y, Empty)
}

///|
fn[K : OCompare, V] combine_list(
  op : (V, V) -> V raise?,
  z : (V) -> Bool raise?,
  l1 : @list.List[(K, V)],
  l2 : @list.List[(K, V)],
) -> @list.List[(K, V)] raise? {
  match (l1, l2) {
    (Empty, _) => l2
    (_, Empty) => l1
    (More(xy1, tail=t1), More(xy2, tail=t2)) => {
      let c = xy1.0.ocompare(xy2.0)
      if c < 0 {
        combine_list(op, z, t1, l2).prepend(xy1)
      } else if c > 0 {
        combine_list(op, z, l1, t2).prepend(xy2)
      } else {
        // `let y = op y1 y2 and l = combine_list ...`: left to right.
        let y = op(xy1.1, xy2.1)
        let l = combine_list(op, z, t1, t2)
        if z(y) {
          l
        } else {
          l.prepend((xy1.0, y))
        }
      }
    }
  }
}

///|
/// Combine two functions: where both are defined the values are combined
/// with `op`, and results satisfying `z` are dropped.
pub fn[K : OCompare, V] combine(
  op : (V, V) -> V raise?,
  z : (V) -> Bool raise?,
  t1 : Func[K, V],
  t2 : Func[K, V],
) -> Func[K, V] raise? {
  match (t1, t2) {
    (Empty, _) => t2
    (_, Empty) => t1
    (Leaf(h1, l1), Leaf(h2, l2)) =>
      if h1 == h2 {
        let l = combine_list(op, z, l1, l2)
        if l.is_empty() {
          Empty
        } else {
          Leaf(h1, l)
        }
      } else {
        newbranch(h1, t1, h2, t2)
      }
    (Leaf(k, _) as lf, Branch(p, b, l, r) as br) =>
      if (k & (b - 1)) == p {
        if (k & b) == 0 {
          match combine(op, z, lf, l) {
            Empty => r
            l1 => Branch(p, b, l1, r)
          }
        } else {
          match combine(op, z, lf, r) {
            Empty => l
            r1 => Branch(p, b, l, r1)
          }
        }
      } else {
        newbranch(k, lf, p, br)
      }
    (Branch(p, b, l, r) as br, Leaf(k, _) as lf) =>
      if (k & (b - 1)) == p {
        if (k & b) == 0 {
          match combine(op, z, l, lf) {
            Empty => r
            l1 => Branch(p, b, l1, r)
          }
        } else {
          match combine(op, z, r, lf) {
            Empty => l
            r1 => Branch(p, b, l, r1)
          }
        }
      } else {
        newbranch(p, br, k, lf)
      }
    (Branch(p1, b1, l1, r1), Branch(p2, b2, l2, r2)) =>
      if b1 < b2 {
        if (p2 & (b1 - 1)) != p1 {
          newbranch(p1, t1, p2, t2)
        } else if (p2 & b1) == 0 {
          match combine(op, z, l1, t2) {
            Empty => r1
            l => Branch(p1, b1, l, r1)
          }
        } else {
          match combine(op, z, r1, t2) {
            Empty => l1
            r => Branch(p1, b1, l1, r)
          }
        }
      } else if b2 < b1 {
        if (p1 & (b2 - 1)) != p2 {
          newbranch(p1, t1, p2, t2)
        } else if (p1 & b2) == 0 {
          match combine(op, z, t1, l2) {
            Empty => r2
            l => Branch(p2, b2, l, r2)
          }
        } else {
          match combine(op, z, t1, r2) {
            Empty => l2
            r => Branch(p2, b2, l2, r)
          }
        }
      } else if p1 == p2 {
        // `match (e1, e2) with` is evaluated left to right in OCaml (the
        // tuple is never built), unlike an ordinary tuple expression.
        let l = combine(op, z, l1, l2)
        let r = combine(op, z, r1, r2)
        match (l, r) {
          (Empty, r) => r
          (l, Empty) => l
          (l, r) => Branch(p1, b1, l, r)
        }
      } else {
        newbranch(p1, t1, p2, t2)
      }
  }
}

///|
/// An arbitrary element of the graph.
pub fn[K, V] choose(t : Func[K, V]) -> (K, V) raise {
  let mut t = t
  while true {
    match t {
      Empty => raise Failure("choose: completely undefined function")
      Leaf(_, l) => return hd(l)
      Branch(_, _, t1, _) => t = t1
    }
  }
  raise Failure("choose: completely undefined function")
}

///|
/// OCaml's structural order on `func` trees (Examples/sos.ml keys
/// polynomials by monomials, which are `func`s): `Empty`, an immediate,
/// is below the blocks; `Leaf` (tag 0) is below `Branch` (tag 1); two of
/// the same constructor compare field by field.
pub impl[K : OCompare, V : OCompare] OCompare for Func[K, V] with fn ocompare(
  self,
  other,
) {
  match (self, other) {
    (Empty, Empty) => 0
    (Empty, _) => -1
    (_, Empty) => 1
    (Leaf(h1, l1), Leaf(h2, l2)) => {
      let c = h1.compare(h2)
      if c != 0 {
        return c
      }
      compare(l1, l2)
    }
    (Leaf(_, _), Branch(_, _, _, _)) => -1
    (Branch(_, _, _, _), Leaf(_, _)) => 1
    (Branch(p1, b1, l1, r1), Branch(p2, b2, l2, r2)) => {
      let c = p1.compare(p2)
      if c != 0 {
        return c
      }
      let c = b1.compare(b2)
      if c != 0 {
        return c
      }
      let c = l1.ocompare(l2)
      if c != 0 {
        return c
      }
      r1.ocompare(r2)
    }
  }
}

///|
/// OCaml's `Hashtbl.hash` on a `func` tree.
pub impl[K : OHash, V : OHash] OHash for Func[K, V] with fn ohash_visit(self, h) {
  match self {
    Empty => h.int(0L)
    Leaf(k, l) => {
      h.block(0, 2)
      h.field(k)
      h.field(l)
    }
    Branch(p, b, l, r) => {
      h.block(1, 4)
      h.field(p)
      h.field(b)
      h.field(l)
      h.field(r)
    }
  }
}
