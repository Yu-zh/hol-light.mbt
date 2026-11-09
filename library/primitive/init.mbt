// Library/primitive.ml: the load steps are generated (primitive.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/primitive.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @integer.load()
  @isum.load()
  @binomial.load()
  @pocklington.load()
  @multiplicative.load()
  @theory.begin_theory("Library/primitive")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Library/primitive.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
