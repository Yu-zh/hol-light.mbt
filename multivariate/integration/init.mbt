// Multivariate/integration.ml: the load steps are generated (integration.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/integration.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @clifford.load()
  @products.load()
  @floor.load()
  @derivatives.load()
  @theory.begin_theory("Multivariate/integration")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Multivariate/integration.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
