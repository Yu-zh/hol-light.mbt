// Library/jacobi.ml: the load steps are generated (jacobi.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/jacobi.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @primitive.load()
  @theory.begin_theory("Library/jacobi")
  load_steps() catch {
    e => abort("HOL Light: loading Library/jacobi.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
