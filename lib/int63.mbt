// OCaml's `int`: 63-bit two's complement, represented as an `Int64` kept in
// the canonical range [-2^62, 2^62 - 1]. Arithmetic wraps modulo 2^63 as in
// OCaml; `Int64` intermediates keep the low 63 bits exact, and `norm63`
// sign-extends bit 62.

///|
/// OCaml's `max_int` (2^62 - 1).
pub let max_int63 : Int64 = 0x3FFFFFFFFFFFFFFFL

///|
/// OCaml's `min_int` (-2^62).
pub let min_int63 : Int64 = -0x4000000000000000L

///|
/// The canonical 63-bit value with the low 63 bits of `x`.
pub fn norm63(x : Int64) -> Int64 {
  x << 1 >> 1
}

///|
/// OCaml's `+` on ints.
pub fn add63(a : Int64, b : Int64) -> Int64 {
  norm63(a + b)
}

///|
/// OCaml's `-` on ints.
pub fn sub63(a : Int64, b : Int64) -> Int64 {
  norm63(a - b)
}

///|
/// OCaml's `*` on ints.
pub fn mul63(a : Int64, b : Int64) -> Int64 {
  norm63(a * b)
}

///|
/// OCaml's `~-` on ints.
pub fn neg63(a : Int64) -> Int64 {
  norm63(-a)
}

///|
/// OCaml's `succ`.
pub fn succ63(a : Int64) -> Int64 {
  norm63(a + 1L)
}

///|
/// OCaml's `pred`.
pub fn pred63(a : Int64) -> Int64 {
  norm63(a - 1L)
}

///|
/// OCaml's `/` on ints: truncating, `Division_by_zero` on 0
/// (`min_int / -1` is `min_int`).
pub fn div63(a : Int64, b : Int64) -> Int64 raise @num.DivisionByZero {
  if b == 0L {
    raise @num.DivisionByZero
  }
  norm63(a / b)
}

///|
/// OCaml's `mod` on ints: the sign of the dividend, `Division_by_zero` on 0.
pub fn mod63(a : Int64, b : Int64) -> Int64 raise @num.DivisionByZero {
  if b == 0L {
    raise @num.DivisionByZero
  }
  a % b
}

///|
/// OCaml's `abs` on ints (`abs min_int` is `min_int`).
pub fn abs63(a : Int64) -> Int64 {
  if a < 0L {
    neg63(a)
  } else {
    a
  }
}

///|
/// OCaml's `lsl` (counts 0..63; others are unspecified in OCaml).
pub fn lsl63(a : Int64, k : Int64) -> Int64 {
  norm63(a << k.to_int())
}

///|
/// OCaml's `lsr`: a logical shift of the 63-bit pattern.
pub fn lsr63(a : Int64, k : Int64) -> Int64 {
  norm63((a & 0x7FFFFFFFFFFFFFFFL) >> k.to_int())
}

///|
/// OCaml's `asr`.
pub fn asr63(a : Int64, k : Int64) -> Int64 {
  a >> k.to_int()
}

///|
/// OCaml's `lnot`.
pub fn lnot63(a : Int64) -> Int64 {
  a.lnot()
}

///|
/// An OCaml int as a MoonBit `Int` (an index, a size, a comparison
/// result), saturating outside the 32-bit range: signs and order are kept,
/// and an out-of-range index or size still fails in the callee as in OCaml.
pub fn int63_to_int(a : Int64) -> Int32 {
  if a < -2147483648L {
    -2147483648
  } else if a > 2147483647L {
    2147483647
  } else {
    a.to_int()
  }
}
