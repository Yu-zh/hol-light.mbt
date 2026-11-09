// Jordan/float.ml: the load steps are generated (float.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Jordan/float.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @real_ext.load()
  @theory.begin_theory("Jordan/float")
  load_steps() catch {
    e => abort("HOL Light: loading Jordan/float.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Jordan/float.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Jordan/float")
  load_steps() catch {
    e => abort("HOL Light: loading Jordan/float.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
