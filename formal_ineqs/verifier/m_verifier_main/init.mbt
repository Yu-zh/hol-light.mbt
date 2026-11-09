// Formal_ineqs/verifier/m_verifier_main.ml: the load steps are generated (m_verifier_main.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/verifier/m_verifier_main.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @informal_search.load()
  @m_verifier.load()
  @m_verifier_build.load()
  @m_taylor_arith2.load()
  @misc_vars.load()
  @certificate.load()
  @informal_search.load()
  @informal_verifier.load()
  @theory.begin_theory("Formal_ineqs/verifier/m_verifier_main")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/verifier/m_verifier_main.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/verifier/m_verifier_main.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @m_verifier.load()
  @m_verifier_build.load()
  @m_taylor_arith2.load()
  @misc_vars.load()
  @certificate.load()
  @informal_search.load()
  @informal_verifier.load()
  @theory.begin_theory("Formal_ineqs/verifier/m_verifier_main")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/verifier/m_verifier_main.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
