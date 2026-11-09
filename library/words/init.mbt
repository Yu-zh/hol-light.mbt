// Library/words.ml: the load steps are generated (words.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/words.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @bdd.load()
  @theory.begin_theory("Library/words")
  load_steps() catch {
    e => abort("HOL Light: loading Library/words.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
