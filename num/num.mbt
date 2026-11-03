// ===========================================================================
// Arbitrary-precision rationals: a replacement for OCaml's `Num` library
// covering the operations HOL Light uses.
//
// Differences from OCaml's `Num`:
// - Values are always normalized (denominator > 0, gcd = 1), so structural
//   equality is numeric equality and `compare` is numeric order. OCaml's
//   polymorphic `compare` on `num` depends on the representation and can
//   fail on big integers; numeric order is a strict improvement.
// - `int_of_num` returns a 32-bit `Int` and fails outside that range, while
//   OCaml succeeds up to 2^62-1. Use `int64_of_num` for wider values.
// ===========================================================================

///|
/// An exact rational number.
#derive(Eq, Hash)
pub struct Num {
  priv num : @bigint.BigInt
  priv den : @bigint.BigInt
}

///|
/// OCaml's `Invalid_argument` exception (not a `Failure`).
#derive(Debug)
pub(all) suberror InvalidArgument {
  InvalidArgument(String)
}

///|
pub impl Show for InvalidArgument with fn output(self, logger) {
  let InvalidArgument(msg) = self
  logger.write_string("Invalid_argument(\"" + msg + "\")")
}

///|
pub extend InvalidArgument with Show::{output, to_string}

///|
pub extend InvalidArgument with @debug.Debug::{to_repr}

///|
/// OCaml's `Division_by_zero` exception (not a `Failure`).
#derive(Debug)
pub(all) suberror DivisionByZero

///|
pub impl Show for DivisionByZero with fn output(_, logger) {
  logger.write_string("Division_by_zero")
}

///|
pub impl Show for Num with fn output(self, logger) {
  logger.write_string(self.to_string())
}

///|
pub impl @debug.Debug for Num with fn to_repr(self) {
  @debug.Repr::string(self.to_string())
}

///|
let big_zero : @bigint.BigInt = 0N

///|
let big_one : @bigint.BigInt = 1N

///|
fn big_abs(a : @bigint.BigInt) -> @bigint.BigInt {
  if a < big_zero {
    -a
  } else {
    a
  }
}

///|
/// Greatest common divisor of two big integers (always nonnegative).
pub fn big_gcd(a : @bigint.BigInt, b : @bigint.BigInt) -> @bigint.BigInt {
  let mut x = big_abs(a)
  let mut y = big_abs(b)
  while !y.is_zero() {
    let r = x % y
    x = y
    y = r
  }
  x
}

///|
/// Floor division of big integers (`b` nonzero).
fn big_floor_div(a : @bigint.BigInt, b : @bigint.BigInt) -> @bigint.BigInt {
  let q = a / b
  if !(a % b).is_zero() && (a < big_zero) != (b < big_zero) {
    q - big_one
  } else {
    q
  }
}

///|
/// Build `n / d` in normal form. `d` must be nonzero.
fn make(n : @bigint.BigInt, d : @bigint.BigInt) -> Num {
  let (n, d) = if d < big_zero { (-n, -d) } else { (n, d) }
  if d == big_one {
    return { num: n, den: d, }
  }
  let g = big_gcd(n, d)
  if g == big_one || g.is_zero() {
    { num: n, den: d, }
  } else {
    { num: n / g, den: d / g, }
  }
}

///|
fn of_big(n : @bigint.BigInt) -> Num {
  { num: n, den: big_one, }
}

///|
pub fn num_of_int(n : Int32) -> Num {
  of_big(@bigint.BigInt::from_int(n))
}

///|
pub fn num_of_int64(n : Int64) -> Num {
  of_big(@bigint.BigInt::from_int64(n))
}

///|
pub fn num_of_big_int(n : @bigint.BigInt) -> Num {
  of_big(n)
}

