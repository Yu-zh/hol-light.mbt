// OCaml's Str library: regular expressions in its syntax, matched as its
// backtracking matcher does (otherlibs/str/str.ml, strstubs.c): the first
// alternative that leads to a match, the longest repetition that does.
// A string is matched by the bytes of its UTF-8 encoding, as OCaml's is,
// and positions are byte offsets (as `String.length` counts, lib/stdlib.mbt).

///|
priv enum Re {
  Chr(Int32)
  // ranges of characters; complemented or not
  Cls(Array[(Int32, Int32)], Bool)
  Seq(Array[Re])
  Alt(Re, Re)
  Star(Re)
  Plus(Re)
  Opt(Re)
  Group(Int32, Re)
  Refgroup(Int32)
  Bol
  Eol
  Wordboundary
}

///|
/// `Str.regexp`
struct StrRegexp {
  re : Re
  // the groups, with group 0 (the whole match)
  ngroups : Int32
}

///|
priv struct ReParser {
  s : Bytes
  len : Int32
  mut groups : Int32
}

///|
fn ReParser::at(self : ReParser, i : Int32) -> Int32 {
  self.s[i].to_int()
}

///|
/// Whether `\c` is at `i`.
fn ReParser::backslash(self : ReParser, i : Int32, c : Char) -> Bool {
  i + 2 <= self.len &&
  self.at(i) == '\\'.to_int() &&
  self.at(i + 1) == c.to_int()
}

///|
/// Alternatives: `r1 \| r2 \| ...`
fn ReParser::regexp0(self : ReParser, i : Int32) -> (Re, Int32) raise {
  let (r, j) = self.regexp1(i)
  let mut r = r
  let mut j = j
  while self.backslash(j, '|') {
    let (r2, j2) = self.regexp1(j + 2)
    r = Alt(r, r2)
    j = j2
  }
  (r, j)
}

///|
/// A sequence, up to the end, `\|` or `\)`.
fn ReParser::regexp1(self : ReParser, i : Int32) -> (Re, Int32) raise {
  let items : Array[Re] = []
  let mut i = i
  while !(i >= self.len || self.backslash(i, '|') || self.backslash(i, ')')) {
    let (r, j) = self.regexp2(i)
    items.push(r)
    i = j
  }
  (Seq(items), i)
}

///|
/// An item and its postfix operators.
fn ReParser::regexp2(self : ReParser, i : Int32) -> (Re, Int32) raise {
  let (r, j) = self.regexp3(i)
  let mut r = r
  let mut j = j
  while j < self.len {
    let c = self.at(j)
    if c == '?'.to_int() {
      r = Opt(r)
    } else if c == '*'.to_int() {
      r = Star(r)
    } else if c == '+'.to_int() {
      r = Plus(r)
    } else {
      break
    }
    j += 1
  }
  (r, j)
}

///|
fn ReParser::regexp3(self : ReParser, i : Int32) -> (Re, Int32) raise {
  let c = self.at(i)
  if c == '\\'.to_int() {
    self.regexpbackslash(i + 1)
  } else if c == '['.to_int() {
    self.regexpclass(i + 1)
  } else if c == '^'.to_int() {
    (Bol, i + 1)
  } else if c == '$'.to_int() {
    (Eol, i + 1)
  } else if c == '.'.to_int() {
    // any character but a newline
    (Cls([(10, 10)], true), i + 1)
  } else {
    (Chr(c), i + 1)
  }
}

///|
fn ReParser::regexpbackslash(self : ReParser, i : Int32) -> (Re, Int32) raise {
  if i >= self.len {
    return (Chr('\\'.to_int()), i)
  }
  let c = self.at(i)
  if c == '('.to_int() {
    let group_no = self.groups
    self.groups += 1
    let (r, j) = self.regexp0(i + 1)
    if self.backslash(j, ')') {
      (Group(group_no, r), j + 2)
    } else {
      raise Failure("\\( group not closed by \\)")
    }
  } else if c >= '1'.to_int() && c <= '9'.to_int() {
    (Refgroup(c - 48), i + 1)
  } else if c == 'b'.to_int() {
    (Wordboundary, i + 1)
  } else {
    // `\|` and `\)` do not get here: regexp1 stops at them
    (Chr(c), i + 1)
  }
}

