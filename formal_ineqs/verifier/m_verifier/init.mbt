// Formal_ineqs/verifier/m_verifier.ml: the load steps are generated (m_verifier.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/verifier/m_verifier.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @m_verifier_build.load()
  @m_taylor.load()
  @certificate.load()
  @misc_vars.load()
  @verifier_options.load()
  @m_verifier_build.load()
  @theory.begin_theory("Formal_ineqs/verifier/m_verifier")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/verifier/m_verifier.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/verifier/m_verifier.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @m_taylor.load()
  @certificate.load()
  @misc_vars.load()
  @verifier_options.load()
  @m_verifier_build.load()
  @theory.begin_theory("Formal_ineqs/verifier/m_verifier")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/verifier/m_verifier.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
