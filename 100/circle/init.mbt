// 100/circle.ml: the load steps are generated (circle.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/circle.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @measure.load()
  @realanalysis.load()
  @theory.begin_theory("100/circle")
  load_steps() catch {
    e => abort("HOL Light: loading 100/circle.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
