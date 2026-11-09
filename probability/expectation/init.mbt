// Probability/expectation.ml: the load steps are generated (expectation.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Probability/expectation.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @independence.load()
  @independence.load()
  @theory.begin_theory("Probability/expectation")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Probability/expectation.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Probability/expectation.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @independence.load()
  @theory.begin_theory("Probability/expectation")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Probability/expectation.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
