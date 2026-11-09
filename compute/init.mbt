// compute.ml: the load steps are generated (compute.mbt).

///|
fn init {
  @theory.begin_theory("compute")
  load_steps() catch {
    e => abort("HOL Light: loading compute.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
