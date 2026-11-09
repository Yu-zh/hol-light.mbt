// EC/ccsm2.ml: the load steps are generated (ccsm2.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load EC/ccsm2.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @weierstrass.load()
  @excluderoots.load()
  @computegroup.load()
  @theory.begin_theory("EC/ccsm2")
  load_steps() catch {
    e => abort("HOL Light: loading EC/ccsm2.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
