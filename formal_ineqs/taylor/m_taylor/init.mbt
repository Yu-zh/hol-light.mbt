// Formal_ineqs/taylor/m_taylor.ml: the load steps are generated (m_taylor.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/taylor/m_taylor.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @multivariate_taylor_compiled.load()
  @more_float.load()
  @eval_interval.load()
  @list_conversions.load()
  @list_float.load()
  @more_list.load()
  @misc_vars.load()
  @taylor_interval_compiled.load()
  @multivariate_taylor_compiled.load()
  @theory.begin_theory("Formal_ineqs/taylor/m_taylor")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/taylor/m_taylor.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/taylor/m_taylor.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @more_float.load()
  @eval_interval.load()
  @list_conversions.load()
  @list_float.load()
  @more_list.load()
  @misc_vars.load()
  @taylor_interval_compiled.load()
  @multivariate_taylor_compiled.load()
  @theory.begin_theory("Formal_ineqs/taylor/m_taylor")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/taylor/m_taylor.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
