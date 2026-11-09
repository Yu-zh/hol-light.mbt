// 100/cubic.ml: the load steps are generated (cubic.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/cubic.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @complex_transc.load()
  @theory.begin_theory("100/cubic")
  load_steps() catch {
    e => abort("HOL Light: loading 100/cubic.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
