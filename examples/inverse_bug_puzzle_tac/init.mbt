// Examples/inverse_bug_puzzle_tac.ml: the load steps are generated (inverse_bug_puzzle_tac.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/inverse_bug_puzzle_tac.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @determinants.load()
  @theory.begin_theory("Examples/inverse_bug_puzzle_tac")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Examples/inverse_bug_puzzle_tac.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
