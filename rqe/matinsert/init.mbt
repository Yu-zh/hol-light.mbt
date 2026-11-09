// Rqe/matinsert.ml: the load steps are generated (matinsert.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/matinsert.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @inferisign.load()
  @theory.begin_theory("Rqe/matinsert")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/matinsert.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Rqe/matinsert.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Rqe/matinsert")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/matinsert.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
