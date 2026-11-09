// Divstep/divstep_bounds.ml: the load steps are generated (divstep_bounds.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Divstep/divstep_bounds.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @hull_light.load()
  @floor.load()
  @divstep.load()
  @idivstep.load()
  @hull_light.load()
  @theory.begin_theory("Divstep/divstep_bounds")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Divstep/divstep_bounds.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Divstep/divstep_bounds.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @floor.load()
  @divstep.load()
  @idivstep.load()
  @hull_light.load()
  @theory.begin_theory("Divstep/divstep_bounds")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Divstep/divstep_bounds.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
