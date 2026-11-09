// 100/leibniz.ml: the load steps are generated (leibniz.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/leibniz.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @transc.load()
  @theory.begin_theory("100/leibniz")
  load_steps() catch {
    e => abort("HOL Light: loading 100/leibniz.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
