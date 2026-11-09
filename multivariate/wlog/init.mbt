// Multivariate/wlog.ml: the load steps are generated (wlog.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/wlog.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @convex.load()
  @determinants.load()
  @convex.load()
  @theory.begin_theory("Multivariate/wlog")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Multivariate/wlog.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
