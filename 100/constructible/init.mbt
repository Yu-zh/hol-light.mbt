// 100/constructible.ml: the load steps are generated (constructible.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/constructible.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @prime.load()
  @floor.load()
  @transcendentals.load()
  @theory.begin_theory("100/constructible")
  load_steps() catch {
    e =>
      abort("HOL Light: loading 100/constructible.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
