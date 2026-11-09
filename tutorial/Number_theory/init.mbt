// Tutorial/Number_theory.ml: the load steps are generated (Number_theory.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Tutorial/Number_theory.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @prime.load()
  @pocklington.load()
  @binomial.load()
  @theory.begin_theory("Tutorial/Number_theory")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Tutorial/Number_theory.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
