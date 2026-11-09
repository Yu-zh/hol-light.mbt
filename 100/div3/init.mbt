// 100/div3.ml: the load steps are generated (div3.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/div3.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @prime.load()
  @pocklington.load()
  @theory.begin_theory("100/div3")
  load_steps() catch {
    e => abort("HOL Light: loading 100/div3.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
