// Examples/pell.ml: the load steps are generated (pell.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/pell.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @analysis.load()
  @transc.load()
  @prime.load()
  @theory.begin_theory("Examples/pell")
  load_steps() catch {
    e => abort("HOL Light: loading Examples/pell.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
