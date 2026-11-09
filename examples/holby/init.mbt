// Examples/holby.ml: the load steps are generated (holby.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/holby.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Examples/holby")
  load_steps() catch {
    e => abort("HOL Light: loading Examples/holby.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
