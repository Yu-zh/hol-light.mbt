// 100/platonic.ml: the load steps are generated (platonic.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/platonic.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @polyhedron.load()
  @cross.load()
  @theory.begin_theory("100/platonic")
  load_steps() catch {
    e => abort("HOL Light: loading 100/platonic.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
