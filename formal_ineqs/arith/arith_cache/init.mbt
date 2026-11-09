// Formal_ineqs/arith/arith_cache.ml: the load steps are generated (arith_cache.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/arith/arith_cache.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @arith_num.load()
  @arith_options.load()
  @arith_num.load()
  @theory.begin_theory("Formal_ineqs/arith/arith_cache")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/arith/arith_cache.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/arith/arith_cache.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @arith_options.load()
  @arith_num.load()
  @theory.begin_theory("Formal_ineqs/arith/arith_cache")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/arith/arith_cache.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
