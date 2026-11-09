// Library/bitsize.ml: the load steps are generated (bitsize.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/bitsize.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Library/bitsize")
  load_steps() catch {
    e => abort("HOL Light: loading Library/bitsize.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
