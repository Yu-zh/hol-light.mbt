// Tutorial/Semantics_of_programming_languages_deep.ml: the load steps are generated (Semantics_of_programming_languages_deep.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Tutorial/Semantics_of_programming_languages_deep.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Tutorial/Semantics_of_programming_languages_deep")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Tutorial/Semantics_of_programming_languages_deep.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
