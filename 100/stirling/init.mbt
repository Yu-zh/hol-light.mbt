// 100/stirling.ml: the load steps are generated (stirling.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/stirling.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @analysis.load()
  @transc.load()
  @theory.begin_theory("100/stirling")
  load_steps() catch {
    e => abort("HOL Light: loading 100/stirling.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
