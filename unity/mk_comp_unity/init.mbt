// Unity/mk_comp_unity.ml: the load steps are generated (mk_comp_unity.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Unity/mk_comp_unity.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @mk_leadsto.load()
  @theory.begin_theory("Unity/mk_comp_unity")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Unity/mk_comp_unity.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Unity/mk_comp_unity.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Unity/mk_comp_unity")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Unity/mk_comp_unity.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
