// Multivariate/derivatives.ml: the load steps are generated (derivatives.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/derivatives.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @degree.load()
  @degree.load()
  @theory.begin_theory("Multivariate/derivatives")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Multivariate/derivatives.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
