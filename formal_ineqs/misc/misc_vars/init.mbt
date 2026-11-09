// Formal_ineqs/misc/misc_vars.ml: the load steps are generated (misc_vars.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/misc/misc_vars.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @misc_functions.load()
  @theory.begin_theory("Formal_ineqs/misc/misc_vars")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/misc/misc_vars.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/misc/misc_vars.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Formal_ineqs/misc/misc_vars")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/misc/misc_vars.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
