// 100/reciprocity.ml: the load steps are generated (reciprocity.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/reciprocity.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @prime.load()
  @pocklington.load()
  @products.load()
  @theory.begin_theory("100/reciprocity")
  load_steps() catch {
    e => abort("HOL Light: loading 100/reciprocity.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
