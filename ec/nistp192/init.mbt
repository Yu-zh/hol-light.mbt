// EC/nistp192.ml: the load steps are generated (nistp192.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load EC/nistp192.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @weierstrass.load()
  @excluderoots.load()
  @computegroup.load()
  @theory.begin_theory("EC/nistp192")
  load_steps() catch {
    e => abort("HOL Light: loading EC/nistp192.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
