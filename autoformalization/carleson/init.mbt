// Autoformalization/carleson.ml: the load steps are generated (carleson.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Autoformalization/carleson.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @fourier_transform.load()
  @theory.begin_theory("Autoformalization/carleson")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Autoformalization/carleson.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
