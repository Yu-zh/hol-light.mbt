// Library/multiplicative.ml: the load steps are generated (multiplicative.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/multiplicative.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @products.load()
  @prime.load()
  @pocklington.load()
  @theory.begin_theory("Library/multiplicative")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Library/multiplicative.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
