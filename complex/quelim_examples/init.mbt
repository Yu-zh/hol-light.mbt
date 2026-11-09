// Complex/quelim_examples.ml: the load steps are generated (quelim_examples.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Complex/quelim_examples.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @complex_real.load()
  @theory.begin_theory("Complex/quelim_examples")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Complex/quelim_examples.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Complex/quelim_examples.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Complex/quelim_examples")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Complex/quelim_examples.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
