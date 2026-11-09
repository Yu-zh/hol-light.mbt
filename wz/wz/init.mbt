// WZ/wz.ml: the load steps are generated (wz.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load WZ/wz.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @gamma.load()
  @theory.begin_theory("WZ/wz")
  load_steps() catch {
    e => abort("HOL Light: loading WZ/wz.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load WZ/wz.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @gamma.load()
  @theory.begin_theory("WZ/wz")
  load_steps() catch {
    e => abort("HOL Light: loading WZ/wz.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
