// Boyer_Moore/irrelevance.ml: the load steps are generated (irrelevance.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Boyer_Moore/irrelevance.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @generalize.load()
  @theory.begin_theory("Boyer_Moore/irrelevance")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Boyer_Moore/irrelevance.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Boyer_Moore/irrelevance.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Boyer_Moore/irrelevance")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Boyer_Moore/irrelevance.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
