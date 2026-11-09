// Examples/prover9.ml: the load steps are generated (prover9.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/prover9.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Examples/prover9")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Examples/prover9.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
