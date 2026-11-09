// Divstep/divstep.ml: the load steps are generated (divstep.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Divstep/divstep.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @iter.load()
  @integer.load()
  @floor.load()
  @iter.load()
  @integer.load()
  @theory.begin_theory("Divstep/divstep")
  load_steps() catch {
    e => abort("HOL Light: loading Divstep/divstep.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Divstep/divstep.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @iter.load()
  @integer.load()
  @theory.begin_theory("Divstep/divstep")
  load_steps() catch {
    e => abort("HOL Light: loading Divstep/divstep.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
