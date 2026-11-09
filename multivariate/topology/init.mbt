// Multivariate/topology.ml: the load steps are generated (topology.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/topology.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @determinants.load()
  @card.load()
  @iter.load()
  @metric.load()
  @determinants.load()
  @theory.begin_theory("Multivariate/topology")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Multivariate/topology.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
