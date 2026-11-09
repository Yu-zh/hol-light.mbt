// Examples/mangoldt.ml: the load steps are generated (mangoldt.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/mangoldt.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @pocklington.load()
  @transcendentals.load()
  @theory.begin_theory("Examples/mangoldt")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Examples/mangoldt.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
