// Examples/reduct.ml: the load steps are generated (reduct.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/reduct.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @rstc.load()
  @theory.begin_theory("Examples/reduct")
  load_steps() catch {
    e => abort("HOL Light: loading Examples/reduct.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
