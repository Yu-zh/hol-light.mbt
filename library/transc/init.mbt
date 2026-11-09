// Library/transc.ml: the load steps are generated (transc.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/transc.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @analysis.load()
  @theory.begin_theory("Library/transc")
  load_steps() catch {
    e => abort("HOL Light: loading Library/transc.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
