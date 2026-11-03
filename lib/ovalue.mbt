// ===========================================================================
// OCaml polymorphic `compare` and `Hashtbl.hash`, for the value shapes HOL
// Light uses.
//
// HOL Light relies on OCaml's structural `compare` (for `mem`, `assoc`,
// `setify`, ...) and on `Hashtbl.hash` (whose values decide the shape of
// the Patricia trees in `func`, and therefore their fold order). Each type
// that takes part implements these traits following OCaml's runtime
// representation:
//
// - `int`, `bool`, `char`, `unit` and constant constructors are immediate
//   integers (`false`/`[]`/`None`/`()` are 0, `true` is 1);
// - strings are byte strings (hashed and compared as UTF-8);
// - tuples, records, cons cells and non-constant constructors are blocks
//   with a tag (constructor index among the non-constant constructors) and
//   their fields in order.
// ===========================================================================

///|
/// OCaml's polymorphic `compare`.
pub(open) trait OCompare {
  fn ocompare(Self, Self) -> Int32
}

///|
/// OCaml's polymorphic hash (`Hashtbl.hash`): visits a value in the
/// breadth-first order of `caml_hash`.
pub(open) trait OHash {
  fn ohash_visit(Self, OHasher) -> Unit
}

///|
/// OCaml `compare x y`.
pub fn[T : OCompare] compare(x : T, y : T) -> Int32 {
  x.ocompare(y)
}

///|
/// State of `caml_hash(10, 100, 0, v)`.
pub struct OHasher {
  priv queue : Array[&OHash]
  priv mut h : UInt32
  priv mut num : Int32
}

///|
/// Size limit of the queue (`Hashtbl.hash` uses 100).
let hash_queue_limit = 100

///|
fn rotl32(x : UInt32, n : Int32) -> UInt32 {
  (x << n) | (x >> (32 - n))
}

///|
fn OHasher::mix(self : OHasher, d : UInt32) -> Unit {
  let mut d = d * 0xcc9e2d51U
  d = rotl32(d, 15)
  d = d * 0x1b873593U
  let mut h = self.h ^ d
  h = rotl32(h, 13)
  self.h = h * 5U + 0xe6546b64U
}

///|
/// Mix an OCaml `int` (counts as a meaningful value).
pub fn OHasher::int(self : OHasher, n : Int64) -> Unit {
  // The tagged representation 2n+1, folded to 32 bits as in
  // caml_hash_mix_intnat.
  let d = n * 2L + 1L
  let folded = (d >> 32) ^ (d >> 63) ^ d
  self.mix(folded.to_int().reinterpret_as_uint())
  self.num -= 1
}

///|
/// Mix an OCaml string given as UTF-8 bytes (counts as a meaningful value).
pub fn OHasher::bytes(self : OHasher, b : Bytes) -> Unit {
  let len = b.length()
  let mut i = 0
  while i + 4 <= len {
    let w = b[i].to_uint() |
      (b[i + 1].to_uint() << 8) |
      (b[i + 2].to_uint() << 16) |
      (b[i + 3].to_uint() << 24)
    self.mix(w)
    i += 4
  }
  let rest = len & 3
  if rest > 0 {
    let mut w = 0U
    if rest == 3 {
      w = b[i + 2].to_uint() << 16
    }
    if rest >= 2 {
      w = w | (b[i + 1].to_uint() << 8)
    }
    w = w | b[i].to_uint()
    self.mix(w)
  }
  self.h = self.h ^ len.reinterpret_as_uint()
  self.num -= 1
}

///|
/// Mix an OCaml string (counts as a meaningful value).
pub fn OHasher::string(self : OHasher, s : String) -> Unit {
  self.bytes(@utf8.encode(s))
}

///|
/// Start a block with the given tag and size. The header is mixed in but
/// does not count as a meaningful value; the fields must then be pushed
/// with `field`, in order.
pub fn OHasher::block(self : OHasher, tag : Int32, size : Int32) -> Unit {
  self.mix(((size << 10) | tag).reinterpret_as_uint())
}

///|
/// Enqueue a field of the current block (dropped once the queue is full).
pub fn[T : OHash] OHasher::field(self : OHasher, x : T) -> Unit {
  if self.queue.length() < hash_queue_limit {
    self.queue.push(x as &OHash)
  }
}

///|
/// OCaml `Hashtbl.hash`: a nonnegative 30-bit integer.
pub fn[T : OHash] hash(x : T) -> Int32 {
  let st : OHasher = { queue: [x as &OHash], h: 0U, num: 10, }
  let mut rd = 0
  while rd < st.queue.length() && st.num > 0 {
    let v = st.queue[rd]
    rd += 1
    v.ohash_visit(st)
  }
  let mut h = st.h
  h = h ^ (h >> 16)
  h = h * 0x85ebca6bU
  h = h ^ (h >> 13)
  h = h * 0xc2b2ae35U
  h = h ^ (h >> 16)
  (h & 0x3FFFFFFFU).reinterpret_as_int()
}

