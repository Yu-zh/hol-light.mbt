// Probability/distributions.ml: the load steps are generated (distributions.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Probability/distributions.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @ergodic.load()
  @clt.load()
  @theory.begin_theory("Probability/distributions")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Probability/distributions.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Probability/distributions.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @clt.load()
  @theory.begin_theory("Probability/distributions")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Probability/distributions.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
