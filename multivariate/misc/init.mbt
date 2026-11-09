// Multivariate/misc.ml: the load steps are generated (misc.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/misc.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @card.load()
  @floor.load()
  @theory.begin_theory("Multivariate/misc")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Multivariate/misc.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
