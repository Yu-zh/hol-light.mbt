// 100/liouville.ml: the load steps are generated (liouville.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/liouville.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @floor.load()
  @poly.load()
  @theory.begin_theory("100/liouville")
  load_steps() catch {
    e => abort("HOL Light: loading 100/liouville.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
