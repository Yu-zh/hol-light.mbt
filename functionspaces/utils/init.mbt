// Functionspaces/utils.ml: the load steps are generated (utils.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Functionspaces/utils.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @realanalysis.load()
  @q.load()
  @q.load()
  @theory.begin_theory("Functionspaces/utils")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Functionspaces/utils.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Functionspaces/utils.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @q.load()
  @theory.begin_theory("Functionspaces/utils")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Functionspaces/utils.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
