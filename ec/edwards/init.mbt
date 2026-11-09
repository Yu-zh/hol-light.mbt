// EC/edwards.ml: the load steps are generated (edwards.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load EC/edwards.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @misc.load()
  @theory.begin_theory("EC/edwards")
  load_steps() catch {
    e => abort("HOL Light: loading EC/edwards.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
