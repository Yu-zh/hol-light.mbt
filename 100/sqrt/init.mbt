// 100/sqrt.ml: the load steps are generated (sqrt.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/sqrt.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @prime.load()
  @floor.load()
  @theory.begin_theory("100/sqrt")
  load_steps() catch {
    e => abort("HOL Light: loading 100/sqrt.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
