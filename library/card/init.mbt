// Library/card.ml: the load steps are generated (card.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/card.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @wo.load()
  @theory.begin_theory("Library/card")
  load_steps() catch {
    e => abort("HOL Light: loading Library/card.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
