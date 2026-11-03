// OCaml Stdlib functions used by translated code, with OCaml's semantics
// (strings as UTF-8 byte sequences, Invalid_argument on bad indices).

///|
/// `lsl` on OCaml's 63-bit ints (truncated to 32 bits; MoonBit would mask
/// the shift count instead).
pub fn lsl(x : Int32, n : Int32) -> Int32 {
  (x.to_int64() << n).to_int()
}

///|
/// `lsr`: logical shift right of the 63-bit value (`(-1) lsr 32` is
/// `2147483647`, as in OCaml).
pub fn lsr(x : Int32, n : Int32) -> Int32 {
  ((x.to_int64() & 0x7FFFFFFFFFFFFFFFL).reinterpret_as_uint64() >> n)
  .reinterpret_as_int64()
  .to_int()
}

///|
/// `asr` on OCaml's 63-bit ints.
pub fn asr(x : Int32, n : Int32) -> Int32 {
  (x.to_int64() >> n).to_int()
}

///|
/// `frexp x`: `(m, e)` with `x = m * 2^e` and `0.5 <= |m| < 1`; zero,
/// infinities and NaN give `(x, 0)` (C's frexp, as OCaml's).
pub fn float_frexp(x : Double) -> (Double, Int64) {
  if x == 0.0 || x != x || x == 1.0 / 0.0 || x == -1.0 / 0.0 {
    return (x, 0L)
  }
  let bits = x.reinterpret_as_uint64()
  let exp = ((bits >> 52) & 0x7FFUL).to_int()
  if exp == 0 {
    // subnormal: scale into the normal range first
    let (m, e) = float_frexp(x * 18014398509481984.0)
    return (m, e - 54L)
  }
  let mbits = (bits & 0x800FFFFFFFFFFFFFUL) | (1022UL << 52)
  (mbits.reinterpret_as_double(), (exp - 1022).to_int64())
}

///|
/// `ldexp x n`: `x * 2^n`. The scaling is done in exact steps of powers of
/// two, so the result is C's (and OCaml's) whenever it is zero, infinite or
/// in the normal range; a subnormal result may be rounded twice.
pub fn float_ldexp(x : Double, n : Int64) -> Double {
  // 2^k for -1022 <= k <= 1023
  fn pow2(k : Int64) -> Double {
    ((k + 1023L).reinterpret_as_uint64() << 52).reinterpret_as_double()
  }

  let mut r = x
  let mut k = n
  while k > 1000L && r != 0.0 && r == r {
    r = r * pow2(1000L)
    k = k - 1000L
    if r == 1.0 / 0.0 || r == -1.0 / 0.0 {
      return r
    }
  }
  while k < -1000L && r != 0.0 && r == r {
    r = r * pow2(-1000L)
    k = k + 1000L
  }
  if k > 1000L || k < -1000L {
    // zero or NaN: unchanged by any scaling
    return r
  }
  r * pow2(k)
}

///|
/// `log` (natural logarithm)
pub fn float_log(x : Double) -> Double {
  @math.ln(x)
}

///|
/// `**`
pub fn float_pow(x : Double, y : Double) -> Double {
  @math.pow(x, y)
}

///|
/// `String.length`: the number of UTF-8 bytes.
pub fn string_length(s : String) -> Int32 {
  @utf8.encode(s).length()
}

///|
/// OCaml strings are bytes, ours Unicode text: byte-level operations are
/// exact on ASCII and refuse (loudly) to split or build other characters.
fn ascii_only(s : String, what : String) -> Unit {
  for c in s {
    if c.to_int() >= 128 {
      abort("\{what}: byte-level operation on a non-ASCII string")
    }
  }
}

///|
/// `String.get s i`: the byte at `i`.
pub fn ocaml_string_get(s : String, i : Int32) -> Char raise {
  ascii_only(s, "String.get")
  if i < 0 || i >= s.length() {
    raise @num.InvalidArgument("index out of bounds")
  }
  s[i].unsafe_to_char()
}

