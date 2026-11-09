// Examples/prog.ml: the load steps are generated (prog.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/prog.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Examples/prog")
  load_steps() catch {
    e => abort("HOL Light: loading Examples/prog.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
