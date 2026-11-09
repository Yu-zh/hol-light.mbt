// 100/realsuncountable.ml: the load steps are generated (realsuncountable.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/realsuncountable.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @card.load()
  @analysis.load()
  @theory.begin_theory("100/realsuncountable")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading 100/realsuncountable.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
