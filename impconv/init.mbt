// impconv.ml: the load steps are generated (impconv.mbt).

///|
fn init {
  @theory.begin_theory("impconv")
  load_steps() catch {
    e => abort("HOL Light: loading impconv.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
