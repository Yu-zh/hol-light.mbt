// Library/fieldtheory.ml: the load steps are generated (fieldtheory.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/fieldtheory.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @matroids.load()
  @ringtheory.load()
  @theory.begin_theory("Library/fieldtheory")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Library/fieldtheory.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
