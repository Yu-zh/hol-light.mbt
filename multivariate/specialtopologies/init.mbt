// Multivariate/specialtopologies.ml: the load steps are generated (specialtopologies.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/specialtopologies.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @metric.load()
  @metric.load()
  @theory.begin_theory("Multivariate/specialtopologies")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Multivariate/specialtopologies.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
