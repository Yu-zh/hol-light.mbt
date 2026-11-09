// Formal_ineqs/arith/arith_num.ml: the load steps are generated (arith_num.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/arith/arith_num.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @misc_vars.load()
  @misc_functions.load()
  @misc_vars.load()
  @arith_options.load()
  @theory.begin_theory("Formal_ineqs/arith/arith_num")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/arith/arith_num.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/arith/arith_num.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @misc_functions.load()
  @misc_vars.load()
  @arith_options.load()
  @theory.begin_theory("Formal_ineqs/arith/arith_num")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/arith/arith_num.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
