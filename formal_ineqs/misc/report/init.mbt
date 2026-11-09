// Formal_ineqs/misc/report.ml: the load steps are generated (report.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/misc/report.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @m_taylor.load()
  @theory.begin_theory("Formal_ineqs/misc/report")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/misc/report.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/misc/report.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Formal_ineqs/misc/report")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/misc/report.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