///|
/// `String.sub s start len`
pub fn string_sub(s : String, start : Int32, len : Int32) -> String raise {
  let mut ascii = true
  for c in s {
    if c.to_int() >= 128 {
      ascii = false
      break
    }
  }
  if ascii {
    if start < 0 || len < 0 || start > s.length() - len {
      raise @num.InvalidArgument("String.sub / Bytes.sub")
    }
    return s[start:start + len].to_owned()
  }
  // the bytes of its UTF-8 encoding, which must be whole characters (the
  // proofs of RichterHilbertAxiomGeometry/ are strings with mathematical
  // symbols)
  let b = @utf8.encode(s)
  if start < 0 || len < 0 || start > b.length() - len {
    raise @num.InvalidArgument("String.sub / Bytes.sub")
  }
  @utf8.decode(b[start:start + len]) catch {
    _ => abort("String.sub: a string cut inside a non-ASCII character")
  }
}

///|
/// `String.make n c`
pub fn string_make(n : Int64, c : Char) -> String raise {
  if c.to_int() >= 128 {
    abort("String.make: non-ASCII byte")
  }
  // OCaml's Sys.max_string_length (64-bit): beyond it, Invalid_argument
  if n < 0L || n > 0x1FFFFFFFFFFFFF7L {
    raise @num.InvalidArgument("Bytes.create")
  }
  if n > 2147483647L {
    abort("Out_of_memory: String.make")
  }
  String::make(n.to_int(), c)
}

///|
/// `String.concat sep l`
pub fn string_concat(sep : String, l : @list.List[String]) -> String {
  let sb = StringBuilder()
  let mut first = true
  for s in l {
    if !first {
      sb.write_string(sep)
    }
    first = false
    sb.write_string(s)
  }
  sb.to_string()
}

///|
/// `Array.make n x`
pub fn[A] array_make(n : Int64, x : A) -> FixedArray[A] raise {
  // OCaml's Sys.max_array_length (64-bit): beyond it, Invalid_argument
  if n < 0L || n > 0x3FFFFFFFFFFFFFL {
    raise @num.InvalidArgument("Array.make")
  }
  if n > 2147483647L {
    abort("Out_of_memory: Array.make")
  }
  FixedArray::make(n.to_int(), x)
}

///|
/// `Array.get a i` (`a.(i)`)
pub fn[A] array_get(a : FixedArray[A], i : Int32) -> A raise {
  if i < 0 || i >= a.length() {
    raise @num.InvalidArgument("index out of bounds")
  }
  a[i]
}

///|
/// `Array.set a i x` (`a.(i) <- x`)
pub fn[A] array_set(a : FixedArray[A], i : Int32, x : A) -> Unit raise {
  if i < 0 || i >= a.length() {
    raise @num.InvalidArgument("index out of bounds")
  }
  a[i] = x
}

///|
/// `Array.length a`
pub fn[A] array_length(a : FixedArray[A]) -> Int32 {
  a.length()
}

///|
/// lib.ml's `(|>)`: `x |> f` is `f x`.
pub fn[A, B] op_bar_gt(x : A, f : (A) -> B raise) -> B raise {
  f(x)
}

///|
/// `List.fold_left2`: raises `Invalid_argument` on a length mismatch,
/// after folding the common prefix.
pub fn[A, B, C] list_fold_left2(
  f : (A, B, C) -> A raise?,
  acc : A,
  l1 : @list.List[B],
  l2 : @list.List[C],
) -> A raise {
  let mut acc = acc
  let mut a = l1
  let mut b = l2
  while true {
    match (a, b) {
      (Empty, Empty) => return acc
      (More(x, tail=xs), More(y, tail=ys)) => {
        acc = f(acc, x, y)
        a = xs
        b = ys
      }
      _ => raise @num.InvalidArgument("List.fold_left2")
    }
  }
  acc
}

///|
/// OCaml 4.14's `Hashtbl.t` (not randomized): power-of-two bucket arrays
/// indexed by `Hashtbl.hash`, newest binding first in its bucket,
/// doubling (order-preserving) when the size exceeds twice the buckets;
/// `fold`/`iter` visit buckets in index order. Keys are compared with
/// OCaml's `compare`.
pub struct OHashtbl[K, V] {
  priv mut size : Int32
  priv mut data : FixedArray[@list.List[(K, V)]]
  priv initial_size : Int32
}

