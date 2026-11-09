// WZ/maxima.ml: the load steps are generated (maxima.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load WZ/maxima.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @wz.load()
  @wz.load()
  @theory.begin_theory("WZ/maxima")
  load_steps() catch {
    e => abort("HOL Light: loading WZ/maxima.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load WZ/maxima.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @wz.load()
  @theory.begin_theory("WZ/maxima")
  load_steps() catch {
    e => abort("HOL Light: loading WZ/maxima.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
