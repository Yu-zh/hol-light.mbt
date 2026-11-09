// Multivariate/realanalysis.ml: the load steps are generated (realanalysis.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/realanalysis.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @transcendentals.load()
  @binomial.load()
  @polytope.load()
  @measure.load()
  @transcendentals.load()
  @theory.begin_theory("Multivariate/realanalysis")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Multivariate/realanalysis.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
