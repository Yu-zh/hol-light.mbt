// Jordan/tactics_fix.ml: the load steps are generated (tactics_fix.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Jordan/tactics_fix.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @lib_ext.load()
  @theory.begin_theory("Jordan/tactics_fix")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Jordan/tactics_fix.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Jordan/tactics_fix.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Jordan/tactics_fix")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Jordan/tactics_fix.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
