// 100/lhopital.ml: the load steps are generated (lhopital.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/lhopital.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @analysis.load()
  @theory.begin_theory("100/lhopital")
  load_steps() catch {
    e => abort("HOL Light: loading 100/lhopital.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
