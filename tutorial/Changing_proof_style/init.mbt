// Tutorial/Changing_proof_style.ml: the load steps are generated (Changing_proof_style.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Tutorial/Changing_proof_style.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Tutorial/Changing_proof_style")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Tutorial/Changing_proof_style.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