///|
/// `Hashtbl.create n`
pub fn[K, V] hashtbl_create(n : Int32) -> OHashtbl[K, V] {
  let mut s = 16
  while s < n && s * 2 <= 0x3FFFFFFF {
    s = s * 2
  }
  { size: 0, data: FixedArray::make(s, @list.List([])), initial_size: s, }
}

///|
fn[K : OHash, V] OHashtbl::index(self : OHashtbl[K, V], k : K) -> Int32 {
  hash(k) & (self.data.length() - 1)
}

///|
fn[K : OHash, V] OHashtbl::resize(self : OHashtbl[K, V]) -> Unit {
  let odata = self.data
  let nsize = odata.length() * 2
  let buckets : FixedArray[Array[(K, V)]] = FixedArray::makei(nsize, _ => [])
  self.data = FixedArray::make(nsize, @list.List([]))
  // each old bucket in order, appended to the tails of the new ones
  for b in odata {
    for e in b {
      buckets[self.index(e.0)].push(e)
    }
  }
  for i in 0..<nsize {
    self.data[i] = @list.List(buckets[i])
  }
}

///|
/// `Hashtbl.clear` (keeps the bucket array)
pub fn[K, V] hashtbl_clear(t : OHashtbl[K, V]) -> Unit {
  if t.size > 0 {
    t.size = 0
    t.data.fill(@list.List([]))
  }
}

///|
/// `Hashtbl.reset` (back to the initial bucket array)
pub fn[K, V] hashtbl_reset(t : OHashtbl[K, V]) -> Unit {
  if t.data.length() == t.initial_size {
    hashtbl_clear(t)
  } else {
    t.size = 0
    t.data = FixedArray::make(t.initial_size, @list.List([]))
  }
}

///|
/// `Hashtbl.add t k v`: shadows the previous binding of `k`.
pub fn[K : OHash, V] hashtbl_add(t : OHashtbl[K, V], k : K, v : V) -> Unit {
  let i = t.index(k)
  t.data[i] = t.data[i].prepend((k, v))
  t.size += 1
  if t.size > t.data.length() * 2 {
    t.resize()
  }
}

///|
/// `Hashtbl.replace t k v`: replaces the newest binding of `k`, or adds.
pub fn[K : OCompare + OHash, V] hashtbl_replace(
  t : OHashtbl[K, V],
  k : K,
  v : V,
) -> Unit {
  let i = t.index(k)
  let before = []
  let mut rest = t.data[i]
  while true {
    match rest {
      Empty => break
      More((k1, _) as e, tail=r) => {
        if compare(k1, k) == 0 {
          let mut l = r.prepend((k, v))
          for j = before.length() - 1; j >= 0; j = j - 1 {
            l = l.prepend(before[j])
          }
          t.data[i] = l
          return
        }
        before.push(e)
        rest = r
      }
    }
  }
  t.data[i] = t.data[i].prepend((k, v))
  t.size += 1
  if t.size > t.data.length() * 2 {
    t.resize()
  }
}

///|
/// `Hashtbl.remove t k`: removes the newest binding of `k`.
pub fn[K : OCompare + OHash, V] hashtbl_remove(
  t : OHashtbl[K, V],
  k : K,
) -> Unit {
  let i = t.index(k)
  let before = []
  let mut rest = t.data[i]
  while true {
    match rest {
      Empty => return
      More((k1, _) as e, tail=r) => {
        if compare(k1, k) == 0 {
          let mut l = r
          for j = before.length() - 1; j >= 0; j = j - 1 {
            l = l.prepend(before[j])
          }
          t.data[i] = l
          t.size -= 1
          return
        }
        before.push(e)
        rest = r
      }
    }
  }
}

///|
/// `Hashtbl.find`: the newest binding; raises `Not_found`.
pub fn[K : OCompare + OHash, V] hashtbl_find(
  t : OHashtbl[K, V],
  k : K,
) -> V raise {
  for e in t.data[t.index(k)] {
    if compare(e.0, k) == 0 {
      return e.1
    }
  }
  raise NotFound
}

///|
/// `Hashtbl.find_opt`
pub fn[K : OCompare + OHash, V] hashtbl_find_opt(
  t : OHashtbl[K, V],
  k : K,
) -> V? {
  for e in t.data[t.index(k)] {
    if compare(e.0, k) == 0 {
      return Some(e.1)
    }
  }
  None
}

