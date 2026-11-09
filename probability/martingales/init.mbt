// Probability/martingales.ml: the load steps are generated (martingales.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Probability/martingales.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @expectation.load()
  @expectation.load()
  @theory.begin_theory("Probability/martingales")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Probability/martingales.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Probability/martingales.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @expectation.load()
  @theory.begin_theory("Probability/martingales")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Probability/martingales.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
