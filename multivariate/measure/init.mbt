// Multivariate/measure.ml: the load steps are generated (measure.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/measure.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @integration.load()
  @card.load()
  @permutations.load()
  @integration.load()
  @determinants.load()
  @theory.begin_theory("Multivariate/measure")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Multivariate/measure.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
