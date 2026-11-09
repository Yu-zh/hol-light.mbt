// Examples/digit_serial_methods.ml: the load steps are generated (digit_serial_methods.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/digit_serial_methods.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @realanalysis.load()
  @theory.begin_theory("Examples/digit_serial_methods")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Examples/digit_serial_methods.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
