// Formal_ineqs/lib/ssrfun.ml: the load steps are generated (ssrfun.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/lib/ssrfun.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @sections.load()
  @ssreflect.load()
  @sections.load()
  @theory.begin_theory("Formal_ineqs/lib/ssrfun")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/lib/ssrfun.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/lib/ssrfun.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @ssreflect.load()
  @sections.load()
  @theory.begin_theory("Formal_ineqs/lib/ssrfun")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/lib/ssrfun.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
