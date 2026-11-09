// Tutorial/Recursive_definitions.ml: the load steps are generated (Recursive_definitions.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Tutorial/Recursive_definitions.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Tutorial/Recursive_definitions")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Tutorial/Recursive_definitions.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
