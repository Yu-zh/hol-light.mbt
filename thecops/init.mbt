// thecops.ml: the load steps are generated (thecops.mbt).

///|
fn init {
  @theory.begin_theory("thecops")
  load_steps() catch {
    e => abort("HOL Light: loading thecops.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
