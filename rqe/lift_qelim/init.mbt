// Rqe/lift_qelim.ml: the load steps are generated (lift_qelim.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/lift_qelim.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @simplify.load()
  @theory.begin_theory("Rqe/lift_qelim")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/lift_qelim.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Rqe/lift_qelim.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Rqe/lift_qelim")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/lift_qelim.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
