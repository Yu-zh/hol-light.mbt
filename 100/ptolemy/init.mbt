// 100/ptolemy.ml: the load steps are generated (ptolemy.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/ptolemy.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @transcendentals.load()
  @theory.begin_theory("100/ptolemy")
  load_steps() catch {
    e => abort("HOL Light: loading 100/ptolemy.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
