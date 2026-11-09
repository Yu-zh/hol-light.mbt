// EC/formulary_xzprojective.ml: the load steps are generated (formulary_xzprojective.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load EC/formulary_xzprojective.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @xzprojective.load()
  @theory.begin_theory("EC/formulary_xzprojective")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading EC/formulary_xzprojective.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
