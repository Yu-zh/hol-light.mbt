// Formal_ineqs/verifier/certificate.ml: the load steps are generated (certificate.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/verifier/certificate.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @report.load()
  @report.load()
  @theory.begin_theory("Formal_ineqs/verifier/certificate")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/verifier/certificate.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/verifier/certificate.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @report.load()
  @theory.begin_theory("Formal_ineqs/verifier/certificate")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/verifier/certificate.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
