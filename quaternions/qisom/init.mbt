// Quaternions/qisom.ml: the load steps are generated (qisom.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Quaternions/qisom.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @qderivative.load()
  @cross.load()
  @theory.begin_theory("Quaternions/qisom")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Quaternions/qisom.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Quaternions/qisom.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @cross.load()
  @theory.begin_theory("Quaternions/qisom")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Quaternions/qisom.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
