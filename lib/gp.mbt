// The outside world translated code may reach: wasm has no shell and no
// file system. One command is emulated: Library/pocklington.ml and
// Library/pratt.ml ask PARI/GP to factor a number,
//   echo 'print(factorint(N))  \n quit' | gp >FILE 2>/dev/null
// and read FILE back. The factorization is computed here (Baillie-PSW and
// Pollard rho) and printed as gp prints it ("[p1, e1; p2, e2]", or
// "Mat([p, e])" for one factor) into an in-memory file. It only guides the
// construction of primality certificates, which the kernel checks.

///|
/// The in-memory files written by emulated commands.
let virtual_files : Map[String, String] = Map([])

///|
/// `Sys.command`: the gp factorization above; else what the command did
/// upstream, if that was recorded (`replay_command`); else "command not
/// found" (exit status 127, as on a host without the command).
pub fn sys_command(cmd : String) -> Int32 {
  match gp_factorint_command(cmd) {
    Some((n, file)) => {
      virtual_files[file] = gp_factorint(n) + "\n"
      return 0
    }
    None => ()
  }
  let (shape, paths) = command_shape(cmd)
  let inputs = paths.map(p => {
    virtual_files.get(p).map(s => name_paths(s, paths))
  })
  for r in command_replays.get(shape).unwrap_or([]) {
    if r.inputs == inputs {
      for o in r.outputs {
        virtual_files[paths[o.0]] = unname_paths(o.1, paths)
      }
      return r.status
    }
  }
  127
}

///|
/// A file's text with the command's file names replaced by their `<Fi>`
/// (a file may name itself: Minisat/ writes the problem's file name into
/// it), the longest first (one may be a prefix of another).
fn name_paths(text : String, paths : Array[String]) -> String {
  let order = Array::makei(paths.length(), i => i)
  order.sort_by((a, b) => paths[b].length().compare(paths[a].length()))
  let mut t = text
  for i in order {
    t = t.replace_all(old=paths[i], new="<F" + (i + 1).to_string() + ">")
  }
  t
}

///|
/// The other way round, for the files a replayed command writes.
fn unname_paths(text : String, paths : Array[String]) -> String {
  let mut t = text
  for i in 0..<paths.length() {
    t = t.replace_all(old="<F" + (i + 1).to_string() + ">", new=paths[i])
  }
  t
}

///|
/// What a command did when upstream ran it.
priv struct Replay {
  inputs : Array[String?]
  status : Int32
  outputs : Array[(Int32, String)]
}

///|
let command_replays : Map[String, Array[Replay]] = Map([])

///|
/// Record a run of an external program (csdp for Examples/sos.ml's
/// REAL_SOS, ...): wasm has no processes, so the answers upstream got are
/// replayed (they only guide proofs the kernel checks). `shape` is the
/// command with its file names replaced by `<F1>`, `<F2>`, ... (temporary
/// names differ from run to run); `inputs` the contents of those files
/// before the run (`None`: not a file then); `outputs` the files it wrote,
/// by index; file names inside those contents are `<Fi>` too. A command
/// is answered when its shape and inputs are the same.
/// tools/ocaml_ref/prelude.ml records them, batch.py writes the calls.
pub fn replay_command(
  shape : String,
  inputs : Array[String?],
  status : Int32,
  outputs : Array[(Int32, String)],
) -> Unit {
  let r = Replay::{ inputs, status, outputs, }
  match command_replays.get(shape) {
    Some(l) => l.push(r)
    None => command_replays[shape] = [r]
  }
}

///|
/// A command's shape and its file names, in order of appearance: the words
/// (between blanks and `;()<>|&'"`) that contain a `/`.
fn command_shape(cmd : String) -> (String, Array[String]) {
  let paths : Array[String] = []
  let out = StringBuilder()
  let tok = StringBuilder()
  fn flush() {
    let t = tok.to_string()
    tok.reset()
    if t.contains("/") {
      let i = match paths.search(t) {
        Some(i) => i
        None => {
          paths.push(t)
          paths.length() - 1
        }
      }
      out.write_string("<F" + (i + 1).to_string() + ">")
    } else {
      out.write_string(t)
    }
  }

  for c in cmd {
    if " \t\n;()<>|&'\"".contains_char(c) {
      flush()
      out.write_char(c)
    } else {
      tok.write_char(c)
    }
  }
  flush()
  (out.to_string(), paths)
}

