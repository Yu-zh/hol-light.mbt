// Formal_ineqs/taylor/m_taylor_arith2.ml: the load steps are generated (m_taylor_arith2.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/taylor/m_taylor_arith2.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @m_taylor_arith.load()
  @m_taylor_arith.load()
  @theory.begin_theory("Formal_ineqs/taylor/m_taylor_arith2")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/taylor/m_taylor_arith2.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/taylor/m_taylor_arith2.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @m_taylor_arith.load()
  @theory.begin_theory("Formal_ineqs/taylor/m_taylor_arith2")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/taylor/m_taylor_arith2.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
