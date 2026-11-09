// Complex/quelim.ml: the load steps are generated (quelim.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Complex/quelim.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @fundamental.load()
  @fundamental.load()
  @theory.begin_theory("Complex/quelim")
  load_steps() catch {
    e => abort("HOL Light: loading Complex/quelim.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Complex/quelim.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @fundamental.load()
  @theory.begin_theory("Complex/quelim")
  load_steps() catch {
    e => abort("HOL Light: loading Complex/quelim.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
