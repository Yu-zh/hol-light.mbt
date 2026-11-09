// lists.ml: the load steps are generated (lists.mbt).

///|
fn init {
  @theory.begin_theory("lists")
  load_steps() catch {
    e => abort("HOL Light: loading lists.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
