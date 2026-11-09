// Tutorial/Propositional_logic.ml: the load steps are generated (Propositional_logic.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Tutorial/Propositional_logic.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Tutorial/Propositional_logic")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Tutorial/Propositional_logic.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
