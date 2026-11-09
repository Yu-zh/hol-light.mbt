// Examples/vitali.ml: the load steps are generated (vitali.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/vitali.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @realanalysis.load()
  @theory.begin_theory("Examples/vitali")
  load_steps() catch {
    e => abort("HOL Light: loading Examples/vitali.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
