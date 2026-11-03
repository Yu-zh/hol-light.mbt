// OCaml's `string_of_float`, used by `time`.

///|
/// OCaml's `string_of_float`: C's `%.12g`, with a `.` appended when the
/// result would otherwise read as an integer.
pub fn string_of_float(x : Double) -> String {
  let s = format_float_g(x, 12)
  for c in s {
    if !((c >= '0' && c <= '9') || c == '-') {
      return s
    }
  }
  s + "."
}

///|
fn pow10(n : Int32) -> @bigint.BigInt {
  @bigint.BigInt::from_int(10).pow(@bigint.BigInt::from_int(n))
}

///|
/// C's `%.<prec>g` (correctly rounded, ties to even), `prec >= 1`.
fn format_float_g(x : Double, prec : Int32) -> String {
  if x.is_nan() {
    return "nan"
  }
  let bits = x.reinterpret_as_int64()
  let neg = bits < 0L
  let sign = if neg { "-" } else { "" }
  if x.is_inf() {
    return sign + "inf"
  }
  let biased = ((bits >> 52) & 0x7FFL).to_int()
  let frac = bits & 0xFFFFFFFFFFFFFL
  if biased == 0 && frac == 0L {
    return sign + "0"
  }
  // |x| = m * 2^e exactly.
  let (m, e) = if biased == 0 {
    (frac, -1074)
  } else {
    (frac | 0x10000000000000L, biased - 1075)
  }
  let bm = @bigint.BigInt::from_int64(m)
  let one = @bigint.BigInt::from_int(1)
  let (num, den) = if e >= 0 { (bm.shl(e), one) } else { (bm, one.shl(-e)) }
  // The decimal exponent: 10^ex <= |x| < 10^(ex+1).
  // An estimate from the binary exponent, then corrected exactly.
  let b2 = e + bm.bit_length() - 1
  let mut ex = if b2 >= 0 {
    b2 * 30103 / 100000
  } else {
    -((-b2 * 30103 + 99999) / 100000)
  }
  let ge_pow10 = (k : Int32) => {
    if k >= 0 {
      num.compare(den * pow10(k)) >= 0
    } else {
      (num * pow10(-k)).compare(den) >= 0
    }
  }
  while !ge_pow10(ex) {
    ex -= 1
  }
  while ge_pow10(ex + 1) {
    ex += 1
  }
  let k = prec - 1 - ex
  let (n, d) = if k >= 0 {
    (num * pow10(k), den)
  } else {
    (num, den * pow10(-k))
  }
  let mut q = n / d
  let r = n - q * d
  let c = (r + r).compare(d)
  if c > 0 || (c == 0 && (q % @bigint.BigInt::from_int(2)).equal_int(1)) {
    q = q + one
  }
  if q.compare(pow10(prec)) == 0 {
    ex += 1
    q = pow10(prec - 1)
  }
  let digits = q.to_string()
  let strip = (s : String) => {
    // Drop trailing zeros of a fraction, then a bare point.
    if !s.contains(".") {
      return s
    }
    let mut end = s.length()
    while end > 0 && s[end - 1] == '0' {
      end -= 1
    }
    if end > 0 && s[end - 1] == '.' {
      end -= 1
    }
    s[:end].to_owned()
  }
  if ex < -4 || ex >= prec {
    let mant = strip(digits[0:1].to_owned() + "." + digits[1:].to_owned())
    let es = if ex < 0 { "-" } else { "+" }
    let ea = ex.abs()
    let estr = if ea < 10 { "0" + ea.to_string() } else { ea.to_string() }
    sign + mant + "e" + es + estr
  } else if ex >= 0 {
    sign + strip(digits[0:ex + 1].to_owned() + "." + digits[ex + 1:].to_owned())
  } else {
    sign + strip("0." + "0".repeat(-ex - 1) + digits)
  }
}
