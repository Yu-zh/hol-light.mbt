// Rqe/inferpsign.ml: the load steps are generated (inferpsign.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/inferpsign.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @signs.load()
  @theory.begin_theory("Rqe/inferpsign")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/inferpsign.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Rqe/inferpsign.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Rqe/inferpsign")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/inferpsign.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
