// 100/dirichlet.ml: the load steps are generated (dirichlet.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/dirichlet.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @products.load()
  @agm.load()
  @transcendentals.load()
  @pocklington.load()
  @multiplicative.load()
  @mangoldt.load()
  @theory.begin_theory("100/dirichlet")
  load_steps() catch {
    e => abort("HOL Light: loading 100/dirichlet.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
