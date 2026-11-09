// Formal_ineqs/informal/informal_taylor.ml: the load steps are generated (informal_taylor.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/informal/informal_taylor.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @informal_eval_interval.load()
  @misc_functions.load()
  @informal_eval_interval.load()
  @theory.begin_theory("Formal_ineqs/informal/informal_taylor")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/informal/informal_taylor.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/informal/informal_taylor.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @misc_functions.load()
  @informal_eval_interval.load()
  @theory.begin_theory("Formal_ineqs/informal/informal_taylor")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/informal/informal_taylor.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
