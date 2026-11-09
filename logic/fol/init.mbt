// Logic/fol.ml: the load steps are generated (fol.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Logic/fol.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @analysis.load()
  @wo.load()
  @rstc.load()
  @reduct.load()
  @multiwf.load()
  @theory.begin_theory("Logic/fol")
  load_steps() catch {
    e => abort("HOL Light: loading Logic/fol.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Logic/fol.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Logic/fol")
  load_steps() catch {
    e => abort("HOL Light: loading Logic/fol.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
