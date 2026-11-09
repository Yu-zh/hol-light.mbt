// Boyer_Moore/waterfall.ml: the load steps are generated (waterfall.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Boyer_Moore/waterfall.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @clausal_form.load()
  @theory.begin_theory("Boyer_Moore/waterfall")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Boyer_Moore/waterfall.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Boyer_Moore/waterfall.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Boyer_Moore/waterfall")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Boyer_Moore/waterfall.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
