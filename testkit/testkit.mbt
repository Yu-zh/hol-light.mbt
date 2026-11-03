// ===========================================================================
// Helpers shared by the differential tests: the same structural printers
// and failure reporting as tools/ocaml_ref/prelude.ml.
// ===========================================================================

///|
using @kernel {type Term, type HolType, type Thm}

///|
/// Structural rendering of a type (`'A` for variables).
pub fn sty(ty : HolType) -> String {
  match ty {
    Tyvar(s) => "'" + s
    Tyapp(s, Empty) => s
    Tyapp(s, args) => s + "(" + args.map(sty).to_array().join(",") + ")"
  }
}

///|
/// Structural rendering of a term with all types.
pub fn stm(tm : Term) -> String {
  match tm {
    Var(s, ty) => s + ":" + sty(ty)
    Const(s, ty) => "#" + s + ":" + sty(ty)
    Comb(f, x) => "(" + stm(f) + " " + stm(x) + ")"
    Abs(v, b) => "(\\" + stm(v) + ". " + stm(b) + ")"
  }
}

///|
/// Structural rendering of a theorem.
pub fn sthm(th : Thm) -> String {
  let (asl, c) = @kernel.dest_thm(th)
  asl.map(stm).to_array().join(", ") + " |- " + stm(c)
}

///|
/// A line-oriented log of results, as upstream's `attempt`.
pub struct Log {
  priv buf : StringBuilder
  priv mut via_stdout : Bool
  priv id : Int32
}

///|
let log_ids : Ref[Int32] = Ref::{ val: 0, }

///|
/// The log that currently captures standard output.
let stdout_owner : Ref[Int32] = Ref::{ val: -1, }

///|
pub fn Log::new() -> Log {
  log_ids.val += 1
  { buf: StringBuilder(), via_stdout: false, id: log_ids.val, }
}

///|
pub fn Log::out(self : Log, s : String) -> Unit {
  if self.via_stdout && stdout_owner.val == self.id {
    // share the stdout channel, so a pending partial line comes first
    @pp.print_string(s + "\n")
  } else {
    self.buf.write_string(s + "\n")
  }
}

///|
/// Record `name = result`, or `name ! msg` for a `Failure`, or
/// `name !! exn` for other errors (named as OCaml prints them).
pub fn Log::attempt(self : Log, name : String, f : () -> String raise) -> Unit {
  let line = try f() catch {
    Failure(msg) => name + " ! " + msg
    @parserutil.Noparse => name + " !! Noparse"
    @lib.Unchanged => name + " !! Unchanged"
    @lib.MatchFailure(_) => name + " !! Match_failure"
    @num.InvalidArgument(m) => name + " !! Invalid_argument(\"" + m + "\")"
    e => name + " !! " + e.to_string()
  } noraise {
    s => name + " = " + s
  }
  self.out(line)
}

///|
pub fn Log::contents(self : Log) -> String {
  if self.via_stdout && stdout_owner.val == self.id {
    @pp.flush_stdout_partial()
  }
  normalize_counters(self.buf.to_string())
}

