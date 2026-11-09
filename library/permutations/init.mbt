// Library/permutations.ml: the load steps are generated (permutations.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/permutations.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Library/permutations")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Library/permutations.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
