// Arithmetic/definability.ml: the load steps are generated (definability.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Arithmetic/definability.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @fol.load()
  @theory.begin_theory("Arithmetic/definability")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Arithmetic/definability.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Arithmetic/definability.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Arithmetic/definability")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Arithmetic/definability.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
