// RichterHilbertAxiomGeometry/readable.ml: the load steps are generated (readable.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load RichterHilbertAxiomGeometry/readable.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("RichterHilbertAxiomGeometry/readable")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading RichterHilbertAxiomGeometry/readable.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
