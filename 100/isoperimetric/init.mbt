// 100/isoperimetric.ml: the load steps are generated (isoperimetric.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/isoperimetric.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @cauchy.load()
  @lpspaces.load()
  @green.load()
  @theory.begin_theory("100/isoperimetric")
  load_steps() catch {
    e =>
      abort("HOL Light: loading 100/isoperimetric.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