///|
/// A class, after its `[`: `]` first is a member, `a-z` a range.
fn ReParser::regexpclass(self : ReParser, i : Int32) -> (Re, Int32) raise {
  let complemented = i < self.len && self.at(i) == '^'.to_int()
  let start = if complemented { i + 1 } else { i }
  let ranges : Array[(Int32, Int32)] = []
  let mut i = start
  while true {
    if i >= self.len {
      raise Failure("[ class not closed by ]")
    }
    if self.at(i) == ']'.to_int() && i > start {
      return (Cls(ranges, complemented), i + 1)
    }
    let c1 = self.at(i)
    if i + 2 < self.len &&
      self.at(i + 1) == '-'.to_int() &&
      self.at(i + 2) != ']'.to_int() {
      ranges.push((c1, self.at(i + 2)))
      i += 3
    } else {
      ranges.push((c1, c1))
      i += 1
    }
  }
  // not reached
  (Cls(ranges, complemented), i)
}

///|
/// `Str.regexp s`
pub fn str_regexp(s : String) -> StrRegexp raise {
  let b = @utf8.encode(s)
  let p : ReParser = { s: b, len: b.length(), groups: 1, }
  let (re, j) = p.regexp0(0)
  if j != p.len {
    raise Failure("spurious \\) in regular expression")
  }
  { re, ngroups: p.groups, }
}

///|
/// `Str.regexp_string s`: matches `s` and nothing else.
pub fn str_regexp_string(s : String) -> StrRegexp {
  let items : Array[Re] = []
  let b = @utf8.encode(s)
  for i in 0..<b.length() {
    items.push(Chr(b[i].to_int()))
  }
  { re: Seq(items), ngroups: 1, }
}

///|
/// `Str.quote s`: a regular expression source that matches `s`.
pub fn str_quote(s : String) -> String {
  let out = StringBuilder()
  for c in s {
    if "$^.*+?[]\\".contains_char(c) {
      out.write_char('\\')
    }
    out.write_char(c)
  }
  out.to_string()
}

///|
/// One attempt to match at a position of `s`; `groups` has the start and
/// the end of each group (-1 without one).
priv struct ReMatcher {
  s : Bytes
  n : Int32
  groups : Array[Int32]
}

///|
fn ReMatcher::at(self : ReMatcher, i : Int32) -> Int32 {
  self.s[i].to_int()
}

///|
/// The letters of `\b`: ASCII letters, digits, `_`, and Latin-1's letters.
fn is_word_letter(c : Int32) -> Bool {
  (c >= 'a'.to_int() && c <= 'z'.to_int()) ||
  (c >= 'A'.to_int() && c <= 'Z'.to_int()) ||
  (c >= '0'.to_int() && c <= '9'.to_int()) ||
  c == '_'.to_int() ||
  (c >= 0xC0 && c <= 0xFF && c != 0xD7 && c != 0xF7)
}

///|
/// Whether `re` matches exactly one character and has no group.
fn re_is_single(re : Re) -> Bool {
  match re {
    Chr(_) | Cls(_, _) => true
    Alt(a, b) => re_is_single(a) && re_is_single(b)
    Seq(items) => items.length() == 1 && re_is_single(items[0])
    _ => false
  }
}

///|
/// A one-character expression, possibly as a group (`\(.\|\n\)`): the
/// group (or -1) and the expression. Its repetitions are matched by a loop
/// (the general case recurses once per repetition).
fn re_simple(re : Re) -> (Int32, Re)? {
  match re {
    Group(n, r) => if re_is_single(r) { Some((n, r)) } else { None }
    _ => if re_is_single(re) { Some((-1, re)) } else { None }
  }
}

///|
fn ReMatcher::single(self : ReMatcher, re : Re, pos : Int32) -> Bool {
  if pos >= self.n {
    return false
  }
  let c = self.at(pos)
  match re {
    Chr(d) => c == d
    Cls(ranges, complemented) => {
      let mut found = false
      for r in ranges {
        if c >= r.0 && c <= r.1 {
          found = true
          break
        }
      }
      found != complemented
    }
    Alt(a, b) => self.single(a, pos) || self.single(b, pos)
    Seq(items) => items.length() == 1 && self.single(items[0], pos)
    _ => false
  }
}

