// Library/components.ml: the load steps are generated (components.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/components.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Library/components")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Library/components.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
