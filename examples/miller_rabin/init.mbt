// Examples/miller_rabin.ml: the load steps are generated (miller_rabin.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/miller_rabin.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @primitive.load()
  @theory.begin_theory("Examples/miller_rabin")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Examples/miller_rabin.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
