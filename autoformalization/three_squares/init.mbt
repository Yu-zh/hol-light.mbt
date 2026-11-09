// Autoformalization/three_squares.ml: the load steps are generated (three_squares.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Autoformalization/three_squares.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @jacobi.load()
  @dirichlet.load()
  @theory.begin_theory("Autoformalization/three_squares")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Autoformalization/three_squares.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
