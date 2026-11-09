// 100/four_squares.ml: the load steps are generated (four_squares.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/four_squares.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @prime.load()
  @analysis.load()
  @theory.begin_theory("100/four_squares")
  load_steps() catch {
    e =>
      abort("HOL Light: loading 100/four_squares.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
