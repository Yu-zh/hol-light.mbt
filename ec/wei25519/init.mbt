// EC/wei25519.ml: the load steps are generated (wei25519.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load EC/wei25519.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @weierstrass.load()
  @excluderoots.load()
  @computegroup.load()
  @theory.begin_theory("EC/wei25519")
  load_steps() catch {
    e => abort("HOL Light: loading EC/wei25519.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
