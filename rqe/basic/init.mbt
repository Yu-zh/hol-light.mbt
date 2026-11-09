// Rqe/basic.ml: the load steps are generated (basic.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/basic.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @rewrites.load()
  @theory.begin_theory("Rqe/basic")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/basic.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Rqe/basic.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Rqe/basic")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/basic.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
