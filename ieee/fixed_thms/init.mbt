// IEEE/fixed_thms.ml: the load steps are generated (fixed_thms.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load IEEE/fixed_thms.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @fixed.load()
  @theory.begin_theory("IEEE/fixed_thms")
  load_steps() catch {
    e => abort("HOL Light: loading IEEE/fixed_thms.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load IEEE/fixed_thms.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("IEEE/fixed_thms")
  load_steps() catch {
    e => abort("HOL Light: loading IEEE/fixed_thms.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
