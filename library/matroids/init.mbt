// Library/matroids.ml: the load steps are generated (matroids.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/matroids.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @card.load()
  @theory.begin_theory("Library/matroids")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Library/matroids.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
