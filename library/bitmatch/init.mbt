// Library/bitmatch.ml: the load steps are generated (bitmatch.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/bitmatch.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @words.load()
  @theory.begin_theory("Library/bitmatch")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Library/bitmatch.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
