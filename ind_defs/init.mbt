// ind_defs.ml: the load steps are generated (ind_defs.mbt).

///|
fn init {
  @theory.begin_theory("ind_defs")
  load_steps() catch {
    e => abort("HOL Light: loading ind_defs.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
