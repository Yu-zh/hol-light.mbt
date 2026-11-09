// Library/wo.ml: the load steps are generated (wo.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/wo.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Library/wo")
  load_steps() catch {
    e => abort("HOL Light: loading Library/wo.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
