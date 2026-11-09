// Library/ringtheory.ml: the load steps are generated (ringtheory.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/ringtheory.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @binomial.load()
  @pocklington.load()
  @card.load()
  @theory.begin_theory("Library/ringtheory")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Library/ringtheory.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
