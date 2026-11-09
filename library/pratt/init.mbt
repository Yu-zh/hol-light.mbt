// Library/pratt.ml: the load steps are generated (pratt.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/pratt.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @prime.load()
  @theory.begin_theory("Library/pratt")
  load_steps() catch {
    e => abort("HOL Light: loading Library/pratt.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
