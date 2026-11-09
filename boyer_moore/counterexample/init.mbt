// Boyer_Moore/counterexample.ml: the load steps are generated (counterexample.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Boyer_Moore/counterexample.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @induction.load()
  @theory.begin_theory("Boyer_Moore/counterexample")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Boyer_Moore/counterexample.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Boyer_Moore/counterexample.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Boyer_Moore/counterexample")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Boyer_Moore/counterexample.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
