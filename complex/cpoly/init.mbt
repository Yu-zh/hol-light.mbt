// Complex/cpoly.ml: the load steps are generated (cpoly.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Complex/cpoly.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @complex_transc.load()
  @complexnumbers.load()
  @theory.begin_theory("Complex/cpoly")
  load_steps() catch {
    e => abort("HOL Light: loading Complex/cpoly.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Complex/cpoly.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @complexnumbers.load()
  @theory.begin_theory("Complex/cpoly")
  load_steps() catch {
    e => abort("HOL Light: loading Complex/cpoly.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
