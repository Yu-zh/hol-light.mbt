// EC/nistp224.ml: the load steps are generated (nistp224.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load EC/nistp224.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @weierstrass.load()
  @excluderoots.load()
  @computegroup.load()
  @theory.begin_theory("EC/nistp224")
  load_steps() catch {
    e => abort("HOL Light: loading EC/nistp224.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
