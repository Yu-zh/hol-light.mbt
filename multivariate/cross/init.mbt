// Multivariate/cross.ml: the load steps are generated (cross.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/cross.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @topology.load()
  @topology.load()
  @theory.begin_theory("Multivariate/cross")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Multivariate/cross.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
