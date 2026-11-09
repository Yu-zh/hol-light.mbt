// Examples/dickson.ml: the load steps are generated (dickson.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/dickson.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Examples/dickson")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Examples/dickson.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
