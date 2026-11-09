// 100/pascal.ml: the load steps are generated (pascal.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/pascal.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @cross.load()
  @theory.begin_theory("100/pascal")
  load_steps() catch {
    e => abort("HOL Light: loading 100/pascal.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
