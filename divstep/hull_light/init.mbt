// Divstep/hull_light.ml: the load steps are generated (hull_light.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Divstep/hull_light.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @idivstep.load()
  @theory.begin_theory("Divstep/hull_light")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Divstep/hull_light.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Divstep/hull_light.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Divstep/hull_light")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Divstep/hull_light.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
