// Rqe/list_rewrites.ml: the load steps are generated (list_rewrites.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/list_rewrites.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @rqe_real.load()
  @theory.begin_theory("Rqe/list_rewrites")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Rqe/list_rewrites.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Rqe/list_rewrites.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Rqe/list_rewrites")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Rqe/list_rewrites.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
