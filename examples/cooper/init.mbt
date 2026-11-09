// Examples/cooper.ml: the load steps are generated (cooper.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/cooper.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Examples/cooper")
  load_steps() catch {
    e => abort("HOL Light: loading Examples/cooper.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
