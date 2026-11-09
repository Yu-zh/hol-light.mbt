// EC/edmont.ml: the load steps are generated (edmont.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load EC/edmont.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @edwards.load()
  @montgomery.load()
  @theory.begin_theory("EC/edmont")
  load_steps() catch {
    e => abort("HOL Light: loading EC/edmont.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
