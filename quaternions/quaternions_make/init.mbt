// Quaternions/make.ml: the load steps are generated (quaternions_make.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Quaternions/make.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @derivatives.load()
  @complexes.load()
  @quaternions_misc.load()
  @quaternion.load()
  @qcalc.load()
  @qnormalizer.load()
  @qanal.load()
  @qderivative.load()
  @qisom.load()
  @theory.begin_theory("Quaternions/make")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Quaternions/make.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
