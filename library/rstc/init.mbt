// Library/rstc.ml: the load steps are generated (rstc.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/rstc.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Library/rstc")
  load_steps() catch {
    e => abort("HOL Light: loading Library/rstc.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
