// ===========================================================================
// Convenient library functions (port of lib.ml).
//
// Fidelity notes:
// - Callbacks are applied in the same order as in OCaml, including the
//   places where OCaml's right-to-left evaluation of constructor and
//   function arguments makes the order surprising (`filter`, `partition`,
//   `mapfilter`, `mapi`, `allpairs`, `itlist`, `sort`, ...).
// - List functions are loops rather than deep recursion (the wasm stack is
//   much smaller than OCaml's), but they keep the sharing behaviour of the
//   originals where it is observable through physical equality.
// - Equality/ordering on elements is OCaml's polymorphic `compare`
//   (`OCompare`), never MoonBit's `Compare`.
// - Combinators with uppercase or symbolic OCaml names are renamed:
//   `I` → `id`, `K` → `konst`, `C` → `flip`, `W` → `dup`, `o` → `compose`,
//   `F_F` → `pair_map`, `--` → `range`, `mem'` → `mem_eq` (and likewise for
//   the other primed set operations), `fail` → `failure`.
// ===========================================================================

///|
/// `failwith`: raise `Failure(msg)`.
pub fn[T] failwith(msg : String) -> T raise {
  raise Failure(msg)
}

///|
/// `fail()`: `failwith ""`.
pub fn[T] failure() -> T raise {
  raise Failure("")
}

///|
/// Raised to signal "no change" and avoid consing (lib.ml's `Unchanged`).
#derive(Debug)
pub(all) suberror Unchanged

///|
pub extend Unchanged with @debug.Debug::{to_repr}

// ---------------------------------------------------------------------------
// Combinators.
// ---------------------------------------------------------------------------

///|
pub fn[A, B, C] curry(f : ((A, B)) -> C raise?, x : A, y : B) -> C raise? {
  f((x, y))
}

///|
pub fn[A, B, C] uncurry(f : (A, B) -> C raise?, p : (A, B)) -> C raise? {
  f(p.0, p.1)
}

///|
/// `I`
pub fn[A] id(x : A) -> A {
  x
}

///|
/// `K`
pub fn[A, B] konst(x : A, _y : B) -> A {
  x
}

///|
/// `C`
pub fn[A, B, C] flip(f : (A, B) -> C raise?, x : B, y : A) -> C raise? {
  f(y, x)
}

///|
/// `W`
pub fn[A, B] dup(f : (A, A) -> B raise?, x : A) -> B raise? {
  f(x, x)
}

///|
/// `o`: function composition.
pub fn[A, B, C] compose(
  f : (B) -> C raise,
  g : (A) -> B raise,
) -> (A) -> C raise {
  x => f(g(x))
}

///|
/// `F_F`: apply two functions to the components of a pair. As in OCaml,
/// the second component is computed first.
pub fn[A, B, C, D] pair_map(
  f : (A) -> C raise?,
  g : (B) -> D raise?,
  p : (A, B),
) -> (C, D) raise? {
  let d = g(p.1)
  let c = f(p.0)
  (c, d)
}

// ---------------------------------------------------------------------------
// List basics.
// ---------------------------------------------------------------------------

///|
pub fn[A] hd(l : @list.List[A]) -> A raise {
  match l {
    More(h, tail=_) => h
    Empty => failwith("hd")
  }
}

///|
pub fn[A] tl(l : @list.List[A]) -> @list.List[A] raise {
  match l {
    More(_, tail=t) => t
    Empty => failwith("tl")
  }
}

///|
/// Build a list from an array, sharing `tail` after the last element.
fn[A] prepend_array(arr : ArrayView[A], tail : @list.List[A]) -> @list.List[A] {
  let mut acc = tail
  for i = arr.length() - 1; i >= 0; i = i - 1 {
    acc = acc.prepend(arr[i])
  }
  acc
}

///|
/// `map`: applies `f` from the head of the list.
pub fn[A, B] map(
  f : (A) -> B raise?,
  l : @list.List[A],
) -> @list.List[B] raise? {
  let out = []
  for x in l {
    out.push(f(x))
  }
  prepend_array(out, @list.List([]))
}

///|
pub fn[A] last(l : @list.List[A]) -> A raise {
  match l.last() {
    Some(x) => x
    None => failwith("last")
  }
}

///|
pub fn[A] butlast(l : @list.List[A]) -> @list.List[A] raise {
  if l.is_empty() {
    failwith("butlast")
  }
  let arr = l.to_array()
  prepend_array(arr[:arr.length() - 1], @list.List([]))
}

///|
/// `el n l`: the `n`th element (from 0).
pub fn[A] el(n : Int32, l : @list.List[A]) -> A raise {
  let mut n = n
  let mut l = l
  while n != 0 {
    l = tl(l)
    n -= 1
  }
  hd(l)
}

///|
pub fn[A] rev(l : @list.List[A]) -> @list.List[A] {
  l.rev()
}

///|
/// `map2`: applies `f` from the head; fails on a length mismatch after
/// processing the common prefix.
pub fn[A, B, C] map2(
  f : (A, B) -> C raise?,
  l1 : @list.List[A],
  l2 : @list.List[B],
) -> @list.List[C] raise {
  let out = []
  let mut a = l1
  let mut b = l2
  while true {
    match (a, b) {
      (Empty, Empty) => break
      (More(h1, tail=t1), More(h2, tail=t2)) => {
        out.push(f(h1, h2))
        a = t1
        b = t2
      }
      _ => raise Failure("map2: length mismatch")
    }
  }
  prepend_array(out, @list.List([]))
}

///|
/// `mapi`: `f i x` for each element. OCaml evaluates the recursive call
/// first, so `f` is applied from the last element to the first.
pub fn[A, B] mapi(
  f : (Int32, A) -> B raise?,
  l : @list.List[A],
) -> @list.List[B] raise? {
  let arr = l.to_array()
  let mut acc = @list.List([])
  for i = arr.length() - 1; i >= 0; i = i - 1 {
    acc = acc.prepend(f(i, arr[i]))
  }
  acc
}

// ---------------------------------------------------------------------------
// Attempting function or predicate applications.
// ---------------------------------------------------------------------------

///|
/// `can f x`: whether `f x` succeeds. Only `Failure` counts as failing;
/// other errors propagate, as in OCaml.
pub fn[A, B] can(f : (A) -> B raise, x : A) -> Bool raise {
  try f(x) catch {
    Failure(_) => false
    e => raise e
  } noraise {
    _ => true
  }
}

