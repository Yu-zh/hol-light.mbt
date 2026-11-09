// Examples/bondy.ml: the load steps are generated (bondy.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/bondy.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Examples/bondy")
  load_steps() catch {
    e => abort("HOL Light: loading Examples/bondy.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
