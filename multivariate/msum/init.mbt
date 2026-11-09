// Multivariate/msum.ml: the load steps are generated (msum.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/msum.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @vectors.load()
  @vectors.load()
  @theory.begin_theory("Multivariate/msum")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Multivariate/msum.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
