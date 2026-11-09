// 100/primerecip.ml: the load steps are generated (primerecip.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/primerecip.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @bertrand.load()
  @divharmonic.load()
  @theory.begin_theory("100/primerecip")
  load_steps() catch {
    e => abort("HOL Light: loading 100/primerecip.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
