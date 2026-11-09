// Probability/clt.ml: the load steps are generated (clt.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Probability/clt.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @characteristic_functions.load()
  @characteristic_functions.load()
  @theory.begin_theory("Probability/clt")
  load_steps() catch {
    e => abort("HOL Light: loading Probability/clt.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Probability/clt.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @characteristic_functions.load()
  @theory.begin_theory("Probability/clt")
  load_steps() catch {
    e => abort("HOL Light: loading Probability/clt.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
