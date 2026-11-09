// Multivariate/polytope.ml: the load steps are generated (polytope.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/polytope.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @paths.load()
  @paths.load()
  @theory.begin_theory("Multivariate/polytope")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Multivariate/polytope.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
