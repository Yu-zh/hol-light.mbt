// Cadical/ldrup.ml: the load steps are generated (ldrup.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Cadical/ldrup.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @cnf.load()
  @theory.begin_theory("Cadical/ldrup")
  load_steps() catch {
    e => abort("HOL Light: loading Cadical/ldrup.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Cadical/ldrup.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Cadical/ldrup")
  load_steps() catch {
    e => abort("HOL Light: loading Cadical/ldrup.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
