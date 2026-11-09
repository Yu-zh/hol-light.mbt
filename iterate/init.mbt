// iterate.ml: the load steps are generated (iterate.mbt).

///|
fn init {
  @theory.begin_theory("iterate")
  load_steps() catch {
    e => abort("HOL Light: loading iterate.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
