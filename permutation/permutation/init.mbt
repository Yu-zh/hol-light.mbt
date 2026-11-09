// Permutation/permutation.ml: the load steps are generated (permutation.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Permutation/permutation.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @permuted.load()
  @permuted.load()
  @theory.begin_theory("Permutation/permutation")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Permutation/permutation.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Permutation/permutation.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @permuted.load()
  @theory.begin_theory("Permutation/permutation")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Permutation/permutation.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