///|
pub fn[A] check(p : (A) -> Bool raise?, x : A) -> A raise {
  if p(x) {
    x
  } else {
    failwith("check")
  }
}

///|
/// Apply `f` `n` times.
pub fn[A] funpow(n : Int32, f : (A) -> A raise?, x : A) -> A raise? {
  let mut x = x
  for _ in 0..<n {
    x = f(x)
  }
  x
}

///|
/// Apply `f` until it fails.
pub fn[A] repeat(f : (A) -> A raise, x : A) -> A raise {
  let mut x = x
  while true {
    x = f(x) catch {
      Failure(_) => return x
      e => raise e
    }
  }
  x
}

// ---------------------------------------------------------------------------
// Various versions of list iteration.
// ---------------------------------------------------------------------------

///|
/// `itlist f [x1; ...; xn] b = f x1 (f x2 (... (f xn b)))`.
pub fn[A, B] itlist(
  f : (A, B) -> B raise?,
  l : @list.List[A],
  b : B,
) -> B raise? {
  let arr = l.to_array()
  let mut acc = b
  for i = arr.length() - 1; i >= 0; i = i - 1 {
    acc = f(arr[i], acc)
  }
  acc
}

///|
/// `rev_itlist f [x1; ...; xn] b = f xn (... (f x1 b))`.
pub fn[A, B] rev_itlist(
  f : (A, B) -> B raise?,
  l : @list.List[A],
  b : B,
) -> B raise? {
  let mut acc = b
  for x in l {
    acc = f(x, acc)
  }
  acc
}

///|
/// `end_itlist f [x1; ...; xn] = f x1 (f x2 (... xn))`.
pub fn[A] end_itlist(f : (A, A) -> A raise?, l : @list.List[A]) -> A raise {
  let arr = l.to_array()
  if arr.is_empty() {
    failwith("end_itlist")
  }
  let mut acc = arr[arr.length() - 1]
  for i = arr.length() - 2; i >= 0; i = i - 1 {
    acc = f(arr[i], acc)
  }
  acc
}

///|
/// `itlist2`: fails (before applying `f`) if the lengths differ.
pub fn[A, B, C] itlist2(
  f : (A, B, C) -> C raise?,
  l1 : @list.List[A],
  l2 : @list.List[B],
  b : C,
) -> C raise {
  let a1 = l1.to_array()
  let a2 = l2.to_array()
  if a1.length() != a2.length() {
    failwith("itlist2")
  }
  let mut acc = b
  for i = a1.length() - 1; i >= 0; i = i - 1 {
    acc = f(a1[i], a2[i], acc)
  }
  acc
}

///|
/// `rev_itlist2`: processes the common prefix, then fails if the lengths
/// differ.
pub fn[A, B, C] rev_itlist2(
  f : (A, B, C) -> C raise?,
  l1 : @list.List[A],
  l2 : @list.List[B],
  b : C,
) -> C raise {
  let mut acc = b
  let mut a = l1
  let mut c = l2
  while true {
    match (a, c) {
      (Empty, Empty) => break
      (More(h1, tail=t1), More(h2, tail=t2)) => {
        acc = f(h1, h2, acc)
        a = t1
        c = t2
      }
      _ => raise Failure("rev_itlist2")
    }
  }
  acc
}

// ---------------------------------------------------------------------------
// Iterative splitting (list) and stripping (tree) via destructor.
// ---------------------------------------------------------------------------

///|
/// `splitlist dest x`: apply `dest` repeatedly to the right part.
pub fn[A, B] splitlist(
  dest : (A) -> (B, A) raise,
  x : A,
) -> (@list.List[B], A) raise {
  let ls = []
  let mut x = x
  while true {
    let (l, r) = dest(x) catch {
      Failure(_) => break
      e => raise e
    }
    ls.push(l)
    x = r
  }
  (prepend_array(ls, @list.List([])), x)
}

///|
/// `rev_splitlist dest x`: apply `dest` repeatedly to the left part.
pub fn[A, B] rev_splitlist(
  dest : (A) -> (A, B) raise,
  x : A,
) -> (A, @list.List[B]) raise {
  let mut ls = @list.List([])
  let mut x = x
  while true {
    let (l, r) = dest(x) catch {
      Failure(_) => break
      e => raise e
    }
    ls = ls.prepend(r)
    x = l
  }
  (x, ls)
}

///|
/// `striplist dest x`: the leaves of the binary tree that `dest` unfolds,
/// left to right. As in OCaml, right subtrees are destructed first.
pub fn[A] striplist(dest : (A) -> (A, A) raise, x : A) -> @list.List[A] raise {
  let mut acc = @list.List([])
  let stack = [x]
  while stack.pop() is Some(t) {
    let (l, r) = dest(t) catch {
      Failure(_) => {
        acc = acc.prepend(t)
        continue
      }
      e => raise e
    }
    stack.push(l)
    stack.push(r)
  }
  acc
}

///|
/// Apply a destructor as many times as there are elements in `clist`.
pub fn[A, B, C] nsplit(
  dest : (A) -> (B, A) raise?,
  clist : @list.List[C],
  x : A,
) -> (@list.List[B], A) raise? {
  let out = []
  let mut x = x
  for _ in clist {
    let (l, r) = dest(x)
    out.push(l)
    x = r
  }
  (prepend_array(out, @list.List([])), x)
}

// ---------------------------------------------------------------------------
// Replication and sequences.
// ---------------------------------------------------------------------------

///|
pub fn[A] replicate(x : A, n : Int32) -> @list.List[A] {
  let mut acc = @list.List([])
  for _ in 0..<n {
    acc = acc.prepend(x)
  }
  acc
}

///|
/// `m -- n`: the list `[m; m+1; ...; n]` (empty if `m > n`).
pub fn range(m : Int64, n : Int64) -> @list.List[Int64] {
  let mut acc = @list.List([])
  let mut i = n
  while i >= m {
    acc = acc.prepend(i)
    if i == m {
      break
    }
    i -= 1L
  }
  acc
}

// ---------------------------------------------------------------------------
// Various useful list operations.
// ---------------------------------------------------------------------------

///|
pub fn[A] forall(p : (A) -> Bool raise?, l : @list.List[A]) -> Bool raise? {
  for x in l {
    if !p(x) {
      return false
    }
  }
  true
}

