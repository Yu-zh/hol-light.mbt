// Formal_ineqs/trig/atn_eval.ml: the load steps are generated (atn_eval.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/trig/atn_eval.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @atn.load()
  @atn.load()
  @poly_eval.load()
  @theory.begin_theory("Formal_ineqs/trig/atn_eval")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/trig/atn_eval.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/trig/atn_eval.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @atn.load()
  @poly_eval.load()
  @theory.begin_theory("Formal_ineqs/trig/atn_eval")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/trig/atn_eval.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