///|
/// lib.ml's `strings_of_file`: the file's lines (a final newline ends the
/// last line; it does not start an empty one).
pub fn strings_of_file(name : String) -> @list.List[String] raise {
  match virtual_files.get(name) {
    Some(s) => {
      let lines : Array[String] = []
      let mut start = 0
      for i in 0..<s.length() {
        if s[i].to_int() == 10 {
          lines.push(s[start:i].to_owned())
          start = i + 1
        }
      }
      if start < s.length() {
        lines.push(s[start:].to_owned())
      }
      @list.List(lines)
    }
    None => raise Failure("strings_of_file: can't open " + name)
  }
}

///|
/// lib.ml's `file_of_string`: an in-memory file.
pub fn file_of_string(name : String, s : String) -> Unit {
  virtual_files[name] = s
}

///|
/// `Sys.remove`
pub fn sys_remove(name : String) -> Unit raise {
  if virtual_files.contains(name) {
    virtual_files.remove(name)
  } else {
    raise SysError(name + ": No such file or directory")
  }
}

///|
/// `Sys.file_exists`
pub fn sys_file_exists(name : String) -> Bool {
  virtual_files.contains(name)
}

///|
/// lib.ml's `string_of_file`: the file's lines joined by newlines (a final
/// newline is not part of it, as upstream reads lines and joins them).
pub fn string_of_file(name : String) -> String raise {
  match virtual_files.get(name) {
    Some(s) =>
      if s.has_suffix("\n") {
        s[:s.length() - 1].to_owned()
      } else {
        s
      }
    None => raise SysError(name + ": No such file or directory")
  }
}

///|
/// `echo 'print(factorint(N))...' | gp >FILE ...` -> (N, FILE)
fn gp_factorint_command(cmd : String) -> (@bigint.BigInt, String)? {
  let prefix = "echo 'print(factorint("
  guard cmd.has_prefix(prefix) else { return None }
  let rest = cmd[prefix.length():].to_owned()
  let digits = StringBuilder()
  let mut i = 0
  while i < rest.length() && rest[i] >= '0' && rest[i] <= '9' {
    digits.write_char(rest[i].unsafe_to_char())
    i += 1
  }
  guard i > 0 && rest[i:].has_prefix("))") else { return None }
  guard rest.contains("| gp >") else { return None }
  let after = rest.split("| gp >").to_array()
  let file = after[after.length() - 1].to_owned()
  let file = match file.find(" ") {
    Some(j) => file[:j].to_owned()
    None => file
  }
  Some((@bigint.BigInt::from_string(digits.to_string()), file))
}

///|
let big0 : @bigint.BigInt = @bigint.BigInt::from_int(0)

///|
let big1 : @bigint.BigInt = @bigint.BigInt::from_int(1)

///|
let big2 : @bigint.BigInt = @bigint.BigInt::from_int(2)

///|
/// `a mod n` in [0, n) for n > 0.
fn big_modp(a : @bigint.BigInt, n : @bigint.BigInt) -> @bigint.BigInt {
  let r = a % n
  if r < big0 {
    r + n
  } else {
    r
  }
}

///|
/// floor(sqrt(n)) for n >= 0 (Newton's method).
fn big_isqrt(n : @bigint.BigInt) -> @bigint.BigInt {
  if n < big2 {
    return n
  }
  let mut x = big1.shl((n.bit_length() + 1) / 2)
  while true {
    let y = (x + n / x).shr(1)
    if y >= x {
      return x
    }
    x = y
  }
  x
}

