// Examples/schnirelmann.ml: the load steps are generated (schnirelmann.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/schnirelmann.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @misc.load()
  @products.load()
  @theory.begin_theory("Examples/schnirelmann")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Examples/schnirelmann.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
