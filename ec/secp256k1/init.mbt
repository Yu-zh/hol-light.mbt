// EC/secp256k1.ml: the load steps are generated (secp256k1.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load EC/secp256k1.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @weierstrass.load()
  @excluderoots.load()
  @computegroup.load()
  @theory.begin_theory("EC/secp256k1")
  load_steps() catch {
    e => abort("HOL Light: loading EC/secp256k1.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
