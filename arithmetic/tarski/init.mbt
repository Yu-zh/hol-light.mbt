// Arithmetic/tarski.ml: the load steps are generated (tarski.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Arithmetic/tarski.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @definability.load()
  @theory.begin_theory("Arithmetic/tarski")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Arithmetic/tarski.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Arithmetic/tarski.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Arithmetic/tarski")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Arithmetic/tarski.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
