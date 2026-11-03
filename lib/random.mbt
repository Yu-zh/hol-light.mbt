// OCaml 4.14's Stdlib.Random (lagged-Fibonacci F(55, 24, +) with bit
// mixing) and the MD5 digest its seeding uses, so that pseudo-random
// choices match upstream exactly. All state values are 30-bit.

///|
/// `Random.State.t`
priv struct RandomState {
  st : FixedArray[Int32]
  mut idx : Int32
}

///|
/// The default state (`Random.default` in random.ml).
let random_default : RandomState = {
  st: [
    0x3ae2522b, 0x1d8d4634, 0x15b4fad0, 0x18b14ace, 0x12f8a3c4, 0x3b086c47, 0x16d467d6,
    0x101d91c7, 0x321df177, 0x0176c193, 0x1ff72bf1, 0x1e889109, 0x0b464b18, 0x2b86b97c,
    0x0891da48, 0x03137463, 0x085ac5a1, 0x15d61f2f, 0x3bced359, 0x29c1c132, 0x3a86766e,
    0x366d8c86, 0x1f5b6222, 0x3ce1b59f, 0x2ebf78e1, 0x27cd1b86, 0x258f3dc3, 0x389a8194,
    0x02e4c44c, 0x18c43f7d, 0x0f6e534f, 0x1e7df359, 0x055d0b7e, 0x10e84e7e, 0x126198e4,
    0x0e7722cb, 0x1cbede28, 0x3391b964, 0x3d40e92a, 0x0c59933d, 0x0b8cd0b7, 0x24efff1c,
    0x2803fdaa, 0x08ebc72e, 0x0f522e32, 0x05398edc, 0x2144a04c, 0x0aef3cbd, 0x01ad4719,
    0x35b93cd6, 0x2a559d4f, 0x1e6fd768, 0x26e27f36, 0x186f18c3, 0x2fbf967a,
  ],
  idx: 0,
}

///|
fn RandomState::bits(self : RandomState) -> Int32 {
  self.idx = (self.idx + 1) % 55
  let curval = self.st[self.idx]
  // both summands are below 2^30, so the sum fits in 32 bits
  let newval = self.st[(self.idx + 24) % 55] +
    (
      curval ^
      ((curval.reinterpret_as_uint() >> 25).reinterpret_as_int() & 0x1F)
    )
  let newval30 = newval & 0x3FFFFFFF
  self.st[self.idx] = newval30
  newval30
}

///|
fn RandomState::full_init(self : RandomState, seed : Array[Int64]) -> Unit {
  let seed = if seed.length() == 0 { [0L] } else { seed }
  let l = seed.length()
  for i in 0..<55 {
    self.st[i] = i
  }
  let mut accu : Bytes = b"x"
  let n = if 55 > l { 55 } else { l }
  for i in 0..<=(54 + n) {
    let j = i % 55
    let k = i % l
    // Digest.string (accu ^ Int.to_string seed.(k))
    let buf = Buffer()
    buf.write_bytes(accu)
    buf.write_bytes(@utf8.encode(seed[k].to_string()))
    accu = md5(buf.contents())
    let extract = accu[0].to_int() |
      (accu[1].to_int() << 8) |
      (accu[2].to_int() << 16) |
      (accu[3].to_int() << 24)
    self.st[j] = (self.st[j] ^ extract) & 0x3FFFFFFF
  }
  self.idx = 0
}

///|
/// `Random.bits ()`: 30 random bits.
pub fn random_bits() -> Int64 {
  random_default.bits().to_int64()
}

///|
/// `Random.int bound`: raises `Invalid_argument` unless 0 < bound <= 2^30 - 1.
pub fn random_int(bound : Int64) -> Int64 raise {
  if bound > 0x3FFFFFFFL || bound <= 0L {
    raise @num.InvalidArgument("Random.int")
  }
  let bound = bound.to_int()
  while true {
    let r = random_default.bits()
    let v = r % bound
    if !(r - v > 0x3FFFFFFF - bound + 1) {
      return v.to_int64()
    }
  }
  0L
}

///|
/// `Random.init seed`
pub fn random_init(seed : Int64) -> Unit {
  random_default.full_init([seed])
}

///|
/// `Random.full_init seeds`
pub fn random_full_init(seed : Array[Int64]) -> Unit {
  random_default.full_init(seed)
}