///|
pub fn[A, B] forall2(
  p : (A, B) -> Bool raise?,
  l1 : @list.List[A],
  l2 : @list.List[B],
) -> Bool raise? {
  let mut a = l1
  let mut b = l2
  while true {
    match (a, b) {
      (Empty, Empty) => return true
      (More(h1, tail=t1), More(h2, tail=t2)) => {
        if !p(h1, h2) {
          return false
        }
        a = t1
        b = t2
      }
      _ => return false
    }
  }
  false
}

///|
pub fn[A] exists(p : (A) -> Bool raise?, l : @list.List[A]) -> Bool raise? {
  for x in l {
    if p(x) {
      return true
    }
  }
  false
}

///|
pub fn[A] length(l : @list.List[A]) -> Int32 {
  l.length()
}

///|
/// Suffixes of a list: `suffixes(l)[i]` is `l` without its first `i`
/// cells (physically shared), for `i` in `0..=length`.
fn[A] suffixes(l : @list.List[A]) -> Array[@list.List[A]] {
  let out = [l]
  let mut rest = l
  while rest is More(_, tail=t) {
    out.push(t)
    rest = t
  }
  out
}

///|
/// `filter`: the predicate is applied from the last element to the first,
/// and the cells after the last removed element are shared with `l`.
pub fn[A] filter(
  p : (A) -> Bool raise?,
  l : @list.List[A],
) -> @list.List[A] raise? {
  let suf = suffixes(l)
  let n = suf.length() - 1
  let elems = l.to_array()
  let keep = Array::make(n, false)
  for i = n - 1; i >= 0; i = i - 1 {
    keep[i] = p(elems[i])
  }
  let mut last_removed = -1
  for i in 0..<n {
    if !keep[i] {
      last_removed = i
    }
  }
  let mut acc = suf[last_removed + 1]
  for i = last_removed - 1; i >= 0; i = i - 1 {
    if keep[i] {
      acc = acc.prepend(elems[i])
    }
  }
  acc
}

///|
/// `partition p l = (yes, no)`. The predicate is applied from the last
/// element to the first, and unchanged suffixes are shared, as in OCaml.
pub fn[A] partition(
  p : (A) -> Bool raise?,
  l : @list.List[A],
) -> (@list.List[A], @list.List[A]) raise? {
  let suf = suffixes(l)
  let elems = l.to_array()
  let mut yes = @list.List([])
  let mut no = @list.List([])
  for i = elems.length() - 1; i >= 0; i = i - 1 {
    let h = elems[i]
    let t = suf[i + 1]
    if p(h) {
      if physical_equal(yes, t) {
        yes = suf[i]
        no = @list.List([])
      } else {
        yes = yes.prepend(h)
      }
    } else if physical_equal(no, t) {
      yes = @list.List([])
      no = suf[i]
    } else {
      no = no.prepend(h)
    }
  }
  (yes, no)
}

///|
/// `mapfilter f l`: the successful results of `f`, which is applied from
/// the last element to the first.
pub fn[A, B] mapfilter(
  f : (A) -> B raise,
  l : @list.List[A],
) -> @list.List[B] raise {
  let elems = l.to_array()
  let mut acc = @list.List([])
  for i = elems.length() - 1; i >= 0; i = i - 1 {
    let y = f(elems[i]) catch {
      Failure(_) => continue
      e => raise e
    }
    acc = acc.prepend(y)
  }
  acc
}

///|
pub fn[A] find(p : (A) -> Bool raise?, l : @list.List[A]) -> A raise {
  for x in l {
    if p(x) {
      return x
    }
  }
  failwith("find")
}

///|
/// The first successful result of `f` on the elements of `l`.
pub fn[A, B] tryfind(f : (A) -> B raise, l : @list.List[A]) -> B raise {
  for x in l {
    try f(x) catch {
      Failure(_) => continue
      e => raise e
    } noraise {
      y => return y
    }
  }
  failwith("tryfind")
}

///|
pub fn[A] flat(l : @list.List[@list.List[A]]) -> @list.List[A] {
  let arr = l.to_array()
  let mut acc = @list.List([])
  for i = arr.length() - 1; i >= 0; i = i - 1 {
    acc = arr[i].concat(acc)
  }
  acc
}

///|
/// `remove p l = (x, rest)`: the first element satisfying `p` and the list
/// without it.
pub fn[A] remove(
  p : (A) -> Bool raise?,
  l : @list.List[A],
) -> (A, @list.List[A]) raise {
  let prefix = []
  let mut rest = l
  while rest is More(h, tail=t) {
    if p(h) {
      return (h, prepend_array(prefix, t))
    }
    prefix.push(h)
    rest = t
  }
  failwith("remove")
}

///|
/// `chop_list n l = (first n elements, rest)`.
pub fn[A] chop_list(
  n : Int32,
  l : @list.List[A],
) -> (@list.List[A], @list.List[A]) raise {
  if n < 0 {
    failwith("chop_list")
  }
  let prefix = []
  let mut rest = l
  for _ in 0..<n {
    match rest {
      More(h, tail=t) => {
        prefix.push(h)
        rest = t
      }
      Empty => failwith("chop_list")
    }
  }
  (prepend_array(prefix, @list.List([])), rest)
}

///|
pub fn[A] find_index(
  p : (A) -> Bool raise?,
  l : @list.List[A],
) -> Int64? raise? {
  let mut i = 0L
  for x in l {
    if p(x) {
      return Some(i)
    }
    i += 1L
  }
  None
}

///|
pub fn[A : OCompare] index(x : A, l : @list.List[A]) -> Int32 raise {
  match find_index(y => x.ocompare(y) == 0, l) {
    Some(n) => n.to_int()
    None => failwith("index")
  }
}

// ---------------------------------------------------------------------------
// "Set" operations on lists.
// ---------------------------------------------------------------------------

///|
pub fn[A : OCompare] mem(x : A, l : @list.List[A]) -> Bool {
  for h in l {
    if x.ocompare(h) == 0 {
      return true
    }
  }
  false
}

///|
pub fn[A : OCompare] insert(x : A, l : @list.List[A]) -> @list.List[A] {
  if mem(x, l) {
    l
  } else {
    l.prepend(x)
  }
}

///|
/// `union l1 l2 = itlist insert l1 l2`.
pub fn[A : OCompare] union(
  l1 : @list.List[A],
  l2 : @list.List[A],
) -> @list.List[A] {
  itlist(insert, l1, l2)
}

///|
pub fn[A : OCompare] unions(l : @list.List[@list.List[A]]) -> @list.List[A] {
  itlist(union, l, @list.List([]))
}

