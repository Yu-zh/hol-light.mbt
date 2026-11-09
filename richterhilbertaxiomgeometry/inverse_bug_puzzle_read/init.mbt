// RichterHilbertAxiomGeometry/inverse_bug_puzzle_read.ml: the load steps are generated (inverse_bug_puzzle_read.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load RichterHilbertAxiomGeometry/inverse_bug_puzzle_read.ml (once), after the files it needs.
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
  @determinants.load()
  @readable.load()
  @theory.begin_theory("RichterHilbertAxiomGeometry/inverse_bug_puzzle_read")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading RichterHilbertAxiomGeometry/inverse_bug_puzzle_read.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
