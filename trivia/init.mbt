// trivia.ml: the load steps are generated (trivia.mbt).

///|
fn init {
  @theory.begin_theory("trivia")
  load_steps() catch {
    e => abort("HOL Light: loading trivia.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
