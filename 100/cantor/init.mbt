// 100/cantor.ml: the load steps are generated (cantor.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/cantor.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("100/cantor")
  load_steps() catch {
    e => abort("HOL Light: loading 100/cantor.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
