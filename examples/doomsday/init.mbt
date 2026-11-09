// Examples/doomsday.ml: the load steps are generated (doomsday.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/doomsday.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Examples/doomsday")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Examples/doomsday.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
