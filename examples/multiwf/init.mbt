// Examples/multiwf.ml: the load steps are generated (multiwf.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/multiwf.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Examples/multiwf")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Examples/multiwf.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
