// Formal_ineqs/informal/informal_verifier.ml: the load steps are generated (informal_verifier.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/informal/informal_verifier.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @informal_taylor.load()
  @informal_taylor.load()
  @certificate.load()
  @verifier_options.load()
  @theory.begin_theory("Formal_ineqs/informal/informal_verifier")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/informal/informal_verifier.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/informal/informal_verifier.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @informal_taylor.load()
  @certificate.load()
  @verifier_options.load()
  @theory.begin_theory("Formal_ineqs/informal/informal_verifier")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/informal/informal_verifier.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
