// Multivariate/lpspaces.ml: the load steps are generated (lpspaces.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/lpspaces.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @realanalysis.load()
  @realanalysis.load()
  @theory.begin_theory("Multivariate/lpspaces")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Multivariate/lpspaces.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