///|
/// The Jacobi symbol (a/n) for odd n > 0.
fn big_jacobi(a : @bigint.BigInt, n : @bigint.BigInt) -> Int32 {
  let big3 = @bigint.BigInt::from_int(3)
  let big4 = @bigint.BigInt::from_int(4)
  let big5 = @bigint.BigInt::from_int(5)
  let big8 = @bigint.BigInt::from_int(8)
  let mut a = big_modp(a, n)
  let mut n = n
  let mut t = 1
  while !a.is_zero() {
    while (a % big2).is_zero() {
      a = a.shr(1)
      let r = n % big8
      if r == big3 || r == big5 {
        t = -t
      }
    }
    let tmp = a
    a = n
    n = tmp
    if a % big4 == big3 && n % big4 == big3 {
      t = -t
    }
    a = a % n
  }
  if n == big1 {
    t
  } else {
    0
  }
}

///|
/// Strong Fermat test to base `a` for odd n > 2.
fn strong_fermat(n : @bigint.BigInt, a : @bigint.BigInt) -> Bool {
  let nm1 = n - big1
  let s = nm1.ctz()
  let d = nm1.shr(s)
  let mut x = a.pow(d, modulus=n)
  if x == big1 || x == nm1 {
    return true
  }
  for _ in 1..<s {
    x = x * x % n
    if x == nm1 {
      return true
    }
  }
  false
}

///|
/// Strong Lucas probable-prime test with Selfridge's parameters (D the
/// first of 5, -7, 9, -11, ... with (D/n) = -1; P = 1, Q = (1 - D) / 4), for
/// odd n > 47 that is not a perfect square.
fn strong_lucas(n : @bigint.BigInt) -> Bool {
  let mut dd = 5
  while true {
    let j = big_jacobi(@bigint.BigInt::from_int(dd), n)
    if j == -1 {
      break
    }
    if j == 0 {
      return false
    }
    dd = if dd > 0 { -(dd + 2) } else { -dd + 2 }
  }
  let d = @bigint.BigInt::from_int(dd)
  let q = big_modp(@bigint.BigInt::from_int((1 - dd) / 4), n)
  let np1 = n + big1
  let s = np1.ctz()
  let k = np1.shr(s)
  // x / 2 mod n
  let half = (x : @bigint.BigInt) => {
    let x = if (x % big2).is_zero() { x } else { x + n }
    big_modp(x.shr(1), n)
  }
  // U_k, V_k and Q^k, from the top bit of k down (P = 1)
  let mut u = big1
  let mut v = big1
  let mut qk = q
  for i = k.bit_length() - 2; i >= 0; i = i - 1 {
    u = u * v % n
    v = big_modp(v * v - qk - qk, n)
    qk = qk * qk % n
    if !(k.shr(i) % big2).is_zero() {
      let u1 = half(u + v)
      let v1 = half(big_modp(d * u, n) + v)
      u = u1
      v = v1
      qk = qk * q % n
    }
  }
  if u.is_zero() || v.is_zero() {
    return true
  }
  for _ in 1..<s {
    v = big_modp(v * v - qk - qk, n)
    qk = qk * qk % n
    if v.is_zero() {
      return true
    }
  }
  false
}

///|
/// Baillie-PSW probable-prime test, as PARI's (no BPSW pseudoprime is
/// known), so the factors agree with gp's.
fn is_probable_prime(n : @bigint.BigInt) -> Bool {
  if n < big2 {
    return false
  }
  for p in [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47] {
    let bp = @bigint.BigInt::from_int(p)
    if n == bp {
      return true
    }
    if (n % bp).is_zero() {
      return false
    }
  }
  if !strong_fermat(n, big2) {
    return false
  }
  let r = big_isqrt(n)
  if r * r == n {
    return false
  }
  strong_lucas(n)
}

///|
fn big_gcd_(a : @bigint.BigInt, b : @bigint.BigInt) -> @bigint.BigInt {
  let mut a = a
  let mut b = b
  while !b.is_zero() {
    let t = a % b
    a = b
    b = t
  }
  a
}

