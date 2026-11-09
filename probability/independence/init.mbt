// Probability/independence.ml: the load steps are generated (independence.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Probability/independence.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @random_variables.load()
  @random_variables.load()
  @theory.begin_theory("Probability/independence")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Probability/independence.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Probability/independence.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @random_variables.load()
  @theory.begin_theory("Probability/independence")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Probability/independence.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
