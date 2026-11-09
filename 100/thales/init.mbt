// 100/thales.ml: the load steps are generated (thales.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/thales.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @convex.load()
  @sos.load()
  @theory.begin_theory("100/thales")
  load_steps() catch {
    e => abort("HOL Light: loading 100/thales.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
