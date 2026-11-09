// Probability/random_variables.ml: the load steps are generated (random_variables.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Probability/random_variables.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @probability_measure.load()
  @probability_measure.load()
  @theory.begin_theory("Probability/random_variables")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Probability/random_variables.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Probability/random_variables.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @probability_measure.load()
  @theory.begin_theory("Probability/random_variables")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Probability/random_variables.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
