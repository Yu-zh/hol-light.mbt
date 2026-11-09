// Formal_ineqs/arith/eval_interval.ml: the load steps are generated (eval_interval.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/arith/eval_interval.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @matan_eval.load()
  @float_pow.load()
  @more_float.load()
  @exp_eval.load()
  @log_eval.load()
  @atn_eval.load()
  @asn_acs_eval.load()
  @cos_eval.load()
  @sin_eval.load()
  @matan_eval.load()
  @misc_functions.load()
  @misc_vars.load()
  @theory.begin_theory("Formal_ineqs/arith/eval_interval")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/arith/eval_interval.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/arith/eval_interval.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @float_pow.load()
  @more_float.load()
  @exp_eval.load()
  @log_eval.load()
  @atn_eval.load()
  @asn_acs_eval.load()
  @cos_eval.load()
  @sin_eval.load()
  @matan_eval.load()
  @misc_functions.load()
  @misc_vars.load()
  @theory.begin_theory("Formal_ineqs/arith/eval_interval")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/arith/eval_interval.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
