// Tutorial/Semantics_of_programming_languages_shallow.ml: the load steps are generated (Semantics_of_programming_languages_shallow.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Tutorial/Semantics_of_programming_languages_shallow.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @prime.load()
  @theory.begin_theory("Tutorial/Semantics_of_programming_languages_shallow")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Tutorial/Semantics_of_programming_languages_shallow.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
