// 100/cubedissection.ml: the load steps are generated (cubedissection.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/cubedissection.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @integration.load()
  @theory.begin_theory("100/cubedissection")
  load_steps() catch {
    e =>
      abort("HOL Light: loading 100/cubedissection.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
