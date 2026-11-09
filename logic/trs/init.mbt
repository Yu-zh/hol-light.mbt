// Logic/trs.ml: the load steps are generated (trs.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Logic/trs.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @birkhoff.load()
  @theory.begin_theory("Logic/trs")
  load_steps() catch {
    e => abort("HOL Light: loading Logic/trs.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Logic/trs.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Logic/trs")
  load_steps() catch {
    e => abort("HOL Light: loading Logic/trs.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
