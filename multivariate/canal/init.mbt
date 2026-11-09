// Multivariate/canal.ml: the load steps are generated (canal.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/canal.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @complexes.load()
  @floor.load()
  @iter.load()
  @integration.load()
  @complexes.load()
  @theory.begin_theory("Multivariate/canal")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Multivariate/canal.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