///|
/// Parse a decimal integer, optionally negative.
pub fn num_of_decimal(s : String) -> Num raise {
  let chars : Array[Char] = s.iter().collect()
  let mut ok = chars.length() > 0
  for i, c in chars {
    if !((c >= '0' && c <= '9') || (i == 0 && c == '-' && chars.length() > 1)) {
      ok = false
    }
  }
  if !ok {
    raise Failure("num_of_string")
  }
  of_big(@bigint.BigInt::from_string(s))
}

///|
pub let num_0 : Num = num_of_int(0)

///|
pub let num_1 : Num = num_of_int(1)

///|
pub let num_2 : Num = num_of_int(2)

///|
pub let num_10 : Num = num_of_int(10)

///|
pub fn Num::is_integer(self : Num) -> Bool {
  self.den == big_one
}

///|
/// `is_integer_num`
pub fn is_integer_num(x : Num) -> Bool {
  x.is_integer()
}

///|
pub impl Add for Num with fn add(a, b) {
  if a.is_integer() && b.is_integer() {
    of_big(a.num + b.num)
  } else {
    make(a.num * b.den + b.num * a.den, a.den * b.den)
  }
}

///|
pub impl Sub for Num with fn sub(a, b) {
  if a.is_integer() && b.is_integer() {
    of_big(a.num - b.num)
  } else {
    make(a.num * b.den - b.num * a.den, a.den * b.den)
  }
}

///|
pub impl Mul for Num with fn mul(a, b) {
  if a.is_integer() && b.is_integer() {
    of_big(a.num * b.num)
  } else {
    make(a.num * b.num, a.den * b.den)
  }
}

///|
pub impl Neg for Num with fn neg(a) {
  { num: -a.num, den: a.den, }
}

///|
/// -1, 0 or 1, as OCaml's comparisons return. `BigInt::compare` only
/// promises the sign (it returns 2 for some arguments on wasm-gc).
fn sign_of_compare(c : Int32) -> Int32 {
  if c < 0 {
    -1
  } else if c > 0 {
    1
  } else {
    0
  }
}

///|
/// Numeric order (-1, 0 or 1, as `compare_num`).
pub impl Compare for Num with fn compare(a, b) {
  if a.is_integer() && b.is_integer() {
    sign_of_compare(a.num.compare(b.num))
  } else {
    sign_of_compare((a.num * b.den).compare(b.num * a.den))
  }
}

///|
pub extend Num with Eq::{equal, not_equal}

///|
pub extend Num with Hash::{hash, hash_combine}

///|
pub extend Num with Show::{output}

///|
pub extend Num with @debug.Debug::{to_repr}

///|
pub extend Num with Add::{add}

///|
pub extend Num with Sub::{sub}

///|
pub extend Num with Mul::{mul}

///|
pub extend Num with Neg::{neg}

///|
pub extend DivisionByZero with Show::{output, to_string}

///|
pub extend DivisionByZero with @debug.Debug::{to_repr}

///|
pub extend Num with Compare::{compare, op_lt, op_le, op_gt, op_ge}

///|
/// `+/`
pub fn add_num(a : Num, b : Num) -> Num {
  a + b
}

///|
/// `-/`
pub fn sub_num(a : Num, b : Num) -> Num {
  a - b
}

///|
/// `*/`
pub fn mult_num(a : Num, b : Num) -> Num {
  a * b
}

///|
/// `//`: exact division.
pub fn div_num(a : Num, b : Num) -> Num raise {
  if b.num.is_zero() {
    raise Failure("create_ratio infinite or undefined rational number")
  }
  make(a.num * b.den, a.den * b.num)
}

///|
/// `minus_num`
pub fn minus_num(a : Num) -> Num {
  -a
}

///|
pub fn abs_num(a : Num) -> Num {
  if a.num < big_zero {
    -a
  } else {
    a
  }
}

///|
/// -1, 0 or 1.
pub fn sign_num(a : Num) -> Int32 {
  sign_of_compare(a.num.compare(big_zero))
}

///|
pub fn succ_num(a : Num) -> Num {
  a + num_1
}

