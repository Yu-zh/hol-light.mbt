// Permutation/nummax.ml: the load steps are generated (nummax.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Permutation/nummax.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @morelist.load()
  @theory.begin_theory("Permutation/nummax")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Permutation/nummax.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
