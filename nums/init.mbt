// nums.ml: the load steps are generated (nums.mbt).

///|
fn init {
  @theory.begin_theory("nums")
  load_steps() catch {
    e => abort("HOL Light: loading nums.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