///|
pub fn pred_num(a : Num) -> Num {
  a - num_1
}

///|
pub fn compare_num(a : Num, b : Num) -> Int32 {
  a.compare(b)
}

///|
/// `=/`
pub fn eq_num(a : Num, b : Num) -> Bool {
  a == b
}

///|
/// `<>/`
pub fn ne_num(a : Num, b : Num) -> Bool {
  a != b
}

///|
/// `</`
pub fn lt_num(a : Num, b : Num) -> Bool {
  a < b
}

///|
/// `<=/`
pub fn le_num(a : Num, b : Num) -> Bool {
  a <= b
}

///|
/// `>/`
pub fn gt_num(a : Num, b : Num) -> Bool {
  a > b
}

///|
/// `>=/`
pub fn ge_num(a : Num, b : Num) -> Bool {
  a >= b
}

///|
pub fn max_num(a : Num, b : Num) -> Num {
  if a < b {
    b
  } else {
    a
  }
}

///|
pub fn min_num(a : Num, b : Num) -> Num {
  if a > b {
    b
  } else {
    a
  }
}

///|
/// Largest integer not greater than `a`.
pub fn floor_num(a : Num) -> Num {
  if a.is_integer() {
    a
  } else {
    of_big(big_floor_div(a.num, a.den))
  }
}

///|
/// Smallest integer not less than `a`.
pub fn ceiling_num(a : Num) -> Num {
  if a.is_integer() {
    a
  } else {
    of_big(big_floor_div(a.num, a.den) + big_one)
  }
}

///|
/// Truncation towards zero.
pub fn integer_num(a : Num) -> Num {
  if a.is_integer() {
    a
  } else {
    of_big(a.num / a.den)
  }
}

///|
/// Rounding to the nearest integer, halves away from zero.
pub fn round_num(a : Num) -> Num {
  if a.is_integer() {
    return a
  }
  let two : @bigint.BigInt = 2N
  let n = big_abs(a.num) * two + a.den
  let r = of_big(n / (a.den * two))
  if a.num < big_zero {
    -r
  } else {
    r
  }
}

///|
/// Euclidean quotient: `quo_num a b = q` with `a = q * b + r`,
/// `0 <= r < |b|`.
pub fn quo_num(a : Num, b : Num) -> Num raise {
  if b.num.is_zero() {
    raise DivisionByZero
  }
  // q = sign(b) * floor(a / |b|)
  let ab = abs_num(b)
  let q = floor_num(make(a.num * ab.den, a.den * ab.num))
  if b.num < big_zero {
    -q
  } else {
    q
  }
}

///|
/// Euclidean remainder, always in `[0, |b|)`.
pub fn mod_num(a : Num, b : Num) -> Num raise {
  a - quo_num(a, b) * b
}

///|
/// `power_num a n` for an integer exponent `n` (negative allowed).
/// A non-integer exponent raises `InvalidArgument`, as in OCaml.
pub fn power_num(a : Num, n : Num) -> Num raise {
  if !n.is_integer() {
    raise InvalidArgument("power_num")
  }
  let e = n.num
  if e.is_zero() {
    return num_1
  }
  let k = big_abs(e)
  let p = make(a.num.pow(k), a.den.pow(k))
  if e > big_zero {
    p
  } else if p.num.is_zero() {
    raise Failure(
      "create_normalized_ratio infinite or undefined rational number",
    )
  } else {
    make(p.den, p.num)
  }
}

///|
/// Numerator and denominator (denominator positive).
pub fn numdom(a : Num) -> (Num, Num) {
  (of_big(a.num), of_big(a.den))
}

///|
pub fn numerator(a : Num) -> Num {
  of_big(a.num)
}

///|
pub fn denominator(a : Num) -> Num {
  of_big(a.den)
}

