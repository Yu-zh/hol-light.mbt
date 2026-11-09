// Examples/mccarthy.ml: the load steps are generated (mccarthy.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/mccarthy.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Examples/mccarthy")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Examples/mccarthy.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
