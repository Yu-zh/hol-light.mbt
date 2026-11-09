// Permutation/permuted.ml: the load steps are generated (permuted.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Permutation/permuted.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @morelist.load()
  @morelist.load()
  @theory.begin_theory("Permutation/permuted")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Permutation/permuted.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Permutation/permuted.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @morelist.load()
  @theory.begin_theory("Permutation/permuted")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Permutation/permuted.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
