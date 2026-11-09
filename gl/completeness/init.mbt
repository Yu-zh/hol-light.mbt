// GL/completeness.ml: the load steps are generated (completeness.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load GL/completeness.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @gl.load()
  @theory.begin_theory("GL/completeness")
  load_steps() catch {
    e => abort("HOL Light: loading GL/completeness.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load GL/completeness.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("GL/completeness")
  load_steps() catch {
    e => abort("HOL Light: loading GL/completeness.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
