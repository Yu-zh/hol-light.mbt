// Probability/measure.ml: the load steps are generated (probability_measure.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Probability/measure.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @inclusion_exclusion.load()
  @card.load()
  @realanalysis.load()
  @fourier.load()
  @inclusion_exclusion.load()
  @card.load()
  @realanalysis.load()
  @theory.begin_theory("Probability/measure")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Probability/measure.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Probability/measure.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @inclusion_exclusion.load()
  @card.load()
  @realanalysis.load()
  @theory.begin_theory("Probability/measure")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Probability/measure.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
