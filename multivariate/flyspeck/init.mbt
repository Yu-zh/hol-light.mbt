// Multivariate/flyspeck.ml: the load steps are generated (flyspeck.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/flyspeck.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @realanalysis.load()
  @polytope.load()
  @realanalysis.load()
  @geom.load()
  @cross.load()
  @theory.begin_theory("Multivariate/flyspeck")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Multivariate/flyspeck.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
