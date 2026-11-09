// 100/feuerbach.ml: the load steps are generated (feuerbach.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/feuerbach.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @convex.load()
  @theory.begin_theory("100/feuerbach")
  load_steps() catch {
    e => abort("HOL Light: loading 100/feuerbach.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
