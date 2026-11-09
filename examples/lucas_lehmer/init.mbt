// Examples/lucas_lehmer.ml: the load steps are generated (lucas_lehmer.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/lucas_lehmer.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @iter.load()
  @pocklington.load()
  @floor.load()
  @vectors.load()
  @sqrt.load()
  @theory.begin_theory("Examples/lucas_lehmer")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Examples/lucas_lehmer.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
