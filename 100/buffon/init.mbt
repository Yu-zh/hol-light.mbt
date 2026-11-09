// 100/buffon.ml: the load steps are generated (buffon.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/buffon.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @probability_measure.load_alone()
  @random_variables.load_alone()
  @independence.load_alone()
  @expectation.load_alone()
  @theory.begin_theory("100/buffon")
  load_steps() catch {
    e => abort("HOL Light: loading 100/buffon.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
