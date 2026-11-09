// EC/nistp521.ml: the load steps are generated (nistp521.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load EC/nistp521.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @weierstrass.load()
  @excluderoots.load()
  @computegroup.load()
  @theory.begin_theory("EC/nistp521")
  load_steps() catch {
    e => abort("HOL Light: loading EC/nistp521.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
