// Formal_ineqs/verifier/m_verifier_build.ml: the load steps are generated (m_verifier_build.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/verifier/m_verifier_build.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @informal_verifier.load()
  @eval_interval.load()
  @more_float.load()
  @m_taylor.load()
  @informal_verifier.load()
  @verifier_options.load()
  @misc_vars.load()
  @theory.begin_theory("Formal_ineqs/verifier/m_verifier_build")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/verifier/m_verifier_build.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/verifier/m_verifier_build.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @eval_interval.load()
  @more_float.load()
  @m_taylor.load()
  @informal_verifier.load()
  @verifier_options.load()
  @misc_vars.load()
  @theory.begin_theory("Formal_ineqs/verifier/m_verifier_build")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/verifier/m_verifier_build.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
