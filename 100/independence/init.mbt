// 100/independence.ml: the load steps are generated (independence.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/independence.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @cauchy.load()
  @tarski.load()
  @theory.begin_theory("100/independence")
  load_steps() catch {
    e =>
      abort("HOL Light: loading 100/independence.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
