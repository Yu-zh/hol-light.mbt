// Arithmetic/derived.ml: the load steps are generated (derived.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Arithmetic/derived.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @godel.load()
  @theory.begin_theory("Arithmetic/derived")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Arithmetic/derived.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Arithmetic/derived.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Arithmetic/derived")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Arithmetic/derived.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
