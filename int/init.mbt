// int.ml: the load steps are generated (int.mbt).

///|
fn init {
  @theory.begin_theory("int")
  load_steps() catch {
    e => abort("HOL Light: loading int.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
