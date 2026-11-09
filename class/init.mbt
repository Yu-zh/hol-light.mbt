// class.ml: the load steps are generated (class.mbt).

///|
fn init {
  @theory.begin_theory("class")
  load_steps() catch {
    e => abort("HOL Light: loading class.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
