// Quaternions/quaternion.ml: the load steps are generated (quaternion.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Quaternions/quaternion.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @quaternions_misc.load()
  @theory.begin_theory("Quaternions/quaternion")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Quaternions/quaternion.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Quaternions/quaternion.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Quaternions/quaternion")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Quaternions/quaternion.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
