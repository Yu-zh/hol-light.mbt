// pair.ml: the load steps are generated (pair.mbt).

///|
fn init {
  @theory.begin_theory("pair")
  load_steps() catch {
    e => abort("HOL Light: loading pair.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
