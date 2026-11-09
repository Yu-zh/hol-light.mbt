// Examples/sylvester_gallai.ml: the load steps are generated (sylvester_gallai.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/sylvester_gallai.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @convex.load()
  @theory.begin_theory("Examples/sylvester_gallai")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Examples/sylvester_gallai.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
