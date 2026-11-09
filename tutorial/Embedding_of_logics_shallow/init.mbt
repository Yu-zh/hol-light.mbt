// Tutorial/Embedding_of_logics_shallow.ml: the load steps are generated (Embedding_of_logics_shallow.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Tutorial/Embedding_of_logics_shallow.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Tutorial/Embedding_of_logics_shallow")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Tutorial/Embedding_of_logics_shallow.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
