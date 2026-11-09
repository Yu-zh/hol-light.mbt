// Arithmetic/godel.ml: the load steps are generated (godel.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Arithmetic/godel.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @arithprov.load()
  @theory.begin_theory("Arithmetic/godel")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Arithmetic/godel.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Arithmetic/godel.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Arithmetic/godel")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Arithmetic/godel.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
