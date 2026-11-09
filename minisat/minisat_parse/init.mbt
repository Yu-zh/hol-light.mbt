// Minisat/minisat_parse.ml: the load steps are generated (minisat_parse.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Minisat/minisat_parse.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @sat_tools.load()
  @theory.begin_theory("Minisat/minisat_parse")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Minisat/minisat_parse.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Minisat/minisat_parse.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Minisat/minisat_parse")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Minisat/minisat_parse.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
