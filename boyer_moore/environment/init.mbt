// Boyer_Moore/environment.ml: the load steps are generated (environment.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Boyer_Moore/environment.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @shells.load()
  @theory.begin_theory("Boyer_Moore/environment")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Boyer_Moore/environment.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Boyer_Moore/environment.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Boyer_Moore/environment")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Boyer_Moore/environment.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