// ---------------------------------------------------------------------------
// Primitive types.
// ---------------------------------------------------------------------------

///|
pub impl OCompare for Int32 with fn ocompare(self, other) {
  self.compare(other)
}

///|
pub impl OHash for Int32 with fn ohash_visit(self, h) {
  h.int(self.to_int64())
}

///|
/// OCaml ints are 63-bit; `Int64` stands for an OCaml `int` that may not
/// fit in 32 bits.
pub impl OCompare for Int64 with fn ocompare(self, other) {
  self.compare(other)
}

///|
pub impl OHash for Int64 with fn ohash_visit(self, h) {
  h.int(self)
}

///|
pub impl OCompare for Bool with fn ocompare(self, other) {
  self.to_int().compare(other.to_int())
}

///|
pub impl OHash for Bool with fn ohash_visit(self, h) {
  h.int(if self { 1L } else { 0L })
}

///|
pub impl OCompare for Char with fn ocompare(self, other) {
  self.to_int().compare(other.to_int())
}

///|
pub impl OHash for Char with fn ohash_visit(self, h) {
  h.int(self.to_int().to_int64())
}

///|
pub impl OCompare for Unit with fn ocompare(_, _) {
  0
}

///|
pub impl OHash for Unit with fn ohash_visit(_, h) {
  h.int(0L)
}

///|
pub impl OCompare for String with fn ocompare(self, other) {
  @kernel.compare_string(self, other)
}

///|
pub impl OHash for String with fn ohash_visit(self, h) {
  h.string(self)
}

// ---------------------------------------------------------------------------
// Polymorphic containers.
// ---------------------------------------------------------------------------

///|
pub impl[A : OCompare, B : OCompare] OCompare for (A, B) with fn ocompare(
  self,
  other,
) {
  let c = self.0.ocompare(other.0)
  if c != 0 {
    c
  } else {
    self.1.ocompare(other.1)
  }
}

///|
pub impl[A : OHash, B : OHash] OHash for (A, B) with fn ohash_visit(self, h) {
  h.block(0, 2)
  h.field(self.0)
  h.field(self.1)
}

///|
pub impl[A : OCompare, B : OCompare, C : OCompare] OCompare for (A, B, C) with fn ocompare(
  self,
  other,
) {
  let c = self.0.ocompare(other.0)
  if c != 0 {
    return c
  }
  let c = self.1.ocompare(other.1)
  if c != 0 {
    return c
  }
  self.2.ocompare(other.2)
}

///|
pub impl[A : OHash, B : OHash, C : OHash] OHash for (A, B, C) with fn ohash_visit(
  self,
  h,
) {
  h.block(0, 3)
  h.field(self.0)
  h.field(self.1)
  h.field(self.2)
}

///|
pub impl[A : OCompare, B : OCompare, C : OCompare, D : OCompare] OCompare for (
  A,
  B,
  C,
  D,
) with fn ocompare(self, other) {
  let c = self.0.ocompare(other.0)
  if c != 0 {
    return c
  }
  let c = self.1.ocompare(other.1)
  if c != 0 {
    return c
  }
  let c = self.2.ocompare(other.2)
  if c != 0 {
    return c
  }
  self.3.ocompare(other.3)
}

///|
pub impl[A : OHash, B : OHash, C : OHash, D : OHash] OHash for (A, B, C, D) with fn ohash_visit(
  self,
  h,
) {
  h.block(0, 4)
  h.field(self.0)
  h.field(self.1)
  h.field(self.2)
  h.field(self.3)
}

