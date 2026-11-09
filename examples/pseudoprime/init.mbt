// Examples/pseudoprime.ml: the load steps are generated (pseudoprime.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/pseudoprime.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @jacobi.load()
  @miller_rabin.load()
  @theory.begin_theory("Examples/pseudoprime")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Examples/pseudoprime.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
