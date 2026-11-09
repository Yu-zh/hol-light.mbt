// Examples/lagrange_lemma.ml: the load steps are generated (lagrange_lemma.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/lagrange_lemma.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Examples/lagrange_lemma")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Examples/lagrange_lemma.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
