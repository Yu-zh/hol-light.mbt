// normalizer.ml: the load steps are generated (normalizer.mbt).

///|
fn init {
  @theory.begin_theory("normalizer")
  load_steps() catch {
    e => abort("HOL Light: loading normalizer.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
