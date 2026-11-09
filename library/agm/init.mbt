// Library/agm.ml: the load steps are generated (agm.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/agm.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @products.load()
  @theory.begin_theory("Library/agm")
  load_steps() catch {
    e => abort("HOL Light: loading Library/agm.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
