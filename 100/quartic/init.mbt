// 100/quartic.ml: the load steps are generated (quartic.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/quartic.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("100/quartic")
  load_steps() catch {
    e => abort("HOL Light: loading 100/quartic.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
