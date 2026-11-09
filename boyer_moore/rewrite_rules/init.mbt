// Boyer_Moore/rewrite_rules.ml: the load steps are generated (rewrite_rules.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Boyer_Moore/rewrite_rules.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @waterfall.load()
  @theory.begin_theory("Boyer_Moore/rewrite_rules")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Boyer_Moore/rewrite_rules.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Boyer_Moore/rewrite_rules.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Boyer_Moore/rewrite_rules")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Boyer_Moore/rewrite_rules.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