///|
pub fn[A : OCompare] intersect(
  l1 : @list.List[A],
  l2 : @list.List[A],
) -> @list.List[A] {
  filter(x => mem(x, l2), l1)
}

///|
pub fn[A : OCompare] subtract(
  l1 : @list.List[A],
  l2 : @list.List[A],
) -> @list.List[A] {
  filter(x => !mem(x, l2), l1)
}

///|
pub fn[A : OCompare] subset(l1 : @list.List[A], l2 : @list.List[A]) -> Bool {
  forall(t => mem(t, l2), l1)
}

///|
pub fn[A : OCompare] set_eq(l1 : @list.List[A], l2 : @list.List[A]) -> Bool {
  subset(l1, l2) && subset(l2, l1)
}

// ---------------------------------------------------------------------------
// Association lists.
// ---------------------------------------------------------------------------

///|
pub fn[A : OCompare, B] assoc(a : A, l : @list.List[(A, B)]) -> B raise {
  for p in l {
    if p.0.ocompare(a) == 0 {
      return p.1
    }
  }
  failwith("find")
}

///|
pub fn[A, B : OCompare] rev_assoc(a : B, l : @list.List[(A, B)]) -> A raise {
  for p in l {
    if p.1.ocompare(a) == 0 {
      return p.0
    }
  }
  failwith("find")
}

///|
pub fn[A : OCompare, B] assocd(a : A, l : @list.List[(A, B)], d : B) -> B {
  for p in l {
    if p.0.ocompare(a) == 0 {
      return p.1
    }
  }
  d
}

///|
pub fn[A, B : OCompare] rev_assocd(a : B, l : @list.List[(A, B)], d : A) -> A {
  for p in l {
    if p.1.ocompare(a) == 0 {
      return p.0
    }
  }
  d
}

// ---------------------------------------------------------------------------
// Zipping, unzipping etc.
// ---------------------------------------------------------------------------

///|
pub fn[A, B] zip(
  l1 : @list.List[A],
  l2 : @list.List[B],
) -> @list.List[(A, B)] raise {
  let a1 = l1.to_array()
  let a2 = l2.to_array()
  if a1.length() != a2.length() {
    failwith("zip")
  }
  let mut acc = @list.List([])
  for i = a1.length() - 1; i >= 0; i = i - 1 {
    acc = acc.prepend((a1[i], a2[i]))
  }
  acc
}

///|
pub fn[A, B] unzip(l : @list.List[(A, B)]) -> (@list.List[A], @list.List[B]) {
  let arr = l.to_array()
  let mut xs = @list.List([])
  let mut ys = @list.List([])
  for i = arr.length() - 1; i >= 0; i = i - 1 {
    xs = xs.prepend(arr[i].0)
    ys = ys.prepend(arr[i].1)
  }
  (xs, ys)
}

///|
/// Share out `all` according to the lengths of the lists in `pat`.
pub fn[A, B] shareout(
  pat : @list.List[@list.List[A]],
  all : @list.List[B],
) -> @list.List[@list.List[B]] raise {
  let out = []
  let mut rest = all
  for p in pat {
    let (l, r) = chop_list(p.length(), rest)
    out.push(l)
    rest = r
  }
  prepend_array(out, @list.List([]))
}

///|
pub fn[A] do_list(f : (A) -> Unit raise?, l : @list.List[A]) -> Unit raise? {
  for x in l {
    f(x)
  }
}

// ---------------------------------------------------------------------------
// Sorting.
// ---------------------------------------------------------------------------

///|
priv enum SortTask[A] {
  SortList(@list.List[A])
  Emit(A)
}

///|
/// lib.ml's quicksort: `sort cmp (piv :: rest)` partitions `rest` by
/// `cmp piv` into `r` (true) and `l` (false) and returns
/// `sort cmp l @ piv :: sort cmp r`. The result is built from right to
/// left, which also reproduces OCaml's evaluation order (`sort cmp r`
/// before `sort cmp l`) without deep recursion.
pub fn[A] sort(
  cmp : (A, A) -> Bool raise?,
  l : @list.List[A],
) -> @list.List[A] raise? {
  let mut out = @list.List([])
  let tasks = [SortList(l)]
  while tasks.pop() is Some(task) {
    match task {
      Emit(x) => out = out.prepend(x)
      SortList(Empty) => ()
      SortList(More(piv, tail=rest)) => {
        let (r, left) = partition(x => cmp(piv, x), rest)
        tasks.push(SortList(left))
        tasks.push(Emit(piv))
        tasks.push(SortList(r))
      }
    }
  }
  out
}

///|
/// Remove adjacent (NB!) equal elements, sharing unchanged suffixes.
pub fn[A : OCompare] uniq(l : @list.List[A]) -> @list.List[A] {
  let suf = suffixes(l)
  let elems = l.to_array()
  let n = elems.length()
  if n < 2 {
    return l
  }
  // acc = uniq of the suffix starting at i, processed from the end.
  let mut acc = suf[n - 1]
  for i = n - 2; i >= 0; i = i - 1 {
    let t = suf[i + 1]
    if elems[i].ocompare(elems[i + 1]) == 0 {
      // uniq l = t'
      ()
    } else if physical_equal(acc, t) {
      acc = suf[i]
    } else {
      acc = acc.prepend(elems[i])
    }
  }
  acc
}

///|
/// Convert a list into a sorted set (by OCaml `compare`).
pub fn[A : OCompare] setify(l : @list.List[A]) -> @list.List[A] {
  uniq(sort((x, y) => x.ocompare(y) <= 0, l))
}

///|
/// Merge two lists ordered by `ord`.
pub fn[A] merge(
  ord : (A, A) -> Bool raise?,
  l1 : @list.List[A],
  l2 : @list.List[A],
) -> @list.List[A] raise? {
  let out = []
  let mut a = l1
  let mut b = l2
  while true {
    match (a, b) {
      (Empty, rest) | (rest, Empty) => return prepend_array(out, rest)
      (More(h1, tail=t1), More(h2, tail=t2)) =>
        if ord(h1, h2) {
          out.push(h1)
          a = t1
        } else {
          out.push(h2)
          b = t2
        }
    }
  }
  l1
}

