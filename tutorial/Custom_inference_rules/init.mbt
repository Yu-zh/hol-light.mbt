// Tutorial/Custom_inference_rules.ml: the load steps are generated (Custom_inference_rules.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Tutorial/Custom_inference_rules.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Tutorial/Custom_inference_rules")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Tutorial/Custom_inference_rules.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
