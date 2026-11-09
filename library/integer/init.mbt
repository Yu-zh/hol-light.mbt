// Library/integer.ml: the load steps are generated (integer.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/integer.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Library/integer")
  load_steps() catch {
    e => abort("HOL Light: loading Library/integer.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
