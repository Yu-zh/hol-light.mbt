// Examples/misiurewicz.ml: the load steps are generated (misiurewicz.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/misiurewicz.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @cauchy.load()
  @theory.begin_theory("Examples/misiurewicz")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Examples/misiurewicz.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
