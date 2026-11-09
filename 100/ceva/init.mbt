// 100/ceva.ml: the load steps are generated (ceva.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/ceva.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @convex.load()
  @sos.load()
  @theory.begin_theory("100/ceva")
  load_steps() catch {
    e => abort("HOL Light: loading 100/ceva.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
