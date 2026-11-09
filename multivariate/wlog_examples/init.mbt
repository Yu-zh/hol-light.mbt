// Multivariate/wlog_examples.ml: the load steps are generated (wlog_examples.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/wlog_examples.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @convex.load()
  @wlog.load()
  @theory.begin_theory("Multivariate/wlog_examples")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Multivariate/wlog_examples.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
