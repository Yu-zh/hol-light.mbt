// Functionspaces/L2.ml: the load steps are generated (L2.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Functionspaces/L2.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @cfunspace.load()
  @cfunspace.load()
  @theory.begin_theory("Functionspaces/L2")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Functionspaces/L2.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Functionspaces/L2.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @cfunspace.load()
  @theory.begin_theory("Functionspaces/L2")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Functionspaces/L2.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
