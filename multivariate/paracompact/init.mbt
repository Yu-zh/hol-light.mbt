// Multivariate/paracompact.ml: the load steps are generated (paracompact.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/paracompact.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @metric.load()
  @metric.load()
  @theory.begin_theory("Multivariate/paracompact")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Multivariate/paracompact.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
