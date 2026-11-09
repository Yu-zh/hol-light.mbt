// Examples/cong.ml: the load steps are generated (cong.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/cong.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Examples/cong")
  load_steps() catch {
    e => abort("HOL Light: loading Examples/cong.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
