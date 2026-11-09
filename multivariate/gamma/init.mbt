// Multivariate/gamma.ml: the load steps are generated (gamma.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/gamma.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @cauchy.load()
  @cauchy.load()
  @theory.begin_theory("Multivariate/gamma")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Multivariate/gamma.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
