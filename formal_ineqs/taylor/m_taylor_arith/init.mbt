// Formal_ineqs/taylor/m_taylor_arith.ml: the load steps are generated (m_taylor_arith.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/taylor/m_taylor_arith.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @m_verifier.load()
  @m_taylor.load()
  @misc_vars.load()
  @theory.begin_theory("Formal_ineqs/taylor/m_taylor_arith")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/taylor/m_taylor_arith.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/taylor/m_taylor_arith.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @m_taylor.load()
  @misc_vars.load()
  @theory.begin_theory("Formal_ineqs/taylor/m_taylor_arith")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/taylor/m_taylor_arith.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
