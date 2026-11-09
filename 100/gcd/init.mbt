// 100/gcd.ml: the load steps are generated (gcd.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/gcd.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @prime.load()
  @theory.begin_theory("100/gcd")
  load_steps() catch {
    e => abort("HOL Light: loading 100/gcd.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
