// EC/montgomery.ml: the load steps are generated (montgomery.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load EC/montgomery.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @misc.load()
  @theory.begin_theory("EC/montgomery")
  load_steps() catch {
    e => abort("HOL Light: loading EC/montgomery.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