///|
/// `Hashtbl.find_all`: all bindings of `k`, newest first.
pub fn[K : OCompare + OHash, V] hashtbl_find_all(
  t : OHashtbl[K, V],
  k : K,
) -> @list.List[V] {
  let acc = []
  for e in t.data[t.index(k)] {
    if compare(e.0, k) == 0 {
      acc.push(e.1)
    }
  }
  @list.List(acc)
}

///|
/// `Hashtbl.mem`
pub fn[K : OCompare + OHash, V] hashtbl_mem(t : OHashtbl[K, V], k : K) -> Bool {
  hashtbl_find_opt(t, k) is Some(_)
}

///|
/// `Hashtbl.length`
pub fn[K, V] hashtbl_length(t : OHashtbl[K, V]) -> Int32 {
  t.size
}

///|
/// `Hashtbl.fold f t init`: buckets in index order, each newest first (on
/// the bucket array at the start, as OCaml).
pub fn[K, V, A] hashtbl_fold(
  f : (K, V, A) -> A raise?,
  t : OHashtbl[K, V],
  init : A,
) -> A raise? {
  let d = t.data
  let mut acc = init
  for b in d {
    for e in b {
      acc = f(e.0, e.1, acc)
    }
  }
  acc
}

///|
/// `Hashtbl.iter f t`
pub fn[K, V] hashtbl_iter(
  f : (K, V) -> Unit raise?,
  t : OHashtbl[K, V],
) -> Unit raise? {
  let d = t.data
  for b in d {
    for e in b {
      f(e.0, e.1)
    }
  }
}

///|
/// `Array.fold_left f init a`
pub fn[A, B] array_fold_left(
  f : (A, B) -> A raise?,
  init : A,
  a : FixedArray[B],
) -> A raise? {
  let mut acc = init
  for x in a {
    acc = f(acc, x)
  }
  acc
}

///|
/// OCaml's `Lazy.t`: forced at most once; an exception raised while
/// forcing is raised again by every later force.
pub struct OLazy[T] {
  priv mut state : LazyState[T]
}

///|
priv enum LazyState[T] {
  Pending(() -> T raise)
  Forcing
  Done(T)
  Failed(Error)
}

///|
/// OCaml's `Lazy.Undefined` (a lazy value forced while being forced).
#derive(Debug)
pub(all) suberror LazyUndefined

///|
pub extend LazyUndefined with @debug.Debug::{to_repr}

///|
/// `lazy e`
pub fn[T] lazy_new(f : () -> T raise) -> OLazy[T] {
  { state: Pending(f), }
}

///|
/// `Lazy.force`
pub fn[T] lazy_force(l : OLazy[T]) -> T raise {
  match l.state {
    Done(v) => v
    Failed(e) => raise e
    Forcing => raise LazyUndefined
    Pending(f) => {
      l.state = Forcing
      let r : Result[T, Error] = Ok(f()) catch { e => Err(e) }
      let v = match r {
        Ok(v) => v
        Err(e) => {
          l.state = Failed(e)
          raise e
        }
      }
      l.state = Done(v)
      v
    }
  }
}

///|
/// `Char.chr`: raises `Invalid_argument` outside 0..255.
pub fn char_chr(n : Int32) -> Char raise {
  if n < 0 || n > 255 {
    raise @num.InvalidArgument("Char.chr")
  }
  n.unsafe_to_char()
}

///|
/// `incr r`
pub fn incr(r : Ref[Int64]) -> Unit {
  r.val = add63(r.val, 1L)
}

///|
/// `decr r`
pub fn decr(r : Ref[Int64]) -> Unit {
  r.val = sub63(r.val, 1L)
}

///|
/// `Array.of_list`
pub fn[A] array_of_list(l : @list.List[A]) -> FixedArray[A] {
  FixedArray::from_array(l.to_array())
}

///|
/// `Array.to_list`
pub fn[A] array_to_list(a : FixedArray[A]) -> @list.List[A] {
  @list.from_iter(a.iter())
}

