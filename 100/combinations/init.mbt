// 100/combinations.ml: the load steps are generated (combinations.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/combinations.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @binomial.load()
  @theory.begin_theory("100/combinations")
  load_steps() catch {
    e =>
      abort("HOL Light: loading 100/combinations.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
