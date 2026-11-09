// RichterHilbertAxiomGeometry/Topology.ml: the load steps are generated (Topology.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load RichterHilbertAxiomGeometry/Topology.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @iter.skip_load()
  @metric.skip_load()
  @frag.skip_load()
  @prime.skip_load()
  @grouptheory.skip_load()
  @homology.skip_load()
  @readable.load()
  @determinants.load()
  @theory.begin_theory("RichterHilbertAxiomGeometry/Topology")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading RichterHilbertAxiomGeometry/Topology.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
