// Formal_ineqs/trig/sin_cos.ml: the load steps are generated (sin_cos.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/trig/sin_cos.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @asn_acs_eval.load()
  @theory.begin_theory("Formal_ineqs/trig/sin_cos")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/trig/sin_cos.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/trig/sin_cos.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Formal_ineqs/trig/sin_cos")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/trig/sin_cos.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
