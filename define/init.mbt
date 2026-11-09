// define.ml: the load steps are generated (define.mbt).

///|
fn init {
  @theory.begin_theory("define")
  load_steps() catch {
    e => abort("HOL Light: loading define.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
