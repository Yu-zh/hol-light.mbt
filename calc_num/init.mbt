// calc_num.ml: the load steps are generated (calc_num.mbt).

///|
fn init {
  @theory.begin_theory("calc_num")
  load_steps() catch {
    e => abort("HOL Light: loading calc_num.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