///|
/// `[]` is the immediate 0, so it sorts before every cons cell.
pub impl[A : OCompare] OCompare for @list.List[A] with fn ocompare(self, other) {
  let mut a = self
  let mut b = other
  while true {
    match (a, b) {
      (Empty, Empty) => return 0
      (Empty, More(_)) => return -1
      (More(_), Empty) => return 1
      (More(x, tail=xs), More(y, tail=ys)) => {
        let c = x.ocompare(y)
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
pub impl[A : OHash] OHash for @list.List[A] with fn ohash_visit(self, h) {
  match self {
    Empty => h.int(0L)
    More(x, tail=t) => {
      h.block(0, 2)
      h.field(x)
      h.field(t)
    }
  }
}

///|
pub impl[A : OCompare] OCompare for A? with fn ocompare(self, other) {
  match (self, other) {
    (None, None) => 0
    (None, Some(_)) => -1
    (Some(_), None) => 1
    (Some(x), Some(y)) => x.ocompare(y)
  }
}

///|
pub impl[A : OHash] OHash for A? with fn ohash_visit(self, h) {
  match self {
    None => h.int(0L)
    Some(x) => {
      h.block(0, 1)
      h.field(x)
    }
  }
}

// ---------------------------------------------------------------------------
// HOL kernel types (their `Compare` impls already follow OCaml's order).
// ---------------------------------------------------------------------------

///|
pub impl OCompare for @kernel.HolType with fn ocompare(self, other) {
  self.compare(other)
}

///|
pub impl OHash for @kernel.HolType with fn ohash_visit(self, h) {
  match self {
    Tyvar(s) => {
      h.block(0, 1)
      h.field(s)
    }
    Tyapp(s, args) => {
      h.block(1, 2)
      h.field(s)
      h.field(args)
    }
  }
}

///|
pub impl OCompare for @kernel.Term with fn ocompare(self, other) {
  self.compare(other)
}

///|
pub impl OHash for @kernel.Term with fn ohash_visit(self, h) {
  match self {
    Var(s, ty) => {
      h.block(0, 2)
      h.field(s)
      h.field(ty)
    }
    Const(s, ty) => {
      h.block(1, 2)
      h.field(s)
      h.field(ty)
    }
    Comb(f, x) => {
      h.block(2, 2)
      h.field(f)
      h.field(x)
    }
    Abs(v, b) => {
      h.block(3, 2)
      h.field(v)
      h.field(b)
    }
  }
}

///|
pub impl OCompare for @kernel.Thm with fn ocompare(self, other) {
  self.compare(other)
}

///|
/// `thm` is `Sequent of (term list * term)`: a block of size 1 holding a
/// pair.
pub impl OHash for @kernel.Thm with fn ohash_visit(self, h) {
  h.block(0, 1)
  h.field(@kernel.dest_thm(self))
}

///|
/// An array is a block of its elements: shorter first, then elementwise.
pub impl[A : OCompare] OCompare for FixedArray[A] with fn ocompare(self, other) {
  if self.length() != other.length() {
    return self.length().compare(other.length())
  }
  for i in 0..<self.length() {
    let c = self[i].ocompare(other[i])
    if c != 0 {
      return c
    }
  }
  0
}

///|
pub impl[A : OHash] OHash for FixedArray[A] with fn ohash_visit(self, h) {
  h.block(0, self.length())
  for x in self {
    h.field(x)
  }
}

///|
/// A `ref` is a one-field record.
pub impl[A : OCompare] OCompare for Ref[A] with fn ocompare(self, other) {
  self.val.ocompare(other.val)
}

///|
pub impl[A : OHash] OHash for Ref[A] with fn ohash_visit(self, h) {
  h.block(0, 1)
  h.field(self.val)
}

///|
/// Mix an OCaml float (caml_hash_mix_double; counts as a meaningful
/// value): NaNs are normalized, and -0.0 hashes as +0.0.
pub fn OHasher::double(self : OHasher, x : Double) -> Unit {
  let bits = x.reinterpret_as_int64().reinterpret_as_uint64()
  let mut h = (bits >> 32).to_uint()
  let mut l = bits.to_uint()
  if (h & 0x7FF00000U) == 0x7FF00000U && (l | (h & 0xFFFFFU)) != 0U {
    h = 0x7FF00000U
    l = 0x00000001U
  } else if h == 0x80000000U && l == 0U {
    h = 0U
  }
  self.mix(l)
  self.mix(h)
  self.num -= 1
}

///|
/// OCaml's `compare` on floats: a total order in which NaN equals itself
/// and is below every other float.
pub impl OCompare for Double with fn ocompare(self, other) {
  if self < other {
    -1
  } else if self > other {
    1
  } else if self == other {
    0
  } else {
    let a = self.is_nan()
    let b = other.is_nan()
    if a && b {
      0
    } else if a {
      -1
    } else {
      1
    }
  }
}

///|
pub impl OHash for Double with fn ohash_visit(self, h) {
  h.double(self)
}

///|
/// OCaml's representation of a `num`: `Int of int` (63-bit), `Big_int of
/// big_int` or `Ratio of ratio` (constructor tags 0, 1, 2).
fn num_tag(n : @num.Num) -> Int32 {
  if !@num.is_integer_num(n) {
    2
  } else {
    let v = @num.int64_of_num(n) catch { _ => return 1 }
    if v >= -0x4000000000000000L && v < 0x4000000000000000L {
      0
    } else {
      1
    }
  }
}

///|
/// `compare` on `num`, as OCaml's structural compare on its representation:
/// by constructor, then numerically for small integers; big integers and
/// ratios of the same sign compare their (abstract) digits, where OCaml
/// raises `Invalid_argument "compare: abstract value"` (here an abort).
pub impl OCompare for @num.Num with fn ocompare(self, other) {
  if physical_equal(self, other) {
    return 0
  }
  let ta = num_tag(self)
  let tb = num_tag(other)
  if ta != tb {
    return ta.compare(tb)
  }
  if ta == 0 {
    return @num.compare_num(self, other)
  }
  // big_int = { sign; abs_value : nat }; a ratio starts with its numerator
  let c = @num.sign_num(self).compare(@num.sign_num(other))
  if c != 0 {
    return c
  }
  abort("compare: abstract value")
}

///|
/// An OCaml `int` field (63-bit).
priv struct OInt(Int64)

///|
impl OHash for OInt with fn ohash_visit(self, h) {
  h.int(self.0)
}

///|
/// The digits of a big integer: a custom block hashed by the num library's
/// `hash_nat` (each 64-bit digit as its low then high 32 bits, a zero high
/// half of the last digit skipped: the minimal 32-bit little-endian
/// chunks), mixed in as one meaningful value.
priv struct NatDigits(@bigint.BigInt)

///|
impl OHash for NatDigits with fn ohash_visit(self, h) {
  let digits : OHasher = { queue: [], h: 0U, num: 0, }
  let base = @bigint.BigInt::from_int64(0x100000000L)
  let mut m = self.0
  let zero = @bigint.BigInt::from_int(0)
  if m == zero {
    // a nat has at least one digit
    digits.mix(0U)
  }
  while m > zero {
    let chunk = (m % base).to_int64()
    digits.mix(chunk.reinterpret_as_uint64().to_uint())
    m = m / base
  }
  h.mix(digits.h)
  h.num -= 1
}

///|
/// `big_int = { sign : int; abs_value : nat }`
priv struct BigIntRecord((Int32, @bigint.BigInt))

///|
impl OHash for BigIntRecord with fn ohash_visit(self, h) {
  h.block(0, 2)
  h.field(OInt(self.0.0.to_int64()))
  h.field(NatDigits(self.0.1))
}

///|
fn big_record(n : @num.Num) -> BigIntRecord {
  let b = @num.big_int_of_num(@num.abs_num(n)) catch {
    _ => @bigint.BigInt::from_int(0)
  }
  BigIntRecord((@num.sign_num(n), b))
}

///|
fn big_int_sign(n : @bigint.BigInt) -> Int32 {
  // `compare` gives a number of that sign, not always -1, 0 or 1
  let c = n.compare(@bigint.BigInt::from_int(0))
  if c < 0 {
    -1
  } else if c > 0 {
    1
  } else {
    0
  }
}

///|
/// `compare` on a `Big_int.big_int` (`{ sign; abs_value : nat }`): by sign,
/// then the (abstract) digits, where OCaml raises `Invalid_argument
/// "compare: abstract value"` (here an abort).
pub impl OCompare for @bigint.BigInt with fn ocompare(self, other) {
  if physical_equal(self, other) {
    return 0
  }
  let c = big_int_sign(self).compare(big_int_sign(other))
  if c != 0 {
    return c
  }
  abort("compare: abstract value")
}

///|
/// `Hashtbl.hash` on a `Big_int.big_int` (checked against OCaml).
pub impl OHash for @bigint.BigInt with fn ohash_visit(self, h) {
  let abs = if big_int_sign(self) < 0 { -self } else { self }
  OHash::ohash_visit(BigIntRecord((big_int_sign(self), abs)), h)
}

///|
/// `ratio = { numerator : big_int; denominator : big_int; normalized : bool }`
priv struct RatioRecord(@num.Num)

///|
impl OHash for RatioRecord with fn ohash_visit(self, h) {
  h.block(0, 3)
  h.field(big_record(@num.numerator(self.0)))
  h.field(big_record(@num.denominator(self.0)))
  h.field(OInt(1L)) // normalized = true
}

///|
/// `Hashtbl.hash` on `num`, through OCaml's representation (checked
/// against OCaml for small, large and rational values).
pub impl OHash for @num.Num with fn ohash_visit(self, h) {
  match num_tag(self) {
    0 => {
      h.block(0, 1)
      h.field(OInt(@num.int64_of_num(self) catch { _ => 0L }))
    }
    1 => {
      h.block(1, 1)
      h.field(big_record(self))
    }
    _ => {
      h.block(2, 1)
      h.field(RatioRecord(self))
    }
  }
}
