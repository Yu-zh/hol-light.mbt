// Logic/canon.ml: the load steps are generated (logic_canon.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Logic/canon.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @fol_prop.load()
  @theory.begin_theory("Logic/canon")
  load_steps() catch {
    e => abort("HOL Light: loading Logic/canon.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Logic/canon.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Logic/canon")
  load_steps() catch {
    e => abort("HOL Light: loading Logic/canon.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
