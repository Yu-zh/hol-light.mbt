// 100/descartes.ml: the load steps are generated (descartes.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/descartes.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @realanalysis.load()
  @theory.begin_theory("100/descartes")
  load_steps() catch {
    e => abort("HOL Light: loading 100/descartes.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
