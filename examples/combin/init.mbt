// Examples/combin.ml: the load steps are generated (combin.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/combin.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @reduct.load()
  @theory.begin_theory("Examples/combin")
  load_steps() catch {
    e => abort("HOL Light: loading Examples/combin.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
