// 100/chords.ml: the load steps are generated (chords.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/chords.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @convex.load()
  @theory.begin_theory("100/chords")
  load_steps() catch {
    e => abort("HOL Light: loading 100/chords.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
