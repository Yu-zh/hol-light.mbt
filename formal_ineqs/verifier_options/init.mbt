// Formal_ineqs/verifier_options.ml: the load steps are generated (verifier_options.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/verifier_options.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @certificate.load()
  @theory.begin_theory("Formal_ineqs/verifier_options")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/verifier_options.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/verifier_options.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Formal_ineqs/verifier_options")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/verifier_options.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
