// Multivariate/paths.ml: the load steps are generated (paths.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/paths.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @convex.load()
  @homology.load()
  @convex.load()
  @theory.begin_theory("Multivariate/paths")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Multivariate/paths.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
