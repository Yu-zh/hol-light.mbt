// RichterHilbertAxiomGeometry/TarskiAxiomGeometry_read.ml: the load steps are generated (TarskiAxiomGeometry_read.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load RichterHilbertAxiomGeometry/TarskiAxiomGeometry_read.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @readable.load()
  @theory.begin_theory("RichterHilbertAxiomGeometry/TarskiAxiomGeometry_read")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading RichterHilbertAxiomGeometry/TarskiAxiomGeometry_read.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
