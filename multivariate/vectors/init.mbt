// Multivariate/vectors.ml: the load steps are generated (vectors.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/vectors.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @homology.load()
  @matroids.load()
  @misc.load()
  @theory.begin_theory("Multivariate/vectors")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Multivariate/vectors.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
