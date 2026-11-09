// Examples/bitblast.ml: the load steps are generated (bitblast.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/bitblast.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @words.load()
  @theory.begin_theory("Examples/bitblast")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Examples/bitblast.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
