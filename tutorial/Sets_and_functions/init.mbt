// Tutorial/Sets_and_functions.ml: the load steps are generated (Sets_and_functions.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Tutorial/Sets_and_functions.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Tutorial/Sets_and_functions")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Tutorial/Sets_and_functions.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
