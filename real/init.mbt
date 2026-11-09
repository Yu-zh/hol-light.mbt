// real.ml: the load steps are generated (real.mbt).

///|
fn init {
  @theory.begin_theory("real")
  load_steps() catch {
    e => abort("HOL Light: loading real.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
