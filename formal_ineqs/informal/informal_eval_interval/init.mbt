// Formal_ineqs/informal/informal_eval_interval.ml: the load steps are generated (informal_eval_interval.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/informal/informal_eval_interval.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @informal_matan.load()
  @informal_exp.load()
  @informal_log.load()
  @informal_atn.load()
  @informal_asn_acs.load()
  @informal_sin_cos.load()
  @informal_matan.load()
  @theory.begin_theory("Formal_ineqs/informal/informal_eval_interval")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/informal/informal_eval_interval.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/informal/informal_eval_interval.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @informal_exp.load()
  @informal_log.load()
  @informal_atn.load()
  @informal_asn_acs.load()
  @informal_sin_cos.load()
  @informal_matan.load()
  @theory.begin_theory("Formal_ineqs/informal/informal_eval_interval")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/informal/informal_eval_interval.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
