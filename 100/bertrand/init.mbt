// 100/bertrand.ml: the load steps are generated (bertrand.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/bertrand.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @prime.load()
  @pocklington.load()
  @analysis.load()
  @transc.load()
  @calc_real.load()
  @floor.load()
  @theory.begin_theory("100/bertrand")
  load_steps() catch {
    e => abort("HOL Light: loading 100/bertrand.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
