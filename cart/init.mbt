// cart.ml: the load steps are generated (cart.mbt).

///|
fn init {
  @theory.begin_theory("cart")
  load_steps() catch {
    e => abort("HOL Light: loading cart.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
