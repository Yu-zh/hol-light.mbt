// EC/weierstrass.ml: the load steps are generated (weierstrass.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load EC/weierstrass.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @misc.load()
  @theory.begin_theory("EC/weierstrass")
  load_steps() catch {
    e => abort("HOL Light: loading EC/weierstrass.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
