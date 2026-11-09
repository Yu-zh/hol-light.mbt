// Tutorial/Real_analysis.ml: the load steps are generated (Real_analysis.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Tutorial/Real_analysis.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @analysis.load()
  @transc.load()
  @theory.begin_theory("Tutorial/Real_analysis")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Tutorial/Real_analysis.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