///|
/// Match `re` at `pos`, then the rest (`k`, given the position reached):
/// false sends the matcher back to its last choice.
fn ReMatcher::run(
  self : ReMatcher,
  re : Re,
  pos : Int32,
  k : (Int32) -> Bool,
) -> Bool {
  match re {
    Chr(_) | Cls(_, _) => self.single(re, pos) && k(pos + 1)
    Seq(items) => self.seq(items, 0, pos, k)
    Alt(a, b) => self.run(a, pos, k) || self.run(b, pos, k)
    Opt(r) => self.run(r, pos, k) || k(pos)
    Star(r) =>
      match re_simple(r) {
        Some((group, x)) => self.simple_star(group, x, pos, pos, k)
        None => self.star(r, pos, k)
      }
    Plus(r) =>
      match re_simple(r) {
        Some((group, x)) =>
          self.single(x, pos) && self.simple_star(group, x, pos + 1, pos, k)
        None => self.run(r, pos, p => self.star(r, p, k))
      }
    Group(n, r) => {
      let old_start = self.groups[2 * n]
      self.groups[2 * n] = pos
      let ok = self.run(r, pos, p => {
        let old_end = self.groups[2 * n + 1]
        self.groups[2 * n + 1] = p
        if k(p) {
          true
        } else {
          self.groups[2 * n + 1] = old_end
          false
        }
      })
      if !ok {
        self.groups[2 * n] = old_start
      }
      ok
    }
    Refgroup(n) => {
      if 2 * n + 1 >= self.groups.length() {
        return false
      }
      let b = self.groups[2 * n]
      let e = self.groups[2 * n + 1]
      if b < 0 || e < 0 || pos + (e - b) > self.n {
        return false
      }
      for i in 0..<(e - b) {
        if self.at(b + i) != self.at(pos + i) {
          return false
        }
      }
      k(pos + (e - b))
    }
    Bol => (pos == 0 || self.at(pos - 1) == 10) && k(pos)
    Eol => (pos == self.n || self.at(pos) == 10) && k(pos)
    Wordboundary => {
      let ok = if pos == 0 {
        pos < self.n && is_word_letter(self.at(0))
      } else if pos == self.n {
        is_word_letter(self.at(pos - 1))
      } else {
        is_word_letter(self.at(pos - 1)) != is_word_letter(self.at(pos))
      }
      ok && k(pos)
    }
  }
}

///|
fn ReMatcher::seq(
  self : ReMatcher,
  items : Array[Re],
  i : Int32,
  pos : Int32,
  k : (Int32) -> Bool,
) -> Bool {
  if i == items.length() {
    k(pos)
  } else {
    self.run(items[i], pos, p => self.seq(items, i + 1, p, k))
  }
}

///|
/// As many of a one-character `r` as there are from `pos`, then fewer,
/// down to the position `least`. `group` (if not -1) is the last one.
fn ReMatcher::simple_star(
  self : ReMatcher,
  group : Int32,
  r : Re,
  least : Int32,
  pos : Int32,
  k : (Int32) -> Bool,
) -> Bool {
  let mut p = pos
  while self.single(r, p) {
    p += 1
  }
  let old_start = if group >= 0 { self.groups[2 * group] } else { -1 }
  let old_end = if group >= 0 { self.groups[2 * group + 1] } else { -1 }
  while p >= least {
    if group >= 0 && p > pos {
      self.groups[2 * group] = p - 1
      self.groups[2 * group + 1] = p
    } else if group >= 0 {
      self.groups[2 * group] = old_start
      self.groups[2 * group + 1] = old_end
    }
    if k(p) {
      return true
    }
    p -= 1
  }
  if group >= 0 {
    self.groups[2 * group] = old_start
    self.groups[2 * group + 1] = old_end
  }
  false
}

///|
/// One more `r`, if it gets further, or none.
fn ReMatcher::star(
  self : ReMatcher,
  r : Re,
  pos : Int32,
  k : (Int32) -> Bool,
) -> Bool {
  self.run(r, pos, p => p != pos && self.star(r, p, k)) || k(pos)
}

///|
/// The positions of the groups of the last match (`Str`'s
/// `last_search_result`): empty after a failed one.
let last_search_result : Ref[Array[Int32]] = Ref::{ val: [], }

///|
/// A match of `re` at `pos`: the groups, or nothing.
fn re_match_at(re : StrRegexp, s : Bytes, pos : Int32) -> Array[Int32]? {
  let m : ReMatcher = {
    s,
    n: s.length(),
    groups: Array::make(2 * re.ngroups, -1),
  }
  if m.run(re.re, pos, p => {
      m.groups[1] = p
      true
    }) {
    m.groups[0] = pos
    Some(m.groups)
  } else {
    None
  }
}

