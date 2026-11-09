// Examples/kb.ml: the load steps are generated (kb.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/kb.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Examples/kb")
  load_steps() catch {
    e => abort("HOL Light: loading Examples/kb.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
