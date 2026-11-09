// calc_rat.ml: the load steps are generated (calc_rat.mbt).

///|
fn init {
  @theory.begin_theory("calc_rat")
  load_steps() catch {
    e => abort("HOL Light: loading calc_rat.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
