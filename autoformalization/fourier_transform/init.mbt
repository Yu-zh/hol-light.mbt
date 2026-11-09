// Autoformalization/fourier_transform.ml: the load steps are generated (fourier_transform.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Autoformalization/fourier_transform.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @fourier.load()
  @theory.begin_theory("Autoformalization/fourier_transform")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Autoformalization/fourier_transform.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
