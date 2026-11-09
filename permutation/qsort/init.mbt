// Permutation/qsort.ml: the load steps are generated (qsort.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Permutation/qsort.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @permutation.load()
  @permuted.load()
  @theory.begin_theory("Permutation/qsort")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Permutation/qsort.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Permutation/qsort.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @permuted.load()
  @theory.begin_theory("Permutation/qsort")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Permutation/qsort.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
