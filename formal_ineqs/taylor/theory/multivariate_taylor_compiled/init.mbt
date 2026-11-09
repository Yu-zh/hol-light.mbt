// Formal_ineqs/taylor/theory/multivariate_taylor-compiled.ml: the load steps are generated (multivariate_taylor_compiled.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/taylor/theory/multivariate_taylor-compiled.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @taylor_interval_compiled.load()
  @ssrbool.load()
  @ssrnat.load()
  @taylor_interval_compiled.load()
  @theory.begin_theory(
    "Formal_ineqs/taylor/theory/multivariate_taylor-compiled",
  )
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/taylor/theory/multivariate_taylor-compiled.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/taylor/theory/multivariate_taylor-compiled.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @ssrbool.load()
  @ssrnat.load()
  @taylor_interval_compiled.load()
  @theory.begin_theory(
    "Formal_ineqs/taylor/theory/multivariate_taylor-compiled",
  )
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/taylor/theory/multivariate_taylor-compiled.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
