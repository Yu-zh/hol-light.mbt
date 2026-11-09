// Library/analysis.ml: the load steps are generated (analysis.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/analysis.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Library/analysis")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Library/analysis.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
