// Examples/ste.ml: the load steps are generated (ste.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/ste.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Examples/ste")
  load_steps() catch {
    e => abort("HOL Light: loading Examples/ste.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
