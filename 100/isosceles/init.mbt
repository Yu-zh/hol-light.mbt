// 100/isosceles.ml: the load steps are generated (isosceles.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/isosceles.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @geom.load()
  @theory.begin_theory("100/isosceles")
  load_steps() catch {
    e => abort("HOL Light: loading 100/isosceles.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
