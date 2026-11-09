// 100/two_squares.ml: the load steps are generated (two_squares.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/two_squares.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @prime.load()
  @theory.begin_theory("100/two_squares")
  load_steps() catch {
    e => abort("HOL Light: loading 100/two_squares.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
