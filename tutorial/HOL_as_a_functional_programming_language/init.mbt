// Tutorial/HOL_as_a_functional_programming_language.ml: the load steps are generated (HOL_as_a_functional_programming_language.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Tutorial/HOL_as_a_functional_programming_language.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Tutorial/HOL_as_a_functional_programming_language")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Tutorial/HOL_as_a_functional_programming_language.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
