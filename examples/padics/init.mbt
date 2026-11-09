// Examples/padics.ml: the load steps are generated (padics.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/padics.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @prime.load()
  @metric.load()
  @theory.begin_theory("Examples/padics")
  load_steps() catch {
    e => abort("HOL Light: loading Examples/padics.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
