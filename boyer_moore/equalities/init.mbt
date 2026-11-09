// Boyer_Moore/equalities.ml: the load steps are generated (equalities.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Boyer_Moore/equalities.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @terms_and_clauses.load()
  @theory.begin_theory("Boyer_Moore/equalities")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Boyer_Moore/equalities.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Boyer_Moore/equalities.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Boyer_Moore/equalities")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Boyer_Moore/equalities.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
