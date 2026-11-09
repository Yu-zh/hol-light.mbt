// Formal_ineqs/trig/sin_eval.ml: the load steps are generated (sin_eval.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/trig/sin_eval.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @cos_eval.load()
  @misc_functions.load()
  @misc_vars.load()
  @interval_arith.load()
  @atn_eval.load()
  @cos_eval.load()
  @theory.begin_theory("Formal_ineqs/trig/sin_eval")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/trig/sin_eval.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/trig/sin_eval.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @misc_functions.load()
  @misc_vars.load()
  @interval_arith.load()
  @atn_eval.load()
  @cos_eval.load()
  @theory.begin_theory("Formal_ineqs/trig/sin_eval")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/trig/sin_eval.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
