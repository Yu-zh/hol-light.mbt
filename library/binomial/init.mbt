// Library/binomial.ml: the load steps are generated (binomial.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/binomial.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Library/binomial")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Library/binomial.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
