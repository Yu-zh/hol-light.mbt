// Formal_ineqs/trig/poly_eval.ml: the load steps are generated (poly_eval.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/trig/poly_eval.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @poly.load()
  @poly.load()
  @misc_functions.load()
  @misc_vars.load()
  @more_float.load()
  @theory.begin_theory("Formal_ineqs/trig/poly_eval")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/trig/poly_eval.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/trig/poly_eval.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @poly.load()
  @misc_functions.load()
  @misc_vars.load()
  @more_float.load()
  @theory.begin_theory("Formal_ineqs/trig/poly_eval")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/trig/poly_eval.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
