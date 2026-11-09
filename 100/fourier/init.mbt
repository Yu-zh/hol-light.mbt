// 100/fourier.ml: the load steps are generated (fourier.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load 100/fourier.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @lpspaces.load()
  @theory.begin_theory("100/fourier")
  load_steps() catch {
    e => abort("HOL Light: loading 100/fourier.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
