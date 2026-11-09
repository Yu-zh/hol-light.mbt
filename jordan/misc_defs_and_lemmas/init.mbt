// Jordan/misc_defs_and_lemmas.ml: the load steps are generated (misc_defs_and_lemmas.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Jordan/misc_defs_and_lemmas.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @tactics_ext2.load()
  @theory.begin_theory("Jordan/misc_defs_and_lemmas")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Jordan/misc_defs_and_lemmas.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Jordan/misc_defs_and_lemmas.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Jordan/misc_defs_and_lemmas")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Jordan/misc_defs_and_lemmas.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
