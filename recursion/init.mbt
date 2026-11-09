// recursion.ml: the load steps are generated (recursion.mbt).

///|
fn init {
  @theory.begin_theory("recursion")
  load_steps() catch {
    e => abort("HOL Light: loading recursion.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
