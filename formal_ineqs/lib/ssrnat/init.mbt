// Formal_ineqs/lib/ssrnat.ml: the load steps are generated (ssrnat.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/lib/ssrnat.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @ssrbool.load()
  @ssrbool.load()
  @theory.begin_theory("Formal_ineqs/lib/ssrnat")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/lib/ssrnat.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/lib/ssrnat.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @ssrbool.load()
  @theory.begin_theory("Formal_ineqs/lib/ssrnat")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/lib/ssrnat.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
