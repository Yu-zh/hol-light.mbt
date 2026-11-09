// 100/derangements.ml: the load steps are generated (derangements.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/derangements.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @transc.load()
  @calc_real.load()
  @floor.load()
  @theory.begin_theory("100/derangements")
  load_steps() catch {
    e =>
      abort("HOL Light: loading 100/derangements.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
