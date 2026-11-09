// 100/arithmetic.ml: the load steps are generated (arithmetic.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/arithmetic.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("100/arithmetic")
  load_steps() catch {
    e => abort("HOL Light: loading 100/arithmetic.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
