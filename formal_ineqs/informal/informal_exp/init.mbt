// Formal_ineqs/informal/informal_exp.ml: the load steps are generated (informal_exp.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/informal/informal_exp.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @informal_poly.load()
  @informal_interval.load()
  @informal_poly.load()
  @theory.begin_theory("Formal_ineqs/informal/informal_exp")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/informal/informal_exp.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/informal/informal_exp.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @informal_interval.load()
  @informal_poly.load()
  @theory.begin_theory("Formal_ineqs/informal/informal_exp")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/informal/informal_exp.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
