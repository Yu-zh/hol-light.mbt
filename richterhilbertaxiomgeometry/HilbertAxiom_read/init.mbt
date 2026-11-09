// RichterHilbertAxiomGeometry/HilbertAxiom_read.ml: the load steps are generated (HilbertAxiom_read.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load RichterHilbertAxiomGeometry/HilbertAxiom_read.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @readable.load()
  @theory.begin_theory("RichterHilbertAxiomGeometry/HilbertAxiom_read")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading RichterHilbertAxiomGeometry/HilbertAxiom_read.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
