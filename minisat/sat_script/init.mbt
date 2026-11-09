// Minisat/sat_script.ml: the load steps are generated (sat_script.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Minisat/sat_script.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @sat_solvers.load()
  @theory.begin_theory("Minisat/sat_script")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Minisat/sat_script.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Minisat/sat_script.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Minisat/sat_script")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Minisat/sat_script.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
