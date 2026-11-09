// Multivariate/determinants.ml: the load steps are generated (determinants.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/determinants.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @vectors.load()
  @vectors.load()
  @permutations.load()
  @floor.load()
  @products.load()
  @theory.begin_theory("Multivariate/determinants")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Multivariate/determinants.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