///|
/// `Str.string_match re s pos`: whether `re` matches at `pos`.
pub fn str_string_match(re : StrRegexp, s : String, pos : Int64) -> Bool raise {
  let s = @utf8.encode(s)
  if pos < 0L || pos > s.length().to_int64() {
    raise @num.InvalidArgument("Str.string_match")
  }
  match re_match_at(re, s, pos.to_int()) {
    Some(groups) => {
      last_search_result.val = groups
      true
    }
    None => {
      last_search_result.val = []
      false
    }
  }
}

///|
fn opt_search_forward(re : StrRegexp, s : Bytes, start : Int32) -> Int32? {
  for pos in start..<=s.length() {
    if re_match_at(re, s, pos) is Some(groups) {
      last_search_result.val = groups
      return Some(pos)
    }
  }
  last_search_result.val = []
  None
}

///|
/// `Str.search_forward re s start`: the first position from `start` on
/// where `re` matches; `Not_found` without one.
pub fn str_search_forward(
  re : StrRegexp,
  s : String,
  start : Int64,
) -> Int64 raise {
  let s = @utf8.encode(s)
  if start < 0L || start > s.length().to_int64() {
    raise @num.InvalidArgument("Str.search_forward")
  }
  match opt_search_forward(re, s, start.to_int()) {
    Some(pos) => pos.to_int64()
    None => raise NotFound
  }
}

///|
/// `Str.search_backward re s last`: the last position up to `last` where
/// `re` matches; `Not_found` without one.
pub fn str_search_backward(
  re : StrRegexp,
  s : String,
  last : Int64,
) -> Int64 raise {
  let s = @utf8.encode(s)
  if last < 0L || last > s.length().to_int64() {
    raise @num.InvalidArgument("Str.search_backward")
  }
  let mut pos = last.to_int()
  while pos >= 0 {
    if re_match_at(re, s, pos) is Some(groups) {
      last_search_result.val = groups
      return pos.to_int64()
    }
    pos -= 1
  }
  last_search_result.val = []
  raise NotFound
}

///|
/// `Str.group_beginning n`
pub fn str_group_beginning(n : Int64) -> Int64 raise {
  let r = last_search_result.val
  if n < 0L || n * 2L >= r.length().to_int64() {
    raise @num.InvalidArgument("Str.group_beginning")
  }
  let pos = r[n.to_int() * 2]
  if pos == -1 {
    raise NotFound
  }
  pos.to_int64()
}

///|
/// `Str.group_end n`
pub fn str_group_end(n : Int64) -> Int64 raise {
  let r = last_search_result.val
  if n < 0L || n * 2L >= r.length().to_int64() {
    raise @num.InvalidArgument("Str.group_end")
  }
  let pos = r[n.to_int() * 2 + 1]
  if pos == -1 {
    raise NotFound
  }
  pos.to_int64()
}

///|
/// `Str.match_beginning ()`
pub fn str_match_beginning(_ : Unit) -> Int64 raise {
  str_group_beginning(0L)
}

///|
/// `Str.match_end ()`
pub fn str_match_end(_ : Unit) -> Int64 raise {
  str_group_end(0L)
}

///|
/// The bytes from `start` to `stop` as a string (they are whole characters
/// wherever a file cuts its text).
fn utf8_slice(b : Bytes, start : Int32, stop : Int32) -> String {
  @utf8.decode(b[start:stop]) catch {
    _ => abort("Str: a string cut inside a non-ASCII character")
  }
}

///|
/// `String.sub` on the bytes of a string.
fn str_sub(s : String, start : Int32, len : Int32) -> String raise {
  let b = @utf8.encode(s)
  if start < 0 || len < 0 || start > b.length() - len {
    raise @num.InvalidArgument("String.sub / Bytes.sub")
  }
  utf8_slice(b, start, start + len)
}

///|
/// `Str.matched_group n s`: what group `n` of the last match matched, `s`
/// being the string that was matched.
pub fn str_matched_group(n : Int64, s : String) -> String raise {
  let r = last_search_result.val
  if n < 0L || n * 2L + 1L >= r.length().to_int64() {
    raise @num.InvalidArgument("Str.matched_group")
  }
  let b = r[n.to_int() * 2]
  let e = r[n.to_int() * 2 + 1]
  if b == -1 {
    raise NotFound
  }
  str_sub(s, b, e - b)
}

