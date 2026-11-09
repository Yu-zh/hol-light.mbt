// GL/misc.ml: the load steps are generated (misc.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load GL/misc.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @card.load()
  @rstc.load()
  @theory.begin_theory("GL/misc")
  load_steps() catch {
    e => abort("HOL Light: loading GL/misc.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load GL/misc.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("GL/misc")
  load_steps() catch {
    e => abort("HOL Light: loading GL/misc.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
