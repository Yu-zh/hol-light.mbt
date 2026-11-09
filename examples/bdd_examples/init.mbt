// Examples/bdd_examples.ml: the load steps are generated (bdd_examples.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/bdd_examples.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @bdd.load()
  @theory.begin_theory("Examples/bdd_examples")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Examples/bdd_examples.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
