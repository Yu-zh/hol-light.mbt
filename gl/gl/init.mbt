// GL/gl.ml: the load steps are generated (gl.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load GL/gl.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @modal.load()
  @theory.begin_theory("GL/gl")
  load_steps() catch {
    e => abort("HOL Light: loading GL/gl.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load GL/gl.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("GL/gl")
  load_steps() catch {
    e => abort("HOL Light: loading GL/gl.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
