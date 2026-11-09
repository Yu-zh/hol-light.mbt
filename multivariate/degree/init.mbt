// Multivariate/degree.ml: the load steps are generated (degree.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/degree.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @polytope.load()
  @homology.load()
  @polytope.load()
  @theory.begin_theory("Multivariate/degree")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Multivariate/degree.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