///|
/// Numbers that only say how many fresh names were made before: invented
/// type variables (`?157053`) and pattern variables (`GEN%PVAR%42`) are
/// renumbered by order of first appearance in `s` (`?1`, `?2`, ...,
/// `GEN%PVAR%1`, ...), so distinct names stay distinct. Parsing allocates
/// them, so their numbers change whenever a quotation is written
/// differently (issue #140), in every file loaded after it; the reference
/// outputs are normalized alike (tools/ocaml_ref/refresh_ref.py).
///
/// A quotation trace (the lines after `... quotations (N):` that start with
/// two spaces) is left as it is: it is the quotations' text, in which `?`
/// and a numeral are no fresh name (`??1 (V 1 === Z)` in sigmacomplete).
pub fn normalize_counters(s : String) -> String {
  let out = StringBuilder()
  let pvar = "GEN%PVAR%".to_array()
  let seen : Map[String, Int32] = Map([])
  let counts : Map[String, Int32] = Map([])
  let mut trace = false
  let lines = s.split("\n").map(l => l.to_owned()).to_array()
  for li, line in lines {
    if li > 0 {
      out.write_char('\n')
    }
    if is_trace_header(line) {
      trace = true
    } else if trace && line.has_prefix("  ") {
      out.write_string(line)
      continue
    } else {
      trace = false
    }
    let cs = line.to_array()
    let mut i = 0
    while i < cs.length() {
      let prefix_len = if cs[i] == '?' {
        1
      } else if i + pvar.length() <= cs.length() &&
        cs[i:i + pvar.length()] == pvar[:] {
        pvar.length()
      } else {
        0
      }
      let j = i + prefix_len
      if prefix_len > 0 && j < cs.length() && cs[j] is ('0'..<='9') {
        let prefix = String::from_array(cs[i:j])
        let mut k = j
        while k < cs.length() && cs[k] is ('0'..<='9') {
          k += 1
        }
        let name = String::from_array(cs[i:k])
        let n = match seen.get(name) {
          Some(n) => n
          None => {
            let n = counts.get(prefix).unwrap_or(0) + 1
            counts[prefix] = n
            seen[name] = n
            n
          }
        }
        out.write_string(prefix + n.to_string())
        i = k
      } else {
        out.write_char(cs[i])
        i += 1
      }
    }
  }
  out.to_string()
}

///|
/// Whether `line` heads a quotation trace: `<file> quotations (<n>):`.
fn is_trace_header(line : String) -> Bool {
  guard line.has_suffix("):") else { return false }
  match line.rev_find(" quotations (") {
    Some(k) => {
      let digits = line[k + " quotations (".length():line.length() - 2]
      digits.length() > 0 && digits.iter().all(c => c is ('0'..<='9'))
    }
    None => false
  }
}

///|
/// Where reports and standard output went before a log first captured
/// them (`release_output` sends them there again).
let saved_report_sink : Ref[((String) -> Unit)?] = Ref::{ val: None, }

///|
let saved_stdout_sink : Ref[((String) -> Unit)?] = Ref::{ val: None, }

///|
/// Send `report`/`warn` output to the log (upstream prints warnings on the
/// same stream as the results).
pub fn Log::capture_reports(self : Log) -> Unit {
  if saved_report_sink.val is None {
    saved_report_sink.val = Some(@lib.report_sink.val)
  }
  @lib.report_sink.val = s => self.out(s)
}

///|
/// Undo `capture_reports` and `capture_stdout`: output goes where it went
/// before any log captured it. A test that loads several files in turn
/// calls this before each load, so that what a file prints while loading is
/// recorded as its own load output, not in the previous file's log.
pub fn release_output() -> Unit {
  if saved_report_sink.val is Some(f) {
    @lib.report_sink.val = f
  }
  if saved_stdout_sink.val is Some(f) {
    @pp.flush_stdout_partial()
    @pp.stdout_sink.val = f
  }
  stdout_owner.val = -1
}

///|
/// The last lines of a generated theory test (the warning that parsing
/// `zz_counter` gives, then `counter_tyvar` and `counter_genvar`), read
/// from the counters without advancing them: for a test that goes on to
/// load more files, whose state must be what a fresh process would have.
pub fn Log::probe_counters(self : Log) -> Unit {
  self.out("Warning: inventing type variables")
  self.out(
    "counter_tyvar = zz_counter:'?" + @preterm.type_var_counter().to_string(),
  )
  self.out(
    "counter_genvar = _" + @basics.genvar_counter().to_string() + ":bool",
  )
}

///|
/// Send complete lines of standard output to the log.
pub fn Log::capture_stdout(self : Log) -> Unit {
  // Load-time output belongs before anything the test prints.
  @pp.flush_stdout_backlog()
  if saved_stdout_sink.val is None {
    saved_stdout_sink.val = Some(@pp.stdout_sink.val)
  }
  @pp.stdout_sink.val = s => self.buf.write_string(s + "\n")
  self.via_stdout = true
  stdout_owner.val = self.id
}

