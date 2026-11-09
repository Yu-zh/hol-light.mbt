// Arithmetic/fol.ml: the load steps are generated (fol.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Arithmetic/fol.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @rstc.load()
  @prime.load()
  @theory.begin_theory("Arithmetic/fol")
  load_steps() catch {
    e => abort("HOL Light: loading Arithmetic/fol.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Arithmetic/fol.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Arithmetic/fol")
  load_steps() catch {
    e => abort("HOL Light: loading Arithmetic/fol.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
