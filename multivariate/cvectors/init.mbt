// Multivariate/cvectors.ml: the load steps are generated (cvectors.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/cvectors.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @complexes.load()
  @complexes.load()
  @cross.load()
  @theory.begin_theory("Multivariate/cvectors")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Multivariate/cvectors.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