///|
/// OCaml's `String.escaped` on the UTF-8 bytes of `s`.
pub fn ocaml_escaped(s : String) -> String {
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
/// Start recording the quotations parsed (see `@parser.quotation_trace`).
pub fn start_trace() -> Unit {
  @parser.quotation_trace.val = Some([])
}

///|
/// Log the recorded quotations as tools/ocaml_ref/prelude.ml's `show_trace`.
pub fn Log::show_trace(self : Log, name : String) -> Unit {
  let t = @parser.quotation_trace.val.unwrap_or([])
  self.out(name + " quotations (" + t.length().to_string() + "):")
  self.out_quotations(t)
  @parser.quotation_trace.val = None
}

///|
/// The quotations, one a line; one parsed 10000 times or more in a row is
/// shown once, with the count (Autoformalization/fifteen_theorem.ml parses
/// `F` 2.4 million times), as tools/ocaml_ref/prelude.ml's `show_trace`.
fn Log::out_quotations(self : Log, t : Array[String]) -> Unit {
  let mut i = 0
  while i < t.length() {
    let mut j = i + 1
    while j < t.length() && t[j] == t[i] {
      j += 1
    }
    let n = j - i
    if n >= 10000 {
      self.out("  " + ocaml_escaped(t[i]))
      self.out("  (" + (n - 1).to_string() + " more times)")
    } else {
      for _ in 0..<n {
        self.out("  " + ocaml_escaped(t[i]))
      }
    }
    i = j
  }
}

///|
/// Log what theory `name` printed while loading (upstream prints it as the
/// file loads).
pub fn Log::show_theory_output(self : Log, name : String) -> Unit {
  for line in @parser.theory_output(name) {
    self.out(line)
  }
}

///|
/// Log the quotations theory `name` parsed while loading, as
/// tools/ocaml_ref/prelude.ml's `show_trace`.
pub fn Log::show_theory_trace(self : Log, name : String) -> Unit {
  let t = @parser.theory_trace(name)
  self.out(name + " quotations (" + t.length().to_string() + "):")
  self.out_quotations(t)
}

///|
/// Timings vary between runs: `CPU time (user): 0.19` becomes
/// `CPU time (user): <t>` (the reference outputs are normalized alike).
pub fn normalize_times(s : String) -> String {
  let lines = s.split("\n").map(l => l.to_owned()).to_array()
  lines
  .map(l => {
    if l.has_prefix("CPU time (user): ") {
      "CPU time (user): <t>"
    } else {
      l
    }
  })
  .join("\n")
}

///|
/// The axioms upstream's own files assert (class.ml: `ETA_AX`, `SELECT_AX`;
/// nums.ml: `INFINITY_AX`), as `sthm` renders them.
let approved_axioms : Array[String] = [
  (
    #| |- (#forall:fun(fun(fun('A,'B),bool),bool) (\t:fun('A,'B). ((#=:fun(fun('A,'B),fun(fun('A,'B),bool)) (\x:'A. (t:fun('A,'B) x:'A))) t:fun('A,'B))))
  ),
  (
    #| |- (#forall:fun(fun(fun('A,bool),bool),bool) (\P:fun('A,bool). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#==>:fun(bool,fun(bool,bool)) (P:fun('A,bool) x:'A)) (P:fun('A,bool) (#@:fun(fun('A,bool),'A) P:fun('A,bool))))))))
  ),
  (
    #| |- (#?:fun(fun(fun(ind,ind),bool),bool) (\f:fun(ind,ind). ((#/\:fun(bool,fun(bool,bool)) (#ONE_ONE:fun(fun(ind,ind),bool) f:fun(ind,ind))) (#~:fun(bool,bool) (#ONTO:fun(fun(ind,ind),bool) f:fun(ind,ind))))))
  ),
]

///|
/// Fail unless every axiom asserted so far (`@kernel.axioms()`) is one of
/// upstream's three, each at most once. `new_axiom` is unrestricted, as
/// upstream (`mk_thm` and `CHEAT_TAC` go through it), so this is the audit:
/// the load-fidelity tests run it after loading their theory.
pub fn check_axioms() -> Unit raise {
  let seen = []
  for th in @kernel.axioms() {
    let s = sthm(th)
    if !approved_axioms.contains(s) || seen.contains(s) {
      raise Failure("check_axioms: unexpected axiom" + s)
    }
    seen.push(s)
  }
}
