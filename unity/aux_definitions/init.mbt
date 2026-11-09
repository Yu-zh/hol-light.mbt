// Unity/aux_definitions.ml: the load steps are generated (aux_definitions.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Unity/aux_definitions.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @hol88.load()
  @theory.begin_theory("Unity/aux_definitions")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Unity/aux_definitions.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Unity/aux_definitions.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Unity/aux_definitions")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Unity/aux_definitions.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
