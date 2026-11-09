// Rqe/defs.ml: the load steps are generated (defs.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/defs.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @lift_qelim.load()
  @theory.begin_theory("Rqe/defs")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/defs.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Rqe/defs.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Rqe/defs")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/defs.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
