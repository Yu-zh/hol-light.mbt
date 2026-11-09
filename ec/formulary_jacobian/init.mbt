// EC/formulary_jacobian.ml: the load steps are generated (formulary_jacobian.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load EC/formulary_jacobian.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @jacobian.load()
  @theory.begin_theory("EC/formulary_jacobian")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading EC/formulary_jacobian.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
