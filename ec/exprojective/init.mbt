// EC/exprojective.ml: the load steps are generated (exprojective.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load EC/exprojective.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @edwards.load()
  @theory.begin_theory("EC/exprojective")
  load_steps() catch {
    e => abort("HOL Light: loading EC/exprojective.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