///|
/// `String.escaped` (on the UTF-8 bytes, as OCaml).
pub fn string_escaped(s : String) -> String {
  let buf = StringBuilder()
  for b in @utf8.encode(s) {
    let c = b.to_int()
    match c {
      0x22 => buf.write_string("\\\"")
      0x5C => buf.write_string("\\\\")
      0x0A => buf.write_string("\\n")
      0x09 => buf.write_string("\\t")
      0x0D => buf.write_string("\\r")
      0x08 => buf.write_string("\\b")
      _ =>
        if c >= 32 && c <= 126 {
          buf.write_char(c.unsafe_to_char())
        } else {
          buf.write_string("\\")
          buf.write_string((c / 100).to_string())
          buf.write_string((c / 10 % 10).to_string())
          buf.write_string((c % 10).to_string())
        }
    }
  }
  buf.to_string()
}

///|
/// `Array.map f a` (applies `f` left to right)
pub fn[A, B] array_map(
  f : (A) -> B raise?,
  a : FixedArray[A],
) -> FixedArray[B] raise? {
  if a.length() == 0 {
    return []
  }
  let out = FixedArray::make(a.length(), f(a[0]))
  for i in 1..<a.length() {
    out[i] = f(a[i])
  }
  out
}

///|
/// OCaml's `Sys_error`.
#derive(Debug)
pub(all) suberror SysError {
  SysError(String)
}

///|
pub extend SysError with @debug.Debug::{to_repr}

///|
let temp_file_count : Ref[Int32] = Ref::{ val: 0, }

///|
/// `Filename.temp_file prefix suffix`: a fresh name, of an empty file (in
/// memory), as OCaml's creates it.
pub fn temp_file(prefix : String, suffix : String) -> String {
  let n = temp_file_count.val.to_string()
  temp_file_count.val += 1
  let name = "/tmp/" +
    prefix +
    "0".repeat(@cmp.maximum(0, 6 - n.length())) +
    n +
    suffix
  file_of_string(name, "")
  name
}

///|
/// `Array.init n f` (applies `f` to 0, 1, ... in order)
pub fn[A] array_init(n : Int64, f : (Int64) -> A raise?) -> FixedArray[A] raise {
  if n < 0L || n > 0x3FFFFFFFFFFFFFL {
    raise @num.InvalidArgument("Array.init")
  }
  if n == 0L {
    return []
  }
  if n > 2147483647L {
    abort("Out_of_memory: Array.init")
  }
  let n = n.to_int()
  let out = FixedArray::make(n, f(0L))
  for i in 1..<n {
    out[i] = f(i.to_int64())
  }
  out
}

///|
/// `Array.iteri f a`
pub fn[A] array_iteri(
  f : (Int64, A) -> Unit raise?,
  a : FixedArray[A],
) -> Unit raise? {
  for i, x in a {
    f(i.to_int64(), x)
  }
}

///|
/// `Array.iter f a`
pub fn[A] array_iter(f : (A) -> Unit raise?, a : FixedArray[A]) -> Unit raise? {
  for x in a {
    f(x)
  }
}

///|
/// `Array.fill a ofs len x`
pub fn[A] array_fill(
  a : FixedArray[A],
  ofs : Int32,
  len : Int32,
  x : A,
) -> Unit raise {
  if ofs < 0 || len < 0 || ofs > a.length() - len {
    raise @num.InvalidArgument("Array.fill")
  }
  for i in ofs..<(ofs + len) {
    a[i] = x
  }
}

///|
/// `atan`
pub fn float_atan(x : Double) -> Double {
  @math.atan(x)
}

///|
/// `Printf`'s `%.0f`: the nearest integer, a tie to the even one.
pub fn float_fixed0(x : Double) -> String {
  if x.is_nan() {
    return "nan"
  }
  if x.is_inf() {
    return if x > 0.0 { "inf" } else { "-inf" }
  }
  let neg = x < 0.0
  let a = x.abs()
  let f = a.floor()
  let d = a - f
  let r = if d > 0.5 || (d == 0.5 && f % 2.0 == 1.0) { f + 1.0 } else { f }
  // (a double of 2^63 or more has no fraction: its own digits)
  let digits = if r < 9.0e18 { r.to_int64().to_string() } else { r.to_string() }
  // C prints the sign of a negative number that rounds to zero too
  if neg {
    "-" + digits
  } else {
    digits
  }
}

///|
/// `Unix.mkdir`: directories are not kept (files are in memory).
pub fn unix_mkdir(_name : String, _perm : Int64) -> Unit {

}
