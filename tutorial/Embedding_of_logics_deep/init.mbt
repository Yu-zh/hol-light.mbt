// Tutorial/Embedding_of_logics_deep.ml: the load steps are generated (Embedding_of_logics_deep.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Tutorial/Embedding_of_logics_deep.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Tutorial/Embedding_of_logics_deep")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Tutorial/Embedding_of_logics_deep.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
