// Examples/sos.ml: the load steps are generated (sos.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/sos.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Examples/sos")
  load_steps() catch {
    e => abort("HOL Light: loading Examples/sos.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
