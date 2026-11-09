// Library/bdd.ml: the load steps are generated (bdd.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/bdd.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Library/bdd")
  load_steps() catch {
    e => abort("HOL Light: loading Library/bdd.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
