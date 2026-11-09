// EC/montwe.ml: the load steps are generated (montwe.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load EC/montwe.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @montgomery.load()
  @weierstrass.load()
  @theory.begin_theory("EC/montwe")
  load_steps() catch {
    e => abort("HOL Light: loading EC/montwe.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
