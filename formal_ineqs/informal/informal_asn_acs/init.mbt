// Formal_ineqs/informal/informal_asn_acs.ml: the load steps are generated (informal_asn_acs.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/informal/informal_asn_acs.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @informal_atn.load()
  @informal_atn.load()
  @theory.begin_theory("Formal_ineqs/informal/informal_asn_acs")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/informal/informal_asn_acs.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/informal/informal_asn_acs.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @informal_atn.load()
  @theory.begin_theory("Formal_ineqs/informal/informal_asn_acs")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/informal/informal_asn_acs.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
