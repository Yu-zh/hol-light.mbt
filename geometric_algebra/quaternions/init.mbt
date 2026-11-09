// Geometric_Algebra/quaternions.ml: the load steps are generated (quaternions.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Geometric_Algebra/quaternions.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @geometricalgebra.load()
  @geometricalgebra.load()
  @quaternions_make.load()
  @theory.begin_theory("Geometric_Algebra/quaternions")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Geometric_Algebra/quaternions.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Geometric_Algebra/quaternions.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @geometricalgebra.load()
  @quaternions_make.load()
  @theory.begin_theory("Geometric_Algebra/quaternions")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Geometric_Algebra/quaternions.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
