// Logic/unif.ml: the load steps are generated (unif.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Logic/unif.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @fole.load()
  @theory.begin_theory("Logic/unif")
  load_steps() catch {
    e => abort("HOL Light: loading Logic/unif.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Logic/unif.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Logic/unif")
  load_steps() catch {
    e => abort("HOL Light: loading Logic/unif.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
