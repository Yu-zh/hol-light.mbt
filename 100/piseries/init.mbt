// 100/piseries.ml: the load steps are generated (piseries.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/piseries.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @analysis.load()
  @transc.load()
  @floor.load()
  @poly.load()
  @machin.load()
  @iter.load()
  @theory.begin_theory("100/piseries")
  load_steps() catch {
    e => abort("HOL Light: loading 100/piseries.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
