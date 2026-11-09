// Probability/characteristic_functions.ml: the load steps are generated (characteristic_functions.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Probability/characteristic_functions.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @martingale_convergence.load()
  @fourier.load()
  @martingale_convergence.load()
  @theory.begin_theory("Probability/characteristic_functions")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Probability/characteristic_functions.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Probability/characteristic_functions.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @fourier.load()
  @martingale_convergence.load()
  @theory.begin_theory("Probability/characteristic_functions")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Probability/characteristic_functions.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
