// Tutorial/Wellfounded_induction.ml: the load steps are generated (Wellfounded_induction.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Tutorial/Wellfounded_induction.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Tutorial/Wellfounded_induction")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Tutorial/Wellfounded_induction.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
