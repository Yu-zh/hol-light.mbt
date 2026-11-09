// Formal_ineqs/arith/float_pow.ml: the load steps are generated (float_pow.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/arith/float_pow.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @more_float.load()
  @arith_float.load()
  @theory.begin_theory("Formal_ineqs/arith/float_pow")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/arith/float_pow.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/arith/float_pow.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @arith_float.load()
  @theory.begin_theory("Formal_ineqs/arith/float_pow")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/arith/float_pow.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
