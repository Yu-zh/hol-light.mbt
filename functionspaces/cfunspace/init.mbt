// Functionspaces/cfunspace.ml: the load steps are generated (cfunspace.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Functionspaces/cfunspace.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @utils.load()
  @utils.load()
  @theory.begin_theory("Functionspaces/cfunspace")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Functionspaces/cfunspace.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Functionspaces/cfunspace.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @utils.load()
  @theory.begin_theory("Functionspaces/cfunspace")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Functionspaces/cfunspace.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
