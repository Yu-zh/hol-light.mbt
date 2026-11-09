// IEEE/ieee.ml: the load steps are generated (ieee.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load IEEE/ieee.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @float_thms.load()
  @theory.begin_theory("IEEE/ieee")
  load_steps() catch {
    e => abort("HOL Light: loading IEEE/ieee.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load IEEE/ieee.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("IEEE/ieee")
  load_steps() catch {
    e => abort("HOL Light: loading IEEE/ieee.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
