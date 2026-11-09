// EC/xzprojective.ml: the load steps are generated (xzprojective.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load EC/xzprojective.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @montgomery.load()
  @theory.begin_theory("EC/xzprojective")
  load_steps() catch {
    e => abort("HOL Light: loading EC/xzprojective.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
