// 100/polyhedron.ml: the load steps are generated (polyhedron.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/polyhedron.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @polytope.load()
  @binomial.load()
  @inclusion_exclusion.load()
  @combinations.load()
  @theory.begin_theory("100/polyhedron")
  load_steps() catch {
    e => abort("HOL Light: loading 100/polyhedron.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
