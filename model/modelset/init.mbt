// Model/modelset.ml: the load steps are generated (modelset.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Model/modelset.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @syntax.load()
  @theory.begin_theory("Model/modelset")
  load_steps() catch {
    e => abort("HOL Light: loading Model/modelset.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Model/modelset.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Model/modelset")
  load_steps() catch {
    e => abort("HOL Light: loading Model/modelset.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
