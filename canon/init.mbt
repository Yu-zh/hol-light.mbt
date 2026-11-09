// canon.ml: the load steps are generated (canon.mbt).

///|
fn init {
  @theory.begin_theory("canon")
  load_steps() catch {
    e => abort("HOL Light: loading canon.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
