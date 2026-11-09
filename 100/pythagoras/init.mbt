// 100/pythagoras.ml: the load steps are generated (pythagoras.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/pythagoras.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @misc.load()
  @vectors.load()
  @theory.begin_theory("100/pythagoras")
  load_steps() catch {
    e => abort("HOL Light: loading 100/pythagoras.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