///|
/// The integer value as a big integer.
pub fn big_int_of_num(a : Num) -> @bigint.BigInt raise {
  if a.is_integer() {
    a.num
  } else {
    raise Failure("big_int_of_ratio")
  }
}

///|
/// Greatest common divisor of two integers.
pub fn gcd_num(a : Num, b : Num) -> Num raise {
  of_big(big_gcd(big_int_of_num(a), big_int_of_num(b)))
}

///|
/// Least common multiple (as in HOL Light's `lcm_num`).
pub fn lcm_num(a : Num, b : Num) -> Num raise {
  if a == num_0 && b == num_0 {
    num_0
  } else {
    abs_num(div_num(a * b, gcd_num(a, b)))
  }
}

///|
let min_int : @bigint.BigInt = -2147483648N

///|
let max_int : @bigint.BigInt = 2147483647N

///|
/// Convert to a 32-bit `Int`. Fails on non-integers and out-of-range values.
pub fn int_of_num(a : Num) -> Int32 raise {
  if !a.is_integer() {
    raise Failure("integer argument required")
  }
  if a.num < min_int || a.num > max_int {
    raise Failure("int_of_big_int")
  }
  a.num.to_int()
}

///|
/// OCaml's `int_of_num` for 63-bit ints: fails outside [-2^62, 2^62 - 1].
pub fn int63_of_num(a : Num) -> Int64 raise {
  if !a.is_integer() {
    raise Failure("integer argument required")
  }
  if a.num < min_int63 || a.num > max_int63 {
    raise Failure("int_of_big_int")
  }
  a.num.to_int64()
}

///|
let min_int63 : @bigint.BigInt = -4611686018427387904N

///|
let max_int63 : @bigint.BigInt = 4611686018427387903N

///|
let min_int64 : @bigint.BigInt = -9223372036854775808N

///|
let max_int64 : @bigint.BigInt = 9223372036854775807N

///|
/// Convert to an `Int64`. Fails on non-integers and out-of-range values.
pub fn int64_of_num(a : Num) -> Int64 raise {
  if !a.is_integer() {
    raise Failure("integer argument required")
  }
  if a.num < min_int64 || a.num > max_int64 {
    raise Failure("int_of_big_int")
  }
  a.num.to_int64()
}

///|
/// `x * 2^e`, scaling in steps so intermediate results neither overflow
/// nor underflow before the final multiplication.
fn ldexp(x : Double, e : Int32) -> Double {
  let mut x = x
  let mut e = e
  while e > 1000 {
    x = x * @math.pow(2.0, 1000.0)
    e = e - 1000
  }
  while e < -1000 {
    x = x * @math.pow(2.0, -1000.0)
    e = e + 1000
  }
  x * @math.pow(2.0, e.to_double())
}

///|
/// Conversion to the nearest double (correctly rounded outside the
/// subnormal range; overflow gives an infinity).
pub fn float_of_num(a : Num) -> Double {
  if a.num.is_zero() {
    return 0.0
  }
  let n = big_abs(a.num)
  // Choose `shift` so that q = floor(n * 2^shift / den) has 63 or 64 bits.
  let shift = 63 - (n.bit_length() - a.den.bit_length())
  let scaled = if shift >= 0 { n << shift } else { n }
  let divisor = if shift >= 0 { a.den } else { a.den << -shift }
  let mut q = scaled / divisor
  // Sticky bit: any discarded remainder makes the conversion round
  // correctly from 64 bits to 53.
  if !(scaled % divisor).is_zero() {
    q = q | big_one
  }
  let mag = ldexp(q.to_uint64().to_double(), -shift)
  if a.num < big_zero {
    -mag
  } else {
    mag
  }
}

///|
/// OCaml `string_of_num`: `"n"` for integers and `"p/q"` otherwise.
pub fn Num::to_string(self : Num) -> String {
  if self.is_integer() {
    self.num.to_string()
  } else {
    self.num.to_string() + "/" + self.den.to_string()
  }
}

