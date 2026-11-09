// quot.ml: the load steps are generated (quot.mbt).

///|
fn init {
  @theory.begin_theory("quot")
  load_steps() catch {
    e => abort("HOL Light: loading quot.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
