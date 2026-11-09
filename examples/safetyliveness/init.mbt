// Examples/safetyliveness.ml: the load steps are generated (safetyliveness.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/safetyliveness.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Examples/safetyliveness")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Examples/safetyliveness.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
