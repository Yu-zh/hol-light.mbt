// 100/ratcountable.ml: the load steps are generated (ratcountable.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/ratcountable.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @card.load()
  @theory.begin_theory("100/ratcountable")
  load_steps() catch {
    e =>
      abort("HOL Light: loading 100/ratcountable.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
