// Library/word_automata.ml: the load steps are generated (word_automata.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/word_automata.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @rstc.load()
  @words.load()
  @theory.begin_theory("Library/word_automata")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Library/word_automata.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
