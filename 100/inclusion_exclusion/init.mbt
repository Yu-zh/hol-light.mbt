// 100/inclusion_exclusion.ml: the load steps are generated (inclusion_exclusion.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/inclusion_exclusion.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("100/inclusion_exclusion")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading 100/inclusion_exclusion.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
