// EC/edwards25519.ml: the load steps are generated (edwards25519.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load EC/edwards25519.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @edwards.load()
  @excluderoots.load()
  @computegroup.load()
  @theory.begin_theory("EC/edwards25519")
  load_steps() catch {
    e => abort("HOL Light: loading EC/edwards25519.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
