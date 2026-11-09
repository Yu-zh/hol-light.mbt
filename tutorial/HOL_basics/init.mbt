// Tutorial/HOL_basics.ml: the load steps are generated (HOL_basics.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Tutorial/HOL_basics.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Tutorial/HOL_basics")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Tutorial/HOL_basics.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