///|
/// Bottom-up mergesort (lib.ml's `mergesort`).
pub fn[A] mergesort(
  ord : (A, A) -> Bool raise?,
  l : @list.List[A],
) -> @list.List[A] raise? {
  if l.is_empty() {
    return l
  }
  // mergepairs l1 l2, with l1 and l2 lists of sorted runs.
  let mut l1 : @list.List[@list.List[A]] = @list.List([])
  let mut l2 : @list.List[@list.List[A]] = map(x => @list.singleton(x), l)
  while true {
    match (l1, l2) {
      (More(s, tail=Empty), Empty) => return s
      (_, Empty) => {
        l2 = l1
        l1 = @list.List([])
      }
      (_, More(s1, tail=Empty)) => {
        l1 = l1.prepend(s1)
        l2 = @list.List([])
      }
      (_, More(s1, tail=More(s2, tail=ss))) => {
        l1 = l1.prepend(merge(ord, s1, s2))
        l2 = ss
      }
    }
  }
  l
}

///|
/// `increasing f x y = compare (f x) (f y) < 0`. OCaml evaluates `f y`
/// first.
pub fn[A, B : OCompare] increasing(
  f : (A) -> B raise?,
  x : A,
  y : A,
) -> Bool raise? {
  let fy = f(y)
  let fx = f(x)
  fx.ocompare(fy) < 0
}

///|
pub fn[A, B : OCompare] decreasing(
  f : (A) -> B raise?,
  x : A,
  y : A,
) -> Bool raise? {
  let fy = f(y)
  let fx = f(x)
  fx.ocompare(fy) > 0
}

// ---------------------------------------------------------------------------
// String operations.
// ---------------------------------------------------------------------------

///|
pub fn implode(l : @list.List[String]) -> String {
  let buf = StringBuilder()
  for s in l {
    buf.write_string(s)
  }
  buf.to_string()
}

///|
/// Split a string into one-character strings. OCaml splits into bytes;
/// here non-ASCII characters stay whole (HOL Light's syntax is ASCII).
pub fn explode(s : String) -> @list.List[String] {
  let out = []
  for c in s {
    out.push(c.to_string())
  }
  prepend_array(out, @list.List([]))
}

// ---------------------------------------------------------------------------
// Greatest common divisor.
// ---------------------------------------------------------------------------

///|
pub fn gcd(x : Int64, y : Int64) -> Int64 {
  // OCaml ints: `abs min_int` is `min_int`
  let mut a = abs63(x)
  let mut b = abs63(y)
  if a < b {
    let t = a
    a = b
    b = t
  }
  while b != 0L {
    let r = a % b
    a = b
    b = r
  }
  a
}

// ---------------------------------------------------------------------------
// All pairs arising from applying a function over two lists.
// ---------------------------------------------------------------------------

///|
/// `allpairs f l1 l2 = [f x y | x in l1, y in l2]`. As in OCaml, `f` is
/// applied from the last pair to the first.
pub fn[A, B, C] allpairs(
  f : (A, B) -> C raise?,
  l1 : @list.List[A],
  l2 : @list.List[B],
) -> @list.List[C] raise? {
  let a1 = l1.to_array()
  let a2 = l2.to_array()
  let mut acc = @list.List([])
  for i = a1.length() - 1; i >= 0; i = i - 1 {
    for j = a2.length() - 1; j >= 0; j = j - 1 {
      acc = acc.prepend(f(a1[i], a2[j]))
    }
  }
  acc
}

// ---------------------------------------------------------------------------
// Reporting.
// ---------------------------------------------------------------------------

///|
/// Where `report` output goes (standard output by default). The printer
/// redirects it once the formatter exists, so all output stays ordered.
pub let report_sink : Ref[(String) -> Unit] = Ref::{ val: s => println(s), }

///|
/// Issue a report with a newline.
pub fn report(s : String) -> Unit {
  (report_sink.val)(s)
}

///|
/// Issue a warning if `cond` holds.
pub fn warn(cond : Bool, s : String) -> Unit {
  if cond {
    report("Warning: " + s)
  }
}

///|
pub let verbose : Ref[Bool] = Ref::{ val: true, }

///|
pub let report_timing : Ref[Bool] = Ref::{ val: true, }

///|
/// `report` if `verbose` is set.
pub fn remark(s : String) -> Unit {
  if verbose.val {
    report(s)
  }
}

///|
/// The CPU clock used by `time` (seconds). The wasm target has no portable
/// CPU clock, so it reads 0 unless a host installs one.
pub let cpu_time : Ref[() -> Double] = Ref::{ val: () => 0.0, }

///|
/// Report a failure of a timed function; returns the error to re-raise.
fn report_failure(start_time : Double, e : Error) -> Error {
  let finish_time = (cpu_time.val)()
  report(
    "Failed after (user) CPU time of " +
    string_of_float(finish_time - start_time) +
    ": " +
    e.to_string(),
  )
  e
}

///|
/// `time f x`: apply `f`, reporting the CPU time taken if `report_timing`.
pub fn[A, B] time(f : (A) -> B raise, x : A) -> B raise {
  if !report_timing.val {
    return f(x)
  }
  let start_time = (cpu_time.val)()
  let result = f(x) catch { e => raise report_failure(start_time, e) }
  let finish_time = (cpu_time.val)()
  report("CPU time (user): " + string_of_float(finish_time - start_time))
  result
}

// ---------------------------------------------------------------------------
// Versions of map that avoid rebuilding unchanged elements.
// ---------------------------------------------------------------------------

///|
/// `qmap`: map that keeps the cells after the last (physically) changed
/// element and returns `l` itself if nothing changed. `f` is applied from
/// the head of the list.
pub fn[A] qmap(f : (A) -> A raise?, l : @list.List[A]) -> @list.List[A] raise? {
  let suf = suffixes(l)
  let elems = l.to_array()
  let images = []
  let mut last_changed = -1
  for i, x in elems {
    let y = f(x)
    if !physical_equal(x, y) {
      last_changed = i
    }
    images.push(y)
  }
  prepend_array(images[:last_changed + 1], suf[last_changed + 1])
}

// ---------------------------------------------------------------------------
// Set operations parametrized by equality (from Steven Obua).
// ---------------------------------------------------------------------------

///|
/// `mem'`
pub fn[A] mem_eq(
  eq : (A, A) -> Bool raise?,
  x : A,
  l : @list.List[A],
) -> Bool raise? {
  for h in l {
    if eq(x, h) {
      return true
    }
  }
  false
}

///|
/// `insert'`
pub fn[A] insert_eq(
  eq : (A, A) -> Bool raise?,
  x : A,
  l : @list.List[A],
) -> @list.List[A] raise? {
  if mem_eq(eq, x, l) {
    l
  } else {
    l.prepend(x)
  }
}

