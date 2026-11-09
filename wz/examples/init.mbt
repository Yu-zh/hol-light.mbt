// WZ/examples.ml: the load steps are generated (examples.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load WZ/examples.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @maxima.load()
  @maxima.load()
  @theory.begin_theory("WZ/examples")
  load_steps() catch {
    e => abort("HOL Light: loading WZ/examples.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load WZ/examples.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @maxima.load()
  @theory.begin_theory("WZ/examples")
  load_steps() catch {
    e => abort("HOL Light: loading WZ/examples.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
