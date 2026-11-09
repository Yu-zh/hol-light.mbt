// Examples/brunn_minkowski.ml: the load steps are generated (brunn_minkowski.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/brunn_minkowski.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @realanalysis.load()
  @theory.begin_theory("Examples/brunn_minkowski")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Examples/brunn_minkowski.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
