// Examples/complexpolygon.ml: the load steps are generated (complexpolygon.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/complexpolygon.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @transcendentals.load()
  @theory.begin_theory("Examples/complexpolygon")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Examples/complexpolygon.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
