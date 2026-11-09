// Examples/bitblast_generic.ml: the load steps are generated (bitblast_generic.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/bitblast_generic.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @word_automata.load()
  @theory.begin_theory("Examples/bitblast_generic")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Examples/bitblast_generic.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
