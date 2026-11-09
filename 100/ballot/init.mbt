// 100/ballot.ml: the load steps are generated (ballot.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/ballot.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @binomial.load()
  @theory.begin_theory("100/ballot")
  load_steps() catch {
    e => abort("HOL Light: loading 100/ballot.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
