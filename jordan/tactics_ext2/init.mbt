// Jordan/tactics_ext2.ml: the load steps are generated (tactics_ext2.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Jordan/tactics_ext2.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @float.load()
  @theory.begin_theory("Jordan/tactics_ext2")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Jordan/tactics_ext2.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Jordan/tactics_ext2.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Jordan/tactics_ext2")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Jordan/tactics_ext2.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
