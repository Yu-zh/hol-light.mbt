// Tutorial/Inductive_datatypes.ml: the load steps are generated (Inductive_datatypes.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Tutorial/Inductive_datatypes.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Tutorial/Inductive_datatypes")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Tutorial/Inductive_datatypes.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
