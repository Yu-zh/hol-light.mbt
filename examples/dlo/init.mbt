// Examples/dlo.ml: the load steps are generated (dlo.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/dlo.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Examples/dlo")
  load_steps() catch {
    e => abort("HOL Light: loading Examples/dlo.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
