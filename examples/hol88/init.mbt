// Examples/hol88.ml: the load steps are generated (hol88.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/hol88.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Examples/hol88")
  load_steps() catch {
    e => abort("HOL Light: loading Examples/hol88.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
