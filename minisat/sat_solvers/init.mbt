// Minisat/sat_solvers.ml: the load steps are generated (sat_solvers.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Minisat/sat_solvers.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @dimacs_tools.load()
  @theory.begin_theory("Minisat/sat_solvers")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Minisat/sat_solvers.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Minisat/sat_solvers.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Minisat/sat_solvers")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Minisat/sat_solvers.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
