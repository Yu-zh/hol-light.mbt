// Rqe/rqe_main.ml: the load steps are generated (rqe_main.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/rqe_main.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @pdivides.load()
  @theory.begin_theory("Rqe/rqe_main")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/rqe_main.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Rqe/rqe_main.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Rqe/rqe_main")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/rqe_main.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
