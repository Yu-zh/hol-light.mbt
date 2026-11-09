// Library/pocklington.ml: the load steps are generated (pocklington.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/pocklington.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @iter.load()
  @prime.load()
  @theory.begin_theory("Library/pocklington")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Library/pocklington.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