///|
/// floor(n^(1/k)) for n >= 0, k >= 1 (Newton's method).
fn big_iroot(n : @bigint.BigInt, k : Int32) -> @bigint.BigInt {
  if n < big2 || k == 1 {
    return n
  }
  let bk = @bigint.BigInt::from_int(k)
  let bk1 = @bigint.BigInt::from_int(k - 1)
  let mut x = big1.shl(n.bit_length() / k + 1)
  while true {
    let y = (bk1 * x + n / x.pow(bk1)) / bk
    if y >= x {
      return x
    }
    x = y
  }
  x
}

///|
/// `Some((r, k))` with n = r^k, k >= 2 maximal-first, for n >= 2.
fn perfect_power(n : @bigint.BigInt) -> (@bigint.BigInt, Int32)? {
  for k = n.bit_length(); k >= 2; k = k - 1 {
    let r = big_iroot(n, k)
    if r >= big2 && r.pow(@bigint.BigInt::from_int(k)) == n {
      return Some((r, k))
    }
  }
  None
}

///|
/// A nontrivial factor of odd composite `n` that is not a perfect power
/// (Pollard rho, Brent's variant with batched gcds).
fn rho_factor(n : @bigint.BigInt) -> @bigint.BigInt {
  let mut c = big1
  while true {
    let f = (x : @bigint.BigInt) => (x * x + c) % n
    let mut y = big2
    let mut x = big2
    let mut ys = big2
    let mut g = big1
    let mut q = big1
    let mut r = 1
    let m = 128
    while g == big1 {
      x = y
      for _ in 0..<r {
        y = f(y)
      }
      let mut k = 0
      while k < r && g == big1 {
        ys = y
        for _ in 0..<(if m < r - k { m } else { r - k }) {
          y = f(y)
          let diff = if x > y { x - y } else { y - x }
          q = q * diff % n
        }
        g = big_gcd_(q, n)
        k = k + m
      }
      r = r * 2
    }
    if g == n {
      // backtrack one step at a time from the last batch
      g = big1
      while g == big1 {
        ys = f(ys)
        let diff = if x > ys { x - ys } else { ys - x }
        g = big_gcd_(diff, n)
      }
    }
    if g != n {
      return g
    }
    c = c + big1
  }
  n
}

///|
/// The prime factors of `n` (with repetition).
fn prime_factors(n : @bigint.BigInt, acc : Array[@bigint.BigInt]) -> Unit {
  if n == big1 {
    return
  }
  if is_probable_prime(n) {
    acc.push(n)
    return
  }
  // small factors by trial division first
  for p in [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47] {
    let bp = @bigint.BigInt::from_int(p)
    if (n % bp).is_zero() {
      acc.push(bp)
      prime_factors(n / bp, acc)
      return
    }
  }
  match perfect_power(n) {
    Some((r, k)) =>
      for _ in 0..<k {
        prime_factors(r, acc)
      }
    None => {
      let d = rho_factor(n)
      prime_factors(d, acc)
      prime_factors(n / d, acc)
    }
  }
}

///|
/// gp's `print(factorint(n))` for n >= 0.
pub fn gp_factorint(n : @bigint.BigInt) -> String {
  if n.is_zero() {
    return "Mat([0, 1])"
  }
  if n == big1 {
    return "matrix(0,2)"
  }
  let fs = []
  prime_factors(n, fs)
  fs.sort_by((a, b) => a.compare(b))
  let rows : Array[(@bigint.BigInt, Int32)] = []
  for p in fs {
    if rows.length() > 0 && rows[rows.length() - 1].0 == p {
      rows[rows.length() - 1] = (p, rows[rows.length() - 1].1 + 1)
    } else {
      rows.push((p, 1))
    }
  }
  let body = rows.map(r => r.0.to_string() + ", " + r.1.to_string()).join("; ")
  if rows.length() == 1 {
    "Mat([" + body + "])"
  } else {
    "[" + body + "]"
  }
}
