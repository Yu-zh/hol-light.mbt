// Examples/gcdrecurrence.ml: the load steps are generated (gcdrecurrence.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/gcdrecurrence.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @prime.load()
  @integer.load()
  @theory.begin_theory("Examples/gcdrecurrence")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Examples/gcdrecurrence.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
