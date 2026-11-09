// 100/heron.ml: the load steps are generated (heron.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/heron.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @measure.load()
  @theory.begin_theory("100/heron")
  load_steps() catch {
    e => abort("HOL Light: loading 100/heron.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
