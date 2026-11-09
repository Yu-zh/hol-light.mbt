// Library/symmetric_group.ml: the load steps are generated (symmetric_group.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/symmetric_group.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @permutations.load()
  @grouptheory.load()
  @theory.begin_theory("Library/symmetric_group")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Library/symmetric_group.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
