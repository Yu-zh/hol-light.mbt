// 100/pick.ml: the load steps are generated (pick.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/pick.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @polytope.load()
  @measure.load()
  @moretop.load()
  @theory.begin_theory("100/pick")
  load_steps() catch {
    e => abort("HOL Light: loading 100/pick.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