///|
/// `union'`
pub fn[A] union_eq(
  eq : (A, A) -> Bool raise?,
  l1 : @list.List[A],
  l2 : @list.List[A],
) -> @list.List[A] raise? {
  itlist((x, acc) => insert_eq(eq, x, acc), l1, l2)
}

///|
/// `unions'`
pub fn[A] unions_eq(
  eq : (A, A) -> Bool raise?,
  l : @list.List[@list.List[A]],
) -> @list.List[A] raise? {
  itlist((x, acc) => union_eq(eq, x, acc), l, @list.List([]))
}

///|
/// `subtract'`
pub fn[A] subtract_eq(
  eq : (A, A) -> Bool raise?,
  l1 : @list.List[A],
  l2 : @list.List[A],
) -> @list.List[A] raise? {
  filter(x => !mem_eq(eq, x, l2), l1)
}

///|
/// OCaml's `Match_failure`, raised by irrefutable patterns that do not
/// match (not a `Failure`, so `can` does not catch it).
#derive(Debug)
pub(all) suberror MatchFailure {
  MatchFailure(String)
}

///|
pub extend MatchFailure with @debug.Debug::{to_repr}

///|
/// OCaml's `int_of_string`: OCaml 4.14's `parse_intnat` for 63-bit ints
/// (a sign, then decimal digits or a `0x`/`0o`/`0b`/`0u` prefix, `_` allowed
/// after the first digit; prefixed numbers are unsigned and wrap), with the
/// result then required to fit in an `Int`. Fails with `int_of_string`.
pub fn int_of_string(s : String) -> Int32 raise {
  let v = int63_of_string(s)
  if v > 2147483647L || v < -2147483648L {
    raise Failure("int_of_string")
  }
  v.to_int()
}

///|
/// OCaml's `int_of_string` (an OCaml int: 63 bits).
pub fn int63_of_string(s : String) -> Int64 raise {
  let fail = () => raise Failure("int_of_string")
  let s : Array[Char] = s.to_array()
  let n = s.length()
  let mut i = 0
  let mut sign = 1
  if i < n && s[i] == '-' {
    sign = -1
    i += 1
  } else if i < n && s[i] == '+' {
    i += 1
  }
  let mut base = 10
  let mut signed = true
  if i + 1 < n && s[i] == '0' {
    match s[i + 1] {
      'x' | 'X' => {
        base = 16
        signed = false
        i += 2
      }
      'o' | 'O' => {
        base = 8
        signed = false
        i += 2
      }
      'b' | 'B' => {
        base = 2
        signed = false
        i += 2
      }
      'u' | 'U' => {
        signed = false
        i += 2
      }
      _ => ()
    }
  }
  let digit = (c : Char) => {
    if c >= '0' && c <= '9' {
      c.to_int() - '0'.to_int()
    } else if c >= 'a' && c <= 'f' {
      c.to_int() - 'a'.to_int() + 10
    } else if c >= 'A' && c <= 'F' {
      c.to_int() - 'A'.to_int() + 10
    } else {
      -1
    }
  }
  let b = base.to_uint64()
  let threshold = UInt64::lnot(0) / b
  if i >= n {
    fail()
  }
  let d0 = digit(s[i])
  if d0 < 0 || d0 >= base {
    fail()
  }
  let mut res = d0.to_uint64()
  i += 1
  while i < n {
    let c = s[i]
    if c == '_' {
      i += 1
      continue
    }
    let d = digit(c)
    if d < 0 || d >= base {
      break
    }
    if res > threshold {
      fail()
    }
    res = b * res + d.to_uint64()
    if res < d.to_uint64() {
      fail()
    }
    i += 1
  }
  if i != n {
    fail()
  }
  let limit : UInt64 = 1UL << 62
  if signed {
    if (sign >= 0 && res >= limit) || (sign < 0 && res > limit) {
      fail()
    }
  } else if res >= 1UL << 63 {
    fail()
  }
  if sign < 0 {
    res = 0UL - res
  }
  // an OCaml int keeps the low 63 bits
  (res << 1).reinterpret_as_int64() >> 1
}

///|
/// OCaml's `abs` on ints (`abs min_int = min_int`).
pub fn abs_int(n : Int32) -> Int32 {
  if n < 0 {
    -n
  } else {
    n
  }
}

///|
/// OCaml's `string_of_int`.
pub fn string_of_int(n : Int32) -> String {
  n.to_string()
}

///|
/// Raise `e` as an expression of any type (for translated code).
pub fn[T] raise_error(e : Error) -> T raise {
  raise e
}

///|
/// OCaml's `Assert_failure` (raised by translated `assert`), with the
/// source position.
#derive(Debug)
pub(all) suberror AssertFailure {
  AssertFailure(String)
}

///|
pub extend AssertFailure with @debug.Debug::{to_repr}

// ---------------------------------------------------------------------------
// Stdlib List functions with OCaml's semantics (for translated code).
// ---------------------------------------------------------------------------

///|
/// OCaml's `Not_found`.
#derive(Debug)
pub(all) suberror NotFound

///|
pub extend NotFound with @debug.Debug::{to_repr}

///|
/// `List.assoc`: raises `Not_found` (HOL's `assoc` fails instead).
pub fn[A : OCompare, B] list_assoc(a : A, l : @list.List[(A, B)]) -> B raise {
  let mut l = l
  while true {
    match l {
      Empty => raise NotFound
      More((k, v), tail=t) => {
        if k.ocompare(a) == 0 {
          return v
        }
        l = t
      }
    }
  }
  raise NotFound
}

///|
/// `List.fold_left f acc l`
pub fn[A, B] fold_left(
  f : (A, B) -> A raise?,
  acc : A,
  l : @list.List[B],
) -> A raise? {
  let mut acc = acc
  let mut l = l
  while true {
    match l {
      Empty => return acc
      More(x, tail=t) => {
        acc = f(acc, x)
        l = t
      }
    }
  }
  acc
}

///|
/// `List.fold_left_map f acc l`
pub fn[A, B, C] fold_left_map(
  f : (A, B) -> (A, C) raise?,
  acc : A,
  l : @list.List[B],
) -> (A, @list.List[C]) raise? {
  let mut acc = acc
  let out = []
  for x in l {
    let (acc1, y) = f(acc, x)
    acc = acc1
    out.push(y)
  }
  (acc, @list.List(out))
}

