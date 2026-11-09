// Formal_ineqs/informal/informal_atn.ml: the load steps are generated (informal_atn.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/informal/informal_atn.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @informal_log.load()
  @informal_interval.load()
  @informal_poly.load()
  @theory.begin_theory("Formal_ineqs/informal/informal_atn")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/informal/informal_atn.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/informal/informal_atn.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @informal_interval.load()
  @informal_poly.load()
  @theory.begin_theory("Formal_ineqs/informal/informal_atn")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/informal/informal_atn.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
