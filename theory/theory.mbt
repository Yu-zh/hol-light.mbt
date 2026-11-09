// ===========================================================================
// Loading theories: the quotations each one reads and the lines it prints,
// for the tests that compare them with upstream's.
// ===========================================================================

///|
/// When set, every quotation read is recorded (see `record_quotation`), so
/// tests can compare the order in which a theory
/// parses its quotations with upstream.
pub let quotation_trace : Ref[Array[String]?] = Ref::{ val: None, }

///|
let theory_traces : Map[String, Array[String]] = Map([])

///|
/// The theories being loaded, innermost last, with where each one's output
/// starts: a file may load another part-way through
/// (Autoformalization/planar_graph.ml loads Multivariate/cauchy.ml after
/// 12K lines).
let loading_theories : Array[(String, Int)] = []

///|
/// Called by a theory's `load` before its steps: the quotations it parses
/// are recorded under `name` (see `theory_trace`), and under the theories
/// it is loaded inside of, as upstream's trace of such a file has them.
pub fn begin_theory(name : String) -> Unit {
  theory_traces[name] = []
  // Theories load in `fn init`, where wasm cannot write to stdout yet.
  @pp.defer_stdout.val = true
  loading_theories.push((name, @pp.stdout_backlog_length()))
}

///|
/// Whether theory `name` is loading (innermost or not): the quotations read now
/// go into its trace.
pub fn is_loading(name : String) -> Bool {
  loading_theories.iter().any(th => th.0 == name)
}

///|
pub fn end_theory() -> Unit {
  // OCaml's toplevel flushes the formatter after each phrase: what the
  // file's last phrase printed (Jordan/real_ext_geom_series.ml ends with
  // `pop_priority()`) is the file's output
  @pp.std_formatter.print_flush()
  match loading_theories.pop() {
    Some((name, start)) =>
      theory_outputs[name] = @pp.stdout_backlog_since(start)
    None => ()
  }
  if loading_theories.is_empty() {
    @pp.defer_stdout.val = false
  }
}

///|
let theory_outputs : Map[String, Array[String]] = Map([])

///|
/// The lines theory `name` printed on stdout while loading.
pub fn theory_output(name : String) -> Array[String] {
  theory_outputs.get(name).unwrap_or([])
}

///|
/// The quotations parsed while loading theory `name`, in order.
pub fn theory_trace(name : String) -> Array[String] {
  theory_traces.get(name).unwrap_or([])
}

///|
/// Record `s` in the quotation traces: each front end of terms calls it
/// with what it reads (types prefixed with `:`).
pub fn record_quotation(s : String) -> Unit {
  match quotation_trace.val {
    Some(t) => t.push(s)
    None => ()
  }
  for th in loading_theories {
    match theory_traces.get(th.0) {
      Some(t) => t.push(s)
      None => ()
    }
  }
}
