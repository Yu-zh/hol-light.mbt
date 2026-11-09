// Boyer_Moore/clausal_form.ml: the load steps are generated (clausal_form.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Boyer_Moore/clausal_form.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @environment.load()
  @theory.begin_theory("Boyer_Moore/clausal_form")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Boyer_Moore/clausal_form.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Boyer_Moore/clausal_form.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Boyer_Moore/clausal_form")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Boyer_Moore/clausal_form.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
