// RichterHilbertAxiomGeometry/UniversalPropCartProd.ml: the load steps are generated (UniversalPropCartProd.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load RichterHilbertAxiomGeometry/UniversalPropCartProd.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @readable.load()
  @theory.begin_theory("RichterHilbertAxiomGeometry/UniversalPropCartProd")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading RichterHilbertAxiomGeometry/UniversalPropCartProd.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
