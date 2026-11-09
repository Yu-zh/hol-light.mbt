// 100/desargues.ml: the load steps are generated (desargues.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/desargues.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @cross.load()
  @theory.begin_theory("100/desargues")
  load_steps() catch {
    e => abort("HOL Light: loading 100/desargues.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
