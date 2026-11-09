// 100/lagrange.ml: the load steps are generated (lagrange.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/lagrange.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @prime.load()
  @theory.begin_theory("100/lagrange")
  load_steps() catch {
    e => abort("HOL Light: loading 100/lagrange.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
