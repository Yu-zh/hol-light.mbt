// Tutorial/Inductive_definitions.ml: the load steps are generated (Inductive_definitions.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Tutorial/Inductive_definitions.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @rstc.load()
  @theory.begin_theory("Tutorial/Inductive_definitions")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Tutorial/Inductive_definitions.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