// ---------------------------------------------------------------------------
// MD5 (RFC 1321), as OCaml's Digest.string.
// ---------------------------------------------------------------------------

///|
let md5_shifts : FixedArray[Int32] = [
  7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22, 5, 9, 14, 20, 5, 9,
  14, 20, 5, 9, 14, 20, 5, 9, 14, 20, 4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23,
  4, 11, 16, 23, 6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21,
]

///|
let md5_table : FixedArray[UInt32] = [
  0xd76aa478, 0xe8c7b756, 0x242070db, 0xc1bdceee, 0xf57c0faf, 0x4787c62a, 0xa8304613,
  0xfd469501, 0x698098d8, 0x8b44f7af, 0xffff5bb1, 0x895cd7be, 0x6b901122, 0xfd987193,
  0xa679438e, 0x49b40821, 0xf61e2562, 0xc040b340, 0x265e5a51, 0xe9b6c7aa, 0xd62f105d,
  0x02441453, 0xd8a1e681, 0xe7d3fbc8, 0x21e1cde6, 0xc33707d6, 0xf4d50d87, 0x455a14ed,
  0xa9e3e905, 0xfcefa3f8, 0x676f02d9, 0x8d2a4c8a, 0xfffa3942, 0x8771f681, 0x6d9d6122,
  0xfde5380c, 0xa4beea44, 0x4bdecfa9, 0xf6bb4b60, 0xbebfbc70, 0x289b7ec6, 0xeaa127fa,
  0xd4ef3085, 0x04881d05, 0xd9d4d039, 0xe6db99e5, 0x1fa27cf8, 0xc4ac5665, 0xf4292244,
  0x432aff97, 0xab9423a7, 0xfc93a039, 0x655b59c3, 0x8f0ccc92, 0xffeff47d, 0x85845dd1,
  0x6fa87e4f, 0xfe2ce6e0, 0xa3014314, 0x4e0811a1, 0xf7537e82, 0xbd3af235, 0x2ad7d2bb,
  0xeb86d391,
]

///|
/// The 16-byte MD5 digest of `data`.
pub fn md5(data : Bytes) -> Bytes {
  let len = data.length()
  // message, 0x80, zero padding to 56 mod 64, then the bit length (LE)
  let total = (len + 8) / 64 * 64 + 64
  let msg = FixedArray::make(total, (0 : Byte))
  for i in 0..<len {
    msg[i] = data[i]
  }
  msg[len] = 0x80
  let bitlen = len.to_uint64() * 8
  for i in 0..<8 {
    msg[total - 8 + i] = (bitlen >> (8 * i)).to_byte()
  }
  let mut a0 : UInt32 = 0x67452301
  let mut b0 : UInt32 = 0xefcdab89
  let mut c0 : UInt32 = 0x98badcfe
  let mut d0 : UInt32 = 0x10325476
  let m = FixedArray::make(16, (0 : UInt32))
  for chunk = 0; chunk < total; chunk = chunk + 64 {
    for w in 0..<16 {
      let o = chunk + 4 * w
      m[w] = msg[o].to_uint() |
        (msg[o + 1].to_uint() << 8) |
        (msg[o + 2].to_uint() << 16) |
        (msg[o + 3].to_uint() << 24)
    }
    let mut a = a0
    let mut b = b0
    let mut c = c0
    let mut d = d0
    for i in 0..<64 {
      let (f, g) = if i < 16 {
        ((b & c) | (b.lnot() & d), i)
      } else if i < 32 {
        ((d & b) | (d.lnot() & c), (5 * i + 1) % 16)
      } else if i < 48 {
        (b ^ c ^ d, (3 * i + 5) % 16)
      } else {
        (c ^ (b | d.lnot()), 7 * i % 16)
      }
      let f = f + a + md5_table[i] + m[g]
      a = d
      d = c
      c = b
      let s = md5_shifts[i]
      b = b + ((f << s) | (f >> (32 - s)))
    }
    a0 = a0 + a
    b0 = b0 + b
    c0 = c0 + c
    d0 = d0 + d
  }
  let out = FixedArray::make(16, (0 : Byte))
  for i, v in [a0, b0, c0, d0] {
    for k in 0..<4 {
      out[4 * i + k] = (v >> (8 * k)).to_byte()
    }
  }
  Bytes::from_array(out)
}
