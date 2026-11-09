// realarith.ml: the load steps are generated (realarith.mbt).

///|
fn init {
  @theory.begin_theory("realarith")
  load_steps() catch {
    e => abort("HOL Light: loading realarith.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
