// 100/cayley_hamilton.ml: the load steps are generated (cayley_hamilton.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/cayley_hamilton.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @complexes.load()
  @msum.load()
  @theory.begin_theory("100/cayley_hamilton")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading 100/cayley_hamilton.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
