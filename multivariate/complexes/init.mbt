// Multivariate/complexes.ml: the load steps are generated (complexes.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/complexes.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @measure.load()
  @convex.load()
  @theory.begin_theory("Multivariate/complexes")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Multivariate/complexes.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
