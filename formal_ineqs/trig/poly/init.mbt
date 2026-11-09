// Formal_ineqs/trig/poly.ml: the load steps are generated (poly.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/trig/poly.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @more_list.load()
  @more_list.load()
  @interval_arith.load()
  @theory.begin_theory("Formal_ineqs/trig/poly")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/trig/poly.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/trig/poly.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @more_list.load()
  @interval_arith.load()
  @theory.begin_theory("Formal_ineqs/trig/poly")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/trig/poly.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
