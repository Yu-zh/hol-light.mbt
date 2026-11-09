// Library/q.ml: the load steps are generated (q.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/q.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Library/q")
  load_steps() catch {
    e => abort("HOL Light: loading Library/q.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
