// 100/arithmetic_geometric_mean.ml: the load steps are generated (arithmetic_geometric_mean.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/arithmetic_geometric_mean.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @products.load()
  @transc.load()
  @theory.begin_theory("100/arithmetic_geometric_mean")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading 100/arithmetic_geometric_mean.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
