// EC/projective.ml: the load steps are generated (projective.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load EC/projective.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @weierstrass.load()
  @theory.begin_theory("EC/projective")
  load_steps() catch {
    e => abort("HOL Light: loading EC/projective.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
