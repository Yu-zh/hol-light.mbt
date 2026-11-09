// 100/green.ml: the load steps are generated (green.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/green.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @cauchy.load()
  @lpspaces.load()
  @theory.begin_theory("100/green")
  load_steps() catch {
    e => abort("HOL Light: loading 100/green.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
