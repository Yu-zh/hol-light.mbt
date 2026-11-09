// Library/poly.ml: the load steps are generated (poly.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/poly.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @analysis.load()
  @theory.begin_theory("Library/poly")
  load_steps() catch {
    e => abort("HOL Light: loading Library/poly.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
