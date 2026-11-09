// theorems.ml: the load steps are generated (theorems.mbt); the
// DESTRUCT_TAC/FIX_TAC/INTRO_TAC/HYP_TAC block is ported by hand
// (destruct.mbt).

///|
fn init {
  @theory.begin_theory("theorems")
  load_steps() catch {
    e => abort("HOL Light: loading theorems.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
