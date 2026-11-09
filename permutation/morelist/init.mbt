// Permutation/morelist.ml: the load steps are generated (morelist.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Permutation/morelist.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Permutation/morelist")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Permutation/morelist.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Permutation/morelist.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Permutation/morelist")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Permutation/morelist.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
