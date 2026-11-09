// GL/k4lr.ml: the load steps are generated (k4lr.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load GL/k4lr.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @completeness.load()
  @theory.begin_theory("GL/k4lr")
  load_steps() catch {
    e => abort("HOL Light: loading GL/k4lr.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load GL/k4lr.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("GL/k4lr")
  load_steps() catch {
    e => abort("HOL Light: loading GL/k4lr.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
