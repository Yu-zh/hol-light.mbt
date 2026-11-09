// Boyer_Moore/induction.ml: the load steps are generated (induction.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Boyer_Moore/induction.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @equalities.load()
  @theory.begin_theory("Boyer_Moore/induction")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Boyer_Moore/induction.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Boyer_Moore/induction.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Boyer_Moore/induction")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Boyer_Moore/induction.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
