// sets.ml: the load steps are generated (sets.mbt).

///|
fn init {
  @theory.begin_theory("sets")
  load_steps() catch {
    e => abort("HOL Light: loading sets.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
