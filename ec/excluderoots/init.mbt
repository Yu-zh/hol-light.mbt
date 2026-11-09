// EC/excluderoots.ml: the load steps are generated (excluderoots.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load EC/excluderoots.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @pocklington.load()
  @theory.begin_theory("EC/excluderoots")
  load_steps() catch {
    e => abort("HOL Light: loading EC/excluderoots.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
