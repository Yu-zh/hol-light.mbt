// 100/wilson.ml: the load steps are generated (wilson.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/wilson.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @prime.load()
  @pocklington.load()
  @theory.begin_theory("100/wilson")
  load_steps() catch {
    e => abort("HOL Light: loading 100/wilson.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
