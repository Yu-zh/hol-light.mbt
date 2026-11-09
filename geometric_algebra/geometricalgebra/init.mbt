// Geometric_Algebra/geometricalgebra.ml: the load steps are generated (geometricalgebra.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Geometric_Algebra/geometricalgebra.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @clifford.load()
  @theory.begin_theory("Geometric_Algebra/geometricalgebra")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Geometric_Algebra/geometricalgebra.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Geometric_Algebra/geometricalgebra.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @clifford.load()
  @theory.begin_theory("Geometric_Algebra/geometricalgebra")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Geometric_Algebra/geometricalgebra.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
