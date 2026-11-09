// 100/friendship.ml: the load steps are generated (friendship.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/friendship.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @prime.load()
  @pocklington.load()
  @theory.begin_theory("100/friendship")
  load_steps() catch {
    e => abort("HOL Light: loading 100/friendship.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
