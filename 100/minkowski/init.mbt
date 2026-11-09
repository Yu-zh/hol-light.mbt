// 100/minkowski.ml: the load steps are generated (minkowski.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/minkowski.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @measure.load()
  @theory.begin_theory("100/minkowski")
  load_steps() catch {
    e => abort("HOL Light: loading 100/minkowski.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
