// Tutorial/Tactics_and_tacticals.ml: the load steps are generated (Tactics_and_tacticals.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Tutorial/Tactics_and_tacticals.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Tutorial/Tactics_and_tacticals")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Tutorial/Tactics_and_tacticals.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
