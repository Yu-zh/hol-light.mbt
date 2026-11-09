// Examples/harmonicsum.ml: the load steps are generated (harmonicsum.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/harmonicsum.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @prime.load()
  @products.load()
  @floor.load()
  @theory.begin_theory("Examples/harmonicsum")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Examples/harmonicsum.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
