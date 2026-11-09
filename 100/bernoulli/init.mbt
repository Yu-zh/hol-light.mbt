// 100/bernoulli.ml: the load steps are generated (bernoulli.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/bernoulli.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @binomial.load()
  @analysis.load()
  @transc.load()
  @theory.begin_theory("100/bernoulli")
  load_steps() catch {
    e => abort("HOL Light: loading 100/bernoulli.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
