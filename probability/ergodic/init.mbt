// Probability/ergodic.ml: the load steps are generated (ergodic.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Probability/ergodic.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @clt.load()
  @clt.load()
  @theory.begin_theory("Probability/ergodic")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Probability/ergodic.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Probability/ergodic.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @clt.load()
  @theory.begin_theory("Probability/ergodic")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Probability/ergodic.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
