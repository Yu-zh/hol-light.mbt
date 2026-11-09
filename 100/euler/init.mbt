// 100/euler.ml: the load steps are generated (euler.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/euler.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @binary.load()
  @theory.begin_theory("100/euler")
  load_steps() catch {
    e => abort("HOL Light: loading 100/euler.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
