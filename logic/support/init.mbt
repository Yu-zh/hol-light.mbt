// Logic/support.ml: the load steps are generated (support.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Logic/support.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @linear.load()
  @theory.begin_theory("Logic/support")
  load_steps() catch {
    e => abort("HOL Light: loading Logic/support.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Logic/support.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Logic/support")
  load_steps() catch {
    e => abort("HOL Light: loading Logic/support.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
