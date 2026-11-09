// Formal_ineqs/informal/informal_search.ml: the load steps are generated (informal_search.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/informal/informal_search.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @m_taylor_arith2.load()
  @informal_taylor.load()
  @certificate.load()
  @verifier_options.load()
  @theory.begin_theory("Formal_ineqs/informal/informal_search")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/informal/informal_search.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/informal/informal_search.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @informal_taylor.load()
  @certificate.load()
  @verifier_options.load()
  @theory.begin_theory("Formal_ineqs/informal/informal_search")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/informal/informal_search.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
