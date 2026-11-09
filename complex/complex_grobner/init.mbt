// Complex/complex_grobner.ml: the load steps are generated (complex_grobner.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Complex/complex_grobner.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @quelim.load()
  @complexnumbers.load()
  @quelim.load()
  @theory.begin_theory("Complex/complex_grobner")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Complex/complex_grobner.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Complex/complex_grobner.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @complexnumbers.load()
  @quelim.load()
  @theory.begin_theory("Complex/complex_grobner")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Complex/complex_grobner.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