///|
/// `string_of_num`
pub fn string_of_num(a : Num) -> String {
  a.to_string()
}

// ---------------------------------------------------------------------------
// Num helpers from lib.ml.
// ---------------------------------------------------------------------------

///|
/// `2^n`
pub fn pow2(n : Int32) -> Num raise {
  power_num(num_2, num_of_int(n))
}

///|
/// `10^n`
pub fn pow10(n : Int32) -> Num raise {
  power_num(num_10, num_of_int(n))
}

///|
/// Digits of a nonnegative integer in base `b` (2..16), lowercase.
pub fn string_of_num_nary(b : Int32, n : Num) -> String raise {
  let digits = "0123456789abcdef"
  let base = num_of_int(b)
  // lib.ml: d0 = el (int_of_num (n mod base)) digits; recursion on quotient.
  let out = []
  let mut n = n
  while true {
    let d = int_of_num(mod_num(n, base))
    if d < 0 || d >= digits.length() {
      raise Failure("el")
    }
    out.push(digits[d:d + 1].to_owned())
    n = quo_num(n, base)
    if n == num_0 {
      break
    }
  }
  out.rev().join("")
}

///|
pub fn string_of_num_hex(n : Num) -> String raise {
  "0x" + string_of_num_nary(16, n)
}

///|
fn digit_value(c : Char) -> Int32 raise {
  match c {
    '0'..<='9' => c.to_int() - '0'.to_int()
    'a'..<='f' => c.to_int() - 'a'.to_int() + 10
    'A'..<='F' => c.to_int() - 'A'.to_int() + 10
    // lib.ml looks the digit up with `assoc`, which fails with "find".
    _ => raise Failure("find")
  }
}

///|
/// The Num library's own `Num.num_of_string` (not lib.ml's, below): an
/// optionally signed decimal integer, or two of them around a `/`
/// (Examples/sos.ml reads the numerals of csdp's output with it).
pub fn nums_num_of_string(s : String) -> Num raise {
  fn integer(t : String) -> Num raise {
    let chars = t.iter().collect()
    let (neg, start) = match chars {
      ['-', ..] => (true, 1)
      ['+', ..] => (false, 1)
      _ => (false, 0)
    }
    if start == chars.length() {
      raise Failure("num_of_string")
    }
    let ten = @bigint.BigInt::from_int(10)
    let mut acc = big_zero
    for i in start..<chars.length() {
      let c = chars[i]
      if c < '0' || c > '9' {
        raise Failure("num_of_string")
      }
      acc = acc * ten + @bigint.BigInt::from_int(c.to_int() - '0'.to_int())
    }
    let n = of_big(acc)
    if neg {
      minus_num(n)
    } else {
      n
    }
  }

  match s.find("/") {
    Some(i) => div_num(integer(s[:i].to_owned()), integer(s[i + 1:].to_owned()))
    None => integer(s)
  }
}

///|
/// HOL Light's `num_of_string`: decimal, `0x` hex or `0b` binary numerals.
pub fn num_of_string(s : String) -> Num raise {
  let chars = s.iter().collect()
  let (base, start) = match chars {
    [] => raise Failure("num_of_string: no digits")
    ['0', 'x', ..] => (16, 2)
    ['0', 'b', ..] => (2, 2)
    _ => (10, 0)
  }
  if start == chars.length() {
    raise Failure("num_of_string: no digits after base indicator")
  }
  // The most significant invalid digit is reported first, as in lib.ml.
  let b = @bigint.BigInt::from_int(base)
  let mut acc = big_zero
  for i in start..<chars.length() {
    let v = digit_value(chars[i])
    if v >= base {
      raise Failure("num_of_string: invalid digit for base")
    }
    acc = acc * b + @bigint.BigInt::from_int(v)
  }
  of_big(acc)
}

///|
/// `( <>/ )`
pub fn neq_num(a : Num, b : Num) -> Bool {
  !eq_num(a, b)
}
