// 100/pnt.ml: the load steps are generated (pnt.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/pnt.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @cauchy.load()
  @pocklington.load()
  @mangoldt.load()
  @theory.begin_theory("100/pnt")
  load_steps() catch {
    e => abort("HOL Light: loading 100/pnt.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