///|
/// `List.rev_append l1 l2`
pub fn[A] rev_append(l1 : @list.List[A], l2 : @list.List[A]) -> @list.List[A] {
  let mut acc = l2
  for x in l1 {
    acc = acc.prepend(x)
  }
  acc
}

///|
/// `List.sort` / `List.stable_sort`: OCaml 4.14's merge sort, so the
/// comparison is called on the same pairs in the same order.
pub fn[A] list_sort(
  cmp : (A, A) -> Int32 raise?,
  l : @list.List[A],
) -> @list.List[A] raise? {
  let len = l.length()
  if len < 2 {
    l
  } else {
    sort_run(cmp, len, l).0
  }
}

///|
fn[A] sort_rev_merge(
  cmp : (A, A) -> Int32 raise?,
  l1 : @list.List[A],
  l2 : @list.List[A],
  accu : @list.List[A],
) -> @list.List[A] raise? {
  let mut l1 = l1
  let mut l2 = l2
  let mut accu = accu
  while true {
    match (l1, l2) {
      (Empty, l2) => return rev_append(l2, accu)
      (l1, Empty) => return rev_append(l1, accu)
      (More(h1, tail=t1), More(h2, tail=t2)) =>
        if cmp(h1, h2) <= 0 {
          accu = accu.prepend(h1)
          l1 = t1
        } else {
          accu = accu.prepend(h2)
          l2 = t2
        }
    }
  }
  accu
}

///|
fn[A] sort_rev_merge_rev(
  cmp : (A, A) -> Int32 raise?,
  l1 : @list.List[A],
  l2 : @list.List[A],
  accu : @list.List[A],
) -> @list.List[A] raise? {
  let mut l1 = l1
  let mut l2 = l2
  let mut accu = accu
  while true {
    match (l1, l2) {
      (Empty, l2) => return rev_append(l2, accu)
      (l1, Empty) => return rev_append(l1, accu)
      (More(h1, tail=t1), More(h2, tail=t2)) =>
        if cmp(h1, h2) > 0 {
          accu = accu.prepend(h1)
          l1 = t1
        } else {
          accu = accu.prepend(h2)
          l2 = t2
        }
    }
  }
  accu
}

///|
/// `sort n l` of OCaml's `stable_sort`: the first `n` elements sorted, and
/// the rest of the list.
fn[A] sort_run(
  cmp : (A, A) -> Int32 raise?,
  n : Int32,
  l : @list.List[A],
) -> (@list.List[A], @list.List[A]) raise? {
  match (n, l) {
    (2, More(x1, tail=More(x2, tail=tl))) => {
      let s = if cmp(x1, x2) <= 0 {
        @list.List([x1, x2])
      } else {
        @list.List([x2, x1])
      }
      (s, tl)
    }
    (3, More(x1, tail=More(x2, tail=More(x3, tail=tl)))) => {
      let s = if cmp(x1, x2) <= 0 {
        if cmp(x2, x3) <= 0 {
          [x1, x2, x3]
        } else if cmp(x1, x3) <= 0 {
          [x1, x3, x2]
        } else {
          [x3, x1, x2]
        }
      } else if cmp(x1, x3) <= 0 {
        [x2, x1, x3]
      } else if cmp(x2, x3) <= 0 {
        [x2, x3, x1]
      } else {
        [x3, x2, x1]
      }
      (@list.List(s), tl)
    }
    (n, l) => {
      let n1 = n >> 1
      let n2 = n - n1
      let (s1, l2) = sort_run_rev(cmp, n1, l)
      let (s2, tl) = sort_run_rev(cmp, n2, l2)
      (sort_rev_merge_rev(cmp, s1, s2, @list.List([])), tl)
    }
  }
}

///|
/// `rev_sort n l` of OCaml's `stable_sort` (descending).
fn[A] sort_run_rev(
  cmp : (A, A) -> Int32 raise?,
  n : Int32,
  l : @list.List[A],
) -> (@list.List[A], @list.List[A]) raise? {
  match (n, l) {
    (2, More(x1, tail=More(x2, tail=tl))) => {
      let s = if cmp(x1, x2) > 0 {
        @list.List([x1, x2])
      } else {
        @list.List([x2, x1])
      }
      (s, tl)
    }
    (3, More(x1, tail=More(x2, tail=More(x3, tail=tl)))) => {
      let s = if cmp(x1, x2) > 0 {
        if cmp(x2, x3) > 0 {
          [x1, x2, x3]
        } else if cmp(x1, x3) > 0 {
          [x1, x3, x2]
        } else {
          [x3, x1, x2]
        }
      } else if cmp(x1, x3) > 0 {
        [x2, x1, x3]
      } else if cmp(x2, x3) > 0 {
        [x2, x3, x1]
      } else {
        [x3, x2, x1]
      }
      (@list.List(s), tl)
    }
    (n, l) => {
      let n1 = n >> 1
      let n2 = n - n1
      let (s1, l2) = sort_run(cmp, n1, l)
      let (s2, tl) = sort_run(cmp, n2, l2)
      (sort_rev_merge(cmp, s1, s2, @list.List([])), tl)
    }
  }
}

///|
/// `List.rev_map f l` (applies `f` from the head).
pub fn[A, B] list_rev_map(
  f : (A) -> B raise?,
  l : @list.List[A],
) -> @list.List[B] raise? {
  let mut acc = @list.List([])
  for x in l {
    acc = acc.prepend(f(x))
  }
  acc
}

///|
/// `List.nth l n`: fails with `nth` when too short; a negative index is
/// `Invalid_argument "List.nth"` in OCaml (here a failure with that text).
pub fn[A] list_nth(l : @list.List[A], n : Int32) -> A raise {
  if n < 0 {
    raise @num.InvalidArgument("List.nth")
  }
  let mut l = l
  let mut n = n
  while true {
    match l {
      Empty => raise Failure("nth")
      More(x, tail=t) => {
        if n == 0 {
          return x
        }
        l = t
        n -= 1
      }
    }
  }
  raise Failure("nth")
}

///|
/// `List.iter2 f l1 l2`
pub fn[A, B] list_iter2(
  f : (A, B) -> Unit raise?,
  l1 : @list.List[A],
  l2 : @list.List[B],
) -> Unit raise {
  let mut a = l1
  let mut b = l2
  while true {
    match (a, b) {
      (Empty, Empty) => return
      (More(x, tail=xs), More(y, tail=ys)) => {
        f(x, y)
        a = xs
        b = ys
      }
      _ => raise @num.InvalidArgument("List.iter2")
    }
  }
}

