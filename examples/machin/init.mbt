// Examples/machin.ml: the load steps are generated (machin.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/machin.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @transc.load()
  @theory.begin_theory("Examples/machin")
  load_steps() catch {
    e => abort("HOL Light: loading Examples/machin.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
