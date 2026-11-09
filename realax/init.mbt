// realax.ml: the load steps are generated (realax.mbt).

///|
fn init {
  @theory.begin_theory("realax")
  load_steps() catch {
    e => abort("HOL Light: loading realax.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
