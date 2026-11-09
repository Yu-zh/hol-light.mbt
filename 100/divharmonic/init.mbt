// 100/divharmonic.ml: the load steps are generated (divharmonic.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/divharmonic.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @analysis.load()
  @transc.load()
  @theory.begin_theory("100/divharmonic")
  load_steps() catch {
    e => abort("HOL Light: loading 100/divharmonic.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
