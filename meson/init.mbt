// meson.ml: the load steps are generated (meson.mbt).

///|
fn init {
  @theory.begin_theory("meson")
  load_steps() catch {
    e => abort("HOL Light: loading meson.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
