// Quaternions/qnormalizer.ml: the load steps are generated (qnormalizer.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Quaternions/qnormalizer.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @qcalc.load()
  @theory.begin_theory("Quaternions/qnormalizer")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Quaternions/qnormalizer.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Quaternions/qnormalizer.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Quaternions/qnormalizer")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Quaternions/qnormalizer.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
