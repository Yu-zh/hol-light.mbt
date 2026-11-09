// 100/cosine.ml: the load steps are generated (cosine.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/cosine.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @transcendentals.load()
  @theory.begin_theory("100/cosine")
  load_steps() catch {
    e => abort("HOL Light: loading 100/cosine.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
