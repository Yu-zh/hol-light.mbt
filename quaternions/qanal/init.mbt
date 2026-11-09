// Quaternions/qanal.ml: the load steps are generated (qanal.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Quaternions/qanal.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @qnormalizer.load()
  @theory.begin_theory("Quaternions/qanal")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Quaternions/qanal.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Quaternions/qanal.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Quaternions/qanal")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Quaternions/qanal.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
