// Unity/mk_ensures.ml: the load steps are generated (mk_ensures.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Unity/mk_ensures.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @mk_unless.load()
  @theory.begin_theory("Unity/mk_ensures")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Unity/mk_ensures.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Unity/mk_ensures.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Unity/mk_ensures")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Unity/mk_ensures.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