///|
/// `List.mapi f l`
pub fn[A, B] list_mapi(
  f : (Int32, A) -> B raise?,
  l : @list.List[A],
) -> @list.List[B] raise? {
  let out = []
  let mut i = 0
  for x in l {
    out.push(f(i, x))
    i += 1
  }
  @list.List(out)
}

///|
/// `List.iteri f l`
pub fn[A] list_iteri(
  f : (Int32, A) -> Unit raise?,
  l : @list.List[A],
) -> Unit raise? {
  let mut i = 0
  for x in l {
    f(i, x)
    i += 1
  }
}

///|
/// `List.find p l`: raises `Not_found`.
pub fn[A] list_find(p : (A) -> Bool raise?, l : @list.List[A]) -> A raise {
  for x in l {
    if p(x) {
      return x
    }
  }
  raise NotFound
}

///|
/// `List.find_opt p l`
pub fn[A] list_find_opt(p : (A) -> Bool raise?, l : @list.List[A]) -> A? raise? {
  for x in l {
    if p(x) {
      return Some(x)
    }
  }
  None
}

///|
/// `List.filter_map f l`
pub fn[A, B] list_filter_map(
  f : (A) -> B? raise?,
  l : @list.List[A],
) -> @list.List[B] raise? {
  let out = []
  for x in l {
    match f(x) {
      Some(y) => out.push(y)
      None => ()
    }
  }
  @list.List(out)
}

///|
/// `List.concat_map f l`
pub fn[A, B] list_concat_map(
  f : (A) -> @list.List[B] raise?,
  l : @list.List[A],
) -> @list.List[B] raise? {
  let out = []
  for x in l {
    for y in f(x) {
      out.push(y)
    }
  }
  @list.List(out)
}

///|
/// `List.mem_assoc a l`
pub fn[A : OCompare, B] list_mem_assoc(a : A, l : @list.List[(A, B)]) -> Bool {
  l.iter().any(p => p.0.ocompare(a) == 0)
}

///|
/// `List.remove_assoc a l`: removes the first binding of `a`.
pub fn[A : OCompare, B] list_remove_assoc(
  a : A,
  l : @list.List[(A, B)],
) -> @list.List[(A, B)] {
  match l {
    Empty => @list.List([])
    More(p, tail=t) =>
      if p.0.ocompare(a) == 0 {
        t
      } else {
        list_remove_assoc(a, t).prepend(p)
      }
  }
}

///|
/// `List.split l`
pub fn[A, B] list_split(
  l : @list.List[(A, B)],
) -> (@list.List[A], @list.List[B]) {
  (l.map(p => p.0), l.map(p => p.1))
}

///|
/// `List.init n f` (OCaml applies `f` in index order for short lists).
pub fn[A] list_init(n : Int32, f : (Int32) -> A raise?) -> @list.List[A] raise {
  if n < 0 {
    raise @num.InvalidArgument("List.init")
  }
  let out = []
  for i in 0..<n {
    out.push(f(i))
  }
  @list.List(out)
}

///|
/// `List.append l1 l2` (`l1 @ l2`)
pub fn[A] list_append(l1 : @list.List[A], l2 : @list.List[A]) -> @list.List[A] {
  l1.concat(l2)
}

///|
/// `List.for_all2 p l1 l2`
pub fn[A, B] list_for_all2(
  p : (A, B) -> Bool raise?,
  l1 : @list.List[A],
  l2 : @list.List[B],
) -> Bool raise {
  let mut a = l1
  let mut b = l2
  while true {
    match (a, b) {
      (Empty, Empty) => return true
      (More(x, tail=xs), More(y, tail=ys)) => {
        if !p(x, y) {
          return false
        }
        a = xs
        b = ys
      }
      _ => raise @num.InvalidArgument("List.for_all2")
    }
  }
  true
}

///|
/// `List.exists2 p l1 l2`
pub fn[A, B] list_exists2(
  p : (A, B) -> Bool raise?,
  l1 : @list.List[A],
  l2 : @list.List[B],
) -> Bool raise {
  let mut a = l1
  let mut b = l2
  while true {
    match (a, b) {
      (Empty, Empty) => return false
      (More(x, tail=xs), More(y, tail=ys)) => {
        if p(x, y) {
          return true
        }
        a = xs
        b = ys
      }
      _ => raise @num.InvalidArgument("List.exists2")
    }
  }
  false
}

///|
/// `List.filter p l` (Stdlib order: the predicate runs head to tail).
pub fn[A] list_filter(
  p : (A) -> Bool raise?,
  l : @list.List[A],
) -> @list.List[A] raise? {
  let acc = []
  for x in l {
    if p(x) {
      acc.push(x)
    }
  }
  @list.List(acc)
}

///|
/// `List.partition p l` (Stdlib order: the predicate runs head to tail).
pub fn[A] list_partition(
  p : (A) -> Bool raise?,
  l : @list.List[A],
) -> (@list.List[A], @list.List[A]) raise? {
  let yes = []
  let no = []
  for x in l {
    if p(x) {
      yes.push(x)
    } else {
      no.push(x)
    }
  }
  (@list.List(yes), @list.List(no))
}

///|
/// `List.map2 f l1 l2`: raises `Invalid_argument` on a length mismatch,
/// after applying `f` to the common prefix.
pub fn[A, B, C] list_map2(
  f : (A, B) -> C raise?,
  l1 : @list.List[A],
  l2 : @list.List[B],
) -> @list.List[C] raise {
  let acc = []
  let mut a = l1
  let mut b = l2
  while true {
    match (a, b) {
      (Empty, Empty) => break
      (More(x, tail=xs), More(y, tail=ys)) => {
        acc.push(f(x, y))
        a = xs
        b = ys
      }
      _ => raise @num.InvalidArgument("List.map2")
    }
  }
  @list.List(acc)
}

///|
/// `List.combine l1 l2`: raises `Invalid_argument` on a length mismatch.
pub fn[A, B] list_combine(
  l1 : @list.List[A],
  l2 : @list.List[B],
) -> @list.List[(A, B)] raise {
  list_map2((x, y) => (x, y), l1, l2) catch {
    _ => raise @num.InvalidArgument("List.combine")
  }
}

///|
/// OCaml's `~-.`: negation keeps the sign of zero (`0.0 - x` would not).
pub fn float_neg(x : Double) -> Double {
  -x
}
