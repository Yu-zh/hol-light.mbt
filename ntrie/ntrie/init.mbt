// Ntrie/ntrie.ml: the load steps are generated (ntrie.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Ntrie/ntrie.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Ntrie/ntrie")
  load_steps() catch {
    e => abort("HOL Light: loading Ntrie/ntrie.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
