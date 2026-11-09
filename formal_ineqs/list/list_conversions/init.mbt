// Formal_ineqs/list/list_conversions.ml: the load steps are generated (list_conversions.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/list/list_conversions.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @eval_interval.load()
  @arith_nat.load()
  @misc_vars.load()
  @theory.begin_theory("Formal_ineqs/list/list_conversions")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/list/list_conversions.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/list/list_conversions.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @arith_nat.load()
  @misc_vars.load()
  @theory.begin_theory("Formal_ineqs/list/list_conversions")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/list/list_conversions.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
