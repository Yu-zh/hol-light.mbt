// Examples/forster.ml: the load steps are generated (forster.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/forster.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Examples/forster")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Examples/forster.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
