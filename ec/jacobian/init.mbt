// EC/jacobian.ml: the load steps are generated (jacobian.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load EC/jacobian.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @weierstrass.load()
  @theory.begin_theory("EC/jacobian")
  load_steps() catch {
    e => abort("HOL Light: loading EC/jacobian.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
