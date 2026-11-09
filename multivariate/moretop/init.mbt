// Multivariate/moretop.ml: the load steps are generated (moretop.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/moretop.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @realanalysis.load()
  @realanalysis.load()
  @theory.begin_theory("Multivariate/moretop")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Multivariate/moretop.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
