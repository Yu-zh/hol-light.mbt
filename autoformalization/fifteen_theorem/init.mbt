// Autoformalization/fifteen_theorem.ml: the load steps are generated (fifteen_theorem.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Autoformalization/fifteen_theorem.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @isum.load()
  @three_squares.load()
  @theory.begin_theory("Autoformalization/fifteen_theorem")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Autoformalization/fifteen_theorem.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
