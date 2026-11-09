// Multivariate/cauchy.ml: the load steps are generated (cauchy.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/cauchy.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @moretop.load()
  @binomial.load()
  @iter.load()
  @moretop.load()
  @theory.begin_theory("Multivariate/cauchy")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Multivariate/cauchy.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
