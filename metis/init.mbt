// metis.ml: the load steps are generated (metis.mbt).

///|
fn init {
  @theory.begin_theory("metis")
  load_steps() catch {
    e => abort("HOL Light: loading metis.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
