// EC/family25519.ml: the load steps are generated (family25519.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load EC/family25519.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @edmont.load()
  @montwe.load()
  @edwards25519.load()
  @curve25519.load()
  @wei25519.load()
  @theory.begin_theory("EC/family25519")
  load_steps() catch {
    e => abort("HOL Light: loading EC/family25519.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
