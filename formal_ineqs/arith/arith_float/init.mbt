// Formal_ineqs/arith/arith_float.ml: the load steps are generated (arith_float.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/arith/arith_float.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @log.load()
  @arith_nat.load()
  @num_exp_theory.load()
  @float_theory.load()
  @interval_arith.load()
  @misc_vars.load()
  @log.load()
  @floor.load()
  @theory.begin_theory("Formal_ineqs/arith/arith_float")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/arith/arith_float.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/arith/arith_float.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @arith_nat.load()
  @num_exp_theory.load()
  @float_theory.load()
  @interval_arith.load()
  @misc_vars.load()
  @log.load()
  @floor.load()
  @theory.begin_theory("Formal_ineqs/arith/arith_float")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/arith/arith_float.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