///|
/// `Str.matched_string s`
pub fn str_matched_string(s : String) -> String raise {
  if last_search_result.val.length() < 2 {
    raise @num.InvalidArgument("Str.matched_string")
  }
  str_matched_group(0L, s)
}

///|
/// The text `templ` stands for after the last match (in `s`): `\0` to `\9`
/// are its groups, `\\` a backslash.
fn replacement_text(templ : String, s : Bytes) -> String raise {
  let groups = last_search_result.val
  let out = StringBuilder()
  let t = templ.to_array()
  let n = t.length()
  let mut i = 0
  while i < n {
    let c = t[i]
    i += 1
    if c != '\\' {
      out.write_char(c)
      continue
    }
    if i == n {
      raise Failure("Str.replace: illegal backslash sequence")
    }
    let d = t[i]
    i += 1
    if d == '\\' {
      out.write_char('\\')
    } else if d >= '0' && d <= '9' {
      let g = d.to_int() - 48
      if g * 2 >= groups.length() || groups[g * 2] == -1 {
        raise Failure("Str.replace: reference to unmatched group")
      }
      out.write_string(utf8_slice(s, groups[g * 2], groups[g * 2 + 1]))
    } else {
      out.write_char('\\')
      out.write_char(d)
    }
  }
  out.to_string()
}

///|
/// `Str.global_replace re templ s`: `s` with every match of `re` replaced
/// by `templ`'s text.
pub fn str_global_replace(
  re : StrRegexp,
  templ : String,
  s : String,
) -> String raise {
  let b = @utf8.encode(s)
  let out = StringBuilder()
  let n = b.length()
  let mut start = 0
  let mut last_was_empty = false
  while true {
    let startpos = if last_was_empty { start + 1 } else { start }
    if startpos > n {
      break
    }
    match opt_search_forward(re, b, startpos) {
      None => break
      Some(pos) => {
        let end_pos = last_search_result.val[1]
        let repl = replacement_text(templ, b)
        out.write_string(utf8_slice(b, start, pos))
        out.write_string(repl)
        start = end_pos
        last_was_empty = end_pos == pos
      }
    }
  }
  out.write_string(utf8_slice(b, start, n))
  out.to_string()
}

///|
/// `Str.replace_first re templ s`: `s` with the first match replaced.
pub fn str_replace_first(
  re : StrRegexp,
  templ : String,
  s : String,
) -> String raise {
  let b = @utf8.encode(s)
  match opt_search_forward(re, b, 0) {
    None => s
    Some(pos) => {
      let end_pos = last_search_result.val[1]
      utf8_slice(b, 0, pos) +
      replacement_text(templ, b) +
      utf8_slice(b, end_pos, b.length())
    }
  }
}

///|
/// `Str.string_before s n`
pub fn str_string_before(s : String, n : Int64) -> String {
  utf8_slice(@utf8.encode(s), 0, n.to_int())
}

///|
/// `Str.string_after s n`
pub fn str_string_after(s : String, n : Int64) -> String {
  let b = @utf8.encode(s)
  utf8_slice(b, n.to_int(), b.length())
}

///|
/// `Str.first_chars s n`
pub fn str_first_chars(s : String, n : Int64) -> String raise {
  str_sub(s, 0, n.to_int())
}

///|
/// `Str.last_chars s n`
pub fn str_last_chars(s : String, n : Int64) -> String raise {
  str_sub(s, @utf8.encode(s).length() - n.to_int(), n.to_int())
}

///|
/// `Str.split re s`: the pieces of `s` between matches of `re`. A match at
/// the very beginning is skipped and nothing follows a match at the end; a
/// match counts when it gets further than where the piece starts.
pub fn str_split(re : StrRegexp, s : String) -> @list.List[String] {
  let b = @utf8.encode(s)
  let parts : Array[String] = []
  let n = b.length()
  let mut start = match re_match_at(re, b, 0) {
    Some(groups) => groups[1]
    None => 0
  }
  while start < n {
    // the first match from `start` on, or from the next position when it
    // ends where the piece starts
    let mut found = opt_search_forward(re, b, start)
    if found is Some(_) && last_search_result.val[1] <= start {
      found = if start < n {
        opt_search_forward(re, b, start + 1)
      } else {
        None
      }
    }
    match found {
      Some(pos) => {
        parts.push(utf8_slice(b, start, pos))
        start = last_search_result.val[1]
      }
      None => {
        parts.push(utf8_slice(b, start, n))
        break
      }
    }
  }
  @list.List(parts)
}
