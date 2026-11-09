// Boyer_Moore/shells.ml: the load steps are generated (shells.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Boyer_Moore/shells.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @struct_equal.load()
  @theory.begin_theory("Boyer_Moore/shells")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Boyer_Moore/shells.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Boyer_Moore/shells.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Boyer_Moore/shells")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Boyer_Moore/shells.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
