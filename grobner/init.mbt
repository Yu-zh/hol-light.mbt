// grobner.ml: the load steps are generated (grobner.mbt).

///|
fn init {
  @theory.begin_theory("grobner")
  load_steps() catch {
    e => abort("HOL Light: loading grobner.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
